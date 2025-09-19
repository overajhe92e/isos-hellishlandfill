SMODS.Joker {
    key = 'normalsugar',
    cost = 7,
    rarity = 1,
    config = { hands_left = 100 },
    atlas = 'sugar',
    pos = {x=0,y=1},
    soul_pos = {x=0,y=0},
    blueprint_compt = false,
    
    loc_vars = function(self,info_queue,card)
        return { vars = { card.ability.hands_left }}
    end,

    calculate = function(self,card,context)
        if context.joker_main and context.cardarea == G.jokers then
            return {
                mult = 50,
                chips = 50
            }
        end
        if context.after and not context.blueprint then
            if card.ability.hands_left - 1 <= 0 then
                -- SMODS.destroy_cards(card, nil, nil, true)
                card:set_ability("j_ocstobal_sugarcrash")
                card:set_cost(-10)
                return {
                    message = 'Crash!',
                    colour = G.C.FILTER
                }
            else
                card.ability.hands_left = card.ability.hands_left - 1
                return {
                    message = card.ability.hands_left .. '',
                    colour = G.C.FILTER
                }
            end
        end
    end
}

SMODS.Joker {
    key = 'hypersugar',
    cost = 12,
    config = { hands_left = 10 },
    rarity = 2,
    atlas = 'sugar',
    pos = {x=1,y=1},
    soul_pos = {x=1,y=0},
    blueprint_compt = false,

    loc_vars = function(self,info_queue,card)
        return { vars = { card.ability.hands_left }}
    end,

    calculate = function(self,card,context)
        if context.joker_main and context.cardarea == G.jokers then
            return {
                xmult = 3,
                xchips = 2.5
            }
        end
        if context.after and not context.blueprint then
            if card.ability.hands_left - 1 <= 0 then
                -- SMODS.destroy_cards(card, nil, nil, true)
                card:set_ability("j_ocstobal_sugarcrash")
                card:set_cost(-10)
                return {
                    message = 'Crash!',
                    colour = G.C.FILTER
                }
            else
                card.ability.hands_left = card.ability.hands_left - 1
                return {
                    message = card.ability.hands_left .. '',
                    colour = G.C.FILTER
                }
            end
        end
    end
}

SMODS.Joker {
    key = 'demonicsugar',
    cost = 16,
    config = { hands_left = 1 },
    rarity = 3,
    atlas = 'sugar',
    pos = {x=2,y=1},
    soul_pos = {x=2,y=0},
    blueprint_compt = false,

    loc_vars = function(self,info_queue,card)
        return { vars = { card.ability.hands_left }}
    end,

    calculate = function(self,card,context)
        if context.joker_main and context.cardarea == G.jokers then
            return {
                emult = 1.2,
                echips = 1.1
            }
        end
        if context.after and not context.blueprint then
            if card.ability.hands_left - 1 <= 0 then
                -- SMODS.destroy_cards(card, nil, nil, true)
                card:set_ability("j_ocstobal_sugarcrash")
                card:set_cost(-10)
                return {
                    message = 'Crash!',
                    colour = G.C.FILTER
                }
            else
                card.ability.hands_left = card.hands_left - 1
                return {
                    message = card.ability.hands_left .. '',
                    colour = G.C.FILTER
                }
            end
        end
    end
}

SMODS.Joker {
    key = 'sugarcrash',
    cost = 1,
    config = { hands_left = 5 },
    atlas = 'sugar',
    rarity = "ocstobal_cursed",
    pos = {x=3,y=1},
    soul_pos = {x=3,y=0},
    blueprint_compt = false,

    loc_vars = function(self,info_queue,card)
        return { vars = { card.ability.hands_left }}
    end,

    calculate = function(self,card,context)
        if context.joker_main and context.cardarea == G.jokers then
            return {
                xmult = 0.5,
                xchips = 0.5
            }
        end
        if context.after and not context.blueprint then
            if card.ability.hands_left - 1 <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = 'Normalized!',
                    colour = G.C.FILTER
                }
            else
                card.ability.hands_left = card.ability.hands_left - 1
                return {
                    message = card.ability.hands_left .. '',
                    colour = G.C.FILTER
                }
            end
        end
    end
}