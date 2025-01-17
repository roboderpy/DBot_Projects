
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

AddCSLuaFile('cl_init.lua')

ENT.PrintName = 'DBot Rocket'
ENT.Author = 'DBot'
ENT.Type = 'anim'

function ENT:SetupDataTables()
	self:NetworkVar('Entity', 0, 'CurTarget')
end

function ENT:Initialize()
	self:SetModel('models/weapons/w_missile_closed.mdl')

	self.Expires = CurTimeL() + 8

	self:PhysicsInitSphere(8)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)

	local phys = self:GetPhysicsObject()
	phys:Wake()
	phys:EnableGravity(false)
	phys:EnableMotion(true)
	self.phys = phys

	util.SpriteTrail(self, 0, color_white, false, 10, 200, 5, 1 / (10 + 600) * 0.5, 'trails/smoke.vmt')
end

function ENT:Detonate()
	self.DETONATED = true
	util.BlastDamage(self, IsValid(self.SOwner) and self.SOwner or self, self:GetPos() + Vector(0, 0, 3), 128, 100)

	local effect = EffectData()
	effect:SetOrigin(self:GetPos())
	util.Effect('explosion', effect)

	self:Remove()
end

function ENT:Think()
	if self.Expires < CurTimeL() then
		self:Detonate()
		return
	end

	if not IsValid(self.ent) then self.phys:SetVelocity(self:GetAngles():Forward() * 1500) return end

	local dir = DSentry_GetEntityHitpoint(self.ent) - self:GetPos()
	dir:Normalize()

	self:SetAngles(dir:Angle())
	self.phys:SetVelocity(dir * 900)
end

function ENT:OnTakeDamage()
	if self.DETONATED then return end
	self:Detonate()
end

function ENT:PhysicsCollide(data)
	if self.DETONATED then return end
	if data.HitEntity == self.Ignore then return end
	self:Detonate()
end
