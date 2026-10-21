local addonName, PER = ...

local version = C_AddOns.GetAddOnMetadata(addonName, "Version") or ""
local buildDate = C_AddOns.GetAddOnMetadata(addonName, "X-BuildDate") or ""

PER.CHANGELOG = {
	notices = {},
	{
		version = version,
		date = buildDate ~= "" and buildDate or nil,
		entries = {
			"Added: All Races overview grouped by continent and zone",
			"Changed: Combined Current Race and Zone tabs with medal display",
			"Adapted to the latest version of Arcane Wizard: Library to ensure full compatibility"
		}
	},
	{
		version = "v2.35",
		date = "2026-10-16",
		entries = {
			"Adapted to the latest version of Arcane Wizard: Library to ensure full compatibility"
		}
	},
	{
		version = "v2.34",
		date = "2026-10-14",
		entries = {
			"Fixed: Repeated error messages for missing translations"
		}
	},
	{
		version = "v2.33",
		date = "2026-10-12",
		entries = {
			"Refactoring of the addon structure and source code"
		}
	},
	{
		version = "v2.32",
		date = "2026-10-09",
		entries = {
			"Added: ruRU localization",
			"Minor code adjustments"
		}
	},
	{
		version = "v2.31",
		date = "2026-10-05",
		entries = {
			"Changed: Race and zone overviews now use the native Blizzard UI appearance",
			"Adapted to the latest version of Arcane Wizard: Library to ensure full compatibility"
		}
	},
	{
		version = "v2.30",
		date = "2026-10-03",
		entries = {
			"Updated: Race Tracker background 'Classic'",
			"Updated: Logo"
		}
	},
	{
		version = "v2.29",
		date = "2026-09-27",
		entries = {
			"Minor code adjustments"
		}
	},
	{
		version = "v2.28",
		date = "2026-09-22",
		entries = {
			"Adapted to the latest version of Arcane Wizard: Library to ensure full compatibility",
			"Minor code adjustments"
		}
	},
	{
		version = "v2.27",
		date = "2026-09-18",
		entries = {
			"Changed: Character profiles now use GUIDs",
			"Changed: Addon initialization stops if the player identity is unavailable"
		}
	}
}
