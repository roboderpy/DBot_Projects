
--[[
Copyright (C) 2016 DBot

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
]]

__DBot_Posters = {}

local array = {
	'01_10_posters.jpg',
	'10.jpg',
	'114449980147_bfRCxqIm_l.jpg',
	'1309165354_19.jpg',
	'1331961643_5412078903_5ac84fa25e_o.jpg',
	'1335719782580.png',
	'1355018107-0687214-www.nevsepic.com.ua.jpg',
	'1355019754-0690987-www.nevsepic.com.ua.jpg',
	'1355019755-0691244-www.nevsepic.com.ua.jpg',
	'1409646958_shutterstock_1839460431.jpg',
	'1435931371_1768831563.jpg',
	'1436278802_24129226.jpg',
	'1439365071_2143114778.jpg',
	'1442568213_1878002921.jpg',
	'1442786805_1486407113.jpg',
	'1443081490_748911424.jpg',
	'150462274571_qxoDCOMK_l.jpg',
	'16.jpg',
	'1799682.jpg',
	'1799734.jpg',
	'1d6620cs-960.jpg',
	'20150810141635.jpg',
	'207696110484_duSMAQlr_l.jpg',
	'2153509.jpg',
	'2440281d9ba991815bb659ab929.jpg',
	'26866.jpg',
	'2f87407d1264t.jpg',
	'3dhTcsZ.jpg',
	'417982228039_Mfri0tt5_l.jpg',
	'436620cs-960.jpg',
	'467927987390_z0jwDO6N_l.jpg',
	'50008885.jpg',
	'575524057570925.jpg',
	'60.jpg',
	'60174__safe_berry+punch_poster_propaganda_ethanol_c2h5oh.png',
	'63929610_WindowsLiveWriter_8fa2cad42483_F1FC_RRyoRSRRRSR_RSRSSSRRyo_S_RRSRRRyo_3_9045cef04a514b2794d68da641df8f69.jpg',
	'66156158.jpg',
	'6nmDp29T6_0.jpg',
	'78027_original.jpg',
	'793a4cc95eec610261820b663c4.jpg',
	'839719964_ElMP0Uqc_l.jpg',
	'899859.jpg',
	'899863.jpg',
	'899864.jpg',
	'8a3498f560d69664c4657f2b721650a4.jpg',
	'8af9fc4c58be7997297f7babeadcd4c1.jpg',
	'8onw0.png',
	'937692bdfde95c5f28a137267a4ed949.jpg',
	'Adslibitum00.jpg',
	'am801-thumb-300x384.jpg',
	'applejack_poster_by_fluffytuzki-d4xxa1g.png',
	'audi_hofmann.jpg',
	'big%20(1).jpg',
	'big%20(2).jpg',
	'big.jpg',
	'cab0a3c1b065d7321a09db17fa7a0799.jpg',
	'celestia.jpg',
	'chrysalis_ww2_propaganda_poster_shes_watching_you_by_xx1simon1xx-d4y83xm.jpg',
	'creative-poster-design%20(12).jpg',
	'de0a07c3f8d5.jpg',
	'depositphotos_25385735-Bicycle-vintage-style-poster.jpg',
	'depositphotos_25387105-Bicycle-in-the-city-vintage-style-poster.jpg',
	'depositphotos_25695191-Vintage-London-poster-on-old-background-texture-with-England-fla.jpg',
	'depositphotos_27012621-Vintage-sausages-vector-poster.jpg',
	'depositphotos_32977773-Vector-vintage-coffee-house-poster.jpg',
	'depositphotos_65792131-Vintage-boxing-poster.jpg',
	'ee240aca8eb0ed51bba72689095.jpg',
	'enhanced-buzz-25816-1289216611-1.jpg',
	'fluttershy_poster_by_fluffytuzki-d4xx9zd.png',
	'fluttershy_yay_poster_by_anthroxtra-d5ggyyd.png',
	'friday.jpg',
	'full%20(1).jpg',
	'full.jpg',
	'il_fullxfull.366644306_jkbj.jpg',
	'images.jpg',
	'images3eNxIUsO4GU.jpg',
	'imagesEhALuBrhRFo.jpg',
	'jedi.jpg',
	'join_the_herdmodded-Copy.jpg',
	'let_it_flow___motivational_art_poster_by_lynseyrose95-d6thr8v.png',
	'lyra_propaganda_poster_by_johnn195cz-d5fngt2.png',
	'mlfw290_huge.jpg',
	'my-little-pony-equestria-girls-movie-poster-10.jpg',
	'my-little-pony-friendship-is-magic-brony-it-wasnt-so-bad.jpg',
	'Never-Give-up-Inspiring-Poster-Design-ilovedoodle1.jpg',
	'new_lunar_republic_propaganda_poster_by_apv301-d56crd5.png',
	'night-of-the-living-dead32%20(1).jpg',
	'nightmarer.png',
	'nightmare_moon_princess_luna_mixed_pic_by_grumbeerkopp-d4s6s56.png',
	'No%20smoking%20posters%20-%201985.jpg',
	'obama_pony_posters_2__cachinnate_by_muramasa91-d64nq5k.jpg',
	'obama_pony_posters_2__control_by_muramasa91-d64nq5y.png',
	'obama_pony_posters_2__space_by_muramasa91-d6g5p5c.png',
	'octavia_by_fr3zo-d54j4o8.jpg',
	'pinkie_pie_____hug_____propaganda_by_remi721-d5au10g.png',
	'pony_propaganda_poster_by_procaballus-d3g6jjl.jpg',
	'post7.jpg',
	'poster1.jpg',
	'poster1989.jpg',
	'pp_17_740783_6546.jpg',
	'rainbow_dash_swag_poster_by_fluffytuzki-d4xw405.png',
	'rarity__s_presidential_poster__2__by_argent1n0-d5fuzx9.png',
	'Sasha_Kramar_motivation_posters_06.jpg',
	'skyfall_poster_by_hvejsel-d5pa0cj.png',
	'skyrim_poster_40x50_cm_by_biosmanager-d8lo3w6.png',
	'soviet_pony_propaganda_poster_by_kta1540-d6nyr6o.jpg',
	'tCYzTdPmmBs.jpg',
	'the_great_and_powerful_trixie_poster_by_red4028-d57v6o2.jpg',
	'Untitled-413.jpg',
	'venezia-gondole-venice-gondola-italian-vintage-style-travel-poster.jpg',
	'video-game-posters-1.jpg',
	'vintage-posters3_thumb-600x492.jpg',
	'vintage-style-coffee-poster_134020025.jpg',
	'vinyl_scratch_poster_by_red4028-d57vafa.jpg',
	'vinyl_scratch__s_presidential_poster_by_argent1n0-d5ftf1a.png',
	'WEa-y4waJAI.jpg',
	'zDTN2XpOraI.jpg'
}

for k, v in pairs(array) do
	table.insert(__DBot_Posters, 'https://dbot.serealia.ca/poster/' .. v)
end