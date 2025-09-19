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

-- SMODS.Blind {
-- key = 'impossible',
-- name = 'impossible',
-- atlas = 'impossible',
-- pos = {x=0,y=0},
-- mult = 1e309,
-- dollars = 0,
-- boss = { min = 1e308 },
-- loc_txt = {
-- name = 'Literally Impossible',
-- text = {
-- 'You cant find this blind.',
-- 'Or even win it.',
-- 'Not like you\'d get past Ante 39.'
-- }
-- },
-- boss_colour = HEX('000000')
-- }

SMODS.Blind {
	key = 'unstable',
	name = 'unstable',
	atlas = 'unstable',
	pos = { x = 0, y = 0 },
	mult = 66,
	dollars = 10,
	boss = { min = 16 },
	loc_txt = {
		name = 'Instability',
		text = {
			'If you have an',
			'Isotypical\'s Junkyard Joker,',
			'Upon playing a hand, Die.'
		}
	},
	boss_colour = HEX('101010'),
	debuff = {
		akyrs_cannot_be_skipped = true,
		akyrs_cannot_be_disabled = true,
		akyrs_cannot_be_rerolled = true,
		akyrs_cannot_be_overridden = true
	},

	press_play = function(self)
		if G.GAME.dollars < to_big(999999) then
			forceGameover()
		end
	end,

	get_loc_debuff_text = function(self)
		if G.GAME.dollars < to_big(999999) then
			localize('k_ocstobal_deathinbound')
		end
	end
}--todo: fix

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
			'MORYIA, I THOUGHT YOU WERE {C:dark_edition}ENLIGHTENED{}',
			'I THOUGHT YOU WERE LIKE {C:green}WILL{}',
			'BUT TURNS OUT YOUR LIKE THE {C:red}SCUM{} LIKE',
			'{C:red,s:1.2}F U C K I N   E I G H T{}'
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

-- SMODS.Blind {
-- 	key = 'lankyohfuckinghellbox',
-- 	name = 'lankyohfuckinghellbox',
-- 	atlas = 'burnteyes',
-- 	pos = { x = 0, y = 0 },
-- 	mult = 2,
-- 	dollars = 12,
-- 	in_pool = function(self)
-- 		return ifuckinghatelankybox()
-- 	end,
-- 	ignore_showdown_check = false,
-- 	boss_colour = HEX('ff0000'),
-- 	debuff = {
-- 		--akyrs_cannot_be_skipped = true,
-- 		akyrs_cannot_be_disabled = true,
-- 		akyrs_cannot_be_rerolled = true,
-- 		akyrs_blind_difficulty = "master",
-- 		--akyrs_cannot_be_overridden = true
-- 	},

-- 	defeat = function(self)
-- 		imsorryforthis()
-- 		AHHHH()
-- 		G.FUNCS.overlay_menu {
-- 			definition = create_UIBox_custom_video4("sorry", "im sorry."),
-- 			config = { no_esc = true }
-- 		}
-- 	end
-- }

-- SMODS.Blind { unused due to video
-- 	key = 'cringeasf',
-- 	name = 'cringeasf',
-- 	atlas = 'HELPME',
-- 	pos = { x = 0, y = 0 },
-- 	mult = 0.75,
-- 	dollars = 10,
-- 	boss = { min = 1 },
-- 	boss_colour = HEX('7DF9FF'),
-- 	debuff = {
-- 		akyrs_blind_difficulty = "expert",
-- 		akyrs_cannot_be_disabled = true,
-- 		akyrs_cannot_be_rerolled = true
-- 	},
-- 	ignore_showdown_check = true,
-- 	in_pool = function(self)
-- 		return ifuckinghatelankybox()
-- 	end,

-- 	defeat = function(self)
-- 		if SMODS.last_hand_oneshot then
-- 			achievementlanky()
-- 			AHHHH()
-- 			G.FUNCS.overlay_menu {
-- 				definition = create_UIBox_custom_video2("suffer", "HATE. LET ME TELL YOU HOW MUCH I'VE COME TO HATE YOU SINCE I BEGAN TO LIVE."),
-- 				config = { no_esc = true }
-- 			}
-- 		end
-- 	end
-- }

--unused as it's too fucking annoying to compress the videos
-- function AHHHH()
-- 	local text = localize('fuckyou')
-- 	attention_text({
-- 		scale = 1,
-- 		text = text,
-- 		hold = 2,
-- 		align = 'cm',
-- 		offset = { x = 0, y = -2.7 },
-- 		major = G.play,
-- 		colour = HEX('ffffff')
-- 	})
-- end

-- function achievementlanky()
-- 	G.E_MANAGER:add_event(Event({
-- 		trigger = 'immediate',
-- 		locking = false,
-- 		delay = 0,
-- 		func = function()
-- 			check_for_unlock({ type = "ach_lankyfuckoff" })
-- 			return true
-- 		end,
-- 	}))
-- end

-- function imsorryforthis()
-- 	G.E_MANAGER:add_event(Event({
-- 		trigger = 'immediate',
-- 		locking = false,
-- 		delay = 0,
-- 		func = function()
-- 			check_for_unlock({ type = "ach_sorry" })
-- 			return true
-- 		end,
-- 	}))
-- end

-- SMODS.Blind {
-- key = 'yahermouse',
-- name = 'yahermouse',
-- atlas = 'HELPME',
-- mult = 1,
-- dollars = 2,
-- boss = { min = 1},
-- loc_txt = {
-- name = 'Peak Blind',
-- text = {
-- 'Upon defeating blind,',
-- 'Watch a Yahiamice Video'
-- }
-- },
-- boss_colour = HEX('0000ff'),

-- defeat = function(self)
-- G.FUNCS.overlay_menu{
-- definition = create_UIBox_custom_video3("peak","Hell Yeah"),
-- config = {no_esc = true}
-- }
-- end
-- }

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

-- SMODS.Blind {
-- key = 'THEWALLex',
-- name = 'THEWALLex',
-- atlas = 'rngatlas',
-- pos = {x=0,y=0},
-- mult = 100,
-- dollars = 8,
-- boss = { min = 16 },
-- boss_colour = HEX('ffffff')
-- }

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
