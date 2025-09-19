SMODS.Seal {
    key = 'recluseseye',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            retrigger_times = 3
        }
    },
    badge_colour = HEX('000000'),
   loc_txt = {
        name = 'Recluses Eye',
        label = 'Recluses Eye',
        text = {
        [1] = 'Retriggers scored card 3 times.'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.repetition and card.should_retrigger then
            return { repetitions = card.ability.seal.extra.retrigger_times }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = false
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 3
        end
    end
}