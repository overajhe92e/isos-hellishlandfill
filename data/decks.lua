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
	config = { joker_slot = 20, chanced = 4 },
	unlocked = false,
	loc_vars = function(self, info_queue, back)
		return { vars = { self.config.joker_slot } }
	end,
	check_for_unlock = function(self, args)
		return args.type == 'win_stake' and get_deck_win_stake() >= 10
	end,
	calculate = function(self, back, context)
		if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
			if SMODS.pseudorandom_probability(back, 'ocstobal_aio', 1, 2) then
				local jokers = {}
				for k, v in pairs(G.P_CENTERS) do
					if v.mod and v.mod.id == 'ocstobalatro' then
						table.insert(jokers, k)
					end
				end
				local blehh = pseudorandom_element(jokers, 'luckfactor2')
				SMODS.add_card { set = joker, key = blehh }
			else
				card_eval_status_text(
					G.jokers,
					"jokers",
					nil,
					nil,
					nil,
					{ message = 'Nope!', colour = G.C.RARITY[3] }
				)
			end
		end
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
	config = { jokers = { 'j_ocstobal_Oxy', 'j_ocstobal_crystal' } },
	unlocked = false,
	loc_vars = function(self, info_queue, back)
		return { vars = { self.config.jokers[1] } }
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
		if SMODS.pseudorandom_probability(back, 'ocstobal_looksinside', 1, 6) and G.current_isomode ~= nil and G.current_isomode >= 2 then
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

SMODS.Back {
	key = 'overpoweredjokers',
	atlas = 'looksinside',
	pos = { x = 0, y = 0 },
	unlocked = false,
	loc_vars = function(self, info_queue, back)
		return { key = unik_detect == true and self.key.."_unik" or nil }
	end,
	apply = function(self, back)
		if not unik_detect then
			G.E_MANAGER:add_event(Event({
				func = function()
					SMODS.add_card {
						set = 'Joker',
						rarity = 'ocstobal_beyondexotic',
					}
					G.GAME.win_ante = 16
					return true
				end
			}))
		else
			G.E_MANAGER:add_event(Event({
				func = function()
					SMODS.add_card {
						set = 'Joker',
						rarity = 'ocstobal_beyondexotic',
					}
					SMODS.add_card {
						set = 'Joker',
						rarity = 'ocstobal_beyondexotic',
					}
					SMODS.add_card {
						set = 'Joker',
						rarity = 'ocstobal_beyondexotic',
					}
					G.GAME.win_ante = 100
					return true
				end
			}))
		end
	end,
	check_for_unlock = function(self, args)
		return args.type == 'defeated_omega'
	end
}
