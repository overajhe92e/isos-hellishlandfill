-- SMODS.Joker {
--     key = "oxhatred",
--     config = {},
--     atlas = 'agonizing',
--     pos = {
--         x = 0,
--         y = 0
--     },
--     cost = 0,
--     rarity = "ocstobal_absolute_curse",
--     unlocked = true,
--     discovered = true,
--     soul_pos = {
--         x = 1,
--         y = 0
--     },

--     set_ability = function(self, card, initial)
--         card:set_edition("e_ocstobal_hidden1", true)
--         card:set_eternal(true)
--     end,

--     calculate = function(self, card, context)
--         if context.joker_main then
--             return {
--                 message = 'Die.',
--                 Emult_mod = 0.85,
--                 Echip_mod = 0.85
--             }
--         end
--     end
-- }

SMODS.Joker {
    key = "somethingevil",
    config = {},
    atlas = 'starry',
    pos = {
        x = 0,
        y = 0
    },
    cost = 0,
    rarity = "ocstobal_absolute_curse",
    unlocked = true,
    discovered = false,
    soul_pos = {
        x = 1,
        y = 0,
        draw = function(card, scale_mod, rotate_mod)
            card.hover_tilt = card.hover_tilt * 1.5
            card.children.floating_sprite:draw_shader('polychrome', nil, card.ARGS.send_to_shader, nil,
                card.children.center, 2 * scale_mod, 2 * rotate_mod)
            card.hover_tilt = card.hover_tilt / 1.5
        end
    },

    add_to_deck = function(self,card,from_debuff)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card) -- yeah this was buggy asf lmao
        -- info_queue[#info_queue + 1] = G.P_CENTERS.k_ocstobal_reclusedownside
        -- info_queue[#info_queue + 1] = G.P_CENTERS.k_ocstobal_sharkdownside
        -- -- info_queue[#info_queue + 1] = G.P_CENTERS.k_ocstobal_oxydownside
        -- info_queue[#info_queue + 1] = G.P_CENTERS.j_ocstobal_oxhatred
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                message = 'evil',
                Emult_mod = 0.7,
                Echip_mod = 0.7
            }
        end
    end
}
