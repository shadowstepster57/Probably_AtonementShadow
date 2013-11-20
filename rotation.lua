-- Discipline with Atonement weaving by Shadowstepster

ProbablyEngine.library.register('coreHealing', {
  needsHealing = function(percent, count)
    return ProbablyEngine.raid.needsHealing(tonumber(percent)) >= count
  end,
  needsDispelled = function(spell)
    for unit,_ in pairs(ProbablyEngine.raid.roster) do
      if UnitDebuff(unit, spell) then
        ProbablyEngine.dsl.parsedTarget = unit
        return true
      end
    end
  end,
})

ProbablyEngine.rotation.register_custom(256, "Atonement[Shadow]", {
	
	--Inner Fire
	{ "588", "!player.buff(588)" },
	--Mana Regen
	{ "34433", {
		"player.mana < 70",
		"modifier.cooldowns"
	}},
	{ "123040", {
		"player.mana < 70",
		"modifier.cooldowns"
	}},
	{ "28730", {
		"player.mana < 90",
		"modifier.cooldowns"
        }},
        { "64901", "modifier.alt" },
	--Cascade and Halo
        { "121135", "@coreHealing.needsHealing(80, 6)", "lowest" },
        { "120517", "@coreHealing.needsHealing(60, 10)", "lowest" },
        --Atonement doesnt heal me worth a shit, shield myself from damage
        { "17", "!player.debuff(6788)" },
        
	--PW:S
	{ "17", {
		"lowest.health < 50",
		"!lowest.debuff(6788)"
	}, "lowest" },
	--Prayer of Mending
	{ "33076", "!tank.buff(41635)", "tank" },
	--More PW:S
	{ "17", "!tank.debuff(6788)" },
	{ "17", "!focus.debuff(6788)", "focus" },
	--Penance Atonement
	{ "47540", "lowest.health < 100" },
	--Holy Fire / Solace
	{ "14914", "lowest.health < 100" },
	{ "129250", "lowest.health < 100" },
	--Smite
	{ "585", "lowest.health < 100" },

})