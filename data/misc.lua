SMODS.Sound({ key = "swoonstart", path = "swoonstart.ogg" })
SMODS.Sound({ key = "swoonend", path = "swoonend.ogg" })


local win_width = love.graphics.getWidth() / 1920
local win_height = love.graphics.getHeight() / 1080

local drawhook = love.draw
function love.draw()
	drawhook()

	--Just gonna...
	function FuckingImage(fn)
		local full_path = (ocstobal.path
			.. "image/" .. fn)
		local file_data = assert(NFS.newFileData(full_path),
			("Missing Image! Are you sure you loaded it, or named it correctly?"))
		local tempimagedata = assert(love.image.newImageData(file_data), ("Another mod is using the same function name!"))
		return (assert(love.graphics.newImage(tempimagedata), ("I honestly don't know how you get here")))
	end

	--...Borrow. Some code. -Doctor4t
	if G.swoon and (G.swoon > 0) then
		if ocstobal.swoon == nil then ocstobal.swoon = FuckingImage("SWOON.png") end
		love.graphics.setColor(0, 0.5, 1, 1)
		love.graphics.draw(ocstobal.swoon, 0, 0, 0, 1.45, 1.65)
	end

	if G.laugher and (G.laugher > 0) then
		if ocstobal.laugher == nil then ocstobal.laugher = FuckingImage("HAHAHAHAHAAAAAAAAAAAA.jpg") end
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.draw(ocstobal.laugher, 0, 0, 0, 2.6, 1.65)
	end

	if G.silence and (G.silence > 0) then
		if ocstobal.silence == nil then ocstobal.silence = FuckingImage("blackscreen.png") end
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.draw(ocstobal.silence, 0, 0, 0, 3, 3)
	end

	if G.burger and (G.burger > 0) then
		if ocstobal.burger == nil then ocstobal.burger = FuckingImage("cheeseburger.png") end
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.draw(ocstobal.burger, 0*win_width*2, 0*win_height*2, 0, win_width*2.5, win_height*2.4)
	end

	--It's that easy. -also Doctor4t
end

--is that yaha mouse

if not ocstobal then
	ocstobal = {}
end

local mod_path = "" .. SMODS.current_mod.path
ocstobal.path = mod_path

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

-- misc atlas stuff

SMODS.Atlas {
	key = 'baller',
	px = 71,
	py = 95,
	path = 'thetriodeck.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'impossible',
	px = 34,
	py = 34,
	path = 'omegainf.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 15
}

SMODS.Atlas {
	key = 'rngatlas',
	px = 34,
	py = 34,
	path = 'rng.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 12
}

SMODS.Atlas {
	key = 'unstable',
	px = 34,
	py = 34,
	path = 'PRAY.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 24
}

SMODS.Atlas {
	key = 'pklove',
	px = 71,
	py = 95,
	path = 'PK_LOVE.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 24,
	fps = 16
}

SMODS.Atlas {
	key = 'needle',
	px = 71,
	py = 95,
	path = "evil ass needle.png",
	atlas_table = "ASSET_ATLAS"
}

SMODS.ObjectType({
	key = "ocstob",
	default = "j_ocstobal_solinium",
	cards = {
		j_ocstobal_seraph = true
	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

SMODS.ObjectType({
	key = "copycats",
	default = "j_blueprint",
	cards = {
		j_ocstobal_Oxy = true,
		j_ocstobal_oxyemp = true,
		j_ocstobal_crystal = true,
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
	default = "j_ocstobal_oxyemp",
	cards = {
	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_lucky_cat)
	end,
})

SMODS.ObjectType({
	key = "fucking_absurd",
	default = "j_ocstobal_jokertoendalljokers",
	cards = {
		j_ocstobal_spkawk = true,
		j_ocstobal_sphawk = true,
		j_ocstobal_solawk = true,
		j_ocstobal_spkawkclassic = true,
		j_ocstobal_solawkclassic = true,
		j_ocstobal_sphawkclassic = true,
		j_ocstobal_winsweep = true
	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_lucky_cat)
	end,
})

SMODS.ObjectType({
	key = "bitch",
	default = "j_ocstobal_candycane",
	cards = {
		j_ocstobal_candycane = true,
	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_lucky_cat)
	end,
})

SMODS.Atlas {
	key = 'aioimg',
	px = 71,
	py = 95,
	path = 'aio.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'diansuvulkarch',
	px = 34,
	py = 34,
	path = 'MORIYA I THOUGHT YOU WERE ENLIGHTENED.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 1
}

SMODS.Atlas {
	key = 'omegarush',
	px = 34,
	py = 34,
	path = 'omegarush.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 35
}

SMODS.Atlas {
	key = 'BLACKKNIFE',
	px = 34,
	py = 34,
	path = 'corruptknife.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 16
}

SMODS.Atlas {
	key = 'UNFAIRSCALE',
	px = 34,
	py = 34,
	path = 'unfairscale.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 16
}

SMODS.Atlas {
	key = 'HELPME',
	px = 34,
	py = 34,
	path = 'helpme.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 16
}

SMODS.Atlas {
	key = 'solini',
	px = 71,
	py = 95,
	path = 'soliniumdynamic.png',
	atlas_table = 'ASSET_ATLAS',
}

SMODS.Atlas {
	key = 'reclusebl',
	px = 34,
	py = 34,
	path = 'fearx2.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 1
}

SMODS.Atlas {
	key = 'agonizing',
	px = 71,
	py = 95,
	path = 'brewinghatred.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'shyblind',
	px = 34,
	py = 34,
	path = 'shyblind.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 22
}

SMODS.Atlas {
	key = 'knifeblind',
	px = 34,
	py = 34,
	path = 'knifeblind.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 1
}

SMODS.Atlas {
	key = 'starry',
	px = 71,
	py = 95,
	path = 'evilstar.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'burnteyes',
	px = 34,
	py = 34,
	path = 'lankybossblind.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 18
}

SMODS.Atlas {
	key = 'edagger',
	px = 71,
	py = 95,
	path = 'eternaldagger.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'sphredo',
	px = 71,
	py = 95,
	path = 'sphredo.png',
	atlas_table = "ASSET_ATLAS"
}

SMODS.Atlas {
	key = 'friedshrimp',
	px = 71,
	py = 95,
	path = 'SHRIMPO.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'twistedshrimp',
	px = 71,
	py = 95,
	path = 'twistedfriedshrimp.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'dw',
	px = 71,
	py = 95,
	path = 'dandysworld.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'ichor',
	px = 71,
	py = 95,
	path = 'ichor.png',
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
	key = 'crystal',
	px = 71,
	py = 95,
	path = 'crystal.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'abbiepng',
	px = 71,
	py = 95,
	path = 'abbor.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'antislop',
	px = 71,
	py = 95,
	path = 'antislopinator.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'slop',
	px = 71,
	py = 95,
	path = 'slopinator.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'solblind',
	px = 34,
	py = 34,
	path = 'solblind.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 24
}

SMODS.Atlas {
	key = 'finalstake',
	px = 29,
	py = 29,
	path = 'finalstakere.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Sound {
	key = "weird",
	path = "superweirdsound.ogg",
	pitch = 15
}

SMODS.Sound {
	key = "jumpscare",
	path = "jumpscare.ogg"
}

SMODS.Sound {
	key = "snd_pklove_a",
	path = 'pklove_alpha.ogg'
}

SMODS.Sound {
	key = "snd_pklove_b",
	path = 'pklove_beta.ogg'
}

SMODS.Sound {
	key = "snd_pklove_g",
	path = 'pklove_gamma.ogg'
}

SMODS.Sound {
	key = "snd_pklove_o",
	path = 'pklove_omega.ogg'
}

SMODS.Atlas {
	key = 'looksinside',
	px = 71,
	py = 95,
	path = 'looksinside.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'symbol',
	px = 71,
	py = 95,
	path = 'symbol.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'masked',
	px = 71,
	py = 95,
	path = 'themask.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'avaritia',
	px = 71,
	py = 95,
	path = 'AVARITIA.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'oxyemp',
	px = 71,
	py = 95,
	path = 'empoweredoxy.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'johntetration',
	px = 71,
	py = 95,
	path = 'astro.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'omegarush',
	px = 34,
	py = 34,
	path = 'omegarush.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 35
}

SMODS.Atlas {
	key = 'THEDROPLET',
	px = 34,
	py = 34,
	path = 'corruptoxyblind.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 19
}

SMODS.Atlas {
	key = 'UNSHY',
	px = 34,
	py = 34,
	path = 'corruptspkblind.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 36
}

SMODS.Atlas {
	key = 'spkawk_classic',
	px = 71,
	py = 95,
	path = 'clsspkawk.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'candycane',
	px = 71,
	py = 95,
	path = 'candycane.png',
	atlas_table = 'ASSET_ATLAS'
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

-- SMODS.Atlas {
-- 	key = 'tempjtetration',
-- 	px = 71,
-- 	py = 95,
-- 	path = 'astrotemp.png',
-- 	atlas_table = 'ASSET_ATLAS'
-- }

SMODS.Atlas {
	key = 'deckofalltime',
	px = 71,
	py = 95,
	path = 'trolldeck.png',
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
	key = 'moddingchat',
	px = 71,
	py = 95,
	path = 'moddingchat.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'xeno',
	px = 71,
	py = 95,
	path = 'xenoo.png',
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'starman',
	px = 34,
	py = 34,
	path = 'starman.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 24
}

SMODS.Atlas {
	key = "placeholder",
	px = 71,
	py = 95,
	path = "placeholder.png",
	atlas_table = 'ASSET_ATLAS'
}

SMODS.Atlas {
	key = 'giegueblind',
	px = 34,
	py = 34,
	path = "Giygas Is Fucking Dying.png",
	atlas_table = "ANIMATION_ATLAS",
	frames = 16
}

SMODS.Atlas {
	key = 'oxyblindatlas',
	px = 34,
	py = 34,
	path = "oxyblind.png",
	atlas_table = "ANIMATION_ATLAS",
	frames = 24
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
	key = 'music_ocean',
	path = "music_ocean.ogg",
	pitch = 0.7,
	volume = 1,
	select_music_track = function()
		if G.current_isomode == nil then return false elseif G.current_isomode >= 666 then return true end
	end
}

-- --note to self: uncomment if the original creator of these songs allow these two songs to be used in this mod
-- SMODS.Sound {
-- 	key = 'music_extraodinary',
-- 	path = 'music_Extraordinary.ogg',
-- 	pitch = 0.7,
-- 	select_music_track = function()
-- 		--return ocstobal.should_do_this
-- 		return (G.GAME and G.GAME.ocstobal_ext == 100) and 0 or false
-- 	end
-- }

-- SMODS.Sound {
-- 	key = 'music_wondrous',
-- 	path = 'music_Wondrous.ogg',
-- 	pitch = 0.7,
-- 	select_music_track = function()
-- 		--return ocstobal.should_do_this
-- 		return (G.GAME and G.GAME.ocstobal_ext == 50) and 0 or false
-- 	end
-- }

--how the fuck do i check who made the extraordinary song now

loc_colour()
G.ARGS.LOC_COLOURS.ocstobal_eyeshatteringblue = HEX('3df5ff')
G.ARGS.LOC_COLOURS.ocstobal_almanacblue = HEX('0000ff')

ocstobal.configbs = SMODS.current_mod.config

local function ex()
	local mod_path = SMODS.current_mod.path
	assert(SMODS.load_file("data/fusions.lua"))()
	assert(SMODS.load_file("data/gradients.lua"))()
	assert(SMODS.load_file("data/decks.lua"))()
	assert(SMODS.load_file("data/blinds.lua"))()
	assert(SMODS.load_file("data/achievements.lua"))()
	assert(SMODS.load_file("data/challenges.lua"))()
	assert(SMODS.load_file("data/editions.lua"))()
	assert(SMODS.load_file("data/config.lua"))()
	assert(SMODS.load_file("data/stakes.lua"))()
	assert(SMODS.load_file("data/configchecks.lua"))()
	assert(SMODS.load_file("data/reclusecheck.lua"))()
	assert(SMODS.load_file("data/otherchecks.lua"))()
	assert(SMODS.load_file("data/consumables.lua"))()
	-- assert(SMODS.load_file("data/sleeve.lua"))() do not use
end

ex()

--diansu video
function create_UIBox_custom_video1(name, buttonname)
	local file_path = SMODS.Mods["ocstobalatro"].path .. "/resources/" .. name .. ".ogv"
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

--lanky "i'll go fucking kill myself" box video
-- function create_UIBox_custom_video2(name, buttonname)
-- 	local file_path = SMODS.Mods["ocstobalatro"].path .. "/resources/" .. name .. ".ogv"
-- 	local file = NFS.read(file_path)
-- 	love.filesystem.write("suffer.ogv", file)
-- 	local video_file = love.graphics.newVideo('suffer.ogv')
-- 	local vid_sprite = Sprite(0, 0, 11 * 16 / 9, 11, G.ASSET_ATLAS["ui_" .. (G.SETTINGS.colourblind_option and 2 or 1)],
-- 		{ x = 0, y = 0 })
-- 	video_file:getSource():setVolume(G.SETTINGS.SOUND.volume * G.SETTINGS.SOUND.game_sounds_volume / (100 * 10))
-- 	vid_sprite.video = video_file
-- 	video_file:play()

-- 	local n = create_UIBox_generic_options({
-- 		back_delay = 550,
-- 		back_label = buttonname,
-- 		colour = G.C.BLACK,
-- 		padding = 0,
-- 		contents = {
-- 			{ n = G.UIT.O, config = { object = vid_sprite } } }
-- 	})
-- 	return n
-- end

--studio goo d (LOUD INCORRECT BUZZER) FUCK - studio food (LOUD INCORRECT BUZZER) FUCK - studio ghibli food looks so good
--no officer im not drunk -LCdirects
-- function create_UIBox_custom_video3(name, buttonname)
-- 	local file_path = SMODS.Mods["ocstobalatro"].path .. "/resources/" .. name .. ".ogv"
-- 	local file = NFS.read(file_path)
-- 	love.filesystem.write("peak.ogv", file)
-- 	local video_file = love.graphics.newVideo('peak.ogv')
-- 	local vid_sprite = Sprite(0, 0, 11 * 16 / 9, 11, G.ASSET_ATLAS["ui_" .. (G.SETTINGS.colourblind_option and 2 or 1)],
-- 		{ x = 0, y = 0 })
-- 	video_file:getSource():setVolume(G.SETTINGS.SOUND.volume * G.SETTINGS.SOUND.game_sounds_volume / (100 * 10))
-- 	vid_sprite.video = video_file
-- 	video_file:play()

-- 	local a = create_UIBox_generic_options({
-- 		back_delay = 3,
-- 		back_label = buttonname,
-- 		colour = G.C.BLACK,
-- 		padding = 0,
-- 		contents = {
-- 			{ n = G.UIT.O, config = { object = vid_sprite } } }
-- 	})
-- 	return a
-- end

--oh no.
-- function create_UIBox_custom_video4(name, buttonname)
-- 	local file_path = SMODS.Mods["ocstobalatro"].path .. "/resources/" .. name .. ".ogv"
-- 	local file = NFS.read(file_path)
-- 	love.filesystem.write("sorry.ogv", file)
-- 	local video_file = love.graphics.newVideo('sorry.ogv')
-- 	local vid_sprite = Sprite(0, 0, 11 * 16 / 9, 11, G.ASSET_ATLAS["ui_" .. (G.SETTINGS.colourblind_option and 2 or 1)],
-- 		{ x = 0, y = 0 })
-- 	video_file:getSource():setVolume(G.SETTINGS.SOUND.volume * G.SETTINGS.SOUND.game_sounds_volume / (100 * 10))
-- 	vid_sprite.video = video_file
-- 	video_file:play()

-- 	local a = create_UIBox_generic_options({
-- 		back_delay = 2340,
-- 		back_label = buttonname,
-- 		colour = G.C.BLACK,
-- 		padding = 0,
-- 		contents = {
-- 			{ n = G.UIT.O, config = { object = vid_sprite } } }
-- 	})
-- 	return a
-- end

-- SMODS.Keybind {
-- 	key_pressed = "l",
-- 	action = function(self)
-- 		G.E_MANAGER:add_event(Event({
-- 			func = function()
-- 				play_sound("ocstobal_loser")
-- 				G.laugher = 1
-- 				--love.load()
-- 				--function love.draw()
-- 				--love.graphics.draw(death, -100, 0, 0, 1.5, 1.25)
-- 				--love.graphics.setColor(1, 1, 1)
-- 				--end
-- 				--love.draw() -- "The failed code goes crazy"
-- 				return true
-- 			end
-- 		}))
-- 		G.E_MANAGER:add_event(Event({
-- 			trigger = "after",
-- 			delay = 6,
-- 			func = function()
-- 				function DestroyThatFuckingImageForGodsSake()
-- 					G.laugher = 0
-- 				end

-- 				DestroyThatFuckingImageForGodsSake()
-- 				return true
-- 			end
-- 		}))
-- 	end

-- }

--THE CONDEMNED CONFIG MENU

-- SMODS.current_mod.config_tab = function()
-- 	return {n = G.UIT.ROOT, config = {r=.1, minw = 12, minh = 6, align = "tm", padding = 0.3, colour = G.C.BLACK}, nodes = {
-- 		{n = G.UIT.C, config = {minw=1, minh=1, align = "tl", colour = G.C.CLEAR, padding = 0.15}, nodes = {
-- 		create_toggle({
-- 			active_colour = G.C.RED,
--             label = "No OCs (But why?)",
--             ref_table = ocstobal.configbs,
--             ref_value = 'no_ocs',
--         }),
-- 		create_toggle({
-- 			active_colour = G.C.RED,
--             label = "Streamer Mode",
--             ref_table = ocstobal.configbs,
--             ref_value = 'less_nsfw',
--         }),	
--         create_toggle({
-- 			active_colour = G.C.RED,
--             label = "Unbalanced Mode (Requires Restart)",
--             ref_table = ocstobal.configbs,
--             ref_value = 'unbalanced_mode',
--         }),
-- 		create_toggle({
-- 			active_colour = G.C.BLACK,
--             label = "{C:red}Isotypical's Almanac (Requires Restart){}",
--             ref_table = ocstobal.configbs,
--             ref_value = 'very_unbalanced_mode',
--         }),
--         }}
-- 	}}
-- end
--moved

--dunno what to put here

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

-- G.recluseblind = 0 --prevents crashes sometimes
-- G.omegarush = 0    --prevents crashes sometimes

-- SMODS.current_mod.reset_game_globals = function(run_start)
-- 	if run_start then
-- 		G.omegarush = 0
-- 		G.recluseblind = 0
-- 	end
-- end

if G.GAME then
	G.GAME.omegarush = 0 --prevents crash
end

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
	if card.config.center.key == "j_ocstobal_antislopinator" then -- ignore slot limit when bought
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

-- ok so maybe i lied about abbie doing nothing
--credits to paradox for the hook
local abbornegative = G.P_CENTERS.e_negative.get_weight
G.P_CENTERS.e_negative.get_weight = function(self)
	local weight = abbornegative(self)
	if next(SMODS.find_card("j_ocstobal_abbie")) then
		weight = weight * 31.24 + 112.424
	elseif next(SMODS.find_card("j_ocstobal_abbie")) and next(SMODS.find_card("j_ocstobal_sparky")) then
		weight = weight * (31.24 + 112.242) * 10 -- DOOMED COUPLE RAHHHHHHHHHHH
	end
	return weight
end