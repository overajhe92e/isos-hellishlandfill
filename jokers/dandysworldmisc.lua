SMODS.Joker {
    key = 'ichor',
    cost = '12',
    rarity = 3,
    config = {
        extra = {
            dollars = 8
        }
    },
    atlas = 'ichor',
    pos = {x=0,y=0},
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
}