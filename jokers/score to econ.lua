SMODS.Joker {
    key = 'score_converter',
    rarity = "ocstobal_epic",
    cost = 16,
    calc_dollar_bonus = function(self,card)
        return math.floor(math.log10(G.GAME.chips))
    end,
    atlas = "placeholder"
}
--It's that easy.