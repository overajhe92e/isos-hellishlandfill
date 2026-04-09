SMODS.Joker {
    key = 'moddingchat',
    cost = 1,
    rarity = 2,
    config = {
        extra = {
            other_ocs = 4
        }
    },
    atlas = 'other_jokers',
    pools = { ["ocstob"] = true, ["all_junk"] = true },
    pos = { x = 3, y = 0 },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_ocstobal_ocksie
        info_queue[#info_queue + 1] = G.P_CENTERS.j_ocstobal_crystal
        info_queue[#info_queue + 1] = G.P_CENTERS.j_ocstobal_astro
        info_queue[#info_queue + 1] = G.P_CENTERS.j_ocstobal_candycane
        return {
            vars = {
                card.ability.extra.other_ocs
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.other_ocs
            }
        end
    end
}

SMODS.Joker {
    key = "neveragain",
    cost = 1,
    rarity = 1,
    jf = true,
    loc_vars = function(self, info_queue, card)
        return {
            key = G.ISO_jf == true and "j_ocstobal_neveragain_clicked" or nil
        }
    end,
    calculate = function(self, card, context)
        if G.ISO_jf == true then
            if context.joker_main then
                return {
                    xmult = 0
                }
            end
        end
    end
}

SMODS.Joker {
    key = "a_fucking_gun",
    cost = 20,
    rarity = 3,
    atlas = "other_jokers",
    pos = { x = 1, y = 3 },
    soul_pos = { x = 2, y = 3 },
    config = {
        extra = {
            echips = 1,
            eechips = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "ocstobal_placeholder" }
        return {
            vars = {
                card.ability.extra.echips, card.ability.extra.eechips
            }
        }
    end,
    calculate = function(self, card, context)
        local astro_active = false
        if next(SMODS.find_card("j_ocstobal_astro")) then
            astro_active = true
        end
        if astro_active then
            if context.setting_blind and not context.blueprint then
                local fraudcount = 0
                for _, fraud in ipairs(SMODS.find_card("j_ocstobal_dw_astro")) do
                    fraudcount = fraudcount + 1
                    if fraudcount < 3 then
                        card.ability.extra.echips = card.ability.extra.echips + (fraudcount / 10)
                    elseif fraudcount >= 3 then
                        card.ability.extra.echips = card.ability.extra.echips + (fraudcount / 10)
                        card.ability.extra.eechips = card.ability.extra.eechips + (fraudcount / 10)
                    end
                end
                if fraudcount <= 0 then
                    return {
                        message = "Nothing to shoot!"
                    }
                elseif fraudcount > 0 then
                    G.E_MANAGER:add_event(Event({
                        trigger = "immediate",
                        func = function()
                            card:juice_up(0.1)
                            return true
                        end
                    }))
                    if SMODS.pseudorandom_probability(card, "ohgod", 1, 1, "j_ocstobal_a_fucking_gun", true) then
                        ISO_getfuckedlmfao()
                    else
                        G.E_MANAGER:add_event(Event({
                            trigger = "after",
                            delay = 1 * G.SETTINGS.GAMESPEED,
                            func = function()
                                SMODS.destroy_cards(SMODS.find_card("j_ocstobal_dw_astro"))
                                SMODS.calculate_effect({ message = "BANG!!!" }, card)
                                return true
                            end
                        }))
                    end
                end
            end
            if context.initial_scoring_step then
                card:juice_up()
            end
            if context.joker_main then
                return {
                    echips = card.ability.extra.echips,
                    eechips = card.ability.extra.eechips
                }
            end
        else
            if context.setting_blind then
                return {
                    message = "Nope!"
                }
            end
        end
    end
}