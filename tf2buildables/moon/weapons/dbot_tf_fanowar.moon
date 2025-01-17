

--
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


AddCSLuaFile()

DEFINE_BASECLASS('dbot_tf_bat')

SWEP.Base = 'dbot_tf_bat'
SWEP.Author = 'DBot'
SWEP.Category = 'TF2 Scout'
SWEP.PrintName = "Fan O' War"
SWEP.ViewModel = 'models/weapons/c_models/c_scout_arms.mdl'
SWEP.WorldModel = 'models/weapons/c_models/c_shogun_warfan/c_shogun_warfan.mdl'
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false

SWEP.BulletDamage = 35 * .25

SWEP.PreOnHit = (hitEntity = NULL, tr = {}, dmginfo) =>
	@BaseClass.PreOnHit(@, hitEntity, tr, dmginfo)
	if IsValid(hitEntity) and hitEntity\IsMarkedForDeath()
		@ThatWasCrit(hitEntity, dmginfo)

	return if CLIENT
	if IsValid(hitEntity) and (hitEntity\IsNPC() or hitEntity\IsPlayer())
		if IsValid(@deathMark)
			if @deathMark\GetOwner() ~= hitEntity
				hitEntity\EmitSound('weapons/samurai/tf_marked_for_death_indicator.wav', 75, 100)
				@deathMark\SetupOwner(hitEntity)
			@deathMark\UpdateDuration(15)
			return
		@deathMark = ents.Create('dbot_tf_logic_mcreciever')
		with @deathMark
			\SetPos(tr.HitPos)
			\Spawn()
			\Activate()
			\SetupOwner(hitEntity)
			\UpdateDuration(15)
			\EmitSound('weapons/samurai/tf_marked_for_death_indicator.wav', 75, 100)