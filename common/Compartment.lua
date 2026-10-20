local addonName, PER = ...

-- Library
local AWL = ArcaneWizardLibrary
local Addon = AWL:GetAddon(addonName)

-- Localization
local L = PER.Localization

-- Variables
local handlers = Addon:CreateCompartmentHandlers({
	tooltip = L["minimap-button.tooltip"],
	onLeftClick = function()
		PER.Modules.RaceTimeOverview:ToggleAllOverview()
	end
})

------------------------
--- Public Functions ---
------------------------

function Percursus_CompartmentOnEnter(self, button)
	handlers.OnEnter(self, button)
end

function Percursus_CompartmentOnLeave()
	handlers.OnLeave()
end

function Percursus_CompartmentOnClick(self, button)
	handlers.OnClick(self, button)
end
