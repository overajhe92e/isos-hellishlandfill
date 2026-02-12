SMODS.Joker {
    key = "steelwire",
    rarity = 1,
    cost = 10,
    perishable_compat = false,
    atlas = "other_jokers",
    pos = {x=3,y=2},
    soul_pos = {x=4,y=2},
    loc_vars = function(self, info_queue, card)
        local count = 0
        for _, iso_steelwirecount in ipairs(SMODS.find_card("j_ocstobal_steelwire")) do
            count = count + 1
        end
        return {
            vars = { count },
            key = count < 3 and "j_ocstobal_steelwire_stage_1" or
            count >= 3 and count < 7 and "j_ocstobal_steelwire_stage_2" or
            count >= 7 and count < 15 and "j_ocstobal_steelwire_stage_3" or
            count >= 15 and count < 21 and "j_ocstobal_steelwire_stage_4" or
            count >= 21 and count < 30 and "j_ocstobal_steelwire_stage_5" or
            count >= 30 and count < 40 and "j_ocstobal_steelwire_stage_6" or
            count >= 40 and count < 100 and "j_ocstobal_steelwire_stage_7" or
            count >= 100 and count < math.huge and "j_ocstobal_steelwire_stage_8" or
            nil
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local wirenum = 0
            for _, steelwire in ipairs(SMODS.find_card("j_ocstobal_steelwire")) do
                wirenum = wirenum + 1
            end
            if wirenum >= 1  and wirenum < 3 then
                    return {
                        xmult = 1.1
                    }
                elseif wirenum >= 3 and wirenum < 7 then
                    return {
                        xmult = 2
                    }
                elseif wirenum >= 7 and wirenum < 15 then
                    return {
                        emult = 1.25
                    }
                elseif wirenum >= 15 and wirenum < 21 then
                    return {
                        emult = 1.5
                    }
                elseif wirenum >= 21 and wirenum < 30 then
                    return {
                        eemult = 1.1
                    }
                elseif wirenum >= 30 and wirenum < 40 then
                    return {
                        eemult = 1.5
                    }
                elseif wirenum >= 40 and wirenum < 100 then
                    return {
                        eeemult = 1.1
                    }
                elseif wirenum >= 100 then
                    return {
                        hypermult = {
                            4, 1.2
                        }
                    }
                end
        end
    end
}
