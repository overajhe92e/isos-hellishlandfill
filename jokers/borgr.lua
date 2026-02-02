SMODS.Joker {
    key = 'burgr',
    cost = 10,
    rarity = 3,
    atlas = 'other_jokers',
    pos = {x=5,y=1},
    calculate = function(self, card, context)
        if context.setting_blind then
            if SMODS.pseudorandom_probability(card, "ocstobal_unstable", 1, 8) then
                G.burger = 1
                G.GAME.chips = G.GAME.blind.chips - 1
                play_sound("ocstobal_jumpscare", 1, 1)
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 3 * G.SETTINGS.GAMESPEED,
                    func = function()
                        G.burger = 0
                        burger()
                        return true
                    end
                }))
                return true
            end
        end
    end
}
