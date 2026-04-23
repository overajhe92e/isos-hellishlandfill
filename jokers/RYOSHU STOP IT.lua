SMODS.Scoring_Calculation({
    key = "muga",
    func = function(self, chips, mult, flames)
        return chips * mult
    end,
    parameters = { 'chips', 'mult' },
    replace_ui = function(self)
        local scale = 0.3
        return
        {
            {
                n = G.UIT.C,
                config = { align = 'cm', id = 'hand_chips' },
                nodes = {
                    SMODS.GUI.score_container({
                        type = 'chips',
                        text = '?',
                        align = 'cm',
                        w = 1.2,
                        scale = scale
                    })
                }
            },
            SMODS.GUI.operator(scale * 0.75),
            {
                n = G.UIT.C,
                config = { align = 'cm', id = 'hand_mult' },
                nodes = {
                    SMODS.GUI.score_container({
                        type = 'mult',
                        text = '?',
                        align = 'cm',
                        w = 1.2,
                        scale = scale
                    })
                }
            }
        }
    end
})

SMODS.Joker {
    key = "muga",
    cost = 12,
    rarity = 3,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.iso_hide_score = true
    end,
    remove_from_deck = function(self, card, from_debuff)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = 2.5
            }
        end
    end
}