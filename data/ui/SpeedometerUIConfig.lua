local _, PER = ...

if PER.State and PER.State.libraryIncompatible then return end

PER.UIConfig.Speedometer = {
	fullBarWidth = 208,
	fullBarSpeed = 100,
	updateInterval = 0.03
}
