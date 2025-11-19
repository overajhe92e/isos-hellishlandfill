SMODS.Joker {
    key = 'moddingchat',
    cost = 1,
    rarity = 2,
    config = {
        extra = {
            dayswithoutissue = -1e100
        }
    },
    atlas = 'moddingchat',
    pos = {x=0,y=0},

    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                lenient_bignum(card.ability.extra.dayswithoutissue)
            }
        }
    end,
    
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                Xmult = lenient_bignum(card.ability.extra.dayswithoutissue)
            }
        end
    end
}