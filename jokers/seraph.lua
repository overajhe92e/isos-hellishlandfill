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
        badges[#badges+1] = create_badge(localize('k_ocstobal_dangerous'), G.C.BLACK, G.C.RED, 1.2 )
    end,

    update = function(self, card, dt)
        if card.ability.extra.upgrade < 100 then
            card.children.floating_sprite:set_sprite_pos { x = 1, y = 0 }
        elseif card.ability.extra.upgrade >= 100 and card.ability.extra.upgrade < 400 and ocstobal.configbs.unbalanced_mode == true then
            card.children.floating_sprite:set_sprite_pos { x = 2, y = 0 }
            card.children.center:set_sprite_pos { x = 0, y = 1 }
            card:set_cost(1000)
        elseif card.ability.extra.upgrade >= 400 and card.ability.extra.upgrade < 1000 and ocstobal.configbs.unbalanced_mode == true then
            G.GAME.ocstobal_ext = 50
            card.children.center:set_sprite_pos { x = 1, y = 1 }
            card.children.floating_sprite:set_sprite_pos { x = 3, y = 0 }
            card:set_cost(5000)
        elseif card.ability.extra.upgrade >= 1000 and ocstobal.configbs.unbalanced_mode == true then
            G.GAME.ocstobal_ext = 100
            card.children.center:set_sprite_pos { x = 1, y = 1 }
            card.children.floating_sprite:set_sprite_pos { x = 4, y = 0 }
            card:set_cost(2000000)
        end
        if card.ability.extra.upgrade < 100 and card.ability.extra.triggered >= 10 then
            play_sound('ocstobal_upg')
            sphup()
            repeat
                card.ability.extra.triggered = card.ability.extra.triggered - 10
                card.ability.extra.upgrade = card.ability.extra.upgrade + 1
                card.ability.extra.Xmult = card.ability.extra.Xmult + 0.25
                card.ability.extra.chips = card.ability.extra.chips + 10
                G.GAME.sphupg = card.ability.extra.upgrade
            until card.ability.extra.triggered < 10
        elseif card.ability.extra.upgrade >= 100 and card.ability.extra.upgrade < 400 and card.ability.extra.triggered >= 10 and ocstobal.configbs.unbalanced_mode == true then
            sphupmajor()
            play_sound('ocstobal_upg', 0.85, 1)
            repeat
                card.ability.extra.triggered = card.ability.extra.triggered - 10
                card.ability.extra.upgrade = card.ability.extra.upgrade + 1
                card.ability.extra.Xmult = card.ability.extra.Xmult + 3
                card.ability.extra.chips = card.ability.extra.chips + 250
                card.ability.extra.xchips = card.ability.extra.xchips + 2
                G.GAME.sphupg = card.ability.extra.upgrade
            until card.ability.extra.triggered < 10
        elseif card.ability.extra.upgrade >= 400 and card.ability.extra.upgrade < 1000 and card.ability.extra.triggered >= 10 and ocstobal.configbs.unbalanced_mode == true then
            sphupextreme()
            play_sound('ocstobal_upg', 0.75, 2)
            repeat
                card.ability.extra.triggered = card.ability.extra.triggered - 10
                card.ability.extra.upgrade = card.ability.extra.upgrade + 1
                card.ability.extra.Xmult = card.ability.extra.Xmult + 3
                card.ability.extra.chips = card.ability.extra.chips + 250
                card.ability.extra.xchips = card.ability.extra.xchips + 2
                card.ability.extra.emult = card.ability.extra.emult + 0.1
                G.GAME.sphupg = card.ability.extra.upgrade
            until card.ability.extra.triggered < 10
        elseif card.ability.extra.upgrade >= 1000 and card.ability.extra.triggered >= 10 and ocstobal.configbs.unbalanced_mode == true then
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
                G.GAME.sphupg = card.ability.extra.upgrade
            until card.ability.extra.triggered < 10
        end
        if next(SMODS.find_card("j_ocstobal_recluse")) then
            card:set_eternal(true)
        else
            card:set_eternal(false)
        end
    end,

    set_ability = function(self,card,initial,delay_sprites)
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
                card.ability.extra.eemult
            },
            key = card.ability.extra.upgrade >= 1000000 and "j_ocstobal_seraph_why"
            or card.ability.extra.upgrade >= 100 and card.ability.extra.upgrade <= 399 and ocstobal.configbs.unbalanced_mode == true and "j_ocstobal_seraph_lv100" 
            or card.ability.extra.upgrade >= 100 and card.ability.extra.upgrade < 1000000 and ocstobal.configbs.unbalanced_mode == false and "j_ocstobal_seraph_maxedbalanced" 
            or card.ability.extra.upgrade >= 400 and card.ability.extra.upgrade and card.ability.extra.upgrade <= 999 and ocstobal.configbs.unbalanced_mode == true and "j_ocstobal_seraph_lv300" 
            or card.ability.extra.upgrade >= 1000 and card.ability.extra.upgrade < 1000000 and ocstobal.configbs.unbalanced_mode == true and "j_ocstobal_seraph_lv1000" 
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
            if context.individual and context.cardarea == G.play and card.ability.extra.upgrade >= 400 and card.ability.extra.upgrade < 999 then
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
            if context.individual and context.cardarea == G.play and card.ability.extra.upgrade >= 1000 then
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
        end

        -- LOVE increasing (it's actually level still)

        -- if context.joker_main and card.ability.extra.upgrade < 100 and not context.blueprint then
        --     if card.ability.extra.triggered >= 10 then
        --         play_sound('ocstobal_upg')
        --         sphup()
        --         repeat
        --             card.ability.extra.triggered = card.ability.extra.triggered - 10
        --             card.ability.extra.upgrade = card.ability.extra.upgrade + 1
        --             card.ability.extra.Xmult = card.ability.extra.Xmult + 0.25
        --             card.ability.extra.chips = card.ability.extra.chips + 10
        --             G.GAME.sphupg = card.ability.extra.upgrade
        --         until card.ability.extra.triggered < 10
        --     end
        -- end
        -- --for the added +50 chips and +X3 mult
        -- if context.joker_main and card.ability.extra.upgrade >= 100 and card.ability.extra.upgrade < 299 and not context.blueprint then
        --     if card.ability.extra.triggered >= 10 then
        --         sphupmajor()
        --         play_sound('ocstobal_upg')
        --         repeat
        --             card.ability.extra.triggered = card.ability.extra.triggered - 10
        --             card.ability.extra.upgrade = card.ability.extra.upgrade + 1
        --             card.ability.extra.Xmult = card.ability.extra.Xmult + 3
        --             card.ability.extra.chips = card.ability.extra.chips + 250
        --             card.ability.extra.xchips = card.ability.extra.xchips + 2
        --             G.GAME.sphupg = card.ability.extra.upgrade
        --         until card.ability.extra.triggered < 10
        --     end
        -- end
        -- -- if context.joker_main and card.ability.extra.upgrade >= 200 and not context.blueprint then
        -- --     if card.ability.extra.triggered >= 10 then
        -- --         repeat
        -- --         card.ability.extra.triggered = card.ability.extra.triggered - 10
        -- --         card.ability.extra.upgrade = card.ability.extra.upgrade + 1
        -- --         card.ability.extra.Xmult = card.ability.extra.Xmult + 3
        -- --         card.ability.extra.chips = card.ability.extra.chips + 250
        -- --         card.ability.extra.xchips = card.ability.extra.xchips + 0.1
        -- --         until card.ability.extra.triggered < 10
        -- --     end
        -- -- end
        -- --what do you fucking think
        -- if context.joker_main and card.ability.extra.upgrade >= 300 and card.ability.extra.upgrade < 1000 and not context.blueprint then
        --     if card.ability.extra.triggered >= 10 then
        --         sphupextreme()
        --         play_sound('ocstobal_upg', 0.75, 2)
        --         repeat
        --             card.ability.extra.triggered = card.ability.extra.triggered - 10
        --             card.ability.extra.upgrade = card.ability.extra.upgrade + 1
        --             card.ability.extra.Xmult = card.ability.extra.Xmult + 3
        --             card.ability.extra.chips = card.ability.extra.chips + 250
        --             card.ability.extra.xchips = card.ability.extra.xchips + 2
        --             card.ability.extra.emult = card.ability.extra.emult + 0.1
        --             G.GAME.sphupg = card.ability.extra.upgrade
        --         until card.ability.extra.triggered < 10
        --     end
        -- end
        -- if context.joker_main and card.ability.extra.upgrade >= 1000 and card.ability.extra.upgrade < 999999 and not context.blueprint then
        --     if card.ability.extra.triggered >= 10 then
        --         sphupfinal()
        --         play_sound('ocstobal_upg', 0.65, 3)
        --         repeat
        --             card.ability.extra.triggered = card.ability.extra.triggered - 10
        --             card.ability.extra.upgrade = card.ability.extra.upgrade + 1
        --             card.ability.extra.Xmult = card.ability.extra.Xmult + 125
        --             card.ability.extra.chips = card.ability.extra.chips + 100
        --             card.ability.extra.xchips = card.ability.extra.xchips + 100
        --             card.ability.extra.emult = card.ability.extra.emult + 10
        --             card.ability.extra.eemult = card.ability.extra.eemult + 0.6
        --             G.GAME.sphupg = card.ability.extra.upgrade
        --         until card.ability.extra.triggered < 10
        --     end
        -- end
        -- if context.joker_main and card.ability.extra.upgrade >= 1000000 and not context.blueprint then
        --     if card.ability.extra.triggered >= 10 then
        --         wtfdude()
        --         play_sound('ocstobal_loser', 1, 10)
        --         card.ability.extra.triggered = card.ability.extra.triggered - 999999999
        --     end
        -- end
        -- if context.joker_main and card.ability.extra.upgrade >= 100 and not context.blueprint and card.ability.extra.triggered > 100 then
        --     if card.ability.extra.triggered > 100 then
        --         card.ability.extra.triggered = card.ability.extra.triggered - 100
        --         card.ability.extra.upgrade = card.ability.extra.upgrade + 10
        --         card.ability.extra.Xmult = card.ability.extra.Xmult + 3
        --         card.ability.extra.chips = card.ability.extra.chips + 250
        --     end
        -- end
        --remnants of a mistake
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

function sphupfinal()
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
