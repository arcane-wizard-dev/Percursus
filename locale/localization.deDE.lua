local _, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

if GetLocale() ~= "deDE" then return end

local L = PER.Localization

-- Options

L["options.general"] = "Allgemeine Einstellungen"
L["options.general.minimap-button.name"] = "Minimap-Button"
L["options.general.minimap-button.tooltip"] = "Bei Aktivierung wird der Minimap-Button angezeigt."
L["options.general.debug-mode.name"] = "Debugmodus"
L["options.general.debug-mode.tooltip"] = "Die Aktivierung des Debugmodus zeigt zusätzliche Informationen im Chat an."

L["options.race-time-overview"] = "Rennzeitenübersicht"
L["options.race-time-overview.active.name"] = "Rennzeitenübersicht aktivieren"
L["options.race-time-overview.active.tooltip"] = "Aktiviert die Rennzeitenübersicht neben dem Questfenster."

L["options.race-tracker"] = "Race-Tracker"
L["options.race-tracker.active.name"] = "Race-Tracker aktivieren"
L["options.race-tracker.active.tooltip"] = "Aktiviert den Race-Tracker während eines Rennens."
L["options.race-tracker.mode.name"] = "Modus"
L["options.race-tracker.mode.tooltip"] = "Legt fest, wie die Zeit während eines Rennens angezeigt werden soll."
L["options.race-tracker.mode.value.0"] = "Timer"
L["options.race-tracker.mode.value.1"] = "Countdown - Medaillenzeit"
L["options.race-tracker.mode.value.2"] = "Countdown - persönliche Bestzeit"
L["options.race-tracker.background-type.name"] = "Hintergrund"
L["options.race-tracker.background-type.tooltip"] = "Legt fest, welcher Hintergrund für den Race-Tracker verwendet werden soll."
L["options.race-tracker.background-type.value.0"] = "Keiner"
L["options.race-tracker.background-type.value.1"] = "Percursus (Classic)"
L["options.race-tracker.background-type.value.2"] = "Allianz"
L["options.race-tracker.background-type.value.3"] = "Horde"
L["options.race-tracker.background-type.value.4"] = "Evergreen"
L["options.race-tracker.background-type.value.5"] = "Dragonflight"
L["options.race-tracker.background-type.value.6"] = "The War Within"
L["options.race-tracker.background-type.value.7"] = "Legion"
L["options.race-tracker.background-type.value.8"] = "N'Zoth"
L["options.race-tracker.background-type.value.9"] = "Midnight"
L["options.race-tracker.horizontal-shift.name"] = "Horizontale Verschiebung"
L["options.race-tracker.horizontal-shift.tooltip"] = "Gibt die relative horizontale Position des Race-Trackers zur Bildschirmmitte an."
L["options.race-tracker.vertical-shift.name"] = "Vertikale Verschiebung"
L["options.race-tracker.vertical-shift.tooltip"] = "Gibt die relative vertikale Position des Race-Trackers zur Bildschirmmitte an."
L["options.race-tracker.result-display.name"] = "Rennergebnis anzeigen"
L["options.race-tracker.result-display.tooltip"] = "Legt fest, ob nach dem Rennen der Race-Tracker weiter angezeigt werden soll und damit das Rennergebnis präsentiert wird."
L["options.race-tracker.fadeout-delay.name"] = "Ausblendeverzögerung"
L["options.race-tracker.fadeout-delay.tooltip"] = "Bestimmt die Zeit nach einem Rennen, bis der Race-Tracker ausgeblendet wird."
L["options.race-tracker.hide-area-names.name"] = "Gebietsnamen ausblenden"
L["options.race-tracker.hide-area-names.tooltip"] = "Legt fest, ob während des Rennens keine Gebietsnamen angezeigt werden sollen."
L["options.race-tracker.speed-display.name"] = "Renngeschwindigkeit anzeigen"
L["options.race-tracker.speed-display.tooltip"] = "Legt fest, ob die Renngeschwindigkeit während des Rennens angezeigt werden soll. Diese Anzeige funktioniert nur bei Drachen- und Himmelsreiterrennen."
L["options.race-tracker.speed-display-horizontal-shift.name"] = "Horizontale Verschiebung"
L["options.race-tracker.speed-display-horizontal-shift.tooltip"] = "Gibt die relative horizontale Position der Renngeschwindigkeitsanzeige zur Bildschirmmitte an."
L["options.race-tracker.speed-display-vertical-shift.name"] = "Vertikale Verschiebung"
L["options.race-tracker.speed-display-vertical-shift.tooltip"] = "Gibt die relative vertikale Position der Renngeschwindigkeitsanzeige zur Bildschirmmitte an."

-- General

L["minimap-button.tooltip"] = "|cnLINK_FONT_COLOR:Linksklick|r zum Öffnen der Übersicht aller Rennen.\n|cnLINK_FONT_COLOR:Rechtsklick|r zum Öffnen der Einstellungen."

L["race.seconds-long"] = "Sekunden"
L["race.seconds-short"] = "Sek."
L["race.decimal-separator"] = ","

-- Race Tracker

L["race.time"] = "Zeit: %.1f Sekunden"
L["race.gold-time"] = "|T616373:0|t Goldzeit: %s Sek."
L["race.silver-time"] = "|T616375:0|t Silberzeit: %s Sek."
L["race.bronze-time"] = "|T616372:0|t Bronzezeit"
L["race.no-time"] = "keine Medaillenzeit abrufbar"

L["race.gliding-speed"] = "aktuelle Renngeschwindigkeit: %s%%"

L["race.personal-best-time"] = "persönliche Bestzeit: %s Sek."
L["race.personal-best-time-no-race"] = "kein Rennen bisher absolviert"
L["race.personal-best-time-not-available"] = "persönliche Bestzeit nicht abrufbar"
L["race.personal-best-time-failed"] = "neue persönliche Bestzeit verfehlt"

-- Race Time Overview

L["race.title.zone-overview"] = "Zonenübersicht"
L["race.title.all-overview"] = "Azeroth"

L["race.tab.race"] = "Aktuelles Rennen"
L["race.tab.zone"] = "Zone"

L["race.button.close"] = "Schließen"
L["race.button.all-overview"] = "Alle Rennen"

L["race.menu.more"] = "Mehr"
L["race.menu.show-separators"] = "Trennlinien anzeigen"
L["race.expand-all"] = "Alle aufklappen"
L["race.collapse-all"] = "Alle zuklappen"

L["race.filter.all"] = "Alle anzeigen"
L["race.filter.no-gold"] = "Nur ohne Goldzeit"
L["race.filter.no-time"] = "Nur ohne Rennzeit"

L["race.name-unavailable"] = "Rennen %s"
L["race.zone-unavailable"] = "Region %s"
L["race.other-regions"] = "Sonstige Regionen"

L["race.column.mode"] = "Modus"
L["race.column.race"] = "Rennen"
L["race.column.race-mode"] = "Rennen / Modus"
L["race.column.best-time"] = "Bestzeit"
L["race.column.gold"] = "Gold"
L["race.column.silver"] = "Silber"

L["race.type-normal"] = "Normal"
L["race.type-advanced"] = "Fortgeschritten"
L["race.type-reverse"] = "Umgekehrt"
L["race.type-challenge"] = "Herausforderung"
L["race.type-challenge-reverse"] = "Umgekehrte Herausforderung"
L["race.type-storm-gryphon"] = "Sturmgreif"
