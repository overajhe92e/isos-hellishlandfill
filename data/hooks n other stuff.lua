if not ocstobal then
    ocstobal = {}
end

local upd = Game.update
function Game:update(dt)
    upd(self, dt)
    local fucking_hell_mate = 0
    for _, steelwirecount in ipairs(SMODS.find_card("j_ocstobal_steelwire")) do
        fucking_hell_mate = fucking_hell_mate + 1
    end
    if G.GAME then
        if fucking_hell_mate >= 200 then
            G.GAME.evil_steel = true
            ease_background_colour { new_colour = G.C.OMEGABLACK, special_colour = G.C.ISO_CRIMSON, contrast = 2 }
        elseif G.GAME.iso_starspace_horny_hour == true then
            ease_background_colour { new_colour = G.C.OMEGABLACK, special_colour = G.C.ISO_CRIMSON, contrast = 2 }
        else
            G.GAME.evil_steel = false
        end
    end
end

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_ocstobal_antislopinator" then
        return true
    elseif card.config.center.key == "j_ocstobal_steelwire" then
        return true
    end
    return check_for_buy_space_ref(card)
end
--oo oo bypass slots hook oo

--copied from entropy since i have no fucking idea what im doing
function ocstobal.nextboss()
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
    for _, abbie in ipairs(SMODS.find_card("j_ocstobal_abbie")) do
        weight = weight * 3.1
    end
    return weight
end


pkLOOOVE = Card.highlight
function Card:highlight(is_highlighted)
    pkLOOOVE(self, is_highlighted)
    asc = {
        n = G.UIT.ROOT,
        config = { padding = 0, colour = G.C.CLEAR },
        nodes = {
            {
                n = G.UIT.C,
                config = { minw = 1, minh = 1, padding = 0.1, align = 'cm', colour = G.C.CLEAR },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = { minw = 1, minh = 0.5, padding = 0.01, align = 'cl', colour = G.C.CLEAR, button = 'store', r = 0.1 },
                        nodes = {
                            UIBox_button { label = { "Store" }, scale = 0.4, minw = 1.3, minh = 0.7, colour = G.C.BLUE, r = 0.1, button = 'store' }
                        }
                    },
                    {
                        n = G.UIT.R,
                        config = { minw = 1, minh = 0.5, padding = 0.01, align = 'cl', colour = G.C.CLEAR, button = 'donothing', r = 0.1 },
                        nodes = {
                            UIBox_button { label = { "Passive" }, scale = 0.4, minw = 1.3, minh = 0.7, colour = G.C.UI.BACKGROUND_INACTIVE, r = 0.1, button = 'donothing' }
                        }
                    },
                    {
                        n = G.UIT.R,
                        config = { minw = 1, minh = 0.5, padding = 0.01, align = 'cl', colour = G.C.CLEAR, button = 'release', r = 0.1 },
                        nodes = {
                            UIBox_button { label = { "Unleash" }, scale = 0.4, minw = 1.3, minh = 0.7, colour = G.C.RED, r = 0.1, button = 'release' }
                        }
                    },
                }
            },
        }
    }
    lifeup = {
        n = G.UIT.ROOT,
        config = { padding = 0, colour = G.C.CLEAR },
        nodes = {
            {
                n = G.UIT.C,
                config = { minw = 1, minh = 1, padding = 0.01, align = 'cm', colour = G.C.CLEAR },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = { minw = 1, minh = 0.5, padding = 0.01, align = 'cl', colour = G.C.CLEAR, button = 'iso_lf_alpha', r = 0.1 },
                        nodes = {
                            UIBox_button { label = { "Alpha" }, scale = 0.3, minw = 1.3, minh = 0.7, colour = G.C.GREEN, r = 0.1, button = 'iso_lf_alpha' }
                        }
                    },
                    {
                        n = G.UIT.R,
                        config = { minw = 1, minh = 0.5, padding = 0.01, align = 'cl', colour = G.C.CLEAR, button = 'lf_beta', r = 0.1 },
                        nodes = {
                            UIBox_button { label = { "Beta" }, scale = 0.3, minw = 1.3, minh = 0.7, colour = G.C.GREEN, r = 0.1, button = 'lf_beta' }
                        }
                    },
                    {
                        n = G.UIT.R,
                        config = { minw = 1, minh = 0.5, padding = 0.01, align = 'cl', colour = G.C.CLEAR, button = 'lf_gamma', r = 0.1 },
                        nodes = {
                            UIBox_button { label = { "Gamma" }, scale = 0.3, minw = 1.3, minh = 0.7, colour = G.C.GREEN, r = 0.1, button = 'lf_gamma' }
                        }
                    },
                    {
                        n = G.UIT.R,
                        config = { minw = 1, minh = 0.5, padding = 0.01, align = 'cl', colour = G.C.CLEAR, button = 'lf_omega', r = 0.1 },
                        nodes = {
                            UIBox_button { label = { "Omega" }, scale = 0.3, minw = 1.3, minh = 0.7, colour = G.C.GREEN, r = 0.1, button = 'lf_omega' }
                        }
                    },
                    {
                        n = G.UIT.R,
                        config = { minw = 1, minh = 0.5, padding = 0.01, align = 'cl', colour = G.C.CLEAR, button = 'iso_swap', r = 0.1 },
                        nodes = {
                            UIBox_button { label = { "Swap" }, scale = 0.3, minw = 1.3, minh = 0.7, colour = G.C.GREEN, r = 0.1, button = 'iso_swap' }
                        }
                    },
                }
            },
        }
    }
    jf = {
        n = G.UIT.ROOT,
        config = { padding = 0, colour = G.C.CLEAR },
        nodes = {
            {
                n = G.UIT.C,
                config = { minw = 1, minh = 1, padding = 0.1, align = 'cm', colour = G.C.CLEAR },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = { minw = 1, minh = 0.5, padding = 0.01, align = 'cl', colour = G.C.CLEAR, button = 'ISO_jf_troll', r = 0.1 },
                        nodes = {
                            UIBox_button { label = { "???" }, scale = 0.4, minw = 1.3, minh = 0.7, colour = G.C.RED, r = 0.1, button = 'ISO_jf_troll' }
                        }
                    }
                }
            },
        }
    }
    sph = {
        n = G.UIT.ROOT,
        config = { padding = 0, colour = G.C.CLEAR },
        nodes = {
            {
                n = G.UIT.C,
                config = { minw = 1, minh = 1, padding = 0.1, align = 'cm', colour = G.C.CLEAR },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = { minw = 1, minh = 0.5, padding = 0.01, align = 'cl', colour = G.C.CLEAR, button = 'seraphmenu', r = 0.1 },
                        nodes = {
                            UIBox_button { label = { "UPG" }, scale = 0.4, minw = 1.3, minh = 0.7, colour = G.C.RED, r = 0.1, button = 'ISO_jf_troll' }
                        }
                    }
                }
            },
        }
    }
    if self.highlighted and self.config.center.psi_lifeup == true and not self.ability.extra.to_copy then
        self.children.lifeup = UIBox({
            definition = lifeup,
            config = {
                parent = self,
                align = 'cm',
                offset = { x = -1.5, y = 0 },
                colour = G.C.CLEAR
            }
        })
    elseif self.children.lifeup and not self.highlighted and self.config.center.psi_lifeup == true then
        self.children.lifeup:remove()
        self.children.lifeup = nil
    end
    if self.highlighted and self.config.center.pk_love == true and not self.ability.extra.to_copy then
        self.children.love = UIBox({
            definition = asc,
            config = {
                parent = self,
                align = 'cm',
                offset = { x = -1.5, y = 0 },
                colour = G.C.CLEAR
            }
        })
    elseif self.children.love and not self.highlighted and self.config.center.pk_love == true then
        self.children.love:remove()
        self.children.love = nil
    end
    if self.highlighted and self.config.center.jf == true --[[and not self.ability.extra.to_copy]] then
        self.children.jf = UIBox({
            definition = jf,
            config = {
                parent = self,
                align = 'cm',
                offset = { x = -1.5, y = 0 },
                colour = G.C.CLEAR
            }
        })
    elseif self.children.jf and not self.highlighted and self.config.center.jf == true then
        self.children.jf:remove()
        self.children.jf = nil
    end
    if self.highlighted and self.config.center.key == "j_ocstobal_seraph" and not self.ability.extra.to_copy then
        self.children.lifeup = UIBox({
            definition = sph,
            config = {
                parent = self,
                align = 'cm',
                offset = { x = -1.5, y = 0 },
                colour = G.C.CLEAR
            }
        })
    elseif self.children.lifeup and not self.highlighted and self.config.center.key == "j_ocstobal_seraph" then
        self.children.lifeup:remove()
        self.children.lifeup = nil
    end
end

function G.FUNCS.store()
    G.GAME.pk_love_ability = "Storing"
end

function G.FUNCS.donothing()
    G.GAME.pk_love_ability = "Passive"
end

function G.FUNCS.release()
    G.GAME.pk_love_ability = "Unleashing"
end

G.FUNCS.iso_swap = function(e)
    local card = e.config.ref_table
    if card.ability.extra.recovering == "Discards" then
        G.GAME.recovering = "Hands"
    elseif card.ability.extra.recovering == "Hands" then
        G.GAME.recovering = "Discards"
    end
end

G.FUNCS.iso_lf_alpha = function(e)
    local card = e.config.ref_table
    if e.ability.extra.recovering == "Hands" then
        e.ability.extra.pp = e.ability.extra.pp - 5
        SMODS.calculate_effect({ message = "restore hands" }, card)
    elseif card.ability.extra.recovering == "Discards" then
        e.ability.extra.pp = e.ability.extra.pp - 5
        SMODS.calculate_effect({ message = "restore hands" }, card)
    end
end

function G.FUNCS.seraphmenu()
    G.FUNCS.overlay_menu {
        definition = sphlvls("Back"),
        config = { no_esc = true }
    }
end

function TERMINUS_GIVER_9000()
    print("cheaty hehehehehe")
    SMODS.add_card{ set = "Joker", rarity = 'ocstobal_beyondexotic' }
end

function G.FUNCS.ISO_jf_troll()
    love.system.openURL("https://jokerforge.jaydchw.com/")
    G.ISO_jf = true
	G:save_settings()
end