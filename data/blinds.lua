---@diagnostic disable: undefined-global

-- SMODS.Blind {
-- key = 'final_xxl',
-- name = 'final_xxl',
-- atlas = 'fucker',
-- pos = { x = 0, y = 0 },
-- mult = 15,
-- dollars = 25,
-- boss = {
-- min = 11,
-- },
-- loc_txt = {
-- name = 'Purple Glass',
-- text = {
-- 'Significantly Larger Blind'
-- }
-- },
-- boss_colour = HEX('4f4f4f'),
-- disable = function(self)
-- G.GAME.blind.chips = G.GAME.blind.chips * 10
-- G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
-- end
-- }

if G.GAME then
end

SMODS.Blind {
	key = 'rng',
	name = 'rng',
	atlas = 'junkyardblinds',
	pos = { x = 0, y = 5 },
	mult = math.random(0.5, 4),
	dollars = math.random(5, 8),
	boss = { min = 1 },
	boss_colour = HEX('54758a'),

	set_blind = function()
		G.GAME.round_resets.lost = false
	end,

	calculate = function(self, card, context)
	end
}

SMODS.Blind {
	key = 'unstable',
	name = 'unstable',
	-- atlas = 'unstable',
	pos = { x = 0, y = 0 },
	mult = 0,
	dollars = 0,
	boss = { min = 16 },
	boss_colour = HEX('101010'),
	debuff = {
		akyrs_cannot_be_skipped = true,
		akyrs_cannot_be_disabled = true,
		akyrs_cannot_be_rerolled = true,
		akyrs_cannot_be_overridden = true
	},

	calculate = function(self, card, context)
		if context.modify_hand then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.original_mod == SMODS.Mods["isoatro"] then
					if SMODS.pseudorandom_probability(card, "fizz_unstable", 1, 100) then
						G.burger = 1
						play_sound("fizz_jumpscare", 1, 1)
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 3 * G.SETTINGS.GAMESPEED,
							func = function()
								G.burger = 0
								burger()
								return true
							end
						}))
						return true
					end
					--"Add a cheeseburger" -Grazy
					--TODO: add a 1 in 100 chance for a cheeseburger jumpscare
				end
			end
		end
	end,

	set_blind = function(self)
		local randomized = pseudorandom("ubc", 1, 4)
		local unstable_blind_choice = nil
		if randomized == 1 then
			unstable_blind_choice = "bl_fizz_THESCALE"
		elseif randomized == 2 then
			unstable_blind_choice = "bl_fizz_BLACKKNIFE"
		elseif randomized == 3 then
			unstable_blind_choice = "bl_fizz_UNSHY"
		elseif randomized == 4 then
			unstable_blind_choice = "bl_fizz_THEDROPLET"
		end
		G.GAME.blind:set_blind(G.P_BLINDS[tostring(unstable_blind_choice)])
	end,

	disable = function(self)
	end

}

SMODS.Blind {
	key = 'diansu',
	name = 'diansu',
	atlas = 'junkyardblinds',
	pos = { x = 0, y = 7 },
	mult = 0.1,
	dollars = 1,
	boss = { min = 1 },
	loc_txt = {
		name = 'Diansu Vulkarch',
		text = {
			'Run, that\'s all you {C:red,s:1.2}CAN{} do!',
			'{E:1,s:0.7,C:inactive}*clair de lune*{}'
		}
	},
	boss_colour = HEX('078500'),

	set_blind = function()
		G.GAME.round_resets.lost = false
	end,

	defeat = function(self)
		G.FUNCS.overlay_menu {
			definition = fizz_custom_video("diansumeme", "oceanan scum"),
			config = { no_esc = true }
		}
	end
}

SMODS.Sound {
	key = "music_heavyfootsteps",
	path = "music_heavyfootsteps.ogg",
	pitch = 1,
	volume = 1,
	select_music_track = function()
		if G.GAME.blind and G.GAME.blind.name == 'cringeasf' and not G.GAME.reclusive_vessel == true then
			return true
		elseif G.GAME.blind and G.GAME.blind.name == 'unstable' and G.GAME.omegarush == nil then
			return true
		elseif G.GAME.blind and G.GAME.blind.name == 'unstable' and G.GAME.omegarush < 1 then
			return true
		end
	end
}

SMODS.Sound {
	key = "music_in_the_final",
	path = "inthefinal.ogg",
	pitch = 1,
	volume = 1,
	select_music_track = function()
		if G.GAME.omegarush == nil then
			return false
		elseif G.GAME.omegarush >= 1 and not G.GAME.reclusive_vessel == true and not copyright_free == true then
			return true, 1e101
		end
	end
}

SMODS.Sound {
	key = "music_burningeyes",
	path = "music_burningeyes.ogg",
	pitch = 1,
	volume = 1,
	select_music_track = function()
		if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.name == 'lankyohfuckinghellbox' then
			return true
		end
	end
}

SMODS.Sound {
	key = "music_berdlysnowgrave",
	path = "berdly.ogg",
	pitch = 1,
	volume = 1,
	select_music_track = function()
		if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.name == 'recluseblind' and not G.GAME.reclusive_vessel == true then
			if G.GAME.omegarush == nil then
				return true
			elseif G.GAME.omegarush < 1 then
				return true
			end
		end
		if G.GAME.round_resets.blind_choices == 'bl_fizz_bossrushomega' and not G.GAME.reclusive_vessel == true then
			G.GAME.omegarush_choice = true
			return true
		end
	end
}

SMODS.Sound {
	key = 'ominous',
	path = 'ominous.ogg',
	pitch = 0.7,
	volume = 1.2
}

SMODS.Blind {
	key = 'oxid', --NOT THAT
	mult = 2,
	dollars = 5,
	boss = { min = 1 },
	atlas = 'junkyardblinds',
	pos = { x = 0, y = 2 },
	boss_colour = HEX('fc6203'),
	setting_blind = function()
		G.GAME.round_resets.lost = false
	end,
	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.debuff_card and context.debuff_card.area == G.jokers then
				for k, v in ipairs(G.jokers.cards) do
					if v.config.center.pools and v.config.center.pools.copycats then
						v:set_debuff(true)
					end
				end
			end
		end
	end
}

local reclcheck = false

SMODS.Blind {
	key = 'spk',
	atlas = 'junkyardblinds',
	pos = { x = 0, y = 0 },
	mult = 1,
	dollars = 3,
	boss = { min = 4 },
	boss_colour = HEX('e2e2d6'),
	ignore_showdown_check = true,

	set_blind = function()
		G.GAME.round_resets.lost = false
	end,

	calculate = function(self, card, context)
		if context.modify_hand then
			return {
				chips = 1
			}
		end
	end,

	in_pool = function(self)
		return reclcheck
	end,

	defeat = function(self)
		reclcheck = true
		play_sound('fizz_ominous', 0.8, 1)
	end
}

SMODS.Blind {
	key = 'recl',
	atlas = 'junkyardblinds',
	pos = { x = 0, y = 4 },
	mult = 66,
	dollars = 13,
	boss = { min = 1 },
	boss_colour = HEX('000000'),
	debuff = {},
	ignore_showdown_check = true,

	in_pool = function(self)
		return reclcheck
	end,

	set_blind = function(self)
		G.GAME.fizz_sol_ptsd = true
	end,

	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.debuff_card and context.debuff_card.area == G.jokers then
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i].config.center.pools and G.jokers.cards[i].config.center.pools.copycats then
						G.jokers.cards[i]:set_debuff(true)
					end
				end
			end
			if context.modify_hand then
				play_sound('tarot2')
				SMODS.juice_up_blind()
				blind:wiggle()
				blind.triggered = true
				G.GAME.blind.chips = math.floor((G.GAME.blind.chips + (G.GAME.blind.chips / 3)) * 1.5)
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			end
		end
	end,

	defeat = function(self)
		reclcheck = false
		G.GAME.fizz_sol_ptsd = false
		play_sound('fizz_ominouscancel', 1, 2)
		recluseach()
	end
}

SMODS.Blind {
	key = 'sph',
	atlas = 'junkyardblinds',
	pos = { x = 0, y = 1 },
	mult = 1.25,
	dollars = 6,
	boss_colour = HEX('ffffff'),
	boss = { min = 2 },

	set_blind = function()
		G.GAME.round_resets.lost = false
	end,

	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.modify_hand then
				play_sound('timpani')
				blind.triggered = true
				SMODS.juice_up_blind()
				blind:wiggle()
				G.GAME.blind.chips = math.floor(G.GAME.blind.chips + G.GAME.blind.chips / 3)
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			end
		end
	end
}

SMODS.Blind {
	key = 'sol',
	atlas = 'junkyardblinds',
	pos = { x = 0, y = 3 },
	mult = 1,
	dollars = 8,
	boss_colour = HEX('5fcde4'),
	boss = { min = 3 },

	set_blind = function()
		G.GAME.round_resets.lost = false
	end,

	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.modify_hand then
				blind.triggered = true
				play_sound('timpani')
				SMODS.juice_up_blind()
				blind:wiggle()
				G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 1.25)
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			end
		end
	end
}

SMODS.Blind { --Seraph_Omega
	key = 'sph_ex',
	dollars = 10,
	mult = 5,
	boss = { min = 16 },
	debuff = {
		omega_blind = true
	},
	boss_colour = HEX('000000'),
	-- atlas = 'BLACKKNIFE',
	pos = { x = 0, y = 0 },
	ignore_showdown_check = true,

	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.modify_hand then
				play_sound('timpani')
				blind.triggered = true
				SMODS.juice_up_blind()
				blind:wiggle()
				G.GAME.blind.chips = to_big((G.GAME.blind.chips * (math.log(G.GAME.blind.chips ^ 3) ^ 2)) * 3)
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			end
		end
	end
}

SMODS.Blind { --Solinium_Omega
	key = 'sol_ex',
	dollars = 10,
	mult = 8,
	boss = { min = 16 },
	debuff = {
		omega_blind = true
	},
	boss_colour = HEX('000000'),
	-- atlas = 'UNFAIRSCALE',
	pos = { x = 0, y = 0 },
	ignore_showdown_check = true,

	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.modify_hand then
				play_sound('timpani')
				SMODS.juice_up_blind()
				blind:wiggle()
				blind.triggered = true
				G.GAME.blind.chips = to_big(G.GAME.blind.chips ^ 1.25)
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			end
		end
	end
}

SMODS.Blind { --Oxy_Omega
	key = 'oxid_ex',
	dollars = 10,
	mult = 0.05,
	boss = { min = 16 },
	debuff = {
		omega_blind = true
	},
	boss_colour = HEX('000000'),
	-- atlas = 'THEDROPLET',
	pos = { x = 0, y = 0 },
	ignore_showdown_check = true,

	calculate = function(self, blind, context)
		if context.debuff_card and context.debuff_card.area == G.jokers then
			return {
				debuff = true
			}
		end
		if context.modify_hand then
			play_sound('timpani')
			SMODS.juice_up_blind()
			blind:wiggle()
			blind.triggered = true
			G.GAME.blind.chips = to_big((math.log(G.GAME.blind.chips) * G.GAME.blind.chips) / (G.GAME.blind.chips ^ 0.5))
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		end
	end
}

SMODS.Blind { --Sparky_Omega
	key = 'spk_ex',
	dollars = 10,
	mult = 100,
	boss = { min = 16 },
	debuff = {
		omega_blind = true
	},
	boss_colour = HEX('000000'),
	-- atlas = 'UNSHY',
	pos = { x = 0, y = 0 },
	ignore_showdown_check = true,

	calculate = function(self, blind, context)
		if context.final_scoring_step then
			play_sound('timpani')
			SMODS.juice_up_blind()
			blind:wiggle()
			mult = mod_mult(math.floor(mult ^ 0.7))
			hand_chips = mod_chips(math.floor(hand_chips ^ 0.7))
		end
	end
}

SMODS.Blind {
	key = "oxid_bunny",
	mult = 2.5,
	money = 5,
	boss_colour = HEX("ff822f"),
	boss = { min = 2 },
	atlas = "crossmod_blinds",
	pos = { x = 0, y = 0 },
	in_pool = function()
		return ISO_bnuuy
	end,
	no_collection = ISO_bnuuy,

	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.debuff_card and context.debuff_card.area == G.jokers then
				for k, v in ipairs(G.jokers.cards) do
					if v.config.center and v.config.center.bunny then
						v:set_debuff(true)
					end
				end
			end
		end
	end
}

local function MYHAIRCOUPONS()
	attention_text({
		scale = 1,
		text = "MY HAIR COUPOOOOOONS!!!",
		hold = 3 * G.SETTINGS.GAMESPEED,
		align = 'cm',
		offset = { x = 0, y = -2.7 },
		major = G.play,
		colour = HEX('ff0000')
	})
end

SMODS.Blind { -- MY HAIR COUPOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOONS!!!
	key = "ricardo",
	mult = 8,
	money = 10,
	boss_colour = HEX("c52a7c"),
	boss = { min = 2 },
	atlas = "crossmod_blinds",
	pos = { x = 0, y = 0 },

	setting_blind = function()
		G.GAME.ISO_ricardo_MY_HAIR_COUPONS = false
		G.GAME.ISO_ricardo_stagger = false
	end,

	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.after and G.GAME.ISO_ricardo_stagger == false then
				if G.GAME.chips < G.GAME.blind.chips * 2 and G.GAME.ISO_ricardo_MY_HAIR_COUPONS == false and G.GAME.ISO_ricardo_stagger == false then
					G.E_MANAGER:add_event(Event({
						trigger = 'immediate',
						func = function()
							MYHAIRCOUPONS()
							return true
						end
					}))
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 6 * G.SETTINGS.GAMESPEED,
						func = function()
							play_sound("fizz_gore5")
							G.GAME.ISO_ricardo_MY_HAIR_COUPONS = true
							G.GAME.blind.chips = G.GAME.blind.chips * 2
							G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
							return true
						end
					}))
				elseif G.GAME.chips > G.GAME.blind.chips * 2 and G.GAME.ISO_ricardo_stagger == false then
					play_sound("fizz_gore5")
					G.GAME.ISO_ricardo_stagger = true
				end
			end
			if context.after and G.GAME.ISO_ricardo_stagger == true then
				G.GAME.ISO_ricardo_stagger = false
			end
		end
	end
}
