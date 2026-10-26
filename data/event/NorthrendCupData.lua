local _, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

if PER.RACE_DATA == nil then
	PER.RACE_DATA = {}
end

local raceDataTable = PER.RACE_DATA

-- Northrend Cup
-- Scalawag Slither R1 (Halunkeneck-Heuler) - R-12.1.0
raceDataTable[211762] = {
	030101, 113, 0, {
		NORMAL            = {78301, 2720, 425090, 73, 78},
		ADVANCED          = {78302, 2738, 425091, 68, 71},
		REVERSE           = {78303, 2756, 425092, 70, 73}
	}
}
-- Daggercap Dart R2 (Dolchbucht-Durchrasen) - R-12.1.0
raceDataTable[211886] = {
	030102, 113, 0, {
		NORMAL            = {78325, 2721, 425333, 77, 82},
		ADVANCED          = {78326, 2739, 425334, 76, 79},
		REVERSE           = {78327, 2757, 425335, 76, 79}
	}
}
-- Blackriver Burble R3 (Schwarzwassersprudeln) - R-12.1.0
raceDataTable[211940] = {
	030103, 113, 0, {
		NORMAL            = {78334, 2722, 425449, 75, 80},
		ADVANCED          = {78335, 2740, 425450, 67, 70},
		REVERSE           = {78336, 2758, 425452, 71, 74}
	}
}
-- Zul'Drak Zephyr R4 (Zul'Drak-Zephir) - R-12.1.0
raceDataTable[212003] = {
	030104, 113, 0, {
		NORMAL            = {78346, 2723, 425597, 65, 70},
		ADVANCED          = {78347, 2741, 425598, 62, 65},
		REVERSE           = {78349, 2759, 425601, 67, 70}
	}
}
-- The Makers' Marathon R5 (Schaulauf der Schöpfer) - R-12.1.0
raceDataTable[212118] = {
	030105, 113, 0, {
		NORMAL            = {78389, 2724, 425740, 100, 105},
		ADVANCED          = {78390, 2742, 425741, 93, 96},
		REVERSE           = {78391, 2760, 425742, 98, 101}
	}
}
-- Crystalsong Crisis R6 (Kristallsangkrise) - R-12.1.0
raceDataTable[212193] = {
	030106, 113, 0, {
		NORMAL            = {78441, 2725, 426038, 97, 102},
		ADVANCED          = {78442, 2743, 426039, 94, 97},
		REVERSE           = {78443, 2761, 426040, 96, 99}
	}
}
-- Dragonblight Dragon Flight R7 (Drachenödendrachenflug) - R-12.1.0
raceDataTable[212250] = {
	030107, 113, 0, {
		NORMAL            = {78454, 2726, 426109, 115, 120},
		ADVANCED          = {78455, 2744, 426110, 110, 113},
		REVERSE           = {78456, 2762, 426111, 110, 113}
	}
}
-- Citadel Sortie R8 (Zitadellenzugabe) - R-12.1.0
raceDataTable[212418] = {
	030108, 113, 0, {
		NORMAL            = {78499, 2727, 426347, 110, 115},
		ADVANCED          = {78500, 2745, 426348, 103, 106},
		REVERSE           = {78501, 2763, 426349, 104, 107}
	}
}
-- Sholazar Spree R9 (Sholazarraserei) - R-12.1.0
raceDataTable[212666] = {
	030109, 113, 0, {
		NORMAL            = {78558, 2728, 426583, 88, 93},
		ADVANCED          = {78559, 2746, 426584, 85, 88},
		REVERSE           = {78560, 2764, 426585, 85, 88}
	}
}
-- Geothermal Jaunt R10 (Geothermischer Galopp) - R-12.1.0
raceDataTable[213086] = {
	030110, 113, 0, {
		NORMAL            = {78608, 2729, 427231, 45, 50},
		ADVANCED          = {78609, 2747, 427234, 37, 40},
		REVERSE           = {78610, 2765, 427235, 37, 40}
	}
}
-- Gundrak Fast Track R11 (Gundrak-Überholspur) - R-12.1.0
raceDataTable[215795] = {
	030111, 113, 0, {
		NORMAL            = {79268, 2730, 431833, 60, 65},
		ADVANCED          = {79269, 2748, 431834, 57, 60},
		REVERSE           = {79270, 2766, 431835, 57, 60}
	}
}
-- Coldarra Climb R12 (Kaltarraaufstieg) - R-12.1.0
raceDataTable[215825] = {
	030112, 113, 0, {
		NORMAL            = {79272, 2731, 431898, 57, 62},
		ADVANCED          = {79273, 2749, 431899, 53, 56},
		REVERSE           = {79274, 2767, 431900, 55, 58}
	}
}
