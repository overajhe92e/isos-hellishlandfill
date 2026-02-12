SMODS.Joker { -- did ya think he would silently give chips or mult? no.
    key = 'abbie',
    rarity = 2,
    cost = 12,
    atlas = 'fpeatlas',
    pos = {x=0,y=0},
    soul_pos = {x=2,y=1},
    pools = {["ocstob"] = true,["all_junk"] = true},

    loc_vars = function(self,info_queue,card)
        return {
            key = pseudorandom('seed',1,10) == 1 and "j_ocstobal_abbie_alt"
        }   
    end
}

SMODS.Joker { --what do you think
    key = 'lana',
    rarity = 2,
    cost = 8,
    atlas = 'fpeatlas',
    pos = {x=0,y=0},
    soul_pos = {x=1,y=1},
    pools = {["ocstob"] = true,["all_junk"] = true},

    calculate = function(self,card,context)
        if context.joker_main and not next(SMODS.find_card("j_ocstobal_abbie")) then
            return {
                mult = 11
            }
        elseif context.joker_main and next(SMODS.find_card("j_ocstobal_abbie")) then
            return {
                xmult = 3.1
            }
        end
    end
}

SMODS.Joker { -- I HATE DRAWING YOU I HATE DRAWING YOU I HATE DRAWING YOU I HATE DRAWING YOU I HATE DRAWING YOU 
    key = "claire",
    rarity = 1,
    cost = 4,
    atlas = 'fpeatlas',
    pos = {x=0,y=0},
    soul_pos = {x=0,y=1},
    pools = {["ocstob"] = true,["all_junk"] = true},

    calculate = function(self,card,context)
        if context.joker_main then
            return {
                chips = 31
            }
        end
    end
}



























































































--lmao did you think there was anything here