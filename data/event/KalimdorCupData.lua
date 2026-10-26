local _, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

if PER.RACE_DATA == nil then
	PER.RACE_DATA = {}
end

local raceDataTable = PER.RACE_DATA

-- Kalimdor Cup
-- Felwood Flyover R1 (Teufelswaldtour) - R-11.0.7
raceDataTable[203479] = {
	010101, 12, 0, {
		NORMAL            = {75277, 2312, 406257, 70, 75},
		ADVANCED          = {75293, 2342, 406294, 63, 66},
		REVERSE           = {75294, 2372, 406297, 62, 65}
	}
}
-- Winter Wander R2 (Winterwanderung) - R-11.0.7
raceDataTable[203605] = {
	010102, 12, 0, {
		NORMAL            = {75310, 2313, 406398, 80, 85},
		ADVANCED          = {75311, 2343, 406400, 73, 76},
		REVERSE           = {75312, 2373, 406401, 70, 73}
	}
}
-- Nordrassil Spiral R3 (Nordrassilspirale) - R-11.0.7
raceDataTable[203617] = {
	010103, 12, 0, {
		NORMAL            = {75317, 2314, 406420, 45, 50},
		ADVANCED          = {75318, 2344, 406421, 41, 46},
		REVERSE           = {75319, 2374, 406422, 41, 46}
	}
}
-- Hyjal Hotfoot R4 (Hyjalheißfuß) - R-11.0.7
raceDataTable[203626] = {
	010104, 12, 0, {
		NORMAL            = {75330, 2315, 406438, 70, 75},
		ADVANCED          = {75331, 2345, 406439, 69, 72},
		REVERSE           = {75332, 2375, 406440, 67, 72}
	}
}
-- Rocketway Ride R5 (Raketenbahnritt) - R-11.0.7
raceDataTable[203657] = {
	010105, 12, 0, {
		NORMAL            = {75347, 2316, 406506, 101, 106},
		ADVANCED          = {75355, 2346, 406507, 94, 100},
		REVERSE           = {75356, 2376, 406508, 94, 100}
	}
}
-- Ashenvale Ambit R6 (Eschentalecke) - R-11.0.7
raceDataTable[203712] = {
	010106, 12, 0, {
		NORMAL            = {75378, 2317, 406696, 64, 69},
		ADVANCED          = {75379, 2347, 406697, 59, 64},
		REVERSE           = {75380, 2377, 406698, 59, 64}
	}
}
-- Durotar Tour R7 (Durotardurchquerung) - R-11.0.7
raceDataTable[203722] = {
	010107, 12, 0, {
		NORMAL            = {75385, 2318, 406766, 82, 87},
		ADVANCED          = {75386, 2348, 406767, 75, 80},
		REVERSE           = {75387, 2378, 406768, 75, 80}
	}
}
-- Webwinder Weave R8 (Webergewebe) - R-11.0.7
raceDataTable[203735] = {
	010108, 12, 0, {
		NORMAL            = {75394, 2319, 406799, 80, 85},
		ADVANCED          = {75395, 2349, 406800, 73, 78},
		REVERSE           = {75396, 2379, 406801, 70, 75}
	}
}
-- Desolace Drift R9 (Desolacedrift) - R-11.0.7
raceDataTable[203788] = {
	010109, 12, 0, {
		NORMAL            = {75409, 2320, 406923, 78, 83},
		ADVANCED          = {75410, 2350, 406924, 70, 75},
		REVERSE           = {75411, 2380, 406925, 71, 76}
	}
}
-- Great Divide Dive R10 (Großer Schluchtsturzflug) - R-11.0.7
raceDataTable[203793] = {
	010110, 12, 0, {
		NORMAL            = {75412, 2321, 406943, 48, 53},
		ADVANCED          = {75413, 2351, 406944, 43, 48},
		REVERSE           = {75414, 2381, 406945, 44, 49}
	}
}
-- Razorfen Roundabout R11 (Klingenhauerkreisel) - R-11.0.7
raceDataTable[203908] = {
	010111, 12, 0, {
		NORMAL            = {75437, 2322, 407214, 53, 58},
		ADVANCED          = {75438, 2352, 407215, 47, 52},
		REVERSE           = {75439, 2382, 407216, 48, 53}
	}
}
-- Thousand Needles Thread R12 (Faden der Tausend Nadeln) - R-11.0.7
raceDataTable[204043] = {
	010112, 12, 0, {
		NORMAL            = {75463, 2323, 407529, 87, 92},
		ADVANCED          = {75464, 2353, 407530, 77, 82},
		REVERSE           = {75465, 2383, 407531, 77, 82}
	}
}
-- Feralas Ruins Ramble R13 (Feralasschuttstreifzug) - R-11.0.7
raceDataTable[204080] = {
	010113, 12, 0, {
		NORMAL            = {75468, 2324, 407593, 89, 94},
		ADVANCED          = {75469, 2354, 407594, 84, 89},
		REVERSE           = {75470, 2384, 407595, 84, 89}
	}
}
-- Ahn'Qiraj Circuit R14 (Ausmaß von Ahn'Qiraj) - R-11.0.7
raceDataTable[204092] = {
	010114, 12, 0, {
		NORMAL            = {75472, 2325, 407619, 77, 82},
		ADVANCED          = {75473, 2355, 407620, 68, 73},
		REVERSE           = {75474, 2385, 407621, 69, 74}
	}
}
-- Uldum Tour R15 (Uldumumkreis) - R-11.0.7
raceDataTable[204128] = {
	010115, 12, 0, {
		NORMAL            = {75481, 2326, 407717, 84, 89},
		ADVANCED          = {75482, 2356, 407718, 76, 81},
		REVERSE           = {75483, 2386, 407719, 76, 81}
	}
}
-- Un'Goro Crater Circuit R16 (Kraterkreisel von Un'Goro) - R-11.0.7
raceDataTable[204146] = {
	010116, 12, 0, {
		NORMAL            = {75485, 2327, 407756, 100, 105},
		ADVANCED          = {75486, 2357, 407757, 90, 95},
		REVERSE           = {75487, 2387, 407758, 92, 97}
	}
}
