SMODS.Joker {
    key = 'porky',
    rarity = 'ocstobal_unique',
    cost = 735,
    no_collection = true
}

SMODS.Joker {
    key = "giygas",
    rarity = 'ocstobal_cursed',
    cost = 0,
    no_collection = true
}

SMODS.Joker {
    key = "absolutely_safe_capsule",
    rarity = 1,
    cost = 5,
    add_to_deck = function(self,card)
        card:set_eternal(true)
        G.GAME.ASC_active = true
    end
}