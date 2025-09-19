SMODS.Enhancement {
    key = 'darkglass',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            x_mult = 3,
            x_chips = 1.25,
            odds = 8
        }
    },
    loc_txt = {
        name = 'Dark Glass',
        text = {
        [1] = '{X:red,C:white}x3{} Mult and {X:blue,C:white}x1.25{} Chips.',
        [2] = '{C:green}1 in 8{} chance of breaking.'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    shatters = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            if SMODS.pseudorandom_probability(card, 'group_0_89ad0c58', 1, card.ability.extra.odds, 'm_ocstobal') then
                card.glass_trigger = true
            card.should_destroy = true
            end
            return { x_mult = card.ability.extra.x_mult, x_chips = card.ability.extra.x_chips }
        end
    end
}