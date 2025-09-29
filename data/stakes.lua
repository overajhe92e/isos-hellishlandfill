SMODS.Stake {
    key = 'singularity',
    name = 'Singularity Stake',
    unlocked_stake = "finale" ,
    applied_stakes = { 'gold' },
    prefix_config = { applied_stakes = { mod = false } },
    above_stake = 'gold',
    modifiers = function()
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 2
        G.GAME.modifiers.no_blind_reward = G.GAME.modifiers.no_blind_reward or {}
        G.GAME.modifiers.no_blind_reward.Big = true
    end,
    colour = G.C.BLACK,
    shiny = true
}

SMODS.Stake {
    key = 'finale',
    name = 'The Final Stake',
    atlas = 'finalstake',
    above_stake = 'singularity',
    pos = {x=0,y=0},
    applied_stakes = { "ocstobal_singularity" },
    prefix_config = { applied_stakes = { mod = false } },
    modifiers = function()
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 2
        G.GAME.modifiers.no_blind_reward = G.GAME.modifiers.no_blind_reward or {}
        G.GAME.win_ante = math.ceil(G.GAME.win_ante * 1.5)
        G.GAME.starting_params.discards = 6
        G.GAME.starting_params.hands = G.GAME.starting_params.hands + 2
    end,
    colour = G.C.WHITE,
    shiny = true
}