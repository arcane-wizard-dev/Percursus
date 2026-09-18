local addonName, PER = ...

-- Library
local AWL = ArcaneWizardLibrary

-- Module imports
local Options = PER.Modules.Options
local RaceTimeOverview = PER.Modules.RaceTimeOverview
local RaceTracker = PER.Modules.RaceTracker
local Utils = PER.Modules.Utils

-- Variables
local isInitialized = false
local raceDataTable = PER.RACE_DATA

local activeTracker = false
local raceQuestID = -1
local raceSpellID = -1
local raceGoldTime = -1
local raceSilverTime = -1
local racePersonalTime = -1

--------------
--- Frames ---
--------------

local PercursusFrame = CreateFrame("Frame", "Percursus")

-----------------------
--- Local Functions ---
-----------------------

local function CheckRaceQuest(questID)
	for _, dataWrapper in pairs(raceDataTable) do
		local _, _, _, modes = unpack(dataWrapper)
		for _, data in pairs(modes) do
			if data[1] == questID then
				return true
			end
		end
	end

	return false
end

local function GetRaceData(questID)
	for _, dataWrapper in pairs(raceDataTable) do
		local _, _, _, modes = unpack(dataWrapper)
		for mode, data in pairs(modes) do
			if data[1] == questID then
				return {
					mode = mode,
					questID = data[1],
					raceTime = data[2],
					spellID = data[3],
					goldTime = data[4],
					silverTime = data[5]
				}
			end
		end
	end

	return nil
end

local function SlashCommand(msg)
	if not isInitialized then return end

	local command = strtrim(msg or "")

	if command == "" then
		Utils:OpenSettings()
	elseif command == "changelog" then
		AWL.Frames:OpenChangelog(addonName, PER.CHANGELOG)
	else
		Utils:PrintDebug("No arguments will be accepted.")
	end
end

------------------------
--- Public Functions ---
------------------------

function PercursusFrame:OnEvent(event, ...)
	self[event](self, event, ...)
end

function PercursusFrame:ADDON_LOADED(_, addOnName)
	if addOnName ~= addonName or isInitialized then return end

	local dbInit = Utils:InitializeDatabase()

	if not dbInit then
		AWL:GetAddon(addonName):AbortInitialization(self)
		return
	end

	Utils:InitializeMinimapButton()
	Options:Initialize()
	RaceTracker:Initialize()
	RaceTimeOverview:Initialize()

	Utils:OpenSettingsOnLoading()

	isInitialized = true

	Utils:PrintDebug(string.format(
		"InitializeDatabase: key=%s, createdProfile=%s, createdProfileKey=%s, activeProfile=%s",
		tostring(dbInit.characterGUID), tostring(dbInit.createdProfile), tostring(dbInit.createdProfileKey), tostring(dbInit.activeProfile)
	))
	Utils:PrintDebug("Addon fully loaded.")
end

function PercursusFrame:QUEST_ACCEPTED(_, questID)
	local result = GetRaceData(questID)

	--Utils:PrintDebug(string.format("questID=%s", tostring(questID)))

	if result ~= nil then
		Utils:PrintDebug(string.format(
			"Event 'QUEST_ACCEPTED' fired. Payload: questID=%s, questName=%s",
			tostring(questID), tostring(C_QuestLog.GetTitleForQuestID(questID))
		))

		if PER.Settings.raceTracker["active"] then
			activeTracker = true
			raceQuestID = result.questID
			raceSpellID = result.spellID
			raceGoldTime = result.goldTime
			raceSilverTime = result.silverTime

			if result.raceTime ~= 0 then
				racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(result.raceTime).quantity / 1000
			end

			if PER.Settings.raceTracker["hide-area-names"] then
				PercursusFrame:RegisterEvent("ZONE_CHANGED")
				PercursusFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
			end

			RaceTracker:Start(raceQuestID, raceSpellID, raceGoldTime, raceSilverTime, racePersonalTime)
		else
			Utils:PrintDebug("No race tracker requested.")
		end
	end
end

function PercursusFrame:QUEST_REMOVED(_, questID)
	if CheckRaceQuest(questID) and activeTracker then
		Utils:PrintDebug(string.format(
			"Event 'QUEST_REMOVED' fired. Payload: questID=%s, questName=%s",
			tostring(questID), tostring(C_QuestLog.GetTitleForQuestID(questID))
		))

		activeTracker = false
		raceQuestID = -1
		raceSpellID = -1
		raceGoldTime = -1
		raceSilverTime = -1
		racePersonalTime = -1

		RaceTracker:Stop()

		if PER.Settings.raceTracker["result-display"] then
			RaceTracker:ShowResultTracker()

			local delay = PER.Settings.raceTracker["fadeout-delay"]

			C_Timer.After(delay, function()
				RaceTracker:HideResultTracker()
			end)
		end

		PercursusFrame:UnregisterEvent("ZONE_CHANGED")
		PercursusFrame:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
	end
end

function PercursusFrame:ZONE_CHANGED()
	Utils:PrintDebug("Event 'ZONE_CHANGED' fired. No payload.")

	ZoneTextFrame:Hide()
	SubZoneTextFrame:Hide()
end

function PercursusFrame:ZONE_CHANGED_NEW_AREA()
	Utils:PrintDebug("Event 'ZONE_CHANGED_NEW_AREA' fired. No payload.")

	ZoneTextFrame:Hide()
	SubZoneTextFrame:Hide()
end

hooksecurefunc(GossipFrame, "HandleShow", function ()
	if not isInitialized then return end

	local unitGUID = UnitGUID("target")

	if unitGUID == nil then
		return
	end

	---@diagnostic disable-next-line: param-type-mismatch
	if issecretvalue(unitGUID) then
		return
	end

	if PER.Settings.raceTimeOverview["active"] then
		local npcID = select(6, strsplit("-", tostring(unitGUID)))
		npcID = tonumber(npcID)

		--Utils:PrintDebug(string.format("npcID=%s", tostring(npcID)))

		if raceDataTable[npcID] ~= nil then
			RaceTimeOverview:ShowRaceOverview(npcID)
		end
	end
end)

hooksecurefunc(GossipFrame, "Hide", function ()
	if not isInitialized then return end

	RaceTimeOverview:HideRaceOverview()
end)

PercursusFrame:RegisterEvent("ADDON_LOADED")
PercursusFrame:RegisterEvent("QUEST_ACCEPTED")
PercursusFrame:RegisterEvent("QUEST_REMOVED")
PercursusFrame:SetScript("OnEvent", PercursusFrame.OnEvent)

SLASH_Percursus1, SLASH_Percursus2 = '/per', '/percursus'

SlashCmdList["Percursus"] = SlashCommand
