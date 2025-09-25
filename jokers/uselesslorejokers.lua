SMODS.Joker {
    key = 'furnote',
    cost = 1,
    rarity = 1,
    in_pool = function(self,args)
        return loregrahh()
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return { xmult = 10 }
        end
    end
}

SMODS.Joker {
    key = 'love',
    cost = 1,
    rarity = 1,
    in_pool = function(self,args)
        return loregrahh()
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return { mult = 50 }
        end
    end
}

SMODS.Joker {
    key = 'letter',
    cost = 1,
    rarity = 1,
    in_pool = function(self,args)
        return loregrahh()
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return { chips = 666 }
        end
    end
}

SMODS.Joker {
    key = 'malicesyringe',
    cost = 1,
    rarity = 'ocstobal_cursed',
    calculate = function(self,card,context)
        if context.joker_main then
            return { xmult = 0.5 }
        end
    end
}

SMODS.Joker {
    key = 'lifecrystal',
    cost = 1,
    rarity = 3,
    calculate = function(self,card,context)
        if context.joker_main then
            return { xmult = 5 }
        end
    end
}