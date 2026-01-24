SMODS.Joker {
    key = 'divinedominance',
    cost = 20,
    rarity = 'ocstobal_epic',
    config = {
        extra = {
            obliterated = 0,
            warning = 0,
            emult = 0
        }
    },
    no_collection = true,
    in_pool = function()
        return false
    end
}

SMODS.Joker {
    key = 'winsweep',
    cost = 300,
    atlas = 'placeholder',
    rarity = 'ocstobal_beyondexotic',
    calculate = function(self, card, context)
        if context.discard then
            G.GAME.chips = G.GAME.blind.chips
        end
    end
}
