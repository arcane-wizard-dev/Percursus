local _, PER = ...

PER.RACE_ORDER = {"RACE_1", "RACE_2", "RACE_3", "RACE_4", "RACE_5", "RACE_6"}
PER.DIFFICULTY_ORDER = {"NORMAL", "ADVANCED", "REVERSE", "CHALLENGE", "CHALLENGE_REVERSE", "STORM_GRYPHON"}

--------------------
--- Data Sorting ---
--------------------

local raceDataTable = PER.RACE_DATA
PER.SORTED_RACE_DATA = {}
local sortedRaceDataTable = PER.SORTED_RACE_DATA

for raceID, dataWrapper in pairs(raceDataTable) do
	local order, zoneID, count, modes = unpack(dataWrapper)
	table.insert(sortedRaceDataTable, {raceID = raceID, order = order, zoneID = zoneID, count = count, modes = modes})
end

table.sort(sortedRaceDataTable, function(a, b) return a.order < b.order end)
