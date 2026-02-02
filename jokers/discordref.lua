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