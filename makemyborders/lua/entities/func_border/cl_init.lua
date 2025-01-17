
-- Copyright (C) 2018-2019 DBotThePony

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


include('shared.lua')

local ipairs = ipairs
local render = render
local LocalPlayer = LocalPlayer
local Vector = Vector
local math = math
local color_white = color_white
local cam = cam
local type = type
local EyePos = EyePos
local ents = ents
local IsValid = IsValid
local table = table
local DLib = DLib

local ENABLE_VISUAL_SPHERE = CreateConVar('cl_border_sphere', '1', {FCVAR_ARCHIVE}, 'Enable border "sphere" visuals')
local ENABLE_VISUALS = CreateConVar('cl_border_show', '1', {FCVAR_ARCHIVE}, 'Show borders')

ENT.ENABLE_VISUAL_SPHERE = ENABLE_VISUAL_SPHERE
ENT.ENABLE_VISUALS = ENABLE_VISUALS

local STENCIL_REPLACE = STENCIL_REPLACE
local STENCIL_KEEP = STENCIL_KEEP
local STENCIL_NOTEQUAL = STENCIL_NOTEQUAL
local STENCIL_EQUAL = STENCIL_EQUAL
local STENCIL_INCR = STENCIL_INCR
local STENCIL_INCRSAT = STENCIL_INCRSAT
local STENCIL_LESSEQUAL = STENCIL_LESSEQUAL

function ENT:SetupRenderVariables()
	self.blend = 100
	self.colorIfPass = Color(66, 217, 87)
	self.colorIfBlock = Color(218, 127, 127)
	self.colorIfInactive = Color(138, 169, 128)
end

function ENT:CInitialize()
	self:SetupRenderVariables()
	self:MarkShadowAsDirty()
	self:DestroyShadow()
	self.setupRenderBounds = false
end

function ENT:RegisterNWWatcher(varName, callback)
	table.insert(self.collisionRules, {varName, self['Get' .. varName](self), self['Get' .. varName], callback})
end

function ENT:CThink()
	for i, data in ipairs(self.collisionRules) do
		local new = data[3](self)

		if new ~= data[2] then
			data[4](self, data[1], data[2], new)
			data[2] = new
		end
	end

	self.colorIfBlock.a = self.blend
	self.colorIfPass.a = self.blend
	self.colorIfInactive.a = self.blend

	if not self.setupRenderBounds then
		self:UpdateBounds()
	end
end

function ENT:UpdateBounds()
	self.setupRenderBounds = true
	local mins = Vector(self:GetCollisionMins())
	local maxs = Vector(self:GetCollisionMaxs())

	local X = math.max(mins.x, maxs.x, maxs.x - mins.x)
	local Y = math.max(mins.y, maxs.y, maxs.y - mins.y)
	local Z = math.max(mins.z, maxs.z, maxs.z - mins.z)
	self:SetRenderBounds(Vector(-X, -Y, -Z), Vector(X, Y, Z))
	self.sphereCheckSize = math.max(X, Y, Z)
end

local white = CreateMaterial('func_border_stencil', 'UnlitGeneric', {
	['$basetexture'] = 'models/debug/debugwhite',
	['$color'] = '1 1 1',
	['$alpha'] = '0'
})

function ENT:FindPassEntity()
	local ply = LocalPlayer()
	local veh = ply:GetVehicle()

	if IsValid(veh) then
		return veh
	end

	return ply
end

function ENT:FindEntities()
	local ply = LocalPlayer()
	local output = {ply}
	local veh = ply:GetVehicle()

	if IsValid(veh) then
		table.insert(output, veh)
	end

	return output
end

function ENT:actuallyDraw(pos, widths, heights, normal, rotate, entsFound, W, H, ang)
	render.SetMaterial(white)
	render.SetStencilEnable(true)
	render.ClearStencil()

	render.SetStencilReferenceValue(1)
	render.SetStencilWriteMask(1)
	render.SetStencilTestMask(1)

	render.SetStencilPassOperation(STENCIL_INCRSAT)
	render.SetStencilFailOperation(STENCIL_KEEP)
	render.SetStencilZFailOperation(STENCIL_KEEP)

	render.SetStencilCompareFunction(STENCIL_NOTEQUAL)
	render.OverrideColorWriteEnable(true, false)

	render.DrawQuadEasy(pos, normal, W, H, color_white, 0)

	if ENABLE_VISUAL_SPHERE:GetBool() then
		render.SetStencilCompareFunction(STENCIL_LESSEQUAL)

		cam.IgnoreZ(true)
		local clipState = render.EnableClipping(true)
		local dist = normal:Dot(pos)

		render.PushCustomClipPlane(normal, dist)
		render.CullMode(1)

		for i, ent in ipairs(entsFound) do
			if type(ent) == 'Player' then
				render.DrawSphere(ent:EyePos(), self.sphereCheckSize * 0.75, 50, 50, color_white)
			elseif type(ent) == 'Vehicle' then
				if type(ent:GetDriver()) == 'Player' then
					render.DrawSphere(ent:EyePos(), self.sphereCheckSize * 1.4, 50, 50, color_white)
				else
					render.DrawSphere(ent:EyePos(), self.sphereCheckSize * 0.4, 50, 50, color_white)
				end
			elseif type(ent) == 'Entity' then
				render.DrawSphere(ent:EyePos(), self.sphereCheckSize * 0.3, 50, 50, color_white)
			else
				render.DrawSphere(ent:EyePos(), self.sphereCheckSize * 0.15, 50, 50, color_white)
			end
		end

		render.CullMode(0)
		render.PopCustomClipPlane()
		render.EnableClipping(clipState)
		cam.IgnoreZ(false)
	end

	render.OverrideColorWriteEnable(false)

	render.SetStencilCompareFunction(STENCIL_EQUAL)
	render.SetMaterial(FUNC_BORDER_TEXTURE)

	for i = -widths - 1, widths do
		for i2 = -heights - 1, heights do
			local add = Vector(0, i * 128, i2 * 128)
			add:Rotate(ang)

			render.DrawQuadEasy(pos + add, normal, 128, 128, color, rotate)
		end
	end

	render.ClearStencil()
	render.SetStencilEnable(false)
end

function ENT:GetDrawColor()
	local color

	if self:IsEnabled() then
		local toPass = self:FindPassEntity()
		local allowedToPass = self:AllowObjectPass(toPass, false)
		color = allowedToPass and self.colorIfPass or self.colorIfBlock

		if allowedToPass and not self:DrawIfCanPass() then
			return color, true
		end
	else
		color = self.colorIfInactive

		if not self:DrawIfCanPass() then
			return color, true
		end
	end

	return color, false
end

function ENT:Draw()
	if not self:ShowVisuals() or not self:ShowVisualBorder() then return end
	if not ENABLE_VISUALS:GetBool() then return end
	local pos = self:GetRenderOrigin() or self:GetPos()
	if EyePos():Distance(pos) > self.sphereCheckSize * 1.5 then return end
	local ang = self:GetRenderAngles() or self:GetRealAngle() or self:GetAngles()

	local mins = self:GetCollisionMins()
	local maxs = self:GetCollisionMaxs()

	local color, nodraw = self:GetDrawColor()
	if nodraw then return end

	FUNC_BORDER_TEXTURE:SetVector('$color', color:ToVector())
	FUNC_BORDER_TEXTURE:SetFloat('$alpha', color.a / 255)

	local W = maxs.x - mins.x
	local H = maxs.z - mins.z
	local cPos = DLib.vector.Centre(mins, maxs)
	cPos:Rotate(ang)
	pos = pos + cPos

	local widths = math.max(math.floor(W / 256), 1)
	local heights = math.max(math.floor(H / 256), 1)

	local entsFound = self:FindEntities()

	local ang2 = Angle(ang)
	ang2.y = ang2.y - 90

	self:actuallyDraw(pos, widths, heights, ang:Right() * -1, 180, entsFound, W, H, ang2)
	self:actuallyDraw(pos, widths, heights, ang:Right(), 0, entsFound, W, H, ang2)
end
