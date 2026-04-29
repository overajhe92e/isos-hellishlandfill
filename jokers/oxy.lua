SMODS.Joker { --Original Character by ocksie
    key = "oxy",
    rarity = "fizz_apoc",
    cost = 16,
    atlas = "apocleg",
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = {
            retrig = 0,
            base_retrig = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        local c = card.ability.extra
        return {
            vars = { c.retrig, c.base_retrig, c.base_retrig + c.retrig }
        }
    end,
    calculate = function(self, card, context)
        local c = card.ability.extra
        if context.repetition and context.cardarea == G.hand then
            if context.other_card.ability.name == 'Steel Card' then
                return {
                    repetitions = c.base_retrig + c.retrig
                }
            end
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card.ability.name == 'Steel Card' then
                c.retrig = c.retrig + 1
                return {
                    message = "+1 Retrigger",
                    colour = G.C.PINK,
                    card = card
                }, true
            end
        end
        if context.end_of_round and context.main_eval and context.game_over == false then
            c.retrig = 0
            return {
                message = "Reset!",
                colour = G.C.PINK,
                card = card
            }
        end
    end
}
