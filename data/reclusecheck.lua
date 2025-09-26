function reclusecheck()
    if G.recluseblind >= 1 and G.GAME.round_resets.ante >= 8 then
        return true
    else
        return false
    end
end

function sparkydefeatedcheck()
    if G.recluseblind == 0 and G.GAME.round_resets.ante >= 4 then
        return true
    else
        return false
    end
end