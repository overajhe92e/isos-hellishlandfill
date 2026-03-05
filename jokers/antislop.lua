SMODS.Joker {
    key = 'antislopinator',
    cost = 1,
    rarity = 1,
    atlas = 'other_jokers',
    pos = { x = 1, y = 0 },
    pools = {
        ["ocstob"] = true,
        ["all_junk"] = true
    },
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 3
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 3
    end,
    calculate = function(self, card, context)
        if context.after and not context.blueprint then 
            local c = hand_chips
            local mult = mult
            if c*mult >= 1e308 then
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 1 * G.SETTINGS.GAMESPEED,
                    func = function()
                        check_for_unlock({ type = "ach_murphy" })
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 1 * G.SETTINGS.GAMESPEED,
                    func = function()
                        forceGameover()
                        return true
                    end
                }))
            end
        end
    end
}

SMODS.Joker {
    key = 'evilantislopinator',
    cost = 1,
    rarity = 'ocstobal_challengeexclusive',
    config = {
        emult = 2,
        scale = 2,
        reduce = 8
    },
    no_collection = true,
    atlas = 'other_jokers',
    pos = { x = 2, y = 0 },
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.emult, card.ability.scale } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
        card:set_eternal(true)
    end,
    remove_from_deck = function(self, card, from_debuff)
        forceGameover()
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.emult = card.ability.emult * card.ability.scale
            return {
                emult = card.ability.emult,
            }
        end
        if context.skip_blind then
            card.ability.scale = card.ability.scale * card.ability.scale
            card.ability.emult = card.ability.emult * card.ability.scale
            return {
                message = { "X" .. tostring(card.ability.scale) .. " EMult, fuck you." }
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
            card.ability.emult = card.ability.emult / card.ability.reduce
            return {
                message = 'Scaled Down!'
            }
        end
        if context.after and not context.blueprint then 
            local c = hand_chips
            local m = mult
            if c*m >= 1e308 then
                forceGameover()
            end
        end
    end
}