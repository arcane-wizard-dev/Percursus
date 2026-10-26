local addonName, PER = ...

Percursus_RaceTrackerMixin = {}
Percursus_RaceTrackerSpeedDisplayMixin = {}

if PER.State and PER.State.libraryIncompatible then return end

-- Library
local AWL = ArcaneWizardLibrary
local Addon = AWL:GetAddon(addonName)

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
	self:SetSize(256, 64)

	self.Timer:ClearAllPoints()
	self.Info:ClearAllPoints()

	self.Timer:SetPoint("CENTER", 0, 10)
	self.Info:SetPoint("CENTER", 0, -10)

	self.Background:Hide()
end

function Percursus_RaceTrackerMixin:ShowFrame()
	self:Show()
end

function Percursus_RaceTrackerMixin:HideFrame()
	self:Hide()
end

function Percursus_RaceTrackerSpeedDisplayMixin:SetSpeedBar(speed)
	if speed == 0 then
		self.SpeedBar:SetSize(1, 18)
		self.SpeedBar:Hide()
	else
		self.SpeedBar:SetSize(speed, 18)
		self.SpeedBar:Show()
	end
end

function Percursus_RaceTrackerSpeedDisplayMixin:ShowFrame()
	self:Show()
end

function Percursus_RaceTrackerSpeedDisplayMixin:HideFrame()
	self:Hide()
end
