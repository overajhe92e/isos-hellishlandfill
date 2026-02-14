SMODS.Joker { --Broken Seraph
    key = "brokenseraph",
    config = {
        extra = {
            multchip = 5,
            var1 = 0
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 6,
    rarity = 'ocstobal_cursed',
    blueprint_compat = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 1,
        y = 0
    },
    in_pool = function(self, args)
        return false
    end,
    pools = {
        ["all_junk"] = true
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.multchip, localize('k_ocstobal_seraphbroken_quote' .. pseudorandom("seed", 1, 4)) } }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            return {
                Xmult = card.ability.extra.multchip
            }
        end
        if context.individual and context.cardarea == G.play then
            if (card.ability.extra.multchip or 0) >= 0.1 then
                card.ability.extra.multchip = math.max(0, (card.ability.extra.multchip) - 0.1)
            elseif (card.ability.extra.var1 or 0) <= 0 then
                return {
                    func = function()
                        card:start_dissolve()
                        return true
                    end,
                    message = "Shattered!"
                }
            end
        end
    end
}
