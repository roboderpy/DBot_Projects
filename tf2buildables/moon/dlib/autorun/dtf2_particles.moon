
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

export DTF2
DTF2 = DTF2 or {}

manifest = {'bigboom', 'bigboom_dx80', 'blood_impact', 'blood_trail', 'blood_trail_dx80', 'bl_killtaunt', 'bl_killtaunt_dx80', 'bombinomicon', 'buildingdamage', 'bullet_tracers', 'burningplayer', 'burningplayer_dx80', 'cig_smoke', 'cig_smoke_dx80', 'cinefx', 'classic_rocket_trail', 'class_fx', 'class_fx_dx80', 'coin_spin', 'conc_stars', 'crit', 'dirty_explode', 'disguise', 'doomsday_fx', 'drg_bison', 'drg_cowmangler', 'drg_cowmangler_dx80', 'drg_engineer', 'drg_pyro', 'drg_pyro_dx80', 'dxhr_fx', 'explosion', 'explosion_dx80', 'explosion_dx90_slow', 'explosion_high', 'eyeboss', 'eyeboss_dx80', 'firstperson_weapon_fx', 'firstperson_weapon_fx_dx80', 'flag_particles', 'flamethrower', 'flamethrowertest', 'flamethrower_dx80', 'flamethrower_dx90_slow', 'flamethrower_high', 'flamethrower_mvm', 'halloween', 'halloween2015_unusuals', 'halloween2016_unusuals', 'harbor_fx', 'harbor_fx_dx80', 'impact_fx', 'invasion_ray_gun_fx', 'invasion_unusuals', 'items_demo', 'items_engineer', 'killstreak', 'level_fx', 'medicgun_attrib', 'medicgun_beam', 'medicgun_beam_dx80', 'muzzle_flash', 'muzzle_flash_dx80', 'mvm', 'nailtrails', 'nemesis', 'npc_fx', 'passtime', 'passtime_beam', 'passtime_tv_projection', 'player_recent_teleport', 'player_recent_teleport_dx80', 'powerups', 'rain_custom', 'rankup', 'rocketbackblast', 'rocketjumptrail', 'rockettrail', 'rockettrail_dx80', 'rps', 'scary_ghost', 'shellejection', 'shellejection_dx80', 'shellejection_high', 'smoke_blackbillow', 'smoke_blackbillow_dx80', 'smoke_blackbillow_hoodoo', 'soldierbuff', 'soldierbuff_dx80', 'sparks', 'stamp_spin', 'stickybomb', 'stickybomb_dx80', 'stormfront', 'taunt_fx', 'teleported_fx', 'teleport_status', 'training', 'urban_fx', 'vgui_menu_particles', 'water', 'water_dx80', 'weapon_unusual_cool', 'weapon_unusual_energyorb', 'weapon_unusual_hot', 'xms'}
if not DTF2.LOAD_PARTICLES
	game.AddParticles("particles/#{part}.pcf") for part in *manifest
DTF2.LOAD_PARTICLES = true

toPrecache = {
	'cowmangler_idle_child_beam01'
	'cowmangler_idle_child_electro1'
	'cowmangler_idle_child_electro2'
	'cowmangler_impact_charged_child_electro'
	'cowmangler_impact_charged_child_electrohelpers'
	'cowmangler_impact_charged_child_flash'
	'cowmangler_impact_charged_child_rings'
	'cowmangler_impact_charged_child_sparks'
	'cowmangler_impact_normal_child_electro'
	'cowmangler_impact_normal_child_electrohelpers'
	'cowmangler_impact_normal_child_flash'
	'cowmangler_impact_normal_child_rings'
	'cowmangler_impact_normal_child_sparks'
	'cowmangler_muzzleflash_charged_child_electro'
	'cowmangler_muzzleflash_chargeup_child_electro'
	'cowmangler_muzzleflash_chargeup_child_glow'
	'cowmangler_muzzleflash_normal_child_electro'
	'cowmangler_muzzleflash_normal_child_sparks'
	'cowmangler_reload_child_sparks01'
	'cowmangler_reload_child_sparks02'
	'cowmangler_trail_charged_child_core03'
	'cowmangler_trail_charged_child_electro_locked'
	'cowmangler_trail_charged_child_rings'
	'cowmangler_trail_charged_child_sparks'
	'cowmangler_trail_charged_child_core03'
	'cowmangler_trail_charged_child_rings'
	'drg_cow_explosion_coreflash'
	'drg_cow_explosion_coreflash_blue'
	'drg_cow_explosion_flash_1'
	'drg_cow_explosion_flash_1_blue'
	'drg_cow_explosion_flashup'
	'drg_cow_explosion_flashup_blue'
	'drg_cow_explosion_flyingembers'
	'drg_cow_explosion_flyingembers_blue'
	'drg_cow_explosion_smoke'
	'drg_cow_explosion_smoke_blue'
	'drg_cow_explosion_sparkles'
	'drg_cow_explosion_sparkles_blue'
	'drg_cow_explosion_sparkles_charged'
	'drg_cow_explosion_sparkles_charged_blue'
	'drg_cow_explosion_sparks'
	'drg_cow_explosion_sparks_blue'
	'drg_cow_explosioncore_charged'
	'drg_cow_explosioncore_charged_blue'
	'drg_cow_explosioncore_normal'
	'drg_cow_explosioncore_normal_blue'
	'drg_cow_idle'
	'drg_cow_idle_blue'
	'drg_cow_idle_electro1'
	'drg_cow_idle_electro1_blue'
	'drg_cow_idle_electro2'
	'drg_cow_idle_electro2_blue'
	'drg_cow_muzzleflash_charged'
	'drg_cow_muzzleflash_charged_blue'
	'drg_cow_muzzleflash_normal'
	'drg_cow_muzzleflash_normal_blue'
	'drg_cow_muzzleflash_sparkles'
	'drg_cow_muzzleflash_sparkles_blue'
	'drg_cow_rockettrail_burst'
	'drg_cow_rockettrail_burst_blue'
	'drg_cow_rockettrail_burst_charged'
	'drg_cow_rockettrail_burst_charged_blue'
	'drg_cow_rockettrail_charged'
	'drg_cow_rockettrail_charged_blue'
	'drg_cow_rockettrail_fire'
	'drg_cow_rockettrail_fire_blue'
	'drg_cow_rockettrail_fire_charged'
	'drg_cow_rockettrail_fire_charged_blue'
	'drg_cow_rockettrail_normal'
	'drg_cow_rockettrail_normal_blue'
	'drg_cowmangler_idle'
	'drg_cowmangler_impact_charged'
	'drg_cowmangler_impact_normal'
	'drg_cowmangler_muzzleflash_charged'
	'drg_cowmangler_muzzleflash_chargeup'
	'drg_cowmangler_muzzleflash_normal'
	'drg_cowmangler_trail_charged'
	'drg_cowmangler_trail_normal'
	'birthday_player_circling'
	'birthday_player_circling_flame'
	'birthday_player_circling_flame_trail'
	'birthday_player_circling_glow'
	'bonersaw_temp'
	'bread_gloves_crumbs'
	'bread_gloves_droplets'
	'bread_gloves_goop'
	'bread_sapper_bolts'
	'bread_sapper_green_goop'
	'breadjar_groundsplash'
	'breadjar_impact'
	'breadjar_impact_bits'
	'breadjar_impact_cloud'
	'community_sparkle'
	'community_sparkle_rand'
	'duel_blue'
	'duel_blue_burst'
	'duel_red'
	'duel_red_burst'
	'energydrink_cola_splash'
	'energydrink_milk_splash'
	'energydrink_splash'
	'foot_stamp'
	'halloween_boss_foot_fire_customcolor'
	'halloween_boss_foot_impact_customcolor'
	'halloween_boss_victim'
	'halloween_ghosts'
	'halloween_gift_balloon01'
	'halloween_gift_balloon02'
	'halloween_gift_confetti_colors'
	'halloween_gift_pickup'
	'halloween_jack'
	'halloween_jack_glow'
	'halloween_notes'
	'halloween_pickup_active'
	'halopoint'
	'headphone_notes'
	'headphone_soundwave'
	'healhuff_blu'
	'healhuff_blu_mist'
	'healhuff_red'
	'healhuff_red_mist'
	'healthgained_blu'
	'healthgained_blu_giant'
	'healthgained_blu_large'
	'healthgained_red'
	'healthgained_red_giant'
	'healthgained_red_large'
	'healthlost_blu'
	'healthlost_red'
	'peejar_drips'
	'peejar_drips_cb'
	'peejar_drips_milk'
	'peejar_groundsplash'
	'peejar_groundsplash_milk'
	'peejar_groundsplash_small'
	'peejar_icon'
	'peejar_impact'
	'peejar_impact_bits'
	'peejar_impact_bits_milk'
	'peejar_impact_cloud'
	'peejar_impact_cloud_milk'
	'peejar_impact_cloud_small'
	'peejar_impact_milk'
	'peejar_impact_small'
	'peejar_impacts_bits_small'
	'peejar_trail_blu'
	'peejar_trail_blu_glow'
	'peejar_trail_red'
	'peejar_trail_red_glow'
	'pumpkin_bits'
	'pumpkin_cloud'
	'pumpkin_explode'
	'pumpkin_sparkle'
	'sandwich_cheese'
	'sandwich_fx'
	'sandwich_lettuce'
	'sandwich_meat'
	'speech_mediccall'
	'speech_mediccall_attention'
	'speech_medichurt'
	'superare_balloon'
	'superrare_balloon_b'
	'superrare_balloon_c'
	'superrare_beam1_glow'
	'superrare_beams1'
	'superrare_beams1_newstyle'
	'superrare_beany_b'
	'superrare_beany_c'
	'superrare_beany_green'
	'superrare_beany_green_b'
	'superrare_beany_hearts'
	'superrare_beany_hearts_b'
	'superrare_beany_target'
	'superrare_beany_tf'
	'superrare_burning1'
	'superrare_burning2'
	'superrare_burning_smoke'
	'superrare_circling_childglow'
	'superrare_circling_childglow_pink'
	'superrare_circling_glow'
	'superrare_circling_heart'
	'superrare_circling_peacesign'
	'superrare_circling_skull'
	'superrare_circling_tf'
	'superrare_confetti_green'
	'superrare_confetti_purple'
	'superrare_flies'
	'superrare_ghosts'
	'superrare_ghosts_childglow'
	'superrare_greenenergy'
	'superrare_halo'
	'superrare_halo_b'
	'superrare_orbit'
	'superrare_plasma1'
	'superrare_plasma2'
	'superrare_purpleenergy'
	'superrare_sparkles1'
	'superrare_sparkles2'
	'superrare_sparkles3'
	'superrare_stormcloud'
	'superrare_stormcloud_b'
	'superrare_test'
	'tfc_sniper_charge_blue'
	'tfc_sniper_charge_red'
	'turret_shield'
	'turret_shield_b'
	'unusual_aaa_aaa'
	'unusual_bats_flaming_bat_green'
	'unusual_bats_flaming_bat_orange'
	'unusual_bats_flaming_bat_purple'
	'unusual_bats_flaming_fire_green'
	'unusual_bats_flaming_fire_orange'
	'unusual_bats_flaming_fire_purple'
	'unusual_bats_flaming_glow_green'
	'unusual_bats_flaming_glow_orange'
	'unusual_bats_flaming_glow_purple'
	'unusual_bats_flaming_proxy_green'
	'unusual_bats_flaming_proxy_orange'
	'unusual_bats_flaming_proxy_purple'
	'unusual_blizzard'
	'unusual_blizzard_clouds'
	'unusual_blizzard_snow'
	'unusual_bubbles'
	'unusual_bubbles_green'
	'unusual_bubbles_green_fumes'
	'unusual_bubbles_green_goo'
	'unusual_bubbles_green_large'
	'unusual_bubbles_large'
	'unusual_crisp_spotlights'
	'unusual_crisp_spotlights_cones01'
	'unusual_crisp_spotlights_cones02'
	'unusual_crisp_spotlights_cones03'
	'unusual_fullmoon_cloudy'
	'unusual_fullmoon_cloudy_green'
	'unusual_fullmoon_cloudy_green_clouds'
	'unusual_fullmoon_cloudy_green_clouds2'
	'unusual_fullmoon_cloudy_green_glow'
	'unusual_fullmoon_cloudy_secret'
	'unusual_fullmoon_cloudy_secret_eyeglow'
	'unusual_fullmoon_cloudy_secret_skull'
	'unusual_hearts_bubbling'
	'unusual_hearts_bubbling_glow'
	'unusual_meteor_cast_text_green'
	'unusual_meteor_cast_text_orange'
	'unusual_meteor_cast_text_purple'
	'unusual_meteor_cast_wheel_green'
	'unusual_meteor_cast_wheel_orange'
	'unusual_meteor_cast_wheel_purple'
	'unusual_meteor_fireball_small_glow_orange'
	'unusual_meteor_fireball_small_glow_purple'
	'unusual_meteor_fireball_small_green'
	'unusual_meteor_fireball_small_orange'
	'unusual_meteor_fireball_small_purple'
	'unusual_meteor_shower01_green'
	'unusual_meteor_shower01_orange'
	'unusual_meteor_shower01_purple'
	'unusual_meteor_shower02_green'
	'unusual_meteor_shower02_orange'
	'unusual_meteor_shower02_purple'
	'unusual_meteor_shower_parent_green'
	'unusual_meteor_shower_parent_orange'
	'unusual_meteor_shower_parent_purple'
	'unusual_meteor_small_trail_green'
	'unusual_meteor_small_trail_orange'
	'unusual_meteor_small_trail_purple'
	'unusual_orbit_cards_teamcolor_blue'
	'unusual_orbit_cards_teamcolor_red'
	'unusual_orbit_cards_trail_teamcolor_blue'
	'unusual_orbit_cards_trail_teamcolor_red'
	'unusual_orbit_cash'
	'unusual_orbit_cash_trail'
	'unusual_orbit_fire'
	'unusual_orbit_fire_dark'
	'unusual_orbit_fire_dark_flames'
	'unusual_orbit_fire_dark_glow'
	'unusual_orbit_fire_flames'
	'unusual_orbit_fire_glow'
	'unusual_orbit_fullmoon_cloudy'
	'unusual_orbit_fullmoon_cloudy_clouds'
	'unusual_orbit_fullmoon_cloudy_glow'
	'unusual_orbit_jack_flaming'
	'unusual_orbit_jack_flaming_fire'
	'unusual_orbit_jack_flaming_glow'
	'unusual_orbit_jack_flaming_glow2'
	'unusual_orbit_nutsnbolts'
	'unusual_orbit_nutsnbolts_fall'
	'unusual_orbit_nutsnbolts_large'
	'unusual_orbit_planets'
	'unusual_planets_child01'
	'unusual_planets_child02'
	'unusual_planets_child03'
	'unusual_planets_child04'
	'unusual_planets_planet01'
	'unusual_planets_planet02'
	'unusual_planets_planet03'
	'unusual_planets_planet04'
	'unusual_robot_holo_glow_green'
	'unusual_robot_holo_glow_green_pixels'
	'unusual_robot_holo_glow_orange'
	'unusual_robot_holo_glow_orange_pixels'
	'unusual_robot_orbit_binary'
	'unusual_robot_orbit_binary2'
	'unusual_robot_orbit_binary_fall'
	'unusual_robot_orbit_binary_fall2'
	'unusual_robot_orbit_binary_glow'
	'unusual_robot_orbit_binary_glow2'
	'unusual_robot_orbiting_sparks'
	'unusual_robot_orbiting_sparks2'
	'unusual_robot_orbiting_sparks_arclightning'
	'unusual_robot_orbiting_sparks_arclightning2'
	'unusual_robot_orbiting_sparks_glow'
	'unusual_robot_orbiting_sparks_glow2'
	'unusual_robot_orbiting_sparks_sparks'
	'unusual_robot_orbiting_sparks_sparks2'
	'unusual_robot_orbiting_sparks_star'
	'unusual_robot_orbiting_sparks_star2'
	'unusual_robot_radioactive'
	'unusual_robot_radioactive2'
	'unusual_robot_radioactive_drops'
	'unusual_robot_radioactive_drops2'
	'unusual_robot_radioactive_glow'
	'unusual_robot_radioactive_glow2'
	'unusual_robot_time_warp'
	'unusual_robot_time_warp2'
	'unusual_robot_time_warp_edge'
	'unusual_robot_time_warp_edge2'
	'unusual_robot_time_warp_rays'
	'unusual_robot_time_warp_spiral'
	'unusual_robot_time_warp_spiral2'
	'unusual_skull_misty'
	'unusual_skull_misty_eyeglow'
	'unusual_skull_misty_glow'
	'unusual_skull_misty_mist'
	'unusual_skull_misty_mist2'
	'unusual_skull_misty_mist3'
	'unusual_skull_misty_skull'
	'unusual_smoking'
	'unusual_smoking_base'
	'unusual_smoking_drift'
	'unusual_sparkler_green'
	'unusual_sparkler_orange'
	'unusual_spellbook_circle_green'
	'unusual_spellbook_circle_purple'
	'unusual_spellbook_fire_green'
	'unusual_spellbook_fire_purple'
	'unusual_spellbook_sparkles_green'
	'unusual_spellbook_sparkles_purple'
	'unusual_spotlights'
	'unusual_spotlights_cones01'
	'unusual_spotlights_cones02'
	'unusual_spotlights_cones03'
	'unusual_spotlights_core'
	'unusual_spotlights_sparkles'
	'unusual_spray_confetti'
	'unusual_spray_confetti_balloons'
	'unusual_steaming'
	'unusual_steaming_base'
	'unusual_streaming_drift'
	'unusual_storm'
	'unusual_storm_blood'
	'unusual_storm_blood_clouds'
	'unusual_storm_blood_clouds_core'
	'unusual_storm_blood_rain'
	'unusual_storm_clouds'
	'unusual_storm_knives'
	'unusual_storm_knives_blood'
	'unusual_storm_knives_clouds'
	'unusual_storm_knives_core'
	'unusual_storm_knives_knives'
	'unusual_storm_lightning'
	'unusual_storm_rain'
	'unusual_storm_spooky'
	'unusual_storm_spooky_clouds01'
	'unusual_storm_spooky_clouds02'
	'unusual_storm_spooky_lightning'
	'unusual_storm_spooky_lightning2'
	'unusual_storm_spooky_lightning3'
	'unusual_storm_spooky_rain'
	'unusual_zap_green'
	'unusual_zap_green_glow'
	'unusual_zap_yellow'
	'unusual_zap_yellow_glow'
	'_brushstroke'
	'burning_torch'
	'burninggibs'
	'burningplayer_blue'
	'burningplayer_blueglow'
	'burningplayer_corpse'
	'burningplayer_corpse_rainbow'
	'burningplayer_corpse_rainbow_glow'
	'burningplayer_corpse_rainbow_glow_white'
	'burningplayer_corpse_rainbow_stars'
	'burningplayer_corpseglow'
	'burningplayer_flyingbits'
	'burningplayer_glow'
	'burningplayer_glow_blue'
	'burningplayer_rainbow'
	'burningplayer_rainbow_blue'
	'burningplayer_rainbow_flame'
	'burningplayer_rainbow_glow'
	'burningplayer_rainbow_glow_old'
	'burningplayer_rainbow_glow_white'
	'burningplayer_rainbow_OLD'
	'burningplayer_rainbow_red'
	'burningplayer_rainbow_stars'
	'burningplayer_rainbow_stars01'
	'burningplayer_rainbow_stars02'
	'burningplayer_rainbow_stars03'
	'burningplayer_rainbow_stars04'
	'burningplayer_rainbow_stars_base'
	'burningplayer_rainbow_stroke'
	'burningplayer_rainbow_v2'
	'burningplayer_red'
	'burningplayer_redglow'
	'burningplayer_smoke'
	'burningplayer_smoke_blue'
	'electrocuted_blue'
	'electrocuted_blue_flash'
	'electrocuted_gibbed_blue'
	'electrocuted_gibbed_blue_flash'
	'electrocuted_gibbed_red'
	'electrocuted_gibbed_red_flash'
	'electrocuted_red'
	'electrocuted_red_flash'
	'flaming_arrow'
	'flaming_arrow_smoke'
	'flying_flaming_arrow'
	'flying_flaming_arrow_smoke'
	'ghost_pumpkin'
	'ghost_pumpkin_blueglow'
	'ghost_pumpkin_flyingbits'
	'halloween_burningplayer_flyingbits'
	'pyrovision_flaming_arrow'
	'pyrovision_flying_flaming_arrow'
	'pyrovision_v_flaming_arrow'
	'v_flaming_arrow'
	'v_flaming_arrow_smoke'
	'blood_bread_biting'
	'blood_bread_biting2'
	'blood_decap'
	'blood_decap_arterial_spray'
	'blood_decap_fountain'
	'blood_decap_streaks'
	'blood_impact_backscatter'
	'blood_impact_backscatter_red'
	'blood_impact_green01'
	'blood_impact_green01_droplets'
	'blood_impact_green01_goop'
	'blood_impact_red_01'
	'blood_impact_red_01_chunk'
	'blood_impact_red_01_droplets'
	'blood_impact_red_01_goop'
	'blood_impact_red_01_smalldroplets'
	'blood_spray_red_01'
	'blood_spray_red_01_far'
	'env_grinder_oilspray'
	'env_grinder_oilspray_cash'
	'env_sawblood'
	'env_sawblood_chunk'
	'env_sawblood_goop'
	'env_sawblood_mist'
	'lowV_blood_impact_red_01'
	'lowV_blood_spray_red_01'
	'lowV_blood_spray_red_01_far'
	'lowV_debrischunks'
	'lowV_impactglow'
	'lowV_oildroplets'
	'lowV_smallerchunks'
	'lowv_sparks1'
	'lowV_water_blood_impact_red_01'
	'lowV_water_bubbles'
	'lowV_water_debris'
	'temp_blood_spray_red_01'
	'temp_blood_spray_red_01_far'
	'tfc_sniper_mist'
	'tfc_sniper_mist2'
	'tfc_sniper_mist_dir'
	'tfc_sniper_mist_streaks'
	'water_blood_impact_red_01'
	'water_blood_impact_red_01_chunk'
	'water_blood_impact_red_01_goop'
	'achieved'
	'crit_text'
	'doubledonk_test'
	'heal_text'
	'hit_text'
	'mini_firework_flare'
	'mini_fireworks'
	'minicrit_text'
	'miss_text'
	'critical_grenade_blue'
	'critical_grenade_blue_extra'
	'critical_grenade_blue_glow'
	'critical_grenade_red'
	'critical_grenade_red_extra'
	'critical_grenade_red_glow'
	'critical_pipe_blue'
	'critical_pipe_red'
	'pipebomb_timer_blue'
	'pipebomb_timer_red'
	'pipebombtrail_blue'
	'pipebombtrail_red'
	'stickybomb_pulse_blue'
	'stickybomb_pulse_red'
	'stickybombtrail_blue'
	'stickybombtrail_red'
	'stunballtrail_blue'
	'stunballtrail_blue_crit'
	'stunballtrail_red'
	'stunballtrail_red_crit'
	'critgun_weaponmodel_blu'
	'critgun_weaponmodel_blu_glow'
	'critgun_weaponmodel_red'
	'critgun_weaponmodel_red_glow'
	'crutgun_firstperson'
	'bullet_distortion_trail'
	'bullet_distortion_trail_tracer'
	'critical_rocket_blue'
	'critical_rocket_bluesparks'
	'critical_rocket_red'
	'critical_rocket_redsparks'
	'flaregun_crit_blue'
	'flaregun_crit_red'
	'flaregun_energyfield_blue'
	'flaregun_energyfield_red'
	'flaregun_sparkles_blue'
	'flaregun_sparkles_red'
	'flaregun_trail_blue'
	'flaregun_trail_crit_blue'
	'flaregun_trail_crit_red'
	'flaregun_trail_red'
	'halloween_rockettrail'
	'healshot_trail_blue'
	'healshot_trail_red'
	'pyrovision_flaregun_trail_blue'
	'pyrovision_flaregun_trail_crit_blue'
	'pyrovision_flaregun_trail_crit_red'
	'pyrovision_flaregun_trail_red'
	'pyrovision_rockettrail'
	'pyrovision_scorchshot_trail_blue'
	'pyrovision_scorchshot_trail_crit_blue'
	'pyrovision_scorchshot_trail_crit_red'
	'pyrovision_scorchshot_trail_red'
	'rockettrail'
	'rockettrail_!'
	'rockettrail_airstrike'
	'rockettrail_airstrike_line'
	'rockettrail_bubbles'
	'rockettrail_burst'
	'rockettrail_burst_airstrike'
	'rockettrail_fire'
	'rockettrail_fire_airstrike'
	'rockettrail_underwater'
	'rockettrail_waterbubbles'
	'scorchshot_trail_blue'
	'scorchshot_trail_crit_blue'
	'scorchshot_trail_crit_red'
	'scorchshot_trail_red'
	'sentry_rocket'
	'sentry_rocket_burst'
	'sentry_rocket_fire'
	'tranq_distortion_trail'
	'tranq_tracer_teamcolor_blue'
	'tranq_tracer_teamcolor_red'
	'Explosion_bubbles'
	'Explosion_CoreFlash'
	'Explosion_Debris001'
	'Explosion_Dustup'
	'Explosion_Dustup_2'
	'Explosion_Flash_1'
	'Explosion_Flashup'
	'Explosion_FloatieEmbers'
	'Explosion_FlyingEmbers'
	'Explosion_ShockWave_01'
	'Explosion_Smoke_1'
	'ExplosionCore_buildings'
	'ExplosionCore_MidAir'
	'ExplosionCore_MidAire_Flare'
	'ExplosionCore_MidAir_underwater'
	'ExplosionCore_sapperdestroyed'
	'ExplosionCore_Wall'
	'ExplosionCore_Wall_underwater'
	'Explosions_MA_coreflash'
	'Explosions_MA_Debris001'
	'Explosions_MA_Dustup'
	'Explosions_MA_Dustup_2'
	'Explosions_MA_Flash_1'
	'Explosions_MA_Flashup'
	'Explosions_MA_FloatieEmbers'
	'Explosions_MA_FlyingEmbers'
	'Explosions_MA_Smoke_1'
	'Explosions_UW_Debris001'
	'muzzle_sentry'
	'muzzle_sentry2'
	'medicgun_beam_blue'
	'medicgun_beam_blue_drips'
	'medicgun_beam_blue_healing'
	'medicgun_beam_blue_invulnbright'
	'medicgun_beam_blue_invun'
	'medicgun_beam_blue_invunglow'
	'medicgun_beam_blue_marker'
	'medicgun_beam_blue_muzzle'
	'medicgun_beam_blue_pluses'
	'medicgun_beam_blue_targeted'
	'medicgun_beam_blue_trail'
	'medicgun_beam_red'
	'medicgun_beam_red_drips'
	'medicgun_beam_red_healing'
	'medicgun_beam_red_invulnbright'
	'medicgun_beam_red_invun'
	'medicgun_beam_red_invunglow'
	'medicgun_beam_red_marker'
	'medicgun_beam_red_muzzle'
	'medicgun_beam_red_pluses'
	'medicgun_beam_red_targeted'
	'medicgun_beam_red_trail'
	'dispenser_beam_blue_pluses'
	'dispenser_beam_blue_trail'
	'dispenser_beam_red_pluses'
	'dispenser_beam_red_trail'
	'dispenser_heal_blue'
	'dispenser_heal_red'
	'muzzle_shotgun'
	'muzzle_shotgun_flash'
	'muzzle_shotgun_smoke'
	'muzzle_shotgun_sparks'
	'bot_drips_cheap'
	'bot_recent_teleport_blue'
	'player_drips_blue'
	'player_dripsred'
	'player_glowblue'
	'player_glowred'
	'player_recent_teleport_blue'
	'player_recent_teleport_red'
	'player_sparkles_blue'
	'player_sparkles_red'
	'teleporter_arms_circle_blue'
	'teleporter_arms_circle_blue_blink'
	'teleporter_arms_circle_red'
	'teleporter_arms_circle_red_blink'
	'teleporter_blue_charged'
	'teleporter_blue_charged_hotplate'
	'teleporter_blue_charged_level1'
	'teleporter_blue_charged_level2'
	'teleporter_blue_charged_level3'
	'teleporter_blue_charged_wisps'
	'teleporter_blue_entrance'
	'teleporter_blue_entrance_disc'
	'teleporter_blue_entrance_level1'
	'teleporter_blue_entrance_level2'
	'teleporter_blue_entrance_level3'
	'teleporter_blue_exit'
	'teleporter_blue_exit_level1'
	'teleporter_blue_exit_level2'
	'teleporter_blue_exit_level3'
	'teleporter_blue_floorglow'
	'teleporter_blue_wisps_level2'
	'teleporter_blue_wisps_level3'
	'teleporter_red_charged'
	'teleporter_red_charged_hotplate'
	'teleporter_red_charged_level1'
	'teleporter_red_charged_level2'
	'teleporter_red_charged_level3'
	'teleporter_red_charged_wisps'
	'teleporter_red_entrance'
	'teleporter_red_entrance_disc'
	'teleporter_red_entrance_level1'
	'teleporter_red_entrance_level2'
	'teleporter_red_entrance_level3'
	'teleporter_red_exit'
	'teleporter_red_exit_level1'
	'teleporter_red_exit_level2'
	'teleporter_red_exit_level3'
	'teleporter_red_floorglow'
	'teleporter_red_wisps_level2'
	'teleporter_red_wisps_level3'
	'teleported_blue'
	'teleported_flash'
	'teleported_mvm_bot'
	'teleported_mvm_bot_bits'
	'teleported_mvm_bot_clouds1'
	'teleported_mvm_bot_clouds2'
	'teleported_mvm_bot_core'
	'teleported_mvm_bot_dirt'
	'teleported_mvm_bot_dust'
	'teleported_mvm_bot_flash'
	'teleported_mvm_bot_glowdust'
	'teleported_mvm_bot_groundflash'
	'teleported_mvm_bot_outerbeam'
	'teleported_mvm_bot_rings'
	'teleported_mvm_bot_rings2'
	'teleported_mvm_bot_rings3'
	'teleported_mvm_bot_skyflash'
	'teleported_mvm_bot_skyglow'
	'teleported_mvm_bot_trails'
	'teleported_red'
	'teleportedin_blue'
	'teleportedin_red'
	'teleporter_mvm_bot_persist'
	'teleporter_mvm_bot_persist_bits1'
	'teleporter_mvm_bot_persist_clouds1'
	'teleporter_mvm_bot_persist_clouds2'
	'teleporter_mvm_bot_persist_core'
	'teleporter_mvm_bot_persist_dirt'
	'teleporter_mvm_bot_persist_ring01'
	'teleporter_mvm_bot_persist_skyglow'
	'teleporter_mvm_bot_ring'
	'medicgun_beam_attrib_drips'
	'medicgun_beam_attrib_healing'
	'medicgun_beam_attrib_muzzle'
	'medicgun_beam_attrib_overheal'
	'medicgun_beam_attrib_overheal_blue'
	'medicgun_beam_attrib_overheal_red'
	'medicgun_beam_attrib_shards'
	'overhealedplayer_blue_pluses'
	'overhealedplayer_red_pluses'
}

PrecacheParticleSystem(part) for part in *toPrecache
