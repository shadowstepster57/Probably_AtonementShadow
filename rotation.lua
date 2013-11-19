-- ProbablyEngine Rotation Packager
-- Custom Discipline Priest Rotation
-- Created on Nov 19th 2013 5:16 am
ProbablyEngine.rotation.register_custom(256, "Atonement[Shadow]", {

	--mana
	{ "Shadowfiend", {
		"player.mana < 70",
		"modifier.cooldowns"
	}},
	{ "Arcane Torrent", {
		"player.mana < 90",
		"modifier.cooldowns"
        }},
        { "Hymn of Hope", "modifier.shift" },
        
        --Atonement doesnt heal me worth a shit, shield myself from damage
        { "Power Word: Shield", "!player.buff(power word: shield)" },
        
	--rotation
	{ "Flash Heal", "lowest.health < 50" },
	{ "Prayer of Mending", "tank.health < 100", "tank" },
	{ "Power Word: Shield", "!tank.buff(power word: Shield)", "tank"},
	{ "Holy Fire"},
	{ "Penance"},
	{ "Smite"},

})