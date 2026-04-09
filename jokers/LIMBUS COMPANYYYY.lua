SMODS.Joker {
    key = "full_stop_fixer",
    cost = 20,
    rarity = "ocstobal_epic",
    config = {
        extra = {
            ammo = 10,
            atelier = 1,
            poise_count = 1,
            poise_potency = 1,
            using = 1
        }
    },
    immutable = true,
    LIMBUS_COMPANY = true,
    atlas = "other_jokers",
    pos = {
        x = 7, y = 3
    },
    blueprint_compat = false,
    iso_retriggerable = false,
    loc_vars = function(self, info_queue, card)
        local c = card.ability.extra
        info_queue[#info_queue + 1] = { set = "Other", key = "ocstobal_full_stop_1" }
        info_queue[#info_queue + 1] = { set = "Other", key = "ocstobal_full_stop_2" }
        info_queue[#info_queue + 1] = { set = "Other", key = "ocstobal_full_stop_3a" }
        info_queue[#info_queue + 1] = { set = "Other", key = "ocstobal_full_stop_3b" }
        local ab_a = nil
        local ab_b = nil
        if G.GAME then
            if G.GAME.ISO_Ability_A == "ret_fire" then
                ab_a = "Return Fire"
            elseif G.GAME.ISO_Ability_A == "heads" then
                ab_a = "Headshot"
            elseif G.GAME.ISO_Ability_A == "bulls" then
                ab_a = "Goin' for Bullseye"
            elseif G.GAME.ISO_Ability_A == "hv" then
                ab_a = "AL-HV Pulverisation Round"
            end
            if G.GAME.ISO_Ability_B == "ret_fire" then
                ab_b = "Return Fire"
            elseif G.GAME.ISO_Ability_B == "heads" then
                ab_b = "Headshot"
            elseif G.GAME.ISO_Ability_B == "bulls" then
                ab_b = "Goin' for Bullseye"
            elseif G.GAME.ISO_Ability_B == "hv" then
                ab_b = "AL-HV Pulverisation Round"
            end
            return {
                vars = {
                    c.ammo, c.atelier, c.poise_count, c.poise_potency, ab_a or "None!", ab_b or "None!", c.using
                }
            }
        else
            return {
                vars = {
                    c.ammo, c.atelier, c.poise_count, c.poise_potency, "None!", "None!", c.using
                }
            }
        end
    end,
    calculate = function(self, card, context)
        local c = card.ability.extra
        local using = c.using
        if context.setting_blind and not context.blueprint and not context.retrigger_joker then
            local a = math.random(1,6)
            local b = math.random(1,6)
            if a <= 3 then
                G.GAME.ISO_Ability_A = "ret_fire"
            elseif a >= 4 and a <= 5 then
                G.GAME.ISO_Ability_A = "heads"
            elseif a == 6 then
                if c.atelier > 0 then
                    G.GAME.ISO_Ability_A = "hv"
                else
                    G.GAME.ISO_Ability_A = "bulls"
                end
            end
            if b <= 3 then
                G.GAME.ISO_Ability_B = "ret_fire"
            elseif b >= 4 and b <= 5 then
                G.GAME.ISO_Ability_B = "heads"
            elseif b == 6 then
                if c.atelier > 0 then
                    G.GAME.ISO_Ability_B = "hv"
                else
                    G.GAME.ISO_Ability_B = "bulls"
                end
            end
            return {
                message = "Ability Change!",
                colour = G.C.RED
            }
        end
        if context.joker_main and not context.blueprint then
            if using == 1 then
                if G.GAME.ISO_Ability_A == "ret_fire" then
                    c.poise_potency = c.poise_potency + 1
                    return {
                        xchips = 1.5
                    }
                elseif G.GAME.ISO_Ability_A == "heads" then
                    if SMODS.pseudorandom_probability(card, "poise", c.poise_potency, 20, "j_ocstobal_full_stop_fixer", true) then
                        return {
                            emult = 1+(c.poise_count/5)
                        }
                    else
                        return {
                            xmult = 2
                        }
                    end
                elseif G.GAME.ISO_Ability_A == "bulls" then
                    c.poise_potency = c.poise_potency + 5
                    return {
                        message = "lmao no"
                    }
                elseif G.GAME.ISO_Ability_A == "hv" then
                    return {
                        remove_default_message = true,
                        message = "^^1.2 Chips and Mult",
                        colour = G.C.DARK_EDITION,
                        eechips = 1.2,
                        eemult = 1.2
                    }
                end
            elseif using == 2 then
                if G.GAME.ISO_Ability_B == "ret_fire" then
                    return {
                        xchips = 1.5
                    }
                elseif G.GAME.ISO_Ability_B == "heads" then
                    if SMODS.pseudorandom_probability(card, "poise", c.poise_potency, 20, "j_ocstobal_full_stop_fixer", true) then
                        return {
                            emult = 1 + (c.poise_count / 5)
                        }
                    else
                        return {
                            xmult = 2
                        }
                    end
                elseif G.GAME.ISO_Ability_B == "bulls" then
                    return {
                        message = "lmao no"
                    }
                elseif G.GAME.ISO_Ability_B == "hv" then
                    c.poise_potency = c.poise_potency + 5
                    return {
                        remove_default_message = true,
                        message = "^^1.2 Chips and Mult",
                        colour = G.C.DARK_EDITION,
                        eechips = 1.2,
                        eemult = 1.2
                    }
                end
            end
        end
        if context.after and not context.blueprint and not context.joker_retrigger then
            if using == 1 then
                if G.GAME.ISO_Ability_A == "bulls" then
                    c.poise_count = c.poise_count + 2
                    return {
                        message = "+2 Poise Count"
                    }
                elseif G.GAME.ISO_Ability_A == "hv" then
                    c.poise_count = c.poise_count + 2
                    return {
                        message = "+2 Poise Count"
                    }
                end
            elseif using == 2 then
                if G.GAME.ISO_Ability_B == "bulls" then
                    c.poise_count = c.poise_count + 2
                    return {
                        message = "+2 Poise Count"
                    }
                elseif G.GAME.ISO_Ability_B == "hv" then
                    c.poise_count = c.poise_count + 2
                    return {
                        message = "+2 Poise Count"
                    }
                end
            end
        end
        if context.retrigger_joker_check and context.other_joker == card then
            if using == 1 then
                if G.GAME.ISO_Ability_A == "ret_fire" then
                    return { repetitions = 2 }
                end
            elseif using == 2 then
                if G.GAME.ISO_Ability_B == "ret_fire" then
                    return { repetitions = 2 }
                end
            end
        end
    end
}

SMODS.Joker {
    key = "poise",
    cost = 10,
    rarity = 3,
    config = {
        extra = {
            xchip = 1,
            poise_count = 0,
            poise_potency = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        local c = card.ability.extra
        return {
            vars = {
                c.xchip, c.poise_count, c.poise_potency
            }
        }
    end,
    calculate = function(self, card, context)
    end
}

SMODS.Joker {
    key = "don_quixote",
    cost = 100,
    rarity = 1,
    atlas = "other_jokers",
    pos = {x=8,y=0},
    soul_pos = {x=9,y=0}
}

SMODS.Joker {
    key = "clockhead",
    cost = 10,
    rarity = 3,
    atlas = "other_jokers",
    pos = {x=8,y=1},
    soul_pos = {x=9,y=1}
}
--[[
    dantehhh
    Keter / Pigrita : Remove Small Blind for 1 Ante, Halve Blind Size on blind select
    Binah / Superbia : Create a random Legendary Joker that destroys self at the end of the round
    Chesed / Morositas : Sets Blind Size and Dollars to the Avg. of all 3, Chip-Mult Balance is enabled for Current Ante
    Gebura / Ira : Jokers become Undebuffable, And are retriggered once
    Tiphreth : ?
    Yesod : ?
    Neztach : ?
    Hod : ?
    Makluth : Joker Rarity weights become equal...?
]]