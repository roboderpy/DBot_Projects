
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

local CURRENT_TOOL_MODE = 'adv_remover'
local CURRENT_TOOL_MODE_VARS = CURRENT_TOOL_MODE .. '_'

TOOL.Name = 'Advanced Remover'
TOOL.Category = 'Construction'

if SERVER then
	util.AddNetworkString(CURRENT_TOOL_MODE .. '.select')
	util.AddNetworkString(CURRENT_TOOL_MODE .. '.apply')
	util.AddNetworkString(CURRENT_TOOL_MODE .. '.clear')
	util.AddNetworkString(CURRENT_TOOL_MODE .. '.mselect')
else
	language.Add('tool.' .. CURRENT_TOOL_MODE .. '.name', TOOL.Name)
	language.Add('tool.' .. CURRENT_TOOL_MODE .. '.desc', 'Select and Remove')
	language.Add('tool.' .. CURRENT_TOOL_MODE .. '.0', '')

	language.Add('tool.' .. CURRENT_TOOL_MODE .. '.left', 'Select or Deselect')
	language.Add('tool.' .. CURRENT_TOOL_MODE .. '.left_use', 'Multiselect')
	language.Add('tool.' .. CURRENT_TOOL_MODE .. '.right', 'Remove marked entities')
	language.Add('tool.' .. CURRENT_TOOL_MODE .. '.reload', 'Clear selection')
end

TOOL.Information = {
	{name = 'left'},
	{name = 'left_use'},
	{name = 'right'},
	{name = 'reload'},
}

TOOL.ClientConVar = {
	select_r = 255,
	select_g = 0,
	select_b = 0,
}

GTools.AddAutoSelectConVars(TOOL.ClientConVar)

function TOOL.BuildCPanel(Panel)
	GTools.AutoSelectOptions(Panel, CURRENT_TOOL_MODE)
	GTools.GenericSelectPicker(Panel, CURRENT_TOOL_MODE)
end

local function CanUseEntity(ply, ent)
	return IsValid(ent) and
		not ent:IsPlayer() and
		not ent:GetNWBool('REMOVING') and
		(CLIENT or ent:GetPhysicsObject():IsValid()) and
		(CLIENT or ent:GetPhysicsObject() ~= game.GetWorld():GetPhysicsObject()) and
		(not ent:IsWeapon() or not ent:GetOwner():IsValid()) and
		(not ent.CPPICanTool or ent:CPPICanTool(ply, CURRENT_TOOL_MODE)) and
		(not ent.CPPICanTool or ent:CPPICanTool(ply, 'remover')) and
		ent:GetSolid() ~= SOLID_NONE and
		(CLIENT or not ent:CreatedByMap())
		-- hook.Run('CanTool', ply, {HitPos = ent:GetPos(), HitNormal = Vector(), Entity = ent}, CURRENT_TOOL_MODE)
end

function TOOL:CanUseEntity(ent)
	return CanUseEntity(self:GetOwner(), ent)
end

function TOOL:LeftClick(tr)
	if not self:CanUseEntity(tr.Entity) then return false end
	if CLIENT then return true end

	if not self:GetOwner():KeyDown(IN_USE) then
		net.Start(CURRENT_TOOL_MODE .. '.select')
		net.WriteEntity(tr.Entity)
		net.Send(self:GetOwner())
	else
		local get = GTools.GenericAutoSelect(self, tr)

		net.Start(CURRENT_TOOL_MODE .. '.mselect')
		GTools.WriteEntityList(get)
		net.Send(self:GetOwner())
	end

	return true
end

function TOOL:RightClick(tr)
	if CLIENT then return true end

	net.Start(CURRENT_TOOL_MODE .. '.apply')
	net.Send(self:GetOwner())
end

function TOOL:Reload(tr)
	if CLIENT then return true end

	net.Start(CURRENT_TOOL_MODE .. '.clear')
	net.Send(self:GetOwner())
end

local SELECTED = {}

if CLIENT then
	local cvar = {}

	for k, v in pairs(TOOL.ClientConVar) do
		cvar[k] = CreateConVar(CURRENT_TOOL_MODE_VARS .. k, tostring(v), {FCVAR_ARCHIVE, FCVAR_USERINFO}, '')
	end

	net.Receive(CURRENT_TOOL_MODE .. '.clear', function()
		SELECTED = {}
		GTools.ChatPrint('Selection cleared')
	end)

	net.Receive(CURRENT_TOOL_MODE .. '.apply', function()
		GTools.GenericTableClear(SELECTED)

		if #SELECTED == 0 then
			GTools.ChatPrint('Nothing to delete!')
			return
		end

		net.Start(CURRENT_TOOL_MODE .. '.apply')
		GTools.WriteEntityList(SELECTED)
		net.SendToServer()

		SELECTED = {}
		GTools.ChatPrint('Removing entities')
	end)

	net.Receive(CURRENT_TOOL_MODE .. '.select', function()
		local read = net.ReadEntity()
		if not IsValid(read) then return end

		for k, v in ipairs(SELECTED) do
			if v == read then
				table.remove(SELECTED, k)
				return
			end
		end

		table.insert(SELECTED, read)
	end)

	net.Receive(CURRENT_TOOL_MODE .. '.mselect', function()
		local read = GTools.ReadEntityList()

		for i, ent in ipairs(read) do
			local hit = false

			for k, old in ipairs(SELECTED) do
				if old == ent then
					if cvar.select_invert:GetBool() then
						table.remove(SELECTED, k)
					end

					hit = true

					break
				end
			end

			if not hit then
				table.insert(SELECTED, ent)
			end
		end

		GTools.ChatPrint('Auto selected ' .. #read .. ' entities!')

		if cvar.select_print:GetBool() then
			GTools.ChatPrint('Look into console for list')

			for k, v in ipairs(read) do
				GTools.Message(color_white, tostring(v), GTools.Grey, ', class ', color_white, v:GetClass())
			end
		end
	end)

	hook.Add('PostDrawWorldToolgun', CURRENT_TOOL_MODE, function(ply, weapon, mode)
		if mode ~= CURRENT_TOOL_MODE then return end

		GTools.GenericTableClear(SELECTED)

		local r = cvar.select_r:GetInt() / 255
		local g = cvar.select_g:GetInt() / 255
		local b = cvar.select_b:GetInt() / 255

		for i, ent in ipairs(SELECTED) do
			render.SetColorModulation(r, g, b)
			ent:DrawModel()
		end

		render.SetColorModulation(1, 1, 1)
	end)
else
	net.Receive(CURRENT_TOOL_MODE .. '.apply', function(len, ply)
		local SELECTED = GTools.ReadEntityList()
		local rem = {}

		for i, ent in ipairs(SELECTED) do
			if CanUseEntity(ply, ent) then
				local data = EffectData()
				data:SetOrigin(ent:GetPos())
				data:SetEntity(ent)
				util.Effect('entity_remove', data, true, true)

				ent:SetSolid(SOLID_NONE)
				ent:SetMoveType(MOVETYPE_NONE)
				ent:SetNoDraw(true)
				ent:SetNWBool('REMOVING', true)

				table.insert(rem, ent)
			end
		end

		timer.Simple(1, function()
			for i, ent in ipairs(rem) do
				if IsValid(ent) then
					ent:Remove()
				end
			end
		end)
	end)
end
