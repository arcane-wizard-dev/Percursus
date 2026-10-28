local _, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

PER.Localization = setmetatable({}, {
	__index=function(self, key)
		rawset(self, key, key)

		geterrorhandler()("Percursus (Debug): Missing entry for '" .. tostring(key) .. "'")

		return key
	end
})

local L = PER.Localization

-- Options

L["options.general"] = "General Options"
L["options.general.minimap-button.name"] = "Minimap Button"
L["options.general.minimap-button.tooltip"] = "Shows the minimap button."
L["options.general.debug-mode.name"] = "Debug Mode"
L["options.general.debug-mode.tooltip"] = "Displays additional debug information in the chat."

L["options.race-time-overview"] = "Race Time Overview"
L["options.race-time-overview.active.name"] = "Enable Race Time Overview"
L["options.race-time-overview.active.tooltip"] = "Enables the Race Time Overview next to the quest window."

L["options.race-tracker"] = "Race Tracker"
L["options.race-tracker.active.name"] = "Enable Race Tracker"
L["options.race-tracker.active.tooltip"] = "Enables the Race Tracker during a race."
L["options.race-tracker.mode.name"] = "Mode"
L["options.race-tracker.mode.tooltip"] = "Sets how the time is displayed during a race.\n\n|cnHIGHLIGHT_FONT_COLOR:Timer:|r Counts the race time up from zero.\n\n|cnHIGHLIGHT_FONT_COLOR:Countdown - Medal Time:|r Counts down to the gold time and then to the silver time.\n\n|cnHIGHLIGHT_FONT_COLOR:Countdown - Personal Best Time:|r Counts down to the personal best time. Without a personal best, the race time counts up."
L["options.race-tracker.mode.value.0"] = "Timer"
L["options.race-tracker.mode.value.1"] = "Countdown - Medal Time"
L["options.race-tracker.mode.value.2"] = "Countdown - Personal Best Time"
L["options.race-tracker.background-type.name"] = "Background"
L["options.race-tracker.background-type.tooltip"] = "Sets which background is used for the Race Tracker."
L["options.race-tracker.background-type.value.0"] = "None"
L["options.race-tracker.background-type.value.1"] = "Percursus (Classic)"
L["options.race-tracker.background-type.value.2"] = "Alliance"
L["options.race-tracker.background-type.value.3"] = "Horde"
L["options.race-tracker.background-type.value.4"] = "Evergreen"
L["options.race-tracker.background-type.value.5"] = "Dragonflight"
L["options.race-tracker.background-type.value.6"] = "The War Within"
L["options.race-tracker.background-type.value.7"] = "Legion"
L["options.race-tracker.background-type.value.8"] = "N'Zoth"
L["options.race-tracker.background-type.value.9"] = "Midnight"
L["options.race-tracker.horizontal-shift.name"] = "Horizontal Shift"
L["options.race-tracker.horizontal-shift.tooltip"] = "Sets the horizontal position of the Race Tracker relative to the center of the screen."
L["options.race-tracker.vertical-shift.name"] = "Vertical Shift"
L["options.race-tracker.vertical-shift.tooltip"] = "Sets the vertical position of the Race Tracker relative to the center of the screen."
L["options.race-tracker.result-display.name"] = "Show Race Result"
L["options.race-tracker.result-display.tooltip"] = "Keeps the Race Tracker visible after a race to show the result."
L["options.race-tracker.fadeout-delay.name"] = "Fade-Out Delay"
L["options.race-tracker.fadeout-delay.tooltip"] = "Sets the time after a race until the Race Tracker is hidden."
L["options.race-tracker.hide-area-names.name"] = "Hide Area Names"
L["options.race-tracker.hide-area-names.tooltip"] = "Hides area names during a race."
L["options.race-tracker.speed-display.name"] = "Show Race Speed"
L["options.race-tracker.speed-display.tooltip"] = "Shows the race speed during a race. This display only works in Skyriding races."
L["options.race-tracker.speed-display-horizontal-shift.name"] = "Horizontal Shift"
L["options.race-tracker.speed-display-horizontal-shift.tooltip"] = "Sets the horizontal position of the race speed display relative to the center of the screen."
L["options.race-tracker.speed-display-vertical-shift.name"] = "Vertical Shift"
L["options.race-tracker.speed-display-vertical-shift.tooltip"] = "Sets the vertical position of the race speed display relative to the center of the screen."

-- General

L["minimap-button.tooltip"] = "|cnLINK_FONT_COLOR:Left-click|r to open the All Races Overview.\n|cnLINK_FONT_COLOR:Right-click|r to open the options."

L["race.seconds-short"] = "sec"
L["race.decimal-separator"] = "."

-- Race Tracker

L["race.time"] = "Time: %.1f seconds"
L["race.gold-time"] = "|T616373:0|t Gold Time: %s sec"
L["race.silver-time"] = "|T616375:0|t Silver Time: %s sec"
L["race.bronze-time"] = "|T616372:0|t Bronze Time"
L["race.no-time"] = "No Medal Time Available"


L["race.personal-best-time"] = "Personal Best Time: %s sec"
L["race.personal-best-time-no-race"] = "No Race Completed So Far"
L["race.personal-best-time-not-available"] = "Personal Best Time Not Available"
L["race.personal-best-time-failed"] = "New Personal Best Time Failed"

-- Race Time Overview

L["race.title.all-overview"] = "Azeroth"

L["race.tab.race"] = "Current Race"
L["race.tab.zone"] = "Zone"

L["race.button.close"] = "Close"
L["race.button.all-overview"] = "All Races"

L["race.menu.more"] = "More"
L["race.menu.show-separators"] = "Show Separators"
L["race.expand-all"] = "Expand All"
L["race.collapse-all"] = "Collapse All"

L["race.filter.all"] = "Show All"
L["race.filter.no-gold"] = "No Gold Time"
L["race.filter.no-time"] = "No Recorded Time"

L["race.name-unavailable"] = "Race %s"
L["race.zone-unavailable"] = "Region %s"
L["race.other-regions"] = "Other Regions"

L["race.column.race-mode"] = "Race / Mode"
L["race.column.best-time"] = "Best Time"
L["race.column.gold"] = "Gold"
L["race.column.silver"] = "Silver"

L["race.type-normal"] = "Normal"
L["race.type-advanced"] = "Advanced"
L["race.type-reverse"] = "Reverse"
L["race.type-challenge"] = "Challenge"
L["race.type-challenge-reverse"] = "Reverse Challenge"
L["race.type-storm-gryphon"] = "Storm Gryphon"
