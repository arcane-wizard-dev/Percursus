local _, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

if PER.RACE_DATA == nil then
	PER.RACE_DATA = {}
end

local raceDataTable = PER.RACE_DATA

-- The War Within
-- Isle of Dorn Z1 (Insel von Dorn)
-- Dornogal Drift R1 (Dornogaldrift) - R-11.0.5
raceDataTable[219542] = {
	110101, 2248, 0, {
		NORMAL   = {80219, 2923, 439233, 48, 53},
		ADVANCED = {80225, 2929, 439241, 43, 46},
		REVERSE  = {80231, 2935, 439248, 43, 46}
	}
}
-- Storm Watch's Survey R2 (Sturmpostenstudie) - R-11.0.5
raceDataTable[219544] = {
	110102, 2248, 0, {
		NORMAL   = {80220, 2924, 439234, 63, 68},
		ADVANCED = {80226, 2930, 439243, 60, 63},
		REVERSE  = {80232, 2936, 439249, 62, 65}
	}
}
-- Basin Bypass R3 (Beckenbypass) - R-11.0.5
raceDataTable[219547] = {
	110103, 2248, 0, {
		NORMAL   = {80221, 2925, 439235, 58, 63},
		ADVANCED = {80227, 2931, 439244, 54, 57},
		REVERSE  = {80233, 2937, 439250, 57, 60}
	}
}
-- The Wold Ways R4 (Die Holtzwege) - R-11.0.5
raceDataTable[219548] = {
	110104, 2248, 0, {
		NORMAL   = {80222, 2926, 439236, 68, 73},
		ADVANCED = {80228, 2932, 439245, 68, 71},
		REVERSE  = {80234, 2938, 439251, 70, 73}
	}
}
-- Thunderhead Trail R5 (Donnerkopfdreh) - R-11.0.5
raceDataTable[219549] = {
	110105, 2248, 0, {
		NORMAL   = {80223, 2927, 439238, 70, 75},
		ADVANCED = {80229, 2933, 439246, 66, 69},
		REVERSE  = {80235, 2939, 439252, 66, 69}
	}
}
-- Orecreg's Doglegs R6 (Erzgrubenecken) - R-11.0.5
raceDataTable[219550] = {
	110106, 2248, 0, {
		NORMAL   = {80224, 2928, 439239, 65, 70},
		ADVANCED = {80230, 2934, 439247, 61, 64},
		REVERSE  = {80236, 2940, 439254, 61, 64}
	}
}

-- The Ringing Deeps Z2 (Die Schallenden Tiefen)
-- Earthenworks Weave R1 (Erdwerkeweberei) - R-11.0.5
raceDataTable[219551] = {
	110201, 2214, 0, {
		NORMAL 	 = {80237, 2941, 439257, 52, 57},
		ADVANCED = {80244, 2947, 439265, 49, 52},
		REVERSE  = {80250, 2953, 439271, 50, 53}
	}
}
-- Ringing Deeps Ramble R2 (Schallende-Tiefen-Spektakel) - R-11.0.5
raceDataTable[219552] = {
	110202, 2214, 0, {
		NORMAL 	 = {80238, 2942, 439258, 57, 62},
		ADVANCED = {80245, 2948, 439266, 53, 56},
		REVERSE  = {80251, 2954, 439272, 53, 56}
	}
}
-- Chittering Concourse R3 (Zirpendes Zusammentreffen) - R-11.0.5
raceDataTable[219553] = {
	110203, 2214, 0, {
		NORMAL 	 = {80239, 2943, 439260, 56, 61},
		ADVANCED = {80246, 2949, 439267, 53, 56},
		REVERSE  = {80252, 2955, 439273, 54, 57}
	}
}
-- Cataract River Cruise R4 (Kataraktflussfahrt) - R-11.0.5
raceDataTable[219554] = {
	110204, 2214, 0, {
		NORMAL 	 = {80240, 2944, 439261, 60, 65},
		ADVANCED = {80247, 2950, 439268, 58, 61},
		REVERSE  = {80253, 2956, 439274, 57, 60}
	}
}
-- Taelloch Twist R5 (Taellochtrick) - R-11.0.5
raceDataTable[219555] = {
	110205, 2214, 0, {
		NORMAL 	 = {80242, 2945, 439262, 47, 52},
		ADVANCED = {80248, 2951, 439269, 43, 46},
		REVERSE  = {80254, 2957, 439275, 44, 47}
	}
}
-- Opportunity Point Amble R6 (Chancenspitzenchance) - R-11.0.5
raceDataTable[219556] = {
	110206, 2214, 0, {
		NORMAL 	 = {80243, 2946, 439263, 77, 82},
		ADVANCED = {80249, 2952, 439270, 71, 74},
		REVERSE  = {80255, 2958, 439276, 72, 75}
	}
}

-- Hallowfall Z3 (Heilsturz)
-- Dunelle's Detour R1 (Dunelles gute Güte) - R-11.0.5
raceDataTable[219557] = {
	110301, 2215, 0, {
		NORMAL    = {80256, 2959, 439277, 65, 70},
		ADVANCED  = {80265, 2965, 439286, 62, 65},
		REVERSE   = {80271, 2971, 439292, 64, 67}
	}
}
-- Tenir's Traversal R2 (Tenirs Traversale) - R-11.0.5
raceDataTable[219558] = {
	110302, 2215, 0, {
		NORMAL    = {80257, 2960, 439278, 65, 70},
		ADVANCED  = {80266, 2966, 439287, 60, 63},
		REVERSE   = {80272, 2972, 439293, 63, 66}
	}
}
-- Light's Redoubt Descent R3 (Lichtschanzensturz) - R-11.0.5
raceDataTable[219559] = {
	110303, 2215, 0, {
		NORMAL    = {80258, 2961, 439281, 63, 68},
		ADVANCED  = {80267, 2967, 439288, 62, 65},
		REVERSE   = {80273, 2973, 439294, 62, 65}
	}
}
-- Stillstone Slalom R4 (Stillsteinslalom) - R-11.0.5
raceDataTable[219560] = {
	110304, 2215, 0, {
		NORMAL    = {80259, 2962, 439282, 56, 61},
		ADVANCED  = {80268, 2968, 439289, 54, 57},
		REVERSE   = {80274, 2974, 439295, 56, 59}
	}
}
-- Mereldar Meander R5 (Mereldarmäander) - R-11.0.5
raceDataTable[219561] = {
	110305, 2215, 0, {
		NORMAL    = {80260, 2963, 439283, 76, 81},
		ADVANCED  = {80269, 2969, 439290, 71, 74},
		REVERSE   = {80275, 2975, 439296, 71, 74}
	}
}
-- Velhan's Venture R6 (Velhans Vorstoß) - R-11.0.5
raceDataTable[219562] = {
	110306, 2215, 0, {
		NORMAL    = {80261, 2964, 439284, 55, 60},
		ADVANCED  = {80270, 2970, 439291, 50, 53},
		REVERSE   = {80276, 2976, 439298, 50, 53}
	}
}

-- Azj-Kahet Z5 (Azj-Kahet)
-- City of Threads Twist R1 (Stadt-der-Fäden-Sause) - R-11.0.5
raceDataTable[219564] = {
	110501, 2255, 0, {
		NORMAL    = {80277, 2977, 439300, 78, 83},
		ADVANCED  = {80283, 2983, 439307, 74, 77},
		REVERSE   = {80289, 2989, 439316, 74, 77}
	}
}
-- Maddening Deep Dip R2 (Tiefenrausch des Wahnsinns) - R-11.0.5
raceDataTable[219565] = {
	110502, 2255, 0, {
		NORMAL    = {80278, 2978, 439301, 58, 63},
		ADVANCED  = {80284, 2984, 439308, 54, 57},
		REVERSE   = {80290, 2990, 439317, 56, 59}
	}
}
-- The Weaver's Wing R3 (Der Wind der Weberin) - R-11.0.5
raceDataTable[219567] = {
	110503, 2255, 0, {
		NORMAL    = {80279, 2979, 439302, 54, 59},
		ADVANCED  = {80285, 2985, 439309, 51, 54},
		REVERSE   = {80291, 2991, 439318, 50, 53}
	}
}
-- Rak-Ahat Rush R4 (Rak-Ahat-Rausch) - R-11.0.5
raceDataTable[219568] = {
	110504, 2255, 0, {
		NORMAL    = {80280, 2980, 439303, 70, 75},
		ADVANCED  = {80286, 2986, 439310, 66, 69},
		REVERSE   = {80292, 2992, 439319, 66, 69}
	}
}
-- Pit Plunge R5 (Grubengerangel) - R-11.0.5
raceDataTable[219569] = {
	110505, 2255, 0, {
		NORMAL    = {80281, 2981, 439304, 63, 68},
		ADVANCED  = {80287, 2987, 439311, 61, 64},
		REVERSE   = {80293, 2993, 439320, 61, 64}
	}
}
-- Siegehold Scuttle R6 (Belagerungsfestenbestrebung) - R-11.0.5
raceDataTable[219570] = {
	110506, 2255, 0, {
		NORMAL    = {80282, 2982, 439305, 70, 75},
		ADVANCED  = {80288, 2988, 439313, 66, 69},
		REVERSE   = {80294, 2994, 439321, 63, 66}
	}
}

-- Undermine Z6 (Lorenhall)
-- Skyrocketing Sprint R1 (Raktenrennen) - PTR-11.1.0
raceDataTable[231793] = {
	110601, 2346, 0, {
		NORMAL    = {85071, 3119, 466395, 32, 42},
		REVERSE   = {85096, 3121, 466619, 32, 42}
	}
}
-- The Heaps Leap R2 (Haldenhpüfer) - PTR-11.1.0
raceDataTable[231879] = {
	110602, 2346, 0, {
		NORMAL    = {85097, 3122, 466624, 33, 43},
		REVERSE   = {85098, 3123, 466626, 33, 43}
	}
}
-- Scrapshop Shot R3 (Schrottladenchance) - PTR-11.1.0
raceDataTable[231893] = {
	110603, 2346, 0, {
		NORMAL    = {85099, 3124, 466629, 36, 46},
		REVERSE   = {85100, 3125, 466631, 36, 46}
	}
}
-- Rags to Riches Rush R4 (Tellerwäschertriumph) - PTR-11.1.0
raceDataTable[231900] = {
	110604, 2346, 0, {
		NORMAL    = {85101, 3126, 466632, 40, 50},
		REVERSE   = {85102, 3127, 466634, 40, 50}
	}
}
-- Breakneck Bolt R5 (Halsbrecherblitz) - PTR-11.1.0
raceDataTable[233917] = {
	110605, 2346, 0, {
		NORMAL    = {85900, 3181, 471625, 35, 40},
		REVERSE   = {85901, 3182, 471626, 35, 40}
	}
}
-- Junkyard Jaunt R6 (Schrottplatzspurt) - PTR-11.1.0
raceDataTable[233918] = {
	110606, 2346, 0, {
		NORMAL    = {85902, 3183, 471627, 35, 40},
		REVERSE   = {85903, 3184, 471628, 35, 40}
	}
}
-- Casino Cruise R7 (Casinokurs) - PTR-11.1.0
raceDataTable[233919] = {
	110607, 2346, 0, {
		NORMAL    = {85904, 3185, 471629, 30, 35},
		REVERSE   = {85905, 3186, 471630, 30, 35}
	}
}
-- Sandy Scuttle R8 (Grundgekrabbel) - PTR-11.1.0
raceDataTable[233920] = {
	110608, 2346, 0, {
		NORMAL    = {85906, 3187, 471631, 33, 38},
		REVERSE   = {85907, 3188, 471632, 33, 38}
	}
}

-- K'aresh Z7 (K'aresh)
-- Oasis Overdrive R1 - 11.2.0
raceDataTable[234643] = {
	110701, 2371, 0, {
		NORMAL    = {86339, 3213, 473850, 57, 62},
		ADVANCED  = {86340, 3214, 473851, 54, 57},
		REVERSE   = {86341, 3215, 473852, 54, 57}
	}
}
