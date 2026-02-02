SMODS.Sound {
    key = 'upg',
    path = 'enchant.ogg',
    volume = 1,
    pitch = 1
}

--yes this is the malice sound effect from pwx

local ocstobal_all_origins = {
    ' Fundamental Paper Education', --what do you fucking think
    ' Poppy Playtime',              --used to be a dragon
    ' Smiling Critters',            -- read above
    ' Hypixel Skyblock',            --"voidgloom seraph" boss lmfao
}

local originquestion = {
    'ORIGIN ',
    'Origin ',
    'OriGIN ',
    'oRIGIN ',
    'OrIgIn ',
    'OriGIn ',
    'orIGIN ',
    'oRiGIn ',
    'oRigiN '
}

local operators = {
    ":",
    ";"
}

SMODS.Joker { --Seraph
    key = "seraph",
    config = {
        extra = {
            odds = 2,
            chips = 0,
            Xmult = 2,
            xchips = 10,
            odds2 = 20,
            upgrade = 0,
            triggered = 0,
            emult = 1,
            eemult = 1,
            eeemult = 1,
            hypmult = 1,
            hyperop = 4,
            extra_cost = 1
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 10,
    rarity = 'ocstobal_epic',
    atlas = 'triple_s',
    soul_pos = {
        x = 1,
        y = 1
    },

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_ocstobal_dangerous'), G.C.FILTER, G.C.WHITE, 1)
    end,

    update = function(self, card, dt)
        if card.ability.extra.upgrade < 100 then
            card.children.floating_sprite:set_sprite_pos { x = 1, y = 1 }
        elseif card.ability.extra.upgrade >= 100 and card.ability.extra.upgrade < 400 and G.current_isomode >= 1 then
            card.children.floating_sprite:set_sprite_pos { x = 2, y = 1 }
            card.children.center:set_sprite_pos { x = 0, y = 2 }
        elseif card.ability.extra.upgrade >= 400 and card.ability.extra.upgrade < 1000 and G.current_isomode >= 1 then
            card.children.center:set_sprite_pos { x = 1, y = 2 }
            card.children.floating_sprite:set_sprite_pos { x = 3, y = 1 }
        elseif card.ability.extra.upgrade >= 1000 and G.current_isomode >= 1 then
            card.children.center:set_sprite_pos { x = 1, y = 2 }
            card.children.floating_sprite:set_sprite_pos { x = 4, y = 1 }
        end
        if card.ability.extra.upgrade < 100 and card.ability.extra.triggered >= 10 then
            play_sound('ocstobal_upg')
            sphup()
            repeat
                card.ability.extra.triggered = card.ability.extra.triggered - 10
                card.ability.extra.upgrade = card.ability.extra.upgrade + 1
                card.ability.extra.Xmult = card.ability.extra.Xmult + 0.25
                card.ability.extra.chips = card.ability.extra.chips + 10
            until card.ability.extra.triggered < 10
        elseif card.ability.extra.upgrade >= 100 and card.ability.extra.upgrade < 400 and card.ability.extra.triggered >= 10 and G.current_isomode >= 1 then
            sphupmajor()
            play_sound('ocstobal_upg', 0.85, 1)
            repeat
                card.ability.extra.triggered = card.ability.extra.triggered - 10
                card.ability.extra.upgrade = card.ability.extra.upgrade + 1
                card.ability.extra.Xmult = card.ability.extra.Xmult + 3
                card.ability.extra.chips = card.ability.extra.chips + 250
                card.ability.extra.xchips = card.ability.extra.xchips + 2
            until card.ability.extra.triggered < 10
        elseif card.ability.extra.upgrade >= 400 and card.ability.extra.upgrade < 1000 and card.ability.extra.triggered >= 10 and G.current_isomode >= 1 then
            sphupextreme()
            play_sound('ocstobal_upg', 0.75, 2)
            repeat
                card.ability.extra.triggered = card.ability.extra.triggered - 10
                card.ability.extra.upgrade = card.ability.extra.upgrade + 1
                card.ability.extra.Xmult = card.ability.extra.Xmult + 3
                card.ability.extra.chips = card.ability.extra.chips + 250
                card.ability.extra.xchips = card.ability.extra.xchips + 2
                card.ability.extra.emult = card.ability.extra.emult + 0.1
            until card.ability.extra.triggered < 10
        elseif card.ability.extra.upgrade >= 1000 and card.ability.extra.triggered >= 10 and card.ability.extra.upgrade < 10000 and G.current_isomode >= 1 then
            sphupextreme()
            play_sound('ocstobal_upg', 0.65, 3)
            repeat
                card.ability.extra.triggered = card.ability.extra.triggered - 10
                card.ability.extra.upgrade = card.ability.extra.upgrade + 1
                card.ability.extra.Xmult = card.ability.extra.Xmult + 12
                card.ability.extra.chips = card.ability.extra.chips + 1000
                card.ability.extra.xchips = card.ability.extra.xchips + 8
                card.ability.extra.emult = card.ability.extra.emult + 8
                card.ability.extra.eemult = card.ability.extra.eemult + 1
            until card.ability.extra.triggered < 10
        elseif card.ability.extra.upgrade >= 10000 and card.ability.extra.triggered >= 10 and card.ability.extra.upgrade < 100000 and G.current_isomode >= 1 then
            ohgod()
            play_sound('ocstobal_upg', 0.6, 3)
            repeat
                card.ability.extra.triggered = card.ability.extra.triggered - 10
                card.ability.extra.upgrade = card.ability.extra.upgrade + 1
                card.ability.extra.Xmult = card.ability.extra.Xmult + 666
                card.ability.extra.chips = card.ability.extra.chips + 50000
                card.ability.extra.xchips = card.ability.extra.xchips + 16
                card.ability.extra.emult = card.ability.extra.emult + 16
                card.ability.extra.eemult = card.ability.extra.eemult + 16
                card.ability.extra.eeemult = card.ability.extra.eeemult + 5
            until card.ability.extra.triggered < 10
        elseif card.ability.extra.upgrade >= 100000 and card.ability.extra.triggered >= 10 and card.ability.extra.upgrade < 1000000 then
            ohgod()
            repeat
                card.ability.extra.triggered = card.ability.extra.triggered - 10
                card.ability.extra.upgrade = card.ability.extra.upgrade + 1
                card.ability.extra.Xmult = card.ability.extra.Xmult * 1.05
                card.ability.extra.chips = card.ability.extra.chips * 1.05
                card.ability.extra.xchips = card.ability.extra.xchips * 1.05
                card.ability.extra.emult = card.ability.extra.emult * 1.05
                card.ability.extra.eemult = card.ability.extra.eemult * 1.05
                card.ability.extra.eeemult = card.ability.extra.eeemult * 1.05
                card.ability.extra.hypmult = card.ability.extra.hypmult + 1
            until card.ability.extra.triggered < 10
        elseif card.ability.extra.upgrade >= 1000000 and card.ability.extra.triggered >= 10 and card.ability.extra.upgrade <= 1000000 then
            ohgod()
            repeat
                card.ability.extra.triggered = card.ability.extra.triggered - 10
                card.ability.extra.upgrade = card.ability.extra.upgrade + 1
                card.ability.extra.Xmult = card.ability.extra.Xmult * 1.05
                card.ability.extra.chips = card.ability.extra.chips * 1.05
                card.ability.extra.xchips = card.ability.extra.xchips * 1.05
                card.ability.extra.emult = card.ability.extra.emult * 1.05
                card.ability.extra.eemult = card.ability.extra.eemult * 1.05
                card.ability.extra.eeemult = card.ability.extra.eeemult * 1.05
                card.ability.extra.hypmult = card.ability.extra.hypmult + 1
                card.ability.extra.hyperop = card.ability.extra.hyperop + 0.05
            until card.ability.extra.triggered < 10
        elseif card.ability.extra.upgrade >= 10000000 and card.ability.extra.triggered >= 10 then
            wtfdude()
            play_sound('ocstobal_loser', 1, 100)
            card.ability.extra.triggered = card.ability.extra.triggered - 1e300
        end
        if next(SMODS.find_card("j_ocstobal_recluse")) then
            card:set_eternal(true)
        end
    end,

    set_ability = function(self, card, initial, delay_sprites)
    end,
    pools = {
        ["unbalanced"] = true,
        ["ocstob"] = true,
        ["all_junk"] = true
    },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,
            'j_ocstobal_seraph')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2,
            'j_ocstobal_seraph')
        return {
            main_end = {
                { n = G.UIT.O, config = { object = DynaText({ string = originquestion, colours = { G.C.DARK_EDITION }, pop_in_rate = 999999, silent = true, random_element = true, pop_delay = 0.2, scale = 0.32, min_cycle_time = 0 }) } },
                { n = G.UIT.O, config = { object = DynaText({ string = operators, colours = { G.C.DARK_EDITION }, pop_in_rate = 999999, silent = true, random_element = true, pop_delay = 1, scale = 0.32, min_cycle_time = 0 }) } },
                { n = G.UIT.O, config = { object = DynaText({ string = ocstobal_all_origins, colours = { G.C.DARK_EDITION }, pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.25, scale = 0.32, min_cycle_time = 0 }) } },
            },
            vars = {
                localize('k_ocstobal_seraph_quote' .. pseudorandom("seed", 1, 5)),
                localize('k_ocstobal_seraph_lv100_quote' .. pseudorandom("seed", 1, 5)),
                localize('k_ocstobal_seraph_lv300_quote' .. pseudorandom("seed", 1, 5)),
                localize('k_ocstobal_seraph_final_quote' .. pseudorandom("seed", 1, 5)),
                new_numerator,
                new_denominator,
                new_numerator2,
                new_denominator2,
                card.ability.extra.triggered,
                card.ability.extra.upgrade,
                card.ability.extra.Xmult,
                card.ability.extra.chips,
                card.ability.extra.emult,
                card.ability.extra.xchips,
                card.ability.extra.eemult,
                card.ability.extra.eeemult,
                card.ability.extra.hypmult,
                card.ability.extra.hyperop
            },
            key = card.ability.extra.upgrade >= 10000000 and "j_ocstobal_seraph_why"
                or
                G.current_isomode >= 1 and card.ability.extra.upgrade >= 100 and card.ability.extra.upgrade <= 399 and
                "j_ocstobal_seraph_lv100"
                or
                G.current_isomode <= 0 and card.ability.extra.upgrade >= 100 and card.ability.extra.upgrade < 10000000 and
                "j_ocstobal_seraph_maxedbalanced"
                or
                G.current_isomode >= 1 and card.ability.extra.upgrade >= 400 and card.ability.extra.upgrade and
                card.ability.extra.upgrade <= 999 and "j_ocstobal_seraph_lv300"
                or
                G.current_isomode >= 1 and card.ability.extra.upgrade >= 1000 and card.ability.extra.upgrade < 10000 and
                "j_ocstobal_seraph_lv1000"
                or
                G.current_isomode >= 1 and card.ability.extra.upgrade >= 10000 and card.ability.extra.upgrade < 100000 and
                "j_ocstobal_seraph_lv10k"
                or
                G.current_isomode >= 1 and card.ability.extra.upgrade >= 100000 and card.ability.extra.upgrade < 1e6 and
                "j_ocstobal_seraph_lv100k"
                or G.current_isomode >= 1 and card.ability.extra.upgrade >= 1e6 and card.ability.extra.upgrade < 1e7 and
                "j_ocstobal_seraph_lv1m"
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and card.ability.extra.upgrade < 5 then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_fadbda89', 1, card.ability.extra.odds, 'j_ocstobal_seraph') then
                    card.ability.extra.triggered = card.ability.extra.triggered + 1
                    SMODS.calculate_effect({ Xmult = card.ability.extra.Xmult }, card)
                end
            end
        end
        if context.individual and context.cardarea == G.play and card.ability.extra.upgrade >= 5 and card.ability.extra.upgrade < 10 then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_fadbda89', 1, card.ability.extra.odds, 'j_ocstobal_seraph') then
                    card.ability.extra.triggered = card.ability.extra.triggered + 1
                    SMODS.calculate_effect({ Xmult = card.ability.extra.Xmult, chips = card.ability.extra.chips }, card)
                end
            end
        elseif context.individual and context.cardarea == G.play and card.ability.extra.upgrade >= 10 and card.ability.extra.upgrade < 100 then
            if true then
                card.ability.extra.triggered = card.ability.extra.triggered + 1
                SMODS.calculate_effect({ Xmult = card.ability.extra.Xmult, chips = card.ability.extra.chips }, card)
            end
        elseif context.individual and context.cardarea == G.play and card.ability.extra.upgrade >= 100 and card.ability.extra.upgrade < 400 then
            if true then
                card.ability.extra.triggered = card.ability.extra.triggered + 1
                SMODS.calculate_effect(
                    {
                        Xmult = card.ability.extra.Xmult,
                        chips = card.ability.extra.chips,
                        xchips = card.ability.extra
                            .xchips
                    }, card)
            end
        elseif context.individual and context.cardarea == G.play and card.ability.extra.upgrade >= 400 and card.ability.extra.upgrade < 1000 then
            if true then
                card.ability.extra.triggered = card.ability.extra.triggered + 1
                SMODS.calculate_effect(
                    {
                        Xmult = card.ability.extra.Xmult,
                        chips = card.ability.extra.chips,
                        xchips = card.ability.extra
                            .xchips,
                        e_mult = card.ability.extra.emult
                    }, card)
            end
        elseif context.individual and context.cardarea == G.play and card.ability.extra.upgrade >= 1000 and card.ability.extra.upgrade < 10000 then
            if true then
                card.ability.extra.triggered = card.ability.extra.triggered + 1
                SMODS.calculate_effect(
                    {
                        Xmult = card.ability.extra.Xmult,
                        chips = card.ability.extra.chips,
                        xchips = card.ability.extra.xchips,
                        e_mult = card.ability.extra.emult,
                        ee_mult = card.ability.extra.eemult
                    }, card)
            end
        elseif context.individual and context.cardarea == G.play and card.ability.extra.upgrade >= 10000 and card.ability.extra.upgrade < 1e5 then
            if true then
                card.ability.extra.triggered = card.ability.extra.triggered + 1
                SMODS.calculate_effect(
                    {
                        Xmult = card.ability.extra.Xmult,
                        chips = card.ability.extra.chips,
                        xchips = card.ability.extra.xchips,
                        e_mult = card.ability.extra.emult,
                        ee_mult = card.ability.extra.eemult,
                        eee_mult = card.ability.extra.eeemult
                    }, card)
            end
        elseif context.individual and context.cardarea == G.play and card.ability.extra.upgrade >= 1e5 and card.ability.extra.upgrade < 1e6 then
            if true then
                card.ability.extra.triggered = card.ability.extra.triggered + 1
                SMODS.calculate_effect(
                    {
                        Xmult = card.ability.extra.Xmult,
                        chips = card.ability.extra.chips,
                        xchips = card.ability.extra.xchips,
                        e_mult = card.ability.extra.emult,
                        ee_mult = card.ability.extra.eemult,
                        eee_mult = card.ability.extra.eeemult,
                        hypermult = { 4, card.ability.extra.hypmult }
                    }, card)
            end
        elseif context.individual and context.cardarea == G.play and card.ability.extra.upgrade >= 1e6 then
            if true then
                card.ability.extra.triggered = card.ability.extra.triggered + 1
                SMODS.calculate_effect(
                    {
                        Xmult = card.ability.extra.Xmult,
                        chips = card.ability.extra.chips,
                        xchips = card.ability.extra.xchips,
                        e_mult = card.ability.extra.emult,
                        ee_mult = card.ability.extra.eemult,
                        eee_mult = card.ability.extra.eeemult,
                        hypermult = { card.ability.extra.hyperop, card.ability.extra.hypmult }
                    }, card)
            end
        end
        if context.setting_blind then
            if G.GAME.round_resets.ante >= 8 and card.ability.extra.upgrade < 10 then
                if SMODS.pseudorandom_probability(card, 'group_0_5a1e6a25', 1, card.ability.extra.odds2, 'j_ocstobal_seraph') then
                    SMODS.calculate_effect({
                        func = function()
                            card:start_dissolve()
                            return true
                        end
                    }, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                        { message = "I cant. I CANT.", colour = G.C.RED })
                    SMODS.calculate_effect({
                        func = function()
                            local created_joker = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_ocstobal_brokenseraph' })
                                    if joker_card then
                                    end
                                    return true
                                end
                            }))

                            if created_joker then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                                    { message = localize('k_plus_joker'), colour = G.C.BLUE })
                            end
                            return true
                        end
                    }, card)
                end
            end
        end
    end

}

SMODS.Joker {
    key = 'reclusivevessel',
    cost = 666,
    rarity = 'ocstobal_omega',
    config = {
        extra = {
            xstuff = 1,
            estuff = 1
        }
    },
    atlas = "triple_s",
    pos = { x = 2, y = 2 },
    soul_pos = { x = 3, y = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xstuff, card.ability.extra.estuff } }
    end,
    pools = {
        ["all_junk"] = true
    },
    add_to_deck = function(self, card)
        G.GAME.reclusive_vessel = true
        G.jokers:change_size(-2)
        card:set_eternal(true)
        ease_background_colour { new_colour = G.C.OMEGABLACK, special_colour = G.C.OMEGABLACK, tertiary_colour = G.C.NIGHTMARE_PURPLE, contrast = 2 }
    end,
    remove_from_deck = function(self, card)
        if not next(SMODS.find_card("j_ocstobal_reclusivevessel")) then
            G.GAME.reclusive_vessel = false
            G.jokers:change_size(2)
        end
    end,
    calculate = function(self, card, context)
        if context.ending_shop then
            G.GAME.round_resets.blind_choices.Small = G.omega_blinds()
            G.GAME.round_resets.blind_choices.Big = G.omega_blinds()
            G.GAME.round_resets.blind_choices.Boss = G.omega_blinds()
        end
        if context.debuff_card then
            return {
                prevent_debuff = true
            }
        end
        if context.joker_main then
            return {
                message = "X" ..
                    tostring(card.ability.extra.xstuff) ..
                    "Mult&Chips, ^" .. tostring(card.ability.extra.estuff) .. "EMult&Chips",
                Xmult_mod = card.ability.extra.xstuff,
                Xchips_mod = card.ability.extra.xstuff,
                Emult_mod = card.ability.extra.estuff,
                Echip_mod = card.ability.extra.estuff
            }
        end
        if context.individual and context.cardarea == G.play then
            card.ability.extra.xstuff = card.ability.extra.xstuff + 1
            card.ability.extra.estuff = card.ability.extra.estuff + 0.1
            return {
                message = "Scaled..."
            }
        end
        if context.setting_blind then
            return {
                func = function()
                    local destructable_jokers = {}
                    for i, joker in ipairs(G.jokers.cards) do
                        if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
                            table.insert(destructable_jokers, joker)
                        end
                    end
                    local target_joker = #destructable_jokers > 0 and
                        pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil

                    if target_joker then
                        local joker_sell_value = target_joker.sell_cost or 0
                        local sell_value_gain = joker_sell_value * 10
                        local sell_value_gain_alt = joker_sell_value * 1
                        card.ability.extra.xstuff = card.ability.extra.xstuff + sell_value_gain
                        card.ability.extra.estuff = card.ability.extra.estuff + sell_value_gain_alt
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:start_dissolve({ G.C.RED }, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                            { message = "ERADICATED.", colour = G.C.RED })
                    end
                    return true
                end
            }
        end
    end
}

function sphup()
    local text = localize('sphlvl')
    attention_text({
        scale = 1,
        text = text,
        hold = 5,
        align = 'cm',
        offset = { x = 0, y = -2.7 },
        major = G.play,
        colour = HEX('E6E6FA')
    })
end

function sphupmajor()
    local text = localize('sphlvlmajor')
    attention_text({
        scale = 1,
        text = text,
        hold = 8,
        align = 'cm',
        offset = { x = 0, y = -2.7 },
        major = G.play,
        colour = HEX('FF0000')
    })
end

function sphupextreme()
    local text = localize('sphlvlextreme')
    attention_text({
        scale = 0.7,
        text = text,
        hold = 8,
        align = 'cm',
        offset = { x = 0, y = -2.7 },
        major = G.play,
        colour = HEX('301934')
    })
end

function ohgod()
    local text = localize('sphlvlabsolutefinal')
    attention_text({
        scale = 0.7,
        text = text,
        hold = 8,
        align = 'cm',
        offset = { x = 0, y = -2.7 },
        major = G.play,
        colour = HEX('ffffff')
    })
end

function sphupfinal()
    local text = localize('sphbeyond')
    attention_text({
        scale = 0.7,
        text = text,
        hold = 8,
        align = 'cm',
        offset = { x = 0, y = -2.7 },
        major = G.play,
        colour = HEX('000000')
    })
end

function wtfdude()
    local text = localize('sphwhy')
    attention_text({
        scale = 1,
        text = text,
        hold = 8,
        align = 'cm',
        offset = { x = 0, y = -2.7 },
        major = G.play,
        colour = HEX('ffffff')
    })
end
