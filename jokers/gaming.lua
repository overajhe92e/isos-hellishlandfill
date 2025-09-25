SMODS.Joker {
    key = 'steelgaming',
    cost = 10,
    rarity = 3,
    blueprint_compat = false,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_steel') then
            return {
                xmult = 1.5,
                xchips = 1.5
            }
        end
    end
}