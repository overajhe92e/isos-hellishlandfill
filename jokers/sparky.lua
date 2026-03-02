SMODS.Joker { --Sparky
    key = "sparky",
    config = {
        extra = {
            chips_min = 1,
            chips_max = 111,
            mult_min = 1,
            mult_max = 111
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
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'triple_s',
    pools = {["ocstob"] = true,["all_junk"] = true},

    loc_vars = function(self, info_queue, center)
        return {
            vars = { localize('k_ocstobal_sparky_quote' .. pseudorandom("seed", 1, 4)) },
            key = pseudorandom("closeenough",1,10) == 1 and "j_ocstobal_sparky_alt"
        }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            return {
                chips = pseudorandom('chips_56647474', card.ability.extra.chips_min, card.ability.extra.chips_max),
                extra = {
                    mult = pseudorandom('mult_6e0a705c', card.ability.extra.mult_min, card.ability.extra.mult_max)
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
    pos = {x=4,y=3}
}