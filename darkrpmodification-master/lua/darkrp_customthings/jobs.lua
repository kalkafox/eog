/*---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------

This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomJobFields


Add jobs under the following line:
---------------------------------------------------------------------------*/

TEAM_CITIZEN = DarkRP.createJob("Citizen", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group01/Female_01.mdl",
		"models/player/Group01/Female_02.mdl",
		"models/player/Group01/Female_03.mdl",
		"models/player/Group01/Female_04.mdl",
		"models/player/Group01/Female_06.mdl",
		"models/player/group01/male_01.mdl",
		"models/player/Group01/Male_02.mdl",
		"models/player/Group01/male_03.mdl",
		"models/player/Group01/Male_04.mdl",
		"models/player/Group01/Male_05.mdl",
		"models/player/Group01/Male_06.mdl",
		"models/player/Group01/Male_07.mdl",
		"models/player/Group01/Male_08.mdl",
		"models/player/Group01/Male_09.mdl"
	},
	description = [[The Citizen is the most basic level of society you can hold besides being a hobo. You have no specific role in city life.]],
	weapons = {"weapon_fists"},
	command = "citizen",
	max = 0,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false
})


TEAM_WHORE = AddExtraTeam("Prostitute", Color(208, 158, 163, 255), "models/characters/elexis/elexis.mdl", [[You're a prostitute. You do things for people. Basically a whore. Be careful with the police.]], {"weapon_fists"}, "whore", 3, 40, 0, false, false, false)

TEAM_DJ = AddExtraTeam("DJ", Color(255, 239, 49, 255), "models/player/slow/robocop/slow.mdl", [[You're a DJ. Mix dat music up. Still in construction. Make the police dance.]], {"weapon_fists"}, "dj", 2, 60, 0, false, false, false)

TEAM_GUARD = AddExtraTeam("Guard", Color(60, 255, 255, 255), {
"models/player/guard_pack/guard_01.mdl",
"models/player/guard_pack/guard_02.mdl",
"models/player/guard_pack/guard_03.mdl",
"models/player/guard_pack/guard_04.mdl",
"models/player/guard_pack/guard_05.mdl",
"models/player/guard_pack/guard_06.mdl",
"models/player/guard_pack/guard_07.mdl",
"models/player/guard_pack/guard_08.mdl",
"models/player/guard_pack/guard_09.mdl"
}, [[You are hired to protect people. Do your job right.]], {"weapon_fists", "m9k_colt1911"}, "guard", 3, 60, 0, false, false, false)

TEAM_HITMAN = AddExtraTeam("Hitman", {
        color = Color(191, 95, 98, 255),
        model = "models/agent_47/agent_47.mdl",
        description = [[You're a hitman.
You are hired to perform assassin work in exchange for some money. You must advert a hit acception, a hit completion.
If you are killed during this class, you will be demoted back to citizen.]],
        weapons = {"weapon_fists", "m9k_intervention"},
        command = "hitman",
        max = 2,
        salary = 35,
        admin = 0,
        vote = false,
        hasLicense = false,
                        PlayerDeath = function(ply)
                if ply:Team() == TEAM_HITMAN then
                        ply:changeTeam( TEAM_CITIZEN, true )
                        for k,v in pairs( player.GetAll() ) do
                                DarkRP.notify(v, 1, 4, "The Hitman has been killed!")
                        end
                end
        end
})


--TEAM_TEST = AddExtraTeam("Test", Color(208, 158, 163, 255), "models/player/breen.mdl", [[You are Yuno Gasai, You are a psycho bitch. Fuck outta here.]], {"weapon_fists"}, "aspen", 4, 40, 0, false, false, false)

TEAM_POLICE = DarkRP.createJob("Civil Protection", {
	color = Color(25, 25, 170, 255),
	model = {"models/dpfilms/metropolice/playermodels/pm_hl2beta_police.mdl",
                 "models/dpfilms/metropolice/playermodels/pm_urban_police.mdl"
                },
	description = [[The protector of every citizen that lives in the city.
		You have the power to arrest criminals and protect innocents.
		Hit a player with your arrest baton to put them in jail.
		Bash a player with a stunstick and they may learn to obey the law.
		The Battering Ram can break down the door of a criminal, with a warrant for their arrest.
		The Battering Ram can also unfreeze frozen props (if enabled).
		Type /wanted <name> to alert the public to the presence of a criminal.]],
	weapons = {"arrest_stick", "unarrest_stick", "m9k_hk45", "m9k_tec9", "stunstick", "door_ram", "weaponchecker", "weapon_fists"},
	command = "cp",
	max = 6,
	salary = GAMEMODE.Config.normalsalary * 1.45,
	admin = 0,
	vote = true,
	hasLicense = true,
	ammo = {
		["pistol"] = 60,
	}
})

TEAM_PRESIDENT = DarkRP.createJob("President", {
	color = Color(150, 20, 20, 255),
	model ={
        "models/player/suits/male_01_closed_tie.mdl",
        "models/player/suits/male_02_closed_tie.mdl",
        "models/player/suits/male_03_closed_tie.mdl",
        "models/player/suits/male_04_closed_tie.mdl",
        "models/player/suits/male_05_closed_tie.mdl",
        "models/player/suits/male_06_closed_tie.mdl",
        "models/player/suits/male_07_closed_tie.mdl",
        "models/player/suits/male_08_closed_tie.mdl",
        "models/player/suits/male_09_closed_tie.mdl",
        },
	description = [[The Mayor of the city creates laws to govern the city.
	If you are the mayor you may create and accept warrants.
	Type /wanted <name>  to warrant a player.
	Type /jailpos to set the Jail Position.
	Type /lockdown initiate a lockdown of the city.
	Everyone must be inside during a lockdown.
	The cops patrol the area.
	/unlockdown to end a lockdown]],
	weapons = {"weapon_fists", "m9k_usp"},
	command = "president",
	max = 1,
	salary = GAMEMODE.Config.normalsalary * 1.89,
	admin = 0,
	vote = true,
	hasLicense = false,
	mayor = true,
                PlayerDeath = function(ply)
                if ply:Team() == TEAM_PRESIDENT then
                        ply:changeTeam( TEAM_CITIZEN, true )
                        for k,v in pairs( player.GetAll() ) do
                                DarkRP.notify(v, 1, 4, "The President has been killed!")
                        end
                end
        end
})


TEAM_VICE = DarkRP.createJob("Vice President", {
	color = Color(194, 7, 7, 255),
	model ={
        "models/player/suits/male_01_closed_coat_tie.mdl",
        "models/player/suits/male_02_closed_coat_tie.mdl",
        "models/player/suits/male_03_closed_coat_tie.mdl",
        "models/player/suits/male_04_closed_coat_tie.mdl",
        "models/player/suits/male_05_closed_coat_tie.mdl",
        "models/player/suits/male_06_closed_coat_tie.mdl",
        "models/player/suits/male_07_closed_coat_tie.mdl",
        "models/player/suits/male_08_closed_coat_tie.mdl",
        "models/player/suits/male_09_closed_coat_tie.mdl",
        },
	description = [[The Vice President governs the city with the President.
        The Vice President suggests ideas whilst the President enforces it.
	If you are the mayor you may create and accept warrants.
	Type /wanted <name>  to warrant a player.
	Type /jailpos to set the Jail Position.
	Type /lockdown initiate a lockdown of the city.
	Everyone must be inside during a lockdown.
	The cops patrol the area.
	/unlockdown to end a lockdown]],
	weapons = {"weapon_fists"},
	command = "vice",
	max = 1,
	salary = GAMEMODE.Config.normalsalary * 1.89,
	admin = 0,
	vote = true,
	hasLicense = false,
	mayor = true,
                PlayerDeath = function(ply)
                if ply:Team() == TEAM_PRESIDENT then
                        ply:changeTeam( TEAM_CITIZEN, true )
                        for k,v in pairs( player.GetAll() ) do
                                DarkRP.notify(v, 1, 4, "The Vice President has been killed!")
                        end
                end
        end
})


TEAM_BLOOD = DarkRP.createJob("Blood Gangster", {
	color = Color(75, 75, 75, 255),
	model = {
		"models/player/fc3pirate_1.mdl",
		"models/player/fc3pirate_2.mdl",
		"models/player/fc3pirate_3.mdl",
		"models/player/fc3pirate_4.mdl",
		"models/player/fc3pirate_5.mdl",
		"models/player/fc3pirate_6.mdl",
		"models/player/fc3pirate_7.mdl",
		"models/player/fc3pirate_8.mdl"
                },
	description = [[The lowest person of crime.
		A Blood Gangster generally works for its leader who runs the crime family.
		The leader sets your agenda and you follow it or you might be punished.]],
	weapons = {"weapon_fists"},
	command = "blood",
	max = 6,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_CRIP = DarkRP.createJob("Crip Gangster", {
	color = Color(102, 102, 102, 255),
	model = {
		"models/player/fc3pirate_1.mdl",
		"models/player/fc3pirate_2.mdl",
		"models/player/fc3pirate_3.mdl",
		"models/player/fc3pirate_4.mdl",
		"models/player/fc3pirate_5.mdl",
		"models/player/fc3pirate_6.mdl",
		"models/player/fc3pirate_7.mdl",
		"models/player/fc3pirate_8.mdl"
                },
	description = [[The lowest person of crime.
		A Crip Gangster generally works for its leader who runs the crime family.
		The leader sets your agenda and you follow it or you might be punished.]],
	weapons = {"weapon_fists"},
	command = "crip",
	max = 6,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false
})




TEAM_CRIPLEADER = DarkRP.createJob("Crip Gang Leader", {
	color = Color(58, 58, 58, 255),
	model = {"models/player/fc3pirate_9.mdl"},
	description = [[The Crip Gang Leader is the leader of the Crip Gang.
Your job is to coordinate with your gang members.
You are at war with the Blood Gang.]],
	weapons = {"lockpick", "unarrest_stick", "weapon_fists"},
	command = "cripleader",
	max = 1,
	salary = GAMEMODE.Config.normalsalary * 1.34,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_BLOODLEADER = DarkRP.createJob("Blood Gang Leader", {
	color = Color(48, 48, 48, 255),
	model = {"models/player/fc3pirate_9.mdl"},
	description = [[The Blood Gang Leader is the leader of the Blood Gang.
Your job is to coordinate with your gang members.
You are at war with the Crip Gang.]],
	weapons = {"lockpick", "unarrest_stick", "weapon_fists"},
	command = "bloodleader",
	max = 1,
	salary = GAMEMODE.Config.normalsalary * 1.34,
	admin = 0,
	vote = false,
	hasLicense = false
})


TEAM_DWELLM = DarkRP.createJob("Dwell Master", {
	color = Color(180, 180, 180, 255),
	model = {
		"models/player/lordvipes/slenderman/slenderman_playermodel_cvp.mdl"
                },
	description = [[You're the dwell master, and you lead the dwellers.
                        Your turf is generally the sewers.]],
	weapons = {"weapon_fists"},
	command = "dwellm",
	max = 1,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_DWELL = DarkRP.createJob("Dweller", { 
	color = Color(140, 140, 140, 255),
	model = {
		"models/player/corvo.mdl"
                },
	description = [[You're the dwellers. You dwell within the community. Or something.
                        Your turf is generally the sewers.]],
	weapons = {"weapon_fists"},
	command = "dwell",
	max = 6,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_BLACK = AddExtraTeam("Black Market Dealer", {
        color = Color(153, 153, 0, 255),
        model = "models/player/slow/amberlyn/re5/sheva/slow.mdl",
        description = [[You sell
                illegal items to the public]],
        weapons = {"weapon_fists"},
        command = "blackmarket",
        max = 2,
        salary = 45,
        admin = 0,
        vote = false,
        hasLicense = false
})

TEAM_BOX = AddExtraTeam("Box Manager", {
        color = Color(112, 117, 255, 255),
        model = "models/player/odessa.mdl",
        description = [[You box.
Just kidding.
You manage boxes and manage bets.]],
        weapons = {"weapon_fists", "stunstick"},
        command = "box",
        max = 1,
        salary = 45,
        admin = 0,
        vote = false,
        hasLicense = false
})






TEAM_ARMS = DarkRP.createJob("Arms Dealer", {
	color = Color(255, 140, 0, 255),
	model = "models/player/stalker/duty_vet.mdl",
	description = [[An Arms Dealer is the only person who can sell guns to other people.
Make sure you aren't caught selling illegal firearms to the public! You might get arrested!]],
	weapons = {"weapon_fists"},
	command = "armsdealer",
	max = 4,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_MEDIC = DarkRP.createJob("Medic", {
	color = Color(47, 79, 79, 255),
	model = "models/player/kleiner.mdl",
	description = [[With your medical knowledge you work to restore players to full health.
		Without a medic, people cannot be healed.
		Left click with the Medical Kit to heal other players.
		Right click with the Medical Kit to heal yourself.]],
	weapons = {"med_kit", "weapon_fists"},
	command = "medic",
	max = 3,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false,
	medic = true
})

TEAM_CHIEF = DarkRP.createJob("Civil Protection Chief", {
	color = Color(0, 5, 149, 255),
	model = "models/dpfilms/metropolice/playermodels/pm_rtb_police.mdl",
	description = [[The Chief is the leader of the Civil Protection unit.
		Coordinate the police force to enforce law in the city.
		Hit a player with arrest baton to put them in jail.
		Bash a player with a stunstick and they may learn to obey the law.
		The Battering Ram can break down the door of a criminal, with a warrant for his/her arrest.
		Type /wanted <name> to alert the public to the presence of a criminal.
		Type /jailpos to set the Jail Position]],
	weapons = {"arrest_stick", "unarrest_stick", "m9k_p90", "m9k_hk45", "stunstick", "door_ram", "weaponchecker", "weapon_fists"},
	command = "chief",
	max = 1,
	salary = GAMEMODE.Config.normalsalary * 1.67,
	admin = 0,
	vote = true,
	hasLicense = true,
	chief = true,
	NeedToChangeFrom = TEAM_POLICE,
	ammo = {
		["rifle"] = 60,
	}
})

TEAM_SWAT = DarkRP.createJob("S.W.A.T Officer", {
	color = Color(0, 8, 233, 255),
	model = "models/nikout/fallout/wintercombatarmormalepm.mdl",
	description = [[The S.W.A.T are the tactical support of the Civil Protection. They are called when a large firefight breaks out.
Your job is to neutralize the offending individuals and listen to your militant commander's orders.]],
	weapons = {"arrest_stick", "unarrest_stick", "m9k_m4a1", "stunstick", "door_ram", "weaponchecker", "weapon_fists"},
	command = "swat",
	max = 6,
	salary = GAMEMODE.Config.normalsalary * 1.67,
	admin = 0,
	vote = true,
	hasLicense = true,
	ammo = {
		["rifle"] = 60,
	}
})

TEAM_SWATC = DarkRP.createJob("S.W.A.T Commander", {
	color = Color(0, 7, 201, 255),
	model = "models/nikout/fallout/wintercombatarmorfemalepm.mdl",
	description = [[The S.W.A.T are the tactical support of the Civil Protection. They are called when a large firefight breaks out.
Your job is to command the S.W.A.T militant and carry out the operation successfully.]],
	weapons = {"arrest_stick", "unarrest_stick", "m9k_scar", "stunstick", "door_ram", "weaponchecker", "weapon_fists"},
	command = "swatc",
	max = 1,
	salary = GAMEMODE.Config.normalsalary * 1.67,
	admin = 0,
	vote = true,
	hasLicense = true,
	ammo = {
		["rifle"] = 60,
	}
})

TEAM_THIEF = DarkRP.createJob("Thief", {
	color = Color(246, 133, 255, 255),
	model = "models/player/rebels/rebel_arctic.mdl",
	description = [[A thief is your general break in know-it-all.
You steal people and mug people. You may try to scam people for their money or something.
You can raid alone.]],
	weapons = {"weapon_fists", "lockpick"},
	command = "thief",
	max = 1,
	salary = GAMEMODE.Config.normalsalary * 1.67,
	admin = 0,
	vote = false,
	hasLicense = true,
})


TEAM_HOBO = DarkRP.createJob("Hobo", {
	color = Color(80, 45, 0, 255),
	model = "models/player/corpse1.mdl",
	description = [[The lowest member of society. Everybody laughs at you.
		You have no home.
		Beg for your food and money
		Sing for everyone who passes to get money
		Make your own wooden home somewhere in a corner or outside someone else's door]],
	weapons = {"weapon_bugbait", "weapon_fists"},
	command = "hobo",
	max = 0,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	hobo = true
})

/*---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------*/
GAMEMODE.DefaultTeam = TEAM_CITIZEN


/*---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------*/
GAMEMODE.CivilProtection = {
	[TEAM_POLICE] = true,
	[TEAM_CHIEF] = true,
	[TEAM_PRESIDENT] = true,
        [TEAM_VICE] = true,
}

/*---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------*/
DarkRP.addHitmanTeam(TEAM_HITMAN)


