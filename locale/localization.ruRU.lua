local _, PER = ...

if GetLocale() ~= "ruRU" then return end

local L = PER.Localization

-- Options

L["options.general"] = "Общие параметры"
L["options.general.minimap-button.name"] = "Кнопка у мини-карты"
L["options.general.minimap-button.tooltip"] = "Если этот параметр включен, кнопка отображается у мини-карты."
L["options.general.debug-mode.name"] = "Режим отладки"
L["options.general.debug-mode.tooltip"] = "Если режим отладки включен, в чате отображается дополнительная информация."

L["options.race-time-overview"] = "Обзор времени гонок"
L["options.race-time-overview.active.name"] = "Включить обзор времени гонок"
L["options.race-time-overview.active.tooltip"] = "Включает обзор времени гонок рядом с окном задания."

L["options.race-tracker"] = "Таймер гонки"
L["options.race-tracker.active.name"] = "Включить таймер гонки"
L["options.race-tracker.active.tooltip"] = "Включает таймер во время гонки."
L["options.race-tracker.mode.name"] = "Режим"
L["options.race-tracker.mode.tooltip"] = "Определяет способ отображения времени во время гонки."
L["options.race-tracker.mode.value.0"] = "Секундомер"
L["options.race-tracker.mode.value.1"] = "Обратный отсчёт до медали"
L["options.race-tracker.mode.value.2"] = "Обратный отсчёт до личного рекорда"
L["options.race-tracker.background-type.name"] = "Фон"
L["options.race-tracker.background-type.tooltip"] = "Определяет фон таймера гонки."
L["options.race-tracker.background-type.value.0"] = "Нет"
L["options.race-tracker.background-type.value.1"] = "Percursus (классический)"
L["options.race-tracker.background-type.value.2"] = "Альянс"
L["options.race-tracker.background-type.value.3"] = "Орда"
L["options.race-tracker.background-type.value.4"] = "Вечнозелёный"
L["options.race-tracker.background-type.value.5"] = "Dragonflight"
L["options.race-tracker.background-type.value.6"] = "The War Within"
L["options.race-tracker.background-type.value.7"] = "Legion"
L["options.race-tracker.background-type.value.8"] = "Н'Зот"
L["options.race-tracker.background-type.value.9"] = "Midnight"
L["options.race-tracker.horizontal-shift.name"] = "Смещение по горизонтали"
L["options.race-tracker.horizontal-shift.tooltip"] = "Определяет положение таймера гонки по горизонтали относительно центра экрана."
L["options.race-tracker.vertical-shift.name"] = "Смещение по вертикали"
L["options.race-tracker.vertical-shift.tooltip"] = "Определяет положение таймера гонки по вертикали относительно центра экрана."
L["options.race-tracker.result-display.name"] = "Показывать результат гонки"
L["options.race-tracker.result-display.tooltip"] = "Определяет, остаётся ли таймер на экране после гонки для отображения результата."
L["options.race-tracker.fadeout-delay.name"] = "Задержка скрытия"
L["options.race-tracker.fadeout-delay.tooltip"] = "Определяет, через какое время после гонки скрывается таймер."
L["options.race-tracker.hide-area-names.name"] = "Скрывать названия областей"
L["options.race-tracker.hide-area-names.tooltip"] = "Определяет, скрываются ли названия областей во время гонки."
L["options.race-tracker.speed-display.name"] = "Показывать скорость гонки"
L["options.race-tracker.speed-display.tooltip"] = "Определяет, отображается ли скорость во время гонки. Работает только в гонках на драконах и гонках небесного полёта."
L["options.race-tracker.speed-display-horizontal-shift.name"] = "Смещение по горизонтали"
L["options.race-tracker.speed-display-horizontal-shift.tooltip"] = "Определяет положение индикатора скорости по горизонтали относительно центра экрана."
L["options.race-tracker.speed-display-vertical-shift.name"] = "Смещение по вертикали"
L["options.race-tracker.speed-display-vertical-shift.tooltip"] = "Определяет положение индикатора скорости по вертикали относительно центра экрана."

-- General

L["minimap-button.tooltip"] = "|cnLINK_FONT_COLOR:Щелкните правой кнопкой мыши|r, чтобы открыть настройки."

-- Chat

-- Race Tracker & Race Time Overview

L["race.time"] = "Время: %.1f сек."
L["race.gold-time"] = "|T616373:0|t Время для золота: %s сек."
L["race.silver-time"] = "|T616375:0|t Время для серебра: %s сек."
L["race.bronze-time"] = "|T616372:0|t Время для бронзы"
L["race.no-time"] = "Время для медали недоступно"

L["race.gliding-speed"] = "Текущая скорость гонки: %s%%"

L["race.seconds-long"] = "Секунды"
L["race.seconds-short"] = "сек."

L["race.button.close"] = "Закрыть"
L["race.button.zone-overview"] = "Обзор зоны"

L["race.title.zone-overview"] = "Обзор зоны"

L["race.type-normal"] = "Обычная"
L["race.type-advanced"] = "Продвинутая"
L["race.type-reverse"] = "Обратная"
L["race.type-challenge"] = "Испытание"
L["race.type-challenge-reverse"] = "Обратное испытание"
L["race.type-storm-gryphon"] = "Грозовой грифон"

L["race.personal-best-time"] = "Личный рекорд: %s сек."
L["race.personal-best-time-no-race"] = "Пока не завершено ни одной гонки"
L["race.personal-best-time-not-available"] = "Личный рекорд недоступен"
L["race.personal-best-time-failed"] = "Личный рекорд не побит"
