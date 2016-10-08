
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

local ENABLE = CreateConVar('sv_dsit_enable', '1', {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, 'Enable')
local ALLOW_WEAPONS = CreateConVar('sv_dsit_allow_weapons', '1', {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, 'Allow weapons in seat')
local MAX_DISTANCE = CreateConVar('sv_dsit_distance', '128', {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, 'Max distance (in Hammer Units)')
local ALLOW_ON_PLAYERS = CreateConVar('sv_dsit_players', '1', {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, 'Allow to sit on players (heads)')
local ALLOW_ON_PLAYERS_LEGS = CreateConVar('sv_dsit_players_legs', '1', {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, 'Allow to sit on players (legs/sit on sitting players)')
local PREVENT_EXPLOIT = CreateConVar('sv_dsit_wallcheck', '1', {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, 'Check whatever player go through wall or not')
local FUNNY_SIT = CreateConVar('sv_dsit_allow_ceiling', '1', {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, 'Allow players to sit on ceiling')
local NO_SURF_ADMINS = CreateConVar('sv_dsit_nosurf_admins', '0', {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, 'Anti surf enable for admins')
local NO_SURF = CreateConVar('sv_dsit_nosurf', '1', {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, 'Anti surf when players are sitting on entities')
local SHOULD_PARENT = CreateConVar('sv_dsit_parent', '0', {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, 'Should vehicles be parented to players. If enabled, unexpected things may happen')
local HULL_CHECKS = CreateConVar('sv_dsit_hull', '1', {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, 'Make hull checks')
local FORCE_FLAT = CreateConVar('sv_dsit_flat', '0', {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, 'Force players sit angle "pitch" to be zero')
local ALLOW_ANY = CreateConVar('sv_dsit_anyangle', '0', {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, 'Letting players have fun')
local DISABLE_PHYSGUN = CreateConVar('sv_dsit_disablephysgun', '0', {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, 'Disable physgun usage in seat')

--If you want to know:
--This code was written a long time ago by me, and for me it looks slightly shitty.

DSit = DSit or {}

--Taken from DLib

util.AddNetworkString('DSit.ChatMessage')

function DSit.Copy(var)
	if type(var) == 'table' then return table.Copy(var) end
	if type(var) == 'Angle' then return Angle(var.p, var.y, var.r) end
	if type(var) == 'Vector' then return Vector(var.x, var.y, var.z) end
	return var
end

do
	local EntMem = {}

	local function DoSearch(ent)
		if not IsValid(ent) then return end
		if EntMem[ent] then return end
		local all = constraint.GetTable(ent)
		
		EntMem[ent] = true
		
		for k = 1, #all do
			local ent1, ent2 = all[k].Ent1, all[k].Ent2
			
			DoSearch(ent1)
			DoSearch(ent2)
		end
	end

	function DSit.GetAllConnectedEntities(ent)
		EntMem = {}
		
		DoSearch(ent)
		
		local result = {}
		
		for k, v in pairs(EntMem) do
			table.insert(result, k)
		end
		
		return result
	end
end

function DSit.AddPText(ply, ...)
	net.Start 'DSit.ChatMessage'
	net.WriteTable({...})
	net.Send(ply)
end

function DSit.AddText(...)
	net.Start 'DSit.ChatMessage'
	net.WriteTable({...})
	net.Broadcast()
end

local RecalculateConstrained
local TRANSLUCENT = Color(0, 0, 0, 0)

function DSit.CreateVehicle(pos, ang, owner)
	local ent = ents.Create('prop_vehicle_prisoner_pod')
	
	ent:SetModel('models/nova/airboat_seat.mdl')
	ent:SetKeyValue('vehiclescript', 'scripts/vehicles/prisoner_pod.txt')
	ent:SetKeyValue('limitview', '0')
	ent:SetPos(pos)
	ent:SetAngles(ang)
	
	ent:Spawn()
	ent:Activate()
	
	if owner and ent.CPPISetOwner then
		ent:CPPISetOwner(owner)
	end
	
	ent.IsSittingVehicle = true
	
	ent:SetMoveType(MOVETYPE_NONE)
	ent:SetCollisionGroup(COLLISION_GROUP_WORLD)
	
	ent:SetNotSolid(true)
	
	local phys = ent:GetPhysicsObject()
	
	if IsValid(phys) then
		phys:Sleep()	
		phys:EnableGravity(false)
		phys:EnableMotion(false)
		phys:EnableCollisions(false)
		phys:SetMass(1)
	end
	
	ent:DrawShadow(false)
	ent:SetColor(TRANSLUCENT)
	ent:SetRenderMode(RENDERMODE_TRANSALPHA)
	ent:SetNoDraw(true)
	
	ent.VehicleName = 'Airboat Seat'
	ent.ClassOverride = 'prop_vehicle_prisoner_pod'
	
	ent:SetNWBool('IsSittingVehicle', true)
	
	return ent
end

function DSit.PlayerAABB(ply)
	local pos = ply:GetPos()
	local Mins, Maxs = ply:OBBMins(), ply:OBBMaxs()
	
	local Eyes = ply:EyePos()
	
	local heigt = Maxs.z - Mins.z + 10
	Mins.z = 0
	Maxs.z = 0
	
	return Mins, Maxs, heigt
end

local function Sharp(ang)
	ang.y = math.floor(ang.y / 5) * 5
end

local function IsPosSituable(pos, ply, tr)
	local mins, maxs, h = DSit.PlayerAABB(ply)
	
	local start = Vector(0, 0, 3)
	local add = Vector(0, 0, h)
	
	local rang = tr.HitNormal:Angle()
	rang:RotateAroundAxis(rang:Right(), -90)
	add:Rotate(rang)
	start:Rotate(rang)
	
	local tr = util.TraceHull{
		start = pos + start,
		endpos = pos + add,
		mins = mins * 0.7,
		maxs = maxs * 0.7,
		filter = {ply, tr.Entity},
	}
	
	return not tr.Hit
end

local function IsPosSituableCeiling(pos, ply, tr)
	local mins, maxs, h = DSit.PlayerAABB(ply)
	
	local start = Vector(0, 0, 3)
	local add = Vector(0, 0, h)
	
	local rang = tr.HitNormal:Angle()
	rang:RotateAroundAxis(rang:Right(), -90)
	add:Rotate(rang)
	start:Rotate(rang)
	
	local tr = util.TraceHull{
		start = pos + start,
		endpos = pos + add,
		mins = mins * 0.7,
		maxs = maxs * 0.7,
		filter = {ply, tr.Entity},
	}
	
	return not tr.Hit
end

local TRICK_MINS = Vector(-4, -4, 0)
local TRICK_MAXS = Vector(4, 4, 0)

function DSit.TrickPos(ply, pos, ang)
	local FallAng = DSit.Copy(ang)
	FallAng.p = 0
	FallAng.r = 0
	FallAng.y = FallAng.y - 180
	local forward = FallAng:Forward()
	local right = FallAng:Right()
	local FallPos = pos - right * 40
	
	local NewPos = DSit.Copy(pos)
	local NewAng = DSit.Copy(ang)
	
	if ply:GetPos():Distance(pos) > 30 then
		local tr = util.TraceHull{
			start = pos + Vector(0, 0, 4),
			endpos = FallPos + Vector(0, 0, 4),
			filter = ply,
			mins = TRICK_MINS,
			maxs = TRICK_MAXS,
		}
		
		if not tr.Hit then
			local tr = util.TraceLine{
				start = FallPos + Vector(0, 0, 10),
				endpos = FallPos + Vector(0, 0, -5),
				filter = ply
			}
			
			if not tr.Hit then
				NewAng.y = NewAng.y - 180
			end
		end
	end
	
	return NewPos, NewAng
end

local NewEyeAngles = Angle(0, 90, 0)

function DSit.Sit(ply, tr, lpos, eyes, epos, ignore, notify)
	if not IsValid(ply) then return end
	if not tr then return end
	
	local pos = tr.HitPos
	local normal = tr.HitNormal
	local minus = (pos - lpos)
	local Ang1 = normal:Angle()
	local Ang2 = minus:Angle()
	
	local Ang = Ang1
	
	Ang:RotateAroundAxis(Ang:Right(), -90)
	
	Ang.y = Ang2.y + 90
	Sharp(Ang)
	
	pos, Ang = DSit.TrickPos(ply, pos, Ang, tr)
	
	local ValidAngle = Ang1.p < 15 and Ang1.p > -15
	local OnCeiling = Ang1.r > 170 or Ang1.r < -170
	
	local ALLOW_ANY = ALLOW_ANY:GetBool()
	
	if not ignore then
		if not ValidAngle and not ALLOW_ANY then 
			if notify then ply:PrintMessage(HUD_PRINTCENTER, '[DSit] Invalid angle') end
			return 
		end
		
		if OnCeiling and not FUNNY_SIT:GetBool() then
			if notify then ply:PrintMessage(HUD_PRINTCENTER, '[DSit] Sitting on ceiling is disabled') end
			return
		end
		
		if not OnCeiling and not IsPosSituable(pos, ply, tr) then 
			if notify then ply:PrintMessage(HUD_PRINTCENTER, '[DSit] Something is obstructing your sit position') end
			return 
		end
		
		if OnCeiling and not IsPosSituableCeiling(pos, ply, tr) then 
			if notify then ply:PrintMessage(HUD_PRINTCENTER, '[DSit] Something is obstructing your sit position') end
			return 
		end
	end
	
	if OnCeiling then
		Ang.y = Ang.y - 180
	end
	
	if FORCE_FLAT:GetBool() and not ALLOW_ANY then
		Ang.p = 0
	end
	
	local ent = DSit.CreateVehicle(pos, Ang, ply)
	
	local can = hook.Run('CanPlayerEnterVehicle', ply, ent)
	
	if can == false then
		SafeRemoveEntity(ent)
		
		if notify then 
			ply:PrintMessage(HUD_PRINTCENTER, '[DSit] You can not sit right now')
			DSit.AddPText(ply, Color(0, 200, 0), '[DSit] ', Color(200, 200, 200), 'You can not sit right now')
		end
		
		return
	end
	
	ent:SetNWEntity('Player', ply)
	
	ply.DSit_LastAngles = eyes
	ply.DSit_LastPos = lpos
	
	local WEAPONS = ALLOW_WEAPONS:GetBool()
	local IsFlashlightOn
	
	ply.DSit_LastCollisionGroup = ply:GetCollisionGroup()
	
	if WEAPONS then
		ply.DSit_LastWeaponMode = ply:GetAllowWeaponsInVehicle()
		
		ply:SetAllowWeaponsInVehicle(true)
		
		IsFlashlightOn = ply:FlashlightIsOn()
	end
	
	ply:EnterVehicle(ent)
	
	if WEAPONS then
		if IsFlashlightOn then ply:Flashlight(true) end
	end
	ply:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	
	if IsValid(tr.Entity) then
		ent:SetParent(tr.Entity)
		ply:SetNWEntity('DSit_Vehicle_Parent', tr.Entity)
		if not IsValid(tr.Entity:GetNWEntity('DSit_Vehicle_Parented')) then tr.Entity:SetNWEntity('DSit_Vehicle_Parented', ent) end
		
		RecalculateConstrained(tr.Entity, ply)
	end
	
	ply:SetEyeAngles(NewEyeAngles)
	
	ply.DSit_Vehicle = ent
	ply:SetNWEntity('DSit_Vehicle', ent)
end

function DSit.SitOnPlayerLegs(ply, tr, lpos, eyes, epos)
	if not IsValid(ply) then return end
	if not tr then return end
	local target = tr.Entity
	local veh = tr.Entity:GetVehicle()
	
	local pos = veh:GetPos()
	local Ang = veh:GetAngles()
	
	local ADD = Vector(0, 10, 5)
	ADD:Rotate(Ang)
	
	local ent = DSit.CreateVehicle(pos + ADD, Ang, ply)
	
	local can = hook.Run('CanPlayerEnterVehicle', ply, ent)
	
	if can == false then
		SafeRemoveEntity(ent)
		
		if notify then 
			ply:PrintMessage(HUD_PRINTCENTER, '[DSit] You can not sit right now')
			DSit.AddPText(ply, Color(0, 200, 0), '[DSit] ', Color(200, 200, 200), 'You can not sit right now')
		end
		
		return
	end
	
	ent:SetNWEntity('Player', ply)
	
	ply.DSit_LastAngles = eyes
	ply.DSit_LastPos = lpos
	
	local WEAPONS = ALLOW_WEAPONS:GetBool()
	local IsFlashlightOn
	
	ply.DSit_LastCollisionGroup = ply:GetCollisionGroup()
	
	if WEAPONS then
		ply.DSit_LastWeaponMode = ply:GetAllowWeaponsInVehicle()
		
		ply:SetAllowWeaponsInVehicle(true)
		
		IsFlashlightOn = ply:FlashlightIsOn()
	end
	
	ply:EnterVehicle(ent)
	
	if WEAPONS then
		if IsFlashlightOn then ply:Flashlight(true) end
	end
	ply:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	
	ent:SetParent(veh)
	ply:SetNWEntity('DSit_Vehicle_Parent', veh)
	
	ply:SetEyeAngles(NewEyeAngles)
	
	ply.DSit_Vehicle = ent
	ply:SetNWEntity('DSit_Vehicle', ent)
	
	ent.__IsSittingOnPlayer = true
	ent.__SittingPlayer = target
end

function DSit.SitOnPlayer(ply, tr, lpos, eyes, epos, notify)
	if not IsValid(ply) then return end
	if not tr then return end
	
	local info = ply:GetInfo('cl_dsit_allow_on_me')
	if info and info == '0' then
		if notify then 
			ply:PrintMessage(HUD_PRINTCENTER, '[DSit] You disallowed sitting on players')
			DSit.AddPText(ply, Color(0, 200, 0), '[DSit] ', Color(200, 200, 200), 'You disallowed sitting on players')
		end
		return
	end
	
	local Ply = tr.Entity
	
	local info = Ply:GetInfo('cl_dsit_allow_on_me')
	
	if info and info == '0' then
		if notify then 
			ply:PrintMessage(HUD_PRINTCENTER, '[DSit] Target disallowed sitting on him')
			DSit.AddPText(ply, Color(0, 200, 0), '[DSit] ', Color(200, 200, 200), 'Target disallowed sitting on him')
		end
		return
	end
	
	local pos = tr.HitPos
	local normal = tr.HitNormal
	local minus = (pos - lpos)
	local Ang1 = normal:Angle()
	local Ang2 = minus:Angle()
	
	local Ang = Angle(Ang1.p, Ang2.y + 90, Ang1.r)
	
	Ang:RotateAroundAxis(Ang:Right(), -90)
	
	local ent = DSit.CreateVehicle(pos, Ang, ply)
	
	local can = hook.Run('CanPlayerEnterVehicle', ply, ent)
	
	if can == false then
		SafeRemoveEntity(ent)
		
		if notify then 
			ply:PrintMessage(HUD_PRINTCENTER, '[DSit] You can not sit right now')
			DSit.AddPText(ply, Color(0, 200, 0), '[DSit] ', Color(200, 200, 200), 'You can not sit right now')
		end
		
		return
	end
	
	ent:SetNWEntity('Player', ply)
	
	ply.DSit_LastAngles = eyes
	ply.DSit_LastPos = lpos
	
	local WEAPONS = ALLOW_WEAPONS:GetBool()
	local IsFlashlightOn
	
	ply.DSit_LastCollisionGroup = ply:GetCollisionGroup()
	
	if WEAPONS then
		ply.DSit_LastWeaponMode = ply:GetAllowWeaponsInVehicle()
		
		ply:SetAllowWeaponsInVehicle(true)
		
		IsFlashlightOn = ply:FlashlightIsOn()
	end
	
	ply:EnterVehicle(ent)
	
	if WEAPONS then
		if IsFlashlightOn then ply:Flashlight(true) end
	end
	ply:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	
	ply:SetEyeAngles(NewEyeAngles)
	
	ply.DSit_Vehicle = ent
	
	ent.ParentedToPlayer = Ply
	ent:SetNWEntity('ParentedToPlayer', Ply)
	
	if SHOULD_PARENT:GetBool() then
		local EYES = Ply:EyePos()
		
		local eAttach = Ply:LookupAttachment('eyes')
		local hAttach = Ply:LookupAttachment('head')
		
		if hAttach and hAttach ~= 0 then
			local d = Ply:GetAttachment(hAttach)
			EYES = d.Pos
		elseif eAttach and eAttach ~= 0 then
			local d = Ply:GetAttachment(eAttach)
			EYES = d.Pos
		end
		
		EYES.z = EYES.z + 10
		
		ent:SetAngles(Ply:EyeAngles())
		
		ent:SetPos(EYES)
		ent:SetParent(Ply, hAttach or eAttach or -1)
	end
end

local function RecursionCheck(ply, ent, fPly)
	if ent.ParentedToPlayer == ply then return true end
	
	if fPly then
		for k, v in pairs(ents.FindByClass('prop_vehicle_prisoner_pod')) do
			if v.ParentedToPlayer == fPly and ent.ParentedToPlayer == ply then return true end
		end
	end
	
	return false
end

local MINS = Vector(-4, -4, 0)
local MAXS = Vector(4, 4, 0)

local function Request(ply)
	if not ENABLE:GetBool() then return end
	if not IsValid(ply) then print('No sit for console') return end
	
	if ply:InVehicle() then return end
	
	local lpos = ply:GetPos()
	local epos = ply:EyePos()
	local eyes = ply:EyeAngles()
	local fwd = eyes:Forward()
	
	local Mins, Maxs, Height = DSit.PlayerAABB(ply)
	
	local tr = util.TraceHull{
		start = epos - fwd * 3,
		endpos = epos + fwd * MAX_DISTANCE:GetFloat(),
		filter = ply,
		mins = MINS,
		maxs = MAXS,
	}
	
	if HULL_CHECKS:GetBool() then
		local tr2 = util.TraceHull{
			start = epos - fwd * 3,
			endpos = epos + fwd * MAX_DISTANCE:GetFloat(),
			mins = Mins,
			maxs = Maxs,
			filter = function(ent)
				if ply == ent then return false end
				if ent == tr.Entity then return true end
				if IsValid(ent) and ent:IsPlayer() then return false end
				return true
			end,
		}
		
		if tr2.Entity ~= tr.Entity then tr = tr2 end
	end
	
	if not tr.Hit then return end
	if tr.HitSky then return end

	ply.DSit_LastTry = ply.DSit_LastTry or 0
	if ply.DSit_LastTry > CurTime() then return false end
	
	local ent = tr.Entity
	
	local IsPlayer
	
	ply.DSit_LastTry = CurTime() + 1
	
	if IsValid(ent) then
		local class = ent:GetClass()
		IsPlayer = class == 'player'
		
		if ent.ParentedToPlayer == ply or class:sub(1, 5) == 'func_' or class:sub(1, 9) == 'func_door' then
			return
		end
	end
	
	if IsPlayer then
		local Ply = ent
		
		if IsValid(Ply:GetVehicle()) then 
			if RecursionCheck(ply, Ply:GetVehicle(), Ply) then return end
		end
		
		if not Ply:InVehicle() and ALLOW_ON_PLAYERS:GetBool() then
			ply:DropObject()
			DSit.SitOnPlayer(ply, tr, lpos, eyes, epos, true)
		elseif not Ply:GetVehicle().IsSittingVehicle and ALLOW_ON_PLAYERS:GetBool() then
			ply:DropObject()
			DSit.SitOnPlayer(ply, tr, lpos, eyes, epos, false, true)
		elseif ALLOW_ON_PLAYERS_LEGS:GetBool() then
			ply:DropObject()
			DSit.SitOnPlayerLegs(ply, tr, lpos, eyes, epos, false, true)
		end
		
		return
	end
	
	ply:DropObject()
	DSit.Sit(ply, tr, lpos, eyes, epos, false, true)
end

concommand.Add('dsit', Request)

local function CanExitVehicle(ply, ent)
	if not IsValid(ent) then return end
	
	ply.DSit_LastTry = ply.DSit_LastTry or (CurTime() + 1)
	if ply.DSit_LastTry > CurTime() then return false end
	ply.DSit_LastTry = CurTime() + 1
end

local function DropPointToFloor(pos, mins, maxs, filter)
	return util.TraceHull{
		filter = filter,
		start = pos,
		endpos = pos - Vector(0, 0, 100),
		mins = mins,
		maxs = maxs,
	}
end

local CheckSides = {}

for z = -4, 4 do
	for x = -4, 4 do
		for y = -4, 4 do
			table.insert(CheckSides, Vector(x * 45, y * 45, z * 45 - 20))
		end
	end
end

local function CheckVectors(vec1, vec2, filter)
	local tr = util.TraceLine{
		start = vec1,
		endpos = vec2,
		filter = filter
	}
	
	return tr.HitPos == vec2
end

local function FindPos(ply, pos, oldpos, H, vehpos, trCheck)
	local mins, maxs, heigt = DSit.PlayerAABB(ply)
	
	local PREVENT_EXPLOIT = PREVENT_EXPLOIT:GetBool()
	
	local tr = util.TraceHull{
		start = pos,
		endpos = pos + Vector(0, 0, heigt),
		filter = function(ent)
			if ent == ply then return false end
			if ent:GetCollisionGroup() == COLLISION_GROUP_WEAPON or ent:GetCollisionGroup() == COLLISION_GROUP_WORLD then return false end
			return true
		end,
		
		mins = mins,
		maxs = maxs,
		mask = MASK_ALL,
	}
	
	if tr.Entity == NULL then
		-- Did we got outside of map?
		
		local trMap = util.TraceLine{
			start = pos,
			endpos = pos + Vector(0, 0, -16000),
			filter = ply,
			mask = MASK_ALL,
		}
		
		if trMap.Entity == NULL then
			ply:SetPos(oldpos)
			return false, oldpos
		end
	end

	if not tr.Hit and CheckVectors(tr.HitPos, oldpos, trCheck.filter) then
		ply:SetPos(pos)
		return true, pos
	else
		local hit = false
		local validpos
		
		if vehpos then
			local tr = util.TraceHull{
				start = vehpos + Vector(0, 0, 6),
				endpos = vehpos + Vector(0, 0, 8), --Maxs have high Z
				
				mins = mins,
				maxs = maxs,
				filter = ply,
			}
			
			if not tr.Hit and CheckVectors(tr.HitPos, oldpos, trCheck.filter) then
				validpos = tr.HitPos
				hit = true
			else
				for k, vec in ipairs(CheckSides) do
					local newvec = vehpos + vec
					local tr = DropPointToFloor(newvec, mins, maxs, ply)
					
					if tr.HitPos ~= newvec then
						-- Make it really sure that we are found right position
						
						local trCheck2 = util.TraceLine{
							start = ply:GetPos() + Vector(0, 0, -2),
							endpos = ply:GetPos() + Vector(0, 0, ply:OBBMaxs().z + 20),
							filter = ply,
						}
						
						if trCheck2.Hit then
							continue
						else
							-- Wew, final check
							
							local maxs = ply:OBBMaxs()
							maxs.z = 0
							
							local trCheck3 = util.TraceHull{
								start = ply:GetPos() + Vector(0, 0, -2),
								endpos = ply:GetPos() + Vector(0, 0, ply:OBBMaxs().z + 20),
								filter = ply,
								mins = ply:OBBMins(),
								maxs = maxs,
							}
						end
						
						if PREVENT_EXPLOIT then
							trCheck.endpos = tr.HitPos
							local result = util.TraceLine(trCheck)
							if result.Hit then continue end
						end
						
						validpos = tr.HitPos
						hit = true
						break
					end
				end
			end
		end
		
		if not hit then
			ply:SetPos(oldpos)
			return false, oldpos
		else
			ply:SetPos(validpos)
			return true, validpos
		end
	end
end

local function PostLeaveVehicle(ply, tr, vehpos)
	if not IsValid(ply) then return end
	ply:SetAllowWeaponsInVehicle(ply.DSit_LastWeaponMode)
	ply:SetCollisionGroup(ply.DSit_LastCollisionGroup)
	
	ply:SetEyeAngles(ply.DSit_LastAngles)
	local H = ply:OBBMaxs().z - ply:OBBMins().z
	
	local status, newPlyPos = FindPos(ply, ply:GetPos(), ply.DSit_LastPos, H, vehpos, table.Copy(tr))
	
	if status then
		tr.endpos = newPlyPos
		
		if PREVENT_EXPLOIT:GetBool() then
			local tr2 = util.TraceLine(tr)
			
			if tr2.Hit then
				ply:SetPos(ply.DSit_LastPos)
				DSit.AddPText(ply, Color(0, 200, 0), '[DSit] ', Color(200, 200, 200), 'You go through wall and was teleported to previous location')
			end
		end
	else
		DSit.AddPText(ply, Color(0, 200, 0), '[DSit] ', Color(200, 200, 200), 'You were stuck and teleported to previous location')
	end
	
	ply:SetNWEntity('DSit_Vehicle_Parent', NULL)
end

local function isValid(ent)
	return IsValid(ent) and not ent.DSIT_IGNORE
end

local function DoUsualCheck(ply, ent)
	if not isValid(ent) then return false end
	if ent.IsSittingVehicle then return true end
	
	if ent:IsVehicle() then
		local d = ent:GetDriver()
		if IsValid(d) then
			ply = d
		end
	end
	if isValid(ent:GetNWEntity('DSit_Vehicle_Parented')) then return true end
	
	if ply then
		if ent == ply:GetNWEntity('DSit_Vehicle') then return true end
		if ent == ply:GetNWEntity('DSit_Vehicle_Parent') then return true end
		if not ply:IsAdmin() and isValid(ent:GetNWEntity('DSit_Vehicle_Parented')) then return true end
	end
	
	if isValid(ent:GetNWEntity('DSit_Vehicle')) then return true end
end

function RecalculateConstrained(ent, ply)
	if true then return end --For now it is disabled
	if not IsValid(ent) then return end
	if ent._DSit_LastReaclc == CurTime() then return end
	local result = DSit.GetAllConnectedEntities(ent)
	ent._DSit_LastReaclc = CurTime()

	local hit = false
	local size = #result
	
	for k = 1, size do
		if DoUsualCheck(ply, result[k]) then hit = true break end
	end
	
	if hit then
		for k = 1, size do
			result[k]:SetNWBool('DSit_IsConstrained', true)
		end
	else
		for k = 1, size do
			result[k]:SetNWBool('DSit_IsConstrained', false)
		end
	end
end

local function EntityRemoved(ent)
	if not ent:IsConstraint() then return end
	local ent1, ent2 = ent:GetConstrainedEntities()
	
	if IsValid(ent1) then
		RecalculateConstrained(ent1)
	end
	
	if IsValid(ent2) then
		RecalculateConstrained(ent2)
	end
end

local function OnEntityCreated(ent)
	if not ent:IsConstraint() then return end
	
	timer.Simple(0, function()
		local ent1, ent2 = ent:GetConstrainedEntities()
		if IsValid(ent1) then
			RecalculateConstrained(ent1)
		end
		
		if IsValid(ent2) then
			RecalculateConstrained(ent2)
		end
	end)
end

local function PlayerLeaveVehicle(ply, ent)
	if not IsValid(ent) then return end
	if not ent.IsSittingVehicle then return end
	
	ply.NoClip = nil
	
	ent.DSIT_IGNORE = true
	local parent = ent:GetParent()
	
	if IsValid(parent) and not parent:IsPlayer() then
		timer.Simple(2, function()
			RecalculateConstrained(parent, ply)
		end)
	end
	
	ply.DSit_LastTry = CurTime() + 1
	
	if ent.__IsSittingOnPlayer then
		local Ply = ent.__SittingPlayer
		if IsValid(Ply) then
			ply:SetPos(Ply:EyePos() + Vector(0, 0, 10))
		end
	end
	
	local tr = {
		start = ent:GetPos(),
		endpos = ply:GetPos(),
		filter = function(ent2)
			if ent2 == ent then return false end
			if ent2 == ply then return false end
			
			if IsValid(ent2) then
				local class = ent2:GetClass()
				if class:sub(1, 5) == 'func_' then return true end
				if class:sub(1, 9) == 'prop_door' then return true end
			else
				return true
			end
			
			return false
		end,
	}
	
	local vehpos = ent:GetPos() + Vector(0, 0, 3)
	
	SafeRemoveEntity(ent)
	
	timer.Simple(0, function()
		PostLeaveVehicle(ply, tr, vehpos)
	end)
end

local function PlayerDeath(ply)
	if ply.DSit_Vehicle and IsValid(ply.DSit_Vehicle) then SafeRemoveEntity(ply.DSit_Vehicle) end
	
	ply:SetNWEntity('DSit_Vehicle_Parent', NULL)
end

local function PlayerDisconnected(ply)
	if ply.DSit_Vehicle and IsValid(ply.DSit_Vehicle) then SafeRemoveEntity(ply.DSit_Vehicle) end
	
	ply:SetNWEntity('DSit_Vehicle_Parent', NULL)
end

local function VehicleTick(ent)
	if not IsValid(ent) then return end
	if not ent.IsSittingVehicle then return end
	if not ent.ParentedToPlayer then return end
	
	if not IsValid(ent.ParentedToPlayer) then
		SafeRemoveEntity(ent)
		return
	end
	
	if not ent.ParentedToPlayer:Alive() then
		SafeRemoveEntity(ent)
		return
	end
	
	if ent.ParentedToPlayer:GetNWBool('Spectator') then
		SafeRemoveEntity(ent)
		return
	end
	
	local ply = ent.ParentedToPlayer
	
	if not SHOULD_PARENT:GetBool() then
		local Angles = ply:EyeAngles()
		Angles.p = 0
		Angles.r = 0
		Angles.y = Angles.y - 90
		
		ent:SetAngles(Angles)
		
		local epos = ply:EyePos()
		epos.z = epos.z + 10
		ent:SetPos(epos)
	end
end

local function Tick()
	if not ENABLE:GetBool() then return end
	for k, ent in pairs(ents.FindByClass('prop_vehicle_prisoner_pod')) do
		VehicleTick(ent)
	end
end

local LastSay = 0

local function PhysgunPickup(ply, ent)
	if ent:IsPlayer() and ent:InVehicle() and ent:GetVehicle().IsSittingVehicle then return false end
	if DISABLE_PHYSGUN:GetBool() and ply:InVehicle() and ply:GetVehicle().IsSittingVehicle then return false end
	if not NO_SURF:GetBool() then return end
	if not NO_SURF_ADMINS:GetBool() and ply:IsAdmin() then return end
	
	local res = DoUsualCheck(ply, ent)
	if res then return false end
	
	if ent:GetNWBool('DSit_IsConstrained') then 
		if LastSay + 1 < CurTime() then
			DSit.AddPText(ply, Color(0, 200, 0), '[DSit] ', Color(200, 200, 200), 'That entity is constrained with chair')
			LastSay = CurTime()
		end
		
		return false 
	end
end

local function KeyPress(ply, key)
	if key ~= IN_USE then return end
	
	if ply:KeyDown(IN_WALK) then Request(ply) end
end

PlayerSit = Request

local hooks = {
	PlayerDeath = PlayerDeath,
	PlayerDisconnected = PlayerDisconnected,
	PlayerLeaveVehicle = PlayerLeaveVehicle,
	CanExitVehicle = CanExitVehicle,
	KeyPress = KeyPress,
	
	--Before i make faster functions, i would disable these hooks
	--EntityRemoved = EntityRemoved,
	--OnEntityCreated = OnEntityCreated,
}

for k, v in pairs(hooks) do
	hook.Add(k, 'DSit.Hooks', v)
end

timer.Create('DSit.UpdateVehiclePositions', 0.1, 0, Tick)

--I WAS TRYING TO OVERRIDE, I FAILED.
DSit.ulxPlayerPickup = DSit.ulxPlayerPickup or hook.GetTable().PhysgunPickup and hook.GetTable().PhysgunPickup.ulxPlayerPickup

hook.Remove('PhysgunPickup', 'ulxPlayerPickup')
hook.Add('PhysgunPickup', '!DSit.Hooks', function(ply, ent)
	if PhysgunPickup(ply, ent) == false then return false end
	if DSit.ulxPlayerPickup then return DSit.ulxPlayerPickup(ply, ent) end 
end, -1)

concommand.Add('dsit_var', function(ply, cmd, args)
	if IsValid(ply) and not ply:IsSuperAdmin() then return end
	if not args[1] then return end
	if not args[2] then return end
	RunConsoleCommand('sv_dsit_' .. args[1], args[2])
end)

concommand.Add('dsit_getoff', function(ply)
	if not IsValid(ply) then return end
	
	for k, ent in pairs(ents.FindByClass('prop_vehicle_prisoner_pod')) do
		if ent.ParentedToPlayer == ply then
			ent:GetDriver():ExitVehicle()
		end
	end
end)

concommand.Add('dsit_about', function()
	MsgC([[
DSit - Sit Everywhere!
Maded by DBot

Licensed under Apache License 2
http://www.apache.org/licenses/LICENSE-2.0

DSit distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

]])
	MsgC([[
Steam Workshop:
http://steamcommunity.com/sharedfiles/filedetails/?id=673317324
Github:
https://github.com/roboderpy/dsit
]])
end)
