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

	--...Borrow, Some code. -Doctor4t
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
		love.graphics.draw(ocstobal.burger, 0 * win_width * 2, 0 * win_height * 2, 0, win_width * 2.5, win_height * 2.4)
	end

	--It's that easy. -also Doctor4t
end

--is that yaha mouse

if not ocstobal then
	ocstobal = {}
end

if next(SMODS.find_mod("unik")) then
	unik_detect = true
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
	key = 'reclusebl',
	px = 34,
	py = 34,
	path = 'fearx2.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 1
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
	key = 'burnteyes',
	px = 34,
	py = 34,
	path = 'lankybossblind.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 18
}

SMODS.Atlas {
	key = 'friedshrimp',
	px = 71,
	py = 95,
	path = 'SHRIMPO.png',
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
	key = 'solblind',
	px = 34,
	py = 34,
	path = 'solblind.png',
	atlas_table = 'ANIMATION_ATLAS',
	frames = 24
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
		if G.GAME then
			if G.GAME.reclusive_vessel == true then return true else return false end
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
	assert(SMODS.load_file("data/quips.lua"))()
	assert(SMODS.load_file("data/tags.lua"))()
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

function burger()
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

--burg

SMODS.current_mod.optional_features = {
	retrigger_joker = true,
	cardareas = {
		discard = true,
		deck = true
	}
}
-- how much morefluff
function pk_love(joker)
	if joker.config.center.pk_love == true then
		return true
	elseif type(joker.config.center.pk_love) == "function" then
		return joker.config.center.pk_love(joker)
	end
	return false
end

SMODS.Shader {
	key = 'fluorescent',
	path = 'fluorescent.fs'
}

if G.GAME then
	G.GAME.omegarush = 0 --prevents crash
end
--------hooks n shit
local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
	if card.config.center.key == "j_ocstobal_antislopinator" then
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
	if next(SMODS.find_card("j_ocstobal_abbie")) then
		weight = weight * 31.24 + 112.424
	elseif next(SMODS.find_card("j_ocstobal_abbie")) and next(SMODS.find_card("j_ocstobal_sparky")) then
		weight = weight * (31.24 + 112.242) * 10 -- DOOMED COUPLE RAHHHHHHHHHHH
	end
	return weight
end

--"taken shamefully from unik's mod"
--probably was from entropy too but whatever
local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
	local tdc = G_UIDEF_use_and_sell_buttons_ref(card)
	if (card.area == G.jokers) and card.config.center.key == "j_ocstobal_seraph" then
		local sell = nil
		local use = nil
		local levels = nil

		sell = {
			n = G.UIT.C,
			config = { align = "cr" },
			nodes = {
				{
					n = G.UIT.C,
					config = { ref_table = card, align = "cr", padding = 0.1, r = 0.08, minw = 1.25, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'sell_card', func = 'can_sell_card' },
					nodes = {
						{ n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
						{
							n = G.UIT.C,
							config = { align = "tm" },
							nodes = {
								{
									n = G.UIT.R,
									config = { align = "cm", maxw = 1.25 },
									nodes = {
										{ n = G.UIT.T, config = { text = localize('b_sell'), colour = G.C.UI.TEXT_LIGHT, scale = 0.4, shadow = true } }
									}
								},
								{
									n = G.UIT.R,
									config = { align = "cm" },
									nodes = {
										{ n = G.UIT.T, config = { text = localize('$'), colour = G.C.WHITE, scale = 0.4, shadow = true } },
										{ n = G.UIT.T, config = { ref_table = card, ref_value = 'sell_cost_label', colour = G.C.WHITE, scale = 0.55, shadow = true } }
									}
								}
							}
						}
					}
				},
			}
		}
		levels =
		{
			n = G.UIT.C,
			config = { align = "cr" },
			nodes = {

				{
					n = G.UIT.C,
					config = { ref_table = card, align = "cr", maxw = 1.25, padding = 0.1, r = 0.08, minw = 1.25, minh = (card.area and card.area.config.type == 'joker') and 0 or 1, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = false, button = 'seraphmenu' },
					nodes = {
						{ n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
						{ n = G.UIT.T, config = { text = 'Levels', colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true } }
					}
				}
			}
		}
		--overwriting usual buttons
		tdc = {
			n = G.UIT.ROOT,
			config = { padding = 0, colour = G.C.CLEAR },
			nodes = {
				{
					n = G.UIT.C,
					config = { padding = 0.15, align = 'cl' },
					nodes = {
						{
							n = G.UIT.R,
							config = { align = 'cl' },
							nodes = {
								sell
							}
						},
						{
							n = G.UIT.R,
							config = { align = 'cl' },
							nodes = {
								use
							}
						},
						{
							n = G.UIT.R,
							config = { align = 'cl' },
							nodes = {
								levels
							}
						},
					}
				},
			}
		}
	end
	return tdc
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

function G.FUNCS.seraphmenu()
	G.FUNCS.overlay_menu {
		definition = sphlvls("Back"),
		config = { no_esc = true }
	}
end
