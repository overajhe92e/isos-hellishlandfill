-- SMODS.Achievement {
-- 	key = 'ach_lankyfuckoff',
-- 	loc_txt = {
-- 		name = 'Arpeutuminen',
-- 		description = {
-- 			'it fucking hurts to watch',
-- 			'the ENTIRE god damn video',
-- 			'(Unused now)'
-- 		}
-- 	},
-- 	bypass_all_unlocked = false,
-- 	hidden_name = true,

-- 	unlock_condition = function(self, args)
-- 		if args.type == "ach_lankyfuckoff" then
-- 			return true
-- 		end
-- 	end
-- }

SMODS.Atlas {
	key = "isoach",
	path = "ach_stars.png",
	px = 49,
	py = 49,
	atlas_table = "ASSET_ATLAS"
}

SMODS.Achievement {
	key = 'ach_defeatedrecluse',
	loc_txt = {
		name = 'Recluse\'s Old Vessel',
		description = {
			'Sparky is Recluse\'s Vessel?',
			'You\'re kidding, right?'
		}
	},
	bypass_all_unlocked = true,
	hidden_name = true,
	atlas = "isoach",
	pos = { x = 1, y = 0 },
	hidden_pos = { x = 0, y = 2 },

	unlock_condition = function(self, args)
		if args.type == "ach_defeatedrecluse" then
			return true
		end
	end
}

SMODS.Achievement {
	key = 'ach_serious_dedication',
	loc_txt = {
		name = 'Junkyard King / Queen',
		description = {
			'Obtain Isotypical, PK Love Omega',
			'A Terminus Joker, and Reclusive Vessel',
			'You\'re insane if you do this.'
		}
	},
	bypass_all_unlocked = true,
	hidden_name = true,
	atlas = "isoach",
	pos = { x = 3, y = 0 },
	hidden_pos = { x = 0, y = 2 },

	unlock_condition = function(self, args)
		if args.type == "ach_serious_dedication" then
			return true
		end
	end
}

SMODS.Achievement {
	key = 'ach_allatjusttobesold',
	loc_txt = {
		name = 'what the fuck is wrong with you',
		description = {
			"Sell / Destroy",
			"\"So called Free Thinkers when..\"",
			"with 1 hand left to activate it"
		}
	},
	bypass_all_unlocked = true,
	hidden_name = true,
	atlas = "isoach",
	pos = { x = 0, y = 1 },
	hidden_pos = { x = 0, y = 2 },

	unlock_condition = function(self, args)
		if args.type == "ach_WHYTHEFUCK" then
			return true
		end
	end
}

SMODS.Achievement {
	key = 'ach_burgr',
	loc_txt = {
		name = 'jumpscar',
		description = {
			'Get burgered, IDIOT.',
		}
	},
	bypass_all_unlocked = true,
	hidden_name = true,
	atlas = "isoach",
	pos = { x = 0, y = 0 },
	hidden_pos = { x = 0, y = 2 },

	unlock_condition = function(self, args)
		if args.type == "ach_burgr" then
			return true
		end
	end
}

SMODS.Achievement {
	key = 'ach_horse',
	loc_txt = {
		name = 'house',
		description = {
			'neigh',
		}
	},
	bypass_all_unlocked = true,
	hidden_name = true,
	atlas = "isoach",
	pos = { x = 2, y = 0 },
	hidden_pos = { x = 0, y = 2 },

	unlock_condition = function(self, args)
		if args.type == "iso_honse" then
			return true
		end
	end
}

SMODS.Achievement {
	key = 'ach_murphy',
	loc_txt = {
		name = 'Murphy\'d',
		description = {
			'Die from Anti-Numberslop-inator',
		}
	},
	bypass_all_unlocked = true,
	hidden_name = true,
	atlas = "isoach",
	pos = { x = 1, y = 0 },
	hidden_pos = { x = 0, y = 2 },

	unlock_condition = function(self, args)
		if args.type == "ach_murphy" then
			return true
		end
	end
}

SMODS.Achievement {
	key = 'ach_you_cannot_kill_me',
	loc_txt = {
		name = 'Something Evil WILL Happen',
		description = {
			'Have 5+ "Something Evil"s,',
			'Oxidyze, Solinium, and Sparky\'s Hatred',
			'in one run'
		}
	},
	bypass_all_unlocked = true,
	hidden_name = true,
	atlas = "isoach",
	pos = { x = 0, y = 1 },
	hidden_pos = { x = 0, y = 2 },

	unlock_condition = function(self, args)
		local evil = 0
		local evils = { "j_ocstobal_oxhatred", "j_ocstobal_solhatred", "j_ocstobal_sparkhatred" }
		for _, sewh in ipairs(SMODS.find_card("j_ocstobal_somethingevil")) do
			evil = evil + 1
		end
		if next(SMODS.find_card("j_ocstobal_oxhatred")) and next(SMODS.find_card("j_ocstobal_solhatred")) and next(SMODS.find_card("j_ocstobal_sparkhatred")) then
			if evil >= 5 then
				return true
			end
		end
	end
}

SMODS.Achievement {
	key = 'ach_hyper_completion',
	loc_txt = {
		name = 'Alright, You won. NOW GET OU-',
		description = {
			'Overscore 1e100^^^^1e100',
			'On Normal Mode'
		}
	},
	bypass_all_unlocked = true,
	hidden_name = true,
	atlas = "isoach",
	pos = { x = 3, y = 0 },
	hidden_pos = { x = 0, y = 2 },

	unlock_condition = function(self, args)
		if G.GAME then
			if G.current_isomode == 0 then
				if G.GAME.chips >= to_big(1e100):arrow(4, 1e100) then
					return true
				end
			end
		end
	end
}

SMODS.Achievement {
	key = 'ach_hyperHYPER_completion',
	loc_txt = {
		name = 'Kosmology',
		description = {
			'Haha, Polterworx Reference.',
			'Surpass 1e100{100000}1e100'
		}
	},
	atlas = "isoach",
	pos = { x = 3, y = 1 },
	hidden_pos = { x = 0, y = 2 },
	bypass_all_unlocked = true,
	hidden_name = false,
	hidden_text = true,

	unlock_condition = function(self, args)
		if G.GAME then
			if G.GAME.chips >= to_big(1e100):arrow(100000, 1e100) then
				return true
			end
		end
	end
}

SMODS.Achievement {
	key = 'ach_the_divorce_was_bad',
	loc_txt = {
		name = 'Not taking the divorce well',
		description = {
			'Have Astro Starspace',
			'kill Astro Novalite',
			'using Astro\'s Gun'
		}
	},
	atlas = "isoach",
	pos = { x = 1, y = 0 },
	hidden_pos = { x = 0, y = 2 },
	bypass_all_unlocked = true,
	hidden_name = false,
	hidden_text = true,

	unlock_condition = function(self, args)
		if args.type == "ach_divorc" then
			return true
		end
	end
}

SMODS.Achievement {
	key = 'ach_iso',
	loc_txt = {
		name = 'The Creator Herself!',
		description = {
			'Obtain Isotypical',
		}
	},
	atlas = "isoach",
	pos = { x = 0, y = 1 },
	hidden_pos = { x = 0, y = 2 },
	bypass_all_unlocked = true,
	hidden_name = true,
	hidden_text = true,

	unlock_condition = function(self, args)
		if G.jokers then
			if next(SMODS.find_card("j_ocstobal_myself")) then
				return true
			end
		end
	end
}

SMODS.Achievement {
	key = 'ach_jf',
	loc_txt = {
		name = 'Are you serious?',
		description = {
			'Figure out what',
			'that joker does.'
		}
	},
	atlas = "isoach",
	pos = { x = 0, y = 0 },
	hidden_pos = { x = 0, y = 2 },
	bypass_all_unlocked = true,
	hidden_name = true,
	hidden_text = true,

	unlock_condition = function(self, args)
		if G.ISO_jf == true then return true end
	end
}
