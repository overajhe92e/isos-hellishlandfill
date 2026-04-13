SMODS.Joker { --Sparky
    key = "sparky",
    config = {
        extra = {
            chips_min = 1,
            chips_max = 75,
            mult_min = 1,
            mult_max = 35
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
    cost = 9,
    rarity = 2,
    atlas = 'triple_s',
    pools = { ["ocstob"] = true, ["all_junk"] = true },

    loc_vars = function(self, info_queue, card)
        local c = card.ability.extra
        return {
            vars = { localize('k_ocstobal_sparky_quote' .. pseudorandom("seed", 1, 4)), c.chips_min, c.chips_max, c.mult_min, c.mult_max },
            key = pseudorandom("closeenough", 1, 10) == 1 and "j_ocstobal_sparky_alt"
        }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            return {
                chips = pseudorandom('c', card.ability.extra.chips_min, card.ability.extra.chips_max),
                extra = {
                    mult = pseudorandom('m', card.ability.extra.mult_min, card.ability.extra.mult_max)
                }
            }
        end
    end
}

SMODS.Joker {
    key = 'lesbian',
    cost = 1,
    rarity = 1,
    atlas = "other_jokers",
    pos = { x = 4, y = 3 },
    config = {
        extra = {
            m = 0.1
        }
    },
    loc_vars = function(self, info_queue, card)
        local queens = 0
        if G.playing_cards then
            for _, cards in ipairs(G.playing_cards) do
                if cards:get_id() == 12 then
                    queens = queens + 1
                end
            end
        end
        return {
            vars = { 1 + card.ability.extra.m * queens, card.ability.extra.m }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local queens = 0
            for _, cards in ipairs(G.playing_cards) do
                if cards:get_id() == 12 then
                    queens = queens + 1
                end
            end
            return {
                xmult = 1 + card.ability.extra.m * queens
            }
        end
    end
}
