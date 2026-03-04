local function ocksie_check()
    local ocksie = { "j_ocstobal_ocksie", "j_jen_oxy", "j_bunny_oxy" }
    for k, v in ipairs(ocksie) do
        if next(SMODS.find_card(v)) then
            return true
        end
    end
end

SMODS.Joker { --Oxy (Oxidyze)
    key = "Oxy",
    config = {
        extra = {
            clash_win = 3,
            clash_denom = 6
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    cost = 16,
    rarity = "ocstobal_epic",
    atlas = 'other_ocs',
    soul_pos = {
        x = 3,
        y = 1
    },
    pools = {
        ["copycats"] = true,
        ["ocstob"] = true
    },

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_ocstobal_dangerous'), G.C.FILTER, G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, center)
        return {
            vars = { localize('k_ocstobal_oxy_quote' .. pseudorandom("seed", 1, 13)), localize('k_ocstobal_oxy_quote_alt_' .. pseudorandom("couldn't hold back huh", 1, 6)) },
            key =
                ocksie_check() and "j_ocstobal_oxi_alt_quotes"
                or pseudorandom("h", 1, 6) == 1 and "j_ocstobal_oxi_oldname" --here we go again
                or pseudorandom("b", 1, 12) == 1 and
                "j_ocstobal_oxi_get_trolled_lmfao"                           --1 in 12 chance to be named to "ocksie"
                or ISO_POLTERWORX == true and "j_ocstobal_oxi_pwx"
        }
    end,

    update = function(self, card, dt)
        if next(SMODS.find_card("j_ocstobal_recluse")) then
            card:set_eternal(true)
        else
            card:set_eternal(false)
        end
    end,


    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.06 * G.SETTINGS.GAMESPEED,
                blockable = false,
                blocking = false,
                func = function()
                    play_sound('tarot2', 0.76, 0.4)
                    return true
                end
            }))
            play_sound('tarot2', 1, 2)
            G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 2)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            return {
                message = "X2 Blind Size"
            }
        end
        --original code by nh6574
        if not G.jokers then return nil end

        local left_effect, right_effect = nil, nil
        local okcsie = { "j_ocstobal_ocksie", "j_jen_oxy", "j_bunny_oxy" }

        for i = 1, #G.jokers.cards do
            for k, v in ipairs(okcsie) do
                if G.jokers.cards[i] == card then
                    local left_joker = G.jokers.cards[i - 1]
                    local right_joker = G.jokers.cards[i + 1]

                    if left_joker and left_joker ~= card and left_joker.config.center.blueprint_compat and left_joker.config.center.key ~= okcsie then
                        left_effect = SMODS.blueprint_effect(card, left_joker, context)
                    end

                    if right_joker and right_joker ~= card and right_joker.config.center.blueprint_compat and right_joker.config.center.key ~= okcsie then
                        right_effect = SMODS.blueprint_effect(card, right_joker, context)
                    end
                    break
                end
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
    end
}

SMODS.Joker {
    key = "oxyemp",
    rarity = "ocstobal_unique",
    cost = 50,
    config = {
        extra = {
            blind_size = 4
        }
    },
    atlas = "other_ocs",
    pos = { x = 6, y = 1 },
    soul_pos = { x = 7, y = 1 }, --NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
    blueprint_compat = true,

    loc_vars = function(self, info_queue, center)
        return {
        }
    end,

    pools = {
        ["all_junk"] = true
    },

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_ocstobal_veryunstable'), G.C.BLACK, G.C.RED, 1)
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.06 * G.SETTINGS.GAMESPEED,
                blockable = false,
                blocking = false,
                func = function()
                    play_sound('tarot2', 0.76, 0.4)
                    return true
                end
            }))
            play_sound('tarot2', 1, 2)
            G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 4)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            return {
                message = "X4 Blind Size"
            }
        end
        local left_effect, right_effect, right_effect_ex, left_effect_ex = nil, nil, nil, nil

        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                local left_joker = G.jokers.cards[i - 1]
                local right_joker = G.jokers.cards[i + 1]
                local left_joker_ex = G.jokers.cards[i - 2]
                local right_joker_ex = G.jokers.cards[i + 2]

                if left_joker and left_joker ~= card and left_joker.config.center.blueprint_compat then
                    left_effect = SMODS.blueprint_effect(card, left_joker, context)
                end

                if right_joker and right_joker ~= card and right_joker.config.center.blueprint_compat then
                    right_effect = SMODS.blueprint_effect(card, right_joker, context)
                end

                if left_joker_ex and left_joker_ex ~= card and left_joker_ex.config.center.blueprint_compat then
                    left_effect_ex = SMODS.blueprint_effect(card, left_joker_ex, context)
                end

                if right_joker_ex and right_joker_ex ~= card and right_joker_ex.config.center.blueprint_compat then
                    right_effect_ex = SMODS.blueprint_effect(card, right_joker_ex, context)
                end
                break
            end
        end

        if left_effect or right_effect or left_effect_ex or right_effect_ex then
            local merged_effect = SMODS.merge_effects(
                { left_effect or {} },
                { right_effect or {} },
                { left_effect_ex or {} },
                { right_effect_ex or {} }
            )

            return merged_effect
        else
            return nil
        end
    end


}

SMODS.Joker {
    key = 'oxywaterdroplet',
    cost = 15,
    rarity = 3,
    atlas = "other_jokers",
    pos = { x = 2, y = 1 },
    soul_pos = { x = 3, y = 1 },
    blueprint_compat = true,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = 2
            }
        end
    end
}

-- SMODS.Joker {
--     key = 'oxydeceit',
--     rarity = "ocstobal_deceptionlegendary",
--     cost = 100,
--     blueprint_compat = true,
--     config = {
--         extra = {
--             blind_size = 8
--         }
--     },
--     no_collection = true,

--     calculate = function(self, card, context)
--         if context.setting_blind then
--             return {
--                 func = function()
--                     card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
--                         { message = "X" .. tostring(card.ability.extra.blind_size) .. " Blind Size", colour = G.C.GREEN })
--                     G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_size
--                     G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
--                     G.HUD_blind:recalculate()
--                     return true
--                 end
--             }
--         end

--         if context.retrigger_joker_check then
--             return { repetitions = 1 }
--         end


--         local left_effect, right_effect, right_effect_ex, left_effect_ex, right_effect_ex2, left_effect_ex2 = nil, nil,
--         nil, nil, nil, nil

--         for i = 1, #G.jokers.cards do
--             if G.jokers.cards[i] == card then
--                 local left_joker = G.jokers.cards[i - 1]
--                 local right_joker = G.jokers.cards[i + 1]
--                 local left_joker_ex = G.jokers.cards[i - 2]
--                 local right_joker_ex = G.jokers.cards[i + 2]
--                 local right_joker_ex2 = G.jokers.cards[i + 3]
--                 local left_joker_ex2 = G.jokers.cards[i - 3]

--                 if left_joker and left_joker ~= card and left_joker.config.center.blueprint_compat then
--                     left_effect = SMODS.blueprint_effect(card, left_joker, context)
--                 end

--                 if right_joker and right_joker ~= card and right_joker.config.center.blueprint_compat then
--                     right_effect = SMODS.blueprint_effect(card, right_joker, context)
--                 end

--                 if left_joker_ex and left_joker_ex ~= card and left_joker_ex.config.center.blueprint_compat then
--                     left_effect_ex = SMODS.blueprint_effect(card, left_joker_ex, context)
--                 end

--                 if right_joker_ex and right_joker_ex ~= card and right_joker_ex.config.center.blueprint_compat then
--                     right_effect_ex = SMODS.blueprint_effect(card, right_joker_ex, context)
--                 end

--                 if left_joker_ex2 and left_joker_ex2 ~= card and left_joker_ex2.config.center.blueprint_compat then
--                     left_effect_ex2 = SMODS.blueprint_effect(card, left_joker_ex2, context)
--                 end

--                 if right_joker_ex2 and right_joker_ex2 ~= card and right_joker_ex2.config.center.blueprint_compat then
--                     right_effect_ex2 = SMODS.blueprint_effect(card, right_joker_ex2, context)
--                 end
--                 break
--             end
--         end

--         if left_effect or right_effect or left_effect_ex or right_effect_ex or left_effect_ex2 or right_effect_ex2 then
--             local merged_effect = SMODS.merge_effects(
--                 { left_effect or {} },
--                 { right_effect or {} },
--                 { left_effect_ex or {} },
--                 { right_effect_ex or {} },
--                 { right_effect_ex2 or {} },
--                 { left_effect_ex2 or {} }
--             )

--             return merged_effect
--         else
--             return nil
--         end
--     end
-- }
