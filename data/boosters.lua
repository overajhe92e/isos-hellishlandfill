SMODS.Booster {
    key = 'junkpack_a',
    loc_txt = {
        name = "Junkyard Pack Alpha",
        text = {
            "Choose {C:attention}#1#{} of {C:attention}#2#{} Iso. Junkyard Jokers",
            "Does not include {C:ocstobal_finalrgb}Terminus{}, {C:ocstobal_ust}Cursed{}, or {C:attention}Unique{} Jokers",
        },
        group_name = "Garbage."
    },
    config = { extra = 2, choose = 1 },
    weight = 0.5,
    cost = 10,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.choose, card.ability.extra }
        }
    end,
    ease_background_colour = function(self)
		ease_background_colour { new_colour = HEX('2d58ff'), special_colour = HEX('6585ff'), contrast = 5 }
	end,
    create_card = function(self, card)
        local junk = SMODS.create_card {
                set = "ocstob",
                legendary = true,
                rarity = 1,
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
            }
        return junk
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.BLUE, G.C.BLACK },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}

SMODS.Booster {
    key = 'junkpack_s',
    loc_txt = {
        name = "Junkyard Pack Sigma",
        text = {
            "Choose {C:attention}#1#{} of {C:attention}#2#{} Iso. Junkyard Jokers",
            "Does not include {C:ocstobal_finalrgb}Terminus{}, {C:ocstobal_ust}Cursed{}, or {C:attention}Unique{} Jokers",
        },
        group_name = "Junk."
    },
    config = { extra = 3, choose = 1 },
    cost = 15,
    weight = 0.25,
    atlas = "CustomBoosters",
    pos = { x = 1, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.choose, card.ability.extra }
        }
    end,
    ease_background_colour = function(self)
		ease_background_colour { new_colour = HEX('5247ff'), special_colour = HEX('b57dff'), contrast = 1 }
	end,
    create_card = function(self, card)
        local junk = SMODS.create_card {
                set = "ocstob",
                legendary = true,
                rarity = 1,
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
            }
        return junk
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.BLUE, G.C.BLUE },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}

SMODS.Booster {
    key = 'junkpack_b',
    loc_txt = {
        name = "Junkyard Pack Beta",
        text = {
            "Choose {C:attention}#1#{} of {C:attention}#2#{} Iso. Junkyard Jokers",
            "Does not include {C:ocstobal_finalrgb}Terminus{}, {C:ocstobal_ust}Cursed{}, or {C:attention}Unique{} Jokers",
        },
        group_name = "Junk."
    },
    config = { extra = 5, choose = 2 },
    cost = 20,
    weight = 0.12,
    atlas = "CustomBoosters",
    pos = { x = 2, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.choose, card.ability.extra }
        }
    end,
    ease_background_colour = function(self)
		ease_background_colour { new_colour = HEX('ffb300'), special_colour = HEX('ffe700'), contrast = 5 }
	end,
    create_card = function(self, card)
        local junk = SMODS.create_card {
                set = "ocstob",
                legendary = true,
                rarity = 1,
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
            }
        return junk
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.PASTEL_YELLOW },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}

SMODS.Booster {
    key = 'junkpack_g',
    loc_txt = {
        name = "Junkyard Pack Gamma",
        text = {
            "Choose {C:attention}#1#{} of {C:attention}#2#{} Iso. Junkyard Jokers",
            "Does not include {C:ocstobal_finalrgb}Terminus{}, {C:ocstobal_ust}Cursed{}, or {C:attention}Unique{} Jokers",
        },
        group_name = "Even more junk."
    },
    config = { extra = 7, choose = 2 },
    cost = 30,
    weight = 0.1,
    atlas = "CustomBoosters",
    pos = { x = 3, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.choose, card.ability.extra }
        }
    end,
    ease_background_colour = function(self)
		ease_background_colour { new_colour = HEX('1fff1f'), special_colour = HEX('82ff82'), contrast = 5 }
	end,
    create_card = function(self, card)
        local junk = SMODS.create_card {
                set = "ocstob",
                legendary = true,
                rarity = 1,
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
            }
        return junk
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.GREEN, G.C.GREEN },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}

SMODS.Booster {
    key = 'junkpack_o',
    loc_txt = {
        name = "Junkyard Pack Omega",
        text = {
            "Choose {C:attention}#1#{} of {C:attention}#2#{} Iso. Junkyard Jokers",
            "{C:attention}Include{} {C:ocstobal_finalrgb}Terminus{}, {C:ocstobal_ust}Cursed{}, and/or {C:attention}Unique{} Jokers",
        },
        group_name = "THE Junkyard Pack"
    },
    config = { extra = 10, choose = 1 },
    cost = 100,
    weight = 0.005,
    atlas = "CustomBoosters",
    pos = { x = 4, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.choose, card.ability.extra }
        }
    end,
    ease_background_colour = function(self)
		ease_background_colour { new_colour = HEX('000000'), special_colour = HEX('ff0000'), contrast = 5 }
	end,
    create_card = function(self, card)
        local junk = SMODS.create_card {
                set = "all_junk",
                legendary = true,
                rarity = 1,
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
            }
        return junk
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.BLACK, G.C.RED },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}

SMODS.Booster {
    key = 'steel_wires',
    loc_txt = {
        name = "Steel Wires",
        text = {
            "Don't ask.",
        },
        group_name = "Steel Wires"
    },
    config = { extra = 3, choose = 3 },
    cost = 10,
    weight = 0.05,
    atlas = "CustomBoosters",
    pos = { x = 5, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.choose, card.ability.extra }
        }
    end,
    ease_background_colour = function(self)
		ease_background_colour { new_colour = HEX('ffffff'), special_colour = HEX('ffffff'), contrast = 5 }
	end,
    create_card = function(self, card)
        local wire = SMODS.create_card {
                set = "wire"
            }
        return wire
    end,
}