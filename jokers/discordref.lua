SMODS.Joker {
    key = 'moddingchat',
    cost = 1,
    rarity = 1,
    config = {
        extra = {
            dayswithoutissue = 0
        }
    },

    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                card.ability.extra.dayswithoutissue
            }
        }
    end,
    
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                Xmult = card.ability.extra.dayswithoutissue
            }
        end
    end
}