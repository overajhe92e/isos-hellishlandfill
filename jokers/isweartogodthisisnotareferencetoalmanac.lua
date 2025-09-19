-- local quote = {
-- normal = {
--   k_ocstobal_oxy_quote1,
--   k_ocstobal_oxy_quote2,
--   k_ocstobal_oxy_quote3,
--   k_ocstobal_oxy_quote4
--}
--}

SMODS.Joker { --Oxy
    key = "Oxy",
    config = {
        extra = {
            blind_size = 2
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 16,
    rarity = "ocstobal_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 4,
        y = 0
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_ocstobal_dangerous'), G.C.BLACK, G.C.RED, 1.2 )
    end,

    loc_vars = function(self, info_queue, center)
        return {
            vars = { localize('k_ocstobal_oxy_quote' .. pseudorandom("seed", 1, 11)) },
            key = pseudorandom('seed',1,6) == 1 and "j_ocstobal_oxyrenamed"
        }
    end,

    update = function(self,card,dt)
        if next(SMODS.find_card("j_ocstobal_recluse")) then
            card:set_eternal(true)
        else
            card:set_eternal(false)
        end
    end,


    calculate = function(self, card, context)
        if context.setting_blind then
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                        { message = "X" .. tostring(card.ability.extra.blind_size) .. " Blind Size", colour = G.C.GREEN })
                    G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_size
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    G.HUD_blind:recalculate()
                    return true
                end
            }
        end
        --original code by nh6574
        if not G.jokers then return nil end

        local left_effect, right_effect = nil, nil

        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                local left_joker = G.jokers.cards[i - 1]
                local right_joker = G.jokers.cards[i + 1]

                if left_joker and left_joker ~= card and left_joker.config.center.blueprint_compat then
                    left_effect = SMODS.blueprint_effect(card, left_joker, context)
                end

                if right_joker and right_joker ~= card and right_joker.config.center.blueprint_compat then
                    right_effect = SMODS.blueprint_effect(card, right_joker, context)
                end
                break
            end
        end

        if left_effect or right_effect then
            local merged_effect = SMODS.merge_effects(
                { left_effect or {} },
                { right_effect or {} }
            )

            return merged_effect
        else
            return nil
        end

        -- local target_joker = nil

        -- local my_pos = nil
        -- for i = 1, #G.jokers.cards do
        --     if G.jokers.cards[i] == card then
        --         my_pos = i
        --         break
        --     end
        -- end
        -- target_joker = (my_pos and my_pos > 1) and G.jokers.cards[my_pos - 1] or nil

        -- local ret = SMODS.blueprint_effect(card, target_joker, context)
        -- if ret then
        --     SMODS.calculate_effect(ret, card)
        -- end

        -- local target_joker = nil

        -- local my_pos = nil
        -- for i = 1, #G.jokers.cards do
        --     if G.jokers.cards[i] == card then
        --         my_pos = i
        --         break
        --     end
        -- end
        -- target_joker = (my_pos and my_pos < #G.jokers.cards) and G.jokers.cards[my_pos + 1] or nil

        -- local ret = SMODS.blueprint_effect(card, target_joker, context)
        -- if ret then
        --     SMODS.calculate_effect(ret, card)
        -- end
    end
}

-- SMODS.Joker {
--     key = 'oxydeceit',
--     rarity = "ocstobal_unique",
--     cost = 100,

-- }