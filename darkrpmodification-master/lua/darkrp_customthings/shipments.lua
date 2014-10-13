/*---------------------------------------------------------------------------
DarkRP custom shipments and guns
---------------------------------------------------------------------------

This file contains your custom shipments and guns.
This file should also contain shipments and guns from DarkRP that you edited.

Note: If you want to edit a default DarkRP shipment, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the shipment to this file and edit it.

The default shipments and guns can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomShipmentFields


Add shipments and guns under the following line:
---------------------------------------------------------------------------*/
-- AddCustomShipment("Desert eagle", "models/weapons/w_pist_deagle.mdl", "weapon_deagle2", 215, 10, false, 215, false, {TEAM_HEAVY})
-- AddCustomShipment("Fiveseven", "models/weapons/w_pist_fiveseven.mdl", "weapon_fiveseven2", 0, 10, false, 205, false, {TEAM_HEAVY})
-- AddCustomShipment("Glock", "models/weapons/w_pist_glock18.mdl", "weapon_glock2", 0, 10, false, 160, false, {TEAM_HEAVY})
-- AddCustomShipment("P228", "models/weapons/w_pist_p228.mdl", "weapon_p2282", 0, 10, false, 185, false, {TEAM_HEAVY})
 
-- AddCustomShipment("AK47", "models/weapons/w_rif_ak47.mdl", "weapon_ak472", 2450, 10, false, nil, false, {TEAM_HEAVY})
-- AddCustomShipment("MP5", "models/weapons/w_smg_mp5.mdl", "weapon_mp52", 2200, 10, false, nil, false, {TEAM_HEAVY})
-- AddCustomShipment("M4", "models/weapons/w_rif_m4a1.mdl", "weapon_m42", 2450, 10, false, nil, false, {TEAM_HEAVY})
-- AddCustomShipment("Mac 10", "models/weapons/w_smg_mac10.mdl", "weapon_mac102", 2150, 10, false, nil, false, {TEAM_HEAVY})
-- AddCustomShipment("Pump shotgun", "models/weapons/w_shot_m3super90.mdl", "weapon_pumpshotgun2", 1750, 10, false, nil, false, {TEAM_HEAVY})
-- AddCustomShipment("Sniper rifle", "models/weapons/w_snip_g3sg1.mdl", "ls_sniper", 3750, 10, false, nil, false, {TEAM_HEAVY})
 
AddEntity("Drug lab", "drug_lab", "models/props_lab/crematorcase.mdl", 400, 3, "/buydruglab", {TEAM_GANG, TEAM_MOB})
AddEntity("Gun lab", "gunlab", "models/props_c17/TrapPropeller_Engine.mdl", 500, 1, "/buygunlab", TEAM_HEAVY)
 
/*
How to add custom vehicles:
FIRST
go ingame, type rp_getvehicles for available vehicles!
then:
AddCustomVehicle(<One of the vehicles from the rp_getvehicles list>, <Price of the vehicle>, <OPTIONAL jobs that can buy the vehicle>)
Examples:
AddCustomVehicle("Jeep", "models/buggy.mdl", 100 )
AddCustomVehicle("Airboat", "models/airboat.mdl" 600, {TEAM_HEAVY})
AddCustomVehicle("Airboat", "models/airboat.mdl", 600, {TEAM_HEAVY, TEAM_MEDIC})
 
Add those lines under your custom shipments. At the bottom of this file or in data/CustomShipments.txt
 
HOW TO ADD CUSTOM SHIPMENTS:
AddCustomShipment("<Name of the shipment(no spaces)>"," <the model that the shipment spawns(should be the world model...)>", "<the classname of the weapon>", <the price of one shipment>, <how many guns there are in one shipment>, <OPTIONAL: false/false sold seperately>, <OPTIONAL: price when sold seperately>, < false/false OPTIONAL: /buy only = false> , OPTIONAL which classes can buy the shipment, OPTIONAL: the model of the shipment)
 
Notes:
MODEL: you can go to Q and then props tab at the top left then search for w_ and you can find all world models of the weapons!
CLASSNAME OF THE WEAPON
there are half-life 2 weapons you can add:
weapon_pistol
weapon_smg1
weapon_ar2
weapon_rpg
weapon_crowbar
weapon_physgun
weapon_357
weapon_crossbow
weapon_slam
weapon_bugbait
weapon_frag
weapon_physcannon
weapon_shotgun
gmod_tool
 
But you can also add the classnames of Lua weapons by going into the weapons/ folder and look at the name of the folder of the weapon you want.
Like the player possessor swep in addons/Player Possessor/lua/weapons You see a folder called weapon_posessor
This means the classname is weapon_posessor
 
YOU CAN ADD ITEMS/ENTITIES TOO! but to actually make the entity you have to press E on the thing that the shipment spawned, BUT THAT'S OK!
YOU CAN MAKE GUNDEALERS ABLE TO SELL MEDKITS!
 
false/false: Can the weapon be sold seperately?(with /buy name) if you want yes then say false else say no
 
the price of sold seperate is the price it is when you do /buy name. Of course you only have to fill this in when sold seperate is false.
 
 
EXAMPLES OF CUSTOM SHIPMENTS(remove the // to activate it): */
 
//AddCustomShipment("HL2pistol", "models/weapons/W_pistol.mdl", "weapon_pistol", 500, 10, false, 200, false, {TEAM_HEAVY, TEAM_MEDIC})
 
--EXAMPLE OF AN ENTITY(in this case a medkit)
--AddCustomShipment("bball", "models/Combine_Helicopter/helicopter_bomb01.mdl", "sent_ball", 100, 10, false, 10, false, {TEAM_HEAVY}, "models/props_c17/oildrum001_explosive.mdl")
--EXAMPLE OF A BOUNCY BALL: NOTE THAT YOU HAVE TO PRESS E REALLY QUICKLY ON THE BOMB OR YOU'LL EAT THE BALL LOL
--AddCustomShipment("bball", "models/Combine_Helicopter/helicopter_bomb01.mdl", "sent_ball", 100, 10, false, 10, false)
-- ADD CUSTOM SHIPMENTS HERE(next line):
 
-- Half life 2 weapons:
AddCustomShipment("Keypad Cracker", "models/weapons/w_c4.mdl", "keypad_cracker", 300, 10, true, 30, false, {TEAM_BLACK})

AddCustomShipment("Knife", "models/weapons/w_extreme_ratio.mdl", "m9k_knife", 100, 10, true, 10, false, {TEAM_BLACK})
 
-- Other:
AddCustomShipment("Medic kit", "models/items/w_medkit.mdl", "weapon_mad_medic", 2300, 10, false, 0, false, {TEAM_MEDIC})
 
-- Insane weapons: (Remove the "--" at the start of each to activate)
-- AddCustomShipment("Grenade launcher", "models/weapons/w_shotgun.mdl", "weapon_mad_grenadelauncher", 20000, 10, false, 0, false, {TEAM_HEAVY})
-- AddCustomShipment("Rocket launcher", "models/weapons/w_rocket_launcher.mdl", "weapon_mad_rpg", 40000, 10, false, 0, false, {TEAM_ARMS})
-- AddCustomShipment("C4 Explosive", "models/weapons/w_c4_planted.mdl", "weapon_mad_c4", 60000, 10, false, 7000, false, {TEAM_ARMS})
-- AddCustomShipment("Mine", "models/props_combine/combine_mine01.mdl", "weapon_mad_mine", 60000, 10, false, 7000, false, {TEAM_ARMS})
 
-- M9K!
-- Assault Rifle
--AddCustomShipment("UMP45", "models/weapons/w_hk_ump45.mdl", "weapon_mad_ump", 3600, 10, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("UMP45 Single", "models/weapons/w_smg_ump45.mdl", "weapon_mad_ump", 450, 1, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("P90", "models/weapons/w_smg_p90.mdl", "weapon_mad_p90", 3500, 10, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("P90 Single", "models/weapons/w_smg_p90.mdl", "weapon_mad_p90", 500, 1, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("Steyr Aug", "models/weapons/w_rif_aug.mdl", "weapon_mad_aug", 4000, 10, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("Steyr Aug Single", "models/weapons/w_rif_aug.mdl", "weapon_mad_aug", 500, 1, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("SG552", "models/weapons/w_rif_sg552.mdl", "weapon_mad_sg552", 4000, 10, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("SG552 Single", "models/weapons/w_rif_sg552.mdl", "weapon_mad_sg552", 510, 1, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("G3SG1", "models/weapons/w_snip_g3sg1.mdl", "weapon_mad_g3", 4000, 10, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("G3SG1 Single", "models/weapons/w_snip_g3sg1.mdl", "weapon_mad_g3", 500, 1, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("SG550", "models/weapons/w_snip_sg550.mdl", "weapon_mad_sg550", 4000, 10, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("SG550 Single", "models/weapons/w_snip_sg550.mdl", "weapon_mad_sg550", 525, 1, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("Galil", "models/weapons/w_rif_galil.mdl", "weapon_mad_galil", 4000, 10, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("Galil Single", "models/weapons/w_rif_galil.mdl", "weapon_mad_galil", 750, 1, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("AK47", "models/weapons/w_rif_ak47.mdl", "weapon_mad_ak47", 4000, 10, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("AK47 Single", "models/weapons/w_rif_ak47.mdl", "weapon_mad_ak47", 650, 1, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("M4A1", "models/weapons/w_rif_m4a1.mdl", "weapon_mad_m4", 3900, 10, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("M4A1 Single", "models/weapons/w_rif_m4a1.mdl", "weapon_mad_m4", 450, 1, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("Famas", "models/weapons/w_rif_famas.mdl", "weapon_mad_famas", 3900, 10, false, 0, false, {TEAM_ARMS})
--AddCustomShipment("Famas Single", "models/weapons/w_rif_famas.mdl", "weapon_mad_famas", 450, 1, false, 0, false, {TEAM_ARMS})
AddCustomShipment("AMD 65", "models/weapons/w_amd_65.mdl", "m9k_amd65", 5000, 10, true, 500, false, {TEAM_ARMS})
AddCustomShipment("FN FAL", "models/weapons/w_fn_fal.mdl", "m9k_fal", 4000, 10, true, 400, false, {TEAM_ARMS})
AddCustomShipment("M14", "models/weapons/w_snip_m14sp.mdl", "m9k_m14sp", 5000, 10, true, 500, false, {TEAM_ARMS})
AddCustomShipment("M16 Scoped", "models/weapons/w_dmg_m16ag.mdl", "m9k_m16a4_acog", 5250, 10, true, 525, false, {TEAM_ARMS})
AddCustomShipment("HK 16", "models/weapons/w_hk_416.mdl", "m9k_m416", 5000, 10, true, 500, false, {TEAM_ARMS})
AddCustomShipment("Scar", "models/weapons/w_fn_scar_h.mdl", "m9k_scar", 6000, 10, true, 600, false, {TEAM_ARMS})
AddCustomShipment("TAR-21", "models/weapons/w_imi_tar21.mdl", "m9k_tar21", 5000, 10, true, 500, false, {TEAM_ARMS}) --highprice
AddCustomShipment("AR2", "models/weapons/w_irifle.mdl", "weapon_ar2", 12000, 10, true, 1200, false, {TEAM_ARMS})
 
-- Pistol
AddCustomShipment("Python", "models/weapons/w_colt_python.mdl", "m9k_coltpython", 2500, 10, true, 250, false, {TEAM_ARMS})
AddCustomShipment("Colt 1911", "models/weapons/s_dmgf_co1911.mdl", "m9k_colt1911", 1200, 10, true, 120, false, {TEAM_ARMS})
AddCustomShipment("HK 45C", "models/weapons/w_hk45c.mdl", "m9k_hk45", 1500, 10, true, 150, false, {TEAM_ARMS})
AddCustomShipment("Luger", "models/weapons/w_luger_p08.mdl", "m9k_luger", 1200, 10, true, 120, false, {TEAM_ARMS})
AddCustomShipment("Raging Bull", "models/weapons/w_hk45c.mdl", "m9k_ragingbull", 3000, 10, true, 300, false, {TEAM_ARMS})
AddCustomShipment("S&W 500", "models/weapons/w_sw_model_500.mdl", "m9k_model500", 2750, 10, true, 275, false, {TEAM_ARMS})
AddCustomShipment("M29 Satan", "models/weapons/w_m29_satan.mdl", "m9k_m29satan", 3000, 10, true, 3000, false, {TEAM_ARMS})
AddCustomShipment("Beretta", "models/weapons/w_beretta_m92.mdl", "m9k_m92beretta", 1400, 10, true, 140, false, {TEAM_ARMS})
AddCustomShipment("S&W Model 3 Russian", "models/weapons/w_model_3_rus.mdl", "m9k_model3russian", 3000, 10, true, 300, false, {TEAM_ARMS})
 
-- Shotguns
AddCustomShipment("1887 Winchester", "models/weapons/w_winchester_1887.mdl", "m9k_1887winchester", 4000, 10, true, 400, false, {TEAM_ARMS})
AddCustomShipment("Benelli M3", "models/weapons/w_benelli_m3.mdl", "m9k_m3", 4500, 10, true, 450, false, {TEAM_ARMS})
AddCustomShipment("Ithaca M37", "models/weapons/w_ithaca_m37.mdl", "m9k_ithacam37", 3000, 10, true, 300, false, {TEAM_ARMS})
AddCustomShipment("Mossberg", "models/weapons/w_mossberg_590.mdl", "m9k_mossberg590", 3000, 10, true, 300, false, {TEAM_ARMS})
AddCustomShipment("Remington 870", "models/weapons/w_remington_870_tact.mdl", "m9k_remington870", 2500, 10, true, 250, false, {TEAM_ARMS})
AddCustomShipment("1897 Winchester", "models/weapons/w_winchester_1897_trench.mdl", "m9k_1897winchester", 4000, 10, true, 400, false, {TEAM_ARMS})
 
-- Sniper Rifle
AddCustomShipment("Barret M82", "models/weapons/w_barret_m82.mdl", "m9k_barret_m82", 10000, 10, true, 1000, false, {TEAM_ARMS})
AddCustomShipment("Barret M98B", "models/weapons/w_barrett_m98b.mdl", "m9k_m98b", 11000, 10, true, 1100, false, {TEAM_ARMS})
AddCustomShipment("SVT 40", "models/weapons/w_svt_40.mdl", "m9k_svt40", 5000, 10, true, 500, false, {TEAM_ARMS})
AddCustomShipment("SVD Dragunov", "models/weapons/w_svd_dragunov.mdl", "m9k_dragunov", 8500, 10, true, 850, false, {TEAM_ARMS})
AddCustomShipment("PSG-1", "models/weapons/w_hk_psg1.mdl", "m9k_psg1", 7000, 10, true, 700, false, {TEAM_ARMS})
AddCustomShipment("AW 50", "models/weapons/w_acc_int_aw50.mdl", "m9k_aw50", 10000, 10, true, 1000, false, {TEAM_ARMS})
AddCustomShipment("M24", "models/weapons/w_snip_m24_6.mdl", "m9k_m24", 7000, 10, true, 700, false, {TEAM_ARMS})
AddCustomShipment("Remington 7615P", "models/weapons/w_remington_7615p.mdl", "m9k_remington7615p", 8000, 10, true, 800, false, {TEAM_ARMS})
AddCustomShipment("Thompson Condender", "models/weapons/w_g2_contender.mdl", "m9k_contender", 5000, 10, true, 500, false, {TEAM_ARMS})
 
 
-- Machine Guns
AddCustomShipment("M60", "models/weapons/w_m60_machine_gun.mdl", "m9k_m60", 10000, 10, false, 1000, false, {TEAM_ARMS})
AddCustomShipment("M249", "models/weapons/w_mach_m249para.mdl", "m9k_m249lmg", 16000, 10, false, 1600, false, {TEAM_ARMS})
 
-- Sub Machine Guns
AddCustomShipment("MP5 - Silenced", "models/weapons/w_hk_mp5.mdl", "m9k_mp5sd", 5000, 10, false, 500, false, {TEAM_ARMS})
AddCustomShipment("MP9", "models/weapons/w_brugger_thomet_mp9.mdl", "m9k_mp9", 4250, 10, false, 425, false, {TEAM_ARMS})
AddCustomShipment("Honey Badger", "models/weapons/w_aac_honeybadger.mdl", "m9k_honeybadger", 4000, 10, false, 400, false, {TEAM_ARMS})
AddCustomShipment("UZI", "models/weapons/w_uzi_imi.mdl", "m9k_uzi", 2500, 10, false, 250, false, {TEAM_ARMS})
AddCustomShipment("HK USC", "models/weapons/w_hk_usc.mdl", "m9k_usc", 3500, 10, false, 350, false, {TEAM_ARMS})
AddCustomShipment("STEN", "models/weapons/w_sten.mdl", "m9k_sten", 4000, 10, false, 400, false, {TEAM_ARMS})