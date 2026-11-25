local addonName, PER = ...

---@class (partial) PercursusRaceTrackerFrame
Percursus_RaceTrackerMixin = {}

if PER.State and PER.State.libraryIncompatible then return end

-- Library
local AWL = ArcaneWizardLibrary
local Addon = AWL:GetAddon(addonName)

-- Module imports
local RaceTrackerConfig = PER.UIConfig.RaceTracker

-----------------------
--- Mixin Functions ---
-----------------------

function Percursus_RaceTrackerMixin:SetTimerText(text)
	self.Timer:SetText(text)
end

function Percursus_RaceTrackerMixin:SetInfoText(text)
	self.Info:SetText(text)
end

function Percursus_RaceTrackerMixin:GetTimerText()
	return self.Timer:GetText()
end

function Percursus_RaceTrackerMixin:GetInfoText()
	return self.Info:GetText()
end

function Percursus_RaceTrackerMixin:SetBackground(style)
	self:SetSize(style.width, style.height)

	if style.type == "file" then
		self.Background:SetTexture(Addon:GetMediaPath(style.texture))
	elseif style.type == "atlas" then
		self.Background:SetAtlas(style.texture)
	end

	self.Timer:ClearAllPoints()
	self.Info:ClearAllPoints()

	self.Timer:SetPoint("CENTER", 0, style.offsetY.timer)
	self.Info:SetPoint("CENTER", 0, style.offsetY.info)

	self.Background:Show()
end

function Percursus_RaceTrackerMixin:RemoveBackground()
	local style = RaceTrackerConfig.plain
	self:SetSize(style.width, style.height)

	self.Timer:ClearAllPoints()
	self.Info:ClearAllPoints()

	self.Timer:SetPoint("CENTER", 0, style.offsetY.timer)
	self.Info:SetPoint("CENTER", 0, style.offsetY.info)

	self.Background:Hide()
end

function Percursus_RaceTrackerMixin:ShowFrame()
	self:Show()
end

function Percursus_RaceTrackerMixin:HideFrame()
	self:Hide()
end
