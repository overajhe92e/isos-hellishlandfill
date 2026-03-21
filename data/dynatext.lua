SMODS.DynaTextEffect {
    key = "wavy",
    func = function(dynatext,index,letter)
        letter.offset = {
            x = math.sin(4*G.TIMERS.REAL+index)*5,
            y = math.sin(4*G.TIMERS.REAL+index)*15
        }
    end
}