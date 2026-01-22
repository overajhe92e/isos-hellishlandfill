SMODS.Joker {
    key = 'crystal',
    cost = 10,
    rarity = 'ocstobal_epic',
    atlas = 'other_ocs',
    pos = { x = 0, y = 0 },
    soul_pos = {x=1,y=0},
    blueprint_compat = true,
    pools = {
        ["copycats"] = true,
        ["unbalanced"] = true
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
        ["unbalanced"] = true
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
                for i = 1, #(SMODS.find_card('j_ocstobal_dw_astro')) do
                   card.ability.extra.chips = card.ability.extra.chips ^ 16 
                end
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
    pos = { x = 0, y = 2 },
    soul_pos = { x = 1, y = 2 },
    config = {
        extra = {
            chips = 1,
            mult = 1,
            suit_1 = "Spades",
            suit_2 = "Hearts"
        }
    },
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
