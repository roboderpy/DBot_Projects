
--
-- Copyright (C) 2017 DBot
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

SWEP.Base = 'dbot_tf_melee'
SWEP.Author = 'DBot'
SWEP.Category = 'TF2'
SWEP.PrintName = 'Wrench'
SWEP.ViewModel = 'models/weapons/v_models/v_wrench_engineer.mdl'
SWEP.WorldModel = 'models/weapons/w_models/w_wrench.mdl'
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.MissSoundsScript = 'Weapon_Wrench.Miss'
SWEP.MissCritSoundsScript = 'Weapon_Wrench.MissCrit'
SWEP.HitSoundsScript = 'Weapon_Wrench.HitWorld'
SWEP.HitSoundsFleshScript = 'Weapon_Wrench.HitFlesh'

SWEP.DrawHUD = =>
    DTF2.DrawMetalCounter()

SWEP.OnHit = (hitEntity = NULL, tr = {}, dmginfo) =>
    return @BaseClass.OnHit(@, hitEntity, tr, dmginfo) if not hitEntity.IsTF2Building
    return if CLIENT

    if not hitEntity\IsAlly(@GetOwner())
        SuppressHostEvents(NULL) if @suppressing
        @BaseClass.OnHit(@, hitEntity, tr, dmginfo)
        SuppressHostEvents(@GetOwner()) if @suppressing
        return

    dmginfo\SetDamage(0)
    dmginfo\SetDamageType(0)
    amount = hitEntity\SimulateRepair(@GetOwner()\GetTF2Metal())
    if amount > 0
        @GetOwner()\SimulateTF2MetalRemove(amount)
        @EmitSoundServerside('Weapon_Wrench.HitBuilding_Success')
    else
        @EmitSoundServerside('Weapon_Wrench.HitBuilding_Failure')