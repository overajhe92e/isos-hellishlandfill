SMODS.Joker {
    key = 'psi_hypnosis',
    cost = 12,
    rarity = 3,
    config = {
        extra = {
            dura = 3
        }
    },
    atlas = 'placeholder',
    pools = {["ocstob"] = true,["all_junk"] = true},
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint and context.blind.boss then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('ocstobal_ailment')
                            G.GAME.blind:disable()
                            delay(0.4)
                            return true
                        end
                    }))
                    G.GAME.hypnosis = true
                    return true
                end
            }))
            return nil, true -- This is for Joker retrigger purposes
        end
        if context.end_of_round and context.main_eval then
            G.GAME.hypnosis = false
            if card.ability.extra.dura <= 0 then
                --destroys self
            end
        end
    end,
}

-- SMODS.Joker {
--     key = 'psi_paralysis',
--     cost = 1,
--     rarity = 3,
--     no_collection = true
-- }

-- SMODS.Joker {
--     key = 'psi_brainshock',
--     cost = 1,
--     rarity = 4,
--     no_collection = true
-- }
--uncomment these when you know what you're doing

SMODS.Joker {
    key = 'pk_ground',
    cost = 250,
    rarity = 'ocstobal_beyondexotic',
    atlas = 'pkground',
    config = {
        extra = {
            probability = 4,
        }
    },
    pools = {
        ["all_junk"] = true
    },
    loc_vars = function(self, info_queue, card)
        local numerator_1, denominator_1 = SMODS.get_probability_vars(card, 1, card.ability.extra.probability,'j_ocstobal_pk_ground')
        return {
            vars = { 
                numerator_1, denominator_1
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if SMODS.pseudorandom_probability(card, 'thefunny', 1, card.ability.extra.probability, 'j_ocstobal_pk_ground') then
                G.GAME.chips = G.GAME.chips + math.floor(((G.GAME.blind.chips / 100)*90))
                return {
                    message = "+" .. tostring(math.floor((G.GAME.blind.chips / 100)*90)) .. " Score",
                    colour = G.C.WHITE
                }
            else
                G.GAME.chips = G.GAME.chips + math.floor(((G.GAME.blind.chips / 100)*15))
                return {
                    message = "+" .. tostring(math.floor((G.GAME.blind.chips / 100)*15)) .. " Score",
                    colour = G.C.WHITE
                }
            end
        end
    end,
}

-- SMODS.Joker {
--     key = 'pk_flash',
--     cost = 1,
--     rarity = 2,
--     no_collection = true
-- }
--dont forget this later

-- SMODS.Joker {
--     key = 'psi_lifeup',
--     cost = 10,
--     rarity = 3,
--     config = {
--         extra = {
--             pp = 300,
--             recovering = "Hands"
--         }
--     },
--     atlas = 'other_jokers',
--     pos = {x=2,y=2},
--     immutable = true,
--     loc_vars = function(self,info_queue,card)
--         return {
--             vars = {
--                 card.ability.extra.pp
--             }
--         }
--     end,
--     psi_lifeup = true,
--     calculate = function(self,card,context)
--         if context.setting_blind then
--             if card.ability.extra.pp <= 300 then
--                 card.ability.extra.pp = card.ability.extra.pp + 10
--                 return {
--                     message = "+10 PP!",
--                     colour = G.C.LEGENDARY
--                 }
--             end
--             if card.ability.extra.pp >= 300 then
--                 repeat card.ability.extra.pp = card.ability.extra.pp - 1
--                 until card.ability.extra.pp == 300
--             end
--         end
--     end
-- }

SMODS.DrawStep {
    key = 'lifeup_button',
    order = -30,
    func = function(self)
        if self.children.lifeup then
            if self.highlighted then
                self.children.lifeup:draw() 
            else
                self.children.lifeup:remove() 
                self.children.lifeup = nil
            end
        end
       if self.children.lifeup then
            if self.highlighted then
                self.children.lifeup:draw() 
            else
                self.children.lifeup:remove() 
                self.children.lifeup = nil
            end
        end
    end,
}

SMODS.DrawStep {
    key = 'love_button',
    order = -30,
    func = function(self)
        if self.children.love then
            if self.highlighted then
                self.children.love:draw() 
            else
                self.children.love:remove() 
                self.children.love = nil
            end
        end
       if self.children.love then
            if self.highlighted then
                self.children.love:draw() 
            else
                self.children.love:remove() 
                self.children.love = nil
            end
        end
    end,
}