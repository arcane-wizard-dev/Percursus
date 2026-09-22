local addonName, PER = ...

-- Library
local AWL = ArcaneWizardLibrary
local Addon = AWL:GetAddon(addonName)

-- Localization
local L = PER.Localization

-- Current module
local Options = PER.Modules.Options

-- Module imports
local Utils = PER.Modules.Utils

-- Variables
local defaults = PER.OPTIONS_DEFAULTS
local minimapButtonProxy = setmetatable({}, {
	__index = function(_, key)
		if key == "hide" then
			return not PER.Settings.general["minimap-button"]["hide"]
		end
	end,
	__newindex = function(_, key, value)
		if key ~= "hide" then
			return
		end

		PER.Settings.general["minimap-button"]["hide"] = not value

		if value then
			Utils.minimapButton:Show(addonName)
		else
			Utils.minimapButton:Hide(addonName)
		end
	end,
})

-----------------------
--- Local Functions ---
-----------------------

local function GetVal(setting) return setting:GetValue() end

------------------------
--- Module Functions ---
------------------------

function Options:Initialize()
	local category, layout = Settings.RegisterVerticalLayoutCategory(addonName)

	layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(L["options.general"]))

	-- Minimap Button
	AWL.Settings:AddCheckbox(category, {
		variableTable	= minimapButtonProxy,
		settingKey		= addonName .. "_hide",
		variableName	= "hide",
		name			= L["options.general.minimap-button.name"],
		tooltip			= L["options.general.minimap-button.tooltip"],
		default			= not defaults.general["minimap-button"].hide
	})

	-- Debug Mode
	AWL.Settings:AddCheckbox(category, {
		variableTable	= PER.Settings.general,
		settingKey		= addonName .. "_debug-mode",
		variableName	= "debug-mode",
		name			= L["options.general.debug-mode.name"],
		tooltip			= L["options.general.debug-mode.tooltip"],
		default			= defaults["general"]["debug-mode"]
	})

	layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(L["options.race-tracker"]))

	-- Race Tracker: Active
	AWL.Settings:AddCheckbox(category, {
		variableTable	= PER.Settings.raceTracker,
		settingKey		= addonName .. "_race-tracker-active",
		variableName	= "active",
		name			= L["options.race-tracker.active.name"],
		tooltip			= L["options.race-tracker.active.tooltip"],
		default			= defaults["race-tracker"]["active"]
	})

	-- Mode
	AWL.Settings:AddDropdown(category, {
		variableTable	= PER.Settings.raceTracker,
		settingKey		= addonName .. "_mode",
		variableName	= "mode",
		name			= L["options.race-tracker.mode.name"],
		tooltip			= L["options.race-tracker.mode.tooltip"],
		default			= defaults["race-tracker"]["mode"],
		options			= {
			{ value = 0, label = L["options.race-tracker.mode.value.0"] },
			{ value = 1, label = L["options.race-tracker.mode.value.1"] },
			{ value = 2, label = L["options.race-tracker.mode.value.2"] }
		}
	})

	-- Background Type
	AWL.Settings:AddDropdown(category, {
		variableTable	= PER.Settings.raceTracker,
		settingKey		= addonName .. "_background-type",
		variableName	= "background-type",
		name			= L["options.race-tracker.background-type.name"],
		tooltip			= L["options.race-tracker.background-type.tooltip"],
		default			= defaults["race-tracker"]["background-type"],
		options			= {
			{ value = 0, label = L["options.race-tracker.background-type.value.0"] },
			{ value = 1, label = L["options.race-tracker.background-type.value.1"] },
			{ value = 2, label = L["options.race-tracker.background-type.value.2"] },
			{ value = 3, label = L["options.race-tracker.background-type.value.3"] },
			{ value = 4, label = L["options.race-tracker.background-type.value.4"] },
			{ value = 7, label = L["options.race-tracker.background-type.value.7"] },
			{ value = 5, label = L["options.race-tracker.background-type.value.5"] },
			{ value = 6, label = L["options.race-tracker.background-type.value.6"] },
			{ value = 9, label = L["options.race-tracker.background-type.value.9"] },
			{ value = 8, label = L["options.race-tracker.background-type.value.8"] }
		}
	})

	-- Horizontal Shift
	AWL.Settings:AddSlider(category, {
		variableTable	= PER.Settings.raceTracker,
		settingKey		= addonName .. "_horizontal-shift",
		variableName	= "horizontal-shift",
		name			= L["options.race-tracker.horizontal-shift.name"],
		tooltip			= L["options.race-tracker.horizontal-shift.tooltip"],
		default			= defaults["race-tracker"]["horizontal-shift"], minValue = -500, maxValue = 500, step = 10,
		formatter		= function(value) return value end,
	})

	-- Vertical Shift
	AWL.Settings:AddSlider(category, {
		variableTable	= PER.Settings.raceTracker,
		settingKey		= addonName .. "_vertical-shift",
		variableName	= "vertical-shift",
		name			= L["options.race-tracker.vertical-shift.name"],
		tooltip			= L["options.race-tracker.vertical-shift.tooltip"],
		default			= defaults["race-tracker"]["vertical-shift"], minValue = -400, maxValue = 400, step = 10,
		formatter		= function(value) return value end,
	})

	-- Hide Area Names
	AWL.Settings:AddCheckbox(category, {
		variableTable	= PER.Settings.raceTracker,
		settingKey		= addonName .. "_hide-area-names",
		variableName	= "hide-area-names",
		name			= L["options.race-tracker.hide-area-names.name"],
		tooltip			= L["options.race-tracker.hide-area-names.tooltip"],
		default			= defaults["race-tracker"]["hide-area-names"]
	})

	-- Result Display
	AWL.Settings:AddCheckboxSliderCombo(category, layout, {
		variableTable			= PER.Settings.raceTracker,
		checkboxSettingKey		= addonName .. "_result-display",
		checkboxVariableName	= "result-display",
		checkboxName			= L["options.race-tracker.result-display.name"],
		checkboxTooltip			= L["options.race-tracker.result-display.tooltip"],
		checkboxDefault			= defaults["race-tracker"]["result-display"],

		sliderSettingKey		= addonName .. "_fadeout-delay",
		sliderVariableName		= "fadeout-delay",
		sliderName				= L["options.race-tracker.fadeout-delay.name"],
		sliderTooltip			= L["options.race-tracker.fadeout-delay.tooltip"],
		sliderDefault			= defaults["race-tracker"]["fadeout-delay"], sliderMin = 1, sliderMax = 10, sliderStep = 1,
		sliderFormatter			= function(value) return value .. " " .. L["race.seconds-short"] end
	})

	-- Speed Display (Parent for the next two sliders)
	local initializerSpeed, settingSpeed = AWL.Settings:AddCheckbox(category, {
		variableTable	= PER.Settings.raceTracker,
		settingKey		= addonName .. "_speed-display",
		variableName	= "speed-display",
		name			= L["options.race-tracker.speed-display.name"],
		tooltip			= L["options.race-tracker.speed-display.tooltip"],
		default			= defaults["race-tracker"]["speed-display"]
	})

	-- Speed Display: Horizontal Shift
	AWL.Settings:AddSlider(category, {
		variableTable	= PER.Settings.raceTracker,
		settingKey		= addonName .. "_speed-display-horizontal-shift",
		variableName	= "speed-display-horizontal-shift",
		name			= L["options.race-tracker.speed-display-horizontal-shift.name"],
		tooltip			= L["options.race-tracker.speed-display-horizontal-shift.tooltip"],
		default			= defaults["race-tracker"]["speed-display-horizontal-shift"], minValue = -500, maxValue = 500, step = 10,
		formatter		= function(value) return value end,
		parentInit		= initializerSpeed,
		parentCondition	= function() return GetVal(settingSpeed) end
	})

	-- Speed Display: Vertical Shift
	AWL.Settings:AddSlider(category, {
		variableTable	= PER.Settings.raceTracker,
		settingKey		= addonName .. "_speed-display-vertical-shift",
		variableName	= "speed-display-vertical-shift",
		name			= L["options.race-tracker.speed-display-vertical-shift.name"],
		tooltip			= L["options.race-tracker.speed-display-vertical-shift.tooltip"],
		default			= defaults["race-tracker"]["speed-display-vertical-shift"], minValue = -400, maxValue = 400, step = 10,
		formatter		= function(value) return value end,
		parentInit		= initializerSpeed,
		parentCondition	= function() return GetVal(settingSpeed) end
	})

	layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(L["options.race-time-overview"]))

	-- Race Time Overview: Active
	AWL.Settings:AddCheckbox(category, {
		variableTable	= PER.Settings.raceTimeOverview,
		settingKey		= addonName .. "_race-time-overview-active",
		variableName	= "active",
		name			= L["options.race-time-overview.active.name"],
		tooltip			= L["options.race-time-overview.active.tooltip"],
		default			= defaults["race-time-overview"]["active"]
	})

	-- Profiles Section
	AWL.Settings:AddProfilesSection(layout, {
		useAccountProfile			= Addon:IsAccountProfile(),
		onSwitchProfile				= function()
			Addon:ToggleProfileMode()
			ReloadUI()
		end,
		onDeleteCharacterProfiles	= function()
			Addon:ResetAllCharacterProfiles()
			ReloadUI()
		end
	})

	-- About Section
	AWL.Settings:AddAboutSection(layout, addonName, PER.CHANGELOG)

	Settings.RegisterAddOnCategory(category)

	Addon:SetMainCategoryId(category:GetID())
end
