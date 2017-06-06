
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

AddCSLuaFile()

SWEP.Base = 'dbot_tf_melee'
SWEP.Author = 'DBot'
SWEP.Category = 'TF2 Medic'
SWEP.PrintName = 'Bonesaw'
SWEP.ViewModel = 'models/weapons/c_models/c_medic_arms.mdl'
SWEP.WorldModel = 'models/weapons/c_models/c_bonesaw/c_bonesaw.mdl'
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.MissSoundsScript = 'Weapon_BoneSaw.Miss'
SWEP.MissCritSoundsScript = 'Weapon_BoneSaw.MissCrit'
SWEP.HitSoundsScript = 'Weapon_BoneSaw.HitWorld'
SWEP.HitSoundsFleshScript = 'Weapon_BoneSaw.HitFlesh'

SWEP.DrawAnimation = 'bs_draw'
SWEP.IdleAnimation = 'bs_idle'
SWEP.AttackAnimation = 'bs_swing_a'
SWEP.AttackAnimationTable = {'bs_swing_a', 'bs_swing_b'}
SWEP.AttackAnimationCrit = 'bs_swing_c'
