local function burger()
	G.E_MANAGER:add_event(Event({
		trigger = 'immediate',
		locking = false,
		delay = 0,
		func = function()
			check_for_unlock({ type = "ach_burgr" })
			return true
		end,
	}))
end

SMODS.Joker {
    key = 'burgr',
    cost = 10,
    rarity = 3,
    atlas = 'other_jokers',
    pools = {
        ["ocstob"] = true
    },
    pos = { x = 5, y = 1 },
    config = {
        extra = {
            thej = 1,
            theh = 8
        }
    },
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.thej, card.ability.extra.theh, 'j_ocstobal_burgr')
        return {
            vars = {
                numerator, denominator
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            if SMODS.pseudorandom_probability(card, "ocstobal_unstable", 1, 8) then
                G.burger = 1
                G.GAME.chips = G.GAME.blind.chips - 1
                play_sound("ocstobal_jumpscare", 1, 1)
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 3 * G.SETTINGS.GAMESPEED,
                    func = function()
                        G.burger = 0
                        burger()
                        return true
                    end
                }))
                return true
            end
        end
    end
}
