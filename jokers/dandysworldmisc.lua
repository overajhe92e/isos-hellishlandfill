SMODS.Joker {
    key = 'ichor',
    cost = '12',
    rarity = 3,
    config = {
        extra = {
            dollars = 8
        }
    },
    atlas = 'dw',
    pos = {x=0,y=2},
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
}

SMODS.Joker {
    key = 'fancy_purse',
    cost = 1,
    rarity = 1,
    config = {
        extra = {
            fuck_you = 100
        }
    },
    atlas = 'placeholder',
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.fuck_you
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.main_eval then
            card:set_debuff(true)
            return {
                message = "Nope!"
            }
        end
    end
}