SMODS.Challenge {
	key = 'wee_gaming',
	jokers = { 
		{ id = 'j_wee', eternal = true }
	},
	rules = {
        custom = {
            { id = 'no_shop_jokers' },
			{ id = 'no_reward' },
            { id = 'no_extra_hand_money' },
            { id = 'no_interest' }
        }
    },
	deck = {
		type = "Challenge Deck",
		cards = {
			{ s = "D", r = "2" },
			{ s = "D", r = "2" },
			{ s = "D", r = "2" },
			{ s = "D", r = "2" },
			{ s = "D", r = "2" },
			{ s = "D", r = "2" },
			{ s = "D", r = "2" },
			{ s = "D", r = "2" },
			{ s = "D", r = "2" },
			{ s = "D", r = "2" },
			{ s = "D", r = "2" },
			{ s = "D", r = "2" },
			{ s = "D", r = "2" },
			{ s = "D", r = "2" },
			{ s = "C", r = "2" },
			{ s = "C", r = "2" },
			{ s = "C", r = "2" },
			{ s = "C", r = "2" },
			{ s = "C", r = "2" },
			{ s = "C", r = "2" },
			{ s = "C", r = "2" },
			{ s = "C", r = "2" },
			{ s = "C", r = "2" },
			{ s = "C", r = "2" },
			{ s = "C", r = "2" },
			{ s = "C", r = "2" },
			{ s = "C", r = "2" },
			{ s = "C", r = "2" },
			{ s = "H", r = "2" },
			{ s = "H", r = "2" },
			{ s = "H", r = "2" },
			{ s = "H", r = "2" },
			{ s = "H", r = "2" },
			{ s = "H", r = "2" },
			{ s = "H", r = "2" },
			{ s = "H", r = "2" },
			{ s = "H", r = "2" },
			{ s = "H", r = "2" },
			{ s = "H", r = "2" },
			{ s = "H", r = "2" },
			{ s = "H", r = "2" },
			{ s = "H", r = "2" },
			{ s = "S", r = "2" },
			{ s = "S", r = "2" },
			{ s = "S", r = "2" },
			{ s = "S", r = "2" },
			{ s = "S", r = "2" },
			{ s = "S", r = "2" },
			{ s = "S", r = "2" },
			{ s = "S", r = "2" },
			{ s = "S", r = "2" },
			{ s = "S", r = "2" },
			{ s = "S", r = "2" },
			{ s = "S", r = "2" },
			{ s = "S", r = "2" },
			{ s = "S", r = "2" },
		},
	},
	restrictions = {
        banned_cards = {
            { id = 'c_judgement' },
            { id = 'c_wraith' },
            { id = 'p_buffoon_normal_1', ids = {
                'p_buffoon_normal_1', 'p_buffoon_normal_2', 'p_buffoon_jumbo_1', 'p_buffoon_mega_1',
            }
            },
			{ id = 'j_ocstobal_eternaldagger' }
        },
        banned_tags = {
            { id = 'tag_uncommon' },
            { id = 'tag_rare' },
            { id = 'tag_negative' },
            { id = 'tag_foil' },
            { id = 'tag_holographic' },
            { id = 'tag_polychrome' },
            { id = 'tag_buffoon' },
            { id = 'tag_top_up' },
        },
        banned_other = {
            { id = 'bl_final_heart', type = 'blind' },
            { id = 'bl_final_leaf',  type = 'blind' },
            { id = 'bl_final_acorn', type = 'blind' },
        }
    }
}

SMODS.Challenge {
	key = 'hunger',
	jokers = { 
		{ id = 'j_ocstobal_recluse', eternal = true, pinned = true }
	},
	rules = {
		custom = {
			--{ id = 'balance' }
		},
		modifiers = {
            { id = 'joker_slots', value = 2 }
        }
	},
	restrictions = {
		banned_other = {
            { id = 'bl_final_leaf', type = 'blind' },
        },
		banned_cards = {
            { id = 'j_ocstobal_eternaldagger' },
        },
	}
}

SMODS.Challenge {
	key = 'rapidgrowth',
	jokers = { 
		{ id = 'j_blueprint', eternal = true, pinned = true},
		{ id = 'j_ocstobal_evilantislopinator', eternal = true }
	},
	rules = {
		custom = {
			--{ id = 'balance' }
		}
	},
	restrictions = {
		banned_cards = {
			{ id = 'j_ocstobal_eternaldagger' }
		}
	}
}

SMODS.Challenge {
	key = 'do_or_die',
	jokers = {
		{ id = 'j_ocstobal_seraph', eternal = true },
		{ id = 'j_oops', eternal = true }
	},
	rules = {
		custom = {
            { id = 'no_shop_jokers' },
        },
		modifiers = {
            { id = 'joker_slots', value = 0 }
        }
	},
	restrictions = {
		banned_cards = {
            { id = 'c_judgement' },
            { id = 'c_wraith' },
            { id = 'c_soul' },
            { id = 'p_buffoon_normal_1', ids = {
                'p_buffoon_normal_1', 'p_buffoon_normal_2', 'p_buffoon_jumbo_1', 'p_buffoon_mega_1',
            }
            },
			{ id = 'v_blank' },
			{ id = 'v_antimatter' }
        },
		banned_tags = {
            { id = 'tag_uncommon' },
            { id = 'tag_rare' },
            { id = 'tag_negative' },
            { id = 'tag_foil' },
            { id = 'tag_holographic' },
            { id = 'tag_polychrome' },
            { id = 'tag_buffoon' },
            { id = 'tag_top_up' },
        },
		banned_other = {
			{ id = 'bl_final_heart', type = 'blind' },
            { id = 'bl_final_leaf',  type = 'blind' },
            { id = 'bl_final_acorn', type = 'blind' },
		}
	}
}