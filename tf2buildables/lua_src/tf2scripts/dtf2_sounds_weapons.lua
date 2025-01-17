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

// ------------------------------------------------------------------------------------ //
//CRITPOWER
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_General.CritPower"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons/crit_power.wav"
}

// ------------------------------------------------------------------------------------ //
// RICOCHET
// ------------------------------------------------------------------------------------ //
"DTF2_FX_RicochetSound.Ricochet"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"soundlevel"  	"SNDLVL_96dB"
	"pitch"		"90, 110"

	"rndwave"
	{
		"wave"	"weapons/fx/rics/ric1.wav"
		"wave"	"weapons/fx/rics/ric2.wav"
		"wave"	"weapons/fx/rics/ric3.wav"
		"wave"	"weapons/fx/rics/ric4.wav"
		"wave"	"weapons/fx/rics/ric5.wav"
	}
}


// ------------------------------------------------------------------------------------ //
// NEARMISS
// ------------------------------------------------------------------------------------ //

"DTF2_Bullets.DefaultNearmiss"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_80dB"
	"pitch"			"PITCH_NORM"

	"rndwave"
	{
		"wave"	">weapons/fx/nearmiss/bulletLtoR08.wav"
		"wave"	">weapons/fx/nearmiss/bulletLtoR09.wav"
		"wave"	">weapons/fx/nearmiss/bulletLtoR10.wav"
		"wave"	">weapons/fx/nearmiss/bulletLtoR11.wav"
		"wave"	">weapons/fx/nearmiss/bulletLtoR13.wav"
		"wave"	">weapons/fx/nearmiss/bulletLtoR14.wav"
	}
}

// ------------------------------------------------------------------------------------ //
//BUILDER
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Builder.SwitchEngineer"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".74"
	"wave"		"weapons/draw_sapper_switch.wav"
}

// ------------------------------------------------------------------------------------ //
// BUMPER CAR
// ------------------------------------------------------------------------------------ //
"DTF2_BumperCar.Bump"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"soundlevel"  	"SNDLVL_76dB"
	"pitch"		"90, 110"

	"rndwave"
	{
		"wave"	"weapons/bumper_car_hit1.wav"
		"wave"	"weapons/bumper_car_hit2.wav"
		"wave"	"weapons/bumper_car_hit3.wav"
		"wave"	"weapons/bumper_car_hit4.wav"
		"wave"	"weapons/bumper_car_hit5.wav"
		"wave"	"weapons/bumper_car_hit6.wav"
		"wave"	"weapons/bumper_car_hit7.wav"
		"wave"	"weapons/bumper_car_hit8.wav"

	}
}

"DTF2_BumperCar.Accelerate"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		")weapons/bumper_car_accelerate.wav"
}

"DTF2_BumperCar.GoLoop"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		")weapons/bumper_car_go_loop.wav"
}

"DTF2_BumperCar.Decelerate"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		")weapons/bumper_car_decelerate.wav"
}

"DTF2_BumperCar.DecelerateQuick"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		")weapons/bumper_car_decelerate_quick.wav"
}

"DTF2_BumperCar.Spawn"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".25"
	"wave"		")weapons/bumper_car_spawn.wav"
}

"DTF2_BumperCar.SpawnFromLava"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".25"
	"wave"		")weapons/bumper_car_spawn_from_lava.wav"
}

"DTF2_BumperCar.SpeedBoostStart"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".75"
	"wave"		")weapons/bumper_car_speed_boost_start.wav"
}

"DTF2_BumperCar.SpeedBoostStop"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".75"
	"wave"		")weapons/bumper_car_speed_boost_stop.wav"
}

"DTF2_BumperCar.Screech"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		")weapons/bumper_car_screech.wav"
}

"DTF2_BumperCar.BumpIntoAir"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		")weapons/bumper_car_hit_into_air.wav"
}

"DTF2_BumperCar.BumpHard"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		")weapons/bumper_car_hit_hard.wav"
}

"DTF2_BumperCar.Jump"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".35"
	"wave"		")weapons/bumper_car_jump.wav"
}

"DTF2_BumperCar.JumpLand"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".25"
	"wave"		")weapons/bumper_car_jump_land.wav"
}

"DTF2_BumperCar.HitBall"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_120dB"
	"volume"	"1"
	"wave"		")weapons/bumper_car_hit_ball.wav"
}

"DTF2_BumperCar.HitGhost"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		")weapons/bumper_car_hit_ghost.wav"
}


// ------------------------------------------------------------------------------------ //
//WEAPON CHARGED
// ------------------------------------------------------------------------------------ //
"DTF2_TFPlayer.CritBoostOn"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		")weapons/weapon_crit_charged_on.wav"
}

"DTF2_TFPlayer.CritBoostOff"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		")weapons/weapon_crit_charged_off.wav"
}

// ------------------------------------------------------------------------------------ //
//PDA
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_PDA.DrawSpy"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".25"
	"wave"		"weapons/draw_pda_spy.wav"
}


"DTF2_Weapon_PDA.DrawEngineer"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".25"
	"wave"		"weapons/draw_pda_engineer.wav"
}

"DTF2_Weapon_PDA.AntennaeEngineer"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".25"
	"wave"		"weapons/draw_pda_antennae.wav"
}

// ------------------------------------------------------------------------------------ //
//DEAD RINGER
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_DeadRinger.DrawSpy"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".25"
	"wave"		"weapons/draw_dead_ringer_spy.wav"
}

// ------------------------------------------------------------------------------------ //
// HOLY MACKEREL
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_HolyMackerel.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/holy_mackerel1.wav"
		"wave"		"weapons/holy_mackerel2.wav"
		"wave"		"weapons/holy_mackerel3.wav"
	}

}

"DTF2_Weapon_HolyMackerel.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/holy_mackerel1.wav"
		"wave"		"weapons/holy_mackerel2.wav"
		"wave"		"weapons/holy_mackerel3.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// BASEBALL BAT
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_BaseballBat.HitBall"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/bat_baseball_hit1.wav"
		"wave"		")weapons/bat_baseball_hit2.wav"
	}

}

"DTF2_Weapon_BaseballBat.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons/bat_baseball_hit_flesh.wav"

}

"DTF2_Weapon_BaseballBat.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/bat_baseball_hit_world1.wav"
		"wave"		"weapons/bat_baseball_hit_world2.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// BASEBALL
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Baseball.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"soundlevel"	"SNDLVL_74dB"
	"rndwave"
	{
		"wave"		"weapons/baseball_hitworld1.wav"
		"wave"		"weapons/baseball_hitworld2.wav"
		"wave"		"weapons/baseball_hitworld3.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// BAT
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Bat.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".5"
	"wave"		"weapons/bat_draw.wav"
}

"DTF2_Weapon_Bat.DrawSwoosh1"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".45"
	"wave"		"weapons/bat_draw_swoosh1.wav"
}

"DTF2_Weapon_Bat.DrawSwoosh2"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".45"
	"wave"		"weapons/bat_draw_swoosh2.wav"
}


"DTF2_Weapon_Bat.DrawCatch"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1"
	"wave"		"weapons/metal_hit_hand1.wav"
}

"DTF2_Weapon_Ball.DrawCatch"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".25"
	"wave"		"weapons/metal_hit_hand1.wav"
}

"DTF2_Weapon_Bat.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/cbar_miss1.wav"
}

"DTF2_Weapon_Bat.MissCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/cbar_miss1_crit.wav"
}

"DTF2_Weapon_Bat.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons/bat_hit.wav"

}

"DTF2_Weapon_Bat.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hit1.wav"
		"wave"		")weapons/cbar_hit2.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// BOTTLE
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Bottle.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/cbar_miss1.wav"
}

"DTF2_Weapon_Bottle.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".5"
	"wave"		"weapons/draw_secondary.wav"
}

"DTF2_Weapon_Bottle.MissCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/cbar_miss1_crit.wav"
}

"DTF2_Weapon_Bottle.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/bottle_hit_flesh1.wav"
		"wave"		"weapons/bottle_hit_flesh2.wav"
		"wave"		"weapons/bottle_hit_flesh3.wav"
	}
}

"DTF2_Weapon_Bottle.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/bottle_hit1.wav"
		"wave"		"weapons/bottle_hit2.wav"
		"wave"		"weapons/bottle_hit3.wav"
	}
}

"DTF2_Weapon_Bottle.IntactHitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/bottle_intact_hit_world1.wav"
		"wave"		"weapons/bottle_intact_hit_world2.wav"
	}
}

"DTF2_Weapon_Bottle.BrokenHitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/bottle_broken_hit_world1.wav"
		"wave"		"weapons/bottle_broken_hit_world2.wav"
		"wave"		"weapons/bottle_broken_hit_world3.wav"
	}
}

"DTF2_Weapon_Bottle.IntactHitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/bottle_intact_hit_flesh1.wav"
		"wave"		"weapons/bottle_intact_hit_flesh2.wav"
		"wave"		"weapons/bottle_intact_hit_flesh3.wav"
	}
}

"DTF2_Weapon_Bottle.BrokenHitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/bottle_broken_hit_flesh1.wav"
		"wave"		"weapons/bottle_broken_hit_flesh2.wav"
		"wave"		"weapons/bottle_broken_hit_flesh3.wav"
	}
}

"DTF2_Weapon_Bottle.Break"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/bottle_break.wav"
}


// ------------------------------------------------------------------------------------ //
// Machete
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Machete.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/machete_swing.wav"
}

"DTF2_Weapon_Machete.MissCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/machete_swing_crit.wav"
}

"DTF2_Weapon_Machete.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hitbod1.wav"
		"wave"		")weapons/cbar_hitbod2.wav"
		"wave"		")weapons/cbar_hitbod3.wav"
	}
}

"DTF2_Weapon_Machete.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hit1.wav"
		"wave"		")weapons/cbar_hit2.wav"
	}
}

"DTF2_Weapon_Machete.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons/draw_machete_sniper.wav"
}

// ------------------------------------------------------------------------------------ //
// Fist
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Fist.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/bat_draw_swoosh1.wav"
		"wave"		"weapons/bat_draw_swoosh2.wav"
	}
}

"DTF2_Weapon_Fist.MissCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/fist_swing_crit.wav"
}

"DTF2_Weapon_Fist.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hitbod1.wav"
		"wave"		")weapons/cbar_hitbod2.wav"
		"wave"		")weapons/cbar_hitbod3.wav"
	}
}

"DTF2_Weapon_Fist.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/fist_hit_world1.wav"
		"wave"		"weapons/fist_hit_world2.wav"
	}
}


"DTF2_Weapon_Fist.HitHand"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1"
	"rndwave"
	{
		"wave"		"weapons/metal_hit_hand1.wav"
		"wave"		"weapons/metal_hit_hand2.wav"
		"wave"		"weapons/metal_hit_hand3.wav"
	}
}

"DTF2_Weapon_Fist.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_melee.wav"
}

// ------------------------------------------------------------------------------------ //
// Metal Gloves
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_MetalGloves.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/boxing_gloves_swing1.wav"
		"wave"		"weapons/boxing_gloves_swing2.wav"
		"wave"		"weapons/boxing_gloves_swing4.wav"
	}
}

"DTF2_Weapon_MetalGloves.MissCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/fist_swing_crit.wav"
}

"DTF2_Weapon_MetalGloves.CritHit"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/metal_gloves_hit_crit1.wav"
		"wave"		")weapons/metal_gloves_hit_crit2.wav"
		"wave"		")weapons/metal_gloves_hit_crit3.wav"
		"wave"		")weapons/metal_gloves_hit_crit4.wav"
	}
}

"DTF2_Weapon_MetalGloves.CritEnabled"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/boxing_gloves_crit_enabled.wav"
}

"DTF2_Weapon_MetalGloves.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/metal_gloves_hit_flesh1.wav"
		"wave"		")weapons/metal_gloves_hit_flesh2.wav"
		"wave"		")weapons/metal_gloves_hit_flesh3.wav"
		"wave"		")weapons/metal_gloves_hit_flesh4.wav"
	}
}

"DTF2_Weapon_MetalGloves.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/metal_gloves_hit_world1.wav"
		"wave"		")weapons/metal_gloves_hit_world2.wav"
		"wave"		")weapons/metal_gloves_hit_world3.wav"
		"wave"		")weapons/metal_gloves_hit_world4.wav"
	}
}


"DTF2_Weapon_MetalGloves.HitGlove"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1"
	"wave"		"weapons/metal_gloves_hit.wav"

}

"DTF2_Weapon_MetalGloves.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_melee.wav"
}

// ------------------------------------------------------------------------------------ //
// Boxing Gloves
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_BoxingGloves.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"pitch"		"95, 105"
	"rndwave"
	{
		"wave"		"weapons/boxing_gloves_swing1.wav"
		"wave"		"weapons/boxing_gloves_swing2.wav"
		"wave"		"weapons/boxing_gloves_swing4.wav"
	}
}

"DTF2_Weapon_BoxingGloves.MissCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/fist_swing_crit.wav"
}

"DTF2_Weapon_BoxingGloves.CritHit"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/boxing_gloves_hit_crit1.wav"
		"wave"		"weapons/boxing_gloves_hit_crit2.wav"
		"wave"		"weapons/boxing_gloves_hit_crit3.wav"
	}
}

"DTF2_Weapon_BoxingGloves.CritEnabled"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/boxing_gloves_crit_enabled.wav"
}

"DTF2_Weapon_BoxingGloves.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/boxing_gloves_hit1.wav"
		"wave"		"weapons/boxing_gloves_hit2.wav"
		"wave"		"weapons/boxing_gloves_hit3.wav"
		"wave"		"weapons/boxing_gloves_hit4.wav"
	}
}

"DTF2_Weapon_BoxingGloves.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/fist_hit_world1.wav"
		"wave"		"weapons/fist_hit_world2.wav"
	}
}


"DTF2_Weapon_BoxingGloves.HitGlove"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1"
	"wave"		"weapons/boxing_gloves_hit.wav"

}

"DTF2_Weapon_BoxingGloves.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_melee.wav"
}

// ------------------------------------------------------------------------------------ //
// BRANDING IRON
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_FireAxe.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/cbar_miss1.wav"
}

"DTF2_Weapon_FireAxe.MissCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/cbar_miss1_crit.wav"
}

"DTF2_Weapon_FireAxe.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/axe_hit_flesh1.wav"
		"wave"		")weapons/axe_hit_flesh2.wav"
		"wave"		")weapons/axe_hit_flesh3.wav"
	}
}

"DTF2_Weapon_FireAxe.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hit1.wav"
		"wave"		")weapons/cbar_hit2.wav"
	}
}

"DTF2_Weapon_FireAxe.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_melee.wav"
}

// called from model?
"DTF2_Weapon_BrandingIron.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_melee.wav"
}

// ------------------------------------------------------------------------------------ //
// UBERSAW
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_BoneSaw.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/cbar_miss1.wav"
}

"DTF2_Weapon_BoneSaw.MissCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/cbar_miss1_crit.wav"
}

"DTF2_Weapon_UberSaw.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/ubersaw_hit1.wav"
		"wave"		"weapons/ubersaw_hit2.wav"
		"wave"		"weapons/ubersaw_hit3.wav"
		"wave"		"weapons/ubersaw_hit4.wav"
	}
}

"DTF2_Weapon_BoneSaw.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hit1.wav"
		"wave"		")weapons/cbar_hit2.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// BONESAW
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_BoneSaw.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/cbar_miss1.wav"
}

"DTF2_Weapon_BoneSaw.MissCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/cbar_miss1_crit.wav"
}

"DTF2_Weapon_BoneSaw.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hitbod1.wav"
		"wave"		")weapons/cbar_hitbod2.wav"
		"wave"		")weapons/cbar_hitbod3.wav"
	}
}

"DTF2_Weapon_BoneSaw.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hit1.wav"
		"wave"		")weapons/cbar_hit2.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// CLUB
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Club.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/cbar_miss1.wav"
}

"DTF2_Weapon_Club.MissCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/cbar_miss1_crit.wav"
}

"DTF2_Weapon_Club.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hitbod1.wav"
		"wave"		")weapons/cbar_hitbod2.wav"
		"wave"		")weapons/cbar_hitbod3.wav"
	}
}

"DTF2_Weapon_Club.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hit1.wav"
		"wave"		")weapons/cbar_hit2.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// CROWBAR
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Crowbar.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/cbar_miss1.wav"
}

"DTF2_Weapon_Crowbar.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hitbod1.wav"
		"wave"		")weapons/cbar_hitbod2.wav"
		"wave"		")weapons/cbar_hitbod3.wav"
	}
}

"DTF2_Weapon_Crowbar.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hit1.wav"
		"wave"		")weapons/cbar_hit2.wav"
	}
}

"DTF2_Weapon_Crowbar.Melee_HitWorld"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.7"
	"soundlevel"	"SNDLVL_NORM"
	"pitch"		"90,120"

	"rndwave"
	{
		"wave"		"weapons/crowbar/crowbar_impact1.wav"
		"wave"		"weapons/crowbar/crowbar_impact2.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// FLAG
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Flag.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/cbar_miss1.wav"
}

"DTF2_Weapon_Flag.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hitbod1.wav"
		"wave"		")weapons/cbar_hitbod2.wav"
		"wave"		")weapons/cbar_hitbod3.wav"
	}
}

"DTF2_Weapon_Flag.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/bottle_hit1.wav"
		"wave"		"weapons/bottle_hit2.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// FLAME THROWER
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_FlameThrower.FireStart"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_start.wav"
}

"DTF2_Weapon_FlameThrower.FireLoop"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_loop.wav"
}

"DTF2_Weapon_FlameThrower.FireLoopCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_loop_crit.wav"
}

"DTF2_Weapon_FlameThrower.FireEnd"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_end.wav"
}

"DTF2_Weapon_FlameThrower.FireHit"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_fire_hit.wav"
}

"DTF2_Weapon_FlameThrower.FireHitHard"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		"weapons/flame_thrower_fire_hitloop.wav"
}

"DTF2_Weapon_FlameThrower.PilotLoop"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".25"
	"wave"		"weapons/flame_thrower_pilot.wav"
}

"DTF2_Weapon_FlameThrower.FireRocket"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		"misc/null.wav"
}

"DTF2_Weapon_FlameThrower.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_primary.wav"
}

"DTF2_Weapon_FlameThrower.Fire"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_start.wav"
}

"DTF2_Weapon_FlameThrower.WindDown"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_end.wav"
}

"DTF2_Weapon_FlameThrower.AirBurstAttack"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"pitch"		"95,105"
	"soundlevel"	"SNDLVL_90db"
	"wave"		")weapons/flame_thrower_airblast.wav"
}

"DTF2_Weapon_FlameThrower.AirBurstAttackDeflect"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"pitch"		"95,105"
	"soundlevel"	"SNDLVL_84db"
	"wave"		")weapons/flame_thrower_airblast_rocket_redirect.wav"
}

// ------------------------------------------------------------------------------------ //
// DEGREASER
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Degreaser.FireStart"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_104dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_dg_start.wav"
}

"DTF2_Weapon_Degreaser.FireLoop"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_104dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_dg_loop.wav"
}

"DTF2_Weapon_Degreaser.FireLoopCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_104dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_dg_loop_crit.wav"
}

"DTF2_Weapon_Degreaser.FireEnd"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_104dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_dg_end.wav"
}

// ------------------------------------------------------------------------------------ //
// BACK BURNER 
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_BackBurner.FireStart"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_bb_start.wav"
}

"DTF2_Weapon_BackBurner.FireLoop"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_bb_loop.wav"
}

"DTF2_Weapon_BackBurner.FireLoopCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_bb_loop_crit.wav"
}

"DTF2_Weapon_BackBurner.FireEnd"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_bb_end.wav"
}

"DTF2_Weapon_BackBurner.FireHit"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_fire_hit.wav"
}

"DTF2_Weapon_BackBurner.PilotLoop"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".25"
	"wave"		"weapons/flame_thrower_pilot.wav"
}

"DTF2_Weapon_BackBurner.FireRocket"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		"misc/null.wav"
}

"DTF2_Weapon_BackBurner.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_primary.wav"
}

"DTF2_Weapon_BackBurner.Fire"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_bb_start.wav"
}

"DTF2_Weapon_BackBurner.WindDown"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/flame_thrower_bb_end.wav"
}

// ------------------------------------------------------------------------------------ //
// Flare Gun
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_FlareGun.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/flaregun_shoot.wav"
}

"DTF2_Weapon_FlareGun.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/flaregun_shoot_crit.wav"
}

"DTF2_Weapon_FlareGun.ModeSwitch"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons/stickybomblauncher_det.wav"
}

"DTF2_Weapon_FlareGun.BoltBack"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	".65"
	"wave"		"weapons/flaregun_boltback.wav"
}

"DTF2_Weapon_FlareGun.BoltForward"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	".65"
	"wave"		"weapons/flaregun_boltforward.wav"
}

"DTF2_Weapon_FlareGun.WorldReload"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".45"
	"wave"		"weapons/flaregun_worldreload.wav"
}

"DTF2_Weapon_FlareGun.ClipEmpty"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.7"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/pistol/pistol_empty.wav"
}

"DTF2_Weapon_FlareGun.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_secondary.wav"
}

"DTF2_Weapon_FlareGun.Grab"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".74"
	"rndwave"
	{
		"wave"		"weapons/metal_hit_hand1.wav"
		"wave"		"weapons/metal_hit_hand2.wav"
		"wave"		"weapons/metal_hit_hand3.wav"
	}
}

"DTF2_Weapon_FlareGun.TubeOpen"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/grenade_launcher_drum_open.wav"
}

"DTF2_Weapon_FlareGun.Reload"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		"1"
	"wave"		"weapons/grenade_launcher_drum_load.wav"
}

"DTF2_Weapon_FlareGun.TubeCloseStart"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		"1"
	"wave"		"weapons/flaregun_tube_closestart.wav"
}

"DTF2_Weapon_FlareGun.TubeCloseFinish"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		"1"
	"wave"		"weapons/flaregun_tube_closefinish.wav"
}

// ------------------------------------------------------------------------------------ //
// STICKY BOMB LAUNCHER
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_StickyBombLauncher.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/stickybomblauncher_shoot.wav"
}

"DTF2_Weapon_StickyBombLauncher.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/stickybomblauncher_shoot_crit.wav"
}

"DTF2_Weapon_StickyBombLauncher.ModeSwitch"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons/stickybomblauncher_det.wav"
}

"DTF2_Weapon_StickyBombLauncher.BoltBack"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	".45"
	"wave"		"weapons/stickybomblauncher_boltback.wav"
}

"DTF2_Weapon_StickyBombLauncher.BoltForward"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	".45"
	"wave"		"weapons/stickybomblauncher_boltforward.wav"
}

"DTF2_Weapon_StickyBombLauncher.WorldReload"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".35"
	"wave"		"weapons/stickybomblauncher_worldreload.wav"
}

"DTF2_Weapon_StickyBombLauncher.ChargeUp"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		"1"
	"wave"		"weapons/stickybomblauncher_charge_up.wav"
}

// ------------------------------------------------------------------------------------ //
// GRENADE LAUNCHER
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_GrenadeLauncher.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/grenade_launcher_shoot.wav"
}

"DTF2_Weapon_GrenadeLauncher.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/grenade_launcher_shoot_crit.wav"
}

"DTF2_Weapon_GrenadeLauncher.DrumStart"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		".4"
	"wave"		"weapons/grenade_launcher_drum_start.wav"
}

"DTF2_Weapon_GrenadeLauncher.DrumStop"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		".4"
	"wave"		"weapons/grenade_launcher_drum_stop.wav"
}

"DTF2_Weapon_GrenadeLauncher.DrumOpen"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		"1"
	"wave"		"weapons/grenade_launcher_drum_open.wav"
}

"DTF2_Weapon_GrenadeLauncher.DrumLoad"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		"1"
	"wave"		"weapons/grenade_launcher_drum_load.wav"
}

"DTF2_Weapon_GrenadeLauncher.DrumClose"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		"1"
	"wave"		"weapons/grenade_launcher_drum_close.wav"
}

"DTF2_Weapon_GrenadeLauncher.WorldReload"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/grenade_launcher_worldreload.wav"
}

"DTF2_Weapon_GrenadeLauncher.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_secondary.wav"
}	

"DTF2_Weapon_GrenadeLauncher.ModeSwitch"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons/stickybomblauncher_det.wav"
}

"DTF2_Weapon_GrenadeLauncher.ChargeUp"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		".45"
	"wave"		"weapons/stickybomblauncher_charge_up.wav"
}

// ------------------------------------------------------------------------------------ //
// LOCH N LOAD
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_LocknLoad.Dud"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/loch_n_load_dud.wav"
}

"DTF2_Weapon_LochnLoad.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/loch_n_load_shoot.wav"
}

"DTF2_Weapon_LochnLoad.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/loch_n_load_shoot_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// TACKY GRENADIER
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_TackyGrenadier.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/tacky_grenadier_shoot.wav"
}

"DTF2_Weapon_TackyGrenadier.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/tacky_grenadier_shoot_crit.wav"
}

"DTF2_Weapon_TackyGrendadier.Explode"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_95dB"
	"volume"	"1.0"
	"pitch"		"PITCH_NORM"
	"rndwave"
	{
		"wave"		")weapons/tacky_grenadier_explode1.wav"
		"wave"		")weapons/tacky_grenadier_explode2.wav"
		"wave"		")weapons/tacky_grenadier_explode3.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// AIR BURSTER
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_AirBurster.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/air_burster_shoot.wav"
}

"DTF2_Weapon_AirBurster.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/air_burster_shoot_crit.wav"
}

"DTF2_Weapon_AirBurster.Explode"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_95dB"
	"volume"	"1.0"
	"pitch"		"PITCH_NORM"
	"rndwave"
	{
		"wave"		")weapons/air_burster_explode1.wav"
		"wave"		")weapons/air_burster_explode2.wav"
		"wave"		")weapons/air_burster_explode3.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// KNIFE
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Knife.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/knife_swing.wav"
}

"DTF2_Weapon_Knife.MissCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/knife_swing_crit.wav"
}

"DTF2_Weapon_Knife.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/blade_hit1.wav"
		"wave"		")weapons/blade_hit2.wav"
		"wave"		")weapons/blade_hit3.wav"
	}
}

"DTF2_Weapon_Knife.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons/blade_hitworld.wav"

}

"DTF2_Weapon_Knife.Open1"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"
	"wave"		"weapons/knife_open1.wav"
}

"DTF2_Weapon_Knife.Open2"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"
	"wave"		"weapons/knife_open2.wav"
}

"DTF2_Weapon_Knife.Open3"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"
	"wave"		"weapons/knife_open3.wav"
}

"DTF2_Weapon_Knife.Open4"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"
	"wave"		"weapons/knife_open4.wav"
}

"DTF2_Weapon_Knife.Open5"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"
	"wave"		"weapons/knife_open5.wav"
}

"DTF2_Weapon_Knife.Open6"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"
	"wave"		"weapons/knife_open6.wav"
}


"DTF2_Weapon_Knife.Open7"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"
	"wave"		"weapons/knife_open7.wav"
}

"DTF2_Weapon_Knife.Open8"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_NORM"
	"pitch"		"PITCH_NORM"
	"wave"		"weapons/knife_open8.wav"
}

"DTF2_Weapon_Knife.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_melee.wav"
}

// ------------------------------------------------------------------------------------ //
// QUICK FIX
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Quick_Fix.Healing"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		")weapons/quick_fix_heal.wav"
}

// ------------------------------------------------------------------------------------ //
// MEDIGUN
// ------------------------------------------------------------------------------------ //
"DTF2_WeaponMedigun.Healing"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		")weapons/medigun_heal.wav"
}

"DTF2_WeaponMedigun.HealingDisrupt"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		")weapons/medigun_heal_disrupt.wav"
}

"DTF2_WeaponMedigun.Charged"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"		"1"
	"wave"		"weapons/medigun_charged.wav"
}

"DTF2_WeaponMedigun.NoTarget"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74Db"
	"volume"	"1.0"
	"wave"		")weapons/medigun_no_target.wav"
}

"DTF2_Weapon_Medikit.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hitbod1.wav"
		"wave"		")weapons/cbar_hitbod2.wav"
		"wave"		")weapons/cbar_hitbod3.wav"
	}
}

"DTF2_Weapon_Medikit.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hit1.wav"
		"wave"		")weapons/cbar_hit2.wav"
	}
}

"DTF2_Weapon_Medigun.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_secondary.wav"
}


// ------------------------------------------------------------------------------------ //
// OVERDOSE
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Overdose.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1"
	"wave"		")weapons/tf_medic_syringe_overdose.wav"
}

"DTF2_Weapon_Overdose.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1"
	"wave"		")weapons/tf_medic_syringe_overdose_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// SYRINGEGUN
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_SyringeGun.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1"
	"wave"		")weapons/syringegun_shoot.wav"
}

"DTF2_Weapon_SyringeGun.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1"
	"wave"		")weapons/syringegun_shoot_crit.wav"
}

"DTF2_Weapon_SyringeGun.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_primary.wav"
}

"DTF2_Weapon_SyringeGun.Reload1"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"volume"		".75"
	"wave"		"weapons/syringegun_reload_air1.wav"
}

"DTF2_Weapon_SyringeGun.Reload2"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"		".5"
	"wave"		"weapons/syringegun_reload_glass2.wav"
}


"DTF2_Weapon_SyringeGun.Reload3"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"		".75"
	"wave"		"weapons/syringegun_reload_air2.wav"
}

"DTF2_Weapon_SyringeGun.WorldReload"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"		".75"
	"wave"		"weapons/syringegun_worldreload.wav"
}

"DTF2_Weapon_SyringeGun.ClipEmpty"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.7"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/pistol/pistol_empty.wav"
}

// ------------------------------------------------------------------------------------ //
// GATLING
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Gatling.Reload"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/default_reload.wav"
}

"DTF2_Weapon_Gatling.ClipEmpty"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons/gatling_empty.wav"
}

"DTF2_Weapon_Gatling.Spin"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons/gatling_spin.wav"
}

"DTF2_Weapon_Gatling.WindUp"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/gatling_wind_up.wav"
}


"DTF2_Weapon_Gatling.Fire"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/gatling_shoot.wav"
}

"DTF2_Weapon_Gatling.FireCrit"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/gatling_shoot_crit.wav"
}

"DTF2_Weapon_Gatling.WindDown"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/gatling_wind_down.wav"
}

"DTF2_Weapon_Gatling.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_minigun_heavy.wav"
}

// ------------------------------------------------------------------------------------ //
// TOMISLAV
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Tomislav.Fire"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/tomislav_shoot.wav"
}

"DTF2_Weapon_Tomislav.FireCrit"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/tomislav_shoot_crit.wav"
}

"DTF2_Weapon_Tomislav.WindDown"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/tomislav_wind_down.wav"
}

"DTF2_Weapon_Tomislav.WindUp"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		"weapons/tomislav_wind_up.wav"
}

// ------------------------------------------------------------------------------------ //
// MINIGUN
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Minigun.Reload"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/default_reload.wav"
}

"DTF2_Weapon_Minigun.ClipEmpty"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons/minigun_empty.wav"
}

"DTF2_Weapon_Minigun.Spin"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons/minigun_spin.wav"
}

"DTF2_Weapon_Minigun.WindUp"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/minigun_wind_up.wav"
}


"DTF2_Weapon_Minigun.Fire"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/minigun_shoot.wav"
}

"DTF2_Weapon_Minigun.FireCrit"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/minigun_shoot_crit.wav"
}

"DTF2_Weapon_Minigun.WindDown"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/minigun_wind_down.wav"
}

"DTF2_Weapon_Minigun.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_minigun_heavy.wav"
}

// ------------------------------------------------------------------------------------ //
// MINIfun
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Minifun.Reload"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/default_reload.wav"
}

"DTF2_Weapon_Minifun.ClipEmpty"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons/minifun_empty.wav"
}

"DTF2_Weapon_Minifun.Spin"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons/minifun_spin.wav"
}

"DTF2_Weapon_Minifun.WindUp"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/minifun_wind_up.wav"
}


"DTF2_Weapon_Minifun.Fire"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/minifun_shoot.wav"
}

"DTF2_Weapon_Minifun.FireCrit"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/minifun_shoot_crit.wav"
}

"DTF2_Weapon_Minifun.WindDown"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/minifun_wind_down.wav"
}

"DTF2_Weapon_Minifun.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_minigun_heavy.wav"
}

// ------------------------------------------------------------------------------------ //
// PIPE
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Pipe.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/cbar_miss1.wav"
}

"DTF2_Weapon_Pipe.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hitbod1.wav"
		"wave"		")weapons/cbar_hitbod2.wav"
		"wave"		")weapons/cbar_hitbod3.wav"
	}
}

"DTF2_Weapon_Pipe.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hit1.wav"
		"wave"		")weapons/cbar_hit2.wav"
	}
}


// ------------------------------------------------------------------------------------ //
// ENFORCER
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Enforcer.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/tf_spy_enforcer_revolver_01.wav"
		"wave"		")weapons/tf_spy_enforcer_revolver_02.wav"
		"wave"		")weapons/tf_spy_enforcer_revolver_03.wav"
		"wave"		")weapons/tf_spy_enforcer_revolver_04.wav"
		"wave"		")weapons/tf_spy_enforcer_revolver_05.wav"
		"wave"		")weapons/tf_spy_enforcer_revolver_06.wav"
	}
}

"DTF2_Weapon_Enforcer.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/tf_spy_enforcer_revolver_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// PISTOL
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Pistol.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/pistol_shoot.wav"
}

"DTF2_Weapon_Pistol.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/pistol_shoot_crit.wav"
}

"DTF2_Weapon_Pistol.ClipEmpty"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.7"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/pistol/pistol_empty.wav"
}

"DTF2_Weapon_Pistol.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_secondary.wav"
}

"DTF2_Weapon_Pistol.Draw2"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons/draw_pistol_engineer.wav"
}

"DTF2_Weapon_Pistol.ClipIn"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.35"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/pistol_clipin.wav"
}

"DTF2_Weapon_Pistol.ReloadScout"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/pistol_reload_scout.wav"
}

"DTF2_Weapon_Pistol.WorldReload"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"		".5"
	"wave"		"weapons/pistol_worldreload.wav"
}

"DTF2_Weapon_Pistol.WorldReloadEngineer"
{
	"channel"		"CHAN_STATIC"
	"volume"		"0.35"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/pistol_clipin.wav"
}

// ------------------------------------------------------------------------------------ //
// REVOLVER
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Revolver.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/revolver_shoot.wav"
}

"DTF2_Weapon_Revolver.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/revolver_shoot_crit.wav"
}

"DTF2_Weapon_Revolver.Reload1"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/revolver_reload_cylinder_open.wav"
}

"DTF2_Weapon_Revolver.Reload2"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/revolver_reload_cylinder_arm.wav"
}

"DTF2_Weapon_Revolver.Reload3"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/revolver_reload_cylinder_close.wav"
}

"DTF2_Weapon_Revolver.WorldReload"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/revolver_worldreload.wav"
}

"DTF2_Weapon_Revolver.ClipEmpty"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.7"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/pistol/pistol_empty.wav"
}

"DTF2_Weapon_Revolver.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_secondary.wav"
}

// ------------------------------------------------------------------------------------ //
// LETRANGER
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Letranger.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	".85"
	"wave"		")weapons/letranger_shoot.wav"
}

"DTF2_Weapon_Letranger.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	".85"
	"wave"		")weapons/letranger_shoot_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// AMBASSADOR
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Ambassador.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/ambassador_shoot.wav"
}

"DTF2_Weapon_Ambassador.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/ambassador_shoot_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// SHORT STOP
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Short_Stop.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_84dB"
	"volume"	"1.0"
	"wave"		")weapons/short_stop_shoot.wav"
}

"DTF2_Weapon_Short_Stop.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_84dB"
	"volume"	"1.0"
	"wave"		")weapons/short_stop_shoot_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// SODA POPPER
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Soda_Popper.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/scatter_gun_double_bonk_shoot.wav"
}

"DTF2_Weapon_Soda_Popper.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/scatter_gun_double_bonk_shoot_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// SCATTER GUN DOUBLE
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Scatter_Gun_Double.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/scatter_gun_double_shoot.wav"
}

"DTF2_Weapon_Scatter_Gun_Double.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/scatter_gun_double_shoot_crit.wav"
}

"DTF2_Weapon_DoubleBarrel.TubeOpen"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons/scatter_gun_double_tube_open.wav"
}

"DTF2_Weapon_DoubleBarrel.ShellsOut"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons/scatter_gun_double_shells_out.wav"
}

"DTF2_Weapon_DoubleBarrel.ShellsIn"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons/scatter_gun_double_shells_in.wav"
}

"DTF2_Weapon_DoubleBarrel.TubeClose"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons/scatter_gun_double_tube_close.wav"
}

// ------------------------------------------------------------------------------------ //
// BackShot Shotty
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_BackShot_Shotty.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/tf2_backshot_shotty.wav"
}

"DTF2_Weapon_BackShot_Shotty.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/tf2_backshot_shotty_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// Back Scatter
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Back_Scatter.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/tf2_back_scatter.wav"
}

"DTF2_Weapon_Back_Scatter.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/tf2_back_scatter_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// SCATTER GUN
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Scatter_Gun.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/scatter_gun_shoot.wav"
}

"DTF2_Weapon_Scatter_Gun.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/scatter_gun_shoot_crit.wav"
}

"DTF2_Weapon_Scatter_Gun.Empty"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/shotgun_empty.wav"
}

"DTF2_Weapon_Scatter_Gun.Reload"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/scatter_gun_reload.wav"
}

"DTF2_Weapon_Scatter_Gun.WorldReload"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/scatter_gun_worldreload.wav"
}

"DTF2_Weapon_Scatter_Gun.Pump"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/scatter_gun_worldreload.wav"
}

"DTF2_Weapon_Scatter_Gun.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_secondary.wav"
}

// ------------------------------------------------------------------------------------ //
// SHOTGUN
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Shotgun.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/shotgun_shoot.wav"
}

"DTF2_Weapon_Shotgun.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/shotgun_shoot_crit.wav"
}

"DTF2_Weapon_Shotgun.Empty"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/shotgun_empty.wav"
}

"DTF2_Weapon_Shotgun.Reload"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/shotgun_reload.wav"
}

"DTF2_Weapon_Shotgun.WorldReload"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/shotgun_worldreload.wav"
}

"DTF2_Weapon_Shotgun.Pump"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/shotgun_cock.wav"
}

"DTF2_Weapon_Shotgun.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_secondary.wav"
}

"DTF2_Weapon_ShotgunPyro.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_shotgun_pyro.wav"
}

"DTF2_Weapon_ShotgunEngineer.Cock_Back"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/shotgun_cock_back.wav"
}

"DTF2_Weapon_ShotgunEngineer.Cock_Forward"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/shotgun_cock_forward.wav"
}

// ------------------------------------------------------------------------------------ //
// SHOVEL
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Shovel.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/shovel_swing.wav"
}

"DTF2_Weapon_Shovel.MissCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/shovel_swing_crit.wav"
}

"DTF2_Weapon_Shovel.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/axe_hit_flesh1.wav"
		"wave"		")weapons/axe_hit_flesh2.wav"
		"wave"		")weapons/axe_hit_flesh3.wav"
	}
}

"DTF2_Weapon_Shovel.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hit1.wav"
		"wave"		")weapons/cbar_hit2.wav"
	}
}

"DTF2_Weapon_Shovel.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons/draw_shovel_soldier.wav"
}

// ------------------------------------------------------------------------------------ //
// Nail Gun
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_NailGun.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/nail_gun_shoot.wav"
}

"DTF2_Weapon_NailGun.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/nail_gun_shoot_crit.wav"
}

"DTF2_Weapon_NailGun.Reload"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.7"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/smg1/smg1_reload.wav"
}

"DTF2_Weapon_NailGun.ClipEmpty"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.7"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/pistol/pistol_empty.wav"
}

"DTF2_Weapon_NailGun.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_primary.wav"
}

// ------------------------------------------------------------------------------------ //
// SMG
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_SMG.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/smg_shoot.wav"
}

"DTF2_Weapon_SMG.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/smg_shoot_crit.wav"
}

"DTF2_Weapon_SMG.WorldReload"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.35"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/smg_worldreload.wav"
}

"DTF2_Weapon_SMG.ClipEmpty"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.7"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/pistol/pistol_empty.wav"
}

"DTF2_Weapon_SMG.ClipOut"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.35"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/smg_clip_out.wav"
}

"DTF2_Weapon_SMG.ClipIn"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.35"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/smg_clip_in.wav"
}


"DTF2_Weapon_SMG.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_secondary.wav"
}

// ------------------------------------------------------------------------------------ //
// SUPER SMG
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_SuperSMG.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/smg_shoot.wav"
}

"DTF2_Weapon_SuperSMG.Reload"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.7"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/smg1/smg1_reload.wav"
}

"DTF2_Weapon_SuperSMG.ClipEmpty"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.7"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/pistol/pistol_empty.wav"
}

// ------------------------------------------------------------------------------------ //
// BAZAAR BARGAIN
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Bazaar_Bargain.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/tf_sniper_bazaar_bargain_01.wav"
		"wave"		")weapons/tf_sniper_bazaar_bargain_02.wav"
		"wave"		")weapons/tf_sniper_bazaar_bargain_03.wav"
		"wave"		")weapons/tf_sniper_bazaar_bargain_04.wav"
		"wave"		")weapons/tf_sniper_bazaar_bargain_05.wav"
	}
}

"DTF2_Weapon_Bazaar_Bargain.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons\tf_sniper_bazaar_bargain_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// SYDNEY SLEEPER
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_SydneySleeper.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/sniper_sydneysleeper_shoot.wav"
}

"DTF2_Weapon_SydneySleeper.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/sniper_sydneysleeper_shoot_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// CLASSIC SNIPER RIFLE
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_ClassicSniperRifle.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/sniper_rifle_classic_shoot.wav"
}

"DTF2_Weapon_ClassicSniperRifle.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/sniper_rifle_classic_shoot_crit.wav"
}


// ------------------------------------------------------------------------------------ //
// SNIPER RIFLE
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_SniperRifle.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/sniper_shoot.wav"
}

"DTF2_Weapon_SniperRifle.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/sniper_shoot_crit.wav"
}

"DTF2_Weapon_SniperRifle.WorldReload"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.35"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/sniper_worldreload.wav"
}

"DTF2_Weapon_SniperRifle.ClipEmpty"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.7"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/pistol/pistol_empty.wav"
}

"DTF2_Weapon_SniperRifle.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_primary.wav"
}

"DTF2_Weapon_SniperRifle.BoltForward"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".45"
	"wave"		"weapons/sniper_bolt_back.wav"
}

"DTF2_Weapon_SniperRifle.BoltBack"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".45"
	"wave"		"weapons/sniper_bolt_forward.wav"
}

// ------------------------------------------------------------------------------------ //
// TRANQUILIZER GUN
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Tranq.Single"
{
	"channel"	"CHAN_WEAPON"	
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		"misc/null.wav"
}

"DTF2_Weapon_Tranq.Reload"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.7"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/smg1/smg1_reload.wav"
}

"DTF2_Weapon_Tranq.ClipEmpty"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.7"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/pistol/pistol_empty.wav"
}

"DTF2_Weapon_Tranq.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_primary.wav"
}

// ------------------------------------------------------------------------------------ //
// WRANGLER
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Wrangler.Ouch"
{
	"channel"	"CHAN_VOICE"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".25"
	"rndwave"
	{
		"wave"		"vo/engineer_negativevocalization07.mp3"
		"wave"		"vo/engineer_negativevocalization08.mp3"
		"wave"		"vo/engineer_negativevocalization09.mp3"
	}
}

// ------------------------------------------------------------------------------------ //
// WRENCH
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Wrench.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		"weapons/wrench_swing.wav"
}

"DTF2_Weapon_Wrench.MissCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/wrench_swing_crit.wav"
}

"DTF2_Weapon_Wrench.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/cbar_hitbod1.wav"
		"wave"		")weapons/cbar_hitbod2.wav"
		"wave"		")weapons/cbar_hitbod3.wav"
	}
}

"DTF2_Weapon_Wrench.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		".5"
	"pitch"		"100, 110"
	"wave"		"weapons/wrench_hit_world.wav"

}

"DTF2_Weapon_Wrench.HitBuilding_Success"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".5"
	"rndwave"
	{
		"wave"		"weapons/wrench_hit_build_success1.wav"
		"wave"		"weapons/wrench_hit_build_success2.wav"
	}
}

"DTF2_Weapon_Wrench.HitBuilding_Failure"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".5"
	"wave"		"weapons/wrench_hit_build_fail.wav"
}

"DTF2_Weapon_Wrench.HitHand"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".1"
	"rndwave"
	{
		"wave"		"weapons/metal_hit_hand1.wav"
		"wave"		"weapons/metal_hit_hand2.wav"
		"wave"		"weapons/metal_hit_hand3.wav"
	}
}

"DTF2_Weapon_Wrench.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_primary.wav"
}


"DTF2_Weapon_Wrench.Draw2"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons/draw_wrench_engineer.wav"
}

// ------------------------------------------------------------------------------------ //
// LIBERY LAUNCHER
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Liberty_Launcher.Single"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_94dB"
	"wave"		")weapons/rocket_ll_shoot.wav"
}

"DTF2_Weapon_Liberty_Launcher.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_94dB"
	"wave"		")weapons/rocket_ll_shoot_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// RPG
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_RPG.Single"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_94dB"
	"wave"		")weapons/rocket_shoot.wav"
}

"DTF2_Weapon_RPG.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_94dB"
	"wave"		")weapons/rocket_shoot_crit.wav"
}

"DTF2_Weapon_RPG.Draw"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_primary.wav"
}

"DTF2_Weapon_RPG.Reload"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons/rocket_reload.wav"
}

"DTF2_Weapon_RPG.WorldReload"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons/rocket_reload.wav"
}


// ------------------------------------------------------------------------------------ //
// RPG Direct Hit
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_RPG_DirectHit.Single"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_94dB"
	"wave"		")weapons/rocket_directhit_shoot.wav"
}

"DTF2_Weapon_RPG_DirectHit.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_94dB"
	"wave"		")weapons/rocket_directhit_shoot_crit.wav"
}

"DTF2_Weapon_RPG_DirectHit.Explode"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_95dB"
	"volume"	"1.0"
	"pitch"		"PITCH_NORM"
	"rndwave"
	{
		"wave"		")weapons/rocket_directhit_explode1.wav"
		"wave"		")weapons/rocket_directhit_explode2.wav"
		"wave"		")weapons/rocket_directhit_explode3.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// RPG Black Box
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_RPG_BlackBox.Single"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_94dB"
	"wave"		")weapons/rocket_blackbox_shoot.wav"
}

"DTF2_Weapon_RPG_BlackBox.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_94dB"
	"wave"		")weapons/rocket_blackbox_shoot_crit.wav"
}

"DTF2_Weapon_RPG_BlackBox.Explode"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_95dB"
	"volume"	"1.0"
	"pitch"		"PITCH_NORM"
	"rndwave"
	{
		"wave"		")weapons/rocket_blackbox_explode1.wav"
		"wave"		")weapons/rocket_blackbox_explode2.wav"
		"wave"		")weapons/rocket_blackbox_explode3.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// RPG Cow Mangler
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_CowMangler.Single"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_94dB"
	"wave"		")weapons/cow_mangler_main_shot.wav"
}

"DTF2_Weapon_CowMangler.SingleCharged"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_NORM"
	"wave"		")weapons/cow_mangler_over_charge_shot.wav"
}

"DTF2_Weapon_CowMangler.Charging"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_94dB"
	"wave"		")weapons/cow_mangler_over_charge.wav"
}

"DTF2_Weapon_CowMangler.Explode"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"0.95,1.0"
	"soundlevel"	"SNDLVL_115dB"
	"pitch"		"95, 100"
	"rndwave"
	{
		"wave"	")weapons\cow_mangler_explosion_normal_01.wav"
		"wave"	")weapons\cow_mangler_explosion_normal_02.wav"
		"wave"	")weapons\cow_mangler_explosion_normal_03.wav"
	}
}

"DTF2_Weapon_CowMangler.ExplodeCharged"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"0.95,1.0"
	"soundlevel"	"SNDLVL_115dB"
	"pitch"		"95, 100"
	"rndwave"
	{
		"wave"	")weapons\cow_mangler_explosion_charge_01.wav"
		"wave"	")weapons\cow_mangler_explosion_charge_02.wav"
		"wave"	")weapons\cow_mangler_explosion_charge_03.wav"
	}
}

"DTF2_Weapon_CowMangler.Idle"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_NORM"
	"wave"		")weapons/cow_mangler_idle.wav"
}

"DTF2_Weapon_CowMangler.Reload"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".25"
	"rndwave"
	{
		"wave"	"weapons\cow_mangler_reload.wav"
		"wave"	"weapons\cow_mangler_reload_02.wav"
		"wave"	"weapons\cow_mangler_reload_03.wav"
		"wave"	"weapons\cow_mangler_reload_04.wav"
	}
}

"DTF2_Weapon_CowMangler.WorldReload"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".25"
	"rndwave"
	{
		"wave"	")weapons\cow_mangler_reload.wav"
		"wave"	")weapons\cow_mangler_reload_02.wav"
		"wave"	")weapons\cow_mangler_reload_03.wav"
		"wave"	")weapons\cow_mangler_reload_04.wav"
	}
}

"DTF2_Weapon_CowMangler.ReloadFinal"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".65"
	"wave"	"weapons\cow_mangler_reload_final.wav"
}

"DTF2_Weapon_CowMangler.WorldReloadFinal"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".25"
	"wave"	")weapons\cow_mangler_reload_final.wav"
}

// ------------------------------------------------------------------------------------ //
// Righteous Bison
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Bison.Single"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_NORM"
	"rndwave"
	{
		"wave"	")weapons\bison_main_shot_01.wav"
		"wave"	")weapons\bison_main_shot_02.wav"
	}
}

"DTF2_Weapon_Bison.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_NORM"
	"wave"	")weapons\bison_main_shot_crit.wav"
}

"DTF2_Weapon_Bison.Reload"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1"
	"pitch"		"110"
	"wave"		"weapons/bison_reload.wav"
}

"DTF2_Weapon_Bison.ProjectileImpactWorld"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_75dB"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"wave"			")weapons/fx/rics/bison_projectile_impact_world.wav"
}

"DTF2_Weapon_Bison.ProjectileImpactFlesh"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_75dB"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"wave"			")weapons/fx/rics/bison_projectile_impact_flesh.wav"
}
// ------------------------------------------------------------------------------------ //
// MAD MILK
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_MadMilk.Draw"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_75dB"
	
	"wave"	"weapons/draw_madmilk.wav"
}

// ------------------------------------------------------------------------------------ //
// JARATE
// ------------------------------------------------------------------------------------ //
"DTF2_Jar.Explode"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_95dB"
	
	"wave"	")weapons/jar_explode.wav"
}

"DTF2_Weapon_Jarate.Draw"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_75dB"
	
	"wave"	"weapons/draw_jarate.wav"
}

"DTF2_Weapon_Jarate.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_84dB"
	"volume"	"1"
	"wave"		"weapons/jar_single.wav"
}

//
// ------------------------------------------------------------------------------------ //
// Grenades
//
// Grenade Sounds
//
// ------------------------------------------------------------------------------------ //

// ------------------------------------------------------------------------------------ //
// BASE GRENADE
// ------------------------------------------------------------------------------------ //
"DTF2_BaseGrenade.Explode"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_76dB"

	"rndwave"
	{
		"wave"	"weapons/debris1.wav"
		"wave"	"weapons/debris2.wav"
	}
}

"DTF2_BaseGrenade.BounceSound"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"soundlevel"	"SNDLVL_74dB"
	"rndwave"
	{
		"wave"		"weapons/grenade_impact.wav"
		"wave"		"weapons/grenade_impact2.wav"
		"wave"		"weapons/grenade_impact3.wav"
	}
}

"DTF2_BaseExplosionEffect.Sound"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_95dB"
	"pitch"		"PITCH_NORM"

	"rndwave"
	{
			"wave"	")weapons/explode2.wav"
			"wave"	")weapons/explode3.wav"
			"wave"	")weapons/explode1.wav"
	}
}

"DTF2_Weapon_Grenade_Normal.Single"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_95dB"
	"wave"		"weapons/grenade_throw.wav"
}

// ------------------------------------------------------------------------------------ //
// PIPEBOMB GRENADE
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Grenade_Pipebomb.Explode"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_95dB"
	"volume"	"1.0"
	"pitch"		"PITCH_NORM"
	"rndwave"
	{
		"wave"		")weapons/pipe_bomb1.wav"
		"wave"		")weapons/pipe_bomb2.wav"
		"wave"		")weapons/pipe_bomb3.wav"
	}
}

"DTF2_Weapon_Grenade_Pipebomb.Bounce"
{
	"channel"		"CHAN_STATIC"
	"volume"		".5"
	"pitch" 		"96,100"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/grenade_impact.wav"
}

"DTF2_Weapon_Grenade_Pipebomb.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_primary.wav"
}

// ------------------------------------------------------------------------------------ //
// DET PACK GRENADE
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Grenade_Det_Pack.Plant"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/det_pack_plant.wav"
}

"DTF2_Weapon_Grenade_Det_Pack.Explode"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_95dB"
	"pitch"		"PITCH_NORM"
	"volume"	"1.0"
	"wave"		")weapons/det_pack_explode.wav"
}

"DTF2_Weapon_Grenade_Det_Pack.Timer"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/det_pack_timer.wav"
}

// ------------------------------------------------------------------------------------ //
// SAPPER
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Sapper.Plant"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/sapper_plant.wav"
}

"DTF2_Weapon_Sapper.Timer"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/sapper_timer.wav"
}

"DTF2_Weapon_Sapper.Draw"
{
	"channel"	"CHAN_AUTO"
	"volume"	".5"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/draw_primary.wav"
}

"DTF2_Weapon_Sapper.DrawSwitch"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/draw_sapper_switch.wav"
}

"DTF2_Weapon_Sapper.Removed"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_84dB"
	"wave"		"weapons/sapper_removed.wav"
}


// ------------------------------------------------------------------------------------ //
// ToolBox
// ------------------------------------------------------------------------------------ //


"DTF2_Weapon_ToolBox.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"		".5"
	"wave"		"weapons/draw_secondary.wav"
}

"DTF2_Weapon_ToolBox.Draw2"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"		".5"
	"wave"		"weapons/draw_toolbox_engineer.wav"
}

// ------------------------------------------------------------------------------------ //
// Gunslinger
// ------------------------------------------------------------------------------------ //


"DTF2_Weapon_Gunslinger.Draw"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"volume"		".75"
	"wave"		"weapons/gunslinger_draw.wav"
}

"DTF2_Weapon_Gunslinger.Swing"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"		".5"
	"wave"		"weapons/gunslinger_swing.wav"
}


"DTF2_Weapon_Gunslinger.ThreeHit"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"		".5"
	"wave"		"weapons/gunslinger_three_hit.wav"
}


// ------------------------------------------------------------------------------------ //
// Dispenser
// ------------------------------------------------------------------------------------ //

"DTF2_Building_Dispenser.Build1"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading5.wav"
}

"DTF2_Building_Dispenser.Build1a"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam3.wav"
}

"DTF2_Building_Dispenser.Build1b"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading1.wav"
}

"DTF2_Building_Dispenser.Build2"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_move_short1.wav"
}

"DTF2_Building_Dispenser.Build3"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_move_short2.wav"
}

"DTF2_Building_Dispenser.Build4"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam4.wav"
}

"DTF2_Building_Dispenser.Build5"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_move_short1.wav"
}

"DTF2_Building_Dispenser.Build6"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_move_short2.wav"
}

"DTF2_Building_Dispenser.Build7"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam1.wav"
}

"DTF2_Building_Dispenser.Build8"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_move_short2.wav"
}

"DTF2_Building_Dispenser.Build9"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam2.wav"
}

"DTF2_Building_Dispenser.Build10"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_move_short1.wav"
}

"DTF2_Building_Dispenser.Build11"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading5.wav"
}

"DTF2_Building_Dispenser.Build12"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam1.wav"
}

"DTF2_Building_Dispenser.Build13"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam1.wav"
}

"DTF2_Building_Dispenser.Build14"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam2.wav"
}

"DTF2_Building_Dispenser.Build15"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_move_medium3.wav"
}

"DTF2_Building_Dispenser.Build16"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading4.wav"
}

"DTF2_Building_Dispenser.Build17"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_move_medium2.wav"
}

"DTF2_Building_Dispenser.Build18"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/dispenser_bullet_chain.wav"
}

"DTF2_Building_Dispenser.Build18a"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading1.wav"
}

"DTF2_Building_Dispenser.Build19"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam4.wav"
}

"DTF2_Building_Dispenser.Build20"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/dispenser_bullet_chain2.wav"
}

"DTF2_Building_Dispenser.Build21"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_empty.wav"
}

"DTF2_Building_Dispenser.Build22"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam5.wav"
}

"DTF2_Building_Dispenser.Build23"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam5.wav"
}

"DTF2_Building_Dispenser.Build24"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam5.wav"
}

"DTF2_Building_Dispenser.Build24a"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading2.wav"
}

"DTF2_Building_Dispenser.Build24b"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam5.wav"
}

"DTF2_Building_Dispenser.Build24c"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam5.wav"
}

"DTF2_Building_Dispenser.Build24d"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam5.wav"
}


"DTF2_Building_Dispenser.Build25"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading2.wav"
}

"DTF2_Building_Dispenser.Explode"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/dispenser_explode.wav"
}

"DTF2_Building_Dispenser.Idle"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/dispenser_idle.wav"
}

"DTF2_Building_Dispenser.GenerateMetal"
{
	"channel"		"CHAN_VOICE"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/dispenser_generate_metal.wav"
}

"DTF2_Building_Dispenser.Heal"
{
	"channel"		"CHAN_WEAPON"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/dispenser_heal.wav"
}

// ------------------------------------------------------------------------------------ //
// Sentry Gun
// ------------------------------------------------------------------------------------ //

// Played when the gun acquired a new target
"DTF2_Building_Sentrygun.Alert"
{
	"channel"		"CHAN_WEAPON"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_88dB"
	"wave"			"weapons/sentry_spot.wav"
}

"DTF2_Building_Sentrygun.AlertTarget"
{
	"channel"		"CHAN_WEAPON"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_88dB"
	"wave"			"weapons/sentry_spot_client.wav"
}


// random played while the sentry it turning, without a target
"DTF2_Building_Sentrygun.Idle"
{
	"channel"		"CHAN_ITEM"
	"volume"		".75"
	"soundlevel"		"SNDLVL_84dB"
	"wave"			"weapons/sentry_scan.wav"
}

"DTF2_Building_Sentrygun.Idle2"
{
	"channel"		"CHAN_ITEM"
	"volume"		".75"
	"soundlevel"		"SNDLVL_84dB"
	"wave"			"weapons/sentry_scan2.wav"
}

"DTF2_Building_Sentrygun.Idle3"
{
	"channel"		"CHAN_ITEM"
	"volume"		".75"
	"soundlevel"		"SNDLVL_84dB"
	"wave"			"weapons/sentry_scan3.wav"
}

//played while the sentry is reloading rockets
"DTF2_Building_SentryGun.RocketSteam1"	
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1.0"
	"wave"		"weapons/sentry_upgrading_steam4.wav"
}

"DTF2_Building_SentryGun.RocketSteam2"	
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1.0"
	"wave"		"weapons/sentry_upgrading_steam1.wav"
}

"DTF2_Building_SentryGun.RocketMove1"	
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1.0"
	"wave"		"weapons/sentry_move_short2.wav"
}

"DTF2_Building_SentryGun.RocketMove2"	
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1.0"
	"wave"		"weapons/sentry_move_short1.wav"
}

"DTF2_Building_SentryGun.RocketClunk1"	
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons/sentry_upgrading4.wav"
}

"DTF2_Building_SentryGun.RocketClunk2"	
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons/sentry_upgrading5.wav"
}

// played when the sentry completes building, or is upgrade
"DTF2_Building_Sentrygun.Built"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			")weapons/sentry_finish.wav"
}

"DTF2_Building_Sentrygun.Fire"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/sentry_shoot.wav"
}

"DTF2_Building_Sentrygun.Fire2"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/sentry_shoot2.wav"
}

"DTF2_Building_Sentrygun.Fire3"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/sentry_shoot3.wav"
}

"DTF2_Building_Sentrygun.Empty"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		"weapons/sentry_empty.wav"
}

"DTF2_Building_Sentrygun.FireRocket"
{
	"channel"	"CHAN_ITEM"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_94dB"

	"wave"		")weapons/sentry_rocket.wav"
}

"DTF2_Building_Sentrygun.ShaftFire"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/sentry_shaft_shoot.wav"
}

"DTF2_Building_Sentrygun.ShaftFire2"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/sentry_shaft_shoot2.wav"
}

"DTF2_Building_Sentrygun.ShaftFire3"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/sentry_shaft_shoot3.wav"
}

"DTF2_Building_Sentrygun.ShaftLaserPass"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/sentry_shaft_laser_pass.wav"
}

"DTF2_Building_Sentrygun.Build1"
{
	"channel"		"CHAN_ITEM"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading1.wav"
}

"DTF2_Building_Sentrygun.BuildSteam1"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam1.wav"
}

"DTF2_Building_Sentrygun.Build1A"
{
	"channel"		"CHAN_ITEM"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading4.wav"
} 

"DTF2_Building_Sentrygun.Build1B"
{
	"channel"		"CHAN_ITEM"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading7.wav"
}


"DTF2_Building_Sentrygun.Build2"
{
	"channel"		"CHAN_ITEM"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_move_short2.wav"
}

"DTF2_Building_Sentrygun.BuildSteam2"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam2.wav"
}

"DTF2_Building_Sentrygun.Build3"
{
	"channel"		"CHAN_ITEM"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading2.wav"
}

"DTF2_Building_Sentrygun.BuildSteam3"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam3.wav"
}


"DTF2_Building_Sentrygun.Build4"
{
	"channel"		"CHAN_ITEM"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading4.wav"
}

"DTF2_Building_Sentrygun.Build5"
{
	"channel"		"CHAN_ITEM"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_move_medium3.wav"
}

"DTF2_Building_Sentrygun.Build6"
{
	"channel"		"CHAN_ITEM"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading5.wav"
}

"DTF2_Building_Sentrygun.BuildSteam4"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam4.wav"
}

"DTF2_Building_Sentrygun.Build7"
{
	"channel"		"CHAN_ITEM"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_move_long2.wav"
}

"DTF2_Building_Sentrygun.Build7A"
{
	"channel"		"CHAN_ITEM"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading7.wav"
}

"DTF2_Building_Sentrygun.BuildSteam5"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading_steam5.wav"
}

"DTF2_Building_Sentrygun.Build8"
{
	"channel"		"CHAN_ITEM"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading3.wav"
}

"DTF2_Building_Sentrygun.Build9"
{
	"channel"		"CHAN_ITEM"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading6.wav"
}

"DTF2_Building_Sentrygun.Build10"
{
	"channel"		"CHAN_ITEM"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_move_short2.wav"
}

"DTF2_Building_Sentrygun.Build11"
{
	"channel"		"CHAN_ITEM"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_upgrading8.wav"
}

"DTF2_Building_Sentrygun.Build12"
{
	"channel"		"CHAN_ITEM"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_move_long1.wav"
}

"DTF2_Building_Sentrygun.Build13"
{
	"channel"		"CHAN_BODY"
	"volume"		"1"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_wire_connect.wav"
}

"DTF2_Building_Sentry.Explode"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/sentry_explode.wav"
}

"DTF2_Building_Sentry.Damage"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_94dB"
	"rndwave"
	{
		"wave"		"weapons/sentry_damage1.wav"
		"wave"		"weapons/sentry_damage2.wav"
		"wave"		"weapons/sentry_damage3.wav"
		"wave"		"weapons/sentry_damage4.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// MINI SENTRY
// ------------------------------------------------------------------------------------ //

"DTF2_Building_MiniSentrygun.Fire"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/sentry_shoot_mini.wav"
}



// ------------------------------------------------------------------------------------ //
// TELEPORTER
// ------------------------------------------------------------------------------------ //
"DTF2_Building_Teleporter.Ready"
{
	"channel"	"CHAN_ITEM"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		")weapons/teleporter_ready.wav"
}

"DTF2_Building_Teleporter.Send"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"pitch"		"PITCH_NORM"
	"volume"	"1.0"
	"wave"		")weapons/teleporter_send.wav"
}

"DTF2_Building_Teleporter.Receive"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		")weapons/teleporter_receive.wav"
}

"DTF2_Building_Teleporter.Build1"
{
	"channel"		"CHAN_WEAPON"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/sentry_upgrading2.wav"
}

"DTF2_Building_Teleporter.Build1a"
{
	"channel"		"CHAN_WEAPON"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/sentry_upgrading1.wav"
}

"DTF2_Building_Teleporter.Build2"
{
	"channel"		"CHAN_ITEM"
	"volume"		".25"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/sentry_upgrading_steam2.wav"	
}

"DTF2_Building_Teleporter.Build2a"
{
	"channel"		"CHAN_STATIC"
	"volume"		".25"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/sentry_upgrading_steam5.wav"	
}


"DTF2_Building_Teleporter.Build2b"
{
	"channel"		"CHAN_WEAPON"
	"volume"		".25"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/sentry_move_medium2.wav"	
}


"DTF2_Building_Teleporter.Build2c"
{
	"channel"		"CHAN_ITEM"
	"volume"		"1"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/sentry_move_medium3.wav"
}

"DTF2_Building_Teleporter.Build3"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/sentry_upgrading_steam1.wav"
}


"DTF2_Building_Teleporter.Build3a"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/sentry_upgrading_steam2.wav"
}

"DTF2_Building_Teleporter.Build3b"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/sentry_upgrading_steam3.wav"
}

"DTF2_Building_Teleporter.Build4"
{
	"channel"		"CHAN_WEAPON"
	"volume"		".25"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/teleporter_build_open2.wav"
}

"DTF2_Building_Teleporter.Build4a"
{
	"channel"		"CHAN_WEAPON"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/sentry_upgrading_steam2.wav"
}

"DTF2_Building_Teleporter.Build5"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/sentry_move_short2.wav"
}


"DTF2_Building_Teleporter.SpinLevel1"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"pitch"		"PITCH_NORM"
	"volume"		"1.0"
	"wave"		"weapons/teleporter_spin.wav"
}

"DTF2_Building_Teleporter.SpinLevel2"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"pitch"		"PITCH_NORM"
	"volume"		"1.0"
	"wave"		"weapons/teleporter_spin2.wav"
}


"DTF2_Building_Teleporter.SpinLevel3"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"pitch"		"PITCH_NORM"
	"volume"		"1.0"
	"wave"		"weapons/teleporter_spin3.wav"
}

"DTF2_Building_Teleporter.Explode"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_74dB"
	"wave"			"weapons/teleporter_explode.wav"
}

// ------------------------------------------------------------------------------------ //
// BOW
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_CompoundBow.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1.0"
	"wave"		")weapons/bow_shoot.wav"
}

"DTF2_Weapon_CompoundBow.SinglePull"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	"1.0"
	"wave"		")weapons/bow_shoot_pull.wav"
}

"DTF2_Weapon_CompoundBow.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1.0"
	"wave"		")weapons/bow_shoot_crit.wav"
}

"DTF2_Weapon_CompoundBow.ClipEmpty"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.7"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		"weapons/pistol/pistol_empty.wav"
}



"DTF2_Weapon_CompoundBow.WorldReload"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"		".5"
	"wave"		"weapons/pistol_worldreload.wav"
}

"DTF2_Weapon_Bow.Draw"
{
	"channel"		"CHAN_STATIC"
	"volume"		".5"
	"soundlevel"	"SNDLVL_75dB"
	
	"wave"	"weapons/draw_bow.wav"
}

"DTF2_Weapon_Bow.PullShort"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_75dB"
	
	"wave"	")weapons/bow_shoot_pull_short.wav"
}

"DTF2_Weapon_Bow.PullReverse"
{
	"channel"		"CHAN_STATIC"
	"volume"		".5"
	"soundlevel"	"SNDLVL_75dB"
	
	"wave"	")weapons/bow_shoot_pull_reverse.wav"
}

"DTF2_Weapon_Bow.ArrowSlide"
{
	"channel"		"CHAN_STATIC"
	"volume"		".5"
	"soundlevel"	"SNDLVL_75dB"
	
	"wave"	"weapons/bow_arrow_slide.wav"
}

// ------------------------------------------------------------------------------------ //
// CRUSADERS CROSSBOW
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_CrusadersCrossbow.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		")weapons/crusaders_crossbow_shoot.wav"
}

"DTF2_Weapon_CrusadersCrossbow.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		")weapons/crusaders_crossbow_shoot_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// ARROW EFFECTS
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Arrow.ImpactFlesh"
{
	"channel"	"CHAN_STATIC"
	"volume"	".75"
	"pitch"			"PITCH_NORM"

	"rndwave"
	{
		"wave"	"weapons/fx/rics/arrow_impact_flesh.wav"
		"wave"	"weapons/fx/rics/arrow_impact_flesh2.wav"
		"wave"	"weapons/fx/rics/arrow_impact_flesh3.wav"
		"wave"	"weapons/fx/rics/arrow_impact_flesh4.wav"
	}
}

"DTF2_Weapon_Arrow.ImpactConcrete"
{
	"channel"	"CHAN_STATIC"
	"volume"	".75"
	"soundlevel"  	"SNDLVL_81dB"
	"pitch"			"PITCH_NORM"

	"rndwave"
	{
		"wave"	"weapons/fx/rics/arrow_impact_concrete.wav"
		"wave"	"weapons/fx/rics/arrow_impact_concrete2.wav"
		"wave"	"weapons/fx/rics/arrow_impact_concrete4.wav"
	}
}


"DTF2_Weapon_Arrow.ImpactMetal"
{
	"channel"	"CHAN_STATIC"
	"volume"	".75"
	"soundlevel"  	"SNDLVL_81dB"
	"pitch"			"PITCH_NORM"

	"rndwave"
	{
		"wave"	"weapons/fx/rics/arrow_impact_metal.wav"
		"wave"	"weapons/fx/rics/arrow_impact_metal2.wav"
		"wave"	"weapons/fx/rics/arrow_impact_metal4.wav"
	}
}


"DTF2_Weapon_Arrow.ImpactWood"
{
	"channel"	"CHAN_STATIC"
	"volume"	".75"
	"soundlevel"  	"SNDLVL_81dB"
	"pitch"			"PITCH_NORM"

	"rndwave"
	{
		"wave"	"weapons/fx/rics/arrow_impact_wood.wav"
		"wave"	"weapons/fx/rics/arrow_impact_wood2.wav"
		"wave"	"weapons/fx/rics/arrow_impact_wood4.wav"
	}
}

"DTF2_Weapon_Arrow.Nearmiss"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"		"SNDLVL_106dB"
	"pitch"			"PITCH_NORM"

	"rndwave"
	{
		"wave"	"weapons/fx/nearmiss/arrow_nearmiss.wav"
		"wave"	"weapons/fx/nearmiss/arrow_nearmiss2.wav"
		"wave"	"weapons/fx/nearmiss/arrow_nearmiss3.wav"
		"wave"	"weapons/fx/nearmiss/arrow_nearmiss4.wav"
	}
}

"DTF2_Weapon_Arrow.ImpactFleshCrossbowHeal"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"soundlevel"	"SNDLVL_86dB"

	"wave"	")weapons/fx/rics/arrow_impact_crossbow_heal.wav"
}

// ------------------------------------------------------------------------------------ //
// PICKAXE - THE EQUALIZER
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_PickAxe.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"pitch"		"95, 105"
	"rndwave"
	{
		"wave"		"weapons/blade_slice_2.wav"
		"wave"		"weapons/blade_slice_3.wav"
		"wave"		"weapons/blade_slice_4.wav"
	}
}


"DTF2_Weapon_PickAxe.Swing"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_84dB"
	"volume"	".25"
	"pitch"		"95, 105"
	"rndwave"
	{
		"wave"		")weapons/pickaxe_swing1.wav"
		"wave"		")weapons/pickaxe_swing2.wav"
		"wave"		")weapons/pickaxe_swing3.wav"
	}
}

"DTF2_Weapon_Pickaxe.SwingCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_84dB"
	"volume"	".25"
	"wave"		")weapons/pickaxe_swing_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// BATTALIONS BACKUP
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_BattalionsBackup.HornRed"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NONE"
	"volume"	"1.0"
	"wave"		"weapons/battalions_backup_red.wav"

}

"DTF2_Weapon_BattalionsBackup.HornBlue"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NONE"
	"volume"	"1.0"
	"wave"		"weapons/battalions_backup_blue.wav"

}

// ------------------------------------------------------------------------------------ //
// BUFF BANNER
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_BuffBanner.HornRed"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NONE"
	"volume"	"1.0"
	"wave"		"weapons/buff_banner_horn_red.wav"

}

"DTF2_Weapon_BuffBanner.HornBlue"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NONE"
	"volume"	"1.0"
	"wave"		"weapons/buff_banner_horn_blue.wav"

}
"DTF2_Weapon_BuffBanner.Flag"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/buff_banner_flag.wav"

}

"DTF2_Weapon_BuffBanner.BuffOn"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/buff_on.wav"

}

"DTF2_Weapon_BuffBanner.BuffOff"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/buff_off.wav"
}

// ------------------------------------------------------------------------------------ //
// DEMO CHARGE
// ------------------------------------------------------------------------------------ //

"DTF2_DemoCharge.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/demo_charge_hit_world1.wav"
		"wave"		"weapons/demo_charge_hit_world2.wav"
		"wave"		"weapons/demo_charge_hit_world3.wav"
	}
}

"DTF2_DemoCharge.HitFleshRange"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/demo_charge_hit_flesh_range1.wav"
		"wave"		"weapons/demo_charge_hit_flesh_range2.wav"
		"wave"		"weapons/demo_charge_hit_flesh_range3.wav"
	}
}

"DTF2_DemoCharge.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/demo_charge_hit_flesh1.wav"
		"wave"		"weapons/demo_charge_hit_flesh2.wav"
		"wave"		"weapons/demo_charge_hit_flesh3.wav"
	}
}

"DTF2_DemoCharge.Charging"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/demo_charge_windup1.wav"
		"wave"		"weapons/demo_charge_windup2.wav"
		"wave"		"weapons/demo_charge_windup3.wav"
	}
}

"DTF2_DemoCharge.ChargeCritOn"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"0.25"
	"wave"		")weapons/weapon_crit_charged_on.wav"
}

"DTF2_DemoCharge.ChargeCritOff"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"0.25"
	"wave"		")weapons/weapon_crit_charged_off.wav"
}

// ------------------------------------------------------------------------------------ //
// DEMO SWORD
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Sword.Swing"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".25"
	"pitch"		"95, 105"
	"rndwave"
	{
		"wave"		")weapons/demo_sword_swing1.wav"
		"wave"		")weapons/demo_sword_swing2.wav"
		"wave"		")weapons/demo_sword_swing3.wav"
	}
}

"DTF2_Weapon_Sword.SwingCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".25"
	"wave"		")weapons/demo_sword_swing_crit.wav"
}

"DTF2_Weapon_Sword.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/blade_slice_2.wav"
		"wave"		"weapons/blade_slice_3.wav"
		"wave"		"weapons/blade_slice_4.wav"
	}
}

"DTF2_Weapon_Sword.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/demo_sword_hit_world1.wav"
		"wave"		")weapons/demo_sword_hit_world2.wav"
	}
}

"DTF2_Weapon_Sword.Draw"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons/draw_sword.wav"
}

// ------------------------------------------------------------------------------------ //
// RECON 
// ------------------------------------------------------------------------------------ //

"DTF2_Recon.Ping"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1"
	"wave"		")weapons/recon_ping.wav"
}

// ------------------------------------------------------------------------------------ //
// GUITAR
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Guitar.Strum"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1"
	"wave"		")weapons/guitar_strum.wav"
}

"DTF2_Weapon_Guitar.Impact"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1"
	"rndwave"
	{
		"wave"		")weapons/guitar_impact1.wav"
		"wave"		")weapons/guitar_impact2.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// FRYING PAN
// ------------------------------------------------------------------------------------ //

"DTF2_FryingPan.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/pan/melee_frying_pan_01.wav"
		"wave"		"weapons/pan/melee_frying_pan_02.wav"
		"wave"		"weapons/pan/melee_frying_pan_03.wav"
		"wave"		"weapons/pan/melee_frying_pan_04.wav"
	}
}

"DTF2_FryingPan.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons/pan/pan_impact_world1.wav"
		"wave"		"weapons/pan/pan_impact_world2.wav"
		"wave"		"weapons/pan/pan_impact_world3.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// HALLOWEEN BOSS AXE
// ------------------------------------------------------------------------------------ //

"DTF2_Halloween.HeadlessBossAxeHitFlesh"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_150dB"
	"pitch"			"95,105"
	"volume"		"1.0"
	"wave"			")weapons/halloween_boss/knight_axe_hit.wav"
}

"DTF2_Halloween.HeadlessBossAxeHitWorld"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_150dB"
	"pitch"			"95,105"
	"volume"		"1.0"
	"wave"			")weapons/halloween_boss/knight_axe_miss.wav"
}

"DTF2_Halloween.HeadlessBossFootfalls"
{
	"channel"		"CHAN_BODY"
	"soundlevel"	"SNDLVL_150dB"
	"pitch"			"95,105"
	"volume"		"1.0"
	"rndwave"
	{
		"wave"		")player/footsteps/giant1.wav"
		"wave"		")player/footsteps/giant2.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// Samurai Katana
// ------------------------------------------------------------------------------------ //


"DTF2_Weapon_Katana.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_65dB"
	"volume"	".6"
	"pitch"			"95,105"
	"rndwave"
	{
		"wave"		")weapons/samurai/TF_Katana_01.wav"
		"wave"		")weapons/samurai/TF_Katana_02.wav"
		"wave"		")weapons/samurai/TF_Katana_03.wav"
		"wave"		")weapons/samurai/TF_Katana_04.wav"
		"wave"		")weapons/samurai/TF_Katana_05.wav"
		"wave"		")weapons/samurai/TF_Katana_06.wav"
	}
}

"DTF2_Weapon_Katana.MissCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_65dB"
	"volume"	".6"
	"wave"		")weapons/samurai/TF_katana_crit_miss_01.wav"
}

"DTF2_Weapon_Katana.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_95dB"
	"volume"	"1.0"
	"pitch"			"95,105"
	"rndwave"
	{
		"wave"		")weapons/samurai/TF_katana_slice_01.wav"
		"wave"		")weapons/samurai/TF_katana_slice_02.wav"
		"wave"		")weapons/samurai/TF_katana_slice_03.wav"
	}
}

"DTF2_Weapon_Katana.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"pitch"			"95,105"
	"rndwave"
	{
		"wave"		")weapons/samurai/TF_katana_impact_object_01.wav"
		"wave"		")weapons/samurai/TF_katana_impact_object_02.wav"
		"wave"		")weapons/samurai/TF_katana_impact_object_03.wav"
	}
}

"DTF2_Weapon_Katana.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_70dB"
	"volume"	".7"
	"rndwave"
	{
		"wave"		")weapons/samurai/TF_katana_draw_01.wav"
		"wave"		")weapons/samurai/TF_katana_draw_02.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// Marked for Death
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Marked_for_Death.Initial"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"pitch"			"95,105"
	"volume"	"0.95, 1.0"
	"rndwave"
	{
		"wave"		")weapons\samurai\TF_marked_for_death_impact_01.wav"
		"wave"		")weapons\samurai\TF_marked_for_death_impact_02.wav"
		"wave"		")weapons\samurai\TF_marked_for_death_impact_03.wav"
	}
}

"DTF2_Weapon_Marked_for_Death.Indicator"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_100dB"
	"volume"	"1.0"
	"wave"		"weapons\samurai\TF_marked_for_death_indicator.wav"
}

// ------------------------------------------------------------------------------------ //
// DETONATOR
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Detonator.Fire"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"pitch"		"95,105"
	"volume"	"0.75, 0.8"
		"wave"		")weapons\flare_detonator_launch.wav"
}

"DTF2_Weapon_Detonator.Detonate"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_100dB"
	"volume"	"1.0"
	"wave"		")weapons\flare_detonator_explode.wav"
}

"DTF2_Weapon_Detonator.DetonateWorld"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_100dB"
	"volume"	"1.0"
	"wave"		")weapons\flare_detonator_explode_world.wav"
}



// ------------------------------------------------------------------------------------ //
// SAXXY
// ------------------------------------------------------------------------------------ //

"DTF2_Saxxy.TurnGold"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_100dB"
	"pitch"		"PITCH_NORM"
	"volume"	"1.0"
	"wave"		")weapons/saxxy_impact_gen_06.wav"
}

"DTF2_Saxxy.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"  	"weapons\saxxy_impact_gen_01.wav"
}

// ------------------------------------------------------------------------------------ //
// DISCIPLINE DEVICE
// ------------------------------------------------------------------------------------ //

"DTF2_DisciplineDevice.Impact"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\discipline_device_impact_01.wav"
		"wave"		")weapons\discipline_device_impact_02.wav"
	}
}

"DTF2_DisciplineDevice.ImpactCrit"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\discipline_device_impact_crit_01.wav"
		"wave"		")weapons\discipline_device_impact_crit_02.wav"
	}
}

"DTF2_DisciplineDevice.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"0.9"
	"wave"		")weapons\discipline_device_hit_world.wav"
}

"DTF2_DisciplineDevice.Swing"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\discipline_device_woosh_01.wav"
		"wave"		")weapons\discipline_device_woosh_02.wav"
	}
}

"DTF2_DisciplineDevice.PowerUp"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons\discipline_device_power_up.wav"
}

"DTF2_DisciplineDevice.PowerDown"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons\discipline_device_power_down.wav"
}

// ------------------------------------------------------------------------------------ //
// EVICTION NOTICE
// ------------------------------------------------------------------------------------ //

"DTF2_EvictionNotice.Impact"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\eviction_notice_01.wav"
		"wave"		")weapons\eviction_notice_02.wav"
		"wave"		")weapons\eviction_notice_03.wav"
		"wave"		")weapons\eviction_notice_04.wav"
	}
}

"DTF2_EvictionNotice.ImpactCrit"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\eviction_notice_01_crit.wav"
		"wave"		")weapons\eviction_notice_02_crit.wav"
		"wave"		")weapons\eviction_notice_03_crit.wav"
		"wave"		")weapons\eviction_notice_04_crit.wav"
	}
}

"DTF2_EvictionNotice.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\demo_sword_hit_world1.wav"
		"wave"		")weapons\demo_sword_hit_world2.wav"
	}
}

"DTF2_EvictionNotice.Swing"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons\boxing_gloves_swing1.wav"
		"wave"		"weapons\boxing_gloves_swing2.wav"
		"wave"		"weapons\boxing_gloves_swing4.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// BOSTON BASHER
// ------------------------------------------------------------------------------------ //

"DTF2_BostonBasher.Impact"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\eviction_notice_01.wav"
		"wave"		")weapons\eviction_notice_02.wav"
		"wave"		")weapons\eviction_notice_03.wav"
		"wave"		")weapons\eviction_notice_04.wav"
	}
}

"DTF2_BostonBasher.ImpactCrit"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\eviction_notice_01_crit.wav"
		"wave"		")weapons\eviction_notice_02_crit.wav"
		"wave"		")weapons\eviction_notice_03_crit.wav"
		"wave"		")weapons\eviction_notice_04_crit.wav"
	}
}

"DTF2_BostonBasher.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\demo_sword_hit_world1.wav"
		"wave"		")weapons\demo_sword_hit_world2.wav"
	}
}

"DTF2_BostonBasher.Swing"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons\boxing_gloves_swing1.wav"
		"wave"		"weapons\boxing_gloves_swing2.wav"
		"wave"		"weapons\boxing_gloves_swing4.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// RESERVE SHOOTER
// ------------------------------------------------------------------------------------ //


"DTF2_Weapon_Reserve_Shooter.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\reserve_shooter_01.wav"
		"wave"		")weapons\reserve_shooter_02.wav"
		"wave"		")weapons\reserve_shooter_03.wav"
		"wave"		")weapons\reserve_shooter_04.wav"
	}
}

"DTF2_Weapon_Reserve_Shooter.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\reserve_shooter_01_crit.wav"
		"wave"		")weapons\reserve_shooter_02_crit.wav"
		"wave"		")weapons\reserve_shooter_03_crit.wav"
		"wave"		")weapons\reserve_shooter_04_crit.wav"
	}
}

"DTF2_Weapon_Reserve_Shooter.Empty"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/shotgun_empty.wav"
}

"DTF2_Weapon_Reserve_Shooter.Reload"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/scatter_gun_reload.wav"
}

"DTF2_Weapon_Reserve_Shooter.WorldReload"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/scatter_gun_worldreload.wav"
}

"DTF2_Weapon_Reserve_Shooter.Pump"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons/scatter_gun_worldreload.wav"
}

"DTF2_Weapon_Reserve_Shooter.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_secondary.wav"
}

// ------------------------------------------------------------------------------------ //
// MANTREADS
// ------------------------------------------------------------------------------------ //


"DTF2_Weapon_Mantreads.Impact"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons\mantreads.wav"
}


// ------------------------------------------------------------------------------------ //
// QUAKE ROCKET LAUNCHER
// ------------------------------------------------------------------------------------ //


"DTF2_Weapon_QuakeRPG.Single"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1"
	"soundlevel"	"SNDLVL_94dB"
	"wave"		"weapons\quake_rpg_fire_remastered.wav"
}

"DTF2_Weapon_QuakeRPG.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1"
	"wave"		"weapons\quake_rpg_fire_remastered_crit.wav"
}

"DTF2_Weapon_QuakeRPG.Draw"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons\quake_ammo_pickup_remastered.wav"
}

"DTF2_Weapon_QuakeRPG.Reload"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons\quake_rpg_reload_remastered.wav"
}

"DTF2_Weapon_QuakeRPG.WorldReload"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		"weapons\quake_rpg_reload_remastered.wav"
}

"DTF2_Weapon_QuakeRPG.Explode"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_95dB"
	"volume"	"1"
	"pitch"		"PITCH_NORM"
	"wave"		"weapons\quake_explosion_remastered.wav"
}

// ------------------------------------------------------------------------------------ //
// DIAMOND BACK
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Diamond_Back.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_92dB"
	"volume"	"0.8"
	"rndwave"
	{
		"wave"		")weapons\diamond_back_01.wav"
		"wave"		")weapons\diamond_back_02.wav"
		"wave"		")weapons\diamond_back_03.wav"
	}
}

"DTF2_Weapon_Diamond_Back.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\diamond_back_01_crit.wav"
		"wave"		")weapons\diamond_back_02_crit.wav"
		"wave"		")weapons\diamond_back_03_crit.wav"
	}
}


// ------------------------------------------------------------------------------------ //
// SNIPER RAILGUN RIFLE
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_SniperRailgun.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\sniper_railgun_single_01.wav"
		"wave"		")weapons\sniper_railgun_single_02.wav"
	}
}

"DTF2_Weapon_SniperRailgun.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\sniper_railgun_single_crit.wav"
		"wave"		")weapons\sniper_railgun_single_crit_02.wav"
	}
}

"DTF2_Weapon_SniperRailgun_Large.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_100dB"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\sniper_railgun_charged_shot_01.wav"
		"wave"		")weapons\sniper_railgun_charged_shot_02.wav"
	}
}

"DTF2_Weapon_SniperRailgun_Large.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_100dB"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\sniper_railgun_charged_shot_crit_01.wav"
		"wave"		")weapons\sniper_railgun_charged_shot_crit_02.wav"
	}
}

"DTF2_Weapon_SniperRailgun.WorldReload"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.35"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		")weapons\sniper_railgun_world_reload.wav"
}

"DTF2_Weapon_SniperRailgun.ClipEmpty"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.7"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		")weapons\sniper_railgun_dry_fire.wav"
}

"DTF2_Weapon_SniperRailgun.NonScoped"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.7"
	"soundlevel"	"SNDLVL_NORM"

	"wave"		")weapons\sniper_railgun_no_fire.wav"
}

"DTF2_Weapon_SniperRailgun.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_primary.wav"
}

"DTF2_Weapon_SniperRailgun.BoltForward"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".45"
	"wave"		")weapons\sniper_railgun_bolt_forward.wav"
}

"DTF2_Weapon_SniperRailgun.BoltBack"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".45"
	"wave"		")weapons\sniper_railgun_bolt_back.wav"
}

// ------------------------------------------------------------------------------------ //
// WIDOW MAKER SHOTGUN
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_WidowMaker.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_92dB"
	"volume"	"0.9"
	"rndwave"
	{
		"wave"		")weapons\widow_maker_shot_01.wav"
		"wave"		")weapons\widow_maker_shot_02.wav"
		"wave"		")weapons\widow_maker_shot_03.wav"
	}
}

"DTF2_Weapon_WidowMaker.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_92dB"
	"volume"	"0.9"
	"rndwave"
	{
		"wave"		")weapons\widow_maker_shot_crit_01.wav"
		"wave"		")weapons\widow_maker_shot_crit_02.wav"
		"wave"		")weapons\widow_maker_shot_crit_03.wav"
	}
}

"DTF2_Weapon_WidowMaker.Empty"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons\widow_maker_dry_fire.wav"
}

"DTF2_Weapon_WidowMaker.Draw"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		"weapons/draw_shotgun_pyro.wav"
}

"DTF2_Weapon_WidowMaker.Cock_Back"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		")weapons\widow_maker_pump_action_back.wav"
}

"DTF2_Weapon_WidowMaker.Cock_Forward"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".5"
	"wave"		")weapons\widow_maker_pump_action_forward.wav"
}

// ------------------------------------------------------------------------------------ //
// BARRETS ARM
// ------------------------------------------------------------------------------------ //


"DTF2_Weapon_BarretsArm.Shot"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1"
	"wave"		")weapons\barret_arm_shot.wav"
}

"DTF2_Weapon_BarretsArm.Draw"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"0"
	"wave"		"weapons\barret_arm_draw.wav"
}

"DTF2_Weapon_BarretsArm.Fizzle"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".7"
	"wave"		")weapons\barret_arm_fizzle.wav"
}

"DTF2_Weapon_BarretsArm.Zap"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons\barret_arm_zap.wav"
}

//-----------------------------------------//
// BOMBINOMICON PLAYER EXPLODE
//-----------------------------------------//
"DTF2_Bombinomicon.Explode"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_105dB"
	"volume"	"1.0"
	"pitch"		"PITCH_NORM"
	
	"wave"		"weapons/bombinomicon_explode1.wav"	

}

//-----------------------------------------//
// SPY ASSASSIN KNIFE
//-----------------------------------------//


"DTF2_Weapon_Assassin_Knife.Draw"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1.0"
	"pitch"		"PITCH_NORM"
	
	"wave"		")weapons\spy_assassin_knife_draw.wav"
}

"DTF2_Weapon_Assassin_Knife.Miss"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/knife_swing.wav"
}

"DTF2_Weapon_Assassin_Knife.MissCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	".6"
	"wave"		")weapons/knife_swing_crit.wav"
}

"DTF2_Weapon_Assassin_Knife.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\spy_assassin_knife_impact_01.wav"
		"wave"		")weapons\spy_assassin_knife_impact_02.wav"
	}
}

"DTF2_Weapon_Assassin_Knife.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons/blade_hitworld.wav"
}

"DTF2_Weapon_Assassin_Knife.Backstab"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_85dB"
	"volume"	"1.0"
	"pitch"		"PITCH_NORM"
	
	"wave"		")weapons\spy_assassin_knife_bckstb.wav"
}


//-----------------------------------------//
// Dr Grordbort's Wrenchmotron 600
//-----------------------------------------//

"DTF2_Weapon_DRG_Wrench.Teleport"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_150dB"
	"volume"		"1.0"
	"wave"			")weapons/drg_wrench_teleport.wav"
}

// ------------------------------------------------------------------------------------ //
// The Spycicle (Spy Icicle knife)
// ------------------------------------------------------------------------------------ //

"DTF2_Icicle.TurnToIce"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_100dB"
	"pitch"		"PITCH_NORM"
	"volume"	"1.0"
	"wave"		")weapons/icicle_freeze_victim_01.wav"
}

"DTF2_Icicle.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons/icicle_hit_world_01.wav"
		"wave"		")weapons/icicle_hit_world_02.wav"
		"wave"		")weapons/icicle_hit_world_03.wav"
	}
}

"DTF2_Icicle.Melt"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_100dB"
	"pitch"			"PITCH_NORM"
	"volume"		"1.0"
	"wave"			")weapons/icicle_melt_01.wav"
}

"DTF2_Icicle.Deploy"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"pitch"			"PITCH_NORM"
	"volume"		"1.0"
	"wave"			")weapons/icicle_deploy.wav"
}

//-----------------------------------------//
// Man Melter
//-----------------------------------------//
"DTF2_Weapon_ManMelter.Single"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_NORM"
	"wave"	")weapons\man_melter_fire.wav"
}

"DTF2_Weapon_ManMelter.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_NORM"
	"wave"	")weapons\man_melter_fire_crit.wav"
}

"DTF2_Weapon_ManMelter.altfire_lp"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons\man_melter_alt_fire_lp.wav"
}


//-----------------------------------------//
// Ball Buster
//-----------------------------------------//
"DTF2_BallBuster.OrnamentImpact"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_75dB"
	"rndwave"
	{
		"wave"	"weapons\ball_buster_break_01.wav"
		"wave"	"weapons\ball_buster_break_02.wav"
	}
}

"DTF2_BallBuster.OrnamentImpactRange"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_75dB"
	"rndwave"
	{
		"wave"	"weapons\ball_buster_break_01_crowd.wav"
		"wave"	"weapons\ball_buster_break_02_crowd.wav"
	}
}

"DTF2_BallBuster.HitBall"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_75dB"
	"volume"	"1.0"
	"pitch"		"115"
	"wave"		"weapons\ball_buster_hit_02.wav"
}

"DTF2_BallBuster.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons\ball_buster_hit_01.wav"
}

"DTF2_BallBuster.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		"weapons\ball_buster_hit_01.wav"
}

"DTF2_BallBuster.DrawCatch"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".75"
	"wave"		"weapons\ball_buster_hit_01.wav"
}

"DTF2_BallBuster.Ornament_DrawCatch"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		"weapons\ball_buster_catch_01.wav"
		"wave"		"weapons\ball_buster_catch_02.wav"
	}
}

"DTF2_BallBuster.Ball_HitWorld"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"soundlevel"	"SNDLVL_70dB"
	"rndwave"
	{
		"wave"		")weapons\ball_buster_bounce_01.wav"
		"wave"		")weapons\ball_buster_bounce_02.wav"
		"wave"		")weapons\ball_buster_bounce_03.wav"
		"wave"		")weapons\ball_buster_bounce_04.wav"
		"wave"		")weapons\ball_buster_bounce_05.wav"
		"wave"		")weapons\ball_buster_bounce_06.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// Pomson 6000
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_Pomson.Single"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_NORM"
	"wave"	")weapons\pomson_fire_01.wav"
}

"DTF2_Weapon_Pomson.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_NORM"
	"wave"	")weapons\pomson_fire_crit_01.wav"
}

"DTF2_Weapon_Pomson.Reload"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1"
	"pitch"		"110"
	"wave"		"weapons/bison_reload.wav"
}

"DTF2_Weapon_Pomson.DrainedVictim"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_75dB"
	"volume"		"1"
	"pitch"			"110"
	"wave"			"weapons/drg_pomson_drain_01.wav"
}

"DTF2_Weapon_Pomson.ProjectileImpactWorld"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_75dB"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"wave"			")weapons/fx/rics/pomson_projectile_impact_world.wav"
}

"DTF2_Weapon_Pomson.ProjectileImpactFlesh"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_75dB"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"wave"			")weapons/fx/rics/pomson_projectile_impact_flesh.wav"
}

// ------------------------------------------------------------------------------------ //
// PHLOGISTINATOR
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_phlogistinator.FireStart"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons\phlog_ignite.wav"
}

"DTF2_Weapon_phlogistinator.FireLoop"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons\phlog_loop.wav"
}

"DTF2_Weapon_phlogistinator.FireLoopCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons\phlog_loop_crit.wav"
}

"DTF2_Weapon_phlogistinator.WindDown"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons\phlog_end.wav"
}


// ------------------------------------------------------------------------------------ //
// 3RD DEGREE
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_3rd_degree.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\3rd_degree_hit_01.wav"
		"wave"		")weapons\3rd_degree_hit_02.wav"
		"wave"		")weapons\3rd_degree_hit_03.wav"
		"wave"		")weapons\3rd_degree_hit_04.wav"
	}
}

"DTF2_Weapon_3rd_degree.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"rndwave"
	{
		"wave"		")weapons\3rd_degree_hit_world_01.wav"
		"wave"		")weapons\3rd_degree_hit_world_02.wav"
		"wave"		")weapons\3rd_degree_hit_world_03.wav"
		"wave"		")weapons\3rd_degree_hit_world_04.wav"
	}
}


// ------------------------------------------------------------------------------------ //
// Mittens
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_mittens.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"0.6"
	"wave"		")weapons\mittens_punch.wav"
}

"DTF2_Weapon_mittens.CritHit"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"0.8"
	"wave"		")weapons\mittens_punch_crit.wav"
}

"DTF2_Weapon_mittens.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"0.5"
	"wave"		")weapons\mittens_punch.wav"
}

"DTF2_Weapon_mittens.HitGlove"
{
	"channel"	"CHAN_AUTO"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	".4"
	"wave"		")weapons\mittens_punch.wav"
}

// ------------------------------------------------------------------------------------ //
// Dumpster Rocket Launcher
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_DumpsterRocket.Reload"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		"1"
	"pitch"			"100"
	"wave"			"weapons/dumpster_rocket_reload.wav"
}

"DTF2_Weapon_DumpsterRocket.Reload_FP"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"		"1"
	"pitch"			"100"
	"wave"			")weapons/dumpster_rocket_reload_fp.wav"
}

// ------------------------------------------------------------------------------------ //
// Rainblower
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Rainblower.FireStart"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/rainblower/rainblower_start.wav"
}

"DTF2_Weapon_Rainblower.FireLoop"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/rainblower/rainblower_loop.wav"
}

"DTF2_Weapon_Rainblower.FireEnd"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/rainblower/rainblower_end.wav"

}

"DTF2_Weapon_Rainblower.FireHit"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/rainblower/rainblower_hit.wav"
}

"DTF2_Weapon_Rainblower.PilotLoop"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".25"
	"wave"		")weapons/rainblower/rainblower_pilot.wav"
}

"DTF2_Weapon_Rainblower.Fire"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/rainblower/rainblower_start.wav"
}

"DTF2_Weapon_Rainblower.WindDown"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/rainblower/rainblower_end.wav"

}

// ------------------------------------------------------------------------------------ //
// Meet the Pyro, Doomsday, Public Enemy Pack, Urban Pro
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_PickPocket_Pistol.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/doom_scout_pistol.wav"
}

"DTF2_Weapon_PickPocket_Pistol.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/doom_scout_pistol_crit.wav"
}

"DTF2_Weapon_Brawler_Blaster.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/doom_scout_shotgun.wav"
}

"DTF2_Weapon_Brawler_Blaster.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/doom_scout_shotgun_crit.wav"
}

"DTF2_Weapon_ProSniperRifle.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_98dB"
	"volume"	"1.0"
	"wave"		")weapons/doom_sniper_rifle.wav"
}

"DTF2_Weapon_ProSniperRifle.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_98dB"
	"volume"	"1.0"
	"wave"		")weapons/doom_sniper_rifle_crit.wav"
}

"DTF2_Weapon_UrbanProfessional.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/doom_sniper_smg.wav"
}

"DTF2_Weapon_UrbanProfessional.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/doom_sniper_smg_crit.wav"
}

"DTF2_Weapon_Does_Dumpster.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/doom_rocket_launcher.wav"
}

"DTF2_Weapon_Does_Dumpster.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/doom_rocket_launcher_crit.wav"
}

"DTF2_Weapon_ScorchShot.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/doom_flare_gun.wav"
}

"DTF2_Weapon_ScorchShot.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/doom_flare_gun_crit.wav"
}

//-----------------------------------------//
// Cleaver
//-----------------------------------------//
"DTF2_Cleaver.ImpactFlesh"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_75dB"
	
	"rndwave"
	{
		"wave"		")weapons\cleaver_hit_01.wav"
		"wave"		")weapons\cleaver_hit_02.wav"
		"wave"		")weapons\cleaver_hit_03.wav"
		"wave"		")weapons\cleaver_hit_04.wav"
		"wave"		")weapons\cleaver_hit_05.wav"
		"wave"		")weapons\cleaver_hit_06.wav"
		"wave"		")weapons\cleaver_hit_07.wav"
	}
}

"DTF2_Cleaver.ImpactWorld"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_75dB"
	
	"rndwave"
	{
		"wave"		")weapons\cleaver_hit_world_01.wav"
		"wave"		")weapons\cleaver_hit_world_02.wav"
		"wave"		")weapons\cleaver_hit_world_03.wav"
		"wave"		")weapons\cleaver_hit_world_04.wav"
		"wave"		")weapons\cleaver_hit_world_05.wav"
	}
}

//-----------------------------------------//
// Neon Sign
//-----------------------------------------//
"DTF2_Neon_Sign.ImpactFlesh"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_75dB"
	
	"rndwave"
	{
		"wave"		")weapons\neon_sign_hit_01.wav"
		"wave"		")weapons\neon_sign_hit_02.wav"
		"wave"		")weapons\neon_sign_hit_03.wav"
		"wave"		")weapons\neon_sign_hit_04.wav"
	}
}

"DTF2_Neon_Sign.ImpactWorld"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_75dB"
	
	"rndwave"
	{
		"wave"		")weapons\neon_sign_hit_world_01.wav"
		"wave"		")weapons\neon_sign_hit_world_02.wav"
		"wave"		")weapons\neon_sign_hit_world_03.wav"
		"wave"		")weapons\neon_sign_hit_world_04.wav"
	}
}

//-----------------------------------------//
// SD Sapper
//-----------------------------------------//
"DTF2_Weapon_sd_sapper.Timer"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_75dB"
	
	"rndwave"
	{
		"wave"		")weapons\spy_tape_01.wav"
		"wave"		")weapons\spy_tape_02.wav"
		"wave"		")weapons\spy_tape_03.wav"
		"wave"		")weapons\spy_tape_04.wav"
		"wave"		")weapons\spy_tape_05.wav"
	}
}

//-----------------------------------------//
// Wheatley Sapper
//-----------------------------------------//
"DTF2_Weapon_p2rec.Timer"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_74dB"
	"wave"		"weapons/sapper_timer.wav"
}

//-----------------------------------------//
// Dragon Minigun
//-----------------------------------------//
"DTF2_Dragon_Minigun.Spin"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1.0"
	"wave"		")weapons/dragon_gun_motor_loop_dry.wav"
}

"DTF2_Dragon_Minigun.WindUp"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/dragon_gun_motor_start.wav"
}

"DTF2_Dragon_Minigun.WindDown"	
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/dragon_gun_motor_stop.wav"
}

"DTF2_Dragon_Minigun.Fire"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/dragon_gun_motor_loop.wav"
}

"DTF2_Dragon_Minigun.FireCrit"	
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/dragon_gun_motor_loop_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// CSGO AWP
// ------------------------------------------------------------------------------------ //
"DTF2_Weapon_AWP.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/csgo_awp_shoot.wav"
}

"DTF2_Weapon_AWP.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons/csgo_awp_shoot_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// RESCUE RANGER
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_RescueRanger.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons\rescue_ranger_fire.wav"
}

"DTF2_Weapon_RescueRanger.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons\rescue_ranger_fire_crit.wav"
}

"DTF2_Weapon_RescueRanger.charge_01"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons\rescue_ranger_charge_01.wav"
}

"DTF2_Weapon_RescueRanger.charge_02"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons\rescue_ranger_charge_02.wav"
}

"DTF2_RescueRanger_Teleporter.Send"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"pitch"		"PITCH_NORM"
	"volume"	"0.700000"
	"rndwave"
	{
		"wave"		")weapons\rescue_ranger_teleport_send_01.wav"
		"wave"		")weapons\rescue_ranger_teleport_send_02.wav"
	}
}

"DTF2_RescueRanger_Teleporter.Receive"
{
	"channel"	"CHAN_STATIC"
	"volume"	"0.700000"
	"soundlevel"	"SNDLVL_74dB"
	"rndwave"
	{
		"wave"		")weapons\rescue_ranger_teleport_receive_01.wav"
		"wave"		")weapons\rescue_ranger_teleport_receive_02.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// Vaccinator
// ------------------------------------------------------------------------------------ //
"DTF2_WeaponMedigun_Vaccinator.Healing"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		")weapons\vaccinator_heal.wav"
}

"DTF2_WeaponMedigun_Vaccinator.Charged_tier_01"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"		"1"
	"wave"		")weapons\vaccinator_charge_tier_01.wav"
}

"DTF2_WeaponMedigun_Vaccinator.Charged_tier_02"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"		"1"
	"wave"		")weapons\vaccinator_charge_tier_02.wav"
}

"DTF2_WeaponMedigun_Vaccinator.Charged_tier_03"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"		"1"
	"wave"		")weapons\vaccinator_charge_tier_03.wav"
}

"DTF2_WeaponMedigun_Vaccinator.Charged_tier_04"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"		"1"
	"wave"		")weapons\vaccinator_charge_tier_04.wav"
}

"DTF2_WeaponMedigun_Vaccinator.InvulnerableOn"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1"
	"soundlevel"  	"SNDLVL_70dB"
	"wave"		")player\invuln_on_vaccinator.wav"
}

"DTF2_WeaponMedigun_Vaccinator.InvulnerableOff"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1"
	"soundlevel"  	"SNDLVL_86dB"
	"wave"		")player\invuln_off_vaccinator.wav"
}

"DTF2_WeaponMedigun_Vaccinator.Toggle"
{
	"channel"		"CHAN_STATIC"
	"volume"	"1"
	"soundlevel"  	"SNDLVL_86dB"
	"wave"		")weapons\vaccinator_toggle.wav"
}

// ------------------------------------------------------------------------------------ //
// Loose Cannon
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_LooseCannon.Shoot"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"		"1.0"
	"wave"			")weapons/loose_cannon_shoot.wav"
}

"DTF2_Weapon_LooseCannon.Shootcrit"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"		"1.0"
	"wave"			")weapons/loose_cannon_shootcrit.wav"
}

"DTF2_Weapon_LooseCannon.Explode"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_95dB"
	"volume"		"1.0"
	"pitch"			"95, 105"
	"wave"			")weapons/loose_cannon_explode.wav"
}

"DTF2_Weapon_LooseCannon.Charge"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		".45"
	"wave"			"weapons/loose_cannon_charge.wav"
}

"DTF2_Weapon_LooseCannon.BallImpact"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_85dB"
	"volume"		"0.7"
	"pitch"			"95, 105"
	"wave"			"weapons/loose_cannon_ball_impact.wav"
}

// ------------------------------------------------------------------------------------ //
// MEDI_SHIELD
// ------------------------------------------------------------------------------------ //
"DTF2_WeaponMedi_Shield.Protection"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		")weapons\vaccinator_heal.wav"
}

"DTF2_WeaponMedi_Shield.Deploy"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1"
	"soundlevel"	"SNDLVL_95dB"
	"wave"		")weapons\medi_shield_deploy.wav"
}

"DTF2_WeaponMedi_Shield.Retract"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1"
	"soundlevel"	"SNDLVL_95dB"
	"wave"		")weapons\medi_shield_retract.wav"
}

"DTF2_WeaponMedi_Shield.Burn"
{
	"channel"	"CHAN_STATIC"
	"volume"	".7"
	"soundlevel"  	"SNDLVL_81dB"
	"pitch"		"90, 100"

	"rndwave"
	{
		"wave"	"weapons\medi_shield_burn_01.wav"
		"wave"	"weapons\medi_shield_burn_02.wav"
		"wave"	"weapons\medi_shield_burn_03.wav"
		"wave"	"weapons\medi_shield_burn_04.wav"
		"wave"	"weapons\medi_shield_burn_05.wav"
		"wave"	"weapons\medi_shield_burn_06.wav"
		"wave"	"weapons\medi_shield_burn_07.wav"
		"wave"	"weapons\medi_shield_burn_08.wav"
		"wave"	"weapons\medi_shield_burn_09.wav"
		"wave"	"weapons\medi_shield_burn_10.wav"
		"wave"	"weapons\medi_shield_burn_11.wav"
	}
}

"DTF2_WeaponMedi_Shield.Burn_lp"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"soundlevel"  	"SNDLVL_94dB"
	"pitch"			"PITCH_NORM"

	"wave"	")weapons\medi_burn_lp.wav"
}
"DTF2_Weapon_Airstrike.AltFire"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_95dB"
	"volume"		"1.0"
	"pitch"			"95, 105"
	"rndwave"
	{
			"wave"	")weapons/airstrike_fire_01.wav"
			"wave"	")weapons/airstrike_fire_02.wav"
			"wave"	")weapons/airstrike_fire_03.wav"
	}
}

"DTF2_Weapon_Airstrike.CritFire"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_95dB"
	"volume"		"1.0"
	"pitch"			"95, 105"
	"wave"			")weapons/airstrike_fire_crit.wav"
}

"DTF2_Weapon_Airstrike.Fail"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		"1.0"
	"wave"			"weapons/airstrike_fail.wav"
}
"DTF2_Weapon_Airstrike.Explosion"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_95dB"
	"pitch"		"PITCH_NORM"

	"rndwave"
	{
			"wave"	")weapons/airstrike_small_explosion_01.wav"
			"wave"	")weapons/airstrike_small_explosion_02.wav"
			"wave"	")weapons/airstrike_small_explosion_03.wav"
	}
}

// ------------------------------------------------------------------------------------ //
// Bread Monster
// ------------------------------------------------------------------------------------ //
// Gloves
"DTF2_Weapon_bm_gloves.draw"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_80dB"
	"volume"		"0.5"
	"pitch"		    "100"
	"wave"			"weapons/breadmonster/gloves/bm_gloves_on.wav"
}

"DTF2_Weapon_bm_gloves.snap"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"0.4"
	"soundlevel"	"SNDLVL_80dB"
	"pitch"		"95, 105"
	"rndwave"
	{
			"wave"	"weapons/breadmonster/sapper/bm_sapper_snap_01.wav"
			"wave"	"weapons/breadmonster/sapper/bm_sapper_snap_02.wav"
			"wave"	"weapons/breadmonster/sapper/bm_sapper_snap_03.wav"
			"wave"	"weapons/breadmonster/sapper/bm_sapper_snap_04.wav"
			"wave"	"weapons/breadmonster/sapper/bm_sapper_snap_05.wav"
			"wave"	"weapons/breadmonster/sapper/bm_sapper_snap_06.wav"
			"wave"	"weapons/breadmonster/sapper/bm_sapper_snap_07.wav"
			"wave"	"weapons/breadmonster/sapper/bm_sapper_snap_08.wav"
	}
}

"DTF2_Weapon_bm_gloves.scream"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"0.4"
	"soundlevel"	"SNDLVL_80dB"
	"pitch"		"95, 105"
	"rndwave"
	{
			"wave"	"weapons/breadmonster/gloves/bm_gloves_scream_01.wav"
			"wave"	"weapons/breadmonster/gloves/bm_gloves_scream_02.wav"
	}
}

"DTF2_Weapon_bm_gloves.attack"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"0.5"
	"soundlevel"	"SNDLVL_80dB"
	"pitch"		"95, 105"
	"rndwave"
	{
			"wave"	"weapons/breadmonster/gloves/bm_gloves_attack_01.wav"
			"wave"	"weapons/breadmonster/gloves/bm_gloves_attack_02.wav"
			"wave"	"weapons/breadmonster/gloves/bm_gloves_attack_03.wav"
			"wave"	"weapons/breadmonster/gloves/bm_gloves_attack_04.wav"
	}
}

// Sapper
"DTF2_Weapon_bm_sapper.scream"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"0.4"
	"soundlevel"	"SNDLVL_80dB"
	"pitch"		"95, 105"
	"rndwave"
	{
			"wave"	"weapons/breadmonster/sapper/bm_sapper_scream_01.wav"
			"wave"	"weapons/breadmonster/sapper/bm_sapper_scream_02.wav"
	}
}
"DTF2_Weapon_bm_sapper.snap"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"0.4"
	"soundlevel"	"SNDLVL_80dB"
	"pitch"		"95, 105"
	"rndwave"
	{
			"wave"	"weapons/breadmonster/sapper/bm_sapper_snap_01.wav"
			"wave"	"weapons/breadmonster/sapper/bm_sapper_snap_02.wav"
			"wave"	"weapons/breadmonster/sapper/bm_sapper_snap_03.wav"
			"wave"	"weapons/breadmonster/sapper/bm_sapper_snap_04.wav"
			"wave"	"weapons/breadmonster/sapper/bm_sapper_snap_05.wav"
			"wave"	"weapons/breadmonster/sapper/bm_sapper_snap_06.wav"
			"wave"	"weapons/breadmonster/sapper/bm_sapper_snap_07.wav"
			"wave"	"weapons/breadmonster/sapper/bm_sapper_snap_08.wav"
	}
}

//Throwable
"DTF2_Weapon_bm_throwable.throw"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_95dB"
	"wave"		")weapons/breadmonster/throwable/bm_throwable_throw.wav"
}

"DTF2_Weapon_bm_throwable.smash"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1.0"
	"soundlevel"	"SNDLVL_95dB"	
	"wave"	")weapons/breadmonster/throwable/bm_throwable_smash.wav"
}

"DTF2_Weapon_bm_throwable.growl"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"0.4"
	"soundlevel"	"SNDLVL_80dB"
	"pitch"		"95, 105"
	"rndwave"
	{
			"wave"	"weapons/breadmonster/throwable/bm_throwable_growl_01.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_growl_02.wav"
	}
}
"DTF2_Weapon_bm_throwable.grunt"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"0.4"
	"soundlevel"	"SNDLVL_80dB"
	"pitch"		"95, 105"
	"rndwave"
	{
			"wave"	"weapons/breadmonster/throwable/bm_throwable_grunt_01.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_grunt_02.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_grunt_03.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_grunt_04.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_grunt_05.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_grunt_06.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_grunt_07.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_grunt_08.wav"
	}
}

"DTF2_Weapon_bm_throwable.slosh"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"0.3"
	"soundlevel"	"SNDLVL_80dB"
	"pitch"		"100"
	"rndwave"
	{
			"wave"	"weapons/breadmonster/throwable/bm_throwable_slosh_01.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_slosh_02.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_slosh_03.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_slosh_04.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_slosh_05.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_slosh_06.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_slosh_07.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_slosh_08.wav"
	}
}

"DTF2_Weapon_bm_throwable.attack"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"0.5"
	"soundlevel"	"SNDLVL_80dB"
	"pitch"		"100"
	"rndwave"
	{
			"wave"	"weapons/breadmonster/throwable/bm_throwable_attack_01.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_attack_02.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_attack_03.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_attack_04.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_attack_05.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_attack_06.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_attack_07.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_attack_08.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_attack_09.wav"
			"wave"	"weapons/breadmonster/throwable/bm_throwable_attack_10.wav"
	}
}

// ------------------------------------------------------------------------------------ //

// ------------------------------------------------------------------------------------ //
// GRAPPLING HOOK
// ------------------------------------------------------------------------------------ //
"DTF2_WeaponGrapplingHook.Shoot"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_84dB"
	"volume"	"1"
	"wave"		")weapons\grappling_hook_shoot.wav"
}

"DTF2_WeaponGrapplingHook.ReelStart"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_84dB"
	"volume"	"1"
	"wave"		")weapons\grappling_hook_reel_start.wav"
}

"DTF2_WeaponGrapplingHook.ReelStop"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_84dB"
	"volume"	"1"
	"wave"		")weapons\grappling_hook_reel_stop.wav"
}

"DTF2_WeaponGrapplingHook.ImpactDefault"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_84dB"
	"volume"	"1"
	"pitch"		"PITCH_NORM"
	"wave"		"weapons\grappling_hook_impact_default.wav"
}

"DTF2_WeaponGrapplingHook.ImpactFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1"
	"wave"		")weapons\grappling_hook_impact_flesh.wav"
}

"DTF2_WeaponGrapplingHook.ImpactFleshLoop"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	"1"
	"wave"		")weapons\grappling_hook_impact_flesh_loop.wav"
}

"DTF2_WeaponGrapplingHook.Wind"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_85dB"
	"volume"		"0"
	"wave"			")weapons\grappling_hook_wind.wav"
}

// ------------------------------------------------------------------------------------ //
// WEAPON INSPECT
// ------------------------------------------------------------------------------------ //

"DTF2_WeaponInspect.Movement1"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".2"
	"wave"		")weapons\weapon_inspect_movement1.wav"
}

"DTF2_WeaponInspect.Movement2"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".2"
	"wave"		")weapons\weapon_inspect_movement2.wav"
}

"DTF2_WeaponInspect.Movement3"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".2"
	"wave"		")weapons\weapon_inspect_movement3.wav"
}

"DTF2_WeaponInspect.Movement4"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_74dB"
	"volume"	".2"
	"wave"		")weapons\weapon_inspect_movement4.wav"
}

// ------------------------------------------------------------------------------------ //
//  Weapon Hit (Ding a lings)
// ------------------------------------------------------------------------------------ //

"DTF2_Player.HitSoundDefaultDing"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"wave"	")ui/hitsound.wav"
}

"DTF2_Player.HitSoundBeepo"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"wave"	")ui/hitsound_beepo.wav"
}

"DTF2_Player.HitSoundVortex"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"rndwave"
	{
		"wave"	")ui/hitsound_vortex1.wav"
		"wave"	")ui/hitsound_vortex2.wav"
		"wave"	")ui/hitsound_vortex3.wav"
		"wave"	")ui/hitsound_vortex4.wav"
		"wave"	")ui/hitsound_vortex5.wav"	
	}
}

"DTF2_Player.HitSoundElectro"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"rndwave"
	{
		"wave"	")ui/hitsound_electro1.wav"
		"wave"	")ui/hitsound_electro2.wav"
		"wave"	")ui/hitsound_electro3.wav"
	}
}

"DTF2_Player.HitSoundNotes"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"rndwave"
	{
		"wave"	"ui/hitsound_menu_note1.wav"
		"wave"	"ui/hitsound_menu_note2.wav"
		"wave"	"ui/hitsound_menu_note3.wav"
		"wave"	"ui/hitsound_menu_note4.wav"
		"wave"	"ui/hitsound_menu_note5.wav"
		"wave"	"ui/hitsound_menu_note6.wav"
		"wave"	"ui/hitsound_menu_note7.wav"
		"wave"	"ui/hitsound_menu_note7b.wav"
		"wave"	"ui/hitsound_menu_note8.wav"
		"wave"	"ui/hitsound_menu_note9.wav"			
	}
}

"DTF2_Player.HitSoundPercussion"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"rndwave"
	{
		"wave"	")ui/hitsound_percussion1.wav"
		"wave"	")ui/hitsound_percussion2.wav"
		"wave"	")ui/hitsound_percussion3.wav"
		"wave"	")ui/hitsound_percussion4.wav"
		"wave"	")ui/hitsound_percussion5.wav"						
	}
}

"DTF2_Player.HitSoundRetro"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"rndwave"
	{
		"wave"	")ui/hitsound_retro1.wav"
		"wave"	")ui/hitsound_retro2.wav"
		"wave"	")ui/hitsound_retro3.wav"
		"wave"	")ui/hitsound_retro4.wav"
		"wave"	")ui/hitsound_retro5.wav"						
	}
}

"DTF2_Player.HitSoundSpace"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"wave"	")ui/hitsound_space.wav"
}

"DTF2_Player.HitSoundSquasher"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"wave"	")ui/hitsound_squasher.wav"
}

"DTF2_Player.HitSoundSynth"
{
	"channel"	"CHAN_STATIC"
	"volume"	"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"		"PITCH_NORM"

	"rndwave"
	{
		"wave"	"ui/hitsound_synth1.wav"
		"wave"	"ui/hitsound_synth2.wav"
		"wave"	"ui/hitsound_synth3.wav"
		"wave"	"ui/hitsound_synth4.wav"
		"wave"	"ui/hitsound_synth5.wav"						
	}
}

// ------------------------------------------------------------------------------------ //
//  Weapon Kill (Ding a lings)
// ------------------------------------------------------------------------------------ //

"DTF2_Player.KillSoundDefaultDing"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"wave"	")ui/killsound.wav"
}

"DTF2_Player.KillSoundBeepo"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"wave"	")ui/killsound_beepo.wav"
}

"DTF2_Player.KillSoundElectro"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"wave"	")ui/killsound_electro.wav"
}

"DTF2_Player.KillSoundNotes"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"wave"	"ui/killsound_note.wav"
}

"DTF2_Player.KillSoundPercussion"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"wave"	")ui/killsound_percussion.wav"
}

"DTF2_Player.KillSoundRetro"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"wave"	")ui/killsound_retro.wav"
}

"DTF2_Player.KillSoundSpace"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"wave"	")ui/killsound_space.wav"
}

"DTF2_Player.KillSoundSquasher"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"wave"	")ui/killsound_squasher.wav"
}

"DTF2_Player.KillSoundVortex"
{
	"channel"		"CHAN_STATIC"
	"volume"		"1"
	"soundlevel"  	"SNDLVL_NONE"	
	"pitch"			"PITCH_NORM"

	"wave"	")ui/killsound_vortex.wav"
}

// ------------------------------------------------------------------------------------ //
//  Invasion
// ------------------------------------------------------------------------------------ //


"DTF2_Weapon_BatSaber.Draw"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1"
	"wave"		"weapons/batsaber_draw.wav"
}

"DTF2_Weapon_BatSaber.Swing"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	"1"
	"pitch"			"96,100"
	"rndwave"
	{
		"wave"		")weapons/batsaber_swing1.wav"
		"wave"		")weapons/batsaber_swing2.wav"
		"wave"		")weapons/batsaber_swing3.wav"
	}
}

"DTF2_Weapon_BatSaber.SwingCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_64dB"
	"volume"	"1"
	"pitch"			"96,100"
	"rndwave"
	{
		"wave"		")weapons/batsaber_swing_crit1.wav"
		"wave"		")weapons/batsaber_swing_crit2.wav"
		"wave"		")weapons/batsaber_swing_crit3.wav"
	}
}

"DTF2_Weapon_BatSaber.HitFlesh"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1"
	"pitch"			"96,100"
	"rndwave"
	{
		"wave"		")weapons/batsaber_hit_flesh1.wav"
		"wave"		")weapons/batsaber_hit_flesh2.wav"
	}

}

"DTF2_Weapon_BatSaber.HitWorld"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"	"1"
	"pitch"			"96,100"
	"rndwave"
	{
		"wave"		")weapons/batsaber_hit_world1.wav"
		"wave"		")weapons/batsaber_hit_world2.wav"
	}
}

"DTF2_Weapon_ShootingStar.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_100dB"
	"volume"	"1.0"
	"wave"		")weapons\shooting_star_shoot.wav"
}

"DTF2_Weapon_ShootingStar.SingleCharged"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_100dB"
	"volume"	"1.0"
	"wave"		")weapons\shooting_star_shoot_charged.wav"
}

"DTF2_Weapon_ShootingStar.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_100dB"
	"volume"	"1.0"
	"wave"		")weapons\shooting_star_shoot_crit.wav"
}

"DTF2_Weapon_Capper.Single"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons\capper_shoot.wav"
}

"DTF2_Weapon_Capper.SingleCrit"
{
	"channel"	"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_94dB"
	"volume"	"1.0"
	"wave"		")weapons\capper_shoot_crit.wav"
}

// ------------------------------------------------------------------------------------ //
// Rocket Jumper
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Rocket_Jumper.Single"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_94dB"
	"wave"		")weapons/rocket_jumper_shoot.wav"
}

"DTF2_Weapon_Rocket_Jumper.Explode"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_95dB"
	"volume"	"1.0"
	"pitch"		"PITCH_NORM"
	"wave"		")weapons/rocket_jumper_explode1.wav"

}

// ------------------------------------------------------------------------------------ //
// Stickey Jumper
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Sticky_Jumper.Single"
{
	"channel"	"CHAN_WEAPON"
	"volume"	"1.0"
	"soundlevel"	"SNDLVL_94dB"
	"wave"		")weapons/sticky_jumper_shoot.wav"
}

"DTF2_Weapon_Sticky_Jumper.Explode"
{
	"channel"	"CHAN_STATIC"
	"soundlevel"	"SNDLVL_95dB"
	"volume"	"1.0"
	"pitch"		"PITCH_NORM"
	"wave"		")weapons/sticky_jumper_explode1.wav"
}

// ------------------------------------------------------------------------------------ //
// Dropped Medigun
// ------------------------------------------------------------------------------------ //

"DTF2_Medigun.DrainCharge"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		"0.35"
	"pitch"			"PITCH_NORM"
	"wave"			"weapons/drg_pomson_drain_01.wav"
}

// ------------------------------------------------------------------------------------ //
// Push
// ------------------------------------------------------------------------------------ //

"DTF2_Weapon_Hands.Push"
{
	"channel"		"CHAN_WEAPON"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"wave"			"weapons/push.wav"
}

"DTF2_Weapon_Hands.PushImpact"
{
	"channel"		"CHAN_STATIC"
	"soundlevel"	"SNDLVL_NORM"
	"volume"		"1"
	"pitch"			"PITCH_NORM"
	"wave"			"weapons/push_impact.wav"
}
]==]
