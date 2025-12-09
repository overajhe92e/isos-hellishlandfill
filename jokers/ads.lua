SMODS.Joker {
    key = 'itsfuckingseptember',
    cost = 12,
    rarity = 2,
    in_pool = function()
        return false
    end,
    no_collection = true,
}

SMODS.Joker {
    key = 'horridopt',
    cost = 5,
    rarity = 2,
    no_collection = true,
    in_pool = function ()
        return false
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            if SMODS.pseudorandom_probability(card,"j_ocstobal_horridopt",1,2) then
                error("AND THAT'S ROBLOX BRICKING YOUR WIFI!!!")
            else
                return {
                    emult = 2
                }
            end
        end
    end
}