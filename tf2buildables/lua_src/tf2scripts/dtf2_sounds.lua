return [==[// Channels
//	CHAN_AUTO		= 0,
//	CHAN_WEAPON		= 1,
//	CHAN_VOICE		= 2,
//	CHAN_ITEM		= 3,
//	CHAN_BODY		= 4,
//	CHAN_STREAM		= 5,		// allocate stream channel from the static or dynamic area
//	CHAN_STATIC		= 6,		// allocate channel from the static area 
// these can be set with "channel" "2" or "channel" "chan_voice"

//-----------------------------------------------------------------------------
// common attenuation values
//-----------------------------------------------------------------------------

// DON'T USE THESE - USE SNDLVL_ INSTEAD!!!
//	ATTN_NONE		0.0f	
//	ATTN_NORM		0.8f
//	ATTN_IDLE		2.0f
//	ATTN_STATIC		1.25f 
//	ATTN_RICOCHET	1.5f
//	ATTN_GUNFIRE	0.27f
//	SNDLVL_NONE		= 0,
//	SNDLVL_25dB		= 25,
//	SNDLVL_30dB		= 30,
//	SNDLVL_35dB		= 35,
//	SNDLVL_40dB		= 40,
//	SNDLVL_45dB		= 45,
//	SNDLVL_50dB		= 50,	// 3.9
//	SNDLVL_55dB		= 55,	// 3.0
//	SNDLVL_IDLE		= 60,	// 2.0
//	SNDLVL_TALKING	= 60,	// 2.0
//	SNDLVL_60dB		= 60,	// 2.0
//	SNDLVL_65dB		= 65,	// 1.5
//	SNDLVL_STATIC	= 66,	// 1.25
//	SNDLVL_70dB		= 70,	// 1.0
//	SNDLVL_NORM		= 75,
//	SNDLVL_75dB		= 75,	// 0.8
//	SNDLVL_80dB		= 80,	// 0.7
//	SNDLVL_85dB		= 85,	// 0.6
//	SNDLVL_90dB		= 90,	// 0.5
//	SNDLVL_95dB		= 95,
//	SNDLVL_100dB	= 100,	// 0.4
//	SNDLVL_105dB	= 105,
//	SNDLVL_120dB	= 120,
//	SNDLVL_130dB	= 130,
//	SNDLVL_GUNFIRE	= 140,	// 0.27
//	SNDLVL_140dB	= 140,	// 0.2
//	SNDLVL_150dB	= 150,	// 0.2

"DTF2_vox/null"
{
	"channel"		"CHAN_STATIC"
	"volume"		"VOL_NORM"
	"soundlevel"	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"vo/null.mp3"
}

// ------------------------------------------------------------------------------------ //
// HEALTH KIT
// ------------------------------------------------------------------------------------ //
"DTF2_HealthKit.Touch"
{
	"channel"	"CHAN_STATIC"
	"volume"	"VOL_NORM"
	"soundlevel"	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"
	"wave"		"items/smallmedkit1.wav"
}

// ------------------------------------------------------------------------------------ //
// AMMO PACK
// ------------------------------------------------------------------------------------ //
"DTF2_AmmoPack.Touch"
{
	"channel"	"CHAN_STATIC"
	"volume"	"VOL_NORM"
	"soundlevel"	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"
	"wave"		"items/gunpickup2.wav"
}

// ------------------------------------------------------------------------------------ //
// GRENADE PACK
// ------------------------------------------------------------------------------------ //
"DTF2_GrenadePack.Touch"
{
	"channel"	"CHAN_STATIC"
	"volume"	"VOL_NORM"
	"soundlevel"	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"
	"wave"		"items/gunpickup2.wav"
}

// ------------------------------------------------------------------------------------ //
// REGENERATE
// ------------------------------------------------------------------------------------ //
"DTF2_Regenerate.Touch"
{
	"channel"	"CHAN_STATIC"
	"volume"	"VOL_NORM"
	"soundlevel"	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"
	"wave"		"items/regenerate.wav"
}

// ------------------------------------------------------------------------------------ //
// CHANGE CLASS
// ------------------------------------------------------------------------------------ //
"DTF2_ChangeClass.Touch"
{
	"channel"	"CHAN_STATIC"
	"volume"	"VOL_NORM"
	"soundlevel"	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"
	"wave"		"items/r_item1.wav"
}

"DTF2_BaseCombatCharacter.CorpseGib"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1"
	"soundlevel"  "SNDLVL_75dB"
	"rndwave"
	{
		"wave"	"physics/flesh/flesh_squishy_impact_hard2.wav"
	}
}

"DTF2_BaseCombatCharacter.StopWeaponSounds"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1"
	"soundlevel"  "SNDLVL_75dB"

	"wave"	"common/null.wav"
}

"DTF2_BaseCombatCharacter.AmmoPickup"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"soundlevel"  "SNDLVL_75dB"

	"wave"	"items/ammo_pickup.wav"
}

"DTF2_General.BurningFlesh"
{
	"channel"		"CHAN_WEAPON"
	"volume"		"0.45"
	"pitch"		"PITCH_NORM"

	"soundlevel"	"SNDLVL_NORM"

	"wave"		 "npc/headcrab/headcrab_burning_loop2.wav" 
}

"DTF2_General.BurningObject"
{
	"channel"		"CHAN_WEAPON"
	"volume"		"VOL_NORM"
	"pitch"		"PITCH_NORM"

	"soundlevel"	"SNDLVL_NORM"

	"wave"		 "ambient/fire/fire_small_loop2.wav" 
}

"DTF2_General.StopBurning"
{
	"channel"		"CHAN_WEAPON"
	"volume"		"VOL_NORM"
	"pitch"		"PITCH_NORM"

	"soundlevel"	"SNDLVL_NORM"

	"wave"		 "common/null.wav" 
}

"DTF2_BaseCombatWeapon.WeaponDrop"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.8"
	"soundlevel"  "SNDLVL_75dB"
	"pitch"	  "95,110"
	"rndwave"
	{
		"wave"	"physics/metal/weapon_impact_hard1.wav"
		"wave"	"physics/metal/weapon_impact_hard2.wav"
		"wave"	"physics/metal/weapon_impact_hard3.wav"
	}
}

"DTF2_BaseCombatWeapon.WeaponMaterialize"
{
	"channel"	"CHAN_STATIC"
	"volume"	".25"
	"soundlevel"  "SNDLVL_75dB"
	"pitch"	"150"

	"wave"	"items/suitchargeok1.wav"
}

"DTF2_HudChat.Message"
{
	"channel"	"CHAN_STREAM"
	"volume"	"VOL_NORM"
	"soundlevel"  "SNDLVL_NONE"
	"pitch"	"PITCH_NORM"

	"wave"	"vo/null.mp3"
}

"DTF2_Hud.Hint"
{
	"channel"	"CHAN_STATIC"
	"volume"	"VOL_NORM"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"

	"wave"		"ui/hint.wav"
}

"DTF2_Hud.ItemAcquired"
{
	"channel"	"CHAN_STATIC"
	"volume"	"VOL_NORM"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"

	"wave"		"ui/item_acquired.wav"
}

"DTF2_Hud.ProjectorScreenUp"
{
	"channel"	"CHAN_STATIC"
	"volume"	".65"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"

	"wave"		"ui/projector_screen_up.wav"
}

"DTF2_Hud.ProjectorScreenUpLong"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"

	"wave"		"ui/projector_screen_up_long.wav"
}

"DTF2_Hud.ProjectorScreenDown"
{
	"channel"	"CHAN_STATIC"
	"volume"	"VOL_NORM"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"

	"wave"		"ui/projector_screen_down.wav"
}

"DTF2_Hud.ProjectorMovie"
{
	"channel"	"CHAN_STATIC"
	"volume"	"VOL_NORM"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"

	"wave"		"ui/projector_movie.wav"
}

"DTF2_Hud.EndRoundScored"
{
	"channel"	"CHAN_STATIC"
	"volume"	"VOL_NORM"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"

	"wave"		"ui/scored.wav"
}

"DTF2_Hud.PointCaptured"
{
	"channel"	"CHAN_STATIC"
	"volume"	"VOL_NORM"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"

	"wave"		"ui/scored.wav"
}

"DTF2_Hud.Warning"
{
	"channel"	"CHAN_STATIC"
	"volume"	"VOL_NORM"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"

	"wave"		"misc/hud_warning.wav"
}

"DTF2_Hud.TrainingPointSmall"
{
	"channel"	"CHAN_STATIC"
	"volume"	"VOL_NORM"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"

	"wave"		"ui/training_point_small.wav"
}

"DTF2_Hud.TrainingPointBig"
{
	"channel"	"CHAN_STATIC"
	"volume"	"VOL_NORM"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"

	"wave"		"ui/training_point_big.wav"
}

"DTF2_Hud.TrainingMsgUpdate"
{
	"channel"	"CHAN_STATIC"
	"volume"	"VOL_NORM"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"

	"wave"		"ui/hint.wav"
}


"DTF2_SprayCan.Paint"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"pitch"			"PITCH_NORM"
	"soundlevel"  		"SNDLVL_NORM"
	"wave"			"player/sprayer.wav"
}



"DTF2_DoorSound.Null"
{
	"channel"		"CHAN_BODY"
	"volume"		"1.0"
	"pitch"			"100"
	"soundlevel"	"SNDLVL_NORM"
	"wave"		"common/null.wav" 
}

"DTF2_DoorSound.DefaultMove"
{
	"channel"	"CHAN_BODY"
	"volume"	"1"
	"soundlevel"	"SNDLVL_75dB"
	"wave"		"doors/door_metal_rusty_move1.wav" 
}

"DTF2_DoorSound.DefaultArrive"
{
	"channel"		"CHAN_BODY"
	"volume"		"1"
	"soundlevel"	"SNDLVL_75dB"
	"wave"		"doors/metal_stop1.wav" 
}

"DTF2_DoorSound.DefaultLocked"
{
	"channel"		"CHAN_BODY"
	"volume"		"0.2"
	"soundlevel"	"SNDLVL_75dB"
	"wave"		"doors/default_locked.wav" 
}

"DTF2_RotDoorSound.DefaultMove"
{
	"channel"	"CHAN_BODY"
	"volume"	"1"
	"soundlevel"	"SNDLVL_75dB"
	"wave"		"doors/door_metal_rusty_move1.wav" 
}

"DTF2_RotDoorSound.DefaultArrive"
{
	"channel"		"CHAN_BODY"
	"volume"		"1"
	"soundlevel"	"SNDLVL_75dB"
	"wave"		"doors/metal_stop1.wav" 
}

"DTF2_RotDoorSound.DefaultLocked"
{
	"channel"		"CHAN_BODY"
	"volume"		"0.2"
	"soundlevel"	"SNDLVL_75dB"
	"wave"		"doors/default_locked.wav" 
}

"DTF2_Item.Materialize"
{
	"channel"	"CHAN_STATIC"
	"volume"	".25"
	"soundlevel"  "SNDLVL_75dB"
	"wave"	"items/spawn_item.wav"
}

"DTF2_PropaneTank.Burst"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"pitch"		"95,105"
	"soundlevel"	"SNDLVL_90db"
	"wave"		"ambient/fire/gascan_ignite1.wav"
}

"DTF2_NPC_CombineS.ElectrocuteScream"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"pitch"			"100"
	"soundlevel"		"SNDLVL_NORM"
	"wave"			"common/null.wav" 
}


"DTF2_npc_citizen.die"
{
	"channel"	"CHAN_VOICE"
	"volume"	"0.8"
	"soundlevel"  "SNDLVL_75dB"

	"rndwave"
	{
		"wave"	"player/pl_pain5.wav"
		"wave"	"player/pl_pain6.wav"
		"wave"	"player/pl_pain7.wav"
	}
}

"DTF2_Panel.SlideDown"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"pitch"			"100"
	"soundlevel"		"SNDLVL_NORM"
	"wave"			"ui/slide_down.wav" 
}

"DTF2_Panel.SlideUp"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"pitch"			"100"
	"soundlevel"		"SNDLVL_NORM"
	"wave"			"ui/slide_up.wav" 
}


// ------------------------------------------------------------------------------------ //
// AMBIENT
// ------------------------------------------------------------------------------------ //

"DTF2_Ambient.Drips1"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_74dB"
	"wave"		")ambient/drips1.wav"
}

"DTF2_Ambient.Drips2"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_74dB"
	"wave"		")ambient/drips2.wav"
}

"DTF2_Ambient.Drips3"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_74dB"
	"wave"		")ambient/drips3.wav"
}

"DTF2_Sawmill.Waterfall"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_84dB"
	"wave"		"ambient/waterfall.wav"
}

"DTF2_Ambient.MachineHum"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_75dB"
	"wave"		")ambient/machine_hum.wav"
}

"DTF2_Ambient.MachineHum2"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_75dB"
	"wave"		")ambient/machine_hum2.wav"
}

"DTF2_Ambient.MachineWorking"
{
	"channel"	"CHAN_STATIC"
	"volume"	".50"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_75dB"
	"wave"		")ambient/train_engine_idle.wav"
}



"DTF2_Ambient.ComputerWorking"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_75dB"
	"wave"		")ambient/computer_working.wav"
}

"DTF2_Ambient.ComputerTape"
{
	"channel"	"CHAN_STATIC"
	"volume"	".5"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_75dB"
	"wave"		")ambient/computer_tape.wav"
}

"DTF2_Ambient.ComputerTape3"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_70dB"
	"wave"		"ambient/computer_tape3.wav"
}

"DTF2_Ambient.ComputerTape4"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_70dB"
	"wave"		"ambient/computer_tape4.wav"
}

"DTF2_Ambient.CommandCenter"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_75dB"
	"wave"		")ambient/command_center.wav"
}

"DTF2_Ambient.CommandCenter2"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_85dB"
	"wave"		")ambient/command_center2.wav"
}

"DTF2_Ambient.Factory"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_75dB"
	"wave"		")ambient/factory_outdoor.wav"
}

"DTF2_Ambient.Generator"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_75dB"
	"wave"		")ambient/generator.wav"
}

"DTF2_Ambient.SteamDrum"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_80dB"
	"wave"		")ambient/steam_drum.wav"
}

"DTF2_Ambient.TrainApproachAndPass"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_95dB"
	"wave"		")ambient_mp3/train_approach_and_pass.mp3"
}


"DTF2_Ambient.Train"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_95dB"
	"wave"		")ambient/train.wav"
}


"DTF2_Ambient.RailroadBells"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_95dB"
	"wave"		")ambient/railroad_bells.wav"
}

"DTF2_Ambient.SlowTrain"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_150dB"
	"wave"		")ambient/slow_train.wav"
}

"DTF2_Ambient.SlowTrainLeadIn"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_150dB"
	"wave"		")ambient_mp3/slow_train_lead_in.mp3"
}

"DTF2_Ambient.LightHum"
{
	"channel"	"CHAN_STATIC"
	"volume"		"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_75dB"
	"wave"		"ambient/lighthum.wav"
}

"DTF2_Ambient.LightHum"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_65dB"
	"wave"		"ambient/lighthum.wav"
}

"DTF2_Ambient.Siren"
{
	"channel"		"CHAN_AUTO"
	"volume"		"VOL_NORM"
	"soundlevel"	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ambient_mp3/siren.mp3"
}

"DTF2_Ambient.Cliff"
{
	"channel"		"CHAN_STATIC"
	"volume"		"VOL_NORM"
	"soundlevel"		"SNDLVL_87dB"
	"pitch"			"PITCH_NORM"
	"wave"			")ambient/forest_cliff.wav"
}

"DTF2_Ambient.Fireball"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"	"SNDLVL_97dB"
	"pitch"			"PITCH_NORM"
	"wave"			")ambient/fireball.wav"
}

"DTF2_Game.SuddenDeath"
{
	"channel"	"CHAN_AUTO"
	"volume"	"1"
	"soundlevel"	"SNDLVL_140dB"
	"pitch"		"PITCH_NORM"
	
	"wave"		"#misc/your_team_suddendeath.mp3"	[$WIN32]
	"wave"		"#misc/your_team_suddendeath.wav"	[$X360]
}

"DTF2_Game.Stalemate"
{
	"channel"	"CHAN_AUTO"
	"volume"	"1"
	"soundlevel"	"SNDLVL_140dB"
	"pitch"		"PITCH_NORM"
	
	"wave"		"#misc/your_team_stalemate.mp3"	[$WIN32]
	"wave"		"#misc/your_team_stalemate.wav"	[$X360]
}

"DTF2_Game.Overtime"
{
	"channel"	"CHAN_VOICE2"
	"volume"	"1"
	"soundlevel"	"SNDLVL_140dB"
	"pitch"		"PITCH_NORM"
	"rndwave"
	{
		"wave"	"vo/announcer_overtime.mp3"
		"wave"	"vo/announcer_overtime2.mp3"
		"wave"	"vo/announcer_overtime3.mp3"
		"wave"	"vo/announcer_overtime4.mp3"
	}
}

"DTF2_Game.YourTeamLost"
{
	"channel"	"CHAN_AUTO"
	"volume"	"1"
	"soundlevel"	"SNDLVL_140dB"
	"pitch"		"PITCH_NORM"

	"wave"		"#misc/your_team_lost.mp3"	[$WIN32]
	"wave"		"#misc/your_team_lost.wav"	[$X360]
}

"DTF2_Game.YourTeamWon"
{
	"channel"	"CHAN_AUTO"
	"volume"	"1"
	"soundlevel"	"SNDLVL_140dB"
	"pitch"		"PITCH_NORM"

	"wave"		"#misc/your_team_won.mp3"	[$WIN32]
	"wave"		"#misc/your_team_won.wav"	[$X360]
}

"DTF2_Game.Revenge"
{
	"channel"  "CHAN_STATIC"
	"volume"  ".65"
	"pitch"  "100"
	"soundlevel"   "SNDLVL_NORM"
	"wave"  "#misc/tf_revenge.wav"
}
 
"DTF2_Game.Domination"
{
	"channel"  "CHAN_STATIC"
 	"volume"  ".65"
 	"pitch"  "100"
 	"soundlevel"   "SNDLVL_NORM"
	"wave"  "#misc/tf_domination.wav"
}
 
"DTF2_Game.Nemesis"
{
 	"channel"  "CHAN_STATIC"
 	"volume"  ".65"
 	"pitch"  "100"
 	"soundlevel"   "SNDLVL_NORM"
	"wave"  "#misc/tf_nemesis.wav"
}
"DTF2_Game.KillStreak"
{
 	"channel"  "CHAN_STATIC"
 	"volume"  ".65"
 	"pitch"  "100"
 	"soundlevel"   "SNDLVL_NORM"
	"wave"  "#misc/killstreak.wav"
}

"DTF2_Game.PenetrationKill"
{
	"channel"	"CHAN_STATIC"
 	"volume"	"0.8"
 	"pitch"		"100"
 	"soundlevel"   "SNDLVL_NORM"
	"wave"	"misc\sniper_railgun_double_kill.wav"
}

"DTF2_Game.HappyBirthday"
{
 	"channel"  "CHAN_STATIC"
 	"volume"  "1"
 	"pitch"  "100"
 	"soundlevel"   "SNDLVL_87dB"
	"wave"  "misc/happy_birthday.wav"
}

"DTF2_Game.HappyBirthdayNoiseMaker"
{
 	"channel"  "CHAN_STATIC"
 	"volume"  "1"
 	"pitch"  "100"
 	"soundlevel"   "SNDLVL_87dB"
	"rndwave"
	{
		"wave"	")misc\happy_birthday_tf_01.wav"
		"wave"	")misc\happy_birthday_tf_02.wav"
		"wave"	")misc\happy_birthday_tf_03.wav"
		"wave"	")misc\happy_birthday_tf_04.wav"
		"wave"	")misc\happy_birthday_tf_05.wav"
		"wave"	")misc\happy_birthday_tf_06.wav"
		"wave"	")misc\happy_birthday_tf_07.wav"
		"wave"	")misc\happy_birthday_tf_08.wav"
		"wave"	")misc\happy_birthday_tf_09.wav"
		"wave"	")misc\happy_birthday_tf_10.wav"
		"wave"	")misc\happy_birthday_tf_11.wav"
		"wave"	")misc\happy_birthday_tf_12.wav"
		"wave"	")misc\happy_birthday_tf_13.wav"
		"wave"	")misc\happy_birthday_tf_14.wav"
		"wave"	")misc\happy_birthday_tf_15.wav"
		"wave"	")misc\happy_birthday_tf_16.wav"
		"wave"	")misc\happy_birthday_tf_17.wav"
		"wave"	")misc\happy_birthday_tf_18.wav"
		"wave"	")misc\happy_birthday_tf_19.wav"
		"wave"	")misc\happy_birthday_tf_20.wav"
		"wave"	")misc\happy_birthday_tf_21.wav"
		"wave"	")misc\happy_birthday_tf_22.wav"
		"wave"	")misc\happy_birthday_tf_23.wav"
		"wave"	")misc\happy_birthday_tf_24.wav"
		"wave"	")misc\happy_birthday_tf_25.wav"
		"wave"	")misc\happy_birthday_tf_26.wav"
		"wave"	")misc\happy_birthday_tf_27.wav"
		"wave"	")misc\happy_birthday_tf_28.wav"
		"wave"	")misc\happy_birthday_tf_29.wav"
	}
}

"DTF2_DoSpark"
{
	"channel"	"CHAN_STATIC"
	"volume"	"VOL_NORM"
	"pitch"	"PITCH_NORM"
	"soundlevel"	"SNDLVL_NONE"
	"wave"	"misc/null.wav"
}


// ------------------------------------------------------------------------------------ //
// MISC
// ------------------------------------------------------------------------------------ //

"DTF2_Door.Open"
{
	"channel"		"CHAN_STATIC"
	"volume"		".65"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_NONE"
	"wave"		"doors/generic_door_open.wav"
}

"DTF2_Door.Close"
{
	"channel"		"CHAN_STATIC"
	"volume"		".65"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_NONE"
	"wave"		"doors/generic_door_close.wav"
}

"DTF2_TV.Static"
{
	"channel"		"CHAN_STATIC"
	"volume"		".15"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_NONE"
	"wave"		"misc/null.wav"
}

"DTF2_TV.Tune"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_NONE"
	"rndwave"	[$WIN32]
	{
		"wave"	"ui/tv_tune.mp3"
		"wave"	"ui/tv_tune2.mp3"
		"wave"	"ui/tv_tune3.mp3"
	}
	
	"rndwave"	[$X360]
	{
		"wave"	"ui/tv_tune.wav"
		"wave"	"ui/tv_tune2.wav"
		"wave"	"ui/tv_tune3.wav"
	}
}

"DTF2_Hologram.Start"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_73dB"
	"wave"		"misc/hologram_start.wav"
}

"DTF2_Hologram.Move"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_73dB"
	"wave"		"misc/hologram_move.wav"
}

"DTF2_Hologram.Stop"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_73dB"
	"wave"		"misc/hologram_stop.wav"
}

"DTF2_Hologram.Interrupted"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_73dB"
	"wave"		"misc/hologram_malfunction.wav"
}


"DTF2_Fire.Engulf"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_NORM"
	"wave"		"misc/flame_engulf.wav"
}

"DTF2_Camera.SnapShot"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_NORM"
	"wave"		"misc/freeze_cam_snapshot.wav"
}

"DTF2_Camera.SnapShotMultiple"
{
	"channel"		"CHAN_STATIC"
	"volume"		".95, 1.0"
	"pitch"		"95, 105"
	"soundlevel"  	"SNDLVL_NORM"
	"rndwave"
	{
		"wave"		"misc\tf_camera_01.wav"
		"wave"		"misc\tf_camera_02.wav"
		"wave"		"misc\tf_camera_03.wav"
		"wave"		"misc\tf_camera_04.wav"
		"wave"		"misc\tf_camera_05.wav"
		"wave"		"misc\tf_camera_06.wav"
		"wave"		"misc\tf_camera_07.wav"
		"wave"		"misc\tf_camera_08.wav"
		"wave"		"misc\tf_camera_09.wav"
		"wave"		"misc\tf_camera_10.wav"
		"wave"		"misc\tf_camera_11.wav"
	}
}

"DTF2_Achievement.Earned"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_94dB"
	"wave"			")misc/achievement_earned.wav"
}


"DTF2_Cart.Roll"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_84dB"
	"wave"			")items/cart_rolling.wav"
}

"DTF2_Cart.Grind"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_84dB"
	"rndwave"	
	{
		"wave"	"items/cart_rolling_back_grind1.wav"
		"wave"	"items/cart_rolling_back_grind2.wav"
		"wave"	"items/cart_rolling_back_grind3.wav"
		"wave"	"items/cart_rolling_back_grind4.wav"
	}
}

"DTF2_Cart.RollStart"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_84dB"
	"wave"			")items/cart_rolling_start.wav"
}

"DTF2_Cart.RollStop"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_84dB"
	"wave"			")items/cart_rolling_stop.wav"
}

"DTF2_Cart.Explode"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_NONE"
	"wave"			")items/cart_explode.wav"
}

"DTF2_Cart.Trigger"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_150dB"
	"wave"			")items/cart_explode_trigger.wav"
}

"DTF2_Cart.Falling"
{
	"channel"		"CHAN_WEAPON"
	"volume"		"1"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_110dB"
	"wave"			"items/cart_explode_falling.wav"
}

"DTF2_Cart.Warning"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_104dB"
	"wave"			")items/cart_warning.wav"
}

"DTF2_Cart.WarningSingle"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_104dB"
	"wave"			")items/cart_warning_single.wav"
}

"DTF2_Hud.AchievementIncremented"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.5"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"160"

	"wave"		"ui/scored.wav"
}

 
"DTF2_SawMill.BladeImpact"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_105dB"
	"pitch"		"95,105"
	"rndwave"
	{
		"wave"	")ambient_mp3/sawblade_impact1.mp3"
		"wave"	")ambient_mp3/sawblade_impact2.mp3"
	}
}

"DTF2_SawMill.Blade"
{
	"channel"		"CHAN_STATIC"
	"volume"		".75"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"		"PITCH_NORM"

	"wave"		")ambient/sawblade.wav"
}

"DTF2_Ambient.NucleusElectricity"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_105dB"
	"pitch"		"PITCH_NORM"

	"wave"		")ambient/nucleus_electricity.wav"
}

"DTF2_Nucleus.WalkWayMove"
{
	"channel"		"CHAN_STATIC"
	"volume"		".25"
	"soundlevel"  	"SNDLVL_150dB"
	"pitch"		"PITCH_NORM"

	"wave"		")ambient_mp3/walkway_move.mp3"
}

"DTF2_Nucleus.ChamberOpen"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_150dB"
	"pitch"		"PITCH_NORM"

	"wave"		")ambient/chamber_open.wav"
}

"DTF2_Medieval.DoorOpen"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"

	"wave"		"ambient_mp3/medieval_dooropen.mp3"
}

"DTF2_Medieval.DoorClose"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"

	"wave"		"ambient_mp3/medieval_doorclose.mp3"
}

"DTF2_Medieval.DoorOpenRaise"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"

	"wave"		"ambient_mp3/medieval_dooropenraise.mp3"
}

"DTF2_Medieval.DoorOpenLower"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"

	"wave"		"ambient_mp3/medieval_dooropenlower.mp3"
}

"DTF2_Medieval.Flag"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"

	"wave"		"ambient/medieval_flag.wav"
}

"DTF2_Medieval.Brazier"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"

	"wave"		")ambient/medieval_brazier.wav"
}

"DTF2_ArrowLight"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"

	"wave"		")ambient_mp3/arrowlight.mp3"
}

// ------------------------------------------------------------------------------------ //
// REPLAY
// ------------------------------------------------------------------------------------ //

"DTF2_Replay.Saved"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_150dB"
	"pitch"		"PITCH_NORM"

	"wave"		"replay/saved.wav"
}


"DTF2_Halloween.PumpkinExplode"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_115dB"
	"pitch"		"PITCH_NORM"
	"rndwave"
	{
		"wave"	")items/pumpkin_explode1.wav"
		"wave"	")items/pumpkin_explode2.wav"
		"wave"	")items/pumpkin_explode3.wav"
	}
}

"DTF2_Halloween.PumpkinDrop"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_95dB"
	"pitch"		"PITCH_NORM"

	"wave"		"items/pumpkin_drop.wav"
}

"DTF2_Halloween.PumpkinPickup"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_75dB"
	"pitch"		"PITCH_NORM"


	"wave"		"items/pumpkin_pickup.wav"
}

"DTF2_Halloween.LightsOn"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"		"PITCH_NORM"

	"wave"		")ambient_mp3/lightson.mp3"
}

"DTF2_Halloween.LightsOff"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"		"PITCH_NORM"

	"wave"		")ambient_mp3/lightsoff.mp3"
}

"DTF2_Halloween.MerasmusLoop"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"			"PITCH_NORM"
	"wave"		"ambient/hallowloop.wav"
}

"DTF2_Vote.Created"
{
	"channel"	"CHAN_STATIC"
	"soundlevel" 	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"

	"wave"		"UI/vote_started.wav"
}

"DTF2_Vote.Passed"
{
	"channel"	"CHAN_STATIC"
	"soundlevel" 	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"

	"wave"		"UI/vote_success.wav"
}

"DTF2_Vote.Failed"
{
	"channel"	"CHAN_STATIC"
	"soundlevel" 	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"

	"wave"		"UI/vote_failure.wav"
}

"DTF2_Vote.Cast.Yes"
{
	"channel"	"CHAN_STATIC"
	"soundlevel" 	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"

	"wave"		"UI/vote_yes.wav"
}

"DTF2_Vote.Cast.No"
{
	"channel"	"CHAN_STATIC"
	"soundlevel" 	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"

	"wave"		"UI/vote_no.wav"
}


//
// Eyeball boss vortex
//
"DTF2_Halloween.TeleportVortex.EyeballMovedVortex"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.000"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_95dB"

	"wave"		"misc/halloween_eyeball/vortex_eyeball_moved.wav"
}

"DTF2_Halloween.TeleportVortex.EyeballDiedVortex"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.000"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_95dB"

	"wave"		"misc/halloween_eyeball/vortex_eyeball_died.wav"
}

"DTF2_Halloween.TeleportVortex.BookSpawn"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.000"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_95dB"

	"wave"		"misc/halloween_eyeball/book_spawn.wav"
}

"DTF2_Halloween.TeleportVortex.BookExit"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.000"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_95dB"

	"wave"		"misc/halloween_eyeball/book_exit.wav"
}

"DTF2_Christmas.GiftDrop"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_95dB"
	"pitch"		"PITCH_NORM"

	"wave"		"items/gift_drop.wav"
}

"DTF2_Christmas.GiftPickup"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_75dB"
	"pitch"		"PITCH_NORM"

	"wave"		"items/gift_pickup.wav"
}

"DTF2_harbor_furnace_1shots"
{	
		"channel"		"CHAN_STATIC"
		"volume"		".6"
		"pitch"		"100"
		"soundlevel"  	"SNDLVL_80dB"
		"rndwave"
		{
			"wave"		"ambient_mp3\cp_harbor\furnace_1_shot_01.mp3"
			"wave"		"ambient_mp3\cp_harbor\furnace_1_shot_02.mp3"
			"wave"		"ambient_mp3\cp_harbor\furnace_1_shot_03.mp3"
			"wave"		"ambient_mp3\cp_harbor\furnace_1_shot_04.mp3"
			"wave"		"ambient_mp3\cp_harbor\furnace_1_shot_05.mp3"
		}
}

"DTF2_harbor_furnace_lp"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_80dB"
	"wave"		"ambient\cp_harbor\cauldron_lp_main.wav"
}

"DTF2_harbor.blue_whistle"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_150dB"
	"pitch"		"PITCH_NORM"

	"wave"		")misc\cp_harbor_blue_whistle.wav"
}

"DTF2_harbor.red_whistle"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_150dB"
	"pitch"		"PITCH_NORM"

	"wave"		")misc\cp_harbor_red_whistle.wav"
}

"DTF2_Tournament.PlayerReady"
{
	"channel"	"CHAN_STATIC"
	"soundlevel" 	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"

	"wave"		"UI/vote_started.wav"
}

// ------------------------------------------------------------------------------------ //
// DOOMSDAY
// ------------------------------------------------------------------------------------ //

"DTF2_doomsday.alarm"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"		"PITCH_NORM"
	
	"wave"		")ambient_mp3\alarms\doomsday_lift_alarm.mp3"
}

"DTF2_doomsday.lift_start"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"			"PITCH_NORM"
	
	"wave"		"misc\doomsday_lift_start.wav"
}

"DTF2_doomsday.lift_loop"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"			"PITCH_NORM"
	
	"wave"		"misc\doomsday_lift_loop.wav"
}

"DTF2_doomsday.lift_stop"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"			"PITCH_NORM"
	
	"wave"		"misc\doomsday_lift_stop.wav"
}


"DTF2_doomsday.cap_spinstart"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.5"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"			"PITCH_NORM"
	
	"wave"		")misc\doomsday_cap_spin_start.wav"
}

"DTF2_doomsday.cap_spinloop"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.9"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"			"PITCH_NORM"
	
	"wave"		")misc\doomsday_cap_spin_loop.wav"
}

"DTF2_doomsday.cap_spin_end"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.5"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"			"PITCH_NORM"
	
	"wave"		")misc\doomsday_cap_spin_end.wav"
}

"DTF2_doomsday.cap_open_start"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"			"PITCH_NORM"
	
	"wave"		")misc\doomsday_cap_open_start.wav"
}

"DTF2_doomsday.cap_open_end"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"			"PITCH_NORM"
	
	"wave"		")misc\doomsday_cap_open_end.wav"
}

"DTF2_doomsday.cap_close_start"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.7"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"			"PITCH_NORM"
	
	"wave"		")misc\doomsday_cap_close_start.wav"
}

"DTF2_doomsday.cap_close_end"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.7"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"			"PITCH_NORM"
	
	"wave"		")misc\doomsday_cap_close_end.wav"
}

"DTF2_doomsday.cap_close_quick"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"			"PITCH_NORM"
	
	"wave"		"misc\doomsday_cap_close_quick.wav"
}

"DTF2_doomsday.warhead"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"			"PITCH_NORM"
	
	"wave"		"misc\doomsday_warhead.wav"
}

"DTF2_doomsday.pickupwarhead"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_30dB"
	"pitch"			"PITCH_NORM"
	
	"wave"		"misc\doomsday_pickup.wav"
}

"DTF2_doomsday.radiation"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.3"
	"soundlevel"  	"SNDLVL_50dB"
	"pitch"			"PITCH_NORM"
	
	"wave"		")misc\doomsday_radiation.wav"
}

"DTF2_doomsday.blank"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"			"PITCH_NORM"
	
	"wave"		"misc\blank.wav"
}

"DTF2_doomsday.launch"
{
	"channel"		"CHAN_WEAPON"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	
	"wave"		")misc\doomsday_missile_launch.wav"
}

"DTF2_doomsday.launch_exp"
{
	"channel"		"CHAN_WEAPON"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	
	"wave"		")misc\doomsday_missile_explosion.wav"
}

// ------------------------------------------------------------------------------------ //
// Halloween 2012
// ------------------------------------------------------------------------------------ //

"DTF2_Halloween.WheelofFate"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			"misc/halloween/hwn_wheel_of_fate.wav"
}
"DTF2_Halloween.WheelofFateQuiet"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_40dB"
	"pitch"			"PITCH_NORM"
	"wave"			"misc/halloween/hwn_wheel_of_fate.wav"
}

"DTF2_Halloween.Merasmus_Spell"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_120dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/merasmus_spell.wav"
}
"DTF2_Halloween.Merasmus_TP_In"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_120dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/merasmus_appear.wav"
}

"DTF2_Halloween.Merasmus_TP_Out"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_120dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/merasmus_disappear.wav"
}

"DTF2_Halloween.Merasmus_Float"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_95dB"
	"pitch"			"PITCH_NORM"
	"wave"			"misc/halloween/merasmus_float.wav"
}

"DTF2_Halloween.Merasmus_Hiding_Explode"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_110dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/merasmus_hiding_explode.wav"
}

"DTF2_Halloween.Merasmus_Stun"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_120dB"
	"pitch"			"PITCH_NORM"
	"wave"			"misc/halloween/merasmus_stun.wav"
}


"DTF2_Halloween.Merasmus_Death"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_120dB"
	"pitch"			"PITCH_NORM"
	"wave"			"misc/halloween/merasmus_death.wav"
}

"DTF2_Halloween.dance_loop"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.5"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"misc/halloween/hwn_dance_loop.wav"
}

"DTF2_Halloween.dance_howl"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.5"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"misc/halloween/hwn_dance_howl.wav"
}

"DTF2_Halloween.plumes_long"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.7"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"			"PITCH_NORM"
	"wave"			"misc/halloween/hwn_plumes_capture.wav"
}

"DTF2_Halloween.plumes_short"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.7"
	"soundlevel"  	"SNDLVL_85dB"
	"pitch"			"PITCH_NORM"
	"wave"			"misc/halloween/hwn_plumes_short.wav"
}

// ------------------------------------------------------------------------------------ //
// Halloween 2013
// ------------------------------------------------------------------------------------ //


"DTF2_Halloween.ClockTick"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_150dB"
	"pitch"		"PITCH_NORM"

	"wave"		")misc/halloween/clock_tick.wav"
}

"DTF2_Halloween.hellride"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			"misc/halloween/gotohell.wav"
}

"DTF2_Halloween.spell_pickup"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_100dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_pickup.wav"
}

"DTF2_Halloween.spell_pickup_rare"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_100dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_pickup_rare.wav"
}

"DTF2_Halloween.spelltick_a"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.5"
	"soundlevel"  	"SNDLVL_100dB"
	"pitch"			"PITCH_NORM"
	"wave"			"misc/halloween/spelltick_01.wav"
}

"DTF2_Halloween.spelltick_b"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.5"
	"soundlevel"  	"SNDLVL_100dB"
	"pitch"			"PITCH_NORM"
	"wave"			"misc/halloween/spelltick_02.wav"
}

"DTF2_Halloween.spelltick_set"
{
	"channel"		"CHAN_STATIC"
	"volume"		".25"
	"soundlevel"  	"SNDLVL_100dB"
	"pitch"			"PITCH_NORM"
	"wave"			"misc/halloween/spelltick_set.wav"
}

"DTF2_Halloween.skeleton_break"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/skeleton_break.wav"
}

"DTF2_Halloween.skeleton_laugh_small"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_120dB"
	"pitch"			"PITCH_NORM"
	"rndwave"
	{
		"wave"		"misc\halloween\skeletons\skelly_small_01.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_02.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_03.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_04.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_05.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_06.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_07.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_08.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_09.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_10.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_11.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_12.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_13.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_14.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_15.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_16.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_17.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_18.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_19.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_20.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_21.wav"
		"wave"		"misc\halloween\skeletons\skelly_small_22.wav"
	}
}

"DTF2_Halloween.skeleton_laugh_medium"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.8"
	"soundlevel"  	"SNDLVL_110dB"
	"pitch"			"PITCH_NORM"
	"rndwave"
	{
		"wave"		"misc\halloween\skeletons\skelly_medium_01.wav"
		"wave"		"misc\halloween\skeletons\skelly_medium_02.wav"
		"wave"		"misc\halloween\skeletons\skelly_medium_03.wav"
		"wave"		"misc\halloween\skeletons\skelly_medium_04.wav"
	}
}

"DTF2_Halloween.skeleton_laugh_giant"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_120dB"
	"pitch"			"PITCH_NORM"
	"rndwave"
	{
		"wave"		"misc\halloween\skeletons\skelly_giant_01.wav"
		"wave"		"misc\halloween\skeletons\skelly_giant_02.wav"
		"wave"		"misc\halloween\skeletons\skelly_giant_03.wav"
	}

}


"DTF2_Halloween.spell_athletic"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_athletic.wav"
}

"DTF2_Halloween.spell_bat_cast"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_bat_cast.wav"
}

"DTF2_Halloween.spell_bat_impact"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_bat_impact.wav"
}

"DTF2_Halloween.spell_blastjump"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_blast_jump.wav"
}

"DTF2_Halloween.spell_fireball_cast"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_fireball_cast.wav"
}

"DTF2_Halloween.spell_fireball_impact"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_fireball_impact.wav"
}

"DTF2_Halloween.spell_lightning_cast"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_lightning_ball_cast.wav"
}

"DTF2_Halloween.spell_lightning_impact"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_lightning_ball_impact.wav"
}

"DTF2_Halloween.spell_meteor_cast"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_meteor_cast.wav"
}

"DTF2_Halloween.spell_meteor_impact"
{
	"channel"		"CHAN_STATIC"
	"volume"		".5"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_meteor_impact.wav"
}

"DTF2_Halloween.spell_mirv_cast"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_mirv_cast.wav"
}

"DTF2_Halloween.spell_mirv_explode_primary"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_mirv_explode_primary.wav"
}

"DTF2_Halloween.spell_mirv_explode_secondary"
{
	"channel"		"CHAN_STATIC"
	"volume"		".25"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_mirv_explode_secondary.wav"
}

"DTF2_Halloween.spell_overheal"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_overheal.wav"
}

"DTF2_Halloween.spell_skeleton_horde_cast"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_skeleton_horde_cast.wav"
}

"DTF2_Halloween.spell_skeleton_horde_rise"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_skeleton_horde_rise.wav"
}

"DTF2_Halloween.spell_spawn_boss"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_spawn_boss.wav"
}

"DTF2_Halloween.spell_spawn_boss_disappear"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_spawn_boss_disappear.wav"
}

"DTF2_Halloween.spell_stealth"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_stealth.wav"
}

"DTF2_Halloween.spell_teleport"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_140dB"
	"pitch"			"PITCH_NORM"
	"wave"			")misc/halloween/spell_teleport.wav"
}


// Misc

"DTF2_Ambient.metrotrain_passby"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_85dB"
	"rndwave"
	{
		"wave"	"ambient_mp3/metrotrain_passby_01.mp3"
		"wave"	"ambient_mp3/metrotrain_passby_02.mp3"
	}
}

"DTF2_General.banana_slip" 
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_85dB"
	"wave"	")misc/banana_slip.wav"

}


// Rottenburg map - Large metal door sounds

"DTF2_Hugedoor.openstart"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_140dB"
	"wave"			")ambient_mp3/rottenburg/tunneldoor_open.mp3"
}

"DTF2_Hugedoor.opencomplete"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.8"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_100dB"
	"wave"			")ambient_mp3/rottenburg/tunneldoor_open_complete.mp3"
}

"DTF2_Hugedoor.closedloud"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_140dB"
	"wave"			")ambient_mp3/rottenburg/tunneldoor_closed_loud.mp3"
}

"DTF2_Hugedoor.closedsoft"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.8"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_100dB"
	"wave"			")ambient_mp3/rottenburg/tunneldoor_closed_quiet.mp3"
}

// Rottenburg map - Portcullis over upgrades shop

"DTF2_Portcullis.down_start"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.7"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_85dB"
	"wave"			")ambient_mp3/rottenburg/portcullis_down.mp3"
}

"DTF2_Portcullis.down_slam"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.8"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_85dB"
	"wave"			")ambient_mp3/rottenburg/portcullis_slam.mp3"
}

"DTF2_Portcullis.up_start"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.8"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_85dB"
	"wave"			")ambient_mp3/rottenburg/portcullis_up.mp3"
}

// Rottenburg map - Bomb carrier pushed into pit under bell tower

"DTF2_Belltower.Ring"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_NONE"
	"wave"			")ambient_mp3/rottenburg/rottenburg_belltower.mp3"
}

// Rottenburg map - Palisade barrier smash

"DTF2_MVM.BarrierSmash"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"100"
	"soundlevel"  	"SNDLVL_NONE"
	"wave"			")ambient_mp3/rottenburg/barrier_smash.mp3"
}

// New item drop crates

"DTF2_ui.crate_open_short"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/item_open_crate_short.wav"
}


"DTF2_ui.cratesmash_common"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.7"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/itemcrate_smash_common.wav"
}

"DTF2_ui.cratesmash_rare_long"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.8"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/itemcrate_smash_mid.wav"
}

"DTF2_ui.cratesmash_ultrarare_short"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/itemcrate_smash_ultrarare_short.wav"
}

"DTF2_ui.cratesmash_ultrarare_long"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/itemcrate_smash_ultrarare.wav"
}

"DTF2_ui.cratesmash_ultrarare_long_fireworks"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/itemcrate_smash_ultrarare_fireworks.wav"
}

"DTF2_Equipment.RocketPack_Activate"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_94dB"
	"wave"		")weapons/rocket_ll_shoot.wav"
}
"DTF2_Parachute_open"
{
	"channel"		"CHAN_WEAPON"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_75dB"
	"wave"			")items/para_open.wav"
}
"DTF2_Parachute_close"
{
	"channel"		"CHAN_WEAPON"
	"volume"		"0.3"
	"soundlevel"	"SNDLVL_75dB"
	"wave"			")items/para_close.wav"
}

// ------------------------------------------------------------------------------------ //
// Halloween 2014
// ------------------------------------------------------------------------------------ //

"DTF2_Halloween.CarCheer"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_NONE"
	"rndwave"
	{
		"wave"	")ambient_mp3/bumper_car_cheer1.mp3"
		"wave"	")ambient_mp3/bumper_car_cheer2.mp3"
		"wave"	")ambient_mp3/bumper_car_cheer3.mp3"
	}
}

"DTF2_Halloween.CarBoo"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"pitch"		"100"
	"soundlevel"  	"SNDLVL_NONE"
	"rndwave"
	{
		"wave"	")ambient_mp3/bumper_car_boo1.mp3"
		"wave"	")ambient_mp3/bumper_car_boo2.mp3"
		"wave"	")ambient_mp3/bumper_car_boo3.mp3"
	}
}

"DTF2_Halloween.Quack"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1"
	"pitch"		"90, 110"
	"rndwave"
	{
		"wave"	")ambient_mp3/bumper_car_quack1.mp3"
		"wave"	")ambient_mp3/bumper_car_quack2.mp3"
		"wave"	")ambient_mp3/bumper_car_quack3.mp3"
		"wave"	")ambient_mp3/bumper_car_quack4.mp3"
		"wave"	")ambient_mp3/bumper_car_quack5.mp3"
		"wave"	")ambient_mp3/bumper_car_quack9.mp3"
		"wave"	")ambient_mp3/bumper_car_quack11.mp3"
	}
}

"DTF2_Halloween.FloorBreak"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_110dB"
	"volume"	"1"
	"wave"	")ambient_mp3/bumper_car_floor_break.mp3"
}
"DTF2_Halloween.FloorBreakReverse"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_110dB"
	"volume"	"1"
	"wave"	")ambient_mp3/bumper_car_floor_break_reverse.mp3"
}

"DTF2_Halloween.HammerGearCrankSlow"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_148dB"
	"volume"	"1"
	"wave"	"ambient_mp3/puthammerhere.mp3"
}

"DTF2_Halloween.HammerGearCrankFast"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_148dB"
	"volume"	"1"
	"wave"	"ambient_mp3/puthammerhere.mp3"
}

"DTF2_Halloween.HammerImpactLarge"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_148dB"
	"volume"	"1"
	"wave"	"ambient_mp3/puthammerhere.mp3"
}

"DTF2_Halloween.HammerImpactSmall"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_148dB"
	"volume"	"1"
	"wave"	"ambient_mp3/puthammerhere.mp3"
}

"DTF2_Halloween.HammerImpactSmall2"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_148dB"
	"volume"	"1"
	"wave"	"ambient_mp3/puthammerhere.mp3"
}

"DTF2_Halloween.HammerImpactBloodyBoneCrunch"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_148dB"
	"volume"	"1"
	"wave"	"ambient_mp3/puthammerhere.mp3"
}

"DTF2_Halloween.PlatformAlarm"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_148dB"
	"volume"	"1"
	"wave"	"ambient/alarms/klaxon1.wav"
}

"DTF2_Halloween.BellRing.Scout"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_148dB"
	"volume"	"1"
	"wave"	"mvm/melee_impacts/metal_gloves_hit_robo02.wav"
}

"DTF2_Halloween.BellRing.Heman"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_148dB"
	"volume"	"1"
	"wave"	"mvm/melee_impacts/metal_gloves_hit_robo02.wav"
}

"DTF2_Halloween.BellRing.PushOver"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_148dB"
	"volume"	"1"
	"wave"	"mvm/melee_impacts/metal_gloves_hit_robo02.wav"
}

"DTF2_Halloween.BellRing.Wizard"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_148dB"
	"volume"	"1"
	"wave"	"mvm/melee_impacts/metal_gloves_hit_robo02.wav"
}

"DTF2_Halloween.BellRing.WoodImpact"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_148dB"
	"volume"	"1"
	"wave"	"mvm/melee_impacts/metal_gloves_hit_robo02.wav"
}

"DTF2_Halloween.DuckPickup.Pos"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_148dB"
	"volume"	"1"
	"wave"	"misc/halloween/duck_pickup_pos_01.wav"
}

"DTF2_Halloween.DuckPickup.Neg"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_148dB"
	"volume"	"1"
	"wave"	"misc/halloween/duck_pickup_neg_01.wav"
}
"DTF2_Halloween.HammerImpact"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_150dB"
	"volume"	"1"
	"wave"	"misc/halloween/strongman_fast_impact_01.wav"
}

"DTF2_Duck.Quack"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_75dB"
	"volume"	"0.75"
	"pitch"		"85, 105"
	"rndwave"
	{
		"wave"	")ambient_mp3/bumper_car_quack1.mp3"
		"wave"	")ambient_mp3/bumper_car_quack2.mp3"
		"wave"	")ambient_mp3/bumper_car_quack3.mp3"
		"wave"	")ambient_mp3/bumper_car_quack4.mp3"
		"wave"	")ambient_mp3/bumper_car_quack5.mp3"
		"wave"	")ambient_mp3/bumper_car_quack9.mp3"
		"wave"	")ambient_mp3/bumper_car_quack11.mp3"
	}
}

// ------------------------------------------------------------------------------------ //
// Powerups
// ------------------------------------------------------------------------------------ //

"DTF2_Mannpower.InvulnerableOn"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"soundlevel"  	"SNDLVL_NONE"
	"wave"		"player/mannpower_invulnerable.wav"
}

"DTF2_Powerup.PickUpTemp.Crit"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_crits.wav"
}

"DTF2_Powerup.PickUpTemp.Uber"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_uber.wav"
}

"DTF2_Powerup.PickUpKnockout"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_knockout.wav"
}

"DTF2_Powerup.Knockout_Melee_Hit"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"  	"SNDLVL_120dB"
	"wave"			")items/powerup_pickup_knockout_melee_hit.wav"
}

"DTF2_Powerup.Volume.Use"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_team_revenge.wav"
}

"DTF2_Powerup.PickUpBase"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_base.wav"
}

"DTF2_Powerup.PickUpAgility"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_agility.wav"
}

"DTF2_Powerup.PickUpHaste"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_haste.wav"
}

"DTF2_Powerup.PickUpPrecision"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_precision.wav"
}

"DTF2_Powerup.PickUpRegeneration"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_regeneration.wav"
}

"DTF2_Powerup.PickUpResistance"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_resistance.wav"
}

"DTF2_Powerup.PickUpStrength"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_strength.wav"
}

"DTF2_Powerup.PickUpVampire"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_vampire.wav"
}

"DTF2_Powerup.PickUpSupernova"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_supernova.wav"
}

"DTF2_Powerup.PickUpSupernovaActivate"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_supernova_activate.wav"
}

"DTF2_Powerup.PickUpPlague"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_plague.wav"
}

"DTF2_Powerup.PickUpPlagueInfected"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_plague_infected.wav"
}

"DTF2_Powerup.PickUpPlagueInfectedLoop"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_105dB"

	"wave"			")items/powerup_pickup_plague_infected_loop.wav"
}

"DTF2_Powerup.PickUpThorns"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_120dB"

	"wave"			")items/powerup_pickup_warlock.wav"
}

"DTF2_Powerup.PickUpReflect"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_120dB"
	"pitch"			"PITCH_NORM"
	"wave"			")items/powerup_pickup_reflect.wav"
}

"DTF2_Powerup.Reflect.Reflect"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_105dB"
	"pitch"			"PITCH_NORM"
	"wave"			")items/powerup_pickup_reflect_reflect_damage.wav"
}

"DTF2_Powerup.PickUpKing"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_120dB"
	"pitch"			"PITCH_NORM"
	"wave"			")items/powerup_pickup_king.wav"
}

"DTF2_Powerup.ReducedDamage"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_105dB"
	"pitch"			"95,100"
	"wave"			")items/powerup_pickup_reduced_damage.wav"
}

// ------------------------------------------------------------------------------------ //
// Quests
// ------------------------------------------------------------------------------------ //

"DTF2_Quest.Alert"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_alert.wav"
}

"DTF2_Quest.StatusTick"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_status_tick.wav"
}

"DTF2_Quest.StatusTickBonus"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_status_tick_bonus.wav"
}

"DTF2_Quest.StatusTickComplete"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_status_tick_complete.wav"
}

"DTF2_Quest.StatusTickBonusComplete"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_status_tick_bonus_complete.wav"
} 

"DTF2_Quest.StatusComplete"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_status_complete.wav"
}

"DTF2_Quest.Decode"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_decode.wav"
}

"DTF2_Quest.FolderOpen"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_folder_open.wav"
}

"DTF2_Quest.FolderClose"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_folder_close.wav"
}

"DTF2_Quest.TurnInDecode"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_turn_in_decode.wav"
}


"DTF2_Quest.TurnInAccepted"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_turn_in_accepted.wav"
}

"DTF2_Quest.OperationPassUse"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_operation_pass_use.wav"
}

"DTF2_Quest.OperationPassBuy"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_operation_pass_buy.wav"
}

// ------------------------------------------------------------------------------------ //
// Halloween 2015
// ------------------------------------------------------------------------------------ //

"DTF2_Quest.StatusTickCompleteHalloween"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_status_tick_complete_halloween.wav"
}

"DTF2_Quest.StatusTickBonusCompleteHalloween"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_status_tick_bonus_complete_halloween.wav"
} 

"DTF2_Quest.DecodeHalloween"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_decode_halloween.wav"
}

"DTF2_Quest.FolderOpenHalloween"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_folder_open_halloween.wav"
}

"DTF2_Quest.FolderCloseHalloween"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_folder_close_halloween.wav"
}

"DTF2_Quest.TurnInDecodeHalloween"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_turn_in_decode_halloween.wav"
}


"DTF2_Quest.TurnInAcceptedHalloween"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/quest_turn_in_accepted_halloween.wav"
}

// ------------------------------------------------------------------------------------ //
// MATCHMAKING
// ------------------------------------------------------------------------------------ //

"DTF2_MatchMaking.RoundStart"
{
	"channel"		"CHAN_STATIC"
	"volume"		".4"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_round_start.wav"
} 

"DTF2_MatchMaking.RoundStartCasual"
{
	"channel"		"CHAN_STATIC"
	"volume"		".4"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_round_start_casual.wav"
}

"DTF2_MatchMaking.MatchEndBlueWinMusic"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_match_end_blue_win_music.wav"
} 

"DTF2_MatchMaking.MatchEndRedWinMusic"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_match_end_red_win_music.wav"
}

"DTF2_MatchMaking.MatchEndWinMusicCasual"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_match_end_win_music_casual.wav"
}

"DTF2_MatchMaking.MatchEndLoseMusicCasual"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_match_end_lose_music_casual.wav"
}

"DTF2_MatchMaking.RoundEndBlueWinMusic"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_round_end_blue_win_music.wav"
} 

"DTF2_MatchMaking.RoundEndRedWinMusic"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_round_end_red_win_music.wav"
} 

"DTF2_MatchMaking.RoundEndStalemateMusic"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_round_end_stalemate_music.wav"
} 
 
"DTF2_MatchMaking.DoorOpen"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_door_open.wav"
} 

"DTF2_MatchMaking.DoorOpenUnlock"
{
	"channel"		"CHAN_STATIC"
	"volume"		".15"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_door_open_unlock.wav"
}

"DTF2_MatchMaking.DoorClose"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_door_close.wav"
} 

"DTF2_MatchMaking.DoorCloseLock"
{
	"channel"		"CHAN_STATIC"
	"volume"		".15"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_door_close_lock.wav"
}

"DTF2_MatchMaking.ScoreboardPanelSlide"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_scoreboardpanel_slide.wav"
} 

"DTF2_MatchMaking.None"
{
	"channel"		"CHAN_STATIC"
	"volume"		".25"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_medal_none.wav"
}  

"DTF2_MatchMaking.Bronze"
{
	"channel"		"CHAN_STATIC"
	"volume"		".25"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_medal_bronze.wav"
} 

"DTF2_MatchMaking.Silver"
{
	"channel"		"CHAN_STATIC"
	"volume"		".25"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_medal_silver.wav"
} 

"DTF2_MatchMaking.Gold"
{
	"channel"		"CHAN_STATIC"
	"volume"		".25"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_medal_gold.wav"
} 

"DTF2_MatchMaking.XPChime"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_xp_chime.wav"
} 

"DTF2_MatchMaking.RankUp"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_rank_up.wav"
} 

"DTF2_MatchMaking.RankDownMedalShoot"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_75dB"
	"volume"		"1"
	"wave"			")ui/mm_rank_down_medal_shoot.wav"
}

"DTF2_MatchMaking.RankDownMedalShootImpact"
{
	"channel"			"CHAN_STATIC"
	"soundlevel"		"SNDLVL_75dB"
	"pitch"				"PITCH_NORM"
	"volume"			"1"
	"wave"				")ui/mm_rank_down_medal_shoot_impact.wav"
}

"DTF2_MatchMaking.MedalSpinHit"
{
	"channel"			"CHAN_STATIC"
	"soundlevel"		"SNDLVL_75dB"
	"pitch"				"PITCH_NORM"
	"volume"			"1"
	"wave"				")ui/mm_medal_spin_hit.wav"
}

"DTF2_MatchMaking.RankOneAchieved"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_rank_one_achieved.wav"
} 

"DTF2_MatchMaking.RankTwoAchieved"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_rank_two_achieved.wav"
} 

"DTF2_MatchMaking.RankThreeAchieved"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_rank_three_achieved.wav"
} 

"DTF2_MatchMaking.RankFourAchieved"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_rank_four_achieved.wav"
} 

"DTF2_MatchMaking.LevelOneAchieved"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_level_one_achieved.wav"
}

"DTF2_MatchMaking.LevelTwoAchieved"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_level_two_achieved.wav"
} 

"DTF2_MatchMaking.LevelThreeAchieved"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_level_three_achieved.wav"
} 

"DTF2_MatchMaking.LevelFourAchieved"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_level_four_achieved.wav"
} 

"DTF2_MatchMaking.LevelFiveAchieved"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_level_five_achieved.wav"
} 

"DTF2_MatchMaking.LevelSixAchieved"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_level_six_achieved.wav"
}  

"DTF2_MatchMaking.RankProgressTickUp"
{
	"channel"		"CHAN_STATIC"
	"volume"		".5"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_rank_progress_tick_up.wav"
} 

"DTF2_MatchMaking.RankProgressTickDown"
{
	"channel"		"CHAN_STATIC"
	"volume"		".5"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_rank_progress_tick_down.wav"
} 

"DTF2_MatchMaking.MedalClick"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_medal_click.wav"
} 

"DTF2_MatchMaking.MedalClickRare"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_medal_click_rare.wav"
} 

"DTF2_MatchMaking.CompBanner"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_comp_banner.wav"
} 

"DTF2_MatchMaking.CompBannerUp"
{
	"channel"		"CHAN_STATIC"
	"volume"		".55"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_comp_banner_up.wav"
} 

"DTF2_MatchMaking.CompBannerDown"
{
	"channel"		"CHAN_STATIC"
	"volume"		".7"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/mm_comp_banner_down.wav"
}

"DTF2_DemoSupport.StartRecording"
{
	"channel"		"CHAN_STATIC"
	"volume"		"VOL_NORM"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/demosupport_start.wav"
}

"DTF2_DemoSupport.EndRecording"
{
	"channel"		"CHAN_STATIC"
	"volume"		"VOL_NORM"
	"soundlevel"  	"SNDLVL_NONE"
	"pitch"			"PITCH_NORM"
	"wave"			"ui/demosupport_stop.wav"
}
]==]
