-- Synthetic SavedVariables: previous addon version with the current database schema; fill defaults and remove obsolete options.
-- No real player data. Version "test" is the version supplied by the test harness.

Percursus_Options_v4 = {
	["account"] = {
		["general"] = {
			["debug-mode"] = "obsolete-type",
			["minimap-button"] = {
				["hide"] = false,
				["minimapPos"] = 90,
				["obsolete"] = true,
			},
		},
		["obsolete-section"] = {
			["enabled"] = true,
		},
		["race-time-overview"] = {
			["active"] = false,
			["obsolete-option"] = 1,
		},
		["race-tracker"] = {
			["active"] = true,
			["horizontal-shift"] = 0,
			["obsolete-option"] = 1,
			["speed-display"] = true,
			["vertical-shift"] = 175,
		},
	},
	["global"] = {
		["obsolete"] = true,
		["version"] = "fixture-previous",
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
				["debug-mode"] = "obsolete-type",
				["minimap-button"] = {
					["hide"] = true,
					["minimapPos"] = 0,
					["obsolete"] = true,
				},
			},
			["obsolete-section"] = {
				["enabled"] = true,
			},
			["race-time-overview"] = {
				["active"] = false,
				["obsolete-option"] = 1,
			},
			["race-tracker"] = {
				["active"] = true,
				["horizontal-shift"] = 0,
				["obsolete-option"] = 1,
				["speed-display"] = true,
				["vertical-shift"] = 175,
			},
		},
		["Player-TEST-OFFLINE"] = {
			["general"] = {
				["debug-mode"] = "obsolete-type",
				["minimap-button"] = {
					["hide"] = false,
					["minimapPos"] = 270,
					["obsolete"] = true,
				},
			},
			["obsolete-section"] = {
				["enabled"] = true,
			},
			["race-time-overview"] = {
				["active"] = false,
				["obsolete-option"] = 1,
			},
			["race-tracker"] = {
				["active"] = true,
				["horizontal-shift"] = 0,
				["obsolete-option"] = 1,
				["speed-display"] = true,
				["vertical-shift"] = 175,
			},
		},
	},
}
