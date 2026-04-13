SMODS.Atlas({
    key = "modicon",
    path = "ModIcon.png",
    px = 34,
    py = 34,
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

if not ISO_EXT then
    ISO_EXT = {}
end

SMODS.current_mod.menu_cards = function()
	return {
		{key = 'j_ocstobal_myself'}
	}
end

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
if not next(SMODS.find_mod("Talisman")) then
    to_big = to_big or function(a) return a end
    lenient_bignum = lenient_bignum or function(a) return a end
end

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

-- local function if_jen_NOT_loaded()
--     print("POLTERWORX not loaded, loading Jokers normally.")
--     --load path to NORMAL
-- end

-- local function if_jen_loaded()
--     print("POLTERWORX Detected, nerfing some jokers!")
--     --load path to PWX
-- end

-- if next(SMODS.find_mod("jen")) then
--     if_jen_loaded()
-- else
--     if_jen_NOT_loaded()
-- end

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

local function load_all_data()
    local mod_path = SMODS.current_mod.path
    local data = mod_path .. "/data"
    local files = NFS.getDirectoryItemsInfo(data)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("data/" .. file_name))()
        end
    end
end

local function load_quips_in_particular()
    local mod_path = SMODS.current_mod.path
    local quip = mod_path .. "/data/quips"
    local files = NFS.getDirectoryItemsInfo(quip)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("data/quips/" .. file_name))()
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

load_jokers_folder()
load_enhancements_folder()
load_seals_folder()
load_all_data()
load_quips_in_particular()

local function grah()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("evilandintimidatingui.lua"))()
end

grah()

local function all_checks()
    if next(SMODS.find_mod("jen")) then
        ISO_POLTERWORX = true
    end
    if next(SMODS.find_mod("Cryptid")) then
        ISO_Cryptshit = true
    end
    if next(SMODS.find_mod("starspace")) then
        ISO_Starspace = true
    end
    if next(SMODS.find_mod("Yahimod")) then
        ISO_Yahamouse = true
    end
    if next(SMODS.find_mod("bdash")) then
        ISO_BDash = true
    end
    if next(SMODS.find_mod("bunny")) then
        ISO_bnuuy = true
    end
    if next(SMODS.find_mod("unik")) then
        ISO_unik = true
    end
end

all_checks()
