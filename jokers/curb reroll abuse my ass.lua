SMODS.Joker {
    key = 'reroll_abuse',
    cost = 10,
    rarity = 3,
    atlas = "other_jokers",
    pos = { x = 0, y = 2 },
    pools = {
        ["ocstob"] = true
    },
    config = {
        extra = {
            scale = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.scale
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(math.huge)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(-math.huge)
        if card.ability.extra.scale > 0 then
            G.GAME.dollars = (G.GAME.dollars or 0) - (card.ability.extra.scale*2)
        end
    end,
    calculate = function(self, card, context)
        if context.reroll_shop and not context.blueprint then
            card.ability.extra.scale = card.ability.extra.scale + 1
        end
        if context.buying_card and not context.blueprint then
            if card.ability.extra.scale > 0 then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) - card.ability.extra.scale
                return {
                    dollars = -card.ability.extra.scale,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            end
        end
        if context.ante_change and not context.blueprint then
            if context.ante_end then
                card.ability.extra.scale = 0
                return {
                    message = "Reset!",
                    colour = G.C.FILTER
                }
            end
        end
    end
}
