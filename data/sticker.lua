SMODS.Sticker {
    key = 'oeternal',
    apply = function(self, card, val)
        card.ability[self.key] = val
        card.ability.ocstobal_fuck_no = true
        card:set_cost()
    end,
}

SMODS.Sticker {
    key = 'aeternal',
    apply = function(self, card, val)
        card.ability[self.key] = val
        card.ability.ocstobal_aeternal = true
        card:set_cost()
    end,
}