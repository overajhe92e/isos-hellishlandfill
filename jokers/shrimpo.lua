SMODS.Joker {
    key = 'shrimpo',
    cost = '10',
    rarity = 3,
    atlas = 'friedshrimp',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },

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
    cost = '30',
    rarity = 'ocstobal_unique',
    atlas = 'twistedshrimp',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },

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
