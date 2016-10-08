
--[[
Copyright (C) 2016 DBot

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
]]

if not DMySQL3 then include('autorun/server/dmysql3.lua') end

local LINK = DMySQL3.Connect('dscoreboard')

util.AddNetworkString('DScoreBoard2.ServerMemory')
util.AddNetworkString('DScoreBoard2.ServerTime')
util.AddNetworkString('DScoreBoard2.Flags')
util.AddNetworkString('DScoreBoard2.ChatPrint')
util.AddNetworkString('DScoreBoard2.Connect')
util.AddNetworkString('DScoreBoard2.Disconnect')

gameevent.Listen('player_disconnect')

timer.Create('DScoreBoard2.ServerMemory', 1, 0, function()
	net.Start('DScoreBoard2.ServerMemory')
	net.WriteUInt(math.floor(collectgarbage('count') / 1024), 12)
	net.Broadcast()
end)

timer.Create('DScoreBoard2.ServerTime', 1, 0, function()
	net.Start('DScoreBoard2.ServerTime')
	net.WriteUInt(os.time(), 32)
	net.Broadcast()
end)

local function ChatPrint(ply, ...)
	if isentity(ply) and not IsValid(ply) then MsgC(...) MsgC('\n') return end
	net.Start('DScoreBoard2.ChatPrint')
	net.WriteTable({...})
	net.Send(ply)
end

local function SavePly(ply)
	LINK:Begin(true) --Dead lock on MySQL for SOME FUCKING UNRESONABLE REASON
	--GOD I HATE YOU
	
	local steamid = ply:SteamID64()
	
	for k, v in ipairs(ply.DSCOREBOARD_RATE) do
		LINK:Add(string.format('UPDATE dscoreboard2_rate SET val = %q WHERE rate = %q AND ply = %q', v, k, steamid))
	end
	
	LINK:Commit()
end

local function SetRate(ply, id, value)
	ply.DSCOREBOARD_RATE[id] = value
	ply:SetNWInt('DScoreBoard2.Rating' .. id, value)
end

local function GetRate(ply, id)
	return ply.DSCOREBOARD_RATE[id]
end

local function AddRate(ply, id)
	return SetRate(ply, id, GetRate(ply, id) + 1)
end

local function PlayerAuthed(ply)
	local steamid64 = ply:SteamID64()
	
	ply.DSCOREBOARD_RATE = {}
	
	LINK:Query(string.format('SELECT rate, val FROM dscoreboard2_rate WHERE ply = %q', steamid64), function(data)
		for k, row in ipairs(data) do
			ply.DSCOREBOARD_RATE[tonumber(row.rate)] = tonumber(row.val)
		end
		
		LINK:Begin(true)
		
		for i = 1, #DScoreBoard2Ratings.Ratings do
			if ply.DSCOREBOARD_RATE[i] then continue end
			ply.DSCOREBOARD_RATE[i] = 0
			LINK:Add(string.format('INSERT INTO dscoreboard2_rate (ply, rate, val) VALUES (%q, %q, %q)', steamid64, i, 0))
		end
		
		LINK:Commit()
		
		for k, v in ipairs(ply.DSCOREBOARD_RATE) do
			ply:SetNWInt('DScoreBoard2.Rating' .. k, v)
		end
	end)
end

local function BroadcastFlags()
	local plys = player.GetAll()
	local count = #plys
	
	net.Start('DScoreBoard2.Flags')
	
	net.WriteUInt(count, 12)
	
	for k, v in ipairs(plys) do
		net.WriteEntity(v)
		net.WriteString(v.DSCOREBOARD_FLAG or 'Unknown')
	end
	
	net.Broadcast()
end

--Network failures
timer.Create('DScoreBoard2.Flags', 180, 0, BroadcastFlags)

net.Receive('DScoreBoard2.Flags', function(len, ply)
	ply.DSCOREBOARD_FLAG = net.ReadString()
	BroadcastFlags()
end)

local ChatColor = Color(200, 200, 200)

local COOLDOWN = CreateConVar('dscoreboard_rate_cooldown', '180', FCVAR_ARCHIVE, 'Rating cooldown in seconds')

local function RatePlayer(ply, cmd, args)
	if not IsValid(ply) then return end
	local target = tonumber(args[1])
	if not target then return end
	target = Player(target)
	if not IsValid(target) then return end
	
	local rating = tonumber(args[2])
	if not rating then return end
	if not DScoreBoard2Ratings.Ratings[rating] then return end
	
	if target == ply then
		ChatPrint(ply, ChatColor, 'You can not rate yourself.')
		return
	end
	
	if not target.DSCOREBOARD_RATE then PlayerAuthed(target) return end
	
	local i1 = target:UserID()
	
	ply.DSCOREBOARD_RATE_COOLDOWN = ply.DSCOREBOARD_RATE_COOLDOWN or {}
	ply.DSCOREBOARD_RATE_COOLDOWN[i1] = ply.DSCOREBOARD_RATE_COOLDOWN[i1] or 0
	
	local ctime = CurTime()
	if ply.DSCOREBOARD_RATE_COOLDOWN[i1] > ctime then
		ChatPrint(ply, ChatColor, 'You must wait ' .. math.floor(ply.DSCOREBOARD_RATE_COOLDOWN[i1] - ctime) .. ' seconds before rating this player again.')
		return
	end
	
	ply.DSCOREBOARD_RATE_COOLDOWN[i1] = ctime + COOLDOWN:GetInt()
	
	ChatPrint(ply, team.GetColor(ply:Team()), 'You', ChatColor,' gave rating ' .. DScoreBoard2Ratings.Names[rating] .. ' to ', team.GetColor(target:Team()), target:Nick())
	ChatPrint(target, team.GetColor(ply:Team()), ply:Nick(), ChatColor,' gave rating ' .. DScoreBoard2Ratings.Names[rating] .. ' to ', team.GetColor(target:Team()), 'You')
	
	AddRate(target, rating)
	SavePly(target)
end

concommand.Add('dscoreboard_rate', RatePlayer)

local Connect

local function PlayerConnect(nick, ip)
	if not Connect then return end
	if Connect.frame ~= CurTime() then Connect = nil return end
	
	net.Start('DScoreBoard2.Connect')
	net.WriteString(Connect.steamid)
	net.WriteString(Connect.nick)
	net.Broadcast()
end

local function player_disconnect(data)
	local name = data.name
	local steamid = data.networkid
	local userid = tonumber(data.userid)
	local isBot = data.bot
	local reason = data.reason
	
	local ply = player.GetBySteamID(steamid)
	
	if not ply then
		net.Start('DScoreBoard2.Disconnect')
		net.WriteString(steamid)
		net.WriteString(name)
		net.WriteString('Unknown')
		net.Broadcast()
	else
		net.Start('DScoreBoard2.Disconnect')
		net.WriteString(steamid)
		net.WriteString(name)
		net.WriteString(ply.DSCOREBOARD_FLAG or 'Unknown')
		net.Broadcast()
	end
end

local function CheckPassword(steamid64, ip, svpass, clpass, nick)
	local realip = string.Explode(':', ip)[1]
	local steamid = util.SteamIDFrom64(steamid64)
	
	Connect = {
		ip = ip,
		steamid64 = steamid64,
		nick = nick,
		frame = CurTime(),
		steamid = steamid,
	}
end

for k, v in ipairs(player.GetAll()) do
	PlayerAuthed(v)
end

hook.Add('PlayerAuthed', 'DSCOREBOARD_RATE', PlayerAuthed)
hook.Add('player_disconnect', 'DScoreBoard2.Hooks', player_disconnect)
hook.Add('PlayerConnect', 'DScoreBoard2.Hooks', PlayerConnect)
hook.Add('CheckPassword', 'DScoreBoard2.Hooks', CheckPassword)

LINK:Query([[
	CREATE TABLE IF NOT EXISTS dscoreboard2_rate
	(
		ply VARCHAR(26) NOT NULL,
		rate INT NOT NULL,
		val INT NOT NULL,
		PRIMARY KEY (ply, rate)
	)
]])
