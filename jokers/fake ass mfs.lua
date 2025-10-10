SMODS.Joker {
    key = 'fakeseraph',
    cost = 11,
    rarity = 3,
    add_to_deck = function(self)
        SMODS.add_card{key='j_ocstobal_somethingevil'}
        Card:shatter(self)
        attention_text = ({text = 'Faked!'})
    end
}