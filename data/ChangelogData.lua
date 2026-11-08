local addonName, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

local version = C_AddOns.GetAddOnMetadata(addonName, "Version") or ""
local buildDate = C_AddOns.GetAddOnMetadata(addonName, "X-BuildDate") or ""

PER.CHANGELOG = {
	notices = {},
	-- BEGIN GENERATED CHANGELOG
	{
		version = version,
		date = buildDate ~= "" and buildDate or nil,
		entries = {
			"Minor code adjustments"
		}
	},
	{
		version = "v2.43",
		date = "2026-11-06",
		entries = {
			"Changed: The Basic debug level now shows important messages, while Advanced also includes technical details",
			"Updated: deDE, enUS, ruRU, zhCN localizations"
		}
	},
	{
		version = "v2.42",
		date = "2026-11-05",
		entries = {
			"Changed: Debug messages are now converted and formatted only when debug mode is enabled",
			"Requires Arcane Wizard: Library revision 4 or later"
		}
	},
	{
		version = "v2.41",
		date = "2026-11-03",
		entries = {
			"Changed: The debug mode option now combines an enable checkbox with a Basic or Advanced level selector",
			"Updated: deDE, enUS, ruRU, zhCN localizations",
			"Requires Arcane Wizard: Library revision 2 or later",
			"Minor code adjustments"
		}
	},
	{
		version = "v2.40",
		date = "2026-11-01",
		entries = {
			"Changed: The TOC now excludes only Talebound by game type"
		}
	},
	{
		version = "v2.39",
		date = "2026-11-01",
		entries = {
			"Changed: Clarified labels and tooltips in the options menu",
			"Changed: Limited loading to Retail",
			"Updated: deDE, enUS, ruRU, zhCN localizations"
		}
	},
	{
		version = "v2.38",
		date = "2026-10-29",
		entries = {
			"Added: TOC version for patch 12.1.7 [retail]",
			"Removed: TOC version for patch 12.1.0 [retail]"
		}
	},
	{
		version = "v2.37",
		date = "2026-10-28",
		entries = {
			"Added: Startup check for the minimum required Library revision",
			"Updated: deDE, enUS, ruRU, zhCN localizations",
			"Updated: Addon description",
			"Fixed: Aborting a race during the countdown no longer causes the speed display to reappear",
			"Adapted to the latest version of Arcane Wizard: Library to ensure full compatibility",
			"Minor code adjustments"
		}
	},
	{
		version = "v2.36",
		date = "2026-10-21",
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
	}
	-- END GENERATED CHANGELOG
}
