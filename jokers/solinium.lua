SMODS.Joker { --Solinium
    key = "solinium",
    config = {
        extra = {
            multnchips = 1,
            increaseme = 1
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    atlas = 'triple_s',
    pools = { ["ocstob"] = true, ["all_junk"] = true },
    soul_pos = {
        x = 4,
        y = 0
    },
    update = function(self, card, dt)
        local recluse_check = next(SMODS.find_card("j_ocstobal_recluse")) or
            G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.name == 'recluseblind'
        local dogman_check = next(SMODS.find_card("j_ocstobal_dogman"))
        if dogman_check and not recluse_check then
            card.children.floating_sprite:set_sprite_pos { x = 6, y = 0 }
        elseif recluse_check then
            card.children.floating_sprite:set_sprite_pos { x = 5, y = 0 }
            card:juice_up(0, 0.1) -- so you know polterwor
        else
            card.children.floating_sprite:set_sprite_pos { x = 4, y = 0 }
        end
    end,
    in_pool = function(self, args)
        return (
                not args
                or args.source ~= 'sho'
                or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
            )
            and true
    end,

    loc_vars = function(self, info_queue, card)
        local recluse_check = next(SMODS.find_card("j_ocstobal_recluse")) or
            G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.name == 'recluseblind'
        local dogman_check = next(SMODS.find_card("j_ocstobal_dogman"))
        return {
            vars = {
                card.ability.extra.multnchips,
                localize('k_ocstobal_solinium_quote' .. pseudorandom("seed", 1, 3)),
                localize('k_ocstobal_solinium_extra' .. pseudorandom("seed", 1, 2)),
                localize('k_ocstobal_soliniumscared_quote' .. pseudorandom("seed", 1, 2)),
                localize('k_ocstobal_soliniumangy_quote_' .. pseudorandom("aha", 1, 6)),
                card.ability.extra.increaseme
            },
            key = dogman_check and not recluse_check and "j_ocstobal_soliniumangy" or recluse_check and "j_ocstobal_soliniumscared" or nil
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.increaseme = card.ability.extra.increaseme + 1
            card.ability.extra.multnchips = (card.ability.extra.increaseme * (card.ability.extra.increaseme + 1)) / 2
            return {
                message = "Scaled!"
            }
        end
        if context.cardarea == G.jokers and context.joker_main then
            return {
                Xmult = card.ability.extra.multnchips
            }
        end
    end
}

-- SMODS.Joker {
--     key = "solinium_PWX",
--     cost = 1,
--     rarity = 4,
--     atlas = "triple_s",
--     pos = {x=0,y=3},
--     soul_pos = {x=1,y=3},
--     update = function(self,card,dt)
--         if G.GAME.garbl == true then
--             card.children.floating_sprite:set_sprite_pos { x = 2, y = 3 }
--             card:juice_up(0,0.1)
--         else
--             card.children.floating_sprite:set_sprite_pos { x = 1, y = 3 }
--         end
--     end
-- }

-- for i = 1, #G.jokers.cards do
--     if G.jokers.cards[i].config.center.key == "j_ocstobal_recluse" then
--         card.children.floating_sprite:set_sprite_pos { x = 2, y = 0 }
--     end
-- end

--YOU SHOULD ??? YOURSELF, NOW!