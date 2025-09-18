SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

-- G.C.DARKENED = HEX("000000")
-- G.C.LIGHT = HEX("ffffff")
-- G.C.mid_flash = 0.1
-- G.C.vort_time = 7
-- G.C.vort_speed = 0.33

-- --the fuckass menu (yoinky sploinkied from yahimod)
-- local oldfunc = Game.main_menu
-- Game.main_menu = function(change_context)
-- 	local ret = oldfunc(change_context)
-- 	G.SPLASH_BACK:define_draw_steps({
-- 			{
--                 shader = "splash",
-- 				send = {
-- 					{ name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
--            			{name = 'vort_speed', val = G.C.vort_speed},
--             		{name = 'colour_1', ref_table = G.C, ref_value = 'DARKENED'},
--             		{name = 'colour_2', ref_table = G.C, ref_value = 'DARKENED'},
--             		{name = 'mid_flash', ref_table = G.C, ref_value = 'mid_flash'},
-- 				},
-- 			},
-- 		})
-- 	return ret
-- end

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end

local function load_enhancements_folder()
    local mod_path = SMODS.current_mod.path
    local enhancements_path = mod_path .. "/enhancements"
    local files = NFS.getDirectoryItemsInfo(enhancements_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("enhancements/" .. file_name))()
        end
    end
end

local function load_seals_folder()
    local mod_path = SMODS.current_mod.path
    local seals_path = mod_path .. "/seals"
    local files = NFS.getDirectoryItemsInfo(seals_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("seals/" .. file_name))()
        end
    end
end

local function load_rarities_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("data/rarities.lua"))()
end

load_rarities_file()
local function load_boosters_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("data/boosters.lua"))()
end

load_boosters_file()
load_jokers_folder()
load_enhancements_folder()
load_seals_folder()

local function grah()
	local mod_path = SMODS.current_mod.path
	assert(SMODS.load_file("data/misc.lua"))()
    assert(SMODS.load_file("evilandintimidatingui.lua"))()
end

grah()