
--[[
Copyright (C) 2016-2019 DBotThePony


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

]]

local CURRENT_TOOL_MODE = 'sym_clone'
local CURRENT_TOOL_MODE_VARS = CURRENT_TOOL_MODE .. '_'

TOOL.Name = 'Symmetry Cloner'
TOOL.Category = 'Construction'

if CLIENT then
	language.Add('tool.' .. CURRENT_TOOL_MODE .. '.name', 'Symmetry Cloner')
	language.Add('tool.' .. CURRENT_TOOL_MODE .. '.desc', 'Mirror entities')
	language.Add('tool.' .. CURRENT_TOOL_MODE .. '.0', '')

	language.Add('tool.' .. CURRENT_TOOL_MODE .. '.left', 'Select entity to mirror')
	language.Add('tool.' .. CURRENT_TOOL_MODE .. '.left_use', 'Auto select entities to mirror')
	language.Add('tool.' .. CURRENT_TOOL_MODE .. '.right', 'Select entity as mirror point')
	language.Add('tool.' .. CURRENT_TOOL_MODE .. '.right_use', 'Make a clone!')
	language.Add('tool.' .. CURRENT_TOOL_MODE .. '.reload', 'Clear selection')

	language.Add('Undone_Mirror', 'Undone symmetric paste')
else
	util.AddNetworkString('' .. CURRENT_TOOL_MODE .. '.action')
end

TOOL.Information = {
	{name = 'left'},
	{name = 'left_use'},
	{name = 'right'},
	{name = 'right_use'},
	{name = 'reload'},
}

TOOL.ClientConVar = {
	select_r = 0,
	select_g = 255,
	select_b = 255,

	select2_r = 0,
	select2_g = 255,
	select2_b = 165,

	select3_r = 187,
	select3_g = 190,
	select3_b = 95,

	angle_p = 0,
	angle_y = 0,
	angle_r = 0,

	deselect = 1,
	display_mode = 0,
	ghost_obey_colors = 1,
}

GTools.AddAutoSelectConVars(TOOL.ClientConVar)

local function CanUse(ply, ent)
	return IsValid(ent) and
		not ent:IsPlayer() and
		not ent:IsNPC() and
		not ent:IsVehicle() and
		(not ent.CPPICanTool or ent:CPPICanTool(ply, CURRENT_TOOL_MODE))
end

function TOOL:CanUseEntity(ent)
	return CanUse(self:GetOwner(), ent)
end

local function DuplicateVectors(tab)
	for k, v in pairs(tab) do
		if type(v) == 'Vector' then
			tab[k] = Vector(v)
		elseif type(v) == 'Angle' then
			tab[k] = Angle(v.p, v.y, v.r)
		elseif type(v) == 'table' then
			DuplicateVectors(v)
		end
	end

	return tab
end

function TOOL:SelectEntities(tr)
	return GTools.GenericAutoSelect(self, tr)
end

function TOOL.BuildCPanel(Panel)
	Panel:CheckBox('Clear selection after paste', CURRENT_TOOL_MODE_VARS .. 'deselect')
	Panel:CheckBox('Display ghosts only when you hold toolgun', CURRENT_TOOL_MODE_VARS .. 'display_mode')
	Panel:CheckBox('Ghost entities in original color, if it is not white', CURRENT_TOOL_MODE_VARS .. 'ghost_obey_colors')
	Panel:NumSlider('Symmetry Angle Pith', CURRENT_TOOL_MODE_VARS .. 'angle_p', -180, 180, 0)
	Panel:NumSlider('Symmetry Angle Yaw', CURRENT_TOOL_MODE_VARS .. 'angle_y', -180, 180, 0)
	Panel:NumSlider('Symmetry Angle Roll', CURRENT_TOOL_MODE_VARS .. 'angle_r', -180, 180, 0)

	local cancel = Panel:Button('Reset angle')

	function cancel:DoClick()
		RunConsoleCommand(CURRENT_TOOL_MODE_VARS .. 'angle_p', '0')
		RunConsoleCommand(CURRENT_TOOL_MODE_VARS .. 'angle_y', '0')
		RunConsoleCommand(CURRENT_TOOL_MODE_VARS .. 'angle_r', '0')
	end

	local lab = Label('Color for clone objects', Panel)
	Panel:AddItem(lab)
	lab:SetDark(true)

	local mixer = vgui.Create('DColorMixer', Panel)
	Panel:AddItem(mixer)
	mixer:SetConVarR(CURRENT_TOOL_MODE .. '_select_r')
	mixer:SetConVarG(CURRENT_TOOL_MODE .. '_select_g')
	mixer:SetConVarB(CURRENT_TOOL_MODE .. '_select_b')
	mixer:SetAlphaBar(false)

	local lab = Label('Color for symmetry object', Panel)
	Panel:AddItem(lab)
	lab:SetDark(true)

	local mixer = vgui.Create('DColorMixer', Panel)
	Panel:AddItem(mixer)
	mixer:SetConVarR(CURRENT_TOOL_MODE .. '_select2_r')
	mixer:SetConVarG(CURRENT_TOOL_MODE .. '_select2_g')
	mixer:SetConVarB(CURRENT_TOOL_MODE .. '_select2_b')
	mixer:SetAlphaBar(false)

	local lab = Label('Color for visual clone plane', Panel)
	Panel:AddItem(lab)
	lab:SetDark(true)

	local mixer = vgui.Create('DColorMixer', Panel)
	Panel:AddItem(mixer)
	mixer:SetConVarR(CURRENT_TOOL_MODE .. '_select3_r')
	mixer:SetConVarG(CURRENT_TOOL_MODE .. '_select3_g')
	mixer:SetConVarB(CURRENT_TOOL_MODE .. '_select3_b')
	mixer:SetAlphaBar(false)

	GTools.AutoSelectOptions(Panel, CURRENT_TOOL_MODE)
end

local SELECTED_ENTITY
local SELECT_TABLE = {}

local function GrabAngle(ply)
	return Angle(
		math.Clamp(
			tonumber(ply:GetInfo(CURRENT_TOOL_MODE_VARS .. 'angle_p') or 0) or 0,
			-180,
			180
		),

		math.Clamp(
			tonumber(ply:GetInfo(CURRENT_TOOL_MODE_VARS .. 'angle_y') or 0) or 0,
			-180,
			180
		),

		math.Clamp(
			tonumber(ply:GetInfo(CURRENT_TOOL_MODE_VARS .. 'angle_r') or 0) or 0,
			-180,
			180
		)
	)
end

local function SymmetryPositions(tabIn, pos, ang)
	local tabOut = {}

	for k, entry in ipairs(tabIn) do
		--[[
			This is done through WorldToLocal function
			when i was trying to done this using analytic geometry
			The theory: WorldToLocal creates new coordinate system, where (0; 0)
			is the point of third (pos) argument. When we specify valid angles,
			our line of symmetry is lying on X line.

			Without this function, it is harder to make the line math.
			But - We can do it by ourselves - Create local coordinate system,
			and just simply negate the Y.
		]]

		local localPos, localAng = WorldToLocal(entry[1], entry[2], pos, ang)
		localPos.y = -localPos.y

		localAng.y = -localAng.y
		localAng.r = -localAng.r

		table.insert(tabOut, {LocalToWorld(localPos, localAng, pos, ang)})
	end

	return tabOut
end

local function Catch(err)
	GTools.AdminPrint('[SYMMETRY CLONER CATCHED ERROR] ', err)
	GTools.AdminPrint(debug.traceback())
end

local function DoSafeCopy(data, ent)
	local newEnt = ents.Create(ent:GetClass())
	newEnt:SetPos(data[1])
	newEnt:SetAngles(data[2])
	newEnt:SetModel(ent:GetModel())

	newEnt:Spawn()

	newEnt:SetModel(ent:GetModel())

	newEnt:SetSkin(ent:GetSkin() or 0)
	newEnt:SetModelScale(ent:GetModelScale() or 1)
	newEnt:SetMaterial(ent:GetMaterial() or '')
	newEnt:SetHealth(ent:Health() or 0)
	newEnt:SetMaxHealth(ent:GetMaxHealth() or 0)
	newEnt:SetColor(ent:GetColor())

	newEnt:Activate()

	local getBG = ent:GetBodyGroups()

	if getBG then
		for i, data in ipairs(getBG) do
			if data.id > 0 then
				newEnt:SetBodygroup(data.id, ent:GetBodygroup(data.id))
			end
		end
	end

	local netVars

	if ent.GetNetworkVars then
		netVars = ent:GetNetworkVars()
	end

	if newEnt.RestoreNetworkVars and netVars then
		newEnt:RestoreNetworkVars(netVars)
	end

	local deepCopy = table.Copy(ent:GetTable())

	for k, val in pairs(deepCopy) do
		if type(val) == 'function' then
			deepCopy[k] = nil
		end
	end

	if ent.GetNWVarTable then
		deepCopy.NWVals = ent:GetNWVarTable()
	end

	local phys = ent:GetPhysicsObject()
	local newPhys = newEnt:GetPhysicsObject()

	-- Physical copy
	if IsValid(phys) and IsValid(newPhys) then
		newPhys:SetMass(phys:GetMass())
		newPhys:EnableDrag(phys:IsDragEnabled())
		newPhys:EnableCollisions(phys:IsCollisionEnabled())
		newPhys:EnableGravity(phys:IsGravityEnabled())

		if phys:IsAsleep() then
			newPhys:Sleep()
		else
			newPhys:Wake()
		end

		newPhys:EnableMotion(phys:IsMotionEnabled())
	end

	local eTab = newEnt:GetTable()
	eTab.Symm_DeepTableClone = deepCopy
	eTab.twinOriginalPos = ent:GetPos()
	eTab.twinOriginalAng = ent:GetAngles()

	DoPropSpawnedEffect(newEnt)

	return newEnt, deepCopy
end

local function LoopedMerge(to, source)
	for k, v in pairs(source) do
		if k ~= '__index' and k ~= '__newindex' then
			local t = type(to[k])

			if t == 'nil' then
				to[k] = v
			elseif t == 'table' and to[k] ~= source and to[k] ~= to then
				LoopedMerge(to[k], v)
			end
		end
	end
end

local function ApplyEntityMods(ply, ent, source)
	local tab = ent:GetTable()
	local class = ent:GetClass()

	for k, v in pairs(source) do
		if k == 'NWVals' then continue end

		if tab[k] == nil then
			tab[k] = v
		elseif type(tab[k]) == 'table' then
			LoopedMerge(tab[k], v)
		end
	end

	if source.NWVals then
		for key, value in pairs(source.NWVals) do
			local Type = type(value)

			if Type == 'Angle' then
				ent:SetNWAngle(key, value)
			elseif Type == 'boolean' then
				ent:SetNWBool(key, value)
			elseif Type == 'number' then
				ent:SetNWFloat(key, value)
				ent:SetNWInt(key, value)
			elseif Type == 'string' then
				ent:SetNWString(key, value)
			elseif Type == 'Vector' then
				ent:SetNWVector(key, value)
			elseif IsEntity(value) then
				ent:SetNWEntity(key, value)
			end
		end
	end

	if ply then
		if source.EntityMods then
			for name, data in pairs(source.EntityMods) do
				local func = duplicator.EntityModifiers[name]

				if func then
					xpcall(func, Catch, ply, ent, data)
				end
			end
		end

		if ent.PostEntityPaste then
			xpcall(ent.PostEntityPaste, Catch, ent, ply, ent, {ent})
		end

		if ent.OnDuplicated then
			xpcall(ent.OnDuplicated, Catch, ent)
		end
	end
end

local function DPP_AntiSpamEnt(self, ply, ent)
	if ent == self then return false end
end

local function FastHaveValue(arr, val)
	for i = 1, #arr do
		if val == arr[i] then return true end
	end

	return false
end

local function CreateConstraintByTable(fEnt, sEnt, cData, doSymmetry)
	cData = DuplicateVectors(table.Copy(cData))

	local tp = cData.Type
	local func = constraint[tp]

	if not func then
		GTools.AdminPrint('[Symmetry Clonner] Unknown Constraint Type: ' .. tp .. '!')
		return false
	end

	local args = {fEnt, sEnt, cData.Bone1 or 0, cData.Bone2 or 0}

	if tp == 'Weld' then
		table.insert(args, cData.forcelimit)
		table.insert(args, cData.nocollide)
	elseif tp == 'Elastic' then
		GTools.Prepend(args, cData.pl)

		if doSymmetry then
			cData.Entity[1].LPos.y = -cData.Entity[1].LPos.y
			cData.Entity[2].LPos.y = -cData.Entity[2].LPos.y
		end

		table.insert(args, cData.Entity[1].LPos)
		table.insert(args, cData.Entity[2].LPos)
		table.insert(args, cData.constant)
		table.insert(args, cData.damping)
		table.insert(args, cData.rdamping)
		table.insert(args, cData.material)
		table.insert(args, cData.width)
		table.insert(args, tobool(cData.stretchonly))
	elseif tp == 'Winch' then
		GTools.Prepend(args, cData.pl)

		if doSymmetry then
			cData.LPos1.y = -cData.LPos1.y
			cData.LPos2.y = -cData.LPos2.y
		end

		table.insert(args, cData.LPos1)
		table.insert(args, cData.LPos2)
		table.insert(args, cData.width)
		table.insert(args, cData.key)
		table.insert(args, cData.fwd_speed)
		table.insert(args, cData.bwd_speed)
		table.insert(args, cData.material)
		table.insert(args, cData.toggle)
	elseif tp == 'Hydraulic' then
		if doSymmetry then
			cData.LPos1.y = -cData.LPos1.y
			cData.LPos2.y = -cData.LPos2.y
		end

		table.insert(args, cData.LPos1)
		table.insert(args, cData.LPos2)
		table.insert(args, cData.Length1)
		table.insert(args, cData.Length2)
		table.insert(args, cData.width)
		table.insert(args, cData.key)
		table.insert(args, cData.fixed)
		table.insert(args, cData.speed)
		table.insert(args, cData.material)
	elseif tp == 'Muscle' then
		GTools.Prepend(args, cData.pl)

		if doSymmetry then
			cData.LPos1.y = -cData.LPos1.y
			cData.LPos2.y = -cData.LPos2.y
		end

		table.insert(args, cData.LPos1)
		table.insert(args, cData.LPos2)
		table.insert(args, cData.Length1)
		table.insert(args, cData.Length2)
		table.insert(args, cData.width)
		table.insert(args, cData.key)
		table.insert(args, cData.fixed)
		table.insert(args, cData.period)
		table.insert(args, cData.amplitude)
		table.insert(args, cData.starton)
		table.insert(args, cData.material)
	elseif tp == 'Rope' then
		if doSymmetry then
			cData.Entity[1].LPos.y = -cData.Entity[1].LPos.y
			cData.Entity[2].LPos.y = -cData.Entity[2].LPos.y
		end

		table.insert(args, cData.Entity[1].LPos)
		table.insert(args, cData.Entity[2].LPos)
		table.insert(args, cData.length)
		table.insert(args, cData.addlength)
		table.insert(args, cData.forcelimit)
		table.insert(args, cData.width)
		table.insert(args, cData.material)
		table.insert(args, cData.rigid)
	elseif tp == 'Slider' then
		if doSymmetry then
			cData.Entity[1].LPos.y = -cData.Entity[1].LPos.y
			cData.Entity[2].LPos.y = -cData.Entity[2].LPos.y
		end

		table.insert(args, cData.Entity[1].LPos)
		table.insert(args, cData.Entity[2].LPos)
		table.insert(args, cData.width)
		table.insert(args, cData.material)
	elseif tp == 'Axis' then
		if doSymmetry then
			cData.LPos1.y = -cData.LPos1.y
			cData.LPos2.y = -cData.LPos2.y
		end

		table.insert(args, cData.LPos1)
		table.insert(args, cData.LPos2)
		table.insert(args, cData.forcelimit)
		table.insert(args, cData.torquelimit)
		table.insert(args, cData.friction)
		table.insert(args, cData.nocollide)
		table.insert(args, cData.LocalAxis)
	elseif tp == 'Motor' then
		if doSymmetry then
			cData.Entity[1].LPos.y = -cData.Entity[1].LPos.y
			cData.Entity[2].LPos.y = -cData.Entity[2].LPos.y
		end

		table.insert(args, cData.Entity[1].LPos)
		table.insert(args, cData.Entity[2].LPos)
		table.insert(args, cData.friction)
		table.insert(args, cData.torque)
		table.insert(args, cData.forcetime)
		table.insert(args, cData.nocollide)
		table.insert(args, cData.toggle)
		table.insert(args, cData.pl)
		table.insert(args, cData.forcelimit)
		table.insert(args, cData.numpadkey_fwd)
		table.insert(args, cData.numpadkey_bwd)
		table.insert(args, cData.direction)
		table.insert(args, cData.LocalAxis)
	elseif tp == 'Ballsocket' then
		if doSymmetry then
			cData.LPos.y = -cData.LPos.LPos.y
		end

		table.insert(args, cData.LPos)
		table.insert(args, cData.forcelimit)
		table.insert(args, cData.torquelimit)
		table.insert(args, cData.nocollide)
	end

	local status, constraintEntity = pcall(func, unpack(args))

	if not status then
		GTools.AdminPrint('[CAUGHT ERROR] ' .. constraintEntity)
		return false
	elseif constraintEntity then
		return constraintEntity
	end
end

function SymmetryClonner_Clone(entPoint, Ents, ply)
	local pos, ang = entPoint:GetPos(), entPoint:GetAngles()
	local grabAng

	if ply then
		grabAng = GrabAngle(ply)
	else
		grabAng = Angle(0, 0, 0)
	end

	local realAng = ang + grabAng

	local input = {}
	local INPUT_MEM = {}
	local CONSTRAINT_MEM = {}

	local entPointConstraints = {}

	for k, ent in ipairs(Ents) do
		table.insert(input, {ent:GetPos(), ent:GetAngles()})
		INPUT_MEM[ent] = ent
	end

	for k, ent in ipairs(Ents) do
		local constr = constraint.GetTable(ent)

		for i, data in ipairs(constr) do
			if data.Ent1 == entPoint or data.Ent2 == entPoint then
				table.insert(entPointConstraints, data)
				continue
			end

			if not INPUT_MEM[data.Ent1] or not INPUT_MEM[data.Ent2] then continue end -- Not our constraint!

			CONSTRAINT_MEM[data.Ent1] = CONSTRAINT_MEM[data.Ent1] or {}
			CONSTRAINT_MEM[data.Ent1][data.Ent2] = CONSTRAINT_MEM[data.Ent1][data.Ent2] or {}
			table.insert(CONSTRAINT_MEM[data.Ent1][data.Ent2], data)
		end
	end

	local output = SymmetryPositions(input, pos, realAng)
	local newEnts = {}

	local ASSOCIATION = {}
	local ASSOCIATION_REVERSE = {}

	for i, data in ipairs(output) do
		local ent = Ents[i]

		if ply then
			local class = ent:GetClass()

			if class == 'prop_physics' then
				local can = hook.Run('PlayerSpawnObject', ply, ent:GetModel(), ent:GetSkin())
				if can == false then continue end

				local can = hook.Run('PlayerSpawnProp', ply, ent:GetModel())
				if can == false then continue end
			elseif class == 'prop_ragdoll' then
				local can = hook.Run('PlayerSpawnObject', ply, ent:GetModel(), ent:GetSkin())
				if can == false then continue end

				local can = hook.Run('PlayerSpawnRagdoll', ply, ent:GetModel())
				if can == false then continue end
			elseif ent:IsWeapon() then
				local can = hook.Run('PlayerSpawnSWEP', ply, class, weapons.Get(class) or {})
				if can == false then continue end
			else
				local can = hook.Run('PlayerSpawnSENT', ply, class)
				if can == false then continue end
			end
		end

		local status, newEnt = xpcall(DoSafeCopy, Catch, data, ent)

		if status and newEnt then
			table.insert(newEnts, newEnt)
			ASSOCIATION[newEnt] = ent
			ASSOCIATION_REVERSE[ent] = newEnt
		end
	end

	local toContinue = {}

	for i, ent in ipairs(newEnts) do
		-- Bypass DPP antispam checks

		if ply then
			hook.Add('DPP_AntiSpamEnt', ent, DPP_AntiSpamEnt)

			if ent.CPPISetOwner then
				ent:CPPISetOwner(ply)
			end

			local class = ent:GetClass()

			if class == 'prop_physics' then
				local can = hook.Run('PlayerSpawnedProp', ply, ent:GetModel(), ent)
				if can == false then
					SafeRemoveEntity(ent)
					continue
				end
			elseif class == 'prop_ragdoll' then
				local can = hook.Run('PlayerSpawnedRagdoll', ply, ent:GetModel(), ent)
				if can == false then
					SafeRemoveEntity(ent)
					continue
				end
			elseif ent:IsWeapon() then
				local can = hook.Run('PlayerSpawnedSWEP', ply, ent)
				if can == false then
					SafeRemoveEntity(ent)
					continue
				end
			else
				local can = hook.Run('PlayerSpawnedSENT', ply, ent)
				if can == false then
					SafeRemoveEntity(ent)
					continue
				end
			end
		end

		if ent:IsValid() then
			table.insert(toContinue, ent)
		end
	end

	if #toContinue == 0 then return {} end -- Oops

	local createdEntities = {}
	local entsWithMods = {}

	local DONE_MEM = {}

	if ply then
		undo.Create('Mirror')
		undo.SetPlayer(ply)
	end

	for i, ent in ipairs(toContinue) do
		table.insert(createdEntities, ent)
		table.insert(entsWithMods, ent)

		if ply then
			undo.AddEntity(ent)
		end

		local parent = ASSOCIATION[ent]

		if not parent then continue end

		DONE_MEM[ent] = DONE_MEM[ent] or {}

		local constraints = CONSTRAINT_MEM[parent]

		if not constraints then continue end

		for fakeEnt, Data in pairs(constraints) do
			local cEnt = ASSOCIATION_REVERSE[fakeEnt]
			if not cEnt then continue end

			if DONE_MEM[ent][cEnt] then continue end

			DONE_MEM[cEnt] = DONE_MEM[cEnt] or {}
			if DONE_MEM[cEnt][ent] then continue end

			DONE_MEM[cEnt][ent] = true
			DONE_MEM[ent][cEnt] = true

			for i, cData in ipairs(Data) do
				local constraintEntity = CreateConstraintByTable(ent, cEnt, cData, true)

				if constraintEntity then
					table.insert(createdEntities, constraintEntity)

					if ply then
						undo.AddEntity(constraintEntity)
					end
				end
			end
		end
	end

	for i, cData in ipairs(entPointConstraints) do
		local myEntity = cData.Ent1 ~= entPoint and cData.Ent1 or cData.Ent2
		local ent = ASSOCIATION_REVERSE[myEntity]

		if not IsValid(ent) then continue end

		local constraintEntity

		local data = DuplicateVectors(table.Copy(cData))

		data.Entity[2].LPos = data.Entity[2].LPos or Vector()
		data.Entity[2].LPos.y = -data.Entity[2].LPos.y

		data.Entity[1].LPos = data.Entity[1].LPos or Vector()
		data.Entity[1].LPos.y = -data.Entity[1].LPos.y

		if myEntity == data.Ent1 then
			constraintEntity = CreateConstraintByTable(ent, entPoint, data)
		else
			constraintEntity = CreateConstraintByTable(entPoint, ent, data)
		end

		if constraintEntity then
			table.insert(createdEntities, constraintEntity)

			if ply then
				undo.AddEntity(constraintEntity)
			end
		end
	end

	if ply then
		for i, ent in ipairs(entsWithMods) do
			local tab = ent:GetTable()

			if tab and tab.Symm_DeepTableClone then
				xpcall(ApplyEntityMods, Catch, ply, ent, tab.Symm_DeepTableClone)
			end
		end
	end

	if ply then
		undo.Finish()

		GTools.AdminPrint(ply:Nick() .. ' cloned total ' .. #createdEntities .. ' entities (including constraints), and total ' .. #entsWithMods .. ' from the requested ' .. #Ents)
	end

	return createdEntities
end

local function Request(ply)
	GTools.AdminPrint(ply:Nick() .. ' is symmetrying entities')

	local entPoint = net.ReadEntity()
	if not IsValid(entPoint) then return end

	local Ents = {}
	local count = net.ReadUInt(12)

	for i = 1, count do
		local read = net.ReadEntity()

		if CanUse(ply, read) then
			table.insert(Ents, read)
		end
	end

	SymmetryClonner_Clone(entPoint, Ents, ply)
end

local function GetEntityDummy(ent)
	if IsValid(ent.__SYMMETRY_TOOL_GHOST) then
		return ent.__SYMMETRY_TOOL_GHOST
	end

	ent.__SYMMETRY_TOOL_GHOST = ClientsideModel(ent:GetModel())
	local new = ent.__SYMMETRY_TOOL_GHOST
	new:SetNoDraw(true)

	hook.Add('Think', new, function()
		if not IsValid(ent) then
			new:Remove()
		end
	end)

	new:SetPos(ent:GetPos())
	new:SetAngles(ent:GetAngles())

	return new
end

if CLIENT then
	local vars = {}

	for k, v in pairs(TOOL.ClientConVar) do
		vars[k] = CreateConVar(CURRENT_TOOL_MODE .. '_' .. k, tostring(v), {FCVAR_ARCHIVE, FCVAR_USERINFO}, '')
	end

	local function DoAdd(ent)
		local status = vars.select_invert:GetBool()

		for i = 1, #SELECT_TABLE do
			if SELECT_TABLE[i] == ent then
				if status then
					table.remove(SELECT_TABLE, i)
					return true
				else
					return false
				end
			end
		end

		table.insert(SELECT_TABLE, ent)
		return true
	end

	local function ClearSelectedItems()
		if not IsValid(SELECTED_ENTITY) then
			SELECTED_ENTITY = nil
		end

		local toRemove = {}

		for i, ent in ipairs(SELECT_TABLE) do
			if not IsValid(ent) then
				table.insert(toRemove, i)
			end
		end

		for i, v in ipairs(toRemove) do
			table.remove(SELECT_TABLE, v - i + 1)
		end
	end

	local Receivers = {
		select_main = function()
			local new = net.ReadEntity()
			if not IsValid(new) then return end

			if new ~= SELECTED_ENTITY then
				SELECTED_ENTITY = new
				GTools.ChatPrint('Primary Entity selected')
			else
				SELECTED_ENTITY = nil
				GTools.ChatPrint('Primary Entity unselected')
			end

			for i, ent in ipairs(SELECT_TABLE) do
				if ent == new then
					table.remove(SELECT_TABLE, i)
				end
			end
		end,

		select = function()
			local read = net.ReadEntity()

			if not IsValid(read) then return end

			for i, ent in ipairs(SELECT_TABLE) do
				if ent == read then
					table.remove(SELECT_TABLE, i)
					return
				end
			end

			if read == SELECTED_ENTITY then
				SELECTED_ENTITY = nil
				GTools.ChatPrint('Primary Entity unselected')
			end

			table.insert(SELECT_TABLE, read)
		end,

		multi = function()
			GTools.GenericMultiselectReceive(SELECT_TABLE, vars)
		end,

		clear = function()
			SELECTED_ENTITY = nil
			SELECT_TABLE = {}

			GTools.ChatPrint('Selection Cleared')
		end,

		paste = function()
			GTools.ChatPrint('Selection is about to be applied!')

			ClearSelectedItems()

			net.Start(CURRENT_TOOL_MODE .. '.action')

			net.WriteString('paste')
			net.WriteEntity(SELECTED_ENTITY)

			net.WriteUInt(#SELECT_TABLE, 12)

			for k, v in ipairs(SELECT_TABLE) do
				net.WriteEntity(v)
			end

			net.SendToServer()

			if vars.deselect:GetBool() then
				SELECTED_ENTITY = nil
				SELECT_TABLE = {}
			end
		end,
	}

	net.Receive('' .. CURRENT_TOOL_MODE .. '.action', function()
		Receivers[net.ReadString()]()
	end)

	hook.Add('PostDrawTranslucentRenderables', CURRENT_TOOL_MODE, function(a, b)
		if a or b then return end

		if vars.display_mode:GetBool() then
			if not LocalPlayer():IsValid() then return end
			local wep = LocalPlayer():GetActiveWeapon()
			if not wep:IsValid() then return end

			if wep:GetClass() ~= 'gmod_tool' then return end
			if wep:GetMode() ~= CURRENT_TOOL_MODE then return end
		end

		ClearSelectedItems()

		local symmAngle

		if IsValid(SELECTED_ENTITY) then
			local select_red = vars.select_r:GetInt() / 255
			local select_green = vars.select_g:GetInt() / 255
			local select_blue = vars.select_b:GetInt() / 255
			render.SetColorModulation(select_red, select_green, select_blue)
			SELECTED_ENTITY:DrawModel()

			local pos, ang = SELECTED_ENTITY:GetPos(), SELECTED_ENTITY:GetAngles()
			local mins, maxs = SELECTED_ENTITY:OBBMins(), SELECTED_ENTITY:OBBMaxs()

			local deltaX = maxs.x - mins.x
			local deltaZ = maxs.z - mins.z

			local newAng = Angle(vars.angle_p:GetInt() + ang.p, vars.angle_y:GetInt() + ang.y, vars.angle_r:GetInt() + ang.r)
			symmAngle = Angle(newAng.p, newAng.y, newAng.r)
			newAng:Normalize()

			newAng:RotateAroundAxis(newAng:Right(), 90)
			newAng:RotateAroundAxis(newAng:Forward(), 90)
			newAng:RotateAroundAxis(newAng:Up(), 90)

			local Add = Vector(-deltaX * 1.5, deltaZ * .5, 0)
			Add:Rotate(newAng)

			local select3_red = vars.select3_r:GetInt()
			local select3_green = vars.select3_g:GetInt()
			local select3_blue = vars.select3_b:GetInt()

			cam.Start3D2D(pos + Add, newAng, 3)

			surface.SetDrawColor(select3_red, select3_green, select3_blue)
			surface.DrawRect(0, 0, deltaX, deltaZ * .5)

			cam.End3D2D()
		end

		local select_red = vars.select2_r:GetInt() / 255
		local select_green = vars.select2_g:GetInt() / 255
		local select_blue = vars.select2_b:GetInt() / 255

		local toMirror = {}

		local obey = vars.ghost_obey_colors:GetBool()

		for k, ent in ipairs(SELECT_TABLE) do
			local col = ent:GetColor()
			local nonDefaultCol = col.r ~= 255 or col.g ~= 255 or col.b ~= 255

			if not nonDefaultCol or not obey then
				render.SetColorModulation(select_red, select_green, select_blue)
				ent:DrawModel()
			end

			table.insert(toMirror, {ent:GetPos(), ent:GetAngles()})
		end

		if IsValid(SELECTED_ENTITY) then
			local get = SymmetryPositions(toMirror, SELECTED_ENTITY:GetPos(), symmAngle)

			render.SetColorModulation(select_red, select_green, select_blue)
			render.SetBlend(0.7 + math.sin(CurTimeL() * 3) * .1)

			for i, v in ipairs(get) do
				local ent = SELECT_TABLE[i]
				local ent2 = GetEntityDummy(ent)
				local mat = ent:GetMaterial()
				local col = ent:GetColor()

				ent2:SetPos(v[1])
				ent2:SetAngles(v[2])
				ent2:SetMaterial(mat)

				local nonDefaultCol = col.r ~= 255 or col.g ~= 255 or col.b ~= 255

				if nonDefaultCol and obey then
					render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
				end

				ent2:DrawModel()

				if nonDefaultCol and obey then
					render.SetColorModulation(select_red, select_green, select_blue)
				end
			end
		end

		render.SetColorModulation(1, 1, 1)
	end)
else
	net.Receive(CURRENT_TOOL_MODE .. '.action', function(len, ply)
		local mode = net.ReadString()

		if mode == 'paste' then
			Request(ply)
		end
	end)
end

function TOOL:LeftClick(tr)
	if not self:GetOwner():KeyDown(IN_USE) then
		if not CanUse(self:GetOwner(), tr.Entity) then return false end
	end

	if SERVER then
		if not self:GetOwner():KeyDown(IN_USE) then
			net.Start('sym_clone.action')
			net.WriteString('select')
			net.WriteEntity(tr.Entity)
			net.Send(self:GetOwner())
		else
			net.Start('sym_clone.action')
			net.WriteString('multi')

			local get = self:SelectEntities(tr)

			GTools.WriteEntityList(get)

			net.Send(self:GetOwner())
		end
	end

	return true
end

function TOOL:RightClick(tr)
	self:GetSWEP().SymmLastRightClick = self:GetSWEP().SymmLastRightClick or CurTimeL()
	if self:GetSWEP().SymmLastRightClick > CurTimeL() then
		if SERVER then
			GTools.PChatPrint(self:GetOwner(), 'Stop spamming!')
		end

		return false
	end

	self:GetSWEP().SymmLastRightClick = CurTimeL() + 2

	if not self:GetOwner():KeyDown(IN_USE) then
		if not CanUse(self:GetOwner(), tr.Entity) then return false end
	end

	if SERVER then
		if not self:GetOwner():KeyDown(IN_USE) then
			net.Start('sym_clone.action')
			net.WriteString('select_main')
			net.WriteEntity(tr.Entity)
			net.Send(self:GetOwner())
		else
			net.Start('sym_clone.action')
			net.WriteString('paste')
			net.Send(self:GetOwner())
		end
	end

	return true
end

function TOOL:Reload(tr)
	if SERVER then
		net.Start('sym_clone.action')
		net.WriteString('clear')
		net.Send(self:GetOwner())
	end

	return true
end
