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
    ' ERROR'
}

local originquestion = {
    "Origin ",
    "Origin? ",
    "???",
    "nil"
}

local operators = {
    ":",
    ";"
}

--[[

    Seraph's upgrade tree is gonna fucking kill me i swear to god

    There are going to be upgrades for all of his abilities, and unlocks for his abilities.

    ---
        Planned Unlocks:
        Unlock +Chips, +Mult, XChips, EChips+Mult, EEChips+Mult, and so on up until Hyperchip+Mult
    ---
        Planned Upgrades:
        Disable Self Destruct
        Upgrade +Chips, +Mult, XChips, XMult... and so on up until Hyperchip+Mult
        Upgrade Hyperoperator (very fucking expensive)
        Upgrade Point Gain
    ---
        Points are gained by selecting blinds, defeating boss blinds, and rarely gained by scoring cards.
    ---
        Unlocking EChipMult changes his sprite to the "locked tf in" sprite
        Unlocking EEChipMult changes his sprite to the "Angel of the Void" sprite
        Unlocking Hyp.ChipMult changes his sprite to the "Final" Sprite
    ---

]]

SMODS.Joker { --Seraph
    key = "seraph",
    config = {
        extra = {
            ------score------
            point = 0,
            point_gain = 1,
            pluschip = 1,
            plusmult = 1,
            xchip = 1,
            xmult = 1,
            echip = 1,
            emult = 1,
            eechip = 1,
            eemult = 1,
            eeechip = 1,
            eeemult = 1,
            hypchip = 1,
            hypmult = 1,
            hypop = 4,

            ------upgrades------
            no_self_destruct = false,
            pluschipmult_unlock = false,

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
        badges[#badges + 1] = create_badge("Permadebuffed", G.C.OMEGABLACK, G.C.RED, 1)
    end,

    update = function(self, card, dt)
        if not G.GAME.ISO_SPH_Echipmult_Unlock then
            card.children.floating_sprite:set_sprite_pos { x = 1, y = 1 }
        elseif G.GAME.ISO_SPH_Echipmult_Unlock then
            card.children.floating_sprite:set_sprite_pos { x = 2, y = 1 }
            card.children.center:set_sprite_pos { x = 0, y = 2 }
        elseif G.GAME.ISO_SPH_EEchipmult_Unlock then
            card.children.center:set_sprite_pos { x = 1, y = 2 }
            card.children.floating_sprite:set_sprite_pos { x = 3, y = 1 }
        elseif G.GAME.ISO_SPH_HYPchipmult_Unlock then
            card.children.center:set_sprite_pos { x = 1, y = 2 }
            card.children.floating_sprite:set_sprite_pos { x = 4, y = 1 }
        end
        if next(SMODS.find_card("j_ocstobal_recluse")) then
            card:set_eternal(true)
        end
        card:set_debuff(true)
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
                card.ability.extra.hyperop,
                G.GAME.ISO_SPH_PTS
            },
            key =
                G.GAME.ISO_SPH_Echipmult_Unlock_Unlock and "j_ocstobal_seraph_lv100"
                or
                G.GAME.ISO_SPH_EEchipmult_Unlock and "j_ocstobal_seraph_lv300"
                or
                G.GAME.ISO_SPH_hyperop_unlocked and "j_ocstobal_seraph_lv1000"
                or
                G.GAME.ISO_SPH_hyperop_level ~= nil and G.GAME.ISO_SPH_hyperop_level >= 100 and "j_ocstobal_seraph_lv10k"
                or
                G.GAME.ISO_SPH_hyperop_level ~= nil and G.GAME.ISO_SPH_hyperop_level >= 10000 and "j_ocstobal_seraph_lv100k"
                or
                G.GAME.ISO_SPH_hyperop_level ~= nil and G.GAME.ISO_SPH_hyperop_level >= 100000 and "j_ocstobal_seraph_lv1m" 
                or 
                G.GAME.ISO_SPH_hyperop_level ~= nil and G.GAME.ISO_SPH_hyperop_level >= 1e10 and "j_ocstobal_seraph_why"
                or 
                nil
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'bullshit', 1, G.GAME.ISO_SPH_probability_dec, 'j_ocstobal_seraph') then
                return {
                    hypermult = { 1e300, 1e300 }
                }
            end
        end
        if context.setting_blind then
            if G.GAME.round_resets.ante >= 8 and G.GAME.ISO_SPH_no_self_destruct == false then
                if SMODS.pseudorandom_probability(card, 'sphselfdestruct', 1, card.ability.extra.odds2, 'j_ocstobal_seraph') then
                    SMODS.destroy_cards(self)
                    SMODS.add_card { key = "j_ocstobal_brokenseraph" }
                    return {
                        message = "Shattered!"
                    }
                end
            end
            G.GAME.ISO_SPH_PTS = G.GAME.ISO_SPH_PTS + G.GAME.ISO_SPH_point_gain
            return {
                message = "+" .. tostring(G.GAME.ISO_SPH_point_gain) .. " Points",
                colour = G.C.NIGHTMARE_PURPLE
            }
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
        card.ability.ocstobal_fuck_no = true
        card.ability.extra.ocstobal_s_oeternal = true
        G.GAME.iso_lackofbigblind = true
        ease_background_colour { new_colour = G.C.OMEGABLACK, special_colour = G.C.OMEGABLACK, tertiary_colour = G.C.NIGHTMARE_PURPLE, contrast = 2 }
    end,
    remove_from_deck = function(self, card)
        if not next(SMODS.find_card("j_ocstobal_reclusivevessel")) then
            G.GAME.reclusive_vessel = false
            G.GAME.iso_lackofbigblind = false
            G.jokers:change_size(2)
        end
    end,
    calculate = function(self, card, context)
        if context.ending_shop then
            G.GAME.round_resets.blind_choices.Boss = G.omega_blinds()
        end
        if context.debuff_card and context.other_card == self then
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
