local rgb = SMODS.Gradient{ocstobal_finalrgb}

SMODS.Rarity {
    key = "legendary",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('00f6f8'),
    loc_txt = {
        name = "Legendary+"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "epic",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.005,
    badge_colour = HEX('ff00a7'),
    loc_txt = {
        name = "Epic"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = 'cursed',
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('000000'),
    loc_txt = {
        name = "Cursed"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end
}

SMODS.Rarity {
    key = "unique",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('ffb439'),
    loc_txt = {
        name = "Unique"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "absolute_curse",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('000000'),
    loc_txt = {
        name = "Absolute Curse"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "evil",
    pools = {
        ["Joker"] = True
    },
    default_weight = 0,
    badge_colour = HEX('3df5ff'),
    loc_txt = {
        name = "The True Evil"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end
}

SMODS.Rarity {
    key = "testing",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('444444'),
    loc_txt = {
        name = "testing"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "whatthefuck",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('000fff'),
    loc_txt = {
        --name = "The Absolute, Unholy, and Living Fucking Insanity that is Jen's Almanac Or What Some Of You Call It Polterworx Jokers" yeah im gonna
        name = "Iso's Almanac"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "supercommon",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('ff0000'),
    loc_txt = {
        name = "Extremely Rare"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end
}

SMODS.Rarity {
    key = "challengeexclusive",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('ffa200'),
    loc_txt = {
        name = "Challenge Exclusive"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end
}

SMODS.Rarity {
    key = "transc",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = rgb,
    loc_txt = {
        name = "Transcendant"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end
}

