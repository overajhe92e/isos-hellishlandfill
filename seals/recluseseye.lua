SMODS.Seal {
    key = 'recluses_eye',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            retrig = 2
        }
    },
    badge_colour = HEX('000000'),
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.repetition then
            return { repetitions = card.ability.seal.extra.retrig }
        end
    end
}
