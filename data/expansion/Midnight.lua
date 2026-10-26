local _, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

if PER.RACE_DATA == nil then
	PER.RACE_DATA = {}
end

local raceDataTable = PER.RACE_DATA

-- Midnight
-- Housing - Going Postal (Behausungen - Ab die Post)
-- Alliance (Allianz) - R-12.0.1
raceDataTable[260942] = {
	120101, 2352, 1, {
		RACE_1 = {95407, 3431, 1284967, 105, 120},
		RACE_2 = {95408, 3432, 1284968, 105, 120},
		RACE_3 = {95409, 3433, 1284969, 105, 120}
	}
}
-- Horde (Horde) - R-12.0.1
raceDataTable[260943] = {
	120201, 2351, 1, {
		RACE_1 = {95410, 3434, 1284970, 105, 120},
		RACE_2 = {95411, 3435, 1284971, 105, 120},
		RACE_3 = {95412, 3436, 1284972, 105, 120}
	}
}
