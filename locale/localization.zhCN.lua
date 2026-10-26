local _, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

if GetLocale() ~= "zhCN" then return end

local L = PER.Localization

-- Options

L["options.general"] = "常规选项"
L["options.general.minimap-button.name"] = "小地图按钮"
L["options.general.minimap-button.tooltip"] = "启用后，将在小地图上显示插件按钮。"
L["options.general.debug-mode.name"] = "调试模式"
L["options.general.debug-mode.tooltip"] = "启用调试模式以在聊天框中显示额外信息。"

L["options.race-time-overview"] = "竞速时间总览"
L["options.race-time-overview.active.name"] = "启用竞速时间总览"
L["options.race-time-overview.active.tooltip"] = "在任务追踪窗体旁显示竞速时间总览。"

L["options.race-tracker"] = "竞速追踪器"
L["options.race-tracker.active.name"] = "启用竞速追踪器"
L["options.race-tracker.active.tooltip"] = "在竞速过程中启用追踪器显示。"
L["options.race-tracker.mode.name"] = "模式"
L["options.race-tracker.mode.tooltip"] = "定义竞速期间时间的显示方式。"
L["options.race-tracker.mode.value.0"] = "正计时"
L["options.race-tracker.mode.value.1"] = "倒计时 - 奖牌时间"
L["options.race-tracker.mode.value.2"] = "倒计时 - 个人最佳时间"
L["options.race-tracker.background-type.name"] = "背景"
L["options.race-tracker.background-type.tooltip"] = "选择竞速追踪器使用的背景样式。"
L["options.race-tracker.background-type.value.0"] = "无"
L["options.race-tracker.background-type.value.1"] = "Percursus (经典)"
L["options.race-tracker.background-type.value.2"] = "联盟"
L["options.race-tracker.background-type.value.3"] = "部落"
L["options.race-tracker.background-type.value.4"] = "常青树"
L["options.race-tracker.background-type.value.5"] = "巨龙时代"
L["options.race-tracker.background-type.value.6"] = "地心之战"
L["options.race-tracker.background-type.value.7"] = "军团再临"
L["options.race-tracker.background-type.value.8"] = "恩佐斯"
L["options.race-tracker.background-type.value.9"] = "至暗之夜"
L["options.race-tracker.horizontal-shift.name"] = "水平偏移"
L["options.race-tracker.horizontal-shift.tooltip"] = "设置竞速追踪器相对于屏幕中心的水平位置。"
L["options.race-tracker.vertical-shift.name"] = "垂直偏移"
L["options.race-tracker.vertical-shift.tooltip"] = "设置竞速追踪器相对于屏幕中心的垂直位置。"
L["options.race-tracker.result-display.name"] = "显示竞速结果"
L["options.race-tracker.result-display.tooltip"] = "决定竞速结束后是否继续显示追踪器以展示最终结果。"
L["options.race-tracker.fadeout-delay.name"] = "淡出延迟"
L["options.race-tracker.fadeout-delay.tooltip"] = "设置竞速结束后，追踪器消失前的等待时间。"
L["options.race-tracker.hide-area-names.name"] = "隐藏区域名称"
L["options.race-tracker.hide-area-names.tooltip"] = "决定竞速期间是否不显示区域名称。"
L["options.race-tracker.speed-display.name"] = "显示竞速速度"
L["options.race-tracker.speed-display.tooltip"] = "决定竞速期间是否显示速度。此功能仅适用于驭龙术和驭空术竞速。"
L["options.race-tracker.speed-display-horizontal-shift.name"] = "水平偏移"
L["options.race-tracker.speed-display-horizontal-shift.tooltip"] = "设置速度显示相对于屏幕中心的水平位置。"
L["options.race-tracker.speed-display-vertical-shift.name"] = "垂直偏移"
L["options.race-tracker.speed-display-vertical-shift.tooltip"] = "设置速度显示相对于屏幕中心的垂直位置。"

-- General

L["minimap-button.tooltip"] = "|cnLINK_FONT_COLOR:左键点击|r打开全部竞速概览。\n|cnLINK_FONT_COLOR:右键点击|r打开选项。"

L["race.seconds-long"] = "秒"
L["race.seconds-short"] = "秒"
L["race.decimal-separator"] = "."

-- Race Tracker

L["race.time"] = "时间：%.1f 秒"
L["race.gold-time"] = "|T616373:0|t 金牌时间：%s 秒"
L["race.silver-time"] = "|T616375:0|t 银牌时间：%s 秒"
L["race.bronze-time"] = "|T616372:0|t 铜牌时间"
L["race.no-time"] = "无可用奖牌时间"

L["race.gliding-speed"] = "当前竞速速度：%s%%"

L["race.personal-best-time"] = "个人最佳时间：%s 秒"
L["race.personal-best-time-no-race"] = "尚未完成任何竞速"
L["race.personal-best-time-not-available"] = "个人最佳时间不可用"
L["race.personal-best-time-failed"] = "未能刷新个人最佳时间"

-- Race Time Overview

L["race.title.zone-overview"] = "区域概览"
L["race.title.all-overview"] = "艾泽拉斯"

L["race.tab.race"] = "当前竞速"
L["race.tab.zone"] = "区域"

L["race.button.close"] = "关闭"
L["race.button.all-overview"] = "所有竞速"

L["race.menu.more"] = "更多"
L["race.menu.show-separators"] = "显示分隔线"
L["race.expand-all"] = "全部展开"
L["race.collapse-all"] = "全部折叠"

L["race.filter.all"] = "显示全部"
L["race.filter.no-gold"] = "未达到金牌时间"
L["race.filter.no-time"] = "无比赛记录"

L["race.name-unavailable"] = "竞速 %s"
L["race.zone-unavailable"] = "区域 %s"
L["race.other-regions"] = "其他区域"

L["race.column.mode"] = "模式"
L["race.column.race"] = "竞速"
L["race.column.race-mode"] = "竞速 / 模式"
L["race.column.best-time"] = "最佳时间"
L["race.column.gold"] = "金牌"
L["race.column.silver"] = "银牌"

L["race.type-normal"] = "普通"
L["race.type-advanced"] = "高级"
L["race.type-reverse"] = "反向"
L["race.type-challenge"] = "挑战"
L["race.type-challenge-reverse"] = "反向挑战"
L["race.type-storm-gryphon"] = "风暴狮鹫"
