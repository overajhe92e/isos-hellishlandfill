function unbalancedstuff()
    if iso.configbs.unbalanced_mode == true then
        return true
    else
        return false
    end
end

function almanacstuff()
    if iso.configbs.very_unbalanced_mode == true and iso.configbs.very_unbalanced_mode == true then
        return true
    else
        return false
    end
end

function ante32spawn()
    if G.GAME.round_resets.ante >= 32 then
        return true
    else
        return false
    end
end

-- function riskofhell()
--     if --[[blind checking here]] then
--         ease_background_colour_blind(G.STATES.PLANET_PACK)
--     end
-- end