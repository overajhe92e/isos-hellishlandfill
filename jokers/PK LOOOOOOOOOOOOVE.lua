SMODS.Joker {
    key = 'pk_love_a',
    cost = 10,
    rarity = 'ocstobal_unique',
    atlas = 'pklove',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            stored_chips = 0,
            stored_mult = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.stored_chips, card.ability.extra.stored_mult, (card.ability.extra.stored_chips+card.ability.extra.stored_mult) } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_left > 0 then
            card.ability.extra.stored_chips = card.ability.extra.stored_chips + (hand_chips * 0.25)
            card.ability.extra.stored_mult = card.ability.extra.stored_mult + (mult * 0.25)
            return {
                hand_chips = mod_chips(0),
                mult = mod_mult(0)
            }
        end
        if context.joker_main and G.GAME.current_round.hands_left == 0 then
            return {
                xmult = card.ability.extra.stored_chips + card.ability.extra.stored_mult,
                xchips = card.ability.extra.stored_mult + card.ability.extra.stored_mult
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.stored_chips = 0
            card.ability.extra.stored_mult = 0
            return {
                message = "Reset!",
                colour = G.C.RED
            }
        end
    end
}

SMODS.Joker {
    key = 'pk_love_b',
    cost = 30,
    rarity = 'ocstobal_unique',
    atlas = 'pklove',
    pos = { x = 0, y = 1 },
    config = {
        extra = {
            stored_chips = 0,
            stored_mult = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.stored_chips, card.ability.extra.stored_mult, (card.ability.extra.stored_chips+card.ability.extra.stored_mult) } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_left > 0 then
            card.ability.extra.stored_chips = card.ability.extra.stored_chips + (hand_chips * 0.5)
            card.ability.extra.stored_mult = card.ability.extra.stored_mult + (mult * 0.5)
            return {
                hand_chips = mod_chips(0),
                mult = mod_mult(0)
            }
        end
        if context.joker_main and G.GAME.current_round.hands_left == 0 then
            return {
                xmult = card.ability.extra.stored_chips + card.ability.extra.stored_mult,
                xchips = card.ability.extra.stored_mult + card.ability.extra.stored_mult
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.stored_chips = 0
            card.ability.extra.stored_mult = 0
            return {
                message = "Reset!",
                colour = G.C.RED
            }
        end
    end
}

SMODS.Joker {
    key = 'pk_love_g',
    cost = 50,
    rarity = 'ocstobal_unique',
    atlas = 'pklove',
    pos = { x = 0, y = 2 },
    config = {
        extra = {
            stored_chips = 0,
            stored_mult = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.stored_chips, card.ability.extra.stored_mult, (card.ability.extra.stored_chips+card.ability.extra.stored_mult) } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_left > 0 then
            card.ability.extra.stored_chips = card.ability.extra.stored_chips + hand_chips
            card.ability.extra.stored_mult = card.ability.extra.stored_mult + mult
            return {
                hand_chips = mod_chips(0),
                mult = mod_mult(0)
            }
        end
        if context.joker_main and G.GAME.current_round.hands_left == 0 then
            return {
                xmult = card.ability.extra.stored_chips + card.ability.extra.stored_mult,
                xchips = card.ability.extra.stored_mult + card.ability.extra.stored_mult
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.stored_chips = 0
            card.ability.extra.stored_mult = 0
            return {
                message = "Reset!",
                colour = G.C.RED
            }
        end
    end
}

SMODS.Joker {
    key = 'pk_love_o',
    cost = 100,
    rarity = 'ocstobal_unique',
    atlas = 'pklove',
    pos = { x = 0, y = 3 },
    config = {
        extra = {
            stored_chips = 0,
            stored_mult = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.stored_chips, card.ability.extra.stored_mult, (card.ability.extra.stored_chips+card.ability.extra.stored_mult) } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_left > 0 then
            card.ability.extra.stored_chips = card.ability.extra.stored_chips + (hand_chips * 2)
            card.ability.extra.stored_mult = card.ability.extra.stored_mult + (mult * 2)
            return {
                hand_chips = mod_chips(0),
                mult = mod_mult(0)
            }
        end
        if context.joker_main and G.GAME.current_round.hands_left == 0 then
            return {
                xmult = card.ability.extra.stored_chips + card.ability.extra.stored_mult,
                xchips = card.ability.extra.stored_mult + card.ability.extra.stored_mult
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.stored_chips = 0
            card.ability.extra.stored_mult = 0
            return {
                message = "Reset!",
                colour = G.C.RED
            }
        end
    end
}
