
-- Copyright (C) 2017-2019 DBotThePony

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


local weaponrystats = weaponrystats
local weaponMeta = FindMetaTable('Weapon')
local entMeta = FindMetaTable('Entity')
local IN_CALL = false
local ENABLE_PHYSICAL_BULLETS = CreateConVar('sv_physbullets', '1', {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Enable physical bullets')
local ENABLE_PHYSICAL_BULLETS_ALL = CreateConVar('sv_physbullets_all', '1', {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Enable physical bullets for all entities')
local PHYSICAL_SPREAD = CreateConVar('sv_physbullets_spread', '1', {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Physical bullets spread multiplier')
local DISABLE_TRACERS, NO_TURRET_SPREAD

if CLIENT then
	DISABLE_TRACERS = CreateConVar('sv_physbullets_tracers', '0', {FCVAR_ARCHIVE}, 'Enable default tracers for bullets')
end

if SERVER then
	NO_TURRET_SPREAD = CreateConVar('sv_turret_nospread', '1', {FCVAR_ARCHIVE}, 'No spread of turret bullets')
end

weaponrystats.SKIP_NEXT = false

local HL2WEP_MAPPING = DLib.hl2wdata

local perEntityBullets = {
	weapon_357 = 'dbot_bullet_357',
	weapon_ar2 = 'dbot_bullet_pulse',
	npc_turret_floor = 'dbot_bullet_combined',
	npc_turret_ceiling = 'dbot_bullet_combined',
	npc_combinegunship = 'dbot_bullet_copter',
	npc_helicopter = 'dbot_bullet_copter',
	npc_strider = 'dbot_bullet_copter',
	weapon_shotgun = 'dbot_bullet_capercaillie',
}

local function EntityFireBullets(self, bulletData)
	if not weaponrystats.ENABLED:GetBool() then return end
	if IN_CALL then return end

	if weaponrystats.SKIP_NEXT then
		weaponrystats.SKIP_NEXT = false
		return
	end

	if self.IS_BULLET then return end

	-- hl2 weapons fuckedup
	-- if (type(self) ~= 'Weapon' and type(self) ~= 'Player') and type(bulletData.Attacker) == 'Player' then return end

	local findWeapon, findOwner

	bulletData.Attacker = IsValid(bulletData.Attacker) and bulletData.Attacker or self

	if type(self) == 'Player' or type(self) == 'NPC' then
		findOwner = self
		findWeapon = self:GetActiveWeapon()

		if not IsValid(findWeapon) then
			findWeapon = findOwner
		end
	elseif type(self) == 'Weapon' then
		findWeapon = self
		findOwner = self:GetOwner()
	elseif type(bulletData.Attacker) == 'Player' or type(bulletData.Attacker) == 'NPC' then
		findOwner = bulletData.Attacker

		if type(self) == 'Entity' or self == bulletData.Attacker then
			findWeapon = self
		else
			findWeapon = bulletData.Attacker:GetActiveWeapon()

			if not IsValid(findWeapon) then
				findWeapon = findOwner
			end
		end
	else
		findWeapon = self
		findOwner = self
	end

	local sClass = findOwner:GetClass()
	local wclass

	if SERVER and NO_TURRET_SPREAD:GetBool() and (sClass == 'npc_turret_floor' or sClass == 'npc_turret_ceiling') then
		bulletData.Spread = Vector(0, 0, 0)
	end

	bulletData.Spread = bulletData.Spread or Vector(0, 0, 0)
	bulletData.Distance = bulletData.Distance or 56756
	bulletData.Num = bulletData.Num or 1
	bulletData.Force = bulletData.Force or 1
	bulletData.Damage = bulletData.Damage or 1
	bulletData.IgnoreEntity = bulletData.IgnoreEntity or {}

	if type(bulletData.IgnoreEntity) ~= 'table' then
		bulletData.IgnoreEntity = {bulletData.IgnoreEntity}
	end

	local modif, wtype

	if IsValid(findWeapon) and IsValid(findOwner) and type(findWeapon) == 'Weapon' then
		modif, wtype = findWeapon:GetWeaponModification(), findWeapon:GetWeaponType()
		wclass = findWeapon:GetClass()

		local hl2 = HL2WEP_MAPPING[wclass]

		if hl2 then
			bulletData.Damage = hl2.damage
			bulletData.PhysDamageType = hl2.dtype
		end
	end

	if not modif or not wtype then
		if ENABLE_PHYSICAL_BULLETS:GetBool() and ENABLE_PHYSICAL_BULLETS_ALL:GetBool() and bulletData.Distance > 1024 and not weaponrystats.blacklisted:has(wclass) then
			if CLIENT then return false end

			for i = 1, bulletData.Num do
				local spreadPos = DLib.util.randomVector(bulletData.Spread.x, bulletData.Spread.x, bulletData.Spread.y) * PHYSICAL_SPREAD:GetInt() * 0.65

				local trData = {
					start = bulletData.Src,
					endpos = bulletData.Src + (bulletData.Dir + spreadPos) * bulletData.Distance,
					filter = self
				}

				local tr = util.TraceLine(trData)

				local ent = ents.Create(perEntityBullets[findWeapon:GetClass()] or 'dbot_physbullet')
				ent:SetBulletCallback(bulletData.Callback)
				local copied = table.Copy(bulletData)
				copied.Num = 1
				copied.Tracer = 0
				ent:SetBulletData(copied)
				ent:SetInitialTrace(tr)
				ent:SetupBulletData(bulletData, self)
				ent:SetDirection(bulletData.Dir + spreadPos)
				ent:SetInflictor(self)
				ent:SetInitialEntity(self)
				ent:SetDamageType(DMG_BULLET)
				ent:SetOwner(findOwner)
				if IsValid(findOwner) and findOwner.GetVelocity then ent:SetInitialVelocity(findOwner:GetVelocity() or Vector(0, 0, 0)) end
				ent:Spawn()
				ent:Activate()
				ent:SetOwner(findOwner)
				ent:Think()
			end

			return false
		end

		return
	end

	findWeapon.weaponrystats_bullets = CurTimeL()

	do
		local oldCallback = bulletData.Callback

		bulletData.Spread = (bulletData.Spread + wtype.scatterAdd) * wtype.scatter
		bulletData.Distance = math.ceil(bulletData.Distance * wtype.dist)
		bulletData.Num = math.max(math.floor((bulletData.Num + wtype.numAdd) * wtype.num), 1)

		if wtype.isAdditional then
			function bulletData.Callback(attacker, tr, dmginfo, ...)
				if IsValid(tr.Entity) and SERVER then
					local newDMG = dmginfo:Copy()
					newDMG:SetDamage(dmginfo:GetDamage() * (wtype.damage or 1))
					newDMG:SetMaxDamage(dmginfo:GetMaxDamage() * (wtype.damage or 1))
					newDMG:SetDamageType(wtype.dmgtype)
					tr.Entity:TakeDamageInfo(newDMG)
				end

				if oldCallback then oldCallback(attacker, tr, dmginfo, ...) end
			end
		else
			bulletData.Damage = bulletData.Damage * wtype.damage
			bulletData.Force = bulletData.Force * wtype.force

			function bulletData.Callback(attacker, tr, dmginfo, ...)
				dmginfo:SetDamageType(bit.bor(dmginfo:GetDamageType(), wtype.dmgtype))
				if oldCallback then oldCallback(attacker, tr, dmginfo, ...) end
			end
		end
	end

	bulletData.Damage = (bulletData.Damage or 1) * (modif.damage or 1)
	bulletData.Force = (bulletData.Force or 1) * (modif.force or 1)

	if CLIENT or not ENABLE_PHYSICAL_BULLETS:GetBool() or bulletData.Distance < 1024 or weaponrystats.blacklisted:has(wclass) then
		if CLIENT and not DISABLE_TRACERS:GetBool() and bulletData.Distance > 1024 and ENABLE_PHYSICAL_BULLETS:GetBool() then return false end
		return true
	else
		for i = 1, bulletData.Num do
			local spreadPos = DLib.util.randomVector(bulletData.Spread.x, bulletData.Spread.x, bulletData.Spread.y) * PHYSICAL_SPREAD:GetInt() * 0.65

			local trData = {
				start = bulletData.Src,
				endpos = bulletData.Src + (bulletData.Dir + spreadPos) * bulletData.Distance,
				filter = self
			}

			local tr = util.TraceLine(trData)

			local bulletType = wtype.bullet or 'dbot_physbullet'
			if bulletType == 'dbot_physbullet' then
				bulletType = perEntityBullets[findWeapon:GetClass()] or 'dbot_physbullet'
			end

			local ent = ents.Create(bulletType)
			ent:SetBulletCallback(bulletData.Callback)
			local copied = table.Copy(bulletData)
			copied.Num = 1
			copied.Tracer = 0
			ent:SetBulletData(copied)
			ent:SetInitialTrace(tr)
			ent:SetSpeedModifier(modif.bulletSpeed * wtype.bulletSpeed)
			ent:SetRicochetModifier(modif.bulletRicochet * wtype.bulletRicochet)
			ent:SetPenetrationModifier(modif.bulletPenetration * wtype.bulletPenetration)
			ent:SetDirection(bulletData.Dir + spreadPos)
			ent:SetupBulletData(bulletData, self)
			ent:SetInflictor(self)
			ent:SetInitialEntity(self)
			ent:SetReportedPosition(bulletData.Src)
			ent:SetDamagePosition(nil)
			ent:SetDamageType(DMG_BULLET)
			if IsValid(findOwner) and findOwner.GetVelocity then ent:SetInitialVelocity(findOwner:GetVelocity() or Vector(0, 0, 0)) end
			ent:SetOwner(findOwner)
			ent:Spawn()
			ent:Activate()
			ent:SetOwner(findOwner)
			ent:Think()
		end

		return false
	end
end

entMeta.weaponrystats_FireBullets = entMeta.weaponrystats_FireBullets or entMeta.FireBullets

function entMeta:FireBullets(bulletData, ...)
	-- IN_CALL = true
	-- kill stupid gmod behaviour
	-- local status = hook.Run('EntityFireBullets', self, bulletData)
	-- IN_CALL = false
	-- if status == false then return end
	if EntityFireBullets(self, bulletData) == false then return end
	weaponrystats.SKIP_NEXT = true
	return entMeta.weaponrystats_FireBullets(self, bulletData, ...)
end

weaponrystats.EntityFireBullets = EntityFireBullets
weaponMeta.weaponrystats_SetNextPrimaryFire = weaponMeta.weaponrystats_SetNextPrimaryFire or weaponMeta.SetNextPrimaryFire
weaponMeta.weaponrystats_SetNextSecondaryFire = weaponMeta.weaponrystats_SetNextSecondaryFire or weaponMeta.SetNextSecondaryFire

function weaponMeta:SetNextPrimaryFire(time)
	if not weaponrystats.ENABLED:GetBool() then return weaponMeta.weaponrystats_SetNextPrimaryFire(self, time) end
	local delta = time - CurTimeL()

	if delta > 0 then
		local modif, wtype = self:GetWeaponModification(), self:GetWeaponType()

		if modif and modif.speed then
			delta = delta / modif.speed
		end

		if wtype and wtype.speed then
			delta = delta / wtype.speed
		end

		time = CurTimeL() + delta
	end

	return weaponMeta.weaponrystats_SetNextPrimaryFire(self, time)
end

function weaponMeta:SetNextSecondaryFire(time)
	if not weaponrystats.ENABLED:GetBool() then return weaponMeta.weaponrystats_SetNextSecondaryFire(self, time) end
	local delta = time - CurTimeL()

	if delta > 0 then
		local modif, wtype = self:GetWeaponModification(), self:GetWeaponType()

		if modif and modif.speed then
			delta = delta / modif.speed
		end

		if wtype and wtype.speed then
			delta = delta / wtype.speed
		end

		time = CurTimeL() + delta
	end

	return weaponMeta.weaponrystats_SetNextSecondaryFire(self, time)
end

hook.Add('EntityFireBullets', 'WeaponryStats.EntityFireBullets', EntityFireBullets)
