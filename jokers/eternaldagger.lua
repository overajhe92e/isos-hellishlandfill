SMODS.Joker { --Eternal Dagger
    key = "eternaldagger",
    config = {},
    pos = {
        x = 0,
        y = 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'other_jokers',
    pools = { ["ocstob"] = true, ["all_junk"] = true },
    soul_pos = {
        x = 1,
        y = 1
    },

    calculate = function(self, card, context)
        if context.setting_blind then
            return {
                func = function()
                    local my_pos = nil
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then
                            my_pos = i
                            break
                        end
                    end
                    local target_joker = nil
                    if my_pos and my_pos < #G.jokers.cards then
                        local joker = G.jokers.cards[my_pos + 1]
                        if true and not joker.getting_sliced then
                            target_joker = joker
                        end
                    end

                    if target_joker then
                        if target_joker.ability.ocstobal_fuck_no then
                            return false
                        else
                            if target_joker.ability.eternal then
                                target_joker.ability.eternal = nil
                            end
                            if target_joker.ability.ocstobal_aeternal then
                                target_joker.ability.ocstobal_aeternal = nil
                            end
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({ G.C.RED }, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, { message = "Eradicated.", colour = G.C.RED })
                        end
                    end
                    return true
                end
            }
        end
    end
}
