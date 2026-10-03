local addonName, PER = ...

-- Library
local AWL = ArcaneWizardLibrary
local Addon = AWL:GetAddon(addonName)

-- Localization
local L = PER.Localization

-- Current module
local RaceTimeOverview = PER.Modules.RaceTimeOverview

-- Variables
local raceDataTable = PER.RACE_DATA
local sortedRaceDataTable = PER.SORTED_RACE_DATA

--------------
--- Frames ---
--------------

local RaceOverviewFrame
local ZoneOverviewFrame
local GobalOverviewFrame

-----------------------
--- Frame Functions ---
-----------------------

local function UpdateRaceOverview(npcID, scrollFrame)
	if scrollFrame.rows then
		for _, row in ipairs(scrollFrame.rows) do
			for _, element in ipairs(row) do
				element:Hide()
				element:SetParent(nil)
			end
		end
	end

	scrollFrame.rows = {}

	local offsetY = 0

	local zoneID = raceDataTable[npcID][2]
	local count = raceDataTable[npcID][3]

	if count >= 1 then
		RaceOverviewFrame.openButton:Disable()

		local npc = scrollFrame:CreateFontString(nil, "OVERLAY", "Fancy16Font")
		npc:SetPoint("TOP", 5, 40)

		local function GetNPCNameByIDAsync(npcID, callback)
			if not npcID or type(callback) ~= "function" then return end

			local hyperlink = string.format("unit:Creature-0-0-0-0-%d-0", npcID)

			local function CheckForName()
				local tooltipInfo = C_TooltipInfo.GetHyperlink(hyperlink)
				if tooltipInfo and tooltipInfo.lines and tooltipInfo.lines[1] then
					local name = tooltipInfo.lines[1].leftText
					if name and name ~= "" then
						return name
					end
				end
				return nil
			end

			local immediateName = CheckForName()
			if immediateName then
				callback(immediateName)
				return
			end

			local maxRetries = 20
			local attempts = 0
			local ticker

			ticker = C_Timer.NewTicker(0.1, function()
				attempts = attempts + 1
				local fetchedName = CheckForName()

				if fetchedName then
					ticker:Cancel()
					callback(fetchedName)
				elseif attempts >= maxRetries then
					ticker:Cancel()
					callback(nil)
				end
			end)
		end

		GetNPCNameByIDAsync(npcID, function(name)
			if name then
				npc:SetText("|cnNORMAL_FONT_COLOR:".. name .. "|r")
			end
		end)

		table.insert(scrollFrame.rows, {npc})

		local races = raceDataTable[npcID][4]

		for _, modeKey in ipairs(PER.RACE_ORDER) do
			if races[modeKey] then
				local questID = raceDataTable[npcID][4][modeKey][1]

				local racePersonalTime = -1
				local raceGoldTime = raceDataTable[npcID][4][modeKey][4]
				local raceSilverTime = raceDataTable[npcID][4][modeKey][5]

				if raceDataTable[npcID][4][modeKey][2] ~= 0 then
					racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(raceDataTable[npcID][4][modeKey][2]).quantity / 1000
				end

				local mode = scrollFrame.scrollView:CreateFontString(nil, "OVERLAY", "GameFontNormal")
				mode:SetPoint("TOPLEFT", 0, offsetY)
				mode:SetJustifyH("LEFT")

				QuestEventListener:AddCallback(questID, function()
					local name = C_QuestLog.GetTitleForQuestID(questID)
					mode:SetText(name)
				end)

				offsetY = offsetY - 20

				local bestTime = scrollFrame.scrollView:CreateFontString(nil, "OVERLAY", "GameFontWhite")
				bestTime:SetPoint("TOPLEFT", 0, offsetY)
				bestTime:SetJustifyH("LEFT")

				if racePersonalTime == -1 then
					bestTime:SetText(L["race.personal-best-time-not-available"])
				elseif racePersonalTime == 0 then
					bestTime:SetText(L["race.personal-best-time-no-race"])
				else
					local time

					if racePersonalTime <= raceGoldTime then
						time = "|T616373:0|t |cnGOLD_FONT_COLOR:".. racePersonalTime .. "|r"
					elseif racePersonalTime <= raceSilverTime then
						time = "|T616375:0|t |c" .. PER.COLOR_SILVER .. racePersonalTime .. "|r"
					else
						time = "|T616372:0|t |c" .. PER.COLOR_BRONZE .. racePersonalTime .. "|r"
					end

					bestTime:SetText(L["race.personal-best-time"]:format(time))
				end

				offsetY = offsetY - 20

				local goldSilverTime = scrollFrame.scrollView:CreateFontString(nil, "OVERLAY", "GameFontWhite")
				goldSilverTime:SetPoint("TOPLEFT", 0, offsetY)
				goldSilverTime:SetJustifyH("LEFT")
				goldSilverTime:SetText(L["race.gold-time"]:format(raceGoldTime) .. " - " .. L["race.silver-time"]:format(raceSilverTime))

				table.insert(scrollFrame.rows, {mode, bestTime, goldSilverTime})

				offsetY = offsetY - 40
			end
		end
	else
		RaceOverviewFrame.openButton:Enable()

		local questID = raceDataTable[npcID][4].NORMAL[1]

		local quest = scrollFrame:CreateFontString(nil, "OVERLAY", "Fancy16Font")
		quest:SetPoint("TOP", 5, 40)

		QuestEventListener:AddCallback(questID, function()
			local name = C_QuestLog.GetTitleForQuestID(questID)
			quest:SetText("|cnNORMAL_FONT_COLOR:".. name .. "|r")
		end)

		table.insert(scrollFrame.rows, {quest})

		local difficulties = raceDataTable[npcID][4]

		for _, modeKey in ipairs(PER.DIFFICULTY_ORDER) do
			if difficulties[modeKey] then
				local lookupKey = "race.type-" .. modeKey:lower():gsub("_", "-")

				local racePersonalTime = -1
				local raceGoldTime = raceDataTable[npcID][4][modeKey][4]
				local raceSilverTime = raceDataTable[npcID][4][modeKey][5]

				if raceDataTable[npcID][4][modeKey][2] ~= 0 then
					racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(raceDataTable[npcID][4][modeKey][2]).quantity / 1000
				end

				local mode = scrollFrame.scrollView:CreateFontString(nil, "OVERLAY", "GameFontNormal")
				mode:SetPoint("TOPLEFT", 0, offsetY)
				mode:SetJustifyH("LEFT")
				mode:SetText(L[lookupKey])

				offsetY = offsetY - 20

				local bestTime = scrollFrame.scrollView:CreateFontString(nil, "OVERLAY", "GameFontWhite")
				bestTime:SetPoint("TOPLEFT", 0, offsetY)
				bestTime:SetJustifyH("LEFT")

				if racePersonalTime == -1 then
					bestTime:SetText(L["race.personal-best-time-not-available"])
				elseif racePersonalTime == 0 then
					bestTime:SetText(L["race.personal-best-time-no-race"])
				else
					local time

					if racePersonalTime <= raceGoldTime then
						time = "|T616373:0|t |cnGOLD_FONT_COLOR:".. racePersonalTime .. "|r"
					elseif racePersonalTime <= raceSilverTime then
						time = "|T616375:0|t |c" .. PER.COLOR_SILVER .. racePersonalTime .. "|r"
					else
						time = "|T616372:0|t |c" .. PER.COLOR_BRONZE .. racePersonalTime .. "|r"
					end

					bestTime:SetText(L["race.personal-best-time"]:format(time))
				end

				offsetY = offsetY - 20

				local goldSilverTime = scrollFrame.scrollView:CreateFontString(nil, "OVERLAY", "GameFontWhite")
				goldSilverTime:SetPoint("TOPLEFT", 0, offsetY)
				goldSilverTime:SetJustifyH("LEFT")
				goldSilverTime:SetText(L["race.gold-time"]:format(raceGoldTime) .. " - " .. L["race.silver-time"]:format(raceSilverTime))

				table.insert(scrollFrame.rows, {mode, bestTime, goldSilverTime})

				offsetY = offsetY - 40
			end
		end
	end

	return zoneID
end

local function UpdateZoneOverview(zoneID, scrollFrame)
	if scrollFrame.rows then
		for _, row in ipairs(scrollFrame.rows) do
			for _, element in ipairs(row) do
				element:Hide()
				element:SetParent(nil)
			end
		end
	end

	scrollFrame.rows = {}

	local zone = scrollFrame:CreateFontString(nil, "OVERLAY", "Fancy16Font")
	zone:SetPoint("TOP", 5, 40)
	zone:SetText("|cnNORMAL_FONT_COLOR:".. C_Map.GetMapInfo(zoneID).name .. "|r")
	table.insert(scrollFrame.rows, {zone})

	local offsetY = 0
	local count = 1

	for _, raceData in ipairs(sortedRaceDataTable) do
		if raceData.zoneID == zoneID and raceData.count == 0 then
			local modes = raceData.modes
			local questID = modes.NORMAL[1]

			local header = scrollFrame.scrollView:CreateFontString(nil, "OVERLAY", "GameFontNormal")
			header:SetPoint("TOPLEFT", 0, offsetY)
			header:SetJustifyH("LEFT")
			table.insert(scrollFrame.rows, {header})

			QuestEventListener:AddCallback(questID, function()
				local name = C_QuestLog.GetTitleForQuestID(questID)
				header:SetText(count .. ". " .. name)
				count = count + 1
			end)

			offsetY = offsetY - 20

			for _, mode in ipairs(PER.DIFFICULTY_ORDER) do
				local data = modes[mode]

				if data then
					local time = "-"
					local difficulty
					local racePersonalTime = -1
					local raceGoldTime = data[4]
					local raceSilverTime = data[5]

					if data[2] ~= 0 then
						racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(data[2]).quantity / 1000
					end

					if mode == "NORMAL" then
						difficulty = L["race.type-normal"]
					elseif mode == "ADVANCED" then
						difficulty = L["race.type-advanced"]
					elseif mode == "REVERSE" then
						difficulty = L["race.type-reverse"]
					elseif mode == "CHALLENGE" then
						difficulty = L["race.type-challenge"]
					elseif mode == "CHALLENGE_REVERSE" then
						difficulty = L["race.type-challenge-reverse"]
					elseif mode == "STORM_GRYPHON" then
						difficulty = L["race.type-storm-gryphon"]
					end

					local text = scrollFrame.scrollView:CreateFontString(nil, "OVERLAY", "GameFontWhite")
					text:SetPoint("TOPLEFT", 0, offsetY)
					text:SetJustifyH("LEFT")
					table.insert(scrollFrame.rows, {text})

					if racePersonalTime > 0 then
						if racePersonalTime <= raceGoldTime then
							time = "|T616373:0|t |cnGOLD_FONT_COLOR:" .. racePersonalTime .. "|r"
						elseif racePersonalTime <= raceSilverTime then
							time = "|T616375:0|t |c" .. PER.COLOR_SILVER .. racePersonalTime .. "|r"
						else
							time = "|T616372:0|t |c" .. PER.COLOR_BRONZE .. racePersonalTime .. "|r"
						end

						text:SetText(difficulty .. ": " .. time .. " " .. L["race.seconds-short"])
					else
						text:SetText(difficulty .. ": " .. time)
					end

					offsetY = offsetY - 16
				end
			end

			offsetY = offsetY - 16
		end
	end
end

local function InitializeFrames()
	do
		RaceOverviewFrame = CreateFrame("Frame", nil, GossipFrame, "PortraitFrameTemplate")
		RaceOverviewFrame:SetPoint("TOPLEFT", GossipFrame, "TOPRIGHT", 15, 0)
		RaceOverviewFrame:SetSize(338, 430)
		RaceOverviewFrame:SetFrameStrata("MEDIUM")
		RaceOverviewFrame:SetTitle(addonName)
		RaceOverviewFrame:Hide()

		RaceOverviewFrame.portrait = RaceOverviewFrame:GetPortrait()
		RaceOverviewFrame.portrait:SetPoint('TOPLEFT', -5, 8)
		RaceOverviewFrame.portrait:SetTexture(Addon:GetMediaPath("icon-round.tga"))

		local background = CreateFrame("Frame", nil, RaceOverviewFrame, "InsetFrameTemplate4")
		background:SetSize(322, 330)
		background:SetPoint("BOTTOM", RaceOverviewFrame, "BOTTOM", 0, 37)
		background.texture = background:CreateTexture(nil, "BACKGROUND")
		background.texture:SetAllPoints(background)
		background.texture:SetPoint("CENTER")
		background.texture:SetAtlas("character-panel-background", false)

		RaceOverviewFrame.scrollFrame = CreateFrame("ScrollFrame", nil, RaceOverviewFrame, "PercursusOverviewScrollFrameTemplate")
		RaceOverviewFrame.scrollFrame:SetPoint("TOPLEFT", background, "TOPLEFT", 15, -15)
		RaceOverviewFrame.scrollFrame:SetPoint("BOTTOMRIGHT", background, "BOTTOMRIGHT", -25, 15)

		RaceOverviewFrame.scrollFrame.scrollView = CreateFrame("Frame")
		RaceOverviewFrame.scrollFrame.scrollView:SetSize(1, 1)
		RaceOverviewFrame.scrollFrame:SetScrollChild(RaceOverviewFrame.scrollFrame.scrollView)

		RaceOverviewFrame.openButton = CreateFrame("Button", nil, RaceOverviewFrame, "UIPanelButtonTemplate")
		RaceOverviewFrame.openButton:SetPoint("TOPRIGHT", background, "BOTTOMRIGHT", -5, -5)
		RaceOverviewFrame.openButton:SetSize(130, 22)
		RaceOverviewFrame.openButton:SetText(L["race.button.zone-overview"])

		RaceOverviewFrame.openButton:SetScript("OnClick", function()
			if ZoneOverviewFrame:IsShown() then
				ZoneOverviewFrame:Hide()
			else
				ZoneOverviewFrame:Show()
				ZoneOverviewFrame.scrollFrame:SetVerticalScroll(0)
			end
		end)
	end

	do
		ZoneOverviewFrame = CreateFrame("Frame", nil, RaceOverviewFrame, "DefaultPanelTemplate")
		ZoneOverviewFrame:SetPoint("TOPLEFT", RaceOverviewFrame, "TOPRIGHT", 10, 0)
		ZoneOverviewFrame:SetSize(343, 430)
		ZoneOverviewFrame:SetTitle(L["race.title.zone-overview"])
		ZoneOverviewFrame:Hide()

		local background = CreateFrame("Frame", nil, ZoneOverviewFrame, "InsetFrameTemplate4")
		background:SetSize(322, 330)
		background:SetPoint("BOTTOM", ZoneOverviewFrame, "BOTTOM", 2.5, 37)
		background.texture = background:CreateTexture(nil, "BACKGROUND")
		background.texture:SetAllPoints(background)
		background.texture:SetPoint("CENTER")
		background.texture:SetAtlas("character-panel-background", false)

		ZoneOverviewFrame.scrollFrame = CreateFrame("ScrollFrame", nil, ZoneOverviewFrame, "PercursusOverviewScrollFrameTemplate")
		ZoneOverviewFrame.scrollFrame:SetPoint("TOPLEFT", background, "TOPLEFT", 15, -15)
		ZoneOverviewFrame.scrollFrame:SetPoint("BOTTOMRIGHT", background, "BOTTOMRIGHT", -25, 15)

		ZoneOverviewFrame.scrollFrame.scrollView = CreateFrame("Frame")
		ZoneOverviewFrame.scrollFrame.scrollView:SetSize(1, 1)
		ZoneOverviewFrame.scrollFrame:SetScrollChild(ZoneOverviewFrame.scrollFrame.scrollView)

		ZoneOverviewFrame.closeButton = CreateFrame("Button", nil, ZoneOverviewFrame, "UIPanelButtonTemplate")
		ZoneOverviewFrame.closeButton:SetPoint("TOPRIGHT", background, "BOTTOMRIGHT", -5, -5)
		ZoneOverviewFrame.closeButton:SetSize(100, 22)
		ZoneOverviewFrame.closeButton:SetText(L["race.button.close"])

		ZoneOverviewFrame.closeButton:SetScript("OnClick", function()
			ZoneOverviewFrame:Hide()
		end)
	end
end

------------------------
--- Module Functions ---
------------------------

function RaceTimeOverview:Initialize()
	InitializeFrames()
end

function RaceTimeOverview:ShowRaceOverview(npcID)
	local zoneID = UpdateRaceOverview(npcID, RaceOverviewFrame.scrollFrame)
	UpdateZoneOverview(zoneID, ZoneOverviewFrame.scrollFrame)

	RaceOverviewFrame:Show()
	RaceOverviewFrame.scrollFrame:SetVerticalScroll(0)
end

function RaceTimeOverview:HideRaceOverview()
	ZoneOverviewFrame:Hide()
	RaceOverviewFrame:Hide()
end
