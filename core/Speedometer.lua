local addonName, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

-- Current module
local Speedometer = PER.Modules.Speedometer

-- Module imports
local SpeedometerConfig = PER.UIConfig.Speedometer

-- Variables
local activeQuestID = nil
local countdownTimer = nil ---@type FunctionContainer|nil
local elapsedTime = 0
local lastSpeed = nil

--------------
--- Frames ---
--------------

local SpeedometerFrame = nil ---@type PercursusSpeedometerFrame

-----------------------
--- Frame Functions ---
-----------------------

local function UpdateDisplay()
	local mode = PER.Settings.speedometer.visibility
	local showForRace = activeQuestID and not countdownTimer and (mode == "race" or mode == "both")
	local showForFlight = not activeQuestID and (mode == "flight" or mode == "both")

	if not showForRace and not showForFlight then
		SpeedometerFrame:Hide()

		return
	end

	local isGliding, canGlide, forwardSpeed = C_PlayerInfo.GetGlidingInfo()

	if not isGliding and not (showForRace and canGlide) then
		SpeedometerFrame:Hide()

		return
	end

	local speed = isGliding and Round(forwardSpeed) or 0

	if speed ~= lastSpeed then
		lastSpeed = speed
		local width = SpeedometerConfig.fullBarWidth * speed / SpeedometerConfig.fullBarSpeed

		if width > 0 then
			SpeedometerFrame.SpeedBar:SetWidth(width)
		end

		SpeedometerFrame.SpeedBar:SetShown(width > 0)

		if PER.Settings.speedometer["show-value"] then
			SpeedometerFrame.ValueText:SetText(tostring(math.max(0, math.min(100, speed))))
		end
	end

	SpeedometerFrame:Show()
end

local function OnUpdate(_, elapsed)
	elapsedTime = elapsedTime + elapsed

	if elapsedTime < SpeedometerConfig.updateInterval then return end

	elapsedTime = 0
	UpdateDisplay()
end

local function OnEvent(_, event, isInitialLogin, isReloadingUi)
	if event == "PLAYER_ENTERING_WORLD" and (isInitialLogin or isReloadingUi) and not activeQuestID then
		for questID in pairs(PER.RACE_QUEST_INDEX) do
			if C_QuestLog.IsOnQuest(questID) then
				activeQuestID = questID

				break
			end
		end
	end

	UpdateDisplay()
end

------------------------
--- Module Functions ---
------------------------

function Speedometer.ApplySettings()
	local settings = PER.Settings.speedometer
	SpeedometerFrame:ClearAllPoints()
	SpeedometerFrame:SetPoint("CENTER", settings["horizontal-shift"], settings["vertical-shift"])
	SpeedometerFrame.ValueText:SetShown(settings["show-value"])
	lastSpeed = nil
	UpdateDisplay()
end

function Speedometer:Initialize()
	SpeedometerFrame = CreateFrame("Frame", nil, UIParent, "Percursus_SpeedometerTemplate")
	SpeedometerFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
	SpeedometerFrame:RegisterEvent("PLAYER_IS_GLIDING_CHANGED")
	SpeedometerFrame:RegisterEvent("PLAYER_CAN_GLIDE_CHANGED")
	SpeedometerFrame:SetScript("OnEvent", OnEvent)
	SpeedometerFrame:SetScript("OnUpdate", OnUpdate)

	self.ApplySettings()
end

function Speedometer:StartRace(questID)
	if activeQuestID == questID then return end

	if countdownTimer then
		countdownTimer:Cancel()
	end

	activeQuestID = questID
	countdownTimer = C_Timer.NewTimer(PER.RACE_TRACKER_DATA.countdownDelay, function()
		countdownTimer = nil
		UpdateDisplay()
	end)
	UpdateDisplay()
end

function Speedometer:EndRace(questID)
	if activeQuestID ~= questID then return end

	if countdownTimer then
		countdownTimer:Cancel()
		countdownTimer = nil
	end

	activeQuestID = nil
	UpdateDisplay()
end
