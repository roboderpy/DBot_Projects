
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

ENT.Base = 'dbot_tf_build_base'
ENT.Type = 'nextbot'
ENT.PrintName = 'Teleporter'
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.AdminOnly = false
ENT.Author = 'DBot'
ENT.Category = 'TF2'

ENT.SPAWN_BREAD = CreateConVar('tf_teleport_bread', '1', {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Spawn bread?')
ENT.BREAD_CHANCE = CreateConVar('tf_teleport_breadchance', '50', {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Bread chance')
ENT.MIN_BREAD = CreateConVar('tf_teleport_minbread', '4', {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Minimal amount of bread')
ENT.MAX_BREAD = CreateConVar('tf_teleport_maxbread', '7', {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Maximal amount of bread')

ENT.MIN_BREAD_TTL = CreateConVar('tf_teleport_minbread_ttl', '15', {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Minimal bread time to live')
ENT.MAX_BREAD_TTL = CreateConVar('tf_teleport_maxbread_ttl', '20', {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Maximal bread time to live')

ENT.Gibs = {
	'models/buildables/gibs/teleporter_gib1.mdl'
	'models/buildables/gibs/teleporter_gib2.mdl'
	'models/buildables/gibs/teleporter_gib3.mdl'
	'models/buildables/gibs/teleporter_gib4.mdl'
}

ENT.BREAD_MODELS = {
	'models/weapons/c_models/c_bread/c_bread_baguette.mdl'
	'models/weapons/c_models/c_bread/c_bread_burnt.mdl'
	'models/weapons/c_models/c_bread/c_bread_cinnamon.mdl'
	'models/weapons/c_models/c_bread/c_bread_cornbread.mdl'
	'models/weapons/c_models/c_bread/c_bread_crumpet.mdl'
	'models/weapons/c_models/c_bread/c_bread_plainloaf.mdl'
	'models/weapons/c_models/c_bread/c_bread_pretzel.mdl'
	'models/weapons/c_models/c_bread/c_bread_ration.mdl'
	'models/weapons/c_models/c_bread/c_bread_russianblack.mdl'
}

ENT.GibsValue = CreateConVar('tf_teleport_gibs', '15', {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Gibs value for teleporter')

ENT.BuildModel1 = 'models/buildables/teleporter.mdl'
ENT.IdleModel1 = 'models/buildables/teleporter_light.mdl'
ENT.BuildModel2 = 'models/buildables/teleporter.mdl'
ENT.IdleModel2 = 'models/buildables/teleporter_light.mdl'
ENT.BuildModel3 = 'models/buildables/teleporter.mdl'
ENT.IdleModel3 = 'models/buildables/teleporter_light.mdl'

ENT.READY_SOUND = 'DTF2_Building_Teleporter.Ready'
ENT.SEND_SOUND = 'DTF2_Building_Teleporter.Send'
ENT.RECEIVE_SOUND = 'DTF2_Building_Teleporter.Receive'
ENT.ExplosionSound = 'DTF2_Building_Teleporter.Explode'

ENT.ReloadTime1 = CreateConVar('tf_teleport_reload1', '10', {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Teleport reload time')
ENT.ReloadTime2 = CreateConVar('tf_teleport_reload2', '5', {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Teleport reload time')
ENT.ReloadTime3 = CreateConVar('tf_teleport_reload3', '3', {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Teleport reload time')

ENT.BuildTime = CreateConVar('tf_teleport_build', '20', {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Teleport build time')

ENT.BuildingMins = Vector(-20, -20, 0)
ENT.BuildingMaxs = Vector(20, 20, 18)

ENT.TELE_WAIT = CreateConVar('tf_dbg_teleport_wait', '1.25', {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Wait before teleporting')
ENT.TELE_DELAY = CreateConVar('tf_dbg_teleport_delay', '0.5', {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Delay before teleporting')

ENT.MODEL_UPGRADE_ANIMS = false

ENT.GetDrawText = => @IsExit() and 'Teleporter Exit' or 'Teleporter Entrance'

ENT.IsLoaded = => @GetResetAt() < CurTime()
ENT.IsAvaliable = => @BaseClass.IsAvaliable(@) and @GetResetAt() < CurTime()
ENT.IsExit = => @GetIsExit()
ENT.IsEntrance = => not @GetIsExit()
ENT.GetBreadPoint = => @GetPos() + Vector(0, 0, 70)
ENT.GetStandPos = => @GetPos() + Vector(0, 0, 23)
ENT.HasExit = => IsValid(@GetExit())
ENT.HasEntrance = => IsValid(@GetEntrance())
ENT.ValidEntrance = => @IsEntrance() and @HasExit()
ENT.ValidExit = => @IsExit() and @HasEntrance()
ENT.IsValidTeleporter = => @ValidEntrance() or @ValidExit()
ENT.GetConnectedTeleporter = => @IsExit() and @GetEntrance() or @GetExit()
ENT.ReadyToTeleport = => @IsValidTeleporter() and @GetConnectedTeleporter()\IsAvaliable()
ENT.OtherSideIsReady = =>
	side = @GetConnectedTeleporter()
	return @IsValidTeleporter() and side.BaseClass.IsAvaliable(side)

ENT.GetTeleAngles = =>
	ang = @GetAngles()
	ang.p = 0
	ang.r = 0
	return ang

ENT.GetChargedEffect = (level = @GetLevel()) =>
	if @GetTeamType()
		switch level
			when 1
				'teleporter_blue_charged_level1'
			when 2
				'teleporter_blue_charged_level2'
			when 3
				'teleporter_blue_charged_level3'
	else
		switch level
			when 1
				'teleporter_red_charged_level1'
			when 2
				'teleporter_red_charged_level2'
			when 3
				'teleporter_red_charged_level3'

ENT.GetAvaliableEffect = (level = @GetLevel()) =>
	if @IsEntrance()
		if @GetTeamType()
			switch level
				when 1
					'teleporter_blue_entrance_level1'
				when 2
					'teleporter_blue_entrance_level2'
				when 3
					'teleporter_blue_entrance_level3'
		else
			switch level
				when 1
					'teleporter_red_entrance_level1'
				when 2
					'teleporter_red_entrance_level2'
				when 3
					'teleporter_red_entrance_level3'
	else
		if @GetTeamType()
			switch level
				when 1
					'teleporter_blue_exit_level1'
				when 2
					'teleporter_blue_exit_level2'
				when 3
					'teleporter_blue_exit_level3'
		else
			switch level
				when 1
					'teleporter_red_exit_level1'
				when 2
					'teleporter_red_exit_level2'
				when 3
					'teleporter_red_exit_level3'

ENT.GetReloadTime = (level = @GetLevel()) =>
	switch level
		when 1
			DTF2.GrabFloat(@ReloadTime1)
		when 2
			DTF2.GrabFloat(@ReloadTime2)
		when 3
			DTF2.GrabFloat(@ReloadTime3)

ENT.GetSpinSound = (level = @GetLevel()) =>
	switch level
		when 1
			'DTF2_Building_Teleporter.SpinLevel1'
		when 2
			'DTF2_Building_Teleporter.SpinLevel2'
		when 3
			'DTF2_Building_Teleporter.SpinLevel3'

ENT.SetupDataTables = =>
	@BaseClass.SetupDataTables(@)
	@NetworkVar('Bool', 8, 'IsExit')
	@NetworkVar('Entity', 16, 'Exit')
	@NetworkVar('Entity', 17, 'Entrance')
	@NetworkVar('Float', 16, 'ResetAt')
	@NetworkVar('Int', 17, 'Uses')
	@SetResetAt(0)

ENT.ThinkPlaybackRate = =>
	oldPlayback = @currentPlayback
	if @BaseClass.IsAvaliable(@)
		@currentPlayback = Lerp(0.05, @currentPlayback, @targetPlayback)
	else
		if @GetIsBuilding()
			@currentPlayback = Lerp(0.05, @currentPlayback, 0.5) if not @GetAfterMove()
			@currentPlayback = Lerp(0.05, @currentPlayback, 1.5) if @GetAfterMove()
		else
			@currentPlayback = Lerp(0.05, @currentPlayback, 1)

	if oldPlayback ~= @currentPlayback
		@SetPlaybackRate(@currentPlayback)

ENT.CalculatePlaybackRate = (animTime = 1 - (@GetResetAt() - CurTime()) / @GetReloadTime()) =>
	if animTime < 0.15
		return 1 - animTime / 0.15
	elseif animTime < 0.85
		return 0.15
	else
		return 0.5

ENT.Think = =>
	@BaseClass.Think(@)
	@ThinkPlaybackRate()

	if @BaseClass.IsAvaliable(@)
		if @IsValidTeleporter()
			if @GetResetAt() > CurTime()
				@targetPlayback = @CalculatePlaybackRate()
			else
				@targetPlayback = 1
		else
			@targetPlayback = 0

	@ClientTeleporterThink() if CLIENT
	return true

ENT.SimulateUpgrade = (thersold = 200, simulate = CLIENT) =>
	if @isRepairedConnected
		@BaseClass.SimulateUpgrade(@, @realThersold, simulate)
		return 0
	else
		return @BaseClass.SimulateUpgrade(@, thersold, simulate)

ENT.SimulateRepair = (thersold = 200, simulate = CLIENT, isConnected = false) =>
	if not isConnected
		tele2 = @GetConnectedTeleporter()
		return 0 if IsValid(tele2) and not tele2\IsAvaliableForRepair()
		weight = @BaseClass.SimulateRepair(@, thersold, simulate)
		tele2 = @GetConnectedTeleporter()
		if IsValid(tele2)
			weight += tele2\SimulateRepair(thersold, simulate, true)
		return weight
	else
		@isRepairedConnected = true
		@realThersold = thersold
		weight = @BaseClass.SimulateRepair(@, thersold, simulate)
		@isRepairedConnected = false
		return weight
