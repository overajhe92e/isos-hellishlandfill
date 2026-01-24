SMODS.Joker {
    key = 'psi_hypnosis',
    cost = 1,
    rarity = 3,
    no_collection = true
}

SMODS.Joker {
    key = 'psi_paralysis',
    cost = 1,
    rarity = 3,
    no_collection = true
}

SMODS.Joker {
    key = 'psi_brainshock',
    cost = 1,
    rarity = 4,
    no_collection = true
}

SMODS.Joker {
    key = 'pk_ground',
    cost = 1,
    rarity = 'ocstobal_beyondexotic',
    config = {
        extra = {
            probability = 4,
            retriggers = 2
        }
    },
    loc_vars = function(self,info_queue,card)
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            G.GAME.chips = G.GAME.chips + (G.GAME.blind.chips/10)
            return {
                message = "+"..tostring(G.GAME.blind.chips/10).." Score",
                colour = G.C.WHITE
            }
        end
    end,
    no_collection = false
}

SMODS.Joker {
    key = 'pk_flash',
    cost = 1,
    rarity = 2,
    no_collection = true
}