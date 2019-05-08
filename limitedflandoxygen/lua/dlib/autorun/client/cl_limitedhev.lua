
-- The Unlicense (no Copyright) DBotThePony
-- do whatever you want, including removal of this notice

local WATER = CreateConVar('sv_limited_oxygen', '1', {FCVAR_NOTIFY, FCVAR_REPLICATED}, 'Enable limited oxygen')
local FLASHLIGHT = CreateConVar('sv_limited_flashlight', '1', {FCVAR_NOTIFY, FCVAR_REPLICATED}, 'Enable limited flashlight')

local LocalPlayer = LocalPlayer
local hook = hook
local net = net
local math = math
local Lerp = Lerp
local surface = surface

local Flashlight = 100
local RFlashlight = 100
local Oxygen = 100
local ROxygen = 100

local plyMeta = FindMetaTable('Player')

function plyMeta:LFAOGetOxygenFillage()
	if self ~= LocalPlayer() then return 1 end
	return ROxygen / 100
end

function plyMeta:LFAOGetFlashlightFillage()
	if self ~= LocalPlayer() then return 1 end
	return RFlashlight / 100
end

function plyMeta:LFAOGetOxygen()
	if self ~= LocalPlayer() then return 100 end
	return ROxygen
end

function plyMeta:LFAOGetFlashlight()
	if self ~= LocalPlayer() then return 100 end
	return RFlashlight
end

DLib.RegisterAddonName('LimitedOxygen&Flashlight')

surface.CreateFont('DBot_LFAO', {
	font = 'Roboto',
	size = 14,
	weight = 500,
	extended = true,
})

net.Receive('DBot_LFAO', function()
	ROxygen = net.ReadFloat()
	RFlashlight = net.ReadFloat()
end)

local DEFINED_POSITION = DLib.HUDCommons.Position2.DefinePosition('loaf', 0.5, 0.4)

local function GetAddition()
	return DHUD2 and DHUD2.GetDamageShift(3) or 0
end

local function FlashlightFunc()
	if not FLASHLIGHT:GetBool() or hook.Run('HUDShouldDraw', 'LFAOFlashlight') == false then return end
	local x, y = DEFINED_POSITION()

	surface.SetDrawColor(0, 0, 0, 150)
	surface.DrawRect(x - 100 + GetAddition(), y - 2 + GetAddition(), 200, 20)

	surface.SetDrawColor(200, 200, 0, 150)
	surface.DrawRect(x - 95 + GetAddition(), y + GetAddition(), 190 * Flashlight / 100, 16)

	surface.SetTextPos(x - 86 + GetAddition(), y + 1 + GetAddition())
	surface.DrawText(DLib.i18n.localize('gui.breathe.flashlight'))
end

local function OxygenFunc()
	if not WATER:GetBool() or hook.Run('HUDShouldDraw', 'LFAOOxygen') == false then return end
	local x, y = DEFINED_POSITION()

	surface.SetDrawColor(0, 0, 0, 150)
	surface.DrawRect(x - 100 + GetAddition(), y - 2 + GetAddition() + 25, 200, 20)

	surface.SetDrawColor(0, 255, 255, 150)
	surface.DrawRect(x - 95 + GetAddition(), y + GetAddition() + 25, 190 * Oxygen / 100, 16)

	local text = DLib.i18n.localize('gui.breathe.oxygen')
	local w, h = surface.GetTextSize(text)
	surface.SetTextPos(x + 90 - w + GetAddition() - 10, y + 25 + GetAddition())
	surface.DrawText(text)
end

local function HUDPaint()
	if not FLASHLIGHT:GetBool() and not WATER:GetBool() then return end
	if not LocalPlayer():Alive() then return end
	if not LocalPlayer():IsSuitEquipped() then return end

	surface.SetDrawColor(255, 255, 255)
	surface.SetFont('DBot_LFAO')
	surface.SetTextColor(255, 255, 255)

	if RFlashlight ~= 100 then
		FlashlightFunc()
	end

	if ROxygen ~= 100 then
		OxygenFunc()
	end
end

local function Think()
	Flashlight = Lerp(0.5, Flashlight, RFlashlight)
	Oxygen = Lerp(0.5, Oxygen, ROxygen)
end

hook.Add('Think', 'DBot_LFAO', Think)
hook.Add('HUDPaint', 'DBot_LFAO', HUDPaint)