SMODS.Joker { --dude's gonna get mauled in 3 seconds
    key = "oxidyze",
    cost = 20,
    rarity = 4,
    atlas = "apocleg",
    pos = {
        x = 2,
        y = 0
    },
    soul_pos = {
        x = 3,
        y = 0
    },
    calculate = function(self, card, context)
        if not G.jokers then return nil end

        local e

        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                e = i
                break
            end
        end

        local l = SMODS.blueprint_effect(card, G.jokers.cards[e - 1], context)
        local r = SMODS.blueprint_effect(card, G.jokers.cards[e + 1], context)

        return SMODS.merge_effects { l or {}, r or {} }

    end
}
