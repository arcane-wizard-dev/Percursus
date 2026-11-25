local _, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

PER.OPTIONS_DEFAULTS = {
	["general"] = {
		["minimap-button"] = {
			["hide"] = false,
			["minimapPos"] = 225,
			["lock"] = false,
			["showInCompartment"] = false
		},
		["debug-mode"] = false,
		["debug-level"] = "basic",
	},
	["race-time-overview"] = {
		["active"] = true,
		["table-zone"] = {
			["show-separators"] = true,
			["time-filter"] = "all",
		},
		["table-all"] = {
			["show-separators"] = true,
			["time-filter"] = "all",
		},
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
	},
	["speedometer"] = {
		["visibility"] = "off",
		["show-value"] = false,
		["horizontal-shift"] = 0,
		["vertical-shift"] = -100,
	},
}
