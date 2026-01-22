SMODS.ConsumableType {
    key = 'ocstobal_Aleph',
    primary_colour = HEX('000000'),
    secondary_colour = HEX('000000'),
    loc_txt = {
        name = 'Aleph',             -- used on card type badges
        collection = 'Aleph Cards', -- label for the button to access the collection
        undiscovered = {            -- description for undiscovered cards in the collection
            name = '???',
            text = { '??????' },
        },
    }, --go my backup localization
    text_colour = G.C.OMEGARED
}

SMODS.ConsumableType {
    key = 'ocstobal_candy',
    primary_colour = HEX('62b6fe'),
    secondary_colour = HEX('fdd965'),
    loc_txt = {
        name = 'Candy',         -- used on card type badges
        collection = 'Candies', -- label for the button to access the collection
        undiscovered = {        -- description for undiscovered cards in the collection
            name = 'Not Discovered',
            text = {
                'Yatta gives these,',
                'Look out for her!'
            },
        },
    }, --go my backup localization
    text_colour = G.C.WHITE
}

SMODS.ConsumableType {
    key = 'ocstobal_others',
    primary_colour = HEX('62b6fe'),
    secondary_colour = HEX('fdd965'),
    loc_txt = {
        name = 'Misc.',                   -- used on card type badges
        collection = 'Other Consumables', -- label for the button to access the collection
        undiscovered = {                  -- description for undiscovered cards in the collection
            name = '???',
            text = {
                'These will randomly spawn.',
            },
        },
    }, --go my backup localization
    text_colour = G.C.WHITE
}

SMODS.Consumable {
    key = 'thesoulex',
    set = 'ocstobal_Aleph',
    hidden = true,
    soul_set = 'Spectral',
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local deletable_jokers = {}
        for _, joker in pairs(G.jokers.cards) do
            if not SMODS.is_eternal(joker, card) then deletable_jokers[#deletable_jokers + 1] = joker end
        end
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("timpani")
                SMODS.add_card({ set = 'Joker', rarity = 'ocstobal_beyondexotic' })
                card:juice_up(0.3, 0.5)
                return true
            end,
        }))
        delay(0.6)
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.Consumable {
    key = 'needle',
    set = 'ocstobal_others',
    hidden = true,
    soul_set = 'Spectral',
    soul_rate = 0.1,
    can_use = function(self, card)
        return true
    end,
    atlas = 'needle',
    use = function(self, card, area, copier)
        local lovecheck = nil
        if not next(SMODS.find_card("j_ocstobal_pk_love_a")) and not next(SMODS.find_card("j_ocstobal_pk_love_b")) and not next(SMODS.find_card("j_ocstobal_pk_love_g")) and not next(SMODS.find_card("j_ocstobal_pk_love_o")) then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    play_sound("timpani")
                    SMODS.add_card({ key = 'j_ocstobal_pk_love_a' })
                    card:juice_up(0.3, 0.5)
                    return true
                end,
            }))
        end
        if next(SMODS.find_card("j_ocstobal_pk_love_a")) then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    play_sound("timpani")
                    SMODS.destroy_cards(SMODS.find_card('j_ocstobal_pk_love_a'), nil)
                    SMODS.add_card({ key = 'j_ocstobal_pk_love_b' })
                    card:juice_up(0.3, 0.5)
                    return true
                end,
            }))
        end
        if next(SMODS.find_card("j_ocstobal_pk_love_b")) and not next(SMODS.find_card("j_ocstobal_pk_love_a")) then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    play_sound("timpani")
                    SMODS.destroy_cards(SMODS.find_card('j_ocstobal_pk_love_b'), nil)
                    SMODS.add_card({ key = 'j_ocstobal_pk_love_g' })
                    card:juice_up(0.3, 0.5)
                    return true
                end,
            }))
        end
        if next(SMODS.find_card("j_ocstobal_pk_love_g")) and not next(SMODS.find_card("j_ocstobal_pk_love_b")) and not next(SMODS.find_card("j_ocstobal_pk_love_a")) then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    play_sound("timpani")
                    SMODS.destroy_cards(SMODS.find_card('j_ocstobal_pk_love_g'), nil)
                    SMODS.add_card({ key = 'j_ocstobal_pk_love_o' })
                    card:juice_up(0.3, 0.5)
                    return true
                end,
            }))
        end
        if next(SMODS.find_card("j_ocstobal_pk_love_o")) and not next(SMODS.find_card("j_ocstobal_pk_love_g")) and not next(SMODS.find_card("j_ocstobal_pk_love_b")) and not next(SMODS.find_card("j_ocstobal_pk_love_a")) then
            forceGameover()
        end
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.DrawStep {
    key = 'ocstobal_thesoulex',
    order = 50,
    func = function(card)
        if card.config.center.key == "c_ocstobal_thesoulex" and (card.config.center.discovered or card.bypass_discovery_center) then
            local scale_mod = 0.05 + 0.05 * math.sin(1.8 * G.TIMERS.REAL) +
                0.07 * math.sin((G.TIMERS.REAL) * math.pi * 28) *
                (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 10
            local rotate_mod = 0.12 * math.sin(1.219 * (G.TIMERS.REAL + 2)) +
                0.07 * math.sin((G.TIMERS.REAL) * math.pi) * (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 8

            G.shared_soul.role.draw_major = card
            G.shared_soul:draw_shader('dissolve', 0, nil, nil, card.children.center, scale_mod, rotate_mod, nil,
                0.1 + 0.03 * math.sin(1.8 * G.TIMERS.REAL), nil, 0.2)
            G.shared_soul:draw_shader('dissolve', nil, nil, nil, card.children.center, scale_mod, rotate_mod)
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}
