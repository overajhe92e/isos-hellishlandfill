if not iso then
    iso = {}
end

local upd = Game.update
function Game:update(dt)
    upd(self, dt)
    local fucking_hell_mate = 0
    for _, steelwirecount in ipairs(SMODS.find_card("j_fizz_steelwire")) do
        fucking_hell_mate = fucking_hell_mate + 1
    end
    if G.GAME then
        if fucking_hell_mate >= 200 then
            G.GAME.evil_steel = true
            ease_background_colour { new_colour = G.C.OMEGABLACK, special_colour = G.C.ISO_CRIMSON, contrast = 2 }
        elseif G.GAME.fizz_starspace_horny_hour == true then
            ease_background_colour { new_colour = G.C.OMEGABLACK, special_colour = G.C.ISO_CRIMSON, contrast = 2 }
        else
            G.GAME.evil_steel = false
        end
    end
end

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_fizz_antislopinator" then
        return true
    elseif card.config.center.key == "j_fizz_steelwire" then
        return true
    end
    return check_for_buy_space_ref(card)
end
--oo oo bypass slots hook oo

--copied from entropy since i have no fucking idea what im doing
function iso.nextboss()
    G.STATE = 1
    G.STATE_COMPLETE = false
    local remove_temp = {}
    for i, v in pairs({ G.jokers, G.hand, G.consumeables, G.discard, G.deck }) do
        for ind, card in pairs(v.cards) do
            if card.ability then
                if card.ability.temporary or card.ability.temporary2 then
                    if card.area ~= G.hand and card.area ~= G.play and card.area ~= G.jokers and card.area ~= G.consumeables then card.states.visible = false end
                    card:remove_from_deck()
                    card:start_dissolve()
                    if card.ability.temporary then remove_temp[#remove_temp + 1] = card end
                end
            end
        end
    end
    if #remove_temp > 0 then
        SMODS.calculate_context({ remove_playing_cards = true, removed = remove_temp })
    end
    G.deck:shuffle()
    G.E_MANAGER:add_event(Event({
        func = function()
            G.GAME.ChangingPhase = nil
            return true
        end
    }))
end

G.omega_blinds = function() --from megafluff (yoink)
    local omega_pool = {}
    for k, v in pairs(G.P_BLINDS) do
        if v.debuff.omega_blind or v.debuff.akyrs_blind_difficulty == "expert" then
            if k ~= "bl_akyrs_expert_inflation" then
                omega_pool[k] = true
            end
        end
    end

    local _, boss = pseudorandom_element(omega_pool, pseudoseed('boss'))

    return boss
end

-- ok so maybe i lied about abbie doing nothing
--credits to paradox for the hook
local abbornegative = G.P_CENTERS.e_negative.get_weight
G.P_CENTERS.e_negative.get_weight = function(self)
    local weight = abbornegative(self)
    for _, abbie in ipairs(SMODS.find_card("j_fizz_abbie")) do
        weight = weight * 3.1
    end
    return weight
end

function TERMINUS_GIVER_9000()
    print("cheaty hehehehehe")
    SMODS.add_card { set = "Joker", rarity = 'fizz_beyondexotic' }
end

function G.FUNCS.ISO_jf_troll()
    love.system.openURL("https://jokerforge.jaydchw.com/")
    G.ISO_jf = true
    G:save_settings()
end
