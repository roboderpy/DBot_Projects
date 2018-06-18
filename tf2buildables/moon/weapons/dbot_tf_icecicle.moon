
--
-- Copyright (C) 2017-2018 DBot
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

AddCSLuaFile()

DEFINE_BASECLASS('dbot_tf_knife')

SWEP.Base = 'dbot_tf_knife'
SWEP.Author = 'DBot'
SWEP.Category = 'TF2 Spy'
SWEP.PrintName = 'Spy-Cicle'
SWEP.ViewModel = 'models/weapons/c_models/c_spy_arms.mdl'
SWEP.WorldModel = 'models/weapons/c_models/c_xms_cold_shoulder/c_xms_cold_shoulder.mdl'
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false
SWEP.RandomCriticals = false

SWEP.MissSoundsScript = 'Weapon_Knife.Miss'
SWEP.MissCritSoundsScript = 'Weapon_Knife.MissCrit'
SWEP.HitSoundsScript = 'Icicle.HitWorld'
SWEP.HitSoundsFleshScript = 'Icicle.HitFlesh'
SWEP.ICE_SOUND = 'DTF2_Icicle.TurnToIce'
SWEP.MELT_SOUND = 'DTF2_Icicle.Melt'
SWEP.SILENT_CRITS = true

SWEP.DrawAnimation = 'eternal_draw'
SWEP.IdleAnimation = 'eternal_idle'
SWEP.AttackAnimation = 'eternal_stab_a'
SWEP.AttackAnimationTable = {'eternal_stab_a', 'eternal_stab_b'}
SWEP.AttackAnimationCrit = 'eternal_stab_c'

SWEP.BackstabAnimation = 'eternal_backstab'
SWEP.BackstabAnimationUp = 'eternal_backstab_up'
SWEP.BackstabAnimationDown = 'eternal_backstab_down'
SWEP.BackstabAnimationIdle = 'eternal_backstab_idle'

SWEP.MELT_RESTORE = 15
SWEP.MELT_IMMUNITY = 4

SWEP.Initialize = =>
	BaseClass.Initialize(@)
	@meltImmunity = 0

SWEP.SetupDataTables = =>
	BaseClass.SetupDataTables(@)
	@NetworkVar('Float', 4, 'MeltTimer')
	@SetMeltTimer(0)

SWEP.PrimaryAttack = =>
	return false if @GetMeltTimer() > CurTime()
	return BaseClass.PrimaryAttack(@)

SWEP.OnHit = (hitEntity = NULL, tr = {}, dmginfo) =>
	if IsValid(hitEntity) and SERVER and @isOnBack
		hitEntity\EmitSound(@ICE_SOUND)
		if not hitEntity\IsPlayer()
			hitEntity\SetMaterial('models/player/shared/ice_player')
			with r = DTF2.CreateDeathRagdoll(hitEntity)
				\SetMaterial('models/player/shared/ice_player')
				DTF2.MakeStatue(r)
	BaseClass.OnHit(@, hitEntity, tr, dmginfo)

if SERVER
	SWEP.MeltDown = =>
		@SetMeltTimer(CurTime() + DTF2.GrabFloat(@MELT_RESTORE))
		@meltImmunity = CurTime() + DTF2.GrabFloat(@MELT_IMMUNITY)
		@SetHideVM(true)
		timer.Simple DTF2.GrabFloat(@MELT_RESTORE), -> @SetHideVM(false) if @IsValid()
		@EmitSound(@MELT_SOUND)
	
	hook.Add 'DTF2.BurnTarget', 'DTF2.Spycicle', =>
		return if not @GetWeapon
		wep = @GetWeapon('dbot_tf_icecicle')
		return if not IsValid(wep)
		return false if wep.meltImmunity > CurTime()
		return if wep\GetMeltTimer() > CurTime()
		wep\MeltDown()
		return false
else
	SWEP.DrawHUD = => DTF2.DrawCenteredBar(math.Clamp(1 - (@GetMeltTimer() - CurTime()) / DTF2.GrabFloat(@MELT_RESTORE), 0, 1), 'Cicle')
