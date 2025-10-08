---@diagnostic disable: undefined-global
SMODS.Atlas {
	key = 'fucker',
	px = 34,
	py = 34,
	path = 'p.png',
	frames = 1,
	atlas_table = 'ANIMATION_ATLAS',
}

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

SMODS.Blind {
	key = 'rng',
	name = 'rng',
	atlas = 'rngatlas',
	pos = { x = 0, y = 0 },
	mult = math.random(0.5, 4),
	dollars = math.random(5, 8),
	boss = { min = 1 },
	boss_colour = HEX('54758a'),

	set_blind = function()
		G.GAME.round_resets.lost = false
	end,

	calculate = function(self, card, context)
		if G.GAME.omegarush and G.GAME.omegarush == 1 then
			if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) then
				G.GAME.chips = 0
				G.GAME.round_resets.lost = true
				G.E_MANAGER:add_event(Event({
					func = function()
						G.GAME.blind:set_blind(G.P_BLINDS["bl_ocstobal_solblind"])
						ocstobal.nextboss()
						G.GAME.blind:juice_up()
						ease_hands_played(G.GAME.round_resets.hands - G.GAME.current_round.hands_left)
						ease_discard(
							math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards) -
							G.GAME.current_round.discards_left
						)
						G.FUNCS.draw_from_discard_to_deck()
						return true
					end
				}))
			end
		end
	end
}

SMODS.Blind {
	key = 'unstable',
	name = 'unstable',
	atlas = 'unstable',
	pos = { x = 0, y = 0 },
	mult = 66,
	dollars = 10,
	boss = { min = 16 },
	boss_colour = HEX('101010'),
	debuff = {
		akyrs_cannot_be_skipped = true,
		akyrs_cannot_be_disabled = true,
		akyrs_cannot_be_rerolled = true,
		akyrs_cannot_be_overridden = true
	},

	get_loc_debuff_text = function(self)
		return localize { type = 'variable', key = 'a_ocstobal_deathinbound' }
	end,

	set_blind = function()
		G.GAME.round_resets.lost = false
	end,

	calculate = function(self, card, context)
		if context.modify_hand then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.original_mod == SMODS.Mods["ocstobalatro"] then
					if pseudorandom("burger", 1, 100) ~= 1 then
						diedach()
						forceGameover()
						return true
					else
						G.burger = 1
						play_sound("ocstobal_jumpscare", 1, 1)
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 3 * G.SETTINGS.GAMESPEED,
							func = function()
								G.burger = 0
								forceGameover()
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
		if G.GAME.omegarush and G.GAME.omegarush == 1 then
			if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) then
				G.GAME.chips = 0
				G.GAME.round_resets.lost = true
				G.E_MANAGER:add_event(Event({
					func = function()
						G.GAME.blind:set_blind(G.P_BLINDS["bl_ocstobal_BLACKKNIFE"])
						ocstobal.nextboss()
						G.GAME.blind:juice_up()
						ease_hands_played(G.GAME.round_resets.hands - G.GAME.current_round.hands_left)
						ease_discard(
							math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards) -
							G.GAME.current_round.discards_left
						)
						G.FUNCS.draw_from_discard_to_deck()
						return true
					end
				}))
			end
		end
	end,

	disable = function(self)
		return nil
	end

}

SMODS.Blind {
	key = 'diansu',
	name = 'diansu',
	atlas = 'diansuvulkarch',
	pos = { x = 0, y = 0 },
	mult = 0,
	dollars = 1,
	boss = { min = 1 },
	loc_txt = {
		name = 'Diansu Vulkarch',
		text = {
			'Run, that\'s all you CAN do!',
			'*clair de lune*'
		}
	},
	boss_colour = HEX('078500'),

	set_blind = function()
		G.GAME.round_resets.lost = false
	end,

	defeat = function(self)
		if G.GAME.omegarush == nil then
			G.FUNCS.overlay_menu {
				definition = create_UIBox_custom_video1("diansumeme", "oceanan scum"),
				config = { no_esc = true }
			}
		elseif G.GAME.omegarush < 1 then
			G.FUNCS.overlay_menu {
				definition = create_UIBox_custom_video1("diansumeme", "oceanan scum"),
				config = { no_esc = true }
			}
		end
	end
}

SMODS.Sound {
	key = "music_heavyfootsteps",
	path = "music_heavyfootsteps.ogg",
	pitch = 1,
	volume = 1,
	select_music_track = function()
		if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.name == 'cringeasf' then
			return true
		elseif G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.name == 'unstable' and G.omegarush < 1 then
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
		elseif G.GAME.omegarush >= 1 then
			return true
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

-- SMODS.Sound {
-- 	key = "music_titanspawn",
-- 	path = "titanspawn.ogg",
-- 	pitch = 1,
-- 	volume = 1,
-- 	select_music_track = function()
-- 		if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.name == 'recluseblind' then
-- 			return true
-- 		end
-- 	end
-- }

SMODS.Sound {
	key = "music_berdlysnowgrave",
	path = "berdly.ogg",
	pitch = 1,
	volume = 1,
	select_music_track = function()
		if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.name == 'recluseblind' then
			if G.GAME.omegarush == nil then
				return false
			elseif G.GAME.omegarush < 1 then
				return true
			end
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
	key = 'oxyblind',
	mult = 2,
	dollars = 5,
	boss = { min = 1 },
	boss_colour = HEX('fc6203'),
	setting_blind = function()
		G.GAME.round_resets.lost = false
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
		end
		if G.rushenabled == 1 then
			if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) then
				G.GAME.chips = 0
				G.GAME.round_resets.lost = true
				G.E_MANAGER:add_event(Event({
					func = function()
						G.rushenabled = 0
						G.GAME.blind:set_blind(G.P_BLINDS["bl_ocstobal_solblind"])
						ocstobal.nextboss()
						G.GAME.blind:juice_up()
						ease_hands_played(G.GAME.round_resets.hands - G.GAME.current_round.hands_left)
						ease_discard(
							math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards) -
							G.GAME.current_round.discards_left
						)
						G.FUNCS.draw_from_discard_to_deck()
						return true
					end
				}))
			end
		end
		if G.GAME.omegarush and G.GAME.omegarush == 1 then
			if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) then
				G.GAME.chips = 0
				G.GAME.round_resets.lost = true
				G.E_MANAGER:add_event(Event({
					func = function()
						G.GAME.blind:set_blind(G.P_BLINDS["bl_ocstobal_sphblind"])
						ocstobal.nextboss()
						G.GAME.blind:juice_up()
						ease_hands_played(G.GAME.round_resets.hands - G.GAME.current_round.hands_left)
						ease_discard(
							math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards) -
							G.GAME.current_round.discards_left
						)
						G.FUNCS.draw_from_discard_to_deck()
						return true
					end
				}))
			end
		end
	end
}

SMODS.Blind {
	key = 'spkblind',
	name = 'spkblind',
	atlas = 'shyblind',
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
		if G.GAME.omegarush and G.GAME.omegarush == 1 then
			if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) then
				G.GAME.chips = 0
				G.GAME.round_resets.lost = true
				G.E_MANAGER:add_event(Event({
					func = function()
						G.GAME.blind:set_blind(G.P_BLINDS["bl_ocstobal_oxyblind"])
						ocstobal.nextboss()
						G.GAME.blind:juice_up()
						ease_hands_played(G.GAME.round_resets.hands - G.GAME.current_round.hands_left)
						ease_discard(
							math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards) -
							G.GAME.current_round.discards_left
						)
						G.FUNCS.draw_from_discard_to_deck()
						return true
					end
				}))
			end
		end
	end,

	in_pool = function(self)
		return sparkydefeatedcheck()
	end,

	defeat = function(self)
		G.recluseblind = 1
		play_sound('ocstobal_ominous', 0.8, 1)
	end
}

SMODS.Blind {
	key = 'recluseblind',
	name = 'recluseblind',
	atlas = 'reclusebl',
	pos = { x = 0, y = 0 },
	mult = 66,
	dollars = 13,
	boss = { min = 1 },
	boss_colour = HEX('000000'),
	debuff = {
		akyrs_cannot_be_skipped = true,
		akyrs_cannot_be_disabled = true,
		akyrs_cannot_be_rerolled = true,
		akyrs_cannot_be_overridden = true,
		akyrs_blind_difficulty = "master",
	},
	ignore_showdown_check = true,

	in_pool = function(self)
		return reclusecheck()
	end,

	set_blind = function(self)
		G.solscare = 1
		G.GAME.round_resets.lost = false
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
		if G.GAME.omegarush and G.GAME.omegarush == 1 then
			if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) then
				G.GAME.chips = 0
				G.GAME.round_resets.lost = true
				G.E_MANAGER:add_event(Event({
					func = function()
						G.GAME.blind:set_blind(G.P_BLINDS["bl_ocstobal_unstable"])
						ocstobal.nextboss()
						G.GAME.blind:juice_up()
						ease_hands_played(G.GAME.round_resets.hands - G.GAME.current_round.hands_left)
						ease_discard(
							math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards) -
							G.GAME.current_round.discards_left
						)
						G.FUNCS.draw_from_discard_to_deck()
						return true
					end
				}))
			end
		end
	end,

	defeat = function(self)
		G.recluseblind = 0
		G.solscare = 0
		play_sound('ocstobal_ominouscancel', 1, 2)
		recluseach()
	end
}

SMODS.Blind {
	key = 'sphblind',
	name = 'sphblind',
	atlas = 'knifeblind',
	pos = { x = 0, y = 0 },
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
		if G.rushenabled == 1 then
			if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) then
				G.GAME.chips = 0
				G.GAME.round_resets.lost = true
				G.E_MANAGER:add_event(Event({
					func = function()
						G.rushenabled = 1
						G.GAME.blind:set_blind(G.P_BLINDS["bl_ocstobal_oxyblind"])
						ocstobal.nextboss()
						G.GAME.blind:juice_up()
						ease_hands_played(G.GAME.round_resets.hands - G.GAME.current_round.hands_left)
						ease_discard(
							math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards) -
							G.GAME.current_round.discards_left
						)
						G.FUNCS.draw_from_discard_to_deck()
						return true
					end
				}))
			end
		end
		if G.GAME.omegarush and G.GAME.omegarush == 1 then
			if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) then
				G.GAME.chips = 0
				G.GAME.round_resets.lost = true
				G.E_MANAGER:add_event(Event({
					func = function()
						G.GAME.blind:set_blind(G.P_BLINDS["bl_ocstobal_rng"])
						ocstobal.nextboss()
						G.GAME.blind:juice_up()
						ease_hands_played(G.GAME.round_resets.hands - G.GAME.current_round.hands_left)
						ease_discard(
							math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards) -
							G.GAME.current_round.discards_left
						)
						G.FUNCS.draw_from_discard_to_deck()
						return true
					end
				}))
			end
		end
	end
}

SMODS.Blind {
	key = 'solblind',
	name = 'solblind',
	atlas = 'solblind',
	pos = { x = 0, y = 0 },
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
		if G.rushenabled == 1 then
			if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) then
				G.GAME.chips = 0
				G.GAME.round_resets.lost = true
				G.E_MANAGER:add_event(Event({
					func = function()
						G.rushenabled = 1
						G.GAME.blind:set_blind(G.P_BLINDS["bl_ocstobal_bossrushend"])
						ocstobal.nextboss()
						G.GAME.blind:juice_up()
						ease_hands_played(G.GAME.round_resets.hands - G.GAME.current_round.hands_left)
						ease_discard(
							math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards) -
							G.GAME.current_round.discards_left
						)
						G.FUNCS.draw_from_discard_to_deck()
						return true
					end
				}))
			end
		end
		if G.GAME.omegarush and G.GAME.omegarush == 1 then
			if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) then
				G.GAME.chips = 0
				G.GAME.round_resets.lost = true
				G.E_MANAGER:add_event(Event({
					func = function()
						G.GAME.blind:set_blind(G.P_BLINDS["bl_ocstobal_recluseblind"])
						ocstobal.nextboss()
						G.GAME.blind:juice_up()
						ease_hands_played(G.GAME.round_resets.hands - G.GAME.current_round.hands_left)
						ease_discard(
							math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards) -
							G.GAME.current_round.discards_left
						)
						G.FUNCS.draw_from_discard_to_deck()
						return true
					end
				}))
			end
		end
	end
}

SMODS.Blind {
	key = 'bossrush',
	dollars = 0,
	mult = 2,
	boss = { min = 1, showdown = true },
	boss_colour = HEX('ffffff'),
	ignore_showdown_check = false,

	calculate = function(self, card, context)
		if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) then
			G.GAME.chips = 0
			G.GAME.round_resets.lost = true
			G.E_MANAGER:add_event(Event({
				func = function()
					G.rushenabled = 1
					G.GAME.blind:set_blind(G.P_BLINDS["bl_ocstobal_sphblind"])
					ocstobal.nextboss()
					G.GAME.blind:juice_up()
					ease_hands_played(G.GAME.round_resets.hands - G.GAME.current_round.hands_left)
					ease_discard(
						math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards) -
						G.GAME.current_round.discards_left
					)
					G.FUNCS.draw_from_discard_to_deck()
					return true
				end
			}))
		end
	end
}

SMODS.Blind {
	key = 'bossrushomega',
	dollars = 12,
	mult = 666,
	boss = { showdown = true },
	boss_colour = HEX('000000'),
	atlas = 'omegarush',
	pos = { x = 0, y = 0 },
	ignore_showdown_check = true,

	set_blind = function(self)
		if G.GAME.omegarush == nil then
			G.GAME.omegarush = 1
			G.GAME.blind:set_blind(G.P_BLINDS["bl_ocstobal_spkblind"])
		elseif G.GAME.omegarush < 1 then
			G.GAME.omegarush = 1
			G.GAME.blind:set_blind(G.P_BLINDS["bl_ocstobal_spkblind"])
		elseif G.GAME.omegarush == 1 then
			return false
		end
	end,

	in_pool = function()
		return ante32spawn()
	end,

	defeat = function()
		G.GAME.omegarush = 0
	end
}

SMODS.Blind { --Seraph Blind Special
	key = 'BLACKKNIFE',
	dollars = 0,
	mult = 5,
	boss = { showdown = true },
	boss_colour = HEX('000000'),
	atlas = 'BLACKKNIFE',
	pos = { x = 0, y = 0 },
	ignore_showdown_check = true,

	in_pool = function()
		return false
	end,

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
		if G.GAME.omegarush and G.GAME.omegarush == 1 then
			if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) then
				G.GAME.chips = 0
				G.GAME.round_resets.lost = true
				G.E_MANAGER:add_event(Event({
					func = function()
						G.GAME.blind:set_blind(G.P_BLINDS["bl_ocstobal_THESCALE"])
						ocstobal.nextboss()
						G.GAME.blind:juice_up()
						ease_hands_played(G.GAME.round_resets.hands - G.GAME.current_round.hands_left)
						ease_discard(
							math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards) -
							G.GAME.current_round.discards_left
						)
						G.FUNCS.draw_from_discard_to_deck()
						return true
					end
				}))
			end
		end
	end
}

SMODS.Blind { --Solinium Blind Special
	key = 'THESCALE',
	dollars = 0,
	mult = 8,
	boss = { showdown = true },
	boss_colour = HEX('000000'),
	atlas = 'UNFAIRSCALE',
	pos = { x = 0, y = 0 },
	ignore_showdown_check = true,

	in_pool = function()
		return false
	end,

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
		if G.GAME.omegarush and G.GAME.omegarush == 1 then
			if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) then
				G.GAME.chips = 0
				G.GAME.round_resets.lost = true
				G.E_MANAGER:add_event(Event({
					func = function()
						G.GAME.blind:set_blind(G.P_BLINDS["bl_ocstobal_THEDROPLET"])
						ocstobal.nextboss()
						G.GAME.blind:juice_up()
						ease_hands_played(G.GAME.round_resets.hands - G.GAME.current_round.hands_left)
						ease_discard(
							math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards) -
							G.GAME.current_round.discards_left
						)
						G.FUNCS.draw_from_discard_to_deck()
						return true
					end
				}))
			end
		end
	end
}

SMODS.Blind { --Oxy Blind Special
	key = 'THEDROPLET',
	dollars = 0,
	mult = 0.01,
	boss = { showdown = true },
	boss_colour = HEX('000000'),
	atlas = 'THEDROPLET',
	pos = { x = 0, y = 0 },
	ignore_showdown_check = true,

	in_pool = function()
		return false
	end,

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
				G.GAME.blind.chips = to_big(math.sqrt(G.GAME.blind.chips)^1.75)
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			end
		if G.GAME.omegarush and G.GAME.omegarush == 1 then
			if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) then
				G.GAME.chips = 0
				G.GAME.round_resets.lost = true
				G.E_MANAGER:add_event(Event({
					func = function()
						G.GAME.blind:set_blind(G.P_BLINDS["bl_ocstobal_bossrushomega"])
						ocstobal.nextboss()
						G.GAME.blind:juice_up()
						ease_hands_played(G.GAME.round_resets.hands - G.GAME.current_round.hands_left)
						ease_discard(
							math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards) -
							G.GAME.current_round.discards_left
						)
						G.FUNCS.draw_from_discard_to_deck()
						return true
					end
				}))
			end
		end
	end
}

function recluseach()
	G.E_MANAGER:add_event(Event({
		trigger = 'immediate',
		locking = false,
		delay = 0,
		func = function()
			check_for_unlock({ type = "ach_defeatedrecluse" })
			return true
		end,
	}))
end

function diedach()
	G.E_MANAGER:add_event(Event({
		trigger = 'immediate',
		locking = false,
		delay = 0,
		func = function()
			check_for_unlock({ type = "ach_unstableeye" })
			return true
		end,
	}))
end
