SMODS.Joker {
    key = 'furnote',
    cost = 1,
    rarity = 1,
    no_collection = function(self, args)
        return loregrahh()
    end,
    in_pool = function(self, args)
        return loregrahh()
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return { xmult = 10 }
        end
    end
}

SMODS.Joker {
    key = 'love',
    cost = 1,
    rarity = 1,
    no_collection = function(self, args)
        return loregrahh()
    end,
    in_pool = function(self, args)
        return loregrahh()
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return { mult = 50 }
        end
    end
}

SMODS.Joker {
    key = 'letter',
    cost = 1,
    rarity = 1,
    no_collection = function(self, args)
        return morelore()
    end,
    in_pool = function(self, args)
        return loregrahh()
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return { chips = 666 }
        end
    end
}

SMODS.Joker {
    key = 'malicesyringe',
    cost = 1,
    rarity = 'ocstobal_cursed',
    atlas = "placeholder",
    calculate = function(self, card, context)
        if context.joker_main then
            return { xmult = 0.5 }
        end
    end
}

SMODS.Joker {
    key = 'lifecrystal',
    cost = 10,
    rarity = 3,
    config = {
        dura = 3
    },
    atlas = "placeholder",

    loc_vars = function(self,info_queue,card)
        return {
            vars = { card.ability.dura }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval then
            if card.ability.dura < 1 then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) - 10
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand_text_area.blind_chips:juice_up()
                        G.hand_text_area.game_chips:juice_up()
                        play_sound('tarot1')
                        card:start_dissolve()
                        return true
                    end
                }))
                return {
                    message = 'Last Save!',
                    saved = 'Saved by Life Crystal',
                    colour = G.C.RED
                }
            elseif card.ability.dura > 0 then
                card.ability.dura = card.ability.dura - 1
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) - 10
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand_text_area.blind_chips:juice_up()
                        G.hand_text_area.game_chips:juice_up()
                        play_sound('tarot1')
                        return true
                    end
                }))
                return {
                    message = 'Saved!',
                    saved = 'Saved by Life Crystal',
                    colour = G.C.RED
                }
            end
        end
    end
}
