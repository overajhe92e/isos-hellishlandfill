SMODS.Joker {
    key = 'antislopinator',
    cost = 1,
    rarity = 1,
    atlas = 'antislop',
    pos={x=0,y=0},
    add_to_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,
    remove_from_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end,
    calculate = function(self,card,context)
        if G.GAME.chips >= to_big(1e308) then
            forceGameover()
        end
    end
}

SMODS.Joker {
    key = 'evilantislopinator',
    cost = 1,
    rarity = 'ocstobal_challengeexclusive',
    config = {
        emult = 2
    },
    no_collection = true,
    atlas = 'slop',
    pos = {x=0,y=0},
    blueprint_compat = true,
    loc_vars = function(self,info_queue,card)
        return { vars = { card.ability.emult }}
    end,
    add_to_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,
    remove_from_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            card.ability.emult = card.ability.emult * 2
            return {
                emult = card.ability.emult,
            }
        end
        if context.skip_blind then
            card.ability.emult = card.ability.emult * 2
            return {
                message = "X2 EMult"
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
            card.ability.emult = card.ability.emult / 8
            return {
                message = 'Scaled Down!'
            }
        end
        if SMODS.last_hand_oneshot and G.GAME.chips >= to_big(1e308) then
            forceGameover()
        end
    end
}