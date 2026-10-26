local _, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

if PER.RACE_DATA == nil then
	PER.RACE_DATA = {}
end

local raceDataTable = PER.RACE_DATA

-- Eastern Kingdom Cup
-- Gilneas Gambit R1 (Gilneasgambit) - R-11.2.0
raceDataTable[206246] = {
	010201, 13, 0, {
		NORMAL            = {76309, 2536, 413655, 78, 83},
		ADVANCED          = {76310, 2552, 413690, 74, 77},
		REVERSE           = {76311, 2568, 413695, 74, 77}
	}
}
-- Loch Modan Loop R2 (Luftspaß von Loch Modan) - R-11.2.0
raceDataTable[206461] = {
	010202, 13, 0, {
		NORMAL            = {76339, 2537, 413778, 63, 68},
		ADVANCED          = {76340, 2553, 413779, 61, 64},
		REVERSE           = {76341, 2569, 413780, 63, 66}
	}
}
-- Searing Slalom R3 (Sengslalom) - R-11.2.0
raceDataTable[206618] = {
	010203, 13, 0, {
		NORMAL            = {76357, 2538, 413851, 52, 57},
		ADVANCED          = {76358, 2554, 413852, 46, 49},
		REVERSE           = {76359, 2570, 413854, 43, 46}
	}
}
-- Twilight Terror R4 (Schattenschrecken) - R-11.2.0
raceDataTable[206764] = {
	010204, 13, 0, {
		NORMAL            = {76364, 2539, 413940, 73, 78},
		ADVANCED          = {76365, 2555, 413941, 68, 71},
		REVERSE           = {76366, 2571, 413942, 66, 69}
	}
}
-- Deadwind Derby R5 (Totenwindtour) - R-11.2.0
raceDataTable[206823] = {
	010205, 13, 0, {
		NORMAL            = {76380, 2540, 413966, 60, 65},
		ADVANCED          = {76381, 2556, 413967, 59, 62},
		REVERSE           = {76382, 2572, 413968, 59, 62}
	}
}
-- Elwynn Forest Flash R6 (Elwynnetappe) - R-11.2.0
raceDataTable[206893] = {
	010206, 13, 0, {
		NORMAL            = {76397, 2541, 414016, 73, 78},
		ADVANCED          = {76399, 2557, 414017, 66, 69},
		REVERSE           = {76400, 2573, 414018, 63, 66}
	}
}
-- Gurubashi Gala R7 (Gurubashigala) - R-11.2.0
raceDataTable[207163] = {
	010207, 13, 0, {
		NORMAL            = {76438, 2542, 414349, 56, 61},
		ADVANCED          = {76439, 2558, 414350, 49, 52},
		REVERSE           = {76440, 2574, 414351, 50, 53}
	}
}
-- Ironforge Interceptor R8 (Eisenschmiedeerkundung) - R-11.2.0
raceDataTable[207173] = {
	010208, 13, 0, {
		NORMAL            = {76445, 2543, 414368, 70, 75},
		ADVANCED          = {76446, 2559, 414372, 64, 67},
		REVERSE           = {76447, 2575, 414374, 60, 63}
	}
}
-- Blasted Lands Bolt R9 (Funke der Verwüsteten Lande) - R-11.2.0
raceDataTable[207357] = {
	010209, 13, 0, {
		NORMAL            = {76469, 2544, 414616, 69, 74},
		ADVANCED          = {76470, 2560, 414617, 62, 65},
		REVERSE           = {76471, 2576, 414618, 64, 67}
	}
}
-- Plaguelands Plunge R10 (Pestländerprüfung) - R-11.2.0
raceDataTable[207448] = {
	010210, 13, 0, {
		NORMAL            = {76510, 2545, 414740, 63, 68},
		ADVANCED          = {76512, 2561, 414741, 53, 56},
		REVERSE           = {76513, 2577, 414742, 58, 61}
	}
}
-- Booty Bay Blast R11 (Beutebuchtgeballer) - R-11.2.0
raceDataTable[207455] = {
	010211, 13, 0, {
		NORMAL            = {76515, 2546, 414751, 63, 68},
		ADVANCED          = {76516, 2562, 414755, 57, 60},
		REVERSE           = {76517, 2578, 414756, 56, 59}
	}
}
-- Fuselight Night Flight R12 (Luntenbrand-Rundenstunt) - R-11.2.0
raceDataTable[207467] = {
	010212, 13, 0, {
		NORMAL            = {76523, 2547, 414773, 64, 69},
		ADVANCED          = {76524, 2563, 414774, 58, 61},
		REVERSE           = {76525, 2579, 414775, 58, 61}
	}
}
-- Krazzworks Klash R13 (Krazzwerke-Kaos) - R-11.2.0
raceDataTable[207485] = {
	010213, 13, 0, {
		NORMAL            = {76527, 2548, 414829, 71, 76},
		ADVANCED          = {76528, 2564, 414830, 64, 67},
		REVERSE           = {76529, 2580, 414831, 62, 65}
	}
}
-- Redridge Rally R14 (Rotkammrally) - R-11.2.0
raceDataTable[207524] = {
	010214, 13, 0, {
		NORMAL            = {76536, 2549, 414891, 57, 62},
		ADVANCED          = {76537, 2565, 414892, 52, 55},
		REVERSE           = {76538, 2581, 414893, 52, 55}
	}
}
