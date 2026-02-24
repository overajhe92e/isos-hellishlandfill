SMODS.Joker {
    key = 'moddingchat',
    cost = 1,
    rarity = 2,
    config = {
        extra = {
            other_ocs = 3
        }
    },
    atlas = 'other_jokers',
    pools = {["ocstob"] = true, ["all_junk"] = true},
    pos = {x=3,y=0},

    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                card.ability.extra.other_ocs
            }
        }
    end,
    
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.other_ocs
            }
        end
    end
}

SMODS.Joker {
    key = 'starspacechat',
    cost = 5000,
    rarity = "ocstobal_omega",
    config = {
        extra = {
            retrig = 1000,
            mult = 2,
            hyperop = 2
        }
    },
    atlas = 'other_jokers',
    pools = {["ocstob"] = true, ["all_junk"] = true},
    pos = {x=0,y=3},

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { set = "Other", key = "ocstobal_98percent", vars = { card.ability.extra.retrig, card.ability.extra.hyperop, card.ability.extra.mult, "{", "}" } }
        return {
            vars = {
                card.ability.extra.mult, card.ability.extra.hyperop, card.ability.extra.retrig, "{", "}", "#",
            }
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            card.ability.extra.hyperop = card.ability.extra.hyperop + 1
            card.ability.extra.mult = card.ability.extra.mult + 1
            return {
                hypermult = {card.ability.extra.hyperop, card.ability.extra.mult}
            }
        end
        if context.retrigger_joker_check and context.other_card == card then
            return {
                remove_default_message = true,
                repetitions = card.ability.extra.retrig
            }
        end
    end
}

SMODS.Joker {
    key = "neveragain",
    cost = 1,
    rarity = 1,
    jf = true,
    loc_vars = function(self,info_queue,card)
        return {
            key = G.ISO_jf == true and "j_ocstobal_neveragain_clicked" or nil
        }
    end,
}

SMODS.Joker {
    key = "a_fucking_gun",
    cost = 20,
    rarity = 3,
    atlas = "other_jokers",
    pos = {x=1,y=3},
    soul_pos = {x=2,y=3}
}