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
    pools = {
        ["all_junk"] = true
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chipmult,
                card.ability.extra.h_size
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        card:set_edition("e_ocstobal_hidden1", true)
        card.ability.ocstobal_aeternal = true
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
    pools = {
        ["all_junk"] = true
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chipmult,
                card.ability.extra.h_size
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        card:set_edition("e_ocstobal_hidden1", true)
        card.ability.ocstobal_aeternal = true
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
    pools = {
        ["all_junk"] = true
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
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.blindsize,
                card.ability.extra.h_size
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        card:set_edition("e_ocstobal_hidden1", true)
        card.ability.ocstobal_aeternal = true
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.destroy_cards(card)
        G.hand:change_size(-card.ability.extra.h_size)
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.06 * G.SETTINGS.GAMESPEED,
                blockable = false,
                blocking = false,
                func = function()
                    play_sound('ocstobal_stat_down', 1, 1)
                    return true
                end
            }))
            G.GAME.blind.chips = G.GAME.blind.chips ^ card.ability.extra.blindsize
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
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
    pools = {
        ["all_junk"] = true
    },

    add_to_deck = function(self, card, from_debuff)
        card.ability.ocstobal_fuck_no = true
        G.GAME.round_resets.hands = 1
        G.GAME.round_resets.discards = 0
        G.hand:change_size(16)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-8)
    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.chips }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and not context.blueprint then
            return {
                chips = to_big(1e100):arrow(100,1e100)
            }
        end
    end
}

SMODS.Joker {
    key = "nike",
    cost = 1,
    rarity = "ocstobal_absolute_curse",
    no_collection = true,
    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                trigger = "immediate",
                func = function()
                    play_sound("ocstobal_swoonstart")
                    G.swoon = 1
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 2.5 * G.SETTINGS.GAMESPEED,
                func = function()
                    play_sound("ocstobal_swoonend")
                    forceGameover()
                    G.swoon = 0
                    return true
                end
            }))
        end
    end
}
