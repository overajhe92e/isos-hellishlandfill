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
                card.ability.extra.other_ocs
            }
        end
    end
}