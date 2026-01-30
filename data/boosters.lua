SMODS.Booster {
    key = 'junkpack',
    loc_txt = {
        name = "Junkyard Pack",
        text = {
            "Choose {C:attention}1{} of {C:attention}3{} Iso. Junkyard Jokers",
            "Does not include {C:ocstobal_finalrgb}Terminus{} or {C:ocstobal_ust}Cursed{} Jokers",
        },
        group_name = "Junk..."
    },
    config = { extra = 3, choose = 1 },
    weight = 0.5,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    draw_hand = true,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.choose, card.ability.extra }
        }
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
            colours = { G.C.BLACK, G.C.RED },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}
