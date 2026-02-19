ISO_EXT.sol_wins = {
    "Congrats on winning!",
    "Niceee! Keep it up!",
    "A successful experiment, if I were to say!",
}

ISO_EXT.sol_losses = {
    "...oh.",
    "IT'S GONE WRONG!!!",
    "Yikes, YIKES!"
}

for i = 1, #ISO_EXT.sol_wins do
    SMODS.JimboQuip {
        key = "sol_wins_" .. i,
        type = 'win',
        extra = {
            center = 'j_ocstobal_solinium',
            particle_colours = {
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE
            }
        }
    }
end

for i = 1, #ISO_EXT.sol_losses do
    SMODS.JimboQuip {
        key = "sol_losses_" .. i,
        type = 'loss',
        extra = {
            center = 'j_ocstobal_solinium',
            particle_colours = {
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE
            }
        }
    }
end