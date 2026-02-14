SMODS.Joker {
    key = 'dogman',
    cost = 12,
    rarity = 3,
    atlas = "other_jokers",
    pos = {x=6,y=0},
    soul_pos = {x=7,y=0},
    pools = {
        ["ocstob"] = true,
        ["all_junk"] = true,
    },
    config = {
        extra = {
            money = 5,
            chipmult = 15,
            xchipmult = 1.25
        }
    },
    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                card.ability.extra.money, card.ability.extra.chipmult, card.ability.extra.xchipmult
            }
        }
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.money
            return {
                remove_default_message = true,
                message = "Woof!",
                chips = card.ability.extra.chipmult,
                mult = card.ability.extra.chipmult,
                xchips = card.ability.extra.xchipmult,
                xmult = card.ability.extra.xchipmult,
                dollars = card.ability.extra.money
            }
        end
    end
}