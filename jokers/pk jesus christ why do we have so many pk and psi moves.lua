SMODS.Joker {
    key = 'psi_hypnosis',
    cost = 1,
    rarity = 3
}

SMODS.Joker {
    key = 'psi_paralysis',
    cost = 1,
    rarity = 3
}

SMODS.Joker {
    key = 'psi_brainshock',
    cost = 1,
    rarity = 4
}

SMODS.Joker {
    key = 'pk_ground',
    cost = 1,
    rarity = 'ocstobal_beyondexotic',
    config = {
        extra = {
            probability = 4,
            retriggers = 1
        }
    },
    loc_vars = function(self,info_queue,card)
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            G.GAME.chips = (G.GAME.blind.chips/10)
        end
    end
}

SMODS.Joker {
    key = 'pk_flash',
    cost = 1,
    rarity = 2
}