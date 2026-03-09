SMODS.Joker {
    key = "OVERSCORE",
    rarity = 3,
    cost = 12,
    config = {
        extra = {
            hand = 1,
            discard = 1,
            chip = 10,
            mult = 5,
            ch_mu = 1,
            req = 2
        }
    },
    atlas = "other_jokers",
    pos = {
        x = 6,
        y = 3
    },
    loc_vars = function(self,info_queue,card)
        local c = card.ability.extra
        return {
            vars = {
                c.hand, c.discard, c.chip, c.mult, c.ch_mu, c.req
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