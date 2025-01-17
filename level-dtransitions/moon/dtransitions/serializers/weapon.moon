
-- Copyright (C) 2019 DBot

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

import NBT from DLib
import luatype from _G

class DTransitions.WeaponSerializer extends DTransitions.AbstractSerializer
	@SAVENAME = 'weapons'

	CanSerialize: (ent) => ent\IsWeapon()
	GetPriority: => 900

	Serialize: (ent) =>
		tag = super(ent)
		owner = ent\GetOwner()

		if IsValid(owner)
			tag\SetInt('weapon_owner', @saveInstance\GetEntityID(owner))
			tag\SetString('player_owner', owner\SteamID()) if owner\IsPlayer()

		tag\SetShort('clip1', ent\Clip1())
		tag\SetShort('clip2', ent\Clip2())
		tag\SetString('holdtype', ent\GetHoldType())

		tag2 = @SerializeGNetVars(ent)
		tag\SetTag('dt', tag2) if tag2

		return tag

	DeserializePost: (ent, tag) =>
		@DeserializeGNetVars(ent, tag\GetTag('dt'), false)
		super(ent, tag)

	DeserializeMiddle: (ent, tag) =>
		return if not tag\HasTag('weapon_owner')
		npc = @saveInstance\GetEntity(tag\GetTagValue('weapon_owner'))
		return if not IsValid(npc)
		ent = npc\Give(tag\GetTagValue('classname'))
		return if not IsValid(ent)

		@DeserializeGeneric(ent, tag, false)
		@DeserializeCombatState(ent, tag)

		ent\SetModelScale(tag\GetTagValue('model_scale')) if tag\HasTag('model_scale')

		@DeserializeGNetVars(ent, tag\GetTag('dt'), true)

		return ent

	DeserializePre: (tag) =>
		if tag\HasTag('player_owner')
			ply = player.GetBySteamID(tag\GetTagValue('player_owner'))
			return if not ply
			ent = ply\Give(tag\GetTagValue('classname'), false)
			--ent = ents.Create(tag\GetTagValue('classname'))
			return if not IsValid(ent)

			@DeserializeGeneric(ent, tag, false)
			@DeserializeCombatState(ent, tag)

			ent\SetModelScale(tag\GetTagValue('model_scale')) if tag\HasTag('model_scale')

			ent\SetClip1(tag\GetTagValue('clip1'))
			ent\SetClip2(tag\GetTagValue('clip2'))
			ent\SetHoldType(tag\GetTagValue('holdtype'))

			@DeserializeGNetVars(ent, tag\GetTag('dt'), true)

			return ent

		return if tag\HasTag('weapon_owner')

		ent = super(tag)

		ent\SetClip1(tag\GetTagValue('clip1'))
		ent\SetClip2(tag\GetTagValue('clip2'))
		ent\SetHoldType(tag\GetTagValue('holdtype'))

		@DeserializeGNetVars(ent, tag\GetTag('dt'), true)

		return ent

class DTransitions.WeaponProjectilesSerializer extends DTransitions.AbstractSerializer
	@SAVENAME = 'weaponproj'

	@_HANDLE = {
		'crossbow_bolt'
		'prop_combine_ball'
		'grenade_ar2'
		'rpg_missile'
	}

	@HANDLE = {v, v for v in *@_HANDLE}

	@SAVETABLE_IGNORANCE = {
		'classname',
		'rendercolor',
		'renderfx',
		'rendermode',
		'waterlevel',
		'health',
		'max_health',
		'm_flTimePlayerStare',
		'm_flStopMoveShootTime',
		'm_vecOrigin',
	}

	CanSerialize: (ent) => @@HANDLE[ent\GetClass()] ~= nil
	GetPriority: => 50

	Serialize: (ent) =>
		tag = super(ent)
		return if not tag

		if sv = @SerializeSavetable(ent)
			tag\SetTag('savetable', sv)

		return tag

	DeserializePost: (ent, tag) =>
		super(ent, tag)
		@DeserializeKeyValues(ent, tag\GetTag('keyvalues'), true)
		@DeserializeSavetable(ent, tag\GetTag('savetable'), true)

	DeserializePre: (tag) =>
		local ent
		classname = tag\GetTagValue('classname')

		if tag\HasTag('map_id')
			ent = ents.GetMapCreatedEntity(tag\GetTagValue('map_id'))
		else
			ent = ents.Create(classname)

		return if not IsValid(ent)

		@DeserializeKeyValues(ent, tag\GetTag('keyvalues'))
		@DeserializeSavetable(ent, tag\GetTag('savetable'))
		@DeserializePreSpawn(ent, tag)

		if not tag\HasTag('map_id')
			ent\Spawn()
			ent\Activate()

		@DeserializePostSpawn(ent, tag)

		return ent

class DTransitions.FragSerializer extends DTransitions.WeaponProjectilesSerializer
	@SAVENAME = 'fraggrenade'
	CanSerialize: (ent) => ent\GetClass() == 'npc_grenade_frag'

	@SAVETABLE_IGNORANCE = [v for v in *DTransitions.EntitySerializerBase.SAVETABLE_IGNORANCE]

	DeserializePre: (tag) =>
		ent = super(tag)
		return if not ent

		ent\Fire('wake')
		ent\Fire('SetTimer', 2)

		return ent

class DTransitions.TripmineSerializer extends DTransitions.WeaponProjectilesSerializer
	@SAVENAME = 'tripmine'
	CanSerialize: (ent) => ent\GetClass() == 'npc_tripmine'

	DeserializePre: (tag) =>
		local ent

		if tag\HasTag('map_id')
			ent = ents.GetMapCreatedEntity(tag\GetTagValue('map_id'))
		else
			ent = ents.Create('npc_tripmine')

		return if not IsValid(ent)

		@DeserializeKeyValues(ent, tag\GetTag('keyvalues'))
		@DeserializePreSpawn(ent, tag)

		if not tag\HasTag('map_id')
			ent\Spawn()
			ent\Activate()

		@DeserializeSavetable(ent, tag\GetTag('savetable'))
		@DeserializePostSpawn(ent, tag)

		return ent
