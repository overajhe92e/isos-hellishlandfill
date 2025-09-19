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
		name = 'Recluse\'s Vessel',
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
			'YOU SHOULD HAVE LISTENED TO IT.'
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
		name = 'Maailmanloppupiste',
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