SMODS.Joker { -- baller
    key = 'toomuch',
    rarity = 'ocstobal_whatthefuck',
    cost = 100,
    no_collection = true,
    
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                hypermult = {4,4},
                hyperchips = {4,4}
            }
        end
    end
}

SMODS.Joker { --so you know polterwor
    key = 'jokertoendalljokers',
    rarity = 'ocstobal_whatthefuck',
    cost = 1e308,
    atlas = 'avaritia',
    no_collection = true,
    soul_pos = {
        x=1,
        y=0,
        draw = function(card, scale_mod, rotate_mod)
            card.hover_tilt = card.hover_tilt * 1.5
            card.children.floating_sprite:draw_shader('polychrome', nil, card.ARGS.send_to_shader, nil,
                card.children.center, 2 * scale_mod, 2 * rotate_mod)
            card.hover_tilt = card.hover_tilt / 1.5
        end
    },
    pos = {x=0,y=0},
    
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                chips = 999999999999,
                xchips = 99999999999,
                echips = 9999999999,
                eechips = 999999999,
                eeechips = 99999999,
                hyperchips = {10,9999999},
                mult = 999999999999,
                xmult = 99999999999,
                emult = 9999999999,
                eemult = 999999999,
                eeemult = 99999999,
                hypermult = {10,9999999}
            }
        end
    end
}

SMODS.Joker { --don't use, please
    key = 'cpuoverload',
    rarity = 'ocstobal_why',
    cost = 1e308,
    atlas = 'avaritia',
    soul_pos = {x=1,y=0},
    pos = {x=0,y=0},
    no_collection = true,
    
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                hypermult = {1e999,1e999},
                hyperchips = {1e999,1e999}
            }
        end
        if context.retrigger_joker_check and context.other_card then
            return { repetitions = 1e999 }
        end
    end
}

SMODS.Joker { --also the second easiest as seraph is fucking ass at controlling his power
    key = 'sphawkclassic',
    rarity = 'ocstobal_beyondexotic',
    cost = 12500,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                echips = 666,
                emult = 666
            }
        end
    end
}

SMODS.Joker { --this is the easiest of the trio (unbalanced badly) to make wtf 
    key = 'spkawkclassic',
    rarity = 'ocstobal_beyondexotic',
    cost = 10000,
    discovered = false,
    unlocked = false,
    atlas = 'spkawk_classic',
    pos = {x=0,y=0},
    soul_pos = {x=1,y=0},

    calculate = function(self,card,context)
        if context.joker_main then
            return {
                eeechips = 3,
                emult = 0.7
            }
        end
    end
}

SMODS.Joker { --oh my god two soul cards and a blackhole are you deranged
    key = 'solawkclassic',
    rarity = 'ocstobal_beyondexotic',
    cost = 999999,
    
    calculate = function(self,card,context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card{ key = 'c_soul', edition = 'e_negative' }
                    SMODS.add_card{ key = 'c_soul', edition = 'e_negative' }
                    SMODS.add_card{ key = 'c_black_hole', edition = 'e_negative' }
                    SMODS.add_card{ key = 'c_black_hole', edition = 'e_negative' }
                    return true
                end
            }))
        end
        if context.joker_main then
            return {
                eemult = 2,
                eechips = 2
            }
        end
    end
}

SMODS.Joker { --it's literally just the fucking avaritia joker but weaker
    key = 'oxyold',
    rarity = 'ocstobal_whatthefuck',
    cost = 1e307,
    no_collection = true
}

SMODS.Joker { --todo: implement every effect
    key = 'aiojoker',
    rarity = 'ocstobal_whatthefuck',
    cost = 999999999,
    no_collection = true,

    calculate = function(self,card,context)
        if context.joker_main then
            return {
                chips = to_big(10^10^10^10^10)
            }
        end
    end
}

SMODS.Joker { --right before getting aio joker
    key = 'ripoff',
    rarity = 'ocstobal_whatthefuck',
    cost = 2000,
    atlas = 'CustomJokers',
    pos = {x=9,y=1},
    soul_pos = {
        x=0,y=2
    },
    blueprint_compat = true,
    no_collection = true,
    
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                hypermult = {4,2},
                eechips = 2
            }
        end
    end
}

SMODS.Joker { --unobtainable as of now
    key = 'sphawk',
    rarity = 'ocstobal_whatthefuck',
    cost = 666666,
    no_collection = true


}

SMODS.Joker { --unused as of now
    key = 'solawk',
    rarity = 'ocstobal_whatthefuck',
    cost = 666666,
    no_collection = true
}

SMODS.Joker { --unused as of now
    key = 'spkawk',
    rarity = 'ocstobal_whatthefuck',
    cost = 666666,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                hypermult = {pseudorandom("spkhypmultop",2,5),pseudorandom("spkhypchip",2,10)},
                hyperchips = {pseudorandom("spkhypchipop",2,5),pseudorandom("spkhypchip",2,10)}
            }
        end
    end
}