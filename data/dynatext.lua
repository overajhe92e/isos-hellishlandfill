SMODS.DynaTextEffect {
    key = "wavy",
    func = function(dynatext, index, letter)
        letter.offset = {
            x = math.sin(4 * G.TIMERS.REAL + index) * 5,
            y = math.sin(4 * G.TIMERS.REAL + index) * 15
        }
    end
}

SMODS.DynaTextEffect {
    key = "shake",
    func = function(dynatext, index, letter)
        letter.offset = {
            x = math.ceil(math.cos(10 * G.TIMERS.REAL * index) * 1.5),
            y = math.floor(math.sin(65 * (G.TIMERS.REAL * index)) * 3)
        }
    end
}
