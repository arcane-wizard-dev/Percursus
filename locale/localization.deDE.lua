local _, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

if GetLocale() ~= "deDE" then return end

local L = PER.Localization

-- Help

L["help.overview"] = "Öffnet oder schließt die Übersicht aller Rennen."

L["help.faq.personal-best.question"] = "Warum zählt der Renn-Tracker trotz gewähltem Bestzeit-Countdown aufwärts?"
L["help.faq.personal-best.answer"] = "Solange für dieses Rennen im gewählten Rennmodus keine persönliche Bestzeit vorliegt, zeigt der Tracker die verstrichene Rennzeit an. Sobald eine Bestzeit vorliegt, zählt er auf diese Zeit herunter."
L["help.faq.all-races.question"] = "Wo stehen die Zeiten für Rennen außerhalb der aktuellen Zone?"
L["help.faq.all-races.answer"] = "Die Übersicht aller Rennen gruppiert die unterstützten Strecken nach Kontinent und Zone. Sie lässt sich über „Alle Rennen“ oder mit /per overview öffnen."

-- Options

L["options.general"] = "Allgemeine Einstellungen"
L["options.general.minimap-button.name"] = "Minimap-Button"
L["options.general.minimap-button.tooltip"] = "Zeigt den Minimap-Button an."
L["options.general.debug-mode.name"] = "Debugmodus"
L["options.general.debug-mode.tooltip"] = "Zeigt Debugmeldungen der ausgewählten Stufe im Chat an."
L["options.general.debug-mode.level.name"] = "Debugstufe"
L["options.general.debug-mode.level.tooltip"] = "Einfach zeigt wichtige Meldungen. Erweitert zeigt zusätzlich technische Details."
L["options.general.debug-mode.level.value.basic"] = "Einfach"
L["options.general.debug-mode.level.value.advanced"] = "Erweitert"

L["options.race-time-overview"] = "Rennzeitenübersicht"
L["options.race-time-overview.active.name"] = "Rennzeitenübersicht aktivieren"
L["options.race-time-overview.active.tooltip"] = "Zeigt die Rennzeitenübersicht neben dem Questfenster an."

L["options.race-tracker"] = "Renn-Tracker"
L["options.race-tracker.active.name"] = "Renn-Tracker aktivieren"
L["options.race-tracker.active.tooltip"] = "Zeigt den Renn-Tracker während eines Rennens an."
L["options.race-tracker.mode.name"] = "Modus"
L["options.race-tracker.mode.tooltip"] = "Legt fest, wie die Zeit während eines Rennens angezeigt wird.\n\n|cnHIGHLIGHT_FONT_COLOR:Timer:|r Zählt die Rennzeit ab null hoch.\n\n|cnHIGHLIGHT_FONT_COLOR:Countdown - Medaillenzeit:|r Zählt bis zur Goldzeit herunter und danach bis zur Silberzeit.\n\n|cnHIGHLIGHT_FONT_COLOR:Countdown - persönliche Bestzeit:|r Zählt bis zur persönlichen Bestzeit herunter. Ohne Bestzeit wird die Rennzeit hochgezählt."
L["options.race-tracker.mode.value.0"] = "Timer"
L["options.race-tracker.mode.value.1"] = "Countdown - Medaillenzeit"
L["options.race-tracker.mode.value.2"] = "Countdown - persönliche Bestzeit"
L["options.race-tracker.background-type.name"] = "Hintergrund"
L["options.race-tracker.background-type.tooltip"] = "Legt fest, welcher Hintergrund für den Renn-Tracker verwendet wird."
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
L["options.race-tracker.horizontal-shift.tooltip"] = "Legt die horizontale Position des Renn-Trackers relativ zur Bildschirmmitte fest."
L["options.race-tracker.vertical-shift.name"] = "Vertikale Verschiebung"
L["options.race-tracker.vertical-shift.tooltip"] = "Legt die vertikale Position des Renn-Trackers relativ zur Bildschirmmitte fest."
L["options.race-tracker.result-display.name"] = "Rennergebnis anzeigen"
L["options.race-tracker.result-display.tooltip"] = "Lässt den Renn-Tracker nach dem Rennen eingeblendet, um das Ergebnis anzuzeigen."
L["options.race-tracker.fadeout-delay.name"] = "Ausblendeverzögerung"
L["options.race-tracker.fadeout-delay.tooltip"] = "Legt die Zeit nach einem Rennen fest, bis der Renn-Tracker ausgeblendet wird."
L["options.race-tracker.hide-area-names.name"] = "Gebietsnamen ausblenden"
L["options.race-tracker.hide-area-names.tooltip"] = "Blendet während eines Rennens die Gebietsnamen aus."

L["options.speedometer"] = "Geschwindigkeitsanzeige"
L["options.speedometer.visibility.name"] = "Geschwindigkeit anzeigen"
L["options.speedometer.visibility.tooltip"] = "Legt fest, wann die Geschwindigkeit beim Himmelsreiten angezeigt wird.\n\n|cnHIGHLIGHT_FONT_COLOR:Nicht anzeigen:|r Blendet die Geschwindigkeitsanzeige aus.\n\n|cnHIGHLIGHT_FONT_COLOR:Rennen:|r Zeigt die Geschwindigkeit nach dem Countdown bis zum Rennende an.\n\n|cnHIGHLIGHT_FONT_COLOR:Himmelsreiten:|r Zeigt die Geschwindigkeit nur bei Flügen außerhalb von Rennen an.\n\n|cnHIGHLIGHT_FONT_COLOR:Rennen & Himmelsreiten:|r Zeigt die Geschwindigkeit sowohl in Rennen als auch bei Flügen außerhalb von Rennen an."
L["options.speedometer.visibility.value.off"] = "Nicht anzeigen"
L["options.speedometer.visibility.value.race"] = "Rennen"
L["options.speedometer.visibility.value.flight"] = "Himmelsreiten"
L["options.speedometer.visibility.value.both"] = "Rennen & Himmelsreiten"
L["options.speedometer.show-value.name"] = "Zahlenwert anzeigen"
L["options.speedometer.show-value.tooltip"] = "Zeigt die Geschwindigkeit als Zahl von 0 bis 100 in der Mitte des Balkens an."
L["options.speedometer.horizontal-shift.name"] = "Horizontale Verschiebung"
L["options.speedometer.horizontal-shift.tooltip"] = "Legt die horizontale Position der Geschwindigkeitsanzeige relativ zur Bildschirmmitte fest."
L["options.speedometer.vertical-shift.name"] = "Vertikale Verschiebung"
L["options.speedometer.vertical-shift.tooltip"] = "Legt die vertikale Position der Geschwindigkeitsanzeige relativ zur Bildschirmmitte fest."

-- General

L["minimap-button.tooltip"] = "|cnLINK_FONT_COLOR:Linksklick|r zum Öffnen der Übersicht aller Rennen.\n|cnLINK_FONT_COLOR:Rechtsklick|r zum Öffnen der Einstellungen."

L["race.seconds-short"] = "Sek."
L["race.decimal-separator"] = ","

-- Race Tracker

L["race.time"] = "Zeit: %.1f Sekunden"
L["race.gold-time"] = "|T616373:0|t Goldzeit: %s Sek."
L["race.silver-time"] = "|T616375:0|t Silberzeit: %s Sek."
L["race.bronze-time"] = "|T616372:0|t Bronzezeit"
L["race.no-time"] = "Keine Medaillenzeit verfügbar"


L["race.personal-best-time"] = "Persönliche Bestzeit: %s Sek."
L["race.personal-best-time-no-race"] = "Bisher kein Rennen absolviert"
L["race.personal-best-time-not-available"] = "Persönliche Bestzeit nicht verfügbar"
L["race.personal-best-time-failed"] = "Persönliche Bestzeit überschritten"

-- Race Time Overview

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
