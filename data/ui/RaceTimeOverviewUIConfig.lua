local _, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

PER.UIConfig.RaceTimeOverview = {
	colors = {
		separator = {0.65, 0.55, 0.35, 0.2}
	},
	medals = {
		gold = {icon = 616373, color = "ffffd100"},
		silver = {icon = 616375, color = "ffC0C0C0"},
		bronze = {icon = 616372, color = "ffCD7F32"}
	},
	missingTableTime = "-",
	missingTimeIcon = "Interface\\AddOns\\Percursus\\assets\\races\\no-time.tga",
	filters = {
		{value = "all", text = "race.filter.all"},
		{value = "no-gold", text = "race.filter.no-gold"},
		{value = "no-time", text = "race.filter.no-time"}
	},
	fonts = {
		body = "GameFontHighlightSmall",
		group = "GameFontNormalSmall"
	},
	questWindow = {
		width = 425,
		height = 490,
		style = "standard",
		backgroundAlpha = 1,
		showPortrait = true,
		showCloseButton = true,
		movable = false,
		closeOnEscape = false
	},
	portrait = {x = -5, y = 8},
	heading = {x = 5, y = 38, gap = 8, height = 20, font = "Fancy16Font", color = {1, 0.82, 0}},
	menuItem = {padding = 4, height = 20, textOffsetY = -2, iconGap = 6},
	menuIcons = {
		expand = {size = 16, texture = "Interface\\AddOns\\Percursus\\assets\\menus\\expand-all.tga", color = {1, 0.82, 0, 1}},
		collapse = {size = 16, texture = "Interface\\AddOns\\Percursus\\assets\\menus\\collapse-all.tga", color = {1, 0.82, 0, 1}}
	},
	moreMenu = {
		minimumWidth = 80,
		height = 20,
		x = -18,
		y = -39,
		textInset = 10,
		arrowSize = 16,
		menuGap = 6,
		icon = {atlas = "racing", size = 16}
	},
	allWindow = {
		width = 500,
		height = 500,
		style = "standard",
		backgroundAlpha = 1,
		showPortrait = true,
		showCloseButton = true,
		movable = true,
		closeOnEscape = true
	},
	rows = {
		minimumHeight = 20,
		verticalPadding = 3,
		indent = 18,
		chevronSize = 16,
		chevronGap = 5,
		medalSize = 14,
		missingTimeSize = 12,
		medalGap = 3,
		unitGap = 3,
		tooltipGap = 4,
		separatorHeight = 1,
		expandTexture = "Interface\\Buttons\\UI-PlusButton-Up",
		collapseTexture = "Interface\\Buttons\\UI-MinusButton-Up",
		highlightTexture = ArcaneWizardLibrary.Textures.tableActiveBackground,
		highlightAlpha = 0.3
	},
	medalList = {
		minimumHeight = 71,
		medalSize = 36,
		missingTimeSize = 28,
		padding = 6,
		verticalPadding = 6,
		medalGap = 10,
		columnGap = 12,
		targetWidth = 164,
		headerGap = 4,
		separatorGap = 8,
		separatorMinimumWidth = 16,
		textGap = 3,
		modeFont = "GameFontNormalLarge",
		bestFont = "GameFontHighlightLarge",
		labelFont = "GameFontHighlight",
		missingTimeFont = "GameFontNormal"
	},
	layouts = {
		race = {headerY = 72, bottom = 37},
		zone = {headerY = 72, bottom = 37},
		all = {headerY = 72, bottom = 37}
	},
	columns = {
		{text = "race.column.race-mode"},
		{text = "race.column.best-time", width = 108, align = "LEFT"},
		{text = "race.column.gold", width = 64, align = "LEFT"},
		{text = "race.column.silver", width = 64, align = "LEFT"}
	},
	inset = {backgroundStyle = "shaded", backgroundAlpha = 1},
	contentInsets = {left = 10, right = 25, top = 15, bottom = 15},
	sideInset = 8,
	footerBottom = 10,
	buttonInset = 6,
	raceOffsetX = 15,
	questMinimumHeight = 220,
	closeButtonWidth = 100,
	npcNameRetryInterval = 0.1,
	npcNameMaxAttempts = 20
}
