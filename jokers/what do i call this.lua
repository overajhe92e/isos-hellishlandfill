SMODS.Joker {
    key = "overscore_award_hands",
    rarity = 3,
    cost = 12,
    config = {
        extra = {
            hand = 1,
            over_gain = 1,
        }
    },
    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                card.ability.extra.hand, card.ability.extra.over_gain
            }
        }
    end,
    calcualte = function(self,card,context)
        if context.setting_blind then
            return {
                message = "PLACEHOLDER"
            }
        end
    end
}