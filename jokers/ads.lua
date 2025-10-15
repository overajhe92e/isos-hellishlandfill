SMODS.Joker {
    key = 'itsfuckingseptember',
    cost = 11.99,
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
    in_pool = function ()
        return false
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            if pseudorandom_probability("crasher",1,6,"j_ocstobal_horridopt") then
                error("Sorry, you can't have stable gameplay!")
            else
                return {
                    xmult = 3
                }
            end
        end
    end
}