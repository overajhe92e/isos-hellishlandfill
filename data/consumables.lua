SMODS.ConsumableType {
    key = 'fizz_Aleph',
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
    key = 'fizz_others',
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
    set = 'fizz_Aleph',
    hidden = true,
    soul_set = 'Spectral',
    soul_rate = 0.01,
    atlas = "needle",
    pos = { x = 1, y = 0 },
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local deletable_jokers = {}
        for _, joker in pairs(G.jokers.cards) do
            if SMODS.is_eternal(joker, card) then
                card.ability.eternal = nil
                card.ability.Alphaeternal = nil
            end
            deletable_jokers[#deletable_jokers + 1] = joker
        end
        local _first_dissolve = nil
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.75,
            func = function()
                for _, joker in pairs(deletable_jokers) do
                    joker:start_dissolve(nil, _first_dissolve)
                    _first_dissolve = true
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("fizz_chimera_ping")
                SMODS.add_card({ set = 'Joker', rarity = 'fizz_beyondexotic' })
                card:juice_up(0.3, 0.5)
                return true
            end,
        }))
        delay(0.6)
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('fizz_fluorescent', nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.Consumable {
    key = 'isocalls',
    set = 'fizz_Aleph',
    hidden = true,
    soul_set = 'Spectral',
    soul_rate = 0.002,
    atlas = "needle",
    pos = { x = 2, y = 0 },
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if
            G.GAME.dollars >= 1e50 and
            G.GAME.round_resets.ante > 10 and
            next(SMODS.find_card("j_fizz_sparky")) and
            (next(SMODS.find_card("j_fizz_Oxy")) or next(SMODS.find_card("j_fizz_Seraph")))
            and next(SMODS.find_card("j_fizz_solinium"))
        then
            local deletable_jokers = {}
            for _, joker in pairs(G.jokers.cards) do
                if SMODS.is_eternal(joker, card) then card.ability.eternal = nil end
                deletable_jokers[#deletable_jokers + 1] = joker
            end
            local _first_dissolve = nil
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.75,
                func = function()
                    for _, joker in pairs(deletable_jokers) do
                        joker:start_dissolve(nil, _first_dissolve)
                        _first_dissolve = true
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    play_sound("fizz_franklin")
                    SMODS.add_card({ key = 'j_fizz_myself' })
                    card:juice_up(0.3, 0.5)
                    return true
                end,
            }))
            delay(0.6)
        else
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, { message = "Nope!", colour = G.C.RED })
                    SMODS.add_card({ key = "c_fizz_isocalls" })
                    return true
                end,
            }))
        end
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.Consumable {
    key = 'needle',
    set = 'fizz_others',
    hidden = true,
    soul_set = 'Spectral',
    soul_rate = 0.01,
    can_use = function(self, card)
        return true
    end,
    atlas = 'needle',
    use = function(self, card, area, copier)
        local lovecheck = nil
        if not next(SMODS.find_card("j_fizz_pk_love_a")) and not next(SMODS.find_card("j_fizz_pk_love_b")) and not next(SMODS.find_card("j_fizz_pk_love_g")) and not next(SMODS.find_card("j_fizz_pk_love_o")) then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    play_sound("timpani")
                    SMODS.add_card({ key = 'j_fizz_pk_love_a' })
                    card:juice_up(0.3, 0.5)
                    return true
                end,
            }))
        end
        if next(SMODS.find_card("j_fizz_pk_love_a")) then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    play_sound("timpani")
                    SMODS.destroy_cards(SMODS.find_card('j_fizz_pk_love_a'), nil)
                    SMODS.add_card({ key = 'j_fizz_pk_love_b' })
                    card:juice_up(0.3, 0.5)
                    return true
                end,
            }))
        end
        if next(SMODS.find_card("j_fizz_pk_love_b")) and not next(SMODS.find_card("j_fizz_pk_love_a")) then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    play_sound("timpani")
                    SMODS.destroy_cards(SMODS.find_card('j_fizz_pk_love_b'), nil)
                    SMODS.add_card({ key = 'j_fizz_pk_love_g' })
                    card:juice_up(0.3, 0.5)
                    return true
                end,
            }))
        end
        if next(SMODS.find_card("j_fizz_pk_love_g")) and not next(SMODS.find_card("j_fizz_pk_love_b")) and not next(SMODS.find_card("j_fizz_pk_love_a")) then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    play_sound("timpani")
                    SMODS.destroy_cards(SMODS.find_card('j_fizz_pk_love_g'), nil)
                    SMODS.add_card({ key = 'j_fizz_pk_love_o' })
                    card:juice_up(0.3, 0.5)
                    return true
                end,
            }))
        end
        if next(SMODS.find_card("j_fizz_pk_love_o")) and not next(SMODS.find_card("j_fizz_pk_love_g")) and not next(SMODS.find_card("j_fizz_pk_love_b")) and not next(SMODS.find_card("j_fizz_pk_love_a")) then
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
    key = 'fizz_thesoulex',
    order = 50,
    func = function(card)
        if card.config.center.key == "c_fizz_thesoulex" and (card.config.center.discovered or card.bypass_discovery_center) then
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
