local ocstobal_all_origins = {
    'nil',
    'Fundamental Paper Education', --what do you fucking think
    'Poppy Playtime',              --used to be a dragon
    'Smiling Critters',            -- read above
    'Dog Man',                     --solinium
    'ERROR',
    'The Void',                    --yeah.
    'Dandy\'s World',              --fuck no
    'it lies',
    'Hypixel Skyblock',            --voidgloom seraph
    '[a nil value]',
    'Changed',                     --NO.
    'Project Moon',                --awaken thy pm fans
    'Lobotomy Corporation',
    'Library of Ruina',
    'Limbus Company',
    ' ',
    'Discord',
    'Cryptid',
    'Polterworx',
    'Almanac',
    'FPE (Danger AU)',
    'Everything',
    'The Real World',
    'GMod',
    'ret',
    'Loss',
    'Chaos',
    'Sonic',
    'Sonic.EXE',
    'Friday Night Funkin',
    'Unstable SMP',
    'Content SMP',
    'help',
    'The World\'s Collapse',
    'Roblox',
    'Minecraft',
    'DOORS',
    'Pressure',
    'Something Evil Will Happen',
    'DELTARUNE',
    'UNDERTALE',
    'Homestuck',
    'Balatro',
    'PAYDAY 2',
    'Slay the Spire',
    'NUTDEALER',
    'joker poker balala'
    --wow that's a lotta games
}

local ocstobal_all_origins_inactive_text = {
    'nil',
    'Fundamental Paper Education', --what do you fucking think
    'Poppy Playtime',              --used to be a dragon
    'Smiling Critters',            -- read above
    'Dog Man',                     --solinium
    'ERROR',
    'The Void',                    --yeah.
    'Dandy\'s World',              --fuck no
    'it lies',
    'Hypixel Skyblock',            --voidgloom seraph
    '[a nil value]',
    'Changed',                     --NO.
    'Project Moon',                --awaken thy pm fans
    'Lobotomy Corporation',        --awaken thy pm fans
    'Library of Ruina',            -- awaken thy-
    'Limbus Company',              -- AWAKEN THY
    ' ',
    'Discord',                     --why
    'Cryptid',                     --oh.
    'Polterworx',                  --OH.
    'Almanac',                     --O H N O
    'FPE (Danger AU)',
    'Everything',
    'The Real World',
    'GMod',
    'ret',
    'Loss',
    'Chaos',
    'Sonic',
    'Sonic.EXE',
    'Friday Night Funkin',
    'Unstable SMP',
    'Content SMP',
    'help',
    'The World\'s Collapse',
    'Roblox',
    'Minecraft',
    'DOORS',
    'Pressure',
    'Something Evil Will Happen',
    'DELTARUNE',
    'UNDERTALE',
    'Homestuck',
    'Balatro',
    'PAYDAY 2',
    'Slay the Spire',
    'NUTDEALER',
    'joker poker balala'
}

local originquestion = {
    'Origin',
    'Resides in',
    'Came from',
    'Taken over',
    'Destroyed',
    'Survived'
}

local operators = {
    ":",
    ";",
    "?",
    "!",
    "-",
    "+"
}

SMODS.Joker { --Recluse
    key = "recluse",
    config = {
        extra = {
            multnchip = 0
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    atlas = 'other_ocs',
    soul_pos = {
        x = 5,
        y = 2
    },
    pools = {["ocstob"] = true,["all_junk"] = true},

    loc_vars = function(self, info_queue, card)
        return {
            main_end = {
                { n = G.UIT.O, config = { object = DynaText({ string = originquestion, colours = { G.C.DARK_EDITION }, pop_in_rate = 999999, silent = true, random_element = true, pop_delay = 0.35, scale = 0.32, min_cycle_time = 0 }) } },
                { n = G.UIT.O, config = { object = DynaText({ string = operators, colours = { G.C.DARK_EDITION }, pop_in_rate = 999999, silent = true, random_element = true, pop_delay = 1, scale = 0.32, min_cycle_time = 0 }) } },
                { n = G.UIT.O, config = { object = DynaText({ string = ocstobal_all_origins, colours = { G.C.DARK_EDITION }, pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.205, scale = 0.32, min_cycle_time = 0 }) } },
            },
            vars = { localize('k_ocstobal_recluse_quote' .. pseudorandom("seed", 1, 8)), card.ability.extra.multnchip }
        }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            return {
                chips = card.ability.extra.multnchip
            }
        end
        if context.setting_blind then
            return {
                func = function()
                    local destructable_jokers = {}
                    for i, joker in ipairs(G.jokers.cards) do
                        if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
                            table.insert(destructable_jokers, joker)
                        end
                    end
                    local target_joker = #destructable_jokers > 0 and
                        pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil

                    if target_joker then
                        local joker_sell_value = target_joker.sell_cost or 0
                        local sell_value_gain = joker_sell_value * 100
                        card.ability.extra.multnchip = card.ability.extra.multnchip + sell_value_gain
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:start_dissolve({ G.C.RED }, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                            { message = "Destroyed!", colour = G.C.RED })
                    end
                    return true
                end
            }
        end
    end
}
