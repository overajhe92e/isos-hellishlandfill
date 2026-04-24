SMODS.Rarity {
    key = "apoc",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('ffa852'),
    get_weight = function(self, weight, object_type)
        return weight
    end,
}



SMODS.Rarity {
    key = "terminus",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('df9aff'),
    get_weight = function(self, weight, object_type)
        return weight
    end,
}