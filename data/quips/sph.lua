ISO_EXT.sph_wins = {
    "Could have won faster with me.",
    "Pff, you can do better than that.",
    "Nice, I guess.",
    "Neato. You won."
}

ISO_EXT.sph_losses = {
    "Get good, lmao.",
    "Amazing loss, buddy!",
    "WOWWW. Skill issue...",
    "You could have won if you got me."
}

for i = 1, #ISO_EXT.sph_wins do
    SMODS.JimboQuip {
        key = "sph_wins_" .. i,
        type = 'win',
        extra = {
            center = 'j_fizz_seraph',
            particle_colours = {
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE
            }
        }
    }
end

for i = 1, #ISO_EXT.sph_losses do
    SMODS.JimboQuip {
        key = "sph_losses_" .. i,
        type = 'loss',
        extra = {
            center = 'j_fizz_seraph',
            particle_colours = {
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE
            }
        }
    }
end
