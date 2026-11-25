local _, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

if GetLocale() ~= "ruRU" then return end

local L = PER.Localization

-- Help

L["help.overview"] = "Открывает или закрывает обзор всех гонок."

L["help.faq.personal-best.question"] = "Почему таймер гонки отсчитывает время вперёд в режиме обратного отсчёта до личного рекорда?"
L["help.faq.personal-best.answer"] = "Пока для этой гонки в выбранном режиме нет личного рекорда, таймер показывает время с начала гонки. Когда появляется личный рекорд, таймер ведёт обратный отсчёт до него."
L["help.faq.all-races.question"] = "Где посмотреть время гонок за пределами текущей зоны?"
L["help.faq.all-races.answer"] = "В обзоре трассы сгруппированы по континентам и зонам. Открыть обзор можно через «Все гонки» или командой /per overview."

-- Options

L["options.general"] = "Общие параметры"
L["options.general.minimap-button.name"] = "Кнопка у мини-карты"
L["options.general.minimap-button.tooltip"] = "Показывает кнопку у мини-карты."
L["options.general.debug-mode.name"] = "Режим отладки"
L["options.general.debug-mode.tooltip"] = "Показывает в чате отладочные сообщения выбранного уровня."
L["options.general.debug-mode.level.name"] = "Уровень отладки"
L["options.general.debug-mode.level.tooltip"] = "Базовый уровень показывает основные сообщения. Расширенный также показывает технические подробности."
L["options.general.debug-mode.level.value.basic"] = "Базовый"
L["options.general.debug-mode.level.value.advanced"] = "Расширенный"

L["options.race-time-overview"] = "Обзор времени гонок"
L["options.race-time-overview.active.name"] = "Включить обзор времени гонок"
L["options.race-time-overview.active.tooltip"] = "Показывает обзор времени гонок рядом с окном задания."

L["options.race-tracker"] = "Таймер гонки"
L["options.race-tracker.active.name"] = "Включить таймер гонки"
L["options.race-tracker.active.tooltip"] = "Показывает таймер во время гонки."
L["options.race-tracker.mode.name"] = "Режим"
L["options.race-tracker.mode.tooltip"] = "Определяет способ отображения времени во время гонки.\n\n|cnHIGHLIGHT_FONT_COLOR:Секундомер:|r Отсчитывает время гонки с нуля.\n\n|cnHIGHLIGHT_FONT_COLOR:Обратный отсчёт до медали:|r Отсчитывает время до золотой медали, затем до серебряной.\n\n|cnHIGHLIGHT_FONT_COLOR:Обратный отсчёт до личного рекорда:|r Отсчитывает время до личного рекорда. Если рекорда нет, время гонки отсчитывается с нуля."
L["options.race-tracker.mode.value.0"] = "Секундомер"
L["options.race-tracker.mode.value.1"] = "Обратный отсчёт до медали"
L["options.race-tracker.mode.value.2"] = "Обратный отсчёт до личного рекорда"
L["options.race-tracker.background-type.name"] = "Фон"
L["options.race-tracker.background-type.tooltip"] = "Определяет фон таймера гонки."
L["options.race-tracker.background-type.value.0"] = "Нет"
L["options.race-tracker.background-type.value.1"] = "Percursus (классический)"
L["options.race-tracker.background-type.value.2"] = "Альянс"
L["options.race-tracker.background-type.value.3"] = "Орда"
L["options.race-tracker.background-type.value.4"] = "Evergreen"
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
L["options.race-tracker.result-display.tooltip"] = "Оставляет таймер на экране после гонки, чтобы показать результат."
L["options.race-tracker.fadeout-delay.name"] = "Задержка скрытия"
L["options.race-tracker.fadeout-delay.tooltip"] = "Определяет, через какое время после гонки скрывается таймер."
L["options.race-tracker.hide-area-names.name"] = "Скрывать названия областей"
L["options.race-tracker.hide-area-names.tooltip"] = "Скрывает названия областей во время гонки."

L["options.speedometer"] = "Спидометр"
L["options.speedometer.visibility.name"] = "Показывать спидометр"
L["options.speedometer.visibility.tooltip"] = "Определяет, когда показывать скорость в режиме высшего пилотажа.\n\n|cnHIGHLIGHT_FONT_COLOR:Не показывать:|r Скрывает спидометр.\n\n|cnHIGHLIGHT_FONT_COLOR:Гонки:|r Показывает скорость с момента окончания обратного отсчёта до конца гонки.\n\n|cnHIGHLIGHT_FONT_COLOR:Высший пилотаж:|r Показывает скорость только в полёте вне гонок.\n\n|cnHIGHLIGHT_FONT_COLOR:Гонки и высший пилотаж:|r Показывает скорость как в гонках, так и в полёте вне гонок."
L["options.speedometer.visibility.value.off"] = "Не показывать"
L["options.speedometer.visibility.value.race"] = "Гонки"
L["options.speedometer.visibility.value.flight"] = "Высший пилотаж"
L["options.speedometer.visibility.value.both"] = "Гонки и высший пилотаж"
L["options.speedometer.show-value.name"] = "Показывать числовое значение"
L["options.speedometer.show-value.tooltip"] = "Показывает скорость числом от 0 до 100 в центре шкалы."
L["options.speedometer.horizontal-shift.name"] = "Смещение по горизонтали"
L["options.speedometer.horizontal-shift.tooltip"] = "Определяет положение спидометра по горизонтали относительно центра экрана."
L["options.speedometer.vertical-shift.name"] = "Смещение по вертикали"
L["options.speedometer.vertical-shift.tooltip"] = "Определяет положение спидометра по вертикали относительно центра экрана."

-- General

L["minimap-button.tooltip"] = "|cnLINK_FONT_COLOR:Щёлкните левой кнопкой мыши|r, чтобы открыть обзор всех гонок.\n|cnLINK_FONT_COLOR:Щёлкните правой кнопкой мыши|r, чтобы открыть настройки."

L["race.seconds-short"] = "сек."
L["race.decimal-separator"] = ","

-- Race Tracker

L["race.time"] = "Время: %.1f сек."
L["race.gold-time"] = "|T616373:0|t Время для золота: %s сек."
L["race.silver-time"] = "|T616375:0|t Время для серебра: %s сек."
L["race.bronze-time"] = "|T616372:0|t Время для бронзы"
L["race.no-time"] = "Время для медали недоступно"


L["race.personal-best-time"] = "Личный рекорд: %s сек."
L["race.personal-best-time-no-race"] = "Пока не завершено ни одной гонки"
L["race.personal-best-time-not-available"] = "Личный рекорд недоступен"
L["race.personal-best-time-failed"] = "Время личного рекорда превышено"

-- Race Time Overview

L["race.title.all-overview"] = "Азерот"

L["race.tab.race"] = "Текущая гонка"
L["race.tab.zone"] = "Зона"

L["race.button.close"] = "Закрыть"
L["race.button.all-overview"] = "Все гонки"

L["race.menu.more"] = "Ещё"
L["race.menu.show-separators"] = "Показывать разделители"
L["race.expand-all"] = "Развернуть всё"
L["race.collapse-all"] = "Свернуть всё"

L["race.filter.all"] = "Показать все"
L["race.filter.no-gold"] = "Время для золотой медали не достигнуто"
L["race.filter.no-time"] = "Без времени гонки"

L["race.name-unavailable"] = "Гонка %s"
L["race.zone-unavailable"] = "Регион %s"
L["race.other-regions"] = "Другие регионы"

L["race.column.race-mode"] = "Гонка / Режим"
L["race.column.best-time"] = "Рекорд"
L["race.column.gold"] = "Золото"
L["race.column.silver"] = "Серебро"

L["race.type-normal"] = "Обычная"
L["race.type-advanced"] = "Продвинутая"
L["race.type-reverse"] = "Обратная"
L["race.type-challenge"] = "Испытание"
L["race.type-challenge-reverse"] = "Обратное испытание"
L["race.type-storm-gryphon"] = "Грозовой грифон"
