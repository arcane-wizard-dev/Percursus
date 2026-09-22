local addonName, PER = ...

-- Library
local AWL = ArcaneWizardLibrary
local Addon = AWL:GetAddon(addonName)

-- Localization
local L = PER.Localization

-- Current module
local Utils = PER.Modules.Utils

-----------------------
--- Local Functions ---
-----------------------

local function PrintChatMessage(color, prefix, msg)
	DEFAULT_CHAT_FRAME:AddMessage(color:WrapTextInColorCode(prefix .. ": ") .. tostring(msg))
end

------------------------
--- Module Functions ---
------------------------

function Utils:PrintMessage(msg)
	PrintChatMessage(NORMAL_FONT_COLOR, addonName, msg)
end

function Utils:PrintDebug(msg)
	if PER.Settings.general["debug-mode"] then
		PrintChatMessage(ORANGE_FONT_COLOR, addonName .. " (Debug)", msg)
	end
end

function Utils:OpenSettings()
	if not Addon:OpenCategory() then
		self:PrintDebug("In combat. The options menu cannot be opened.")
		return false
	end

	return true
end

function Utils:InitializeDatabase()
	local dbInit = Addon:InitializeOptions({
		databaseName = "Percursus_Options_v4",
		defaults = PER.OPTIONS_DEFAULTS,
		onOpenSettings = function()
			return self:OpenSettings()
		end
	})

	if not dbInit then
		return nil
	end

	PER.Settings.global = dbInit.global
	PER.Settings.general = dbInit.settings["general"]
	PER.Settings.raceTimeOverview = dbInit.settings["race-time-overview"]
	PER.Settings.raceTracker = dbInit.settings["race-tracker"]

	return dbInit
end

function Utils:InitializeMinimapButton()
	self.minimapButton = Addon:RegisterMinimapButton({
		db = PER.Settings.general["minimap-button"],
		tooltip = L["minimap-button.tooltip"]
	})
end
