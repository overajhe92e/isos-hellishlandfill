SMODS.Sound {
    key = 'upg',
    path = 'enchant.ogg',
    volume = 1,
    pitch = 1
}

--yes this is the malice sound effect from pwx

SMODS.Joker { --Seraph
    key = "seraph",
    config = {
        extra = {
            odds = 3,
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
        y = 0
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'sphredo',
    soul_pos = {
        x = 1,
        y = 0
    },
    pools = {
        ["ocstob"] = true
    },

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_ocstobal_dangerous'), G.C.FILTER, G.C.WHITE, 1)
    end,

    update = function(self, card, dt)
        if card.ability.extra.upgrade < 100 then
            card.children.floating_sprite:set_sprite_pos { x = 1, y = 0 }
        elseif card.ability.extra.upgrade >= 100 and card.ability.extra.upgrade < 400 and G.current_isomode >= 1 then
            card.children.floating_sprite:set_sprite_pos { x = 2, y = 0 }
            card.children.center:set_sprite_pos { x = 0, y = 1 }
        elseif card.ability.extra.upgrade >= 400 and card.ability.extra.upgrade < 1000 and G.current_isomode >= 1 then
            card.children.center:set_sprite_pos { x = 1, y = 1 }
            card.children.floating_sprite:set_sprite_pos { x = 3, y = 0 }
        elseif card.ability.extra.upgrade >= 1000 and G.current_isomode >= 1 then
            card.children.center:set_sprite_pos { x = 1, y = 1 }
            card.children.floating_sprite:set_sprite_pos { x = 4, y = 0 }
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
            sphupfinal()
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
                card.ability.extra.Xmult = card.ability.extra.Xmult ^ 1.1
                card.ability.extra.chips = card.ability.extra.chips ^ 1.1
                card.ability.extra.xchips = card.ability.extra.xchips ^ 1.1
                card.ability.extra.emult = card.ability.extra.emult ^ 1.1
                card.ability.extra.eemult = card.ability.extra.eemult ^ 1.1
                card.ability.extra.eemult = card.ability.extra.eeemult * 2
            until card.ability.extra.triggered < 10
        elseif card.ability.extra.upgrade >= 10000000 and card.ability.extra.triggered >= 10 then
            wtfdude()
            play_sound('ocstobal_loser', 1, 100)
            card.ability.extra.triggered = card.ability.extra.triggered - 1e300
        end
        if next(SMODS.find_card("j_ocstobal_recluse")) then
            card:set_eternal(true)
        else
            card:set_eternal(false)
        end
    end,

    set_ability = function(self, card, initial, delay_sprites)
    end,


    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,
            'j_ocstobal_seraph')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2,
            'j_ocstobal_seraph')
        return {
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
                card.ability.extra.eeemult
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
                G.current_isomode >= 1 and card.ability.extra.upgrade >= 10000 and card.ability.extra.upgrade < 1000000 and
                "j_ocstobal_seraph_lv10k"
                or
                G.current_isomode >= 1 and card.ability.extra.upgrade >= 100000 and card.ability.extra.upgrade < 10000000 and
                "j_ocstobal_seraph_lv100k"

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
        if context.individual and context.cardarea == G.play and card.ability.extra.upgrade >= 5 then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_fadbda89', 1, card.ability.extra.odds, 'j_ocstobal_seraph') then
                    card.ability.extra.triggered = card.ability.extra.triggered + 1
                    SMODS.calculate_effect({ Xmult = card.ability.extra.Xmult, chips = card.ability.extra.chips }, card)
                end
            end
            if context.individual and context.cardarea == G.play and card.ability.extra.upgrade >= 10 then
                if true then
                    card.ability.extra.triggered = card.ability.extra.triggered + 1
                    SMODS.calculate_effect({ Xmult = card.ability.extra.Xmult, chips = card.ability.extra.chips }, card)
                end
            end
            if context.individual and context.cardarea == G.play and card.ability.extra.upgrade >= 100 and card.ability.extra.upgrade < 400 then
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
            end
            if context.individual and context.cardarea == G.play and card.ability.extra.upgrade >= 400 and card.ability.extra.upgrade < 1000 then
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
            end
            if context.individual and context.cardarea == G.play and card.ability.extra.upgrade >= 1000 and card.ability.extra.upgrade < 10000 then
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
            end
            if context.individual and context.cardarea == G.play and card.ability.extra.upgrade >= 10000 then
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
    key = 'seraphnt',
    cost = 1,
    rarity = 'ocstobal_cursed',
    config = {
        re = 1
    },
    no_collection = function(self,args)
        return morelore()
    end,

    loc_vars = function(self, info_queue, card)
        return {
            key = card.ability.re == 1 and 'j_ocstobal_seraphnt' or
                card.ability.re == 2 and 'j_ocstobal_seraphnt2' or
                card.ability.re == 3 and 'j_ocstobal_seraphnt3' or
                card.ability.re == 4 and 'j_ocstobal_seraphnt4' or
                card.ability.re >= 5 and 'j_ocstobal_seraphntnomore'
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and not context.blueprint then
            card.ability.re = card.ability.re + 1
            return { chips = 666 }
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
