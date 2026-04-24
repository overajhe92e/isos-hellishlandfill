SMODS.Sticker {
    key = 'oeternal',
    apply = function(self, card, val)
        card.ability[self.key] = val
        card.ability.fizz_fuck_no = true
        card:set_cost()
    end,
}

SMODS.Sticker {
    key = 'aeternal',
    apply = function(self, card, val)
        card.ability[self.key] = val
        card.ability.fizz_aeternal = true
        card:set_cost()
    end,
}

local et = SMODS.is_eternal
function SMODS.is_eternal(card, trigger)
    if card and type(card) == "table" then
        if card.ability.fizz_aeternal or card.ability.fizz_s_aeternal then
            return true
        end
        if card.ability.fizz_fuck_no or card.ability.fizz_s_oeternal then
            return true
        end
    end
    return et(card, trigger)
end