---@meta

-- RaceTimeOverview

---@class PercursusRaceTimeOverviewFrame: Frame
---@field state table
---@field scrollFrame PercursusRaceTimeOverviewScrollFrame|PercursusRaceTimeOverviewTable
---@field inset Frame
---@field heading FontString
---@field title? string
---@field npcTicker? FunctionContainer

---@class PercursusRaceTimeOverviewScrollFrame: ArcaneWizardLibraryScrollFrame
---@field rows table[]

---@class PercursusRaceTimeOverviewTable: ArcaneWizardLibraryTable
---@field rows table[]

---@class PercursusQuestOverviewMenu: DropdownButton
---@field CloseMenu fun(self: PercursusQuestOverviewMenu)

---@class PercursusQuestOverviewFrame: ArcaneWizardLibraryWindowFrame
---@field moreMenu PercursusQuestOverviewMenu

-- RaceTrackerMixin

---@class (partial) PercursusRaceTrackerFrame: Frame
---@field Timer FontString
---@field Info FontString
---@field Background Texture

---@class (partial) PercursusRaceTrackerSpeedDisplayFrame: Frame
---@field SpeedBar Texture
