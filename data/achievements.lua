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

SMODS.Achievement {
	key = 'ach_defeatedrecluse',
	loc_txt = {
		name = 'Recluse\'s Old Vessel',
		description = {
			'...something weird happened after...',
			'...comfronting Sparky.'
		}
	},
	bypass_all_unlocked = true,
	hidden_name = true,
	
	unlock_condition = function(self, args)
		if args.type == "ach_defeatedrecluse" then
			return true
		end
	end
}

SMODS.Achievement {
	key = 'ach_unstableeye',
	loc_txt = {
		name = 'The Unstable Blind',
		description = {
			'Uh ohh.'
		}
	},
	bypass_all_unlocked = true,
	hidden_name = true,
	
	unlock_condition = function(self, args)
		if args.type == "ach_unstableeye" then
			return true
		end
	end
}

SMODS.Achievement {
	key = 'ach_toomuch',
	loc_txt = {
		name = 'it.',
		description = {
			'What have you done to them...',
			'What have you DONE?!',
			'YOU... YOU MONSTER!'
		}
	},
	bypass_all_unlocked = true,
	hidden_name = true,
	
	unlock_condition = function(self, args)
		if args.type == "ach_toomuch" then
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
	
	unlock_condition = function(self, args)
		if args.type == "ach_murphy" then
			return true
		end
	end
}