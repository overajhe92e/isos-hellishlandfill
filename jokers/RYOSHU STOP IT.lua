SMODS.Joker {
    key = "muga",
    cost = 12,
    rarity = 3,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.iso_hide_score = true
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.iso_hide_score = false
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = 2.5
            }
        end
    end
}