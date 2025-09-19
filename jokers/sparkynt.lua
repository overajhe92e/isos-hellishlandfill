SMODS.Joker { --Sparky..?
    key = "sparkynt",
    config = {
        extra = {
            xmultnchip = 0
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 6,
    rarity = "ocstobal_unique",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 6,
        y = 1
    },
    in_pool = function(self, args)
        return (
                not args
                or args.source ~= 'sho'
                or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
            )
            and true
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmultnchip }, key = pseudorandom('closeig',1,10) == 1 and "j_ocstobal_sparkynt_alt" }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            return {
                x_chips = card.ability.extra.xmultnchip,
                extra = {
                    Xmult = card.ability.extra.xmultnchip
                }
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
                        local sell_value_gain = joker_sell_value * 4
                        card.ability.extra.xmultnchip = card.ability.extra.xmultnchip + sell_value_gain
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:start_dissolve({ G.C.RED }, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                            { message = "Destroyed!", colour = G.C.RED })
                    end
                    return true
                end
            }
        end
    end
}
