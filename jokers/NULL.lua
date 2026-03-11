local huh = {
    "*(Q#YH &())",
    ")M*UR#QEFJI",
    "?!)(_EFAPOI)",
    "!)(EQOFHJIO)",
    "_)@IUOJIJIJI",
    "N)( UQJDFAS)_",
    "?U(ADFIOHJAS)",
    "(@IOLJFAKNOJj)",
    "809ouFUHIQA0-"
}

SMODS.Joker {
    key = 'nil',
    cost = 666,
    rarity = "ocstobal_secret",
    atlas = "other_jokers",
    pos = { x = 0, y = 0 },
    update = function(self, card, dt)
        -- card.children.center:set_sprite_pos { x = pseudorandom("d", 0, 7), y = pseudorandom("e", 0, 3) }
    end,
    loc_vars = function(self, info_queue, card)
        return {
            main_end = {
                { n = G.UIT.O, config = { object = DynaText({ string = huh, colours = { G.C.DARK_EDITION }, pop_in_rate = 999999, silent = true, random_element = true, pop_delay = 0.1, scale = 0.32, min_cycle_time = 0 }) } },
            },
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                hyperchips = { pseudorandom("ohno", 1, 4), pseudorandom("ohno", 1, 1000) },
                hypermult = { pseudorandom("ohno", 1, 4), pseudorandom("ohno", 1, 1000) }
            }
        end
    end
}
