SMODS.Joker {
    key = 'crystal',
    cost = 10,
    rarity = 'ocstobal_epic',
    atlas = 'crystal',
    pos = { x = 0, y = 0 },
    blueprint_compat = true,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_ocstobal_dangerous'), G.C.FILTER, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if not G.jokers then return nil end

        local right_effect_1, right_effect_2, right_effect_3 = nil, nil, nil

        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                local right_joker_1 = G.jokers.cards[i + 1]
                local right_joker_2 = G.jokers.cards[i + 2]
                local right_joker_3 = G.jokers.cards[i + 3]

                if right_joker_1 and right_joker_1 ~= card and right_joker_1.config.center.blueprint_compat then
                    right_effect_1 = SMODS.blueprint_effect(card, right_joker_1, context)
                end

                if right_joker_2 and right_joker_2 ~= card and right_joker_2.config.center.blueprint_compat then
                    right_effect_2 = SMODS.blueprint_effect(card, right_joker_2, context)
                end

                if right_joker_3 and right_joker_3 ~= card and right_joker_3.config.center.blueprint_compat then
                    right_effect_3 = SMODS.blueprint_effect(card, right_joker_3, context)
                end
                break
            end
        end

        if right_effect_1 or right_effect_2 or right_effect_3 then
            local merged_effect = SMODS.merge_effects(
                { right_effect_1 or {} },
                { right_effect_2 or {} },
                { right_effect_3 or {} }
            )

            return merged_effect
        else
            return nil
        end
    end
}

SMODS.Joker {
    key = 'astro',
    cost = 20,
    rarity = 'ocstobal_epic',
    blueprint_compat = true,
    -- atlas = 'johntetration',
    -- pos = {x=0,y=0},
    -- soul_pos = {x=1,y=0},
    config = {
        extra = {
            eechips = 1,
            suit = 'Spades'
        }
    },
    no_collection = false,

    in_pool = function(self, args)
        return unbalancedstuff()
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.eechips } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                eechips = card.ability.extra.eechips
            }
        end
        if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) and not context.blueprint then
            card.ability.extra.eechips = card.ability.extra.eechips + 1
            return {
                message = 'Upgraded!'
            }
        end
    end
}
