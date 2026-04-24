local na = "{C:red}No Effect{}"

return {
	descriptions = {
		Back = {
		},
		Blind = {
		},
		Edition = {
		},
		Enhanced = {
		},
		Joker = {
			j_iso_iso = {
				name = {
					"{C:iso_light_purple}Isotypical{}"
				},
				text = {
					"Back to the drawing board!",
					na
				}
			},
			j_iso_astro_s = {
				name = {
					"Astro"
				},
				text = {
					na
				}
			},
			j_iso_astro_n = {
				name = {
					"Astro Novalite",
				},
				text = {
					na
				}
			},
			j_iso_seraph = {
				name = {
					"Seraph V.Gloom"
				},
				text = {
					na
				}
			},
			j_iso_maxie = { -- Original Character by Maxie
				name = {
					"Maxie"
				},
				text = {
					"Redeeming {C:attention}Vouchers{} reduces all",
					"shop item Costs by {C:attention}-1{}",
					"{C:inactive}Ignores Blank Voucher{}"
				}
			},
			j_iso_oxidyze = { -- LMAOOOOOOOOOOOOOOOO
				name = {
					"Oxidyze",
					"{s:0.7,C:red}The Most Bullied OC out there{}"
				},
				text = {
					"Copies the ability of {C:attention}Jokers{}",
					"to the {C:attention}Left{} and {C:attention}Right{} of this Joker"
				}
			},
			j_iso_oxy = { -- Original Character by ocksie
				name = {
					"{C:pastel_yellow}O{}{C:pink}x{}y"
				},
				text = { 
					"Retriggers {C:attention}Steel Cards{} #1# Times",
					"Scoring Steel Card adds {C:attention}+1{} Retrigger",
				}
			},
			j_iso_a_certain_oxidyze = { -- Deal +65% Damage to < Fragile Bunnies >
				name = {
					"The Crimson Teardrop",
					"{s:0.7}Oxidyze{}"
				},
				text = {
					na,
					"{C:inactive}\"The Smoke was Blue...\"{}",
				}
			},
			j_iso_recluse = {
				name = {
					"Living Malice - Recluse"
				},
				text = {
					na
				}
			},
			j_iso_prescript = {
				name = {
					"{C:iso_index_blue}The Index{}",
					"{s:0.9}Prescripts{}"
				},
				text = {
					{
						"Complete a random {C:iso_index_blue}Prescript{} at",
						"the {C:attention}Start of an Ante{}",
						"At the {C:attention}End of an Ante{},",
						"Gains {X:default,C:white}X0.1{} Blind Requirement for",
						"every failed {C:iso_index_blue}Prescript{}",
						"Gains either {C:blue}+Chips{}, {C:red}+Mult{}, {X:blue,C:white}XChips{}, or {X:red,C:white}XMult{}",
						"for every cleared {C:iso_index_blue}Prescript{}"
					},
					{
						"Current Prescripts",
						"#6#",
						"#7#", --ARAYA SHUT UP
						"#8#",
						"{X:default,C:white}X#1#{} Blind Req., {C:blue}+#2#{} Chips, {C:red}+#3#{} Mult,",
						"{X:blue,C:white}X#4#{} Chips, {X:red,C:white}X#5#{} Mult"
					}
				}
			},
			j_iso_dogman = {
				name = {
					"Dog Man"
				},
				text = {
					na
				}
			},
			j_iso_crystal = {
				name = {
					"Crystal Saphe"
				},
				text = {
					"Create a {C:iso_dark_purple}Phantom{} Copy",
					"of a random Joker"
				}
			},
			j_iso_rien = {
				name = {
					"The Oracle's Proxy",
					"{C:iso_index_blue,s:0.7}Rien{}"
				},
				text = {
					"Hermes must REALLY like Roland."
				}
			}
		},
		Other = {
		},
		Planet = {},
		Spectral = {},
		Stake = {
		},
		Tag = {
			tag_iso_junktag = {
				name = "Junk Tag",
				text = {
					"Gives a free",
					"{C:attention}Junkyard Pack Beta{}"
				}
			},
			tag_iso_terminus_tag = {
				name = "Terminus Tag",
				text = {
					"Shop has a {C:red}full price{}",
					"{C:iso_terminus_global}Terminus Joker{}",
					"{C:inactive,s:0.7}Tag bloat???{}"
				}
			},
			tag_iso_every_fucking_pack = {
				name = "Every Fucking Pack In The Mod",
				text = {
					"Gives {C:attention}every{} Isotypical's Junkyard",
					"{C:attention}Booster Pack{}"
				}
			}, --may not be used ever
			tag_iso_exrare_tag = {
				name = "Ex. Rare Tag",
				text = {
					"Shop has an",
					"{C:iso_exrare}Ex. Rare{} Joker",
				}
			},
			tag_iso_legend_tag = {
				name = "Legendary Tag",
				text = {
					"Shop has a",
					"{C:legendary}Legendary{} Joker",
				}
			},
		},
		Tarot = {},
		Voucher = {},
	},
	misc = {
		achievement_descriptions = {},
		achievement_names = {},
		blind_states = {},
		challenge_names = {
		},
		collabs = {},
		dictionary = {

			k_iso_Aleph_cards = "Aleph Cards",
			k_iso_Aleph = "Aleph",
			k_iso_omega = "Omega",
			k_iso_apoc = "Apocryphal",
			k_iso_terminus = "Terminus",
			
		},
		high_scores = {},
		labels = {

			iso_deceptionlegendary = 'Oxidyze\'s Legendary',
			iso_Aleph = "Aleph",
			iso_omega = "Omega",
			iso_apoc = "Apocryphal",
			iso_terminus = "Terminus",

		},
		poker_hand_descriptions = {},
		poker_hands = {},
		quips = {

			--Reclusive Vessel
			iso_sphrecl_loss_1 = { "Fucking...", "{C:red,s:1.5}HOW.{}" },
			iso_sphrecl_loss_2 = { "HOW DID YOU EVEN {C:red}DIE???{}" },
			iso_sphrecl_loss_3 = { "Recluse is right,", "You {C:red}DO{} have a {C:red}skill issue!{}" },
			iso_sphrecl_loss_4 = { "I gave you {C:red}so much power,{}", "Just to watch you fail horribly.", "{C:iso_dark_purple}You disappoint me, a lot.{}" },

			--Seraph V.Glm
			iso_sph_wins_1 = { "Could have won faster with me." },
			iso_sph_wins_2 = { "Pff, you can do better than that." },
			iso_sph_wins_3 = { "Nice, I guess." },
			iso_sph_wins_4 = { "Neat, you won." },

			iso_sph_losses_1 = { "Get good, lmao." },
			iso_sph_losses_2 = { "Amazing loss, buddy!" },
			iso_sph_losses_3 = { "WOWWW. Skill issue." },
			iso_sph_losses_4 = { "Could have won if you got me." },

			--Sparky Elle
			iso_spk_wins_1 = { "WE WON?!!" },
			iso_spk_wins_2 = { "YIPEE!!!" },
			iso_spk_wins_3 = { "YAYY!!! WE WON!!!" },

			iso_spk_losses_1 = { "I-I... huh..?!" },
			iso_spk_losses_2 = { "O-oh... I guess next time...", },
			iso_spk_losses_3 = { "A-aw..." },

			--Solinium Isotope
			iso_sol_wins_1 = { "Congrats on winning!" },
			iso_sol_wins_2 = { "Niceee! Keep it up!" },
			iso_sol_wins_3 = { "A successful experiment, if I were to say!" },

			iso_sol_losses_1 = { "...oh." },
			iso_sol_losses_2 = { "IT'S GONE WRONG!!!" },
			iso_sol_losses_3 = { "Yikes, YIKES!" },

			--fuck you recluse
			iso_recl_wins_1 = { "damn, was hoping you'd lose." },

			iso_recl_losses_1 = { "git gud lmao" },
			iso_recl_losses_2 = { "skill issue" },
			iso_recl_losses_3 = { "L" },

			--ocksie- i mean Oxidyze
			iso_oxi_wins_1 = { "Not bad, not bad." },
			iso_oxi_wins_2 = { "Nicely done. Almost perfect, even." },
			iso_oxi_wins_3 = { "Yet another win to the player." },

			iso_oxi_losses_1 = { "..." },
			iso_oxi_losses_2 = { "...how?" },
			iso_oxi_losses_3 = { "This isn't ideal." }

		},
		ranks = {},
		suits_plural = {},
		suits_singular = {},
		tutorial = {},
		v_dictionary = {
		},
		v_text = {},

	}
}
