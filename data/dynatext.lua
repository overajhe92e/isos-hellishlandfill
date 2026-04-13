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

local tx = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890!@#$%^&*()_+-=,./;':<>?\"\\{}|"
local e = {}
SMODS.DynaTextEffect {
  key = "error",
  func = function(dynatext, index, letter) --haya
    if not letter.normal_letter then
			letter.normal_letter = letter.letter
		end
    local st = pseudorandom('s' .. index, 1, #tx)
    local d = string.sub(tx, st, st + 1)
    e[dynatext.font.key or dynatext.font.file] = e[dynatext.font.key or dynatext.font.file] or {}
	e[dynatext.font.key or dynatext.font.file][d] = e[dynatext.font.key or dynatext.font.file][d] or love.graphics.newText(dynatext.font.FONT, d)
    letter.letter = e[dynatext.font.key or dynatext.font.file][d]
  end
}
