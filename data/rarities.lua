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
        name = "EX. Rare"
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
        name = "Hinderance"
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

local term = SMODS.Gradient({
    key = 'temrin',
    colours = {
        HEX('49ff40'),
        HEX('40b9ff'),
        HEX('b357ff'),
        HEX('fff875'),
    },
    interpolation = 'linear',
    cycle = 7
})

SMODS.Rarity {
    key = "beyondexotic",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = term,
    loc_txt = {
        name = "Terminus"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end
}

local e = SMODS.Gradient({
    key = 'cro',
    colours = {
        HEX("df9aff"),
        HEX("cf69ff"),
    },
    interpolation = 'trig',
    cycle = 3
})

SMODS.Rarity {
    key = "ultimate",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = e,
    loc_txt = {
        name = "Isotypical"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end
}

SMODS.Rarity {
    key = "secret",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX("000000"),
    loc_txt = {
        name = "Secret"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end
}

SMODS.Rarity {
    key = "why",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('000000'),
    loc_txt = {
        name = "Game Crashing"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end
}

local deception = SMODS.Gradient {
    key = 'deceit',
    colours = { HEX('2272fb'), HEX('1ffef5') },
    interpolation = 'linear',
    cycle = 5
}

SMODS.Rarity {
    key = "deceptionlegendary",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = deception,
    get_weight = function(self, weight, object_type)
        return weight
    end
}

local omega = SMODS.Gradient {
    key = 'evilmanimani',
    colours = { HEX('ff0000'), HEX('0000ff') },
    interpolation = 'trig',
    cycle = 6
}

SMODS.Rarity {
    key = "junk",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('666666')
}

SMODS.Rarity {
    key = "omega",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = omega
}