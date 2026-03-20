SMODS.Joker {
    key = 'ichor',
    cost = 12,
    rarity = 3,
    config = {
        extra = {
            dollars = 8
        }
    },
    atlas = 'dw',
    pos = { x = 0, y = 2 },
    pools = {
        ["ocstob"] = true,
        ["all_junk"] = true
    },
    loc_vars = function(self, info_queue, card)
        local c = card.ability.extra
        local d = c.dollars
        local dw = 0
        if G.jokers then
            for k, v in ipairs(G.jokers.cards) do
                if v.config.center.pools and v.config.center.pools.dandy then
                    dw = dw + 1
                end
            end
            return {
                vars = {
                    d, (d * (dw + 1))
                }
            }
        else
            return {
                vars = {
                    d, (d * (dw + 1))
                }
            }
        end
    end,
    calc_dollar_bonus = function(self, card)
        local dw = 0
        for k, v in ipairs(G.jokers.cards) do
            if v.config.center and v.config.center.pools.dandy then
                dw = dw + 1
            end
        end
        return card.ability.extra.dollars * (dw + 1)
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
    pools = {
        ["ocstob"] = true,
        ["all_junk"] = true
    },
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval then
            card:set_debuff(true)
            return {
                message = "Nope!"
            }
        end
    end
}
