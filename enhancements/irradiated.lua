SMODS.Enhancement {
    key = 'irradiated',
    config = {
        h_x_chips = 0.9,
        h_x_mult = 0.9,
        decayfactor = 5
    },
    atlas = 'radiationset',
    pos = {x=1,y=0},


    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.decayfactor, card.ability.h_x_chips, card.ability.h_x_mult } }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.hand and card.ability.decayfactor > 0 and context.main_scoring then
            card.ability.decayfactor = card.ability.decayfactor - 1
        end
        if context.cardarea == G.hand and card.ability.decayfactor <= 0 then
            card:set_ability('m_ocstobal_du238')
        end
    end
}
