SMODS.Joker {
    key = 'score_converter',
    rarity = "ocstobal_epic",
    cost = 16,
    calc_dollar_bonus = function(self,card)
        return math.ceil(math.log(G.GAME.chips))
    end,
}
--It's that easy.