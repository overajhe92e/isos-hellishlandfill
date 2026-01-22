-- SMODS.Joker {
--     key = 'psi_hypnosis',
--     cost = 1,
--     rarity = 3,
--     no_collection = true
-- }

-- SMODS.Joker {
--     key = 'psi_paralysis',
--     cost = 1,
--     rarity = 3,
--     no_collection = true
-- }

-- SMODS.Joker {
--     key = 'psi_brainshock',
--     cost = 1,
--     rarity = 4,
--     no_collection = true
-- }
--uncomment these when you know what you're doing

SMODS.Joker {
    key = 'pk_ground',
    cost = 1,
    rarity = 'ocstobal_beyondexotic',
    atlas = 'pkground',
    config = {
        extra = {
            probability = 4,
        }
    },
    loc_vars = function(self, info_queue, card)
        local numerator_1, denominator_1 = SMODS.get_probability_vars(card, 1, card.ability.extra.probability,'j_ocstobal_pk_ground')
        return {
            vars = { 
                numerator_1, denominator_1
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if SMODS.pseudorandom_probability(card, 'thefunny', 1, card.ability.extra.probability, 'j_ocstobal_pk_ground') then
                G.GAME.chips = G.GAME.chips + math.floor(((G.GAME.blind.chips / 100)*90))
                return {
                    message = "+" .. tostring(math.floor((G.GAME.blind.chips / 100)*90)) .. " Score",
                    colour = G.C.WHITE
                }
            else
                G.GAME.chips = G.GAME.chips + math.floor(((G.GAME.blind.chips / 100)*15))
                return {
                    message = "+" .. tostring(math.floor((G.GAME.blind.chips / 100)*15)) .. " Score",
                    colour = G.C.WHITE
                }
            end
        end
    end,
}

-- SMODS.Joker {
--     key = 'pk_flash',
--     cost = 1,
--     rarity = 2,
--     no_collection = true
-- }
--dont forget this later
