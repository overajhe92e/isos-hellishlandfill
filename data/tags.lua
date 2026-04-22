SMODS.Tag {
    key = "junktag",
    min_ante = 1,
    atlas = 'junkyard_tags',
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.p_fizz_junkpack
    end,
    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
                local booster = SMODS.create_card { key = 'p_fizz_junkpack_b', area = G.play }
                booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
                booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
                booster.T.w = G.CARD_W * 1.27
                booster.T.h = G.CARD_H * 1.27
                booster.cost = 0
                booster.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = booster } })
                booster:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = "terminus_tag",
    atlas = 'junkyard_tags',
    pos = { x = 1, y = 0 },
    apply = function(self, tag, context)
        if context.type == 'store_joker_create' then
            local term = { 0 }
            for _, joker in ipairs(G.jokers.cards) do
                if joker.config.center.rarity == "fizz_beyondexotic" and not term[joker.config.center.key] then
                    term[1] = term[1] + 1
                    term[joker.config.center.key] = true
                end
            end
            if #G.P_JOKER_RARITY_POOLS["fizz_beyondexotic"] > term[1] then
                local card = SMODS.create_card {
                    set = "Joker",
                    rarity = "fizz_beyondexotic",
                    area = context.area,
                }
                create_shop_card_ui(card, 'Joker', context.area)
                card.states.visible = false
                tag:yep('+', G.C.RED, function()
                    card:start_materialize()
                    card:set_cost()
                    return true
                end)
                tag.triggered = true
                return card
            else
                tag:nope()
            end
        end
    end,
}

SMODS.Tag {
    key = "exrare_tag",
    atlas = 'junkyard_tags',
    pos = { x = 2, y = 0 },
    apply = function(self, tag, context)
        if context.type == 'store_joker_create' then
            local ep = { 0 }
            for _, joker in ipairs(G.jokers.cards) do
                if joker.config.center.rarity == "fizz_beyondexotic" and not ep[joker.config.center.key] then
                    ep[1] = ep[1] + 1
                    ep[joker.config.center.key] = true
                end
            end
            if #G.P_JOKER_RARITY_POOLS["fizz_beyondexotic"] > ep[1] then
                local card = SMODS.create_card {
                    set = "Joker",
                    rarity = "fizz_epic",
                    area = context.area,
                }
                create_shop_card_ui(card, 'Joker', context.area)
                card.states.visible = false
                tag:yep('+', G.C.RED, function()
                    card:start_materialize()
                    card:set_cost()
                    return true
                end)
                tag.triggered = true
                return card
            else
                tag:nope()
            end
        end
    end,
    in_pool = function()
        if next(SMODS.find_mod("altid")) then
            return false
        else
            return true
        end
    end
}

SMODS.Tag {
    key = "legend_tag",
    atlas = 'junkyard_tags',
    pos = { x = 3, y = 0 },
    apply = function(self, tag, context)
        if context.type == 'store_joker_create' then
            local lgn = { 0 }
            for _, joker in ipairs(G.jokers.cards) do
                if joker.config.center.rarity == 4 and not lgn[joker.config.center.key] then
                    lgn[1] = lgn[1] + 1
                    lgn[joker.config.center.key] = true
                end
            end
            if #G.P_JOKER_RARITY_POOLS[4] > lgn[1] then
                local card = SMODS.create_card {
                    set = "Joker",
                    rarity = "Legendary",
                    area = context.area,
                }
                create_shop_card_ui(card, 'Joker', context.area)
                card.states.visible = false
                tag:yep('+', G.C.RED, function()
                    card:start_materialize()
                    card:set_cost()
                    return true
                end)
                tag.triggered = true
                return card
            else
                tag:nope()
            end
        end
    end,
}