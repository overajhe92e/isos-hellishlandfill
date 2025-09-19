SMODS.Atlas {
	key = 'baller',
	px = 71,
	py = 95,
	path = 'thetriodeck.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 1
}

SMODS.Back {
	key = "ocs",
	pos = { x = 0, y = 0 },
	-- loc_txt = {
	-- 	name = 'The Trio',
	-- 	text = {
	-- 		'Start off with {C:common}Sparky{},' ,
	-- 		'{C:rare}Seraph{}, and {C:legendary}Solinium{}',
	-- 		'{X:ocstobal_legendplus,C:white,s:1.2}50x{} Blind Size'
	-- 		},
	-- 	},
	atlas = "baller",
	config = { spectral_rate = 1, jokers = { 'j_ocstobal_sparky', 'j_ocstobal_seraph', 'j_ocstobal_solinium' }, ante_scaling = 50 },
	unlocked = false,
	loc_vars = function(self, info_queue, back)
		return { vars = { self.config.jokers[1] }, self.config.ante_scaling }
	end,
	check_for_unlock = function(self, args)
		return args.type == 'win_stake' and get_deck_win_stake() >= 8
	end
}

SMODS.Back {
	key = "aio",
	pos = { x = 0, y = 0 },
	atlas = "aioimg",
	config = { joker_slot = 20, jokers = { 'j_ocstobal_sparkynt', 'j_ocstobal_sparky', 'j_ocstobal_seraph', 'j_ocstobal_solinium', 'j_ocstobal_brokenseraph', 'j_ocstobal_Oxy', 'j_ocstobal_recluse', 'j_ocstobal_tigersharksparky', 'j_ocstobal_shrimpo', 'j_ocstobal_ichor', 'j_ocstobal_crystal', 'j_ocstobal_eternaldagger' }, ante_scaling = 666666 },
	unlocked = false,
	loc_vars = function(self, info_queue, back)
		return { vars = { self.config.jokers[1], self.config.joker_slot, self.config.ante_scaling } }
	end,
	check_for_unlock = function(self, args)
		return args.type == 'win_stake' and get_deck_win_stake() >= 10
	end
}

SMODS.Back {
	key = "extremepain",
	pos = { x = 0, y = 0 },
	atlas = 'deckofalltime',
	config = { jokers = { 'j_ocstobal_somethingevil' }, ante_scaling = 0.25, joker_slot = 1 },
	unlocked = false,
	loc_vars = function(self, info_queue, back)
		return {
			vars = { localize { type = 'name_text', key = 'j_ocstobal_somethingevil', set = 'jokers' } },
			self
				.config.jokers[1],
			self.config.joker_slot,
			self.config.ante_scaling
		}
	end,
	check_for_unlock = function(self, args)
		return args.type == 'win_stake' and get_deck_win_stake() >= 1
	end
}

SMODS.Back {
	key = "copycat",
	pos = { x = 0, y = 0 },
	config = { jokers = { 'j_ocstobal_Oxy', 'j_blueprint', 'j_brainstorm', 'j_ocstobal_crystal' }, ante_scaling = 4 },
	unlocked = false,
	loc_vars = function(self, info_queue, back)
		return { vars = { self.config.jokers[1], self.config.ante_scaling } }
	end,
	calculate = function(self, back, context)
		if context.final_scoring_step then
			return {
				balance = true
			}
		end
	end,
	check_for_unlock = function(self, args)
		return args.type == 'win_stake' and get_deck_win_stake() >= 8
	end
}

-- SMODS.Back {
-- 	key = 'fakenaneinf',
-- 	config = { jokers = { 'j_baron'}}
-- }

SMODS.Back {
	key = 'looksinside',
	atlas = 'looksinside',
	pos = { x = 0, y = 0 },
	-- config = {
	-- 	jokers = { 'j_photograph', 'j_hanging_chad' },
	-- 	jokersalt = { 'j_ocstobal_jokertoendalljokers' }
	-- },
	unlocked = false,
	-- loc_vars = function(self, info_queue, back)
	-- 	if pseudorandom("avaritiajumpscare",1,6) == 1 and ocstobal.configbs.very_unbalanced_mode == true then
	-- 		return {
	-- 			vars = { self.config.jokersalt[1] }
	-- 		}
	-- 	else
	-- 		return {
	-- 			vars = { self.config.jokers[1] }
	-- 		}
	-- 	end
	-- end,
	apply = function(self, back)
		if pseudorandom("avaritiajumpscare", 1, 6) == 1 and ocstobal.configbs.very_unbalanced_mode == true then
			G.E_MANAGER:add_event(Event({
				func = function()
					SMODS.add_card { key = "j_ocstobal_jokertoendalljokers" }
					return true
				end
			}))
		else
			G.E_MANAGER:add_event(Event({
				func = function()
					SMODS.add_card { key = "j_photograph" }
					SMODS.add_card { key = "j_hanging_chad" }
					return true
				end
			}))
		end
	end,
	check_for_unlock = function(self, args)
		return args.type == 'win_stake' and get_deck_win_stake() >= 1
	end
}
