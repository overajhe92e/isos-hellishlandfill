function G.FUNCS.yeah()
	G.fearfactor = 0
	G.current_isomode = -1
end

function G.FUNCS.stable()
	G.fearfactor = 0
	G.current_isomode = 0
end

function G.FUNCS.unbalancedmenu()
	G.FUNCS.overlay_menu {
		definition = unbalancedmenu("Exit"),
		config = { no_esc = true }
	}
end

function G.FUNCS.balancedmenu()
	G.FUNCS.overlay_menu {
		definition = balancedmenu("Exit"),
		config = { no_esc = true }
	}
end

function G.FUNCS.unbalanced()
	G.fearfactor = 0
	G.current_isomode = 1
end

function G.FUNCS.ahabsurd()
	G.FUNCS.overlay_menu {
		definition = absurdmenu("Exit"),
		config = { no_esc = true }
	}
end

function G.FUNCS.verybad()
	G.fearfactor = 0
	G.current_isomode = 2
	play_sound('ocstobal_straddle')
end

function eeriestuff()
	G.silence = 0
	G.SETTINGS.SOUND.music_volume = 99
end

function absurdmenu(buttonname)
	local absurd = create_UIBox_generic_options({
		back_delay = 1,
		back_label = buttonname,
		back_colour = G.C.DARK_EDITION,
		padding = 0.1,
		contents = {
			{
				n = G.UIT.C,
				config = { minh = 4, minw = 7, align = 'tm', padding = 0.1, colour = G.C.BLACK, r = 0.1 },
				nodes = {
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = "Absurd Gameplay", scale = 0.8, colour = G.C.EDITION, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = "Ever wanted to do numberslop?", scale = 0.5, colour = G.C.EDITION, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = "Adds absolutely insane jokers, and some decks are superbuffed.", scale = 0.5, colour = G.C.WHITE, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = "And also adds even MORE levels to Seraph's Levelling system!", scale = 0.4, colour = G.C.WHITE, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = "It is HIGHLY suggested to play Normal/Rebalanced Mode first!", scale = 0.65, colour = G.C.RED, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { minw = 1, minh = 1, align = "tm", padding = 0.1, colour = G.C.DARK_EDITION, button = "verybad", r = 0.1 },
						nodes = {
							{ n = G.UIT.T, config = { text = "Confirm Selection", colour = G.C.WHITE, scale = 0.6, align = "bm" }, },
						}
					},
				}
			}
		}
	})
	return absurd
end

function unbalancedmenu(buttonname)
	local unbalanced = create_UIBox_generic_options({
		back_delay = 1,
		back_label = buttonname,
		back_colour = G.C.FILTER,
		padding = 0.1,
		contents = {
			{
				n = G.UIT.C,
				config = { minh = 4, minw = 7, align = 'tm', padding = 0.1, colour = G.C.BLACK, r = 0.1 },
				nodes = {
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = "Unbalanced Mode", scale = 0.8, colour = G.C.FILTER, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = "The Cryptid-wanna be Mode!", scale = 0.5, colour = G.C.EDITION, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = "Adds some jokers that are considerably too strong for normal mode.", scale = 0.5, colour = G.C.WHITE, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = "And also allows Seraph's levels to go past LV 100!", scale = 0.4, colour = G.C.WHITE, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = "It is suggested to play Normal/Rebalanced Mode first!", scale = 0.65, colour = G.C.FILTER, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { minw = 1, minh = 1, align = "tm", padding = 0.1, colour = G.C.FILTER, button = "unbalanced", r = 0.1 },
						nodes = {
							{ n = G.UIT.T, config = { text = "Confirm Selection", colour = G.C.WHITE, scale = 0.6, align = "bm" }, },
						}
					},
				}
			}
		}
	})
	return unbalanced
end

function balancedmenu(buttonname)
	local absurd = create_UIBox_generic_options({
		back_delay = 1,
		back_label = buttonname,
		back_colour = G.C.GREEN,
		padding = 0.1,
		contents = {
			{
				n = G.UIT.C,
				config = { minh = 4, minw = 7, align = 'tm', padding = 0.1, colour = G.C.BLACK, r = 0.1 },
				nodes = {
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = "Normal Gameplay", scale = 0.8, colour = G.C.GREEN, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = "The way the mod is supposed to be experienced!", scale = 0.5, colour = G.C.GREEN, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = "The standard mode, no unbalanced jokers, and standard progression.", scale = 0.5, colour = G.C.WHITE, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = "Some limitations are put in place for this mode...", scale = 0.4, colour = G.C.WHITE, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = "It is recommended to play this mode!", scale = 0.65, colour = G.C.GREEN, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { minw = 1, minh = 1, align = "tm", padding = 0.1, colour = G.C.GREEN, button = "stable", r = 0.1 },
						nodes = {
							{ n = G.UIT.T, config = { text = "Confirm Selection", colour = G.C.WHITE, scale = 0.6, align = "bm" }, },
						}
					},
				}
			}
		}
	})
	return absurd
end

function thewarning(buttonname)
	local lore = create_UIBox_generic_options({
		back_delay = 1,
		back_label = buttonname,
		back_colour = G.C.RED,
		colour = G.C.BLACK,
		padding = 0,
		contents = {
			{
				n = G.UIT.C,
				config = { minh = 5, minw = 3, align = 'tm', padding = 0.1, colour = G.C.BLACK },
				nodes = {
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = "12151920nil195181168", scale = 0.85, colour = G.C.WHITE, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = 'All of them are gone... everyone...', scale = 0.5, colour = G.C.WHITE, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = '...', scale = 0.5, colour = G.C.WHITE, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = 'I... regret everything...', scale = 0.5, colour = G.C.RED, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = 'I got rid of them all.', scale = 0.5, colour = G.C.RED, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = 'But... I\'m free. More free than ever.', scale = 0.5, colour = G.C.WHITE, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = 'But... it\'s... lonely. Sparky, and Solinium were my closest friends.', scale = 0.5, colour = G.C.WHITE, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = 'Was it... worth it? Removing them..?', scale = 0.4, colour = G.C.RED, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = '[ Completely removes every joker, including vanilla. ]', scale = 0.4, colour = G.C.UI.TEXT_INACTIVE, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = '[ Except for Seraph, Broken Seraph, and other lore-based jokers. ]', scale = 0.4, colour = G.C.UI.TEXT_INACTIVE, align = 'm' } }
						}
					},
					{
						n = G.UIT.R,
						config = { align = 'm', padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{ n = G.UIT.T, config = { text = '[ Do not play this mode if you haven\'t found any character lore yet! ]', scale = 0.3, colour = G.C.UI.TEXT_INACTIVE, align = 'm' } }
						}
					}
				}
			}
		}
	})
	return lore
end

function G.FUNCS.supersecret()
	G.FUNCS.overlay_menu {
		definition = thewarning("No turning back now."),
		config = { no_esc = true }
	}
	G.GAME.current_isomode = 666
	play_sound('ocstobal_ominous', 0.8, 2)
	G.SETTINGS.SOUND.music_volume = 0
	G.silence = 1
	G.SETTINGS.GAMESPEED = 1
	G.fearfactor = 1
	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 5,
		func = function()
			G.SETTINGS.GAMESPEED = 4
			eeriestuff()
			return true
		end
	}))
end

SMODS.current_mod.config_tab = function()
	return {
		n = G.UIT.ROOT,
		config = { r = 0.25, minw = 8, minh = 1, align = "tm", padding = 0.1, colour = G.C.BLACK },
		nodes = {
			{
				n = G.UIT.R,
				config = { minw = 3, minh = 1, align = "tm", padding = 0.05, colour = G.C.CLEAR },
				nodes = {
					{
						n = G.UIT.R,
						config = { minw = 1, minh = 1, align = "tm", padding = 0.05, colour = G.C.CLEAR },
						nodes = {
							{
								n = G.UIT.R,
								config = { minh = 1, minw = 1, align = 'tm', padding = 0.05, colour = G.C.CLEAR },
								nodes = {
									{ n = G.UIT.T, config = { text = "Balancing Options", colour = G.C.EDITION, scale = 0.6, align = "m" }, },
								}
							},
							{
								n = G.UIT.R,
								config = { minh = 1, minw = 2, align = "tm", padding = 0.05, colour = G.C.CLEAR },
								nodes = {
									{
										n = G.UIT.R,
										config = { minw = 1, minh = 1, align = "tm", padding = 0.1, colour = G.C.BLUE, button = "yeah", r = 0.1 },
										nodes = {
											{ n = G.UIT.T, config = { text = "Rebalanced Mode", colour = G.C.WHITE, scale = 0.6, align = "m" }, },
										}
									},
									{
										n = G.UIT.R,
										config = { minw = 1, minh = 1, align = "tm", padding = 0.1, colour = G.C.GREEN, button = "balancedmenu", r = 0.1 },
										nodes = {
											{ n = G.UIT.T, config = { text = "Normal Mode", colour = G.C.WHITE, scale = 0.6, align = "m" }, },
										}
									},
									{
										n = G.UIT.R,
										config = { minw = 1, minh = 1, align = "tm", padding = 0.1, colour = G.C.FILTER, button = "unbalancedmenu", r = 0.1 },
										nodes = {
											{ n = G.UIT.T, config = { text = "Unbalanced Mode", colour = G.C.WHITE, scale = 0.6, align = "m" }, },
										}
									},
									{
										n = G.UIT.R,
										config = { minw = 1, minh = 1, align = "tm", padding = 0.1, colour = G.C.DARK_EDITION, button = "ahabsurd", r = 0.1 },
										nodes = {
											{ n = G.UIT.T, config = { text = "Absurd Gameplay", colour = G.C.WHITE, scale = 0.6, align = "m" }, },
										}
									},
									{
										n = G.UIT.R,
										config = { minh = 1, minw = 1, align = 'tm', padding = 0.05, colour = G.C.CLEAR },
										nodes = {
											{ n = G.UIT.T, config = { text = "Eh... Close enough. Welcome back Jen's Almanac.", colour = G.C.RED, scale = 0.35, align = "tm" }, }
										}
									},
									{
										n = G.UIT.R,
										config = { minw = 0, minh = 0, align = "tm", padding = 0.1, colour = G.C.BLACK, button = "supersecret", r = 0.1 },
										nodes = {
											{ n = G.UIT.T, config = { text = "???", colour = G.C.BLACK, scale = 0.2, align = "m" }, },
										}
									},
								}
							}
						}
					},
				}
			},
			{
				n = G.UIT.R,
				config = { minw = 1, minh = 1, padding = 0.05, align = "tm", colour = G.C.CLEAR },
				nodes = {
					{
						n = G.UIT.C,
						config = { minw = 3, minh = 1, align = "tm", padding = 0.1, colour = G.C.CLEAR },
						nodes = {
							{
								n = G.UIT.R,
								config = { minw = 1, minh = 1, align = "tm", padding = 0.1, colour = G.C.CLEAR },
								nodes = {
									{ n = G.UIT.T, config = { text = "Gameplay Options", colour = G.C.EDITION, scale = 0.6, align = "m" }, },
								}
							},
							{
								n = G.UIT.R,
								config = { minw = 1, minh = 1, align = "tm", padding = 0.1, colour = G.C.CLEAR },
								nodes = {
									-- create_toggle({
									-- 	active_colour = G.C.RED,
									-- 	label = "Lankyboxn't",
									-- 	ref_table = ocstobal.configbs,
									-- 	ref_value = 'fuck_you_lankybox',
									-- }), --UNUSED AS THE BLINDS ARENT IN THE MOD RIGHT NOW
									{
										n = G.UIT.R,
										config = { minw = 1, minh = 1, align = "tm", padding = 0.1, colour = G.C.CLEAR },
										nodes = {
											create_toggle({
												active_colour = G.C.BLUE,
												label = "Less Bullshit",
												ref_table = ocstobal.configbs,
												ref_value = 'easier_cplusplus',
											}),
										}
									}
								}
							},
						}
					}
				}
			}
		}
	}
end

SMODS.current_mod.extra_tabs = function()
	return {
		{
			label = 'Credits',
			tab_definition_function = function()
				return {
					n = G.UIT.ROOT,
					config = {
						minw = 8, minh = 6, colour = G.C.BLACK, padding = 0.05, align = 'tm', r = 0.1
					},
					nodes = {
						{
							n = G.UIT.R,
							config = { minw = 3, minh = 1, colour = G.C.CLEAR, padding = 0.01, align = 'tm' },
							nodes = {
								{ n = G.UIT.T, config = { text = 'Credits', colour = G.C.DARK_EDITION, scale = 1 } },
							}
						},
						{
							n = G.UIT.R,
							config = { minw = 3, minh = 1, colour = G.C.CLEAR, padding = 0.01, align = 'tm' },
							nodes = {
								{ n = G.UIT.T, config = { text = 'Artwork Credits to', colour = G.C.WHITE, scale = 0.6 } },
							}
						},
						{
							n = G.UIT.R,
							config = { minw = 3, minh = 1, colour = G.C.CLEAR, padding = 0.01, align = 'tm' },
							nodes = {
								{ n = G.UIT.T, config = { text = 'Astro (@silly_goober_0nthewall), For drawing Crystal', colour = G.C.DARK_EDITION, scale = 0.6 } }
							}
						}
					}
				}
			end,
		}
	}
end


if ocstobal.configbs.no_ocs == true then
	return nil
end
