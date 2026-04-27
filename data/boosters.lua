SMODS.Booster {
    key = 'disarray_a',
    loc_txt = {
        name = "Disarray Pack",
        text = {
            "Choose {C:attention}#1#{} of {C:attention}#2#{} Faint Disarray Jokers",
            "Does not include {C:fizz_finalrgb}Terminus{}, {C:fizz_ust}Unstable{}, or {C:attention}Unique{} Jokers",
        },
        group_name = "Select"
    },
    config = { extra = 3, choose = 1 },
    weight = 0.6,
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
                set = 'Joker',
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