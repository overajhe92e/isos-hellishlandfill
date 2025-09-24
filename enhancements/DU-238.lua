SMODS.Enhancement {
    key = 'du238',
    config = {
        h_x_chips = 1.25,
        h_x_mult = 2.5
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.h_x_chips, card.ability.h_x_mult } }
    end
}
