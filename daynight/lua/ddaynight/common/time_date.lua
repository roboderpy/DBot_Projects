
-- Copyright (C) 2017-2019 DBotThePony

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
-- of the Software, and to permit persons to whom the Software is furnished to do so,
-- subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all copies
-- or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
-- INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
-- PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
-- FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
-- OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-- DEALINGS IN THE SOFTWARE.


-- This object is supposted to be static

local DLib = DLib
local DDayNight = DDayNight
local math = math
local ipairs = ipairs
local pairs = pairs
local table = table
local Lerp = Lerp
local string = string
local assert = assert
local type = type

local meta = DLib.CreateLuaObject('WODate', false)

DDayNight.Date = meta.Create

function meta:Initialize(stamp)
	self:SetStamp(stamp)
end

function meta:SetStamp(stamp)
	assert(type(stamp) == 'number' and stamp >= 0, 'Invalid stamp. Called time is ' .. tostring(stamp))
	self.stamp = stamp

	if not self.dayObject or self.dayObject:GetAbsoluteDay() ~= self:GetAbsoluteDay() then
		if not self.dayObject then
			self.dayObject = DDayNight.Day(stamp)
		else
			self.dayObject:SetStamp(stamp)
		end
	end
end

function meta:GetDayObject()
	return self.dayObject
end

function meta:DateDay()
	return self.dayObject
end

function meta:GetAge()
	return math.floor(self.stamp / DDayNight.timeTypes.age)
end

function meta:GetYear()
	return math.floor(self.stamp / DDayNight.timeTypes.year)
end

function meta:GetMonth()
	local time = self.stamp % DDayNight.timeTypes.year

	for i, seconds in pairs(DDayNight.monthsTimeInYearNumeric) do
		if seconds >= time then
			return i - 1
		end
	end
end

function meta:ClosestHour()
	if self:GetMinute() >= 30 then
		return math.min(self:GetHour() + 1, 23)
	else
		return self:GetHour()
	end
end

function meta:Random(min, max, addSeed)
	return DDayNight.frandom(min, max, 'dateTime', (addSeed or 0) + math.floor(self.stamp))
end

function meta:RandomDay(min, max, addSeed)
	return self.dayObject:Random(min, max, addSeed)
end

function meta:GetMonthTime()
	local time = self.stamp % DDayNight.timeTypes.year
	local month = self:GetMonth()

	if month == 0 then
		return time
	end

	return time - DDayNight.MonthLength(month - 1)
end

function meta:GetAbsoluteMonth()
	return self.GetMonth() + 12 * self:GetYear()
end

function meta:GetWeek()
	return math.floor((self.stamp % DDayNight.timeTypes.year) / DDayNight.timeTypes.week)
end

function meta:GetLocalWeek()
	return math.floor(self:GetMonthTime() / DDayNight.timeTypes.week)
end

function meta:GetDay()
	return math.floor((self.stamp % DDayNight.timeTypes.year) / DDayNight.timeTypes.day)
end

function meta:GetLocalDay()
	return math.floor((self.stamp % DDayNight.timeTypes.week) / DDayNight.timeTypes.day)
end

function meta:GetAbsoluteDay()
	return math.floor(self.stamp / DDayNight.timeTypes.day)
end

function meta:GetAbsoluteHour()
	return math.floor(self.stamp / DDayNight.timeTypes.hour)
end

function meta:GetHour()
	return math.floor((self.stamp % DDayNight.timeTypes.day) / DDayNight.timeTypes.hour)
end

function meta:GetAbsoluteMinute()
	return math.floor(self.stamp / DDayNight.timeTypes.minute)
end

function meta:GetMinute()
	return math.floor((self.stamp % DDayNight.timeTypes.hour) / DDayNight.timeTypes.minute)
end

function meta:GetAbsoluteSecond()
	return math.floor(self.stamp)
end

function meta:GetDaySecond()
	return self.stamp % DDayNight.timeTypes.day
end

function meta:GetDayProgression()
	local seconds = self:GetDaySecond()

	if self.dayObject.dayStart > seconds then
		return 0
	elseif self.dayObject.dayEnd < seconds then
		return 1
	else
		return (seconds - self.dayObject.dayStart) / self.dayObject.dayLength
	end
end

function meta:GetLightProgression()
	local seconds = self:GetDaySecond()

	if self.dayObject.dayStartLighting > seconds then
		return 0
	elseif self.dayObject.dayEndLighting < seconds then
		return 1
	else
		return (seconds - self.dayObject.dayStartLighting) / self.dayObject.dayLengthLighting
	end
end

function meta:GetNightMultiplier()
	local progressionDay = self:GetDayProgression()

	if progressionDay ~= 1 and progressionDay ~= 0 then return 0 end

	local progressionLight = self:GetLightProgression()
	if progressionLight == 1 or progressionLight == 0 then return 1 end
	local seconds = self:GetDaySecond()

	if progressionLight < 0.5 then
		return (self.dayObject.dayStart - seconds) / self.dayObject.dayLightDiffPre
	else
		return (seconds - self.dayObject.dayEnd) / self.dayObject.dayLightDiffPost
	end
end

function meta:GetNightProgression()
	local progressionDay = self:GetDayProgression()

	if progressionDay ~= 1 and progressionDay ~= 0 then return 0 end

	local seconds = self:GetDaySecond()

	if 43200 > seconds then
		return (1 + seconds / (self.dayObject.dayStart - self.dayObject.dayLightDiffPre)) / 2
	else
		return seconds:progression(self.dayObject.dayEnd + self.dayObject.dayLightDiffPost, 86400) / 2
	end
end

meta.STATUS_NIGHT = 0
meta.STATUS_DAY = 1
meta.STATUS_SUNSET = 2
meta.STATUS_SUNRISE = 3

function meta:GetStatus()
	local seconds = self:GetDaySecond()

	if seconds < self.dayObject.dayStart - self.dayObject.dayLightDiffPre then
		return self.STATUS_NIGHT
	elseif seconds < self.dayObject.dayStart then
		return self.STATUS_SUNRISE
	elseif seconds < self.dayObject.dayEnd then
		return self.STATUS_DAY
	elseif seconds < self.dayObject.dayEnd+ self.dayObject.dayLightDiffPost then
		return self.STATUS_SUNSET
	else
		return self.STATUS_NIGHT
	end
end

function meta:GetStamp()
	return self.stamp
end

function meta:IsBeforeMidday()
	return self:GetDaySecond() < DDayNight.middayTime
end

function meta:IsAfterMidday()
	return self:GetDaySecond() > DDayNight.middayTime
end

function meta:GetSecond()
	return math.floor(self.stamp % DDayNight.timeTypes.minute)
end

function meta:GetSecondInHour()
	return math.floor(self.stamp % DDayNight.timeTypes.hour)
end

function meta:GetSecondInDay()
	return math.floor(self.stamp % DDayNight.timeTypes.day)
end

function meta:FormatCurrentHour()
	return DDayNight.FormatHours(self.stamp)
end

function meta:FormatHour()
	return DDayNight.FormatHours(self.stamp)
end

function meta:FormatCurrentTime()
	return DDayNight.FormatTime(self.stamp)
end

function meta:FormatTime()
	return DDayNight.FormatTime(self.stamp)
end

function meta:Format()
	return string.format('%.2i %s %.4i %s', self:GetDayInMonth(), self:GetMonthString(), self:GetYear(), self:FormatTime())
end

function meta:FormatDateYear()
	return string.format('%s %.4i', self:FormatDate(), self:GetYear())
end

local function bridge(funcName, funcAs)
	meta[funcAs or funcName] = function(self, ...)
		return self.dayObject[funcName](self.dayObject, ...)
	end
end

bridge('FormatSunrise')
bridge('FormatSunset')
bridge('GetSunset')
bridge('GetSunrise')
bridge('GetDayStart')
bridge('GetDayEnd')
bridge('GetMonthString')
bridge('GetDayInMonth')
bridge('GetDayStartLighting')
bridge('GetDayEndLighting')
bridge('GetSunriseLighting')
bridge('GetSunsetLighting')
bridge('GetNightEnd')
bridge('GetNightEnd')
bridge('GetNightStart')
bridge('FormatSunriseLighting')
bridge('FormatSunsetLighting')
bridge('FormatNightEnd')
bridge('FormatNightStart')
bridge('GetDayLengthMultiplier')
bridge('CalculateMonthsFraction')
bridge('Format', 'FormatDate')
