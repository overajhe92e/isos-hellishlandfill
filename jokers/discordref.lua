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
    key = 'starspacechat',
    cost = 5000,
    rarity = "ocstobal_omega",
    config = {
        extra = {
            retrig = 1000,
            mult = 2,
            hyperop = 2
        }
    },
    atlas = 'other_jokers',
    pools = { ["ocstob"] = false, ["all_junk"] = false },
    pos = { x = 0, y = 3 },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "ocstobal_98percent", vars = { card.ability.extra.retrig, card.ability.extra.hyperop, card.ability.extra.mult, "{", "}" } }
        return {
            vars = {
                card.ability.extra.mult, card.ability.extra.hyperop, card.ability.extra.retrig, "{", "}", "#",
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.hyperop = card.ability.extra.hyperop + 1
            card.ability.extra.mult = card.ability.extra.mult + 1
            return {
                hypermult = { card.ability.extra.hyperop, card.ability.extra.mult }
            }
        end
        if context.retrigger_joker_check and context.other_card == card then
            return {
                remove_default_message = true,
                repetitions = card.ability.extra.retrig
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
                    SMODS.destroy_cards(SMODS.find_card("j_ocstobal_dw_astro"))
                    return {
                        message = "BANG!!!"
                    }
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
