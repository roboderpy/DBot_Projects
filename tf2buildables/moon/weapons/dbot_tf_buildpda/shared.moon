
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

DEFINE_BASECLASS('dbot_tf_weapon_base')

SWEP.Base = 'dbot_tf_weapon_base'
SWEP.Author = 'DBot'
SWEP.Category = 'TF2 Engineer'
SWEP.PrintName = 'Build PDA'
SWEP.ViewModel = 'models/weapons/c_models/c_engineer_arms.mdl'
SWEP.WorldModel = 'models/weapons/c_models/c_builder/c_builder.mdl'
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false

SWEP.DrawAnimation = 'bld_draw'
SWEP.IdleAnimation = 'bld_idle'

SWEP.BoxDrawAnimation = 'box_draw'
SWEP.BoxIdleAnimation = 'box_idle'
SWEP.BoxModel = 'models/weapons/c_models/c_toolbox/c_toolbox.mdl'

SWEP.SENTRY_BLUEPRINT = 'models/buildables/sentry1_blueprint.mdl'
SWEP.DISPENSER_BLUEPRINT = 'models/buildables/dispenser_blueprint.mdl'
SWEP.TELE_IN_BLUEPRINT = 'models/buildables/teleporter_blueprint_enter.mdl'
SWEP.TELE_OUT_BLUEPRINT = 'models/buildables/teleporter_blueprint_exit.mdl'

SWEP.SENTRIES = {
	{'dbot_tf_sentry', 'models/buildables/sentry1_blueprint.mdl'}
	{'dbot_tf_artilery_sentry', 'models/buildables/sentry1_blueprint.mdl'}
	-- {'dbot_tf_ledsentry', 'models/buildables/led_sentry/sentry1_blueprint.mdl'}
}

SWEP.BUILD_NONE = 0
SWEP.BUILD_SENTRY = 1
SWEP.BUILD_DISPENSER = 2
SWEP.BUILD_TELE_IN = 3
SWEP.BUILD_TELE_OUT = 4

SWEP.SLOT_SENTRY = 1
SWEP.SLOT_DISPENSER = 2
SWEP.SLOT_TELE_IN = 3
SWEP.SLOT_TELE_OUT = 4

SWEP.MOVE_SENTRY = 5
SWEP.MOVE_DISPENSER = 6
SWEP.MOVE_TELE_IN = 7
SWEP.MOVE_TELE_OUT = 8

SWEP.DrawTimeAnimation = 0.9
SWEP.BoxDrawTimeAnimation = 0.9

SWEP.BUILD_FORWARD = 70

SWEP.SetupDataTables = =>
	BaseClass.SetupDataTables(@)
	@NetworkVar('Int', 8, 'CurrentBuild')
	@NetworkVar('Int', 9, 'BuildRotation')
	@NetworkVar('Int', 10, 'BuildStatus')
	@NetworkVar('Int', 11, 'BuildType')
	@NetworkVar('Bool', 9, 'IsMoving')
	@NetworkVar('Entity', 9, 'MovingEntity')
	@SetIsMoving(false)
	@SetBuildType(1)

SWEP.GetBuildSentry = => @SENTRIES[@GetBuildType()] or @SENTRIES[1]
SWEP.GetBuildSentryClass = => @GetBuildSentry()[1]
SWEP.GetBuildSentryBlueprint = => @GetBuildSentry()[2]

SWEP.UpdateModel = =>
	if @GetBuildStatus() ~= self.BUILD_NONE
		@RealSetModel(@BoxModel)
	else
		@RealSetModel(@WorldModel)

SWEP.Deploy = =>
	BaseClass.Deploy(@)
	@SetBuildStatus(@BUILD_NONE)
	@SetBuildRotation(0)
	@UpdateModel()
	@__smoothRotation = Angle(0, 0, 0)
	return true

SWEP.Holster = =>
	switch @GetBuildStatus()
		when @MOVE_SENTRY, @MOVE_DISPENSER, @MOVE_TELE_IN, @MOVE_TELE_OUT
			return false
		else
			if @GetBuildStatus() ~= @BUILD_NONE
				@SetBuildStatus(@BUILD_NONE)
				@UpdateModel()
			@__InputCache = {} if CLIENT
			@SetBuildRotation(0)
			return BaseClass.Holster(@)

SWEP.Initialize = =>
	BaseClass.Initialize(@)
	@__InputCache = {} if CLIENT

SWEP.CalcAndCheckBuildSpot = =>
	ply = @GetOwner()
	return false, {HitPos: Vector()} if not IsValid(ply) or not ply\IsPlayer()

	ang = ply\EyeAngles()
	newAng = Angle(0, ang.y, 0)
	fwd = newAng\Forward() * @BUILD_FORWARD

	pos = ply\GetPos() + fwd

	trData = {
		start: ply\GetPos() + Vector(0, 0, 10)
		endpos: pos + Vector(0, 0, 10) + newAng\Forward() * 20
		filter: ply
		mins: Vector(-10, -10, 0)
		maxs: Vector(10, 10, 64)
	}

	trC = util.TraceHull(trData)

	return false, trC if trC.Hit

	trData = {
		start: pos + Vector(0, 0, 8)
		endpos: pos - Vector(0, 0, 8)
		filter: ply
		mins: Vector(-10, -10, 0)
		maxs: Vector(10, 10, 64)
	}

	tr1 = util.TraceHull(trData)
	tr2 = util.TraceLine(trData)
	return tr1.HitPos\Distance(tr2.HitPos) < 8 and tr1.Hit and tr2.Hit, tr1

SWEP.GetBuildAngle = =>
	ply = @GetOwner()
	ang = ply\EyeAngles()
	angReturn = Angle(0, ang.y, 0)
	angReturn.y += @GetBuildRotation() * 90
	return angReturn

SWEP.CheckBuildableAvaliability = (slot = @SLOT_SENTRY) =>
	with @GetOwner()
		switch slot
			when @SLOT_SENTRY
				return not IsValid(\GetBuildedSentry())
			when @SLOT_DISPENSER
				return not IsValid(\GetBuildedDispenser())
			when @SLOT_TELE_IN
				return not IsValid(\GetBuildedTeleporterIn())
			when @SLOT_TELE_OUT
				return not IsValid(\GetBuildedTeleporterOut())

SWEP.TriggerBuildRequest = (requestType = @BUILD_SENTRY) =>
	return false if not IsValid(@GetOwner()) or not @GetOwner()\IsPlayer()
	return false if @GetBuildStatus() ~= @BUILD_NONE

	switch requestType
		when @BUILD_SENTRY
			return false if not @CheckBuildableAvaliability(@SLOT_SENTRY)
		when @BUILD_DISPENSER
			return false if not @CheckBuildableAvaliability(@SLOT_DISPENSER)
		when @BUILD_TELE_IN
			return false if not @CheckBuildableAvaliability(@SLOT_TELE_IN)
		when @BUILD_TELE_OUT
			return false if not @CheckBuildableAvaliability(@SLOT_TELE_OUT)

	if DTF2.PDA_CONSUMES_METAL\GetBool()
		with @GetOwner()
			switch requestType
				when @BUILD_SENTRY
					return false if not \CanAffordTF2Metal(DTF2.PDA_COST_SENTRY\GetInt())
				when @BUILD_DISPENSER
					return false if not \CanAffordTF2Metal(DTF2.PDA_COST_DISPENSER\GetInt())
				when @BUILD_TELE_IN
					return false if not \CanAffordTF2Metal(DTF2.PDA_COST_TELE_IN\GetInt())
				when @BUILD_TELE_OUT
					return false if not \CanAffordTF2Metal(DTF2.PDA_COST_TELE_OUT\GetInt())

	if CLIENT
		net.Start('DTF2.BuildRequest')
		net.WriteUInt(requestType, 8)
		net.WriteEntity(@)
		net.SendToServer()
	else
		switch requestType
			when @BUILD_SENTRY
				@SetBuildType(math.random() > 0.85 and 2 or 1)
	@SetBuildStatus(requestType)
	@UpdateModel()
	@SendWeaponSequence(@BoxDrawAnimation)
	@WaitForSequence(@BoxIdleAnimation, @BoxDrawTimeAnimation)
	@SetBuildRotation(0)
	return true

SWEP.PrimaryAttack = =>
	return false if @GetBuildStatus() == @BUILD_NONE
	@SetNextPrimaryFire(CurTime() + 1)
	status, tr = @CalcAndCheckBuildSpot()

	if not status
		surface.PlaySound(@INVALID_INPUT_SOUND) if CLIENT and IsFirstTimePredicted()
		return false

	if DTF2.PDA_CONSUMES_METAL\GetBool()
		with @GetOwner()
			switch @GetBuildStatus()
				when @BUILD_SENTRY
					return false if not \AffordAndSimulateTF2Metal(DTF2.PDA_COST_SENTRY\GetInt())
				when @BUILD_DISPENSER
					return false if not \AffordAndSimulateTF2Metal(DTF2.PDA_COST_DISPENSER\GetInt())
				when @BUILD_TELE_IN
					return false if not \AffordAndSimulateTF2Metal(DTF2.PDA_COST_TELE_IN\GetInt())
				when @BUILD_TELE_OUT
					return false if not \AffordAndSimulateTF2Metal(DTF2.PDA_COST_TELE_OUT\GetInt())

	return true if CLIENT
	@TriggerBuild()
	return true

SWEP.SecondaryAttack = =>
	return false if CLIENT and @__interruptNextRotate and @__interruptNextRotate > CurTime()
	return false if @GetBuildStatus() == @BUILD_NONE
	@SetNextSecondaryFire(CurTime() + 0.1)
	if IsFirstTimePredicted()
		@SetBuildRotation(@GetBuildRotation() + 1)
		@SetBuildRotation(0) if @GetBuildRotation() > 3
	return true
