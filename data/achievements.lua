SMODS.Achievement {
	key = 'ach_lankyfuckoff',
	loc_txt = {
		name = 'Arpeutuminen',
		description = {
			'it fucking hurts to watch',
			'the ENTIRE god damn video'
		}
	},
	bypass_all_unlocked = true,
	hidden_name = true,
	
	unlock_condition = function(self, args)
		if args.type == "ach_lankyfuckoff" then
			return true
		end
	end
}