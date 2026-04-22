SMODS.Sound({ key = "swoonstart", path = "swoonstart.ogg" })
SMODS.Sound({ key = "swoonend", path = "swoonend.ogg" })

--any organized modder is cry when they see this shit
if not ISO_UTIL then
	ISO_UTIL = {}
end

local win_width = love.graphics.getWidth() / 1920
local win_height = love.graphics.getHeight() / 1080

local drawhook = love.draw
function love.draw()
	drawhook()

	--Just gonna...
	function FuckingImage(fn)
		local full_path = (iso.path
			.. "image/" .. fn)
		local file_data = assert(NFS.newFileData(full_path),
			("Missing Image! Are you sure you loaded it, or named it correctly?"))
		local tempimagedata = assert(love.image.newImageData(file_data), ("Another mod is using the same function name!"))
		return (assert(love.graphics.newImage(tempimagedata), ("I honestly don't know how you get here")))
	end

	--...Borrow, Some code. -Doctor4t
	if G.swoon and (G.swoon > 0) then
		if iso.swoon == nil then iso.swoon = FuckingImage("SWOON.png") end
		love.graphics.setColor(0, 0.5, 1, 1)
		love.graphics.draw(iso.swoon, 0 * win_width * 0.5, 0 * win_height * 0.5, 0, win_width * 2.2,
			win_height * 2.1)
	end

	if G.laugher and (G.laugher > 0) then
		if iso.laugher == nil then iso.laugher = FuckingImage("HAHAHAHAHAAAAAAAAAAAA.jpg") end
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.draw(iso.laugher, 0, 0, 0, 2.6, 1.65)
	end

	if G.silence and (G.silence > 0) then
		if iso.silence == nil then iso.silence = FuckingImage("blackscreen.png") end
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.draw(iso.silence, 0, 0, 0, 3, 3)
	end

	if G.burger and (G.burger > 0) then
		if iso.burger == nil then iso.burger = FuckingImage("cheeseburger.png") end
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.draw(iso.burger, 0 * win_width * 2, 0 * win_height * 2, 0, win_width * 2.5, win_height * 2.4)
	end

	--It's that easy. -also Doctor4t
end

--is that yaha mous

local mod_path = "" .. SMODS.current_mod.path
iso.path = mod_path

function forceGameoverEvent()
	G.E_MANAGER:add_event({
		func = function()
			G.STATE = G.STATES.GAME_OVER
			G.STATE_COMPLETE = false
			return true
		end
	})
end

function forceGameover()
	G.STATE = G.STATES.GAME_OVER
	G.STATE_COMPLETE = false
end

function ISO_getfuckedlmfao()
	G.E_MANAGER:add_event(Event({
		trigger = "immediate",
		func = function()
			play_sound("iso_swoonstart")
			G.swoon = 1
			return true
		end
	}))
	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 2.3 * G.SETTINGS.GAMESPEED,
		func = function()
			play_sound("iso_swoonend")
			G.swoon = 0
			return true
		end
	}))
	G.E_MANAGER:add_event(Event({
		trigger = "immediate",
		func = function()
			SMODS.destroy_cards(SMODS.find_card("j_iso_dw_astro"),true,true,true)
			return true
		end
	}))
end

-- misc atlas stuff

SMODS.Atlas {
	key = 'decks',
	px = 71,
	py = 95,
	path = 'decks.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'triple_s',
	px = 71,
	py = 95,
	path = 'triple_s.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'other_jokers',
	px = 71,
	py = 95,
	path = 'other_jokers.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'pklove',
	px = 71,
	py = 95,
	path = 'PK_LOVE.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 24,
	fps = 20
}

SMODS.Atlas {
	key = 'pkground',
	px = 71,
	py = 95,
	path = 'pkground.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 24,
	fps = 30
}

SMODS.Atlas {
	key = 'oxidyzehate',
	px = 71,
	py = 95,
	path = 'oxidyzehatred.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 9,
	fps = 7
}

SMODS.Atlas {
	key = 'needle',
	px = 71,
	py = 95,
	path = "evil ass needle.png",
	atlas_table = "ASSET_ATLAS"
}

SMODS.Atlas {
	key = 'junkyard_tags',
	px = 34,
	py = 34,
	path = 'tags.png',
	atlas_table = "ASSET_ATLAS"
}

SMODS.ObjectType({
	key = "ocstob",
	default = "j_iso_solinium",
	cards = {
		j_iso_seraph = true
	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

SMODS.ObjectType({
	key = "copycats",
	default = "j_blueprint",
	cards = {
		j_iso_Oxy = true,
		j_iso_oxyemp = true,
		j_iso_crystal = true,
		j_blueprint = true,
		j_brainstorm = true
	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_lucky_cat)
	end,
})

SMODS.ObjectType({
	key = "unbalanced",
	default = "j_iso_oxyemp",
	cards = {
	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_lucky_cat)
	end,
})

SMODS.ObjectType({
	key = "fucking_absurd",
	default = "j_iso_jokertoendalljokers",
	cards = {
		j_iso_spkawk = true,
		j_iso_sphawk = true,
		j_iso_solawk = true,
		j_iso_spkawkclassic = true,
		j_iso_solawkclassic = true,
		j_iso_sphawkclassic = true,
		j_iso_winsweep = true
	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_lucky_cat)
	end,
})

SMODS.ObjectType({
	key = "all_junk",
	default = "j_iso_solinium",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_lucky_cat)
	end,
})

SMODS.ObjectType({
	key = "dandy",
	default = "j_iso_dw_astro",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_lucky_cat)
	end,
})

SMODS.ObjectType({
	key = "wire",
	default = "j_iso_steelwire",
	cards = {
		j_iso_steelwire = true
	},
})

SMODS.Atlas {
	key = 'dw',
	px = 71,
	py = 95,
	path = 'dandysworld.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'sugar',
	px = 71,
	py = 95,
	path = 'sugarstuff.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'other_ocs',
	px = 71,
	py = 95,
	path = 'other_ocs.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'stakes',
	px = 29,
	py = 29,
	path = 'stakes.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Sound {
	key = "weird",
	path = "superweirdsound.ogg",
	pitch = 15
}

SMODS.Sound {
	key = "gore5",
	path = "gore5.ogg",
	pitch = 1
}

SMODS.Sound {
	key = "stat_down",
	path = "reduced.ogg",
	pitch = 1
}

SMODS.Sound {
	key = "jumpscare",
	path = "jumpscare.ogg"
}

SMODS.Sound {
	key = "snd_pklove_a",
	path = 'pklove_alpha.ogg',
	pitch = 1
}

SMODS.Sound {
	key = "snd_pklove_b",
	path = 'pklove_beta.ogg',
	pitch = 1
}

SMODS.Sound {
	key = "snd_pklove_g",
	path = 'pklove_gamma.ogg',
	pitch = 1
}

SMODS.Sound {
	key = "snd_pklove_o",
	path = 'pklove_omega.ogg',
	pitch = 1
}

SMODS.Sound {
	key = "manager_esquire",
	path = "manager_esquire.ogg",
	pitch = 1
}

SMODS.Sound {
	key = "ONWARD_ROCHINATE",
	path = "onward_rochinate.ogg",
	pitch = 1
}

SMODS.Atlas {
	key = 'junkyardblinds',
	px = 34,
	py = 34,
	path = "junkyardblinds.png",
	atlas_table = 'ANIMATION_ATLAS',
	frames = 21
}

SMODS.Atlas {
	key = 'fpeatlas',
	px = 71,
	py = 95,
	path = 'fpecharacters.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'terminuses',
	px = 71,
	py = 95,
	path = 'terminusjokers.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'radiationset',
	px = 71,
	py = 95,
	path = 'radiationset.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = "placeholder",
	px = 71,
	py = 95,
	path = "placeholder.png",
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'crossmod_blinds',
	px = 34,
	py = 34,
	path = "crossmod_blinds.png",
	atlas_table = "ANIMATION_ATLAS",
	frames = 21
}

SMODS.Atlas {
	key = 'thevessel_blind',
	px = 34,
	py = 34,
	path = 'THE VESSEL.png',
	atlas_table = "ANIMATION_ATLAS",
	frames = 21,
	fps = 10
}

SMODS.Sound {
	key = "loser",
	path = "catlaugh.ogg",
}

SMODS.Sound {
	key = 'straddle',
	path = "straddle.ogg"
}

SMODS.Sound {
	key = "incorrect",
	path = "incorrect.ogg"
}

SMODS.Sound {
	key = "franklin",
	path = "franklin.ogg"
}

SMODS.Sound {
	key = 'ME',
	path = "Me.ogg"
}

SMODS.Sound {
	key = 'ominouscancel',
	path = "andrecluseisfuckingdead.ogg"
}

SMODS.Sound {
	key = 'ominousworse',
	path = "torture_a_fictional_deer.ogg"
}

SMODS.Sound {
	key = 'ailment',
	path = "ailment.ogg"
}

SMODS.Sound {
	key = 'chimera_ping',
	path = "why.ogg"
}

-- SMODS.Joker:take_ownership('joker',
--     {
-- 	atlas = 'pklove',
-- 	pos = {x=0, y=3},
--     },
--     true
-- )
--only use when shader testing

SMODS.DynaTextEffect {
	key = "iso_tremble",
}

SMODS.Sound {
	key = 'music_ocean',
	path = "music_ocean.ogg",
	pitch = 0.7,
	volume = 1,
	select_music_track = function()
		if G.current_isomode == nil then return false elseif G.current_isomode >= 666 then return true end
	end
}

SMODS.Sound {
	key = 'music_maskedman',
	path = "music_maskedman.ogg",
	pitch = 1,
	volume = 1,
	select_music_track = function()
		local steel = 0
		for _, steelwirecount in ipairs(SMODS.find_card("j_iso_steelwire")) do
			steel = steel + 1
		end
		if G.GAME then
			if G.GAME.reclusive_vessel == true and not copyright_free == true then
				return true
			elseif steel >= 200 then
				return G.GAME.evil_steel == true and 1e99
			elseif G.GAME.iso_starspace_horny_hour == true then
				return true and 1e99
			else
				return false
			end
		end
	end
}

SMODS.Sound {
	key = 'music_heartbeat',
	path = "mus_hypnosis_boss.ogg",
	pitch = 0.7,
	volume = 1,
	select_music_track = function()
		if G.GAME then
			if G.GAME.hypnosis == true then return true else return false end
		end
	end
}

loc_colour()
G.ARGS.LOC_COLOURS.iso_eyeshatteringblue = HEX('3df5ff')
G.ARGS.LOC_COLOURS.iso_almanacblue = HEX('0000ff')

iso.configbs = SMODS.current_mod.config

--diansu video
function iso_custom_video(name, buttonname)
	local file_path = SMODS.Mods["isoatro"].path .. "/resources/" .. name .. ".ogv"
	local file = NFS.read(file_path)
	love.filesystem.write("diansumeme.ogv", file)
	local video_file = love.graphics.newVideo('diansumeme.ogv')
	local vid_sprite = Sprite(0, 0, 11 * 16 / 9, 11, G.ASSET_ATLAS["ui_" .. (G.SETTINGS.colourblind_option and 2 or 1)],
		{ x = 0, y = 0 })
	video_file:getSource():setVolume(G.SETTINGS.SOUND.volume * G.SETTINGS.SOUND.game_sounds_volume / (100 * 10))
	vid_sprite.video = video_file
	video_file:play()

	local t = create_UIBox_generic_options({
		back_delay = 3,
		back_label = buttonname,
		colour = G.C.BLACK,
		padding = 0,
		contents = {
			{ n = G.UIT.O, config = { object = vid_sprite } } }
	})
	return t
end

-- SMODS.Keybind { --makes my life easier
-- 	key_pressed = "l",
-- 	action = function(self)
-- 		G.E_MANAGER:add_event(Event({
-- 			func = function()
-- 				play_sound("iso_swoonstart")
-- 				G.swoon = 1
-- 				return true
-- 			end
-- 		}))
-- 		G.E_MANAGER:add_event(Event({
-- 			trigger = "after",
-- 			delay = 2 * G.SETTINGS.GAMESPEED,
-- 			func = function()
-- 				play_sound("iso_swoonend")
-- 				G.swoon = 0
-- 				return true
-- 			end
-- 		}))
-- 	end
-- }

--burg

SMODS.current_mod.optional_features = {
	retrigger_joker = true,
	cardareas = {
		discard = true,
		deck = true
	}
}

SMODS.Shader {
	key = 'fluorescent',
	path = 'fluorescent.fs'
}
