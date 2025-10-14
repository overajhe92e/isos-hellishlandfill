SMODS.Joker {
    key = 'fakeseraph',
    cost = 11,
    rarity = 3,
    add_to_deck = function(self,card)
        SMODS.add_card{key='j_ocstobal_somethingevil'}
        SMODS.destroy_cards(card,nil,nil,true)
    end
}