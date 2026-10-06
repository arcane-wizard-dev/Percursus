local _, PER = ...

-- Localization
local L = PER.Localization

-- Module imports
local Utils = PER.Modules.Utils

-- Current module
local RaceTracker = PER.Modules.RaceTracker

-- Variables
local canGlide = false
local raceTicker

--------------
--- Frames ---
--------------

local RaceTrackerFrame
local ResultTrackerFrame
local SpeedDisplayFrame

-----------------------
--- Frame Functions ---
-----------------------

local function ShowRaceTracker(raceQuestID, raceGoldTime, racePersonalTime)
	ResultTrackerFrame:HideFrame()

	RaceTrackerFrame:ClearAllPoints()
	ResultTrackerFrame:ClearAllPoints()
	SpeedDisplayFrame:ClearAllPoints()

	RaceTrackerFrame:SetPoint("CENTER", PER.Settings.raceTracker["horizontal-shift"], PER.Settings.raceTracker["vertical-shift"])
	ResultTrackerFrame:SetPoint("CENTER", PER.Settings.raceTracker["horizontal-shift"], PER.Settings.raceTracker["vertical-shift"])
	SpeedDisplayFrame:SetPoint("CENTER", PER.Settings.raceTracker["speed-display-horizontal-shift"], PER.Settings.raceTracker["speed-display-vertical-shift"])

	if PER.Settings.raceTracker["background-type"] ~= 0 then
		local style = PER.RACE_TRACKER_BACKGROUNDS[PER.Settings.raceTracker["background-type"]]

		RaceTrackerFrame:SetBackground(style)
		ResultTrackerFrame:SetBackground(style)
	else
		RaceTrackerFrame:RemoveBackground()
		ResultTrackerFrame:RemoveBackground()
	end

	RaceTrackerFrame:SetTimerText(C_QuestLog.GetTitleForQuestID(raceQuestID))

	if PER.Settings.raceTracker["mode"] == 0 then
		RaceTrackerFrame:SetInfoText(L["race.gold-time"]:format(raceGoldTime))
	elseif PER.Settings.raceTracker["mode"] == 1 then
		RaceTrackerFrame:SetInfoText(L["race.gold-time"]:format(raceGoldTime))
	elseif PER.Settings.raceTracker["mode"] == 2 then
		if racePersonalTime == -1 then
			RaceTrackerFrame:SetInfoText(L["race.personal-best-time-not-available"])
		elseif racePersonalTime == 0 then
			RaceTrackerFrame:SetInfoText(L["race.personal-best-time-no-race"])
		else
			RaceTrackerFrame:SetInfoText(L["race.personal-best-time"]:format(racePersonalTime))
		end
	end

	C_Timer.After(5, function()
		if PER.Settings.raceTracker["mode"] == 0 or (PER.Settings.raceTracker["mode"] == 2 and racePersonalTime <= 0) then
			RaceTrackerFrame:SetTimerText(string.format(L["race.time"], 0))
		elseif PER.Settings.raceTracker["mode"] == 1 then
			RaceTrackerFrame:SetTimerText(L["race.time"]:format(-raceGoldTime))
		elseif PER.Settings.raceTracker["mode"] == 2 then
			RaceTrackerFrame:SetTimerText(L["race.time"]:format(-racePersonalTime))
		end

		local _, c, _ = C_PlayerInfo.GetGlidingInfo()
		canGlide = c

		if PER.Settings.raceTracker["speed-display"] and canGlide then
			SpeedDisplayFrame:SetSpeedBar(0)
			SpeedDisplayFrame:ShowFrame()
		end
	end)

	RaceTrackerFrame:ShowFrame()
end

local function InitializeFrames ()
	RaceTrackerFrame = CreateFrame("Frame", nil, UIParent, "Percursus_RaceTrackerTemplate")
	ResultTrackerFrame = CreateFrame("Frame", nil, UIParent, "Percursus_RaceTrackerTemplate")
	SpeedDisplayFrame = CreateFrame("Frame", nil, UIParent, "Percursus_RaceTrackerSpeedDisplayTemplate")
end

------------------------
--- Module Functions ---
------------------------

function RaceTracker:Initialize()
	InitializeFrames()
end

function RaceTracker:Start(raceQuestID, raceSpellID, raceGoldTime, raceSilverTime, racePersonalTime)
	local isFirstTry = true
	local isInit = false
	local raceStartTime = -1

	local isCountdown = false
	local isRace = false

	ShowRaceTracker(raceQuestID, raceGoldTime, racePersonalTime)

	raceTicker = C_Timer.NewTicker(0.03, function()
		isCountdown = false
		isRace = false

		local raceAura = C_UnitAuras.GetPlayerAuraBySpellID(369968)
		local countdownAura = C_UnitAuras.GetPlayerAuraBySpellID(raceSpellID)

		if raceAura then
			isRace = true
		end

		if countdownAura then
			isCountdown = true
		end

		if isCountdown and not isFirstTry and not isInit then
			isInit = true
			raceStartTime = -1

			if PER.Settings.raceTracker["mode"] == 0 or (PER.Settings.raceTracker["mode"] == 2 and racePersonalTime <= 0) then
				RaceTrackerFrame:SetTimerText(string.format(L["race.time"], 0))
			elseif PER.Settings.raceTracker["mode"] == 1 then
				RaceTrackerFrame:SetTimerText(L["race.time"]:format(-raceGoldTime))
			elseif PER.Settings.raceTracker["mode"] == 2 then
				RaceTrackerFrame:SetTimerText(L["race.time"]:format(-racePersonalTime))
			end

			Utils:PrintDebug("The race was interrupted.")
		elseif isRace and not isCountdown then
			if PER.Settings.raceTracker["speed-display"] and canGlide then
				local _, _, forwardSpeed = C_PlayerInfo.GetGlidingInfo()
				local speed = 208 * Round(forwardSpeed) / 100

				SpeedDisplayFrame:SetSpeedBar(speed)
			end

			if raceStartTime == -1 then
				isInit = false
				raceStartTime = GetTime()

				if isFirstTry then
					isFirstTry = false
				else
					Utils:PrintDebug("The race was restarted.")
				end
			end

			local elapsedTime = GetTime() - raceStartTime

			if PER.Settings.raceTracker["mode"] == 0 then
				RaceTrackerFrame:SetTimerText(L["race.time"]:format(elapsedTime))

				if elapsedTime <= raceGoldTime then
					RaceTrackerFrame:SetInfoText(L["race.gold-time"]:format(raceGoldTime))
				elseif elapsedTime <= raceSilverTime then
					RaceTrackerFrame:SetInfoText(L["race.silver-time"]:format(raceSilverTime))
				else
					RaceTrackerFrame:SetInfoText(L["race.bronze-time"])
				end
			elseif PER.Settings.raceTracker["mode"] == 1 then
				if elapsedTime <= raceGoldTime then
					local remainingTime = -(raceGoldTime - elapsedTime)
					RaceTrackerFrame:SetTimerText(L["race.time"]:format(remainingTime))
					RaceTrackerFrame:SetInfoText(L["race.gold-time"]:format(raceGoldTime))
				elseif elapsedTime <= raceSilverTime then
					local remainingTime = -(raceSilverTime - elapsedTime)
					RaceTrackerFrame:SetTimerText(L["race.time"]:format(remainingTime))
					RaceTrackerFrame:SetInfoText(L["race.silver-time"]:format(raceSilverTime))
				else
					RaceTrackerFrame:SetTimerText(L["race.time"]:format(0))
					RaceTrackerFrame:SetInfoText(L["race.bronze-time"])
				end
			elseif PER.Settings.raceTracker["mode"] == 2 then
				if racePersonalTime == -1 then
					RaceTrackerFrame:SetTimerText(L["race.time"]:format(elapsedTime))
					RaceTrackerFrame:SetInfoText(L["race.personal-best-time-not-available"])
				elseif racePersonalTime == 0 then
					RaceTrackerFrame:SetTimerText(L["race.time"]:format(elapsedTime))
					RaceTrackerFrame:SetInfoText(L["race.personal-best-time-no-race"])
				else
					if elapsedTime <= racePersonalTime then
						local remainingTime = -(racePersonalTime - elapsedTime)
						RaceTrackerFrame:SetTimerText(L["race.time"]:format(remainingTime))
						RaceTrackerFrame:SetInfoText(L["race.personal-best-time"]:format(racePersonalTime))
					else
						RaceTrackerFrame:SetTimerText(L["race.time"]:format(0))
						RaceTrackerFrame:SetInfoText(L["race.personal-best-time-failed"])
					end
				end
			end
		end
	end)
end

function RaceTracker:Stop()
	raceTicker:Cancel()

	SpeedDisplayFrame:HideFrame()

	ResultTrackerFrame:SetTimerText(RaceTrackerFrame:GetTimerText())
	ResultTrackerFrame:SetInfoText(RaceTrackerFrame:GetInfoText())

	RaceTrackerFrame:HideFrame()
end

function RaceTracker:ShowResultTracker()
	ResultTrackerFrame:ShowFrame()
end

function RaceTracker:HideResultTracker()
	ResultTrackerFrame:HideFrame()
end
