SMODS.Joker {
    key = 'sword_of_kings',
    rarity = 'ocstobal_unique',
    cost = 735,
    calculate = function(self, card, context)
        if context.setting_blind then
            if SMODS.pseudorandom_probability(card, "sok_win", 2, 5, true) then
                G.E_MANAGER:add_event(Event({
                    blocking = false,
                    func = function()
                        if G.STATE == G.STATES.SELECTING_HAND then
                            G.GAME.chips = G.GAME.blind.chips
                            G.STATE = G.STATES.HAND_PLAYED
                            G.STATE_COMPLETE = true
                            end_round()
                            return true
                        end
                    end
                }))
            end
        end
        if context.joker_main then
            return {
                xmult = 3
            }
        end
    end
}
