ISO_EXT.spk_wins = {
    "WE WON??",
    "YAYY!! WE WON!!",
    "YIPEE!!!",
}

ISO_EXT.spk_losses = {
    "I-I... huh..?!",
    "O-oh... I guess next time...",
    "A-aw..."
}

for i = 1, #ISO_EXT.spk_wins do
    SMODS.JimboQuip {
        key = "spk_wins_" .. i,
        type = 'win',
        extra = {
            center = 'j_ocstobal_sparky',
            particle_colours = {
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE
            }
        }
    }
end

for i = 1, #ISO_EXT.spk_losses do
    SMODS.JimboQuip {
        key = "spk_losses_" .. i,
        type = 'loss',
        extra = {
            center = 'j_ocstobal_sparky',
            particle_colours = {
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE
            }
        }
    }
end
