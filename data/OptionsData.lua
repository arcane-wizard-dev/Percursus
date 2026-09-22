local _, PER = ...

-- Complete defaults for every supported WoW variant.
PER.OPTIONS_DEFAULTS = {
	["general"] = {
		["minimap-button"] = {
			["hide"] = false,
			["minimapPos"] = 225,
			["lock"] = false,
			["showInCompartment"] = false
		},
		["debug-mode"] = false,
	},
	["race-time-overview"] = {
		["active"] = true,
	},
	["race-tracker"] = {
		["active"] = true,
		["mode"] = 0,
		["background-type"] = 0,
		["horizontal-shift"] = 0,
		["vertical-shift"] = 200,
		["hide-area-names"] = false,
		["result-display"] = false,
		["fadeout-delay"] = 3,
		["speed-display"] = false,
		["speed-display-horizontal-shift"] = 0,
		["speed-display-vertical-shift"] = -100,
	},
}
