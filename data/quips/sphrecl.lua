ISO_EXT.fuck_you = {
    "How. The. FUCK.",
    "How did you even die???",
    "Recluse is right, you have a skill issue!",
    "You disappoint me."
}

for i = 1, #ISO_EXT.fuck_you do
    SMODS.JimboQuip {
        key = "sphrecl_losses_" .. i,
        type = 'loss',
        extra = {
            center = 'j_ocstobal_reclusivevessel',
            particle_colours = {
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE,
                G.C.NIGHTMARE_PURPLE
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card("j_ocstobal_reclusivevessel")) then
                return true, { weight = 100 }
            end
        end
    }
end
