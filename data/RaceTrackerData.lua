local _, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

PER.RACE_TRACKER_DATA = {
	countdownDelay = 5,
	updateInterval = 0.03,
	raceAuraSpellID = 369968,
	speedPercentPerUnit = 208
}
