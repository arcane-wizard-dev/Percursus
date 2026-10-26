local _, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

if PER.RACE_DATA == nil then
	PER.RACE_DATA = {}
end

local raceDataTable = PER.RACE_DATA

-- Outland Cup
-- Hellfire Hustle R1 (Höllenfeuerhatz) - R-12.0.1
raceDataTable[208246] = {
	020101, 101, 0, {
		NORMAL            = {77102, 2600, 417042, 75, 80},
		ADVANCED          = {77103, 2615, 417043, 73, 76},
		REVERSE           = {77104, 2630, 417044, 72, 75}
	}
}
-- Coilfang Caper R2 (Echsenkesseleskapade) - R-12.0.1
raceDataTable[208318] = {
	020102, 101, 0, {
		NORMAL            = {77169, 2601, 417226, 75, 80},
		ADVANCED          = {77170, 2616, 417230, 70, 73},
		REVERSE           = {77171, 2631, 417231, 70, 73}
	}
}
-- Blade's Edge Brawl R3 (Schergratschererei) - R-12.0.1
raceDataTable[208488] = {
	020103, 101, 0, {
		NORMAL            = {77205, 2602, 417604, 75, 80},
		ADVANCED          = {77206, 2617, 417605, 72, 75},
		REVERSE           = {77207, 2632, 417606, 75, 78}
	}
}
-- } -- Telaar Tear R4 (Telaartrauma) - R-12.0.1
raceDataTable[208540] = {
	020104, 101, 0, {
		NORMAL            = {77238, 2603, 417758, 64, 69},
		ADVANCED          = {77239, 2618, 417760, 57, 60},
		REVERSE           = {77240, 2633, 417761, 58, 61}
	}
}
-- Razorthorn Rise Rush R5 (Messerdornhöhenhast) - R-12.0.1
raceDataTable[208576] = {
	020105, 101, 0, {
		NORMAL            = {77260, 2604, 417869, 67, 72},
		ADVANCED          = {77261, 2619, 417870, 54, 57},
		REVERSE           = {77262, 2634, 417871, 54, 57}
	}
}
-- Auchindoun Coaster R6 (Auchindoundreh) - R-12.0.1
raceDataTable[208596] = {
	020106, 101, 0, {
		NORMAL            = {77264, 2605, 417948, 73, 78},
		ADVANCED          = {77265, 2620, 417949, 70, 73},
		REVERSE           = {77266, 2635, 417950, 70, 73}
	}
}
-- Tempest Keep Sweep R7 (Feger der Festung der Stürme) - R-12.0.1
raceDataTable[208625] = {
	020107, 101, 0, {
		NORMAL            = {77278, 2606, 418026, 100, 105},
		ADVANCED          = {77279, 2621, 418027, 87, 90},
		REVERSE           = {77280, 2636, 418028, 88, 91}
	}
}
-- Shattrath City Sashay R8 (Shattrathsegelei) - R-12.0.1
raceDataTable[208673] = {
	020108, 101, 0, {
		NORMAL            = {77322, 2607, 418142, 75, 80},
		ADVANCED          = {77323, 2622, 418143, 65, 68},
		REVERSE           = {77324, 2637, 418144, 66, 69}
	}
}
-- Shadowmoon Slam R9 (Schattenmondsprint) - R-12.0.1
raceDataTable[208748] = {
	020109, 101, 0, {
		NORMAL            = {77346, 2608, 418287, 70, 75},
		ADVANCED          = {77347, 2623, 418288, 63, 66},
		REVERSE           = {77348, 2638, 418289, 63, 66}
	}
}
-- Eco-Dome Excursion R10 (Biokuppelbahn) - R-12.0.1
raceDataTable[208803] = {
	020110, 101, 0, {
		NORMAL            = {77398, 2609, 418461, 115, 120},
		ADVANCED          = {77399, 2624, 418465, 109, 112},
		REVERSE           = {77400, 2639, 418466, 110, 113}
	}
}
-- Warmaul Wingding R11 (Totschlägertransit) - R-12.0.1
raceDataTable[209150] = {
	020111, 101, 0, {
		NORMAL            = {77589, 2610, 419432, 80, 85},
		ADVANCED          = {77591, 2625, 419433, 72, 75},
		REVERSE           = {77593, 2640, 419434, 73, 76}
	}
}
-- Skettis Scramble R12 (Skettissause) - R-12.0.1
raceDataTable[209234] = {
	020112, 101, 0, {
		NORMAL            = {77645, 2611, 419679, 70, 75},
		ADVANCED          = {77646, 2626, 419680, 63, 66},
		REVERSE           = {77647, 2641, 419681, 63, 66}
	}
}
-- Fel Pit Fracas R13 (Teufelsgrubentumult) - R-12.0.1
raceDataTable[209424] = {
	020113, 101, 0, {
		NORMAL            = {77684, 2612, 420157, 77, 82},
		ADVANCED          = {77685, 2627, 420158, 73, 76},
		REVERSE           = {77686, 2642, 420159, 76, 79}
	}
}
