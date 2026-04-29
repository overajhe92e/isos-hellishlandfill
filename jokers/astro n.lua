SMODS.Joker {
    key = "astro_n",
    cost = 50,
    rarity = "fizz_terminus",
    atlas = "dw",
    pos = {
        x = 2,
        y = 1
    },
    soul_pos = {
        x = 3,
        y = 1
    },
    loc_vars = function(self, info_queue, card)
        local planets_used = 0
        for k, v in pairs(G.GAME.consumeable_usage) do
            if v.set == 'Planet' then
                planets_used = planets_used + 1
            end
        end
        return { vars = { planets_used } }
    end,
    calculate = function(self, card, context)
        local pu = 0
        for k, v in pairs(G.GAME.consumeable_usage) do
            if v.set == 'Planet' then
                pu = pu + 1
            end
        end
        if context.using_consumeable then
            if context.consumeable.config.center.set == 'Planet' then
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    func = function()
                        SMODS.upgrade_poker_hands({
                            level_up = pu,
                            instant = true
                        })
                        return true
                    end
                }))
            end
        end
    end
}

-- DO NOT PUT SMODS.UPGRADE_POKER_HANDS() IN CONTEXT.POKER_HAND_CHANGED
