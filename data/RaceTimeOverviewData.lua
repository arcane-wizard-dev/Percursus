local _, PER = ...

PER.RACE_TIME_OVERVIEW_DATA = {
	raceWindow = {
		width = 338, height = 430,
		style = "standard", backgroundAlpha = 1,
		showPortrait = true, showCloseButton = true,
		movable = false, closeOnEscape = false
	},
	zoneWindow = {
		width = 343, height = 430,
		style = "standard", backgroundAlpha = 1,
		showPortrait = false, showCloseButton = false,
		movable = false, closeOnEscape = false
	},
	inset = {width = 322, height = 330, bottom = 37, backgroundStyle = "character", backgroundAlpha = 1},
	contentInsets = {left = 15, right = 25, top = 15, bottom = 15},
	raceOffsetX = 15,
	zoneOffsetX = 10,
	zoneInsetOffsetX = 2.5,
	openButtonWidth = 130,
	closeButtonWidth = 100
}
