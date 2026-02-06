-- SMODS.Joker { -- baller
--     key = 'toomuch',
--     rarity = 'ocstobal_whatthefuck',
--     cost = 100,
--     no_collection = true,

--     calculate = function(self, card, context)
--         if context.joker_main then
--             return {
--                 hypermult = { 4, 4 },
--                 hyperchips = { 4, 4 }
--             }
--         end
--     end
-- }

SMODS.Joker { --so you know polterwor
    key = 'jokertoendalljokers',
    rarity = 'ocstobal_secret',
    cost = 1e200,
    atlas = 'terminuses',
    no_collection = true,
    pools = {
        ["fucking_absurd"] = true,
    },
    soul_pos = {
        x = 3,
        y = 1,
        draw = function(card, scale_mod, rotate_mod)
            card.hover_tilt = card.hover_tilt * 1.5
            card.children.floating_sprite:draw_shader('polychrome', nil, card.ARGS.send_to_shader, nil,
                card.children.center, 2 * scale_mod, 2 * rotate_mod)
            card.hover_tilt = card.hover_tilt / 1.5
        end
    },
    pos = { x = 2, y = 1 },

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = 999999999999,
                xchips = 99999999999,
                echips = 9999999999,
                eechips = 999999999,
                eeechips = 99999999,
                hyperchips = { 10, 9999999 },
                mult = 999999999999,
                xmult = 99999999999,
                emult = 9999999999,
                eemult = 999999999,
                eeemult = 99999999,
                hypermult = { 10, 9999999 }
            }
        end
    end
}

-- SMODS.Joker { --also the second easiest as seraph is fucking ass at controlling his power
--     key = 'sphawkclassic',
--     rarity = 'ocstobal_beyondexotic',
--     atlas = 'placeholder',
--     pools = {
--         ["fucking_absurd"] = true
--     },
--     no_collection = true,
--     cost = 12500,
--     calculate = function(self, card, context)
--         if context.joker_main then
--             return {
--                 echips = 666,
--                 emult = 666
--             }
--         end
--     end
-- }

-- SMODS.Joker { --this is the easiest of the trio (unbalanced badly) to make wtf
--     key = 'spkawkclassic',
--     rarity = 'ocstobal_beyondexotic',
--     cost = 10000,
--     discovered = false,
--     unlocked = false,
--     atlas = 'spkawk_classic',
--     pools = {
--         ["fucking_absurd"] = true
--     },
--     no_collection = true,
--     pos = { x = 0, y = 0 },
--     soul_pos = { x = 1, y = 0 },

--     calculate = function(self, card, context)
--         if context.joker_main then
--             return {
--                 eeechips = 3,
--                 emult = 0.7
--             }
--         end
--     end
-- }

-- SMODS.Joker { --oh my god two soul cards and a blackhole are you deranged
--     key = 'solawkclassic',
--     rarity = 'ocstobal_beyondexotic',
--     cost = 999999,
--     atlas = 'placeholder',
--     no_collection = true,
--     pools = {
--         ["fucking_absurd"] = true
--     },

--     calculate = function(self, card, context)
--         if context.setting_blind then
--             G.E_MANAGER:add_event(Event({
--                 func = function()
--                     if SMODS.pseudorandom_probability(card, "j_ocstobal_solawkclassic", 1, 20) then
--                         SMODS.add_card { key = 'c_ocstobal_thesoulex', edition = 'e_negative' }
--                         return true
--                     else
--                         SMODS.add_card { key = 'c_soul', edition = 'e_negative' }
--                         SMODS.add_card { key = 'c_soul', edition = 'e_negative' }
--                         SMODS.add_card { key = 'c_black_hole', edition = 'e_negative' }
--                         SMODS.add_card { key = 'c_black_hole', edition = 'e_negative' }
--                         return true
--                     end
--                 end
--             }))
--         end
--         if context.joker_main then
--             return {
--                 eemult = 2,
--                 eechips = 2
--             }
--         end
--     end
-- }

-- SMODS.Joker { --it's literally just the fucking avaritia joker but weaker
--     key = 'oxyold',
--     rarity = 'ocstobal_whatthefuck',
--     cost = 1e307,
--     no_collection = true
-- }
SMODS.Joker { --right before getting aio joker
    key = 'ripoff',
    rarity = 'ocstobal_beyondexotic',
    cost = 2000,
    atlas = 'CustomJokers',
    pos = { x = 9, y = 1 },
    soul_pos = {
        x = 0, y = 2
    },
    blueprint_compat = true,
    no_collection = true,
    pools = {
        ["fucking_absurd"] = true,
        ["all_junk"] = true
    },

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                hypermult = { 4, 2 },
                eechips = 2
            }
        end
    end
}

SMODS.Joker { --terminus go brrrrt
    key = 'sphawk',
    rarity = 'ocstobal_beyondexotic',
    cost = 50000,
    no_collection = true,
    config = {
        extra = {
            mult = 2,
            req = 1024,
            op = 2
        }
    },
    atlas = 'terminuses',
    pos = { x = 2, y = 0 },
    soul_pos = {
        x = 3, y = 0
    },
    pools = {
        ["fucking_absurd"] = true,
        ["all_junk"] = true
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult, card.ability.extra.req, card.ability.extra.op
            }
        }
    end,

    update = function(self, card, dt)
        if card.ability.extra.mult >= card.ability.extra.req then
            card.ability.extra.op = card.ability.extra.op + 1
            card.ability.extra.mult = 2
            card.ability.extra.req = card.ability.extra.req * 2
        end
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and card.ability.extra.mult < card.ability.extra.req then
            card.ability.extra.mult = card.ability.extra.mult * 2
        end
        if context.individual and context.cardarea == G.play then
            return {
                hypermult = { card.ability.extra.op, card.ability.extra.mult }
            }
        end
    end
}

SMODS.Joker { --oh no
    key = 'solawk',
    rarity = 'ocstobal_beyondexotic',
    config = {
        extra = {
            hypmult = 4
        }
    },
    pools = {
        ["fucking_absurd"] = true,
        ["all_junk"] = true
    },
    no_collection = true,
    cost = 20000,
    atlas = 'terminuses',
    pos = { x = 0, y = 0 },
    soul_pos = {
        x = 1, y = 0
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hypmult } }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and card.ability.extra.hypmult < 1e300 then
            card:juice_up()
            card.ability.extra.hypmult = lenient_bignum(card.ability.extra.hypmult) * 2
            return {
                message = 'Scaled!'
            }
        end
        if context.joker_main then
            return {
                hypermult = { 4, lenient_bignum(card.ability.extra.hypmult) }
            }
        end
    end
}

SMODS.Joker { --unused as of now
    key = 'spkawk',
    rarity = 'ocstobal_beyondexotic',
    cost = 12500,
    atlas = 'terminuses',
    pos = { x = 0, y = 1 },
    soul_pos = {
        x = 1, y = 1
    },
    pools = {
        ["fucking_absurd"] = true,
        ["all_junk"] = true
    },
    no_collection = true,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                hypermult = { pseudorandom("spkhypmultop", 2, 5), pseudorandom("spkhypchip", 2, 10) },
                hyperchips = { pseudorandom("spkhypchipop", 2, 5), pseudorandom("spkhypchip", 2, 10) }
            }
        end
    end
}

SMODS.Joker {
    key = 'obscene_joke',
    rarity = 1,
    cost = 1,
    atlas = "other_jokers",
    pools = {
        ["all_junk"] = true
    },
    pos = { x = 4, y = 1 },
    add_to_deck = function(self, card)
        if next(SMODS.find_card("j_ocstobal_Oxy")) and next(SMODS.find_card("j_ocstobal_solinium")) and next(SMODS.find_card("j_ocstobal_sparky")) then
            SMODS.add_card { key = 'j_ocstobal_oxhatred' }
            SMODS.add_card { key = 'j_ocstobal_sparkhatred' }
            SMODS.add_card { key = 'j_ocstobal_solhatred' }
            SMODS.add_card { key = 'j_ocstobal_somethingevil' }
            SMODS.destroy_cards(card, nil, nil, true)
            SMODS.destroy_cards(SMODS.find_card("j_ocstobal_seraph"), nil, nil, true)
        elseif next(SMODS.find_card("j_ocstobal_Oxy")) then
            SMODS.add_card { key = 'j_ocstobal_oxhatred' }
            SMODS.destroy_cards(card, nil, nil, true)
        elseif next(SMODS.find_card("j_ocstobal_sparky")) and not next(SMODS.find_card("j_ocstobal_Oxy")) then
            SMODS.add_card { key = 'j_ocstobal_sparkhatred' }
            SMODS.destroy_cards(card, nil, nil, true)
        elseif next(SMODS.find_card("j_ocstobal_solinium")) and not next(SMODS.find_card("j_ocstobal_Oxy")) and not next(SMODS.find_card("j_ocstobal_sparky")) then
            SMODS.add_card { key = 'j_ocstobal_solhatred' }
            SMODS.destroy_cards(card, nil, nil, true)
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            key = 
            next(SMODS.find_card("j_ocstobal_Oxy")) and next(SMODS.find_card("j_ocstobal_sparky")) and next(SMODS.find_card("j_ocstobal_solinium")) and "j_ocstobal_obscene_joke_oh_no"
            or next(SMODS.find_card("j_ocstobal_Oxy")) and "j_ocstobal_obscene_joke_oxidyze"
            or next(SMODS.find_card("j_ocstobal_solinium")) and "j_ocstobal_obscene_joke_solinium"
            or next(SMODS.find_card("j_ocstobal_sparky")) and "j_ocstobal_obscene_joke_sparky"
            
        }
    end,
}

-- SMODS.Joker {
--     key = "exponenttest",
--     rarity = "ocstobal_beyondexotic",
--     cost = 69420,
--     add_to_deck = function(self, card)
--         SMODS.set_scoring_calculation('ocstobal_tetration')
--     end,
--     remove_from_deck = function(self,card)
--         SMODS.set_scoring_calculation('multiply')
--     end
-- }

SMODS.Scoring_Calculation({
    key = 'tetration',
    func = function(self, chips, mult, flames)
        return chips ^ mult ^ (mult ^ mult)
    end,
    text = '^^', -- controls the UI symbol displayed between the chips and mult box
    colour = G.C.DARK_EDITION
})
