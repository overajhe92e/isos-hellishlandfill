SMODS.Joker {
    key = 'shrimpo',
    cost = 10,
    rarity = 3,
    atlas = 'friedshrimp',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    blueprint_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { localize('k_ocstobal_shrimpo_quote' .. pseudorandom("seed", 1, 3)) } }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            play_sound('timpani')
            G.GAME.blind.chips = math.floor(G.GAME.blind.chips - G.GAME.blind.chips * 0.75)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            return {
                message = 'I HATE THIS BLIND!!'
            }
        end
    end
}

SMODS.Joker {
    key = 'twistedshrimpo',
    cost = 30,
    rarity = 'ocstobal_unique',
    atlas = 'friedshrimp',
    pos = { x = 0, y = 1 },
    soul_pos = { x = 1, y = 1 },
    blueprint_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { localize('k_ocstobal_shrimpo_quote' .. pseudorandom("seed", 1, 3)) } }
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
            G.GAME.blind.chips = math.floor(G.GAME.blind.chips ^ 0.75)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            return {
                message = 'I hate you...'
            }
        end
    end
}

SMODS.Joker {
    key = 'yatta',
    rarity = 3,
    cost = 8,
    atlas = 'dw',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    loc_vars = function(self, info_queue, card)
        return { vars = { localize('k_ocstobal_yatta_quote' .. pseudorandom("seed", 1, 4)) } }
    end,
    blueprint_compat = true,
    no_collection = true,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'Spectral',
                                edition = 'e_negative'
                            }
                            SMODS.add_card {
                                set = 'Spectral',
                                edition = 'e_negative'
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('k_plus_tarot'), colour = G.C.PURPLE },
                        context.blueprint_card or card)
                    return true
                end)
            }))
            return nil, true -- This is for Joker retrigger purposes
        end
    end
}

-- SMODS.Joker {
--     key = 'gourdy',
--     rarity = 1,
--     cost = 2,
--     atlas = 'dw',
--     pos = { x = 0, y = 1 },
--     soul_pos = { x = 1, y = 1 },
-- }

SMODS.Joker {
    key = 'dw_astro',
    rarity = 4,
    cost = 30,
    atlas = 'dw',
    pos = { x = 2, y = 1 },
    soul_pos = { x = 3, y = 1 },
    config = {
        extra = {
            multi = 1
        }
    },
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        local planets_used = 0
        for k, v in pairs(G.GAME.consumeable_usage) do if v.set == 'Planet' then planets_used = planets_used + 1 end end
        return { vars = { card.ability.extra.multi, (planets_used+1) } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local planets_used = 0
                    for k, v in pairs(G.GAME.consumeable_usage) do
                        if v.set == 'Planet' then planets_used = planets_used + 1 end
                    end
                    ease_discard(G.GAME.current_round.discards_left * (planets_used + 1))
                    ease_hands_played(G.GAME.current_round.hands_left * (planets_used + 1))
                    SMODS.calculate_effect(
                        { message = '+X' .. tostring(planets_used+1) .. ' Hands & Discards' },
                        context.blueprint_card or card)
                    return true
                end
            }))
        end
    end
}
