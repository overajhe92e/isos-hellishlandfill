ISO_EXT.recl_wins = {
    "damn, was hoping you'd lose."
}

ISO_EXT.recl_losses = {
    "lmao git gud",
    "skill issue",
    "L"
}

for i = 1, #ISO_EXT.recl_wins do
    SMODS.JimboQuip {
        key = "recl_wins_" .. i,
        type = 'win',
        extra = {
            center = 'j_ocstobal_recluse',
            particle_colours = {
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE
            }
        }
    }
end

for i = 1, #ISO_EXT.recl_losses do
    SMODS.JimboQuip {
        key = "recl_losses_" .. i,
        type = 'loss',
        extra = {
            center = 'j_ocstobal_recluse',
            particle_colours = {
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE
            }
        }
    }
end
