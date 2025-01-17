
-- Copyright (C) 2016-2019 DBotThePony

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
-- of the Software, and to permit persons to whom the Software is furnished to do so,
-- subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all copies
-- or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
-- INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
-- PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
-- FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
-- OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-- DEALINGS IN THE SOFTWARE.


local KICK_NOT_RESPONDING = CreateConVar('sv_dconn_kick', '1', {FCVAR_NOTIFY, FCVAR_ARCHIVE}, 'Kick not responding clients')
local KICK_TIMEOUT = CreateConVar('sv_dconn_kick_time', '360', {FCVAR_NOTIFY, FCVAR_ARCHIVE}, 'Kick timeout in seconds')
local PREVENT_CONNECTION_SPAM = CreateConVar('sv_dconn_spam', '1', {FCVAR_NOTIFY, FCVAR_ARCHIVE}, 'Prevent connection spam')
local SPAM_TRIES = CreateConVar('sv_dconn_spamtries', '3', {FCVAR_NOTIFY, FCVAR_ARCHIVE}, 'Max connection tries before ban player')
local SPAM_DELAY = CreateConVar('sv_dconn_spamdelay', '60', {FCVAR_NOTIFY, FCVAR_ARCHIVE}, 'Connection spam delay in seconds')
local ECHO_CONNECTS = CreateConVar('sv_dconn_echo', '1', {FCVAR_NOTIFY, FCVAR_ARCHIVE}, 'Display a message when someone connects to the server')
local ECHO_JOINS = CreateConVar('sv_dconn_echo_join', '1', {FCVAR_NOTIFY, FCVAR_ARCHIVE}, 'Display a message when someone joins (enters the game)')
local ECHO_DISCONNECT = CreateConVar('sv_dconn_echo_disconnect', '1', {FCVAR_NOTIFY, FCVAR_ARCHIVE}, 'Display a message when someone disconnects from the server')

CreateConVar('sv_dconn_hoverdisplay', '1', {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED}, 'Display players nicks on hovering')
CreateConVar('sv_dconn_drawtime', '1', {FCVAR_REPLICATED, FCVAR_ARCHIVE}, 'Draw time played on server')

net.pool('DConnecttt.PlayerTick')

DConn = DConn or {}
DLib.MessageMaker(DConn, 'DConnecttt')
DLib.chat.generate('DConnecttt', DConn)

local LINK = DMySQL3.Connect('dconnecttt')
function DConn.Query(q, callback)
	return LINK:Query(q, callback, callback)
end

-- Listen for advanced disconnect event
gameevent.Listen('player_connect')
gameevent.Listen('player_disconnect')

local TEXT_COLOR = Color(221, 186, 80)
local function Message(...)
	DConn.LChatAll(...)
	DConn.LMessage(...)
end

local function shouldEcho(serverSetting, playerSetting, playerOverride)
	if playerOverride then
		return playerSetting
	end

	return serverSetting and playerSetting
end

local function MessageCONN(...)
	for i, ply in ipairs(player.GetHumans()) do
		if shouldEcho(ECHO_CONNECTS:GetBool(), ply:GetInfoBool('cl_dconn_echo'), ply:GetInfoBool('cl_dconn_echo_force')) then
			DConn.LChatPlayer(ply, ...)
		end
	end

	DConn.LMessage(...)
end

local function MessageJOIN(...)
	for i, ply in ipairs(player.GetHumans()) do
		if shouldEcho(ECHO_JOINS:GetBool(), ply:GetInfoBool('cl_dconn_echo_join'), ply:GetInfoBool('cl_dconn_echo_force')) then
			DConn.LChatPlayer(ply, ...)
		end
	end

	DConn.LMessage(...)
end

local function MessageDISC(...)
	for i, ply in ipairs(player.GetHumans()) do
		if shouldEcho(ECHO_DISCONNECT:GetBool(), ply:GetInfoBool('cl_dconn_echo_disconnect'), ply:GetInfoBool('cl_dconn_echo_force')) then
			DConn.LChatPlayer(ply, ...)
		end
	end

	DConn.LMessage(...)
end

local PendingDisconnects = {}

function DConn.SavePlayerData(ply)
	if ply:IsBot() then return end
	local steamid64 = ply:SteamID64()
	local nick = ply:Nick()
	local realnick = nick

	local ip = string.Explode(':', ply:IPAddress())[1]

	if ply.SteamName then
		realnick = ply:SteamName()
	end

	DConn.Query(
		string.format(
			'UPDATE dconnecttt SET lastname = %q, steamname = %q, lastip = %q, lastseen = %q, totaltime = %q WHERE steamid64 = %q',
			nick,
			realnick,
			ip,
			os.time(),
			ply.DConnecttt_Total or 0,
			steamid64
		)
	)
end

local CurTimeL = CurTimeL

local function PlayerAuthed(ply, steamid)
	local steamid64 = ply:SteamID64()
	local nick = ply:Nick()
	local realnick = nick

	local ip = string.Explode(':', ply:IPAddress())[1]

	if ply.SteamName then
		realnick = ply:SteamName()
	end

	DConn.LMessage(team.GetColor(ply:Team()), realnick, TEXT_COLOR, '<' .. steamid .. '>', 'message.dconn.player.authed')

	-- Give player time to initialize
	timer.Simple(0, function()
		if not IsValid(ply) then return end

		if ply:GetNWFloat('DConnecttt.JoinTime', -1) == -1 then
			ply:SetNWFloat('DConnecttt.JoinTime', CurTimeL())
		end

		DConn.Query('SELECT * FROM dconnecttt WHERE steamid64 = "' .. steamid64 .. '";', function(data)
			if not IsValid(ply) then return end

			if not data[1] then
				MessageJOIN(team.GetColor(ply:Team()), nick, TEXT_COLOR, '<' .. steamid .. '>', 'message.dconn.connected.first')

				DConn.Query(
					string.format(
						'INSERT INTO dconnecttt (steamid64, steamid, lastname, steamname, lastip, lastseen, firstseen, totaltime) VALUES (%q, %q, %q, %q, %q, %q, %q, %q)',
						steamid64,
						steamid,
						nick,
						realnick,
						ip,
						os.time(),
						os.time(),
						0
					)
				)
			else
				local db_steamid = data[1].steamid
				local db_steamid64 = data[1].steamid64
				local lastname = data[1].lastname
				local steamname = data[1].steamname
				local lastip = data[1].lastip
				local lastseen = data[1].lastseen
				local firstseen = data[1].firstseen
				local totaltime = data[1].totaltime

				ply.DConnecttt_Session = 0
				ply.DConnecttt_Total = tonumber(totaltime)

				ply:SetNWFloat('DConnecttt_Total_OnJoin', ply.DConnecttt_Total)

				local PrintNick = nick

				if steamname ~= realnick then
					PrintNick = PrintNick .. string.format(' (known as %s)', steamname)
				end

				MessageJOIN(team.GetColor(ply:Team()), PrintNick, TEXT_COLOR, '<' .. steamid .. '>', 'message.dconn.connected.join')
				MessageJOIN(team.GetColor(ply:Team()), PrintNick, TEXT_COLOR, '<' .. steamid .. '>', 'message.dconn.connected.lastseen', DLib.string.qdate(lastseen))

				DConn.SavePlayerData(ply)
			end

			ply.DCONNECT_INITIALIZE = true
		end)
	end)
end

local IPBuffer = {}

local function player_connect(data)
	local steamid = data.networkid
	local nick = data.name
	local ip = data.address

	if data.bot == 1 or ip == 'loopback' then
		return
	end

	local realip = string.Explode(':', ip)[1]

	DConn.Query('SELECT * FROM dconnecttt WHERE steamid64 = "' .. util.SteamIDTo64(steamid) .. '";', function(data)
		if not data[1] then
			MessageCONN('message.dconn.player.connected', nick .. '<' .. steamid .. '>')
			return
		end

		local db_steamid = data[1].steamid
		local db_steamid64 = data[1].steamid64
		local lastname = data[1].lastname
		local steamname = data[1].steamname

		local PrintNick = nick

		if steamname ~= nick then
			PrintNick = PrintNick .. string.format(' (known as %s)', steamname)
		end

		MessageCONN('message.dconn.player.connected', PrintNick .. '<' .. steamid .. '>')
	end)
end

local function CheckPassword(steamid64, ip, svpass, clpass, nick)
	if ip == 'loopback' or ip == 'bot' then return end

	local realip = string.Explode(':', ip)[1]

	IPBuffer[realip] = IPBuffer[realip] or {0, RealTimeL()}
	local pdata = IPBuffer[realip]
	pdata[1] = pdata[2] + SPAM_DELAY:GetInt() >= RealTimeL() and (pdata[1] + 1) or 0

	if PREVENT_CONNECTION_SPAM:GetBool() and pdata[1] > SPAM_TRIES:GetInt() then
		DConn.LMessage('message.dconn.kick.spam', nick .. '<' .. util.SteamIDFrom64(steamid64) .. '>')
		return false, '[DConnecttt] Spam connecting. Please wait some time and then try to reconnect again.'
	end
end

local function player_disconnect(data)
	local name = data.name
	local realname = data.name
	local steamid = data.networkid
	local userid = tonumber(data.userid)
	local isBot = data.bot
	local reason = data.reason

	if string.find(reason, 'timed out') then
		reason = 'message.dconn.disconnected.crash'
	end

	local ply = player.GetBySteamID(steamid)

	if not ply then
		MessageDISC(name, '<' .. steamid .. '> ', 'message.dconn.disconnected.disconnected', ' (', reason, ')')
		return
	end

	-- data.name always shows real player nick
	name = ply:Nick()

	DConn.SavePlayerData(ply)

	if ply.SteamName and ply:SteamName() ~= name then -- DarkRP
		name = name .. ' (' .. ply:SteamName() .. ')'
	end

	MessageDISC(team.GetColor(ply:Team()), name, TEXT_COLOR, '<' .. steamid .. '>', 'message.dconn.disconnected.disconnected', ' (', reason, ')')
end

function DConn.FakeDisconnect(ply, reason)
	reason = reason or 'Disconnect by user.'

	if string.find(reason, 'timed out') then
		reason = 'message.dconn.disconnected.crash'
	end

	local name = ply:Nick()
	local steamid = ply:SteamID()

	if ply.SteamName and ply:SteamName() ~= name then -- DarkRP
		name = name .. ' (' .. ply:SteamName() .. ')'
	end

	MessageDISC(team.GetColor(ply:Team()), name, TEXT_COLOR, '<' .. steamid .. '>', 'message.dconn.disconnected.disconnected', ' (', reason, ')')
end

local function Timer()
	if game.SinglePlayer() then return end
	local KICK_NOT_RESPONDING = KICK_NOT_RESPONDING:GetBool()

	for k, ply in pairs(player.GetAll()) do
		if ply.DCONNECT_INITIALIZE then
			ply.DConnecttt_Session = (ply.DConnecttt_Session or 0) + 1
			ply.DConnecttt_Total = (ply.DConnecttt_Total or 0) + 1
			ply.DConnecttt_LastTick = ply.DConnecttt_LastTick or CurTimeL()

			if ply:IsBot() then
				ply.DConnecttt_LastTick = CurTimeL()
			end

			local deadTime = CurTimeL() - ply.DConnecttt_LastTick
			ply:SetNWBool('DConnecttt_Dead', deadTime > 5)

			if KICK_NOT_RESPONDING and ply.DConnecttt_LastTick + KICK_TIMEOUT:GetFloat() < CurTimeL() then
				ply.DConnecttt_Kicked = true
				ply:Kick(DLib.i18n.localizePlayer(ply, 'message.dconn.disconnected.noreply'))
			end
		end
	end
end

local function SaveTimer()
	for k, ply in pairs(player.GetAll()) do
		if ply.DCONNECT_INITIALIZE then
			xpcall(DConn.SavePlayerData, print, ply)
		end
	end
end

local function PlayerTick(len, ply)
	ply.DConnecttt_LastTick = CurTimeL()
	ply.DConnecttt_LastPos = ply:GetPos()
	ply.DConnecttt_LastAng = ply:EyeAngles()
	ply.DConnecttt_Beat = true

	net.Start('DConnecttt.PlayerTick')
	net.Send(ply)

	if ply:GetNWFloat('DConnecttt.FastInit', 0) == 0 then
		ply:SetNWFloat('DConnecttt.FastInit', CurTimeL())
	end
end

local plyMeta = FindMetaTable('Player')

--[[
for k, v in pairs(player.GetAll()) do
	PlayerAuthed(v, v:SteamID())
end
]]

hook.Add('StartCommand', 'DConnecttt.PreventMove', function(ply, cmd)
	if ply:IsBot() then return end
	if not ply.DConnecttt_LastTick then return end
	if CurTimeL() - ply.DConnecttt_LastTick < 5 then return end
	if game.SinglePlayer() then return end

	if ply.DConnecttt_Beat then
		if not ply:InVehicle() then
			ply:SetPos(ply.DConnecttt_LastPos)
			ply:SetEyeAngles(ply.DConnecttt_LastAng)
		end

		ply.DConnecttt_Beat = false
	end

	cmd:SetButtons(0)
	cmd:SetMouseX(0)
	cmd:SetMouseY(0)
end)

timer.Create('DConnecttt.Timer', 1, 0, Timer)
timer.Create('DConnecttt.SaveTimer', 60, 0, SaveTimer)
net.Receive('DConnecttt.PlayerTick', PlayerTick)
hook.Add('player_connect', 'DConnecttt', player_connect)
hook.Add('player_disconnect', 'DConnecttt', player_disconnect)
hook.Add('CheckPassword', 'DConnecttt', CheckPassword)
hook.Add('PlayerAuthed', 'DConnecttt', PlayerAuthed)

DConn.Query([[
	CREATE TABLE IF NOT EXISTS dconnecttt (
		steamid64 VARCHAR(64) not null,
		steamid VARCHAR(32),
		lastname VARCHAR(64),
		steamname VARCHAR(64),
		lastip VARCHAR(32),
		lastseen INT,
		firstseen INT,
		totaltime INT,
		PRIMARY KEY (steamid64)
	);
]])
