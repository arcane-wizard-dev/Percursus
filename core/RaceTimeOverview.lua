local addonName, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

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
local OverviewConfig = PER.UIConfig.RaceTimeOverview
local Intl = rawget(_G, "C_Intl")
local groups, groupsByZone, names, pendingNames = {}, {}, {}, {}
local continents = {}
local refreshQueued = false
local RefreshWindow

--------------
--- Frames ---
--------------

---@class PercursusRaceTimeOverviewFrame: Frame
---@field state table
---@field scrollFrame PercursusRaceTimeOverviewScrollFrame|PercursusRaceTimeOverviewTable
---@field inset Frame
---@field heading FontString

---@class PercursusRaceTimeOverviewScrollFrame: ArcaneWizardLibraryScrollFrame
---@field rows table[]

---@class PercursusRaceTimeOverviewTable: ArcaneWizardLibraryTable
---@field rows table[]

local RaceOverviewFrame
local ZoneOverviewFrame
local AllOverviewFrame
local QuestOverviewFrame

-----------------------
--- Local Functions ---
-----------------------

local function GetNativeDecimalSeparator()
	if not Intl or not Intl.FormatNumber or not Enum.NumberStyle then return end
	if not Enum.NumberStyle.Decimal or not Enum.NumberStyle.Integer then return end
	local sample = Intl.FormatNumber(1.5, Enum.NumberStyle.Decimal)
	if type(sample) ~= "string" then return end
	return sample:match("^1([^%d]+)5$")
end

local nativeDecimalSeparator = GetNativeDecimalSeparator()

local function FormatTime(value, compact, showUnit)
	local integer, fraction = string.format("%.3f", value):match("^(%d+)%.(%d+)$")
	if compact then
		fraction = fraction:gsub("0+$", "")
	end
	if nativeDecimalSeparator then
		integer = Intl.FormatNumber(tonumber(integer), Enum.NumberStyle.Integer) or integer
	end
	local text = integer
	if fraction ~= "" then
		text = text .. (nativeDecimalSeparator or L["race.decimal-separator"]) .. fraction
	end
	if showUnit == false then return text end
	return text .. " " .. L["race.seconds-short"]
end

local function GetTargetTime(value, showUnit)
	if type(value) ~= "number" or value <= 0 then
		return showUnit == false and OverviewConfig.missingTableTime or L["race.no-time"]
	end
	return FormatTime(value, true, showUnit), true
end

local function GetBestQuantity(data)
	local currency = data[2] and data[2] ~= 0 and C_CurrencyInfo.GetCurrencyInfo(data[2])
	return currency and currency.quantity
end

local function GetBestTime(data, showUnit)
	local quantity = GetBestQuantity(data)
	if type(quantity) ~= "number" or quantity <= 0 then
		if showUnit == false then return "" end
		if quantity == 0 then return L["race.personal-best-time-no-race"] end
		return L["race.personal-best-time-not-available"]
	end
	local seconds = quantity / 1000
	local medal
	if data[4] and data[4] > 0 and seconds <= data[4] then
		medal = OverviewConfig.medals.gold
	elseif data[5] and data[5] > 0 then
		medal = seconds <= data[5] and OverviewConfig.medals.silver or OverviewConfig.medals.bronze
	end
	local text = FormatTime(seconds, false, showUnit)
	if medal then
		text = string.format("|c%s%s|r", medal.color, text)
	end
	return text, medal, true
end

local function GetRaceName(questID)
	local title = C_QuestLog.GetTitleForQuestID(questID)
	if title and title ~= "" then
		names[questID] = title
	end
	return names[questID] or L["race.name-unavailable"]:format(questID)
end

local function GetZoneName(zoneID)
	local map = C_Map.GetMapInfo(zoneID)
	return map and map.name or L["race.zone-unavailable"]:format(zoneID)
end

local function QueueRefresh()
	if refreshQueued then return end
	refreshQueued = true
	C_Timer.After(0, function()
		refreshQueued = false
		for _, window in ipairs({RaceOverviewFrame, ZoneOverviewFrame, AllOverviewFrame}) do
			if window:IsVisible() then
				RefreshWindow(window)
			end
		end
	end)
end

local function RequestName(questID)
	GetRaceName(questID)
	if names[questID] or pendingNames[questID] then return end
	pendingNames[questID] = true
	QuestEventListener:AddCallback(questID, function()
		pendingNames[questID] = nil
		GetRaceName(questID)
		if names[questID] then
			QueueRefresh()
		end
	end)
end

local function RequestNames(zoneID)
	for _, group in ipairs(groups) do
		if not zoneID or group.key == zoneID then
			for _, race in ipairs(group.races) do
				RequestName(race.key)
			end
		end
	end
end

local function GetContinentID(mapID)
	local visited = {}
	while mapID and mapID ~= 0 and not visited[mapID] do
		visited[mapID] = true
		local map = C_Map.GetMapInfo(mapID)
		if not map then return 0 end
		if map.mapType == Enum.UIMapType.Continent then return mapID end
		mapID = map.parentMapID
	end
	return 0
end

local function BuildGroups()
	for _, race in ipairs(sortedRaceDataTable) do
		local group = groupsByZone[race.zoneID]
		if not group then
			group = {key = race.zoneID, races = {}}
			groupsByZone[race.zoneID] = group
			groups[#groups + 1] = group
		end
		if race.count == 0 then
			group.races[#group.races + 1] = {key = race.modes.NORMAL[1], modes = race.modes}
		else
			for _, mode in ipairs(PER.RACE_ORDER) do
				local data = race.modes[mode]
				if data then
					group.races[#group.races + 1] = {key = data[1], data = data}
				end
			end
		end
	end
	local byContinent = {}
	for _, group in ipairs(groups) do
		group.continentID = GetContinentID(group.key)
		local continent = byContinent[group.continentID]
		if not continent then
			continent = {key = group.continentID, zones = {}}
			byContinent[group.continentID] = continent
			continents[#continents + 1] = continent
		end
		continent.zones[#continent.zones + 1] = group
	end
end

local function FindCurrentZone()
	local mapID = C_Map.GetBestMapForUnit("player")
	local visited = {}
	while mapID and mapID ~= 0 and not visited[mapID] do
		if groupsByZone[mapID] then return mapID end
		visited[mapID] = true
		local map = C_Map.GetMapInfo(mapID)
		mapID = map and map.parentMapID
	end
end

local function ExpansionState(window, kind)
	local state = window.state
	if kind == "continent" then
		return state.expandedContinents, false
	end
	return kind == "zone" and state.expandedZones or state.expandedRaces, kind ~= "zone"
end

local function IsExpanded(window, kind, key)
	local values, default = ExpansionState(window, kind)
	if values[key] == nil then return default end
	return values[key]
end

local function ModeLabel(mode)
	return L["race.type-" .. mode:lower():gsub("_", "-")]
end

local function GetTableSettings(window)
	return PER.Settings.raceTimeOverview["table-" .. window.state.kind]
end

local function MatchesTimeFilter(data, filter)
	local quantity = GetBestQuantity(data)
	if type(quantity) ~= "number" or quantity <= 0 then return true end
	if filter == "no-time" then return false end
	return not (type(data[4]) == "number" and data[4] > 0 and quantity / 1000 <= data[4])
end

local function FilterRaces(races, filter)
	if filter == "all" then return races end
	local filtered = {}
	for _, race in ipairs(races) do
		if race.data then
			if MatchesTimeFilter(race.data, filter) then
				filtered[#filtered + 1] = race
			end
		else
			local modes = {}
			for mode, data in pairs(race.modes) do
				if MatchesTimeFilter(data, filter) then
					modes[mode] = data
				end
			end
			if next(modes) then
				filtered[#filtered + 1] = {key = race.key, modes = modes}
			end
		end
	end
	return filtered
end

local function FilterGroups(source, filter)
	if filter == "all" then return source end
	local filtered = {}
	for _, group in ipairs(source) do
		local races = FilterRaces(group.races, filter)
		if #races > 0 then
			filtered[#filtered + 1] = {key = group.key, races = races}
		end
	end
	return filtered
end

local function AppendRaces(window, entries, config)
	for _, race in ipairs(config.races) do
		if race.data then
			entries[#entries + 1] = {kind = "mode", key = race.key, label = GetRaceName(race.key), depth = config.depth, data = race.data}
		else
			local expanded = IsExpanded(window, "race", race.key)
			entries[#entries + 1] = {kind = "race", key = race.key, label = GetRaceName(race.key), depth = config.depth, expanded = expanded}
			if expanded then
				for _, mode in ipairs(PER.DIFFICULTY_ORDER) do
					local data = race.modes[mode]
					if data then
						entries[#entries + 1] = {kind = "mode", key = data[1], label = ModeLabel(mode), mode = mode, depth = config.depth + 1, data = data}
					end
				end
			end
		end
	end
end

local function BuildEntries(window)
	local state, entries = window.state, {}
	if state.kind == "race" then
		local race = raceDataTable[state.npcID]
		if not race then return entries end
		local order = race[3] == 0 and PER.DIFFICULTY_ORDER or PER.RACE_ORDER
		for _, mode in ipairs(order) do
			local data = race[4][mode]
			if data then
				entries[#entries + 1] = {kind = "mode", key = data[1], label = race[3] == 0 and ModeLabel(mode) or GetRaceName(data[1]), mode = race[3] == 0 and mode or nil, data = data, depth = 0}
			end
		end
		return entries
	end
	local filter = GetTableSettings(window)["time-filter"]
	if state.kind == "zone" then
		local group = groupsByZone[state.zoneID]
		if group then
			AppendRaces(window, entries, {races = FilterRaces(group.races, filter), depth = 0})
		end
	else
		for _, continent in ipairs(continents) do
			local zones = FilterGroups(continent.zones, filter)
			if #zones > 0 then
				local expanded = IsExpanded(window, "continent", continent.key)
				local label = continent.key == 0 and L["race.other-regions"] or GetZoneName(continent.key)
				entries[#entries + 1] = {kind = "continent", key = continent.key, label = label, depth = 0, expanded = expanded}
				if expanded then
					for _, group in ipairs(zones) do
						local depth, showRaces = 1, true
						if group.key ~= continent.key then
							showRaces = IsExpanded(window, "zone", group.key)
							entries[#entries + 1] = {kind = "zone", key = group.key, label = GetZoneName(group.key), depth = 1, expanded = showRaces}
							depth = 2
						end
						if showRaces then
							AppendRaces(window, entries, {races = group.races, depth = depth})
						end
					end
				end
			end
		end
	end
	return entries
end

-----------------------
--- Frame Functions ---
-----------------------

local function SetSeparatorVisibility(row)
	row.separator:SetShown(row.entry ~= nil and (row.window.state.kind == "race"
		or (GetTableSettings(row.window)["show-separators"] and row.entry.expanded ~= nil)))
end

local function RefreshSeparators(window)
	for _, row in ipairs(window.scrollFrame.rows) do
		SetSeparatorVisibility(row)
	end
end

local function HideRowTooltip(row)
	if GameTooltip:IsOwned(row) then
		GameTooltip:Hide()
	end
end

local function UpdateRowTooltip(row)
	local name = row.cells[1]
	if not name or not name:IsTruncated() then
		HideRowTooltip(row)
		return
	end
	local text = name:GetText()
	local x, width = row.window.scrollFrame:GetColumnLayout(1)
	GameTooltip:SetOwner(row, "ANCHOR_NONE")
	GameTooltip:ClearAllPoints()
	GameTooltip:SetPoint("BOTTOMLEFT", row, "TOPLEFT", x + width + OverviewConfig.rows.tooltipGap, OverviewConfig.rows.tooltipGap)
	GameTooltip:ClearLines()
	GameTooltip:AddLine(text, 1, 1, 1, true)
	GameTooltip:Show()
end

local function CreateRow(window, parent)
	local row = CreateFrame("Button", nil, parent)
	row.window, row.cells = window, {}
	row.separator = row:CreateTexture(nil, "BORDER")
	row.separator:SetPoint("BOTTOMLEFT")
	row.separator:SetPoint("BOTTOMRIGHT")
	row.separator:SetHeight(OverviewConfig.rows.separatorHeight)
	row.separator:SetColorTexture(unpack(OverviewConfig.colors.separator))
	row.chevron = row:CreateTexture(nil, "ARTWORK")
	row.chevron:SetSize(OverviewConfig.rows.chevronSize, OverviewConfig.rows.chevronSize)
	if window.state.kind == "race" then
		row:EnableMouse(false)
		return row
	end
	row.units = {}
	row.medal = row:CreateTexture(nil, "ARTWORK")
	row.medal:SetSize(OverviewConfig.rows.medalSize, OverviewConfig.rows.medalSize)
	row.highlight = row:CreateTexture(nil, "BACKGROUND")
	row.highlight:SetAllPoints()
	row.highlight:SetTexture(OverviewConfig.rows.highlightTexture)
	row.highlight:SetAlpha(0)
	row:SetScript("OnClick", function(self)
		local entry = self.entry
		if entry and entry.expanded ~= nil then
			local values = ExpansionState(window, entry.kind)
			values[entry.key] = not entry.expanded
			RefreshWindow(window)
		end
	end)
	row:SetScript("OnEnter", function(self)
		self.highlight:SetAlpha(OverviewConfig.rows.highlightAlpha)
	end)
	local function ClearHighlight(self)
		self.highlight:SetAlpha(0)
		HideRowTooltip(self)
	end
	row:SetScript("OnLeave", ClearHighlight)
	row:SetScript("OnHide", ClearHighlight)
	return row
end

local function GetContentWidth(window)
	local frame = window.scrollFrame
	if frame.GetContentWidth then return frame:GetContentWidth() end

	local insets = OverviewConfig.contentInsets
	return frame:GetWidth() - insets.left - insets.right
end

local function GetBodyTop(window)
	local top = OverviewConfig.layouts[window.state.kind].headerY
	if window.scrollFrame.header then
		top = top + window.scrollFrame.header:GetHeight()
	end
	return top
end

local function SetMedalRow(row, entry)
	local layout = OverviewConfig.medalList
	if not row.medal then
		row.medal = row:CreateTexture(nil, "ARTWORK")
		row.medal:SetSize(layout.medalSize, layout.medalSize)
		row.labels = {}
		for index = 1, 4 do
			local font = index == 1 and layout.modeFont or index == 2 and layout.bestFont or layout.labelFont
			row.cells[index] = row:CreateFontString(nil, "OVERLAY", font)
			if index == 2 then
				row.labels[index] = row:CreateFontString(nil, "OVERLAY", layout.labelFont)
			end
		end
	end
	row.entry = entry
	row.chevron:Hide()
	SetSeparatorVisibility(row)
	local best, medal, hasTime = GetBestTime(entry.data)
	local iconSize = hasTime and layout.medalSize or layout.missingTimeSize
	local icon = medal and medal.icon
	if not hasTime then
		icon = OverviewConfig.missingTimeIcon
	end
	row.medal:SetShown(icon ~= nil)
	row.medal:SetSize(iconSize, iconSize)
	if icon then
		row.medal:SetTexture(icon)
	end
	local mode = row.cells[1]
	mode:ClearAllPoints()
	mode:SetPoint("TOPLEFT", row, "TOPLEFT", layout.padding, -layout.verticalPadding)
	mode:SetWidth(math.max(1, row:GetWidth() - 2 * layout.padding - layout.separatorGap - layout.separatorMinimumWidth))
	mode:SetHeight(0)
	mode:SetJustifyH("LEFT")
	mode:SetJustifyV("TOP")
	mode:SetWordWrap(false)
	mode:SetText(entry.label)
	local nameWidth = math.min(mode:GetUnboundedStringWidth(), mode:GetWidth())
	local separatorY = -layout.verticalPadding - mode:GetStringHeight() / 2
	row.separator:ClearAllPoints()
	row.separator:SetPoint("TOPLEFT", row, "TOPLEFT", layout.padding + nameWidth + layout.separatorGap, separatorY)
	row.separator:SetPoint("TOPRIGHT", row, "TOPRIGHT", -layout.padding, separatorY)
	local targetWidth = 0
	for index = 3, 4 do
		local cell = row.cells[index]
		cell:ClearAllPoints()
		cell:SetHeight(0)
		cell:SetJustifyH("RIGHT")
		cell:SetJustifyV("TOP")
		cell:SetWordWrap(true)
		cell:SetText(L[OverviewConfig.columns[index].text] .. ": " .. GetTargetTime(entry.data[index + 1]))
		targetWidth = math.max(targetWidth, cell:GetUnboundedStringWidth())
	end
	targetWidth = math.min(targetWidth, layout.targetWidth)
	for index = 3, 4 do
		row.cells[index]:SetWidth(targetWidth)
	end
	local bestX = layout.padding + layout.medalSize + layout.medalGap
	local bestWidth = math.max(1, row:GetWidth() - layout.padding - targetWidth - layout.columnGap - bestX)
	local labelTop = layout.verticalPadding + mode:GetStringHeight() + layout.headerGap
	local label = row.labels[2]
	label:ClearAllPoints()
	label:SetWidth(bestWidth)
	label:SetHeight(0)
	label:SetJustifyH("LEFT")
	label:SetJustifyV("TOP")
	label:SetWordWrap(false)
	label:SetText(L["race.column.best-time"])
	local value = row.cells[2]
	value:SetFontObject(hasTime and layout.bestFont or layout.missingTimeFont)
	value:ClearAllPoints()
	value:SetWidth(bestWidth)
	value:SetHeight(0)
	value:SetJustifyH("LEFT")
	value:SetJustifyV("TOP")
	value:SetWordWrap(not hasTime)
	value:SetText(best)
	local bestHeight = label:GetStringHeight() + layout.textGap + row.cells[2]:GetStringHeight()
	local goldHeight = row.cells[3]:GetStringHeight()
	local targetHeight = goldHeight + layout.textGap + row.cells[4]:GetStringHeight()
	local contentHeight = math.max(bestHeight, targetHeight, icon and iconSize or 0)
	local height = math.max(layout.minimumHeight, labelTop + contentHeight + layout.verticalPadding)
	local center = (labelTop + height - layout.verticalPadding) / 2
	local bestTop = center - bestHeight / 2
	label:SetPoint("TOPLEFT", row, "TOPLEFT", bestX, -bestTop)
	value:SetPoint("TOPLEFT", row, "TOPLEFT", bestX, -bestTop - label:GetStringHeight() - layout.textGap)
	for index = 3, 4 do
		local top = center - targetHeight / 2
		if index == 4 then
			top = top + goldHeight + layout.textGap
		end
		row.cells[index]:SetPoint("TOPRIGHT", row, "TOPRIGHT", -layout.padding, -top)
	end
	row.medal:ClearAllPoints()
	row.medal:SetPoint("TOPLEFT", row, "TOPLEFT", layout.padding + (layout.medalSize - iconSize) / 2, -center + iconSize / 2)
	row:SetHeight(height)
end

local function SetRow(row, entry, values)
	local layout = OverviewConfig.rows
	local tableFrame = row.window.scrollFrame
	local firstX = tableFrame:GetColumnLayout(1)
	local grouped = entry.expanded ~= nil
	local font = grouped and OverviewConfig.fonts.group or OverviewConfig.fonts.body
	local height = layout.minimumHeight
	local indent = entry.depth * layout.indent
	row.entry = entry
	row.chevron:ClearAllPoints()
	row.chevron:SetPoint("LEFT", row, "LEFT", firstX + indent, 0)
	if grouped then
		row.chevron:Show()
		row.chevron:SetTexture(entry.expanded and layout.collapseTexture or layout.expandTexture)
		indent = indent + layout.chevronSize + layout.chevronGap
	else
		row.chevron:Hide()
	end
	local icon = values.medal and values.medal.icon
	local iconSize = layout.medalSize
	if entry.data and not values.units[2] then
		icon = OverviewConfig.missingTimeIcon
		iconSize = layout.missingTimeSize
	end
	row.medal:SetShown(icon ~= nil)
	row.medal:SetSize(iconSize, iconSize)
	if icon then
		row.medal:SetTexture(icon)
		row.medal:ClearAllPoints()
		row.medal:SetPoint("LEFT", row, "LEFT", tableFrame:GetColumnLayout(2) + (layout.medalSize - iconSize) / 2, 0)
	end
	for index = 1, #OverviewConfig.columns do
		local x, width, align = tableFrame:GetColumnLayout(index)
		local cell = row.cells[index]
		if not cell then
			cell = row:CreateFontString(nil, "OVERLAY", font)
			row.cells[index] = cell
			if index == 1 then
				cell:EnableMouseMotion(true)
				cell:SetMouseClickEnabled(false)
				cell:SetPropagateMouseMotion(true)
				cell:SetScript("OnEnter", function()
					UpdateRowTooltip(row)
				end)
				local function HideNameTooltip()
					HideRowTooltip(row)
				end
				cell:SetScript("OnLeave", HideNameTooltip)
				cell:SetScript("OnHide", HideNameTooltip)
			end
		end
		local offset = index == 1 and indent or 0
		if grouped and index == 1 then
			local lastX, lastWidth = tableFrame:GetColumnLayout(#OverviewConfig.columns)
			width = lastX + lastWidth - x
		end
		local hasUnit = values.units and values.units[index]
		local unitSpace = 0
		if index > 1 then
			local unit = row.units[index]
			if not unit then
				unit = row:CreateFontString(nil, "OVERLAY", font)
				row.units[index] = unit
			end
			unit:SetShown(hasUnit == true)
			if hasUnit then
				unit:SetFontObject(font)
				unit:SetText(L["race.seconds-short"])
				local unitWidth = unit:GetUnboundedStringWidth()
				unit:ClearAllPoints()
				unit:SetWidth(unitWidth)
				unit:SetHeight(0)
				unit:SetJustifyH("LEFT")
				unit:SetJustifyV("MIDDLE")
				unit:SetWordWrap(false)
				if index == 2 and values.medal then
					unit:SetText(string.format("|c%s%s|r", values.medal.color, L["race.seconds-short"]))
				end
				unitSpace = unitWidth + layout.unitGap
			end
		end
		if index == 2 and (hasUnit or icon) then
			offset = layout.medalSize + layout.medalGap
		end

		cell:SetFontObject(font)
		cell:ClearAllPoints()
		cell:SetPoint("LEFT", row, "LEFT", x + offset, 0)
		cell:SetWidth(math.max(1, width - offset - unitSpace))
		cell:SetHeight(0)
		cell:SetJustifyH(align)
		cell:SetJustifyV("MIDDLE")
		cell:SetWordWrap(false)
		cell:SetText(values[index] or "")
		if hasUnit then
			local textWidth = math.min(cell:GetUnboundedStringWidth(), cell:GetWidth())
			row.units[index]:SetPoint("LEFT", cell, "LEFT", textWidth + layout.unitGap, 0)
		end
		height = math.max(height, cell:GetStringHeight() + 2 * layout.verticalPadding)
	end
	SetSeparatorVisibility(row)
	row:SetHeight(height)
end

local function SetWindowTitle(window, title)
	window.title = title
	if window.titleText then
		window.titleText:SetText(title)
	elseif window.heading then
		window.heading:SetText(title)
	end
end

RefreshWindow = function(window)
	local state = window.state
	if state.kind == "race" then
		local race = raceDataTable[state.npcID]
		if not race then return end
		if race[3] == 0 then
			SetWindowTitle(window, GetRaceName(race[4].NORMAL[1]))
		else
			SetWindowTitle(window, window.title or addonName)
		end
	elseif state.kind == "zone" then
		if not state.zoneID then return end
		SetWindowTitle(window, GetZoneName(state.zoneID))
	end
	local scrollFrame = window.scrollFrame
	local entries, y = BuildEntries(window), 0
	for index, entry in ipairs(entries) do
		local row = scrollFrame.rows[index]
		if not row then
			row = CreateRow(window, scrollFrame.content)
			scrollFrame.rows[index] = row
		end
		if row.highlight then
			row.highlight:SetAlpha(row:IsMouseOver() and OverviewConfig.rows.highlightAlpha or 0)
		end
		row:ClearAllPoints()
		row:SetPoint("TOPLEFT", scrollFrame.content, "TOPLEFT", 0, -y)
		row:SetWidth(GetContentWidth(window))
		if state.kind == "race" then
			SetMedalRow(row, entry)
		else
			local values = {entry.label, units = {}}
			if entry.data then
				values[2], values.medal, values.units[2] = GetBestTime(entry.data, false)
				values[3], values.units[3] = GetTargetTime(entry.data[4], false)
				values[4], values.units[4] = GetTargetTime(entry.data[5], false)
			end
			SetRow(row, entry, values)
		end
		row:Show()
		y = y + row:GetHeight()
	end
	for index = #entries + 1, #scrollFrame.rows do
		scrollFrame.rows[index]:Hide()
		scrollFrame.rows[index].entry = nil
	end
	local layout = OverviewConfig.layouts[state.kind]
	local bodyTop = GetBodyTop(window)
	local bodyHeight = window:GetHeight() - bodyTop - layout.bottom
	scrollFrame:ClearAllPoints()
	scrollFrame:SetPoint("TOPLEFT", window, "TOPLEFT", OverviewConfig.sideInset, -bodyTop)
	scrollFrame:SetHeight(bodyHeight)
	scrollFrame:SetContentHeight(y)
	if state.kind ~= "race" then
		for _, row in ipairs(scrollFrame.rows) do
			local name = row.cells[1]
			if row:IsVisible() and name and name:IsMouseMotionFocus() then
				UpdateRowTooltip(row)
			else
				HideRowTooltip(row)
			end
		end
	end
end

local function SetAllExpanded(window, expanded)
	if window.state.kind == "all" then
		local continentState = ExpansionState(window, "continent")
		for _, continent in ipairs(continents) do
			continentState[continent.key] = expanded
		end
	end
	local zones = ExpansionState(window, "zone")
	local races = ExpansionState(window, "race")
	for _, group in ipairs(groups) do
		if window.state.kind == "all" or group.key == window.state.zoneID then
			zones[group.key] = expanded
			for _, race in ipairs(group.races) do
				races[race.key] = expanded
			end
		end
	end
	RefreshWindow(window)
	window.scrollFrame:ScrollToTop()
end

local function SetTimeFilter(window, value)
	GetTableSettings(window)["time-filter"] = value
	RefreshWindow(window)
	window.scrollFrame:ScrollToTop()
end

local function CreateDismissButton(window)
	window.dismissButton = AWL.Controls:CreateButton({
		parent = window,
		width = OverviewConfig.closeButtonWidth,
		label = L["race.button.close"],
		onClick = function()
			window:Hide()
		end
	})
	window.dismissButton:SetPoint("BOTTOMRIGHT", window, "BOTTOMRIGHT", -OverviewConfig.sideInset - OverviewConfig.buttonInset, OverviewConfig.footerBottom)
end

local function SetPortrait(window)
	window.portrait:SetPoint("TOPLEFT", OverviewConfig.portrait.x, OverviewConfig.portrait.y)
	window.portrait:SetTexture(Addon:GetMediaPath("icon-round.tga"))
end

local function AddMenuIcon(description, iconConfig)
	local config = OverviewConfig.menuItem
	description:AddInitializer(function(menuButton)
		local icon = menuButton:AttachTexture()
		if iconConfig.atlas then
			icon:SetAtlas(iconConfig.atlas)
		else
			icon:SetTexture(iconConfig.texture)
		end
		icon:SetVertexColor(unpack(iconConfig.color or {1, 1, 1, 1}))
		icon:SetSize(iconConfig.size, iconConfig.size)
		icon:SetPoint("LEFT", menuButton, "LEFT", config.padding, 0)

		local text = menuButton.fontString
		local textWidth = text:GetUnboundedStringWidth()
		text:ClearAllPoints()
		text:SetPoint("LEFT", config.padding + iconConfig.size + config.iconGap, config.textOffsetY)
		text:SetWidth(textWidth)

		return textWidth + iconConfig.size + config.iconGap + config.padding * 2, config.height
	end)
end

local function CreateOverviewWindow(kind)
	local config = AWL.Utils:CopyTable(kind == "all" and OverviewConfig.allWindow or OverviewConfig.questWindow)
	config.addonName = addonName
	config.title = addonName
	local window
	if kind == "all" then
		window = AWL.Frames:CreateWindow(config)
		SetPortrait(window)
		CreateDismissButton(window)
	else
		window = QuestOverviewFrame.tabGroup:AddTab(kind, L["race.tab." .. kind])
		window:ClearAllPoints()
		window:SetAllPoints(QuestOverviewFrame)
	end
	---@cast window PercursusRaceTimeOverviewFrame
	window.state = {
		kind = kind,
		expandedContinents = {},
		expandedZones = {},
		expandedRaces = {}
	}
	local layout = OverviewConfig.layouts[kind]
	local width = config.width - 2 * OverviewConfig.sideInset
	local tableConfig = {
		parent = window,
		width = width,
		height = config.height - layout.headerY - layout.bottom,
		backgroundStyle = OverviewConfig.inset.backgroundStyle,
		backgroundAlpha = OverviewConfig.inset.backgroundAlpha
	}

	if kind == "race" then
		local scrollFrame = AWL.ScrollFrames:CreateScrollFrame({
			parent = window,
			width = width,
			height = tableConfig.height,
			backgroundAlpha = 0,
			showBorder = false,
			contentInsets = OverviewConfig.contentInsets
		})
		---@cast scrollFrame PercursusRaceTimeOverviewScrollFrame
		window.scrollFrame = scrollFrame
		tableConfig.parent = window.scrollFrame
		window.inset = AWL.Frames:CreateInset(tableConfig)
		window.inset:SetAllPoints(window.scrollFrame)
	else
		tableConfig.columns = AWL.Utils:CopyTable(OverviewConfig.columns)

		for _, column in ipairs(tableConfig.columns) do
			column.text = L[column.text]
		end

		tableConfig.tableMenu = function(_, root)
			local expand = root:CreateButton(L["race.expand-all"], function()
				SetAllExpanded(window, true)
			end)
			AddMenuIcon(expand, OverviewConfig.menuIcons.expand)
			local collapse = root:CreateButton(L["race.collapse-all"], function()
				SetAllExpanded(window, false)
			end)
			AddMenuIcon(collapse, OverviewConfig.menuIcons.collapse)
			root:CreateDivider()
			root:CreateCheckbox(L["race.menu.show-separators"], function()
				return GetTableSettings(window)["show-separators"]
			end, function()
				local settings = GetTableSettings(window)
				settings["show-separators"] = not settings["show-separators"]
				RefreshSeparators(window)
			end)
			root:CreateDivider()
			for _, filter in ipairs(OverviewConfig.filters) do
				root:CreateRadio(L[filter.text], function()
					return GetTableSettings(window)["time-filter"] == filter.value
				end, function()
					SetTimeFilter(window, filter.value)
				end)
			end
		end

		local tableFrame = AWL.Tables:CreateTable(tableConfig)
		---@cast tableFrame PercursusRaceTimeOverviewTable
		window.scrollFrame = tableFrame
		window.inset = window.scrollFrame.inset
	end

	local bodyTop = GetBodyTop(window)
	window.scrollFrame:SetPoint("TOPLEFT", window, "TOPLEFT", OverviewConfig.sideInset, -bodyTop)
	window.scrollFrame:SetHeight(config.height - bodyTop - layout.bottom)
	window.scrollFrame:SetScrollStep(kind == "race" and OverviewConfig.medalList.minimumHeight or OverviewConfig.rows.minimumHeight)
	window.scrollFrame.rows = {}
	local heading = OverviewConfig.heading
	local insets = window.scrollFrame.contentInsets or OverviewConfig.contentInsets
	local headingWidth = width - insets.left - insets.right
	window.heading = window:CreateFontString(nil, "OVERLAY", heading.font)
	window.heading:SetFontObject(heading.font)
	window.heading:SetTextColor(unpack(heading.color))
	window.heading:SetPoint("TOP", window.scrollFrame.scrollFrame, "TOP", heading.x, bodyTop + insets.top - heading.y)
	window.heading:SetHeight(heading.height)
	if kind == "all" then
		window.heading:SetText(L["race.title.all-overview"])
	else
		local moreLeft = config.width + OverviewConfig.moreMenu.x - QuestOverviewFrame.moreMenu:GetWidth()
		local center = OverviewConfig.sideInset + insets.left + headingWidth / 2 + heading.x
		headingWidth = math.max(1, 2 * (moreLeft - heading.gap - center))
	end
	window.heading:SetWidth(headingWidth)
	window.heading:SetJustifyH("CENTER")
	window.heading:SetWordWrap(false)
	return window
end

local function CancelNPCTicker()
	if RaceOverviewFrame.npcTicker then
		RaceOverviewFrame.npcTicker:Cancel()
		RaceOverviewFrame.npcTicker = nil
	end
end

local function UpdateNPCTitle(npcID)
	CancelNPCTicker()
	SetWindowTitle(RaceOverviewFrame, addonName)
	local function TryName()
		local info = C_TooltipInfo.GetHyperlink(string.format("unit:Creature-0-0-0-0-%d-0", npcID))
		local name = info and info.lines and info.lines[1] and info.lines[1].leftText
		if name and name ~= "" then
			SetWindowTitle(RaceOverviewFrame, name)
			return true
		end
	end
	if TryName() then return end
	local attempts = 0
	RaceOverviewFrame.npcTicker = C_Timer.NewTicker(OverviewConfig.npcNameRetryInterval, function()
		attempts = attempts + 1
		if RaceOverviewFrame.state.npcID ~= npcID or not QuestOverviewFrame:IsVisible() or TryName() or attempts >= OverviewConfig.npcNameMaxAttempts then
			CancelNPCTicker()
		end
	end)
end

local function ResizeQuestWindow()
	local height = GossipFrame:GetHeight()
	if height <= 0 then
		height = OverviewConfig.questWindow.height
	end
	QuestOverviewFrame:SetHeight(math.max(height, OverviewConfig.questMinimumHeight))
	RefreshWindow(RaceOverviewFrame)
	RefreshWindow(ZoneOverviewFrame)
end

local function CreateMoreMenu()
	local config = OverviewConfig.moreMenu
	local button = CreateFrame("DropdownButton", nil, QuestOverviewFrame, "WowStyle1FilterDropdownTemplate")
	button.resizeToText = false
	button:SetPoint("TOPRIGHT", QuestOverviewFrame, "TOPRIGHT", config.x, config.y)
	button:SetText(L["race.menu.more"])
	local width = math.max(config.minimumWidth, math.ceil(button.Text:GetUnboundedStringWidth()) + config.arrowSize + config.textInset * 2)
	button:SetSize(width, config.height)
	button.Text:ClearAllPoints()
	button.Text:SetPoint("LEFT", config.textInset, 0)
	button.Text:SetPoint("RIGHT", -config.textInset, 0)
	button.Text:SetJustifyH("CENTER")
	button:SetMenuAnchor(AnchorUtil.CreateAnchor("TOPLEFT", button, "TOPRIGHT", config.menuGap, 0))
	button:SetupMenu(function(_, root)
		local allRaces = root:CreateButton(L["race.button.all-overview"], function()
			RaceTimeOverview:ShowAllOverview()
		end)
		AddMenuIcon(allRaces, config.icon)
	end)
	button:HookScript("OnHide", function(self)
		self:CloseMenu()
	end)
	QuestOverviewFrame.moreMenu = button
end

local function InitializeFrames()
	local config = AWL.Utils:CopyTable(OverviewConfig.questWindow)
	config.addonName, config.title = addonName, addonName
	QuestOverviewFrame = AWL.Frames:CreateWindow(config)
	SetPortrait(QuestOverviewFrame)
	QuestOverviewFrame:SetParent(GossipFrame)
	QuestOverviewFrame:ClearAllPoints()
	QuestOverviewFrame:SetPoint("TOPLEFT", GossipFrame, "TOPRIGHT", OverviewConfig.raceOffsetX, 0)
	QuestOverviewFrame:HookScript("OnHide", CancelNPCTicker)
	CreateDismissButton(QuestOverviewFrame)
	CreateMoreMenu()
	local tabs = AWL.Frames:CreateTabGroup(QuestOverviewFrame)
	RaceOverviewFrame = CreateOverviewWindow("race")
	ZoneOverviewFrame = CreateOverviewWindow("zone")
	tabs:SetOnTabChanged(function(_, page)
		QuestOverviewFrame.moreMenu:CloseMenu()
		if page then
			RefreshWindow(page)
		end
	end)
	GossipFrame:HookScript("OnSizeChanged", function()
		if QuestOverviewFrame:IsShown() then
			ResizeQuestWindow()
		end
	end)
	AllOverviewFrame = CreateOverviewWindow("all")
end

------------------------
--- Module Functions ---
------------------------

function RaceTimeOverview:Initialize()
	BuildGroups()
	InitializeFrames()
end

function RaceTimeOverview:ShowRaceOverview(npcID)
	local race = raceDataTable[npcID]
	if not race then return end
	CancelNPCTicker()
	RaceOverviewFrame.state.npcID = npcID
	if ZoneOverviewFrame.state.zoneID ~= race[2] then
		ZoneOverviewFrame.state.expandedRaces = {}
	end
	ZoneOverviewFrame.state.zoneID = race[2]
	QuestOverviewFrame.tabGroup:SelectTab("race")
	RequestNames(race[2])
	if race[3] > 0 then
		UpdateNPCTitle(npcID)
	end
	ResizeQuestWindow()
	QuestOverviewFrame:Show()
	RaceOverviewFrame.scrollFrame:ScrollToTop()
	ZoneOverviewFrame.scrollFrame:ScrollToTop()
end

function RaceTimeOverview:HideRaceOverview()
	QuestOverviewFrame:Hide()
end

function RaceTimeOverview:ShowAllOverview()
	if not AllOverviewFrame then return end
	if not AllOverviewFrame.state.opened then
		local zoneID = FindCurrentZone()
		local continentID = GetContinentID(C_Map.GetBestMapForUnit("player"))
		if continentID ~= 0 then
			AllOverviewFrame.state.expandedContinents[continentID] = true
		end
		if zoneID then
			AllOverviewFrame.state.expandedContinents[groupsByZone[zoneID].continentID] = true
			AllOverviewFrame.state.expandedZones[zoneID] = true
		end
		AllOverviewFrame.state.opened = true
	end
	RequestNames()
	RefreshWindow(AllOverviewFrame)
	AllOverviewFrame:Show()
	AllOverviewFrame.scrollFrame:ScrollToTop()
end

function RaceTimeOverview:ToggleAllOverview()
	if not AllOverviewFrame then return end
	if AllOverviewFrame:IsShown() then
		AllOverviewFrame:Hide()
	else
		self:ShowAllOverview()
	end
end
