SMODS.Joker {
    key = 'crystal',
    cost = 10,
    rarity = 'ocstobal_epic',
    atlas = 'other_ocs',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    blueprint_compat = true,
    pools = {
        ["copycats"] = true,
        ["unbalanced"] = true,
        ["ocstob"] = true,
        ["all_junk"] = true
    },
    pronouns = 'she_her',

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_ocstobal_dangerous'), G.C.FILTER, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if not G.jokers then return nil end

        local right_effect_1, right_effect_2, right_effect_3 = nil, nil, nil

        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                local right_joker_1 = G.jokers.cards[i + 1]
                local right_joker_2 = G.jokers.cards[i + 2]
                local right_joker_3 = G.jokers.cards[i + 3]

                if right_joker_1 and right_joker_1 ~= card and right_joker_1.config.center.blueprint_compat then
                    right_effect_1 = SMODS.blueprint_effect(card, right_joker_1, context)
                end

                if right_joker_2 and right_joker_2 ~= card and right_joker_2.config.center.blueprint_compat then
                    right_effect_2 = SMODS.blueprint_effect(card, right_joker_2, context)
                end

                if right_joker_3 and right_joker_3 ~= card and right_joker_3.config.center.blueprint_compat then
                    right_effect_3 = SMODS.blueprint_effect(card, right_joker_3, context)
                end
                break
            end
        end

        if right_effect_1 or right_effect_2 or right_effect_3 then
            local merged_effect = SMODS.merge_effects(
                { right_effect_1 or {} },
                { right_effect_2 or {} },
                { right_effect_3 or {} }
            )

            return merged_effect
        else
            return nil
        end
    end
}

SMODS.Joker {
    key = 'astro',
    cost = 20,
    rarity = 'ocstobal_epic',
    blueprint_compat = true,
    atlas = 'other_ocs',
    pos = { x = 0, y = 1 },
    soul_pos = { x = 1, y = 1 },
    config = {
        extra = {
            chips = 1,
            suit = 'Spades'
        }
    },
    no_collection = false,
    pronouns = 'he_him',

    set_badges = function(self, card, badges)
        if G.current_isomode >= 2 then
            badges[#badges + 1] = create_badge(localize('k_ocstobal_verybad'), G.C.BLACK, G.C.RED, 1)
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    pools = {
        ["unbalanced"] = true,
        ["ocstob"] = true,
        ["all_junk"] = true
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.chips },
            key = G.current_isomode < 2 and "j_ocstobal_astro_balance" or G.current_isomode >= 2 and "j_ocstobal_astro"
        }
    end,

    calculate = function(self, card, context)
        if G.current_isomode >= 2 then
            if context.joker_main then
                return {
                    eechips = card.ability.extra.chips
                }
            end
            if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) and not context.blueprint then
                card.ability.extra.chips = card.ability.extra.chips + 1
                return {
                    message = 'Upgraded!'
                }
            end
            if context.setting_blind and next(SMODS.find_card("j_ocstobal_dw_astro")) then
                SMODS.destroy_cards(SMODS.find_card('j_ocstobal_dw_astro'), nil)
                card.ability.extra.chips = card.ability.extra.chips ^ 18
                return {
                    message = "GET OUT!"
                }
            elseif context.setting_blind and next(SMODS.find_card("j_dw_astro")) and not next(SMODS.find_mod("dw")) and not starspace_mod == true then
                SMODS.destroy_cards(SMODS.find_card('j_dw_astro'), nil)
                card.ability.extra.chips = card.ability.extra.chips ^ 9
                return {
                    message = "GET OUT!"
                }
            elseif context.setting_blind and next(SMODS.find_card("j_jen_astro")) then
                SMODS.destroy_cards(SMODS.find_card('j_jen_astro'), nil)
                card.ability.extra.chips = card.ability.extra.chips ^ 36
                return {
                    message = "GET OUT!"
                }
            end
        elseif G.current_isomode < 2 then
            if context.joker_main then
                return {
                    xchips = card.ability.extra.chips
                }
            end
            if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) and not context.blueprint then
                card.ability.extra.chips = card.ability.extra.chips + 1
                return {
                    message = 'Upgraded!'
                }
            end
            if context.setting_blind and next(SMODS.find_card("j_ocstobal_dw_astro")) then
                SMODS.destroy_cards(SMODS.find_card('j_ocstobal_dw_astro'), nil)
                card.ability.extra.chips = card.ability.extra.chips * 16
                return {
                    message = "GET OUT!"
                }
            end
        end
    end
}

SMODS.Joker {
    key = 'mask',
    cost = 30,
    rarity = 4,
    config = {
        jokerslots = 1
    },
    pools = {["ocstob"] = true,["all_junk"] = true},
    blueprint_compat = false,
    atlas = 'other_ocs',
    pos = { x = 2, y = 0 },
    soul_pos = { x = 3, y = 0 },

    update = function(self, card, dt)
    end,

    pronouns = 'it_its',

    calculate = function(self, card, context)
        if context.setting_blind then
            G.jokers:change_size(card.ability.jokerslots)
            return {
                message = ('+' .. tostring(card.ability.jokerslots) .. 'Slots')
            }
        end
    end
}

SMODS.Joker {
    key = 'xeno',
    cost = 25,
    rarity = 'ocstobal_epic',
    atlas = 'other_ocs',
    pos = { x = 4, y = 0 },
    soul_pos = { x = 5, y = 0 },
    config = {
        extra = {
            chips = 1,
            mult = 1,
            suit_1 = "Spades",
            suit_2 = "Hearts"
        }
    },
    pools = {["ocstob"] = true,["all_junk"] = true},
    pronouns = "they_them",
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.chips, card.ability.extra.mult }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.suit_1) and not context.blueprint then
                card.ability.extra.chips = card.ability.extra.chips + 0.25
                return {
                    message = 'Upgraded!',
                    colour = G.C.CHIPS,
                }
            elseif context.other_card:is_suit(card.ability.extra.suit_2) and not context.blueprint then
                card.ability.extra.mult = card.ability.extra.mult + 0.25
                return {
                    message = 'Upgraded!',
                    colour = G.C.MULT,
                }
            end
        end
        if context.joker_main then
            return {
                xchips = card.ability.extra.chips,
                xmult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Joker {
    key = 'solstro',
    cost = 50,
    rarity = "ocstobal_unique",
    atlas = "other_jokers",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            xchips = 1,
            scale = 0.1,
            suit_1 = "Spades",
            n = 0.1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.xchips, card.ability.extra.scale, card.ability.extra.suit_1, card.ability.extra.n }
        }
    end,
    pools = {
        ["all_junk"] = true
    },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.suit_1) and not context.blueprint then
                card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.scale
                return {
                    message = 'Upgraded!',
                    colour = G.C.CHIPS,
                }
            end
        end
        if context.setting_blind and not context.blueprint then
            card.ability.extra.scale = math.log(card.ability.extra.xchips + 1) * ((0.1 * card.ability.extra.xchips) ^ 0.3)
            return {
                message = "Scaled!",
                colour = G.C.FILTER
            }
        end
        if context.joker_main then
            return {
                xchips = card.ability.extra.xchips
            }
        end
    end
}

SMODS.Joker {
    key = 'candycane',
    cost = 10,
    rarity = 3,
    config = {
        extra = {
            i_made_fun_of_him_too_much = 0.1,
            suit_1 = "Diamonds"
        }
    },
    pools = {["ocstob"] = true,["all_junk"] = true},
    blueprint_compat = true,
    atlas = 'other_ocs',
    pos = { x = 0, y = 2 },
    soul_pos = { x = 1, y = 2 },
    pronouns = 'he_him',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,

    update = function(self,card,dt)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit_1) and not context.blueprint then
            context.other_card.ability.perma_h_x_mult = context.other_card.ability.perma_h_x_mult or 0
            context.other_card.ability.perma_h_x_mult = context.other_card.ability.perma_h_x_mult + card.ability.extra.i_made_fun_of_him_too_much
            return {
                extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT },
                card = card
            }
        end
    end
}

SMODS.Joker {
    key = "myself",
    name = "isotypical",
    cost = 1234567890,
    rarity = "ocstobal_ultimate",
    atlas = 'other_ocs',
    pos = {x=2,y=2},
    soul_pos = {x=3,y=2},
    loc_vars = function(self,info_queue,card)
        if mod_loaded then
            --infoqueue
        end
        return {
            vars = { localize("k_ocstobal_me_"..pseudorandom("myself",1,16)), }
        }
    end,
    calculate = function(self,card,context)
        if context.initial_scoring_step then
            return {
                remove_default_message = true,
                message = "^^^1.02 Mult&Chips",
                colour = G.C.ISO_LIGHT_PURPLE,
                eeechips = 1.02,
                eeemult = 1.02
            }
        end
        if context.joker_main then
            return {
                remove_default_message = true,
                message = "^^^1.02 Mult&Chips",
                colour = G.C.ISO_LIGHT_PURPLE,
                eeechips = 1.02,
                eeemult = 1.02
            }
        end
        if context.retrigger_joker_check and not context.joker_retrigger and not (context.other_card.ability and context.other_card.ability.name == "isotypical") then
            local retrigger_amount = 0
            for i = 1, #G.jokers.cards do
                retrigger_amount = retrigger_amount + 1
            end
            return {
                repetitions = retrigger_amount,
                card = card
            }
        end
        if context.repetition and context.cardarea == G.play then
            local retrig = 0
            for i = 1, #G.jokers.cards do
                retrig = retrig + 1
            end
            return {
                repetitions = retrig
            }
        end
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.06 * G.SETTINGS.GAMESPEED,
                blockable = false,
                blocking = false,
                func = function()
                    play_sound('tarot2', 0.76, 0.4)
                    return true
                end
            }))
            play_sound('tarot2', 1, 2)
            G.GAME.blind.chips = math.floor(G.GAME.blind.chips ^ 0.75)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            return {
                message = 'Bonk!'
            }
        end
        if context.debuff_card and not context.blueprint then
            return {
                prevent_debuff = true
            }
        end
    end
}