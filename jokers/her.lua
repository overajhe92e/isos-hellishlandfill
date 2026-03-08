SMODS.Joker { --HER.
    key = "ocksie",
    rarity = 3,
    cost = 1,
    config = {
        extra = {
            retrig = 1,
            clash_win = 3,
            clash_denom = 6
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.retrig, localize('k_ocstobal_ocksie_quote_' .. pseudorandom("seed", 1, 2)), } }
    end,
    atlas = "other_ocs",
    pos = { x = 4, y = 1 },
    soul_pos = { x = 5, y = 1 },
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.hand then
            if context.other_card.ability.name == 'Steel Card' then
                return {
                    repetitions = card.ability.extra.retrig
                }
            end
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card.ability.name == 'Steel Card' then
                card.ability.extra.retrig = card.ability.extra.retrig + 1
                return {
                    message = "+1 Retrigger",
                    colour = G.C.PINK,
                    card = card
                }, true
            end
        end
    end
}
