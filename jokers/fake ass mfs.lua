SMODS.Joker {
    key = 'fakeseraph',
    cost = 11,
    rarity = 3,
    pos = {
        x = 0,
        y = 0
    },
    atlas = 'sphredo',
    soul_pos = {
        x = 1,
        y = 0
    },
    no_collection = true,
    add_to_deck = function(self, card)
        SMODS.add_card { key = 'j_ocstobal_somethingevil' }
        SMODS.destroy_cards(card, nil, nil, true)
    end
}
