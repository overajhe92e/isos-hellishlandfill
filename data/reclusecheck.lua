function reclusecheck()
    if G.GAME.recluseblind == nil then
        return false
    elseif G.GAME.recluseblind >= 1 and G.GAME.round_resets.ante >= 8 then
        return true
    end
end

function sparkydefeatedcheck()
    if G.GAME.recluseblind == 0 and G.GAME.round_resets.ante >= 4 then
        return true
    else
        return false
    end
end