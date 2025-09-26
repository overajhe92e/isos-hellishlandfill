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

SMODS.Joker { --UNUSED RIGHT NOW
    key = 'sphawkclassic',
    rarity = 'ocstobal_whatthefuck',
    cost = 666666,
    no_collection = true
}

SMODS.Joker { --this is the easiest of the trio (unbalanced badly) to make wtf 
    key = 'spkawkclassic',
    rarity = 'ocstobal_whatthefuck',
    cost = 666666,
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

SMODS.Joker { --UNUSED RIGHT NOW
    key = 'solawkclassic',
    rarity = 'ocstobal_whatthefuck',
    cost = 666666,
    no_collection = true
}

SMODS.Joker { --UNUSED RIGHT NOW
    key = 'oxyold',
    rarity = 'ocstobal_whatthefuck',
    cost = 1e307,
    no_collection = true
}