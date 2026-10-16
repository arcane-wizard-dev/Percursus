-- Synthetic SavedVariables: account, current and offline character profiles; preserve false and zero.
-- No real player data. Version "test" is the version supplied by the test harness.

Percursus_Options_v4 = {
	["account"] = {
		["general"] = {
			["debug-mode"] = false,
			["minimap-button"] = {
				["hide"] = false,
				["lock"] = false,
				["minimapPos"] = 90,
				["showInCompartment"] = false,
			},
		},
		["race-time-overview"] = {
			["active"] = false,
		},
		["race-tracker"] = {
			["active"] = true,
			["background-type"] = 0,
			["fadeout-delay"] = 3,
			["hide-area-names"] = false,
			["horizontal-shift"] = 0,
			["mode"] = 0,
			["result-display"] = false,
			["speed-display"] = true,
			["speed-display-horizontal-shift"] = 0,
			["speed-display-vertical-shift"] = -100,
			["vertical-shift"] = 175,
		},
	},
	["global"] = {
		["version"] = "test",
	},
	["profileKeys"] = {
		["Player-TEST-CURRENT"] = {
			["open-settings"] = false,
			["use-account"] = false,
		},
		["Player-TEST-OFFLINE"] = {
			["open-settings"] = false,
			["use-account"] = true,
		},
	},
	["profiles"] = {
		["Player-TEST-CURRENT"] = {
			["general"] = {
				["debug-mode"] = false,
				["minimap-button"] = {
					["hide"] = true,
					["lock"] = false,
					["minimapPos"] = 0,
					["showInCompartment"] = false,
				},
			},
			["race-time-overview"] = {
				["active"] = false,
			},
			["race-tracker"] = {
				["active"] = true,
				["background-type"] = 0,
				["fadeout-delay"] = 3,
				["hide-area-names"] = false,
				["horizontal-shift"] = 0,
				["mode"] = 0,
				["result-display"] = false,
				["speed-display"] = true,
				["speed-display-horizontal-shift"] = 0,
				["speed-display-vertical-shift"] = -100,
				["vertical-shift"] = 175,
			},
		},
		["Player-TEST-OFFLINE"] = {
			["general"] = {
				["debug-mode"] = false,
				["minimap-button"] = {
					["hide"] = false,
					["lock"] = false,
					["minimapPos"] = 270,
					["showInCompartment"] = false,
				},
			},
			["race-time-overview"] = {
				["active"] = false,
			},
			["race-tracker"] = {
				["active"] = true,
				["background-type"] = 0,
				["fadeout-delay"] = 3,
				["hide-area-names"] = false,
				["horizontal-shift"] = 0,
				["mode"] = 0,
				["result-display"] = false,
				["speed-display"] = true,
				["speed-display-horizontal-shift"] = 0,
				["speed-display-vertical-shift"] = -100,
				["vertical-shift"] = 175,
			},
		},
	},
}
