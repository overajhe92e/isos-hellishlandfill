SMODS.Shader({key = 'hate',path = 'hate.fs'})

SMODS.Shader ({key = 'darkfoil', path = 'darkfoil.fs'})

SMODS.Edition {
    key = 'hidden1',
    shader = "hate",
    config = { card_limit = -1},
    weight = 0,
    in_shop = false,
    sound = { sound = 'negative', vol = 1.5, per = 0.66 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.card_limit } }
    end,
    get_weight = function(self)
        return self.weight
    end,
}

SMODS.Edition {
    key = 'hidden2',
    shader = 'fluorescent',
    config = {
        { card_limit = -1 }
    },
    weight = 0,
    in_shop = false,
    sound = { sound = 'polychrome1', vol = 1.75, per = 0.88},
    loc_vars = function(self, info_queue, card)
        return { vars ={ card.edition.card_limit } }
    end,
    get_weight = function(self)
        return self.weight
    end
}

-- SMODS.Edition {
--     key = 'darkfoil',
--     shader = 'darkfoil',
--     config = {
--         eechips = 2
--     },
--     in_shop = false,
--     weight = 0.25,
--     extra_cost = 2,
--     sound = { sound = "foil1", per = 0.8, vol = 0.9 },
--     loc_vars = function(self, info_queue, card)
--         return { vars = { card.ability.eechips } }
--     end,
--     get_weight = function(self)
--         return G.GAME.edition_rate * self.weight
--     end,
--     calculate = function(self, card, context)
--         if context.joker_main then
--             return {
--                 echips = 2
--             }
--         end
--     end
-- }