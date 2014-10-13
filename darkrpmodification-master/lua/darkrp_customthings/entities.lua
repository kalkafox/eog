/*---------------------------------------------------------------------------
DarkRP custom entities
---------------------------------------------------------------------------

This file contains your custom entities.
This file should also contain entities from DarkRP that you edited.

Note: If you want to edit a default DarkRP entity, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the entity to this file and edit it.

The default entities can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua#L111

Add entities under the following line:
---------------------------------------------------------------------------*/
DarkRP.createEntity("Topaz Printer", {
        ent = "topaz_money_printer",
        model = "models/props_c17/consolebox05a.mdl",
        price = 1000,
        max = 2,
        cmd = "buytopazprinter"
})
 
DarkRP.createEntity("Amethyst Printer", {
        ent = "amethyst_money_printer",
        model = "models/props_c17/consolebox05a.mdl",
        price = 1500,
        max = 2,
        cmd = "buyamethystprinter"
})
 
DarkRP.createEntity("Emerald Printer", {
        ent = "emerald_money_printer",
        model = "models/props_c17/consolebox05a.mdl",
        price = 2500,
        max = 2,
        cmd = "buyemeraldprinter"
})
 
DarkRP.createEntity("Ruby Printer", {
        ent = "ruby_money_printer",
        model = "models/props_c17/consolebox05a.mdl",
        price = 5000,
        max = 2,
        cmd = "buyrubyprinter"
})
 
DarkRP.createEntity("Sapphire Printer", {
        ent = "sapphire_money_printer",
        model = "models/props_c17/consolebox05a.mdl",
        price = 7500,
        max = 2,
        cmd = "buysapphireprinter"
})