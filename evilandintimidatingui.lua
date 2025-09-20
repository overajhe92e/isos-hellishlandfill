-- SMODS.current_mod.config_tab = function()
-- 	return {
-- 		n = G.UIT.ROOT,
-- 		config = { r = .1, minw = 6, minh = 6, align = "tm", padding = 0.3, colour = G.C.BLACK },
-- 		nodes = {
-- 			{
-- 				n = G.UIT.C,
-- 				config = { minw = 1, minh = 1, align = "tl", colour = G.C.CLEAR, padding = 0.15 },
-- 				nodes = {
-- 					UIBox_button({
-- 						label = {
-- 							"Remove ALL OCs"
-- 						},
-- 						ref_table = ocstobal.configbs,
-- 						ref_value = 'no_ocs',
-- 					}),
-- 					create_toggle({
-- 						active_colour = G.C.GREEN,
-- 						label = "Fuck you, Lankybox! (Disables Lankybox Blinds)",
-- 						ref_table = ocstobal.configbs,
-- 						ref_value = 'fuck_you_lankybox',
-- 					}),
-- 					create_toggle({
-- 						active_colour = G.C.GREEN,
-- 						label = "Less Bullshit Mode",
-- 						ref_table = ocstobal.configbs,
-- 						ref_value = 'easier_cplusplus',
-- 					}),
-- 					create_toggle({
-- 						active_colour = G.C.RED,
-- 						label = "Unbalanced Mode",
-- 						ref_table = ocstobal.configbs,
-- 						ref_value = 'unbalanced_mode',
-- 					}),
-- 					create_toggle({
-- 						active_colour = G.C.BLACK,
-- 						label = "Isotypical's Almanac",
-- 						ref_table = ocstobal.configbs,
-- 						ref_value = 'very_unbalanced_mode'
-- 					}),
-- 					{
-- 						n = G.UIT.R,
-- 						config = { minw = 2, minh = 1, colour = G.C.CLEAR, padding = 0.15, align = 'tm' },
-- 						nodes = {
-- 							{ n = G.UIT.T, config = { text = "Close Enough, Welcome back Polterworx / Jen's Almanac", colour = G.C.DEFAULT, scale = 0.3, align = "bl" } }
-- 						}
-- 					},
-- 					{
-- 						n = G.UIT.R,
-- 						config = { minw = 2, minh = 1, colour = G.C.CLEAR, padding = 0.15, align = 'bm' },
-- 						nodes = {
-- 							{ n = G.UIT.T, config = { text = "SOME OF THESE OPTIONS DONT WORK RIGHT NOW, WILL BE FIXED SOON(tm)", colour = G.C.RED, scale = 0.6, align = "bl" } }
-- 						}
-- 					}
-- 				}
-- 			}
-- 		}
-- 	}
--end
--old ui
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
								config = { minh = 1, minw = 2, align = "m", padding = 0.05, colour = G.C.CLEAR },
								nodes = {
									create_toggle({
										active_colour = G.C.RED,
										label = "Unbalanced Mode",
										ref_table = ocstobal.configbs,
										ref_value = 'unbalanced_mode',
									}),
									create_toggle({
										active_colour = G.C.BLUE,
										label = "Isotypical's Almanac",
										ref_table = ocstobal.configbs,
										ref_value = 'very_unbalanced_mode',
									}),
								}
							},
							{
								n = G.UIT.R,
								config = { minh = 1, minw = 1, align = 'tm', padding = 0.05, colour = G.C.CLEAR },
								nodes = {
									{ n = G.UIT.T, config = { text = "ISO'S ALMANAC REQUIRES UNBALANCED MODE", colour = G.C.RED, scale = 0.35, align = "tm" }, }
								}
							},
							{
								n = G.UIT.R,
								config = { minh = 1, minw = 1, align = 'tm', padding = 0.1, colour = G.C.CLEAR },
								nodes = {
								{ n = G.UIT.T, config = { text = "Also, close enough, welcome back Almanac.", colour = G.C.WHITE, scale = 0.35, align = "tm" }, }
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
