local _, PER = ...

PER.Localization = setmetatable({},{
	__index=function(self,key)
		geterrorhandler()("Percursus (Debug): Missing entry for '" .. tostring(key) .. "'")

		return key
	end
})

local L = PER.Localization

-- Options

L["options.general"] = "General Options"
L["options.general.minimap-button.name"] = "Minimap Button"
L["options.general.minimap-button.tooltip"] = "When this is enabled, the minimap button is displayed."
L["options.general.debug-mode.name"] = "Debug Mode"
L["options.general.debug-mode.tooltip"] = "Enabling the debug mode displays additional information in the chat."

L["options.race-time-overview"] = "Race Time Overview"
L["options.race-time-overview.active.name"] = "Enable Race Time Overview"
L["options.race-time-overview.active.tooltip"] = "Enables the Race Time Overview next to the quest window."

L["options.race-tracker"] = "Race Tracker"
L["options.race-tracker.active.name"] = "Enable Race Tracker"
L["options.race-tracker.active.tooltip"] = "Enables the Race Tracker during a race."
L["options.race-tracker.mode.name"] = "Mode"
L["options.race-tracker.mode.tooltip"] = "Defines how the time is to be displayed during a race."
L["options.race-tracker.mode.value.0"] = "Timer"
L["options.race-tracker.mode.value.1"] = "Countdown - Medal Time"
L["options.race-tracker.mode.value.2"] = "Countdown - Personal Best Time"
L["options.race-tracker.background-type.name"] = "Background"
L["options.race-tracker.background-type.tooltip"] = "Determines which background is to be used for the Race Tracker."
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
L["options.race-tracker.horizontal-shift.tooltip"] = "Indicates the relative horizontal position of the Race Tracker to the center of the screen."
L["options.race-tracker.vertical-shift.name"] = "Vertical Shift"
L["options.race-tracker.vertical-shift.tooltip"] = "Indicates the relative vertical position of the Race Tracker to the center of the screen."
L["options.race-tracker.result-display.name"] = "Show Race Result"
L["options.race-tracker.result-display.tooltip"] = "Determines whether the race tracker should continue to be displayed after the race and thus the race result is presented."
L["options.race-tracker.fadeout-delay.name"] = "Fade-out Delay"
L["options.race-tracker.fadeout-delay.tooltip"] = "Determines the time after a race until the Race Tracker is hidden."
L["options.race-tracker.hide-area-names.name"] = "Hide Area Names"
L["options.race-tracker.hide-area-names.tooltip"] = "Determines whether no area names should be displayed during the race."
L["options.race-tracker.speed-display.name"] = "Show Race Speed"
L["options.race-tracker.speed-display.tooltip"] = "Determines whether the race speed should be displayed during the race. This display only works for dragon and skyrider races."
L["options.race-tracker.speed-display-horizontal-shift.name"] = "Horizontal Shift"
L["options.race-tracker.speed-display-horizontal-shift.tooltip"] = "Indicates the relative horizontal position of the race speed display to the center of the screen."
L["options.race-tracker.speed-display-vertical-shift.name"] = "Vertical Shift"
L["options.race-tracker.speed-display-vertical-shift.tooltip"] = "Indicates the relative vertical position of the race speed display to the center of the screen."

-- General

L["minimap-button.tooltip"] = "|cnLINK_FONT_COLOR:Right-click|r to open the options."

-- Chat

-- Race Tracker & Race Time Overview

L["race.time"] = "Time: %.1f Seconds"
L["race.gold-time"] = "|T616373:0|t Gold Time: %s sec"
L["race.silver-time"] = "|T616375:0|t Silver Time: %s sec"
L["race.bronze-time"] = "|T616372:0|t Bronze Time"
L["race.no-time"] = "No Medal Time Available"

L["race.gliding-speed"] = "Current Racing Speed: %s%%"

L["race.seconds-long"] = "Seconds"
L["race.seconds-short"] = "sec"

L["race.button.close"] = "Close"
L["race.button.zone-overview"] = "Zone Overview"

L["race.title.zone-overview"] = "Zone Overview"

L["race.type-normal"] = "Normal"
L["race.type-advanced"] = "Advanced"
L["race.type-reverse"] = "Reverse"
L["race.type-challenge"] = "Challenge"
L["race.type-challenge-reverse"] = "Reverse Challenge"
L["race.type-storm-gryphon"] = "Storm Gryphon"

L["race.personal-best-time"] = "Personal Best Time: %s sec"
L["race.personal-best-time-no-race"] = "No Race Completed So Far"
L["race.personal-best-time-not-available"] = "Personal Best Time Not Available"
L["race.personal-best-time-failed"] = "New Personal Best Time Failed"
