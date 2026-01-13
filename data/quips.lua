SMODS.JimboQuip({
    key = 'vessel_lose_1',
    extra = {
        center = 'j_ocstobal_reclusivevessel',
        particle_colours = {
            G.C.NIGHTMARE_PURPLE,
            G.C.NIGHTMARE_PURPLE,
            G.C.NIGHTMARE_PURPLE
        }
    },
    filter = function(self, type)
        if type == 'loss' then
            if next(SMODS.find_card("j_ocstobal_reclusivevessel")) then
                return true, { weight = 25 }
            end
        end
    end
})

SMODS.JimboQuip({
    key = 'vessel_lose_2',
    extra = {
        center = 'j_ocstobal_reclusivevessel',
        particle_colours = {
            G.C.NIGHTMARE_PURPLE,
            G.C.NIGHTMARE_PURPLE,
            G.C.NIGHTMARE_PURPLE
        }
    },
    filter = function(self, type)
        if type == 'loss' then
            if next(SMODS.find_card("j_ocstobal_reclusivevessel")) then
                return true, { weight = 25 }
            end
        end
    end
})


SMODS.JimboQuip({
    key = 'vessel_lose_3',
    extra = {
        center = 'j_ocstobal_reclusivevessel',
        particle_colours = {
            G.C.NIGHTMARE_PURPLE,
            G.C.NIGHTMARE_PURPLE,
            G.C.NIGHTMARE_PURPLE
        }
    },
    filter = function(self, type)
        if type == 'loss' then
            if next(SMODS.find_card("j_ocstobal_reclusivevessel")) then
                return true, { weight = 25 }
            end
        end
    end
})


SMODS.JimboQuip({
    key = 'vessel_lose_4',
    extra = {
        center = 'j_ocstobal_reclusivevessel',
        particle_colours = {
            G.C.NIGHTMARE_PURPLE,
            G.C.NIGHTMARE_PURPLE,
            G.C.NIGHTMARE_PURPLE
        }
    },
    filter = function(self, type)
        if type == 'loss' then
            if next(SMODS.find_card("j_ocstobal_reclusivevessel")) then
                return true, { weight = 25 }
            end
        end
    end
})

