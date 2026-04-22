ISO_EXT.oxi_wins = {
    "Not bad, not bad.",
    "Nicely done. Almost perfect, even.",
    "Yet another win to the Player."
}

ISO_EXT.oxi_losses = {
    "blame isotypical.",
    "Bruh.",
    "Isotypical caused this to happen!"
}

for i = 1, #ISO_EXT.oxi_wins do
    SMODS.JimboQuip {
        key = "oxi_wins_" .. i,
        type = 'win',
        extra = {
            center = 'j_iso_Oxy',
            particle_colours = {
                G.C.RED,
                G.C.BLUE,
                G.C.BLACK
            }
        }
    }
end

for i = 1, #ISO_EXT.oxi_losses do
    SMODS.JimboQuip {
        key = "oxi_losses_" .. i,
        type = 'loss',
        extra = {
            center = 'j_iso_Oxy',
            particle_colours = {
                G.C.RED,
                G.C.BLUE,
                G.C.BLACK
            }
        }
    }
end