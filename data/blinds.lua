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
	key = 'experimentalrng',
	name = 'experimentalrng',
	atlas = 'rngatlas',
	pos = { x = 0, y = 0 },
	mult = math.random(0.1, 5),
	dollars = math.random(1, 15),
	boss = { min = 1 },
	loc_txt = {
		name = 'SMODS.Blind(loc_txt=(name=RNG))',
		text = {
			'Randomly Multiplies base Chips',
			'From 0.1 to 5 when Balatro itself',
			'is reset entirely. (closing and opening)',
			'Blind award is random from 1 to 15.'
		}
	},
	boss_colour = HEX('0000ff')
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

	calculate = function(self, card, context)
		if context.modify_hand then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.original_mod == SMODS.Mods["ocstobalatro"] then
						G.E_MANAGER:add_event({
							func = function()
								death()
								diedach()
								forceGameover()
								return true
							end
						})
					--"Add a cheeseburger" -Grazy
					--TODO: add a 1 in 100 chance for a cheeseburger jumpscare
				end
			end
		end
	end
} --todo: fix

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

	defeat = function(self)
		G.FUNCS.overlay_menu {
			definition = create_UIBox_custom_video1("diansumeme", "oceanan scum"),
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
		if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.name == 'cringeasf' then
			return true
		elseif G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.name == 'recluseblind' then
			return true
		elseif G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.name == 'unstable' then
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

function suffertime()
	if G.reclusebs >= 1 then
		return true
	end
end

SMODS.Sound {
	key = 'ominous',
	path = 'ominous.ogg',
	pitch = 0.7,
	volume = 1.2
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

	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.modify_hand then
				play_sound('timpani')
				blind.triggered = true
				G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 3)
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			end
		end
	end,

	defeat = function(self)
		G.recluseblind = -999999
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


	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.modify_hand then
				play_sound('timpani')
				blind.triggered = true
				G.GAME.blind.chips = math.floor(G.GAME.blind.chips + G.GAME.blind.chips / 3)
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
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

	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.modify_hand then
				blind.triggered = true
				play_sound('timpani')
				-- G.E_MANAGER:add_event(Event({
				-- 	trigger = "ease",
				-- 	delay = 1,
				-- 	ref_table = G.GAME,
				-- 	ref_value = "chips",
				-- 	ease_to = G.GAME.blind.chips * 1.005,
				-- }))
				G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 1.25)
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			end
		end
	end
}

SMODS.Blind {
	key = 'solblindawk',
	name = 'solblindawk',
	atlas = 'rngatlas',
	pos = { x = 0, y = 0 },
	mult = 1,
	dollars = 15,
	boss_colour = HEX('00ff00'),

	in_pool = function()
		if ocstobal.configbs.unbalanced_mode == true and ocstobal.configbs.very_unbalanced_mode == true then
			return true
		else
			return false
		end
	end,

	calculate = function(self, blind, context)
		if not blind.disabled then
			if context.modify_hand then
				blind.triggered = true
				G.GAME.blind.chips = math.floor(G.GAME.blind.chips + G.GAME.blind.chips ^ 1.5)
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
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

function death()
	local text = localize('yeahokbro')
	attention_text({
		scale = 1,
		text = text,
		hold = 8,
		align = 'cm',
		offset = { x = 0, y = -2.7 },
		major = G.play,
		colour = HEX('ff0000')
	})
end
