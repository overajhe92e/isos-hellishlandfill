SMODS.Seal {
    key = 'recluseseye',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            retrigger_times = 3
        }
    },
    badge_colour = HEX('000000'),
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.repetition then
            return { repetitions = card.ability.seal.extra.retrigger_times }
        end
    end
}
