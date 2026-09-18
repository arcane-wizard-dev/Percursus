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

function Utils:IsAccountProfile()
	local characterGUID = AWL.Utils:GetCharacterGUID()

	return Percursus_Options_v4.profileKeys[characterGUID]["use-account"]
end

function Utils:OpenSettingsOnLoading()
	local characterGUID = AWL.Utils:GetCharacterGUID()

	if Percursus_Options_v4.profileKeys[characterGUID]["open-settings"] then
		if not self:OpenSettings() then
			return
		end

		Percursus_Options_v4.profileKeys[characterGUID]["open-settings"] = false
	end
end

function Utils:ToggleProfileMode()
	local characterGUID = AWL.Utils:GetCharacterGUID()
	local useAccountProfile = self:IsAccountProfile()

	Percursus_Options_v4.profileKeys[characterGUID]["use-account"] = not useAccountProfile
	Percursus_Options_v4.profileKeys[characterGUID]["open-settings"] = true
end

function Utils:ResetAllCharacterProfiles()
	local characterGUID = AWL.Utils:GetCharacterGUID()

	Percursus_Options_v4.profiles = {}
	Percursus_Options_v4.profileKeys = {}

	Percursus_Options_v4.profileKeys[characterGUID] = {
		["use-account"] = true,
		["open-settings"] = true
	}
end

function Utils:InitializeDatabase()
	local characterGUID = AWL.Utils:GetCharacterGUID()

	if not characterGUID then
		return nil
	end

	local createdProfile = false
	local createdProfileKey = false

	local defaults = {
		["general"] = {
			["minimap-button"] = {
				["hide"] = false
			}
		},
		["race-time-overview"] = {},
		["race-tracker"] = {}
	}

	if not Percursus_Options_v4 then
		Percursus_Options_v4 = {
			["account"] = AWL.Utils:CopyTable(defaults),
			["profiles"] = {},
			["profileKeys"] = {}
		}
	end

	if not Percursus_Options_v4.profiles[characterGUID] then
		Percursus_Options_v4.profiles[characterGUID] = AWL.Utils:CopyTable(defaults)
		createdProfile = true
	end

	if not Percursus_Options_v4.profileKeys[characterGUID] then
		Percursus_Options_v4.profileKeys[characterGUID] = {
			["use-account"] = true,
			["open-settings"] = false
		}
		createdProfileKey = true
	end

	local useAccountProfile = Percursus_Options_v4.profileKeys[characterGUID]["use-account"]

	if useAccountProfile then
		PER.Settings.general = Percursus_Options_v4.account["general"]
		PER.Settings.raceTimeOverview = Percursus_Options_v4.account["race-time-overview"]
		PER.Settings.raceTracker = Percursus_Options_v4.account["race-tracker"]
	else
		PER.Settings.general = Percursus_Options_v4.profiles[characterGUID]["general"]
		PER.Settings.raceTimeOverview = Percursus_Options_v4.profiles[characterGUID]["race-time-overview"]
		PER.Settings.raceTracker = Percursus_Options_v4.profiles[characterGUID]["race-tracker"]
	end

	return {
		characterGUID = characterGUID,
		createdProfile = createdProfile,
		createdProfileKey = createdProfileKey,
		activeProfile = useAccountProfile and "account" or "character"
	}
end

function Utils:InitializeMinimapButton()
	self.minimapButton = Addon:RegisterMinimapButton({
		db = PER.Settings.general["minimap-button"],
		tooltip = L["minimap-button.tooltip"]
	})
end
