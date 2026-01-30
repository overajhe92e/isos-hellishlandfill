SMODS.Joker {
    key = "oxhatred",
    config = {
        extra = {
            h_size = 10,
            chipmult = 0.85
        }
    },
    atlas = 'oxidyzehate',
    pos = {
        x = 0,
        y = 0
    },
    cost = 0,
    rarity = "ocstobal_absolute_curse",
    soul_pos = {
        x = 0,
        y = 1
    },
    no_collection = true,
    in_pool = function()
        return false
    end,
    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                card.ability.extra.chipmult,
                card.ability.extra.h_size
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        card:set_edition("e_ocstobal_hidden1", true)
        card:set_eternal(true)
        G.GAME.round_resets.hands = 1
        G.GAME.round_resets.discards = 0
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = 4
        G.GAME.round_resets.discards = 4
        G.hand:change_size(-12)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                message = 'CEASE. THIS.',
                Emult_mod = card.ability.extra.chipmult,
                Echip_mod = card.ability.extra.chipmult
            }
        end
    end
}

SMODS.Joker {
    key = "sparkhatred",
    config = {
        extra = {
            h_size = 12,
            chipmult = 0.6
        }
    },
    atlas = 'oxidyzehate',
    pos = {
        x = 0,
        y = 0
    },
    cost = 0,
    rarity = "ocstobal_absolute_curse",
    soul_pos = {
        x = 0,
        y = 2
    },
    no_collection = true,
    in_pool = function()
        return false
    end,
    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                card.ability.extra.chipmult,
                card.ability.extra.h_size
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        card:set_edition("e_ocstobal_hidden1", true)
        card:set_eternal(true)
        G.GAME.round_resets.hands = 1
        G.GAME.round_resets.discards = 0
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = 10
        G.GAME.round_resets.discards = 10
        G.hand:change_size(-10)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                message = 'STOP REMINDING ME OF THAT!!',
                Emult_mod = card.ability.extra.chipmult,
                Echip_mod = card.ability.extra.chipmult
            }
        end
    end
}

SMODS.Joker {
    key = "solhatred",
    config = {
        extra = {
            h_size = 3,
            blindsize = 1.8
        }
    },
    atlas = 'oxidyzehate',
    pos = {
        x = 0,
        y = 0
    },
    cost = 0,
    rarity = "ocstobal_absolute_curse",
    soul_pos = {
        x = 0,
        y = 3
    },
    no_collection = true,
    in_pool = function()
        return false
    end,
    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                card.ability.extra.blindsize,
                card.ability.extra.h_size
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        card:set_edition("e_ocstobal_hidden1", true)
        card:set_eternal(true)
        G.GAME.round_resets.hands = 1
        G.GAME.round_resets.discards = 0
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = 10
        G.GAME.round_resets.discards = 10
        G.hand:change_size(-10)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                message = 'Perish.'
            }
        end
    end
}

SMODS.Joker {
    key = "somethingevil",
    config = {
        extra = {
            blind_size = 3,
            chips = 0,
            mercymult = 1,
            mmultgain = 0.15
        }
    },
    atlas = 'other_jokers',
    pos = {
        x = 4,
        y = 0
    },
    cost = 0,
    rarity = "ocstobal_absolute_curse",
    unlocked = true,
    discovered = false,
    soul_pos = {
        x = 5,
        y = 0,
        draw = function(card, scale_mod, rotate_mod)
            card.hover_tilt = card.hover_tilt * 1.5
            card.children.floating_sprite:draw_shader('polychrome', nil, card.ARGS.send_to_shader, nil,
                card.children.center, 2 * scale_mod, 2 * rotate_mod)
            card.hover_tilt = card.hover_tilt / 1.5
        end
    },

    add_to_deck = function(self, card, from_debuff)
        card:set_eternal(true)
        G.GAME.round_resets.hands = 1
        G.GAME.round_resets.discards = 0
        G.hand:change_size(16)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-8)
    end,

    loc_vars = function(self, info_queue, card) -- yeah this was buggy asf lmao
        info_queue[#info_queue + 1] = { set = "Other", key = "ocstobal_oxydownside" }
        -- info_queue[#info_queue + 1] = { set = "Other", key = "ocstobal_reclusedownside" }
        info_queue[#info_queue + 1] = { set = "Other", key = "ocstobal_sharkdownside" }
        info_queue[#info_queue + 1] = { set = "Other", key = "ocstobal_mercymult", vars = { card.ability.extra.mercymult } }
        info_queue[#info_queue + 1] = G.P_CENTERS.j_ocstobal_oxhatred
        return {
            vars = { card.ability.extra.chips }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and not context.blueprint then
            return {
                message = '^0.85 Chips & ^' .. tostring(card.ability.extra.mercymult) .. ' Mult',
                Emult_mod = card.ability.extra.mercymult,
                Echip_mod = 0.85
            }
        end
        if context.setting_blind and not context.blueprint then
            card.ability.extra.mercymult = card.ability.extra.mercymult + card.ability.extra.mmultgain
            local destructable_jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card and not SMODS.is_eternal(G.jokers.cards[i], card) and not G.jokers.cards[i].getting_sliced then
                    destructable_jokers[#destructable_jokers + 1] =
                        G.jokers.cards[i]
                end
            end
            local joker_to_destroy = pseudorandom_element(destructable_jokers, 'ocstobal_somethingevil')

            if joker_to_destroy then
                joker_to_destroy.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        (context.blueprint_card or card):juice_up(0.8, 0.8)
                        joker_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
                        return true
                    end
                }))
            end
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                        { message = "X" .. tostring(card.ability.extra.blind_size) .. " Blind Size", colour = G.C.GREEN })
                    G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_size
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    G.HUD_blind:recalculate()
                    return true
                end
            }
        end
    end
}
