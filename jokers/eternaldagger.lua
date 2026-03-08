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
        if context.setting_blind and not context.blueprint then
            local my_pos = nil
            local haters = { "j_ocstobal_oxhatred", "j_ocstobal_sparkhatred", "j_ocstobal_solhatred" }
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos + 1] and G.jokers.cards[my_pos+1] ~= card.ability.ocstobal_fuck_no and not G.jokers.cards[my_pos + 1].getting_sliced then
                for _, v in ipairs(haters) do
                    local sliced_card = G.jokers.cards[my_pos + 1]
                    if sliced_card == v then
                        sliced_card.getting_sliced = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.joker_buffer = 0
                                card:juice_up(0.8, 0.8)
                                sliced_card:start_dissolve({ HEX("000000") }, nil, 1.6)
                                play_sound('slice1', 0.96 + math.random() * 0.08)
                                return true
                            end
                        }))
                        return {
                            message = "Annihilated.",
                            colour = G.C.OMEGABLACK,
                            no_juice = true
                        }
                    else
                        sliced_card.getting_sliced = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.joker_buffer = 0
                                card:juice_up(0.8, 0.8)
                                sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                                play_sound('slice1', 0.96 + math.random() * 0.08)
                                return true
                            end
                        }))
                        return {
                            message = "Destroyed!",
                            colour = G.C.RED,
                            no_juice = true
                        }
                    end
                end
            end
        end
    end
}
