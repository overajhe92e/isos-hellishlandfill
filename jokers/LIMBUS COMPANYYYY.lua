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
        }
    },
    immutable = true,
    LIMBUS_COMPANY = true,
    loc_vars = function(self, info_queue, card)
        local c = card.ability.extra
        info_queue[#info_queue + 1] = { set = "Other", key = "ocstobal_full_stop_1" }
        info_queue[#info_queue + 1] = { set = "Other", key = "ocstobal_full_stop_2" }
        info_queue[#info_queue + 1] = { set = "Other", key = "ocstobal_full_stop_3" }
        local ability_1 = nil
        local ability_2 = nil
        local using = 1
        return {
            vars = {
                c.ammo, c.atelier, c.poise_count, c.poise_potency, ability_1, ability_2, using
            }
        }
    end,
    calculate = function(self, card, context)
        local c = card.ability.extra
        local ability_1 = nil
        local ability_2 = nil
        local using = 1
        if context.setting_blind and not context.blueprint then
            pseudorandom("abil",1,6)
            pseudorandom("abil_b",1,6)
            if pseudoseed("abil") <= 3 then
                ability_1 = "ret_fire"
            elseif pseudoseed("abil") >= 4 and pseudoseed("abil") <= 5 then
                ability_1 = "heads"
            elseif pseudoseed("abil") == 6 then
                ability_1 = "bulls"
            end
            if pseudoseed("abil_b") <= 3 then
                ability_2 = "ret_fire"
            elseif pseudoseed("abil_b") >= 4 and pseudoseed("abil") <= 5 then
                ability_2 = "heads"
            elseif pseudoseed("abil_b") == 6 then
                ability_2 = "bulls"
            end
            return {
                message = "Ability Change!",
                colour = G.C.RED
            }
        end
        if context.joker_main and not context.joker_retrigger then
            if using == 1 then
                if ability_1 == "ret_fire" then
                    return {
                        xchips = 1.5
                    }
                elseif ability_1 == "heads" then
                    if SMODS.pseudorandom_probability(card, "poise", c.poise_potency, 20, "j_ocstobal_full_stop_fixer", true) then
                        return {
                            emult = 1.1 * (c.poise_count / 5)
                        }
                    else
                        return {
                            xmult = 2
                        }
                    end
                elseif ability_1 == "bulls" then
                    return {
                        message = "lmao no"
                    }
                end
            elseif using == 2 then
                if ability_2 == "ret_fire" then
                    return {
                        xchips = 1.5
                    }
                elseif ability_2 == "heads" then
                    if SMODS.pseudorandom_probability(card, "poise", c.poise_potency, 20, "j_ocstobal_full_stop_fixer", true) then
                        return {
                            emult = 1.1 * (c.poise_count / 5)
                        }
                    else
                        return {
                            xmult = 2
                        }
                    end
                elseif ability_2 == "bulls" then
                    return {
                        message = "lmao no"
                    }
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
    loc_vars = function(self,info_queue,card)
        local c = card.ability.extra
        return {
            vars = {
                c.xchip, c.poise_count, c.poise_potency
            }
        }
    end,
    calculate = function(self,card,context)
    end
}