SMODS.Joker { --Tiger Shark Sparky
    key = "tigersharksparky",
    config = {
        extra = {
            chip = 1.5,
            mult = 2,
            odds = 6
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 25,
    rarity = "ocstobal_unique",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 8,
        y = 1
    },
    in_pool = function(self, args)
        return (
                not args
                or args.source ~= 'sho'
                or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
            )
            and true
    end,

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,
            'j_ocstobal_tigersharksparky')
        return { vars = { card.ability.extra.chip, card.ability.extra.mult, new_numerator, new_denominator } }
    end,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play then
            context.other_card.should_destroy = false
            if true then
                return {
                    x_chips = card.ability.extra.chip,
                    extra = {
                        Xmult = card.ability.extra.mult
                    }
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_cdf6ff1d', 1, card.ability.extra.odds, 'j_ocstobal_tigersharksparky') then
                            context.other_card.should_destroy = true
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                                { message = "Nom.", colour = G.C.RED })
                        end
                        return true
                    end
                }
            end
        end
    end
}

-- SMODS.Joker {
--     key = 'sharkbait',
--     config = {
--         set_probability = 1,
--         set_probability2 = 1000
--     },
--     pos = { x = 0, y = 0 },
--     cost = 3,
--     rarity = 1,
--     blueprint_compat = false,
--     eternal_compat = true,
--     perishable_compat = true,
--     unlocked = true,
--     discovered = true,
--     --atlas = 'baited',
--     soul_pos = {
--         x = 1,
--         y = 0
--     }
-- }
