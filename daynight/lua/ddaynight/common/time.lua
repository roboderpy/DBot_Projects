
-- Copyright (C) 2017-2018 DBot

-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at

--     http://www.apache.org/licenses/LICENSE-2.0

-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

local DLib = DLib
local DDayNight = DDayNight
local self = DDayNight
local math = math
local ipairs = ipairs
local pairs = pairs
local table = table

self.TIME_MULTIPLIER = DLib.util.CreateSharedConvar('sv_ddaynight_time_speed', '30', 'One real second is equal this amount of seconds. Must be positive integer')
self.TIME = 0

function self.GetTime()
	return self.TIME
end

function self.GetCurrentDate()
	return self.DATE_OBJECT
end

function self.GetCurrentDateAccurate()
	return self.DATE_OBJECT_ACCURATE
end

self.WEEKS_IN_YEAR = 52

self.timeTypes = {}
self.timeTypes.second = 1
self.timeTypes.minute = self.timeTypes.second * 60
self.timeTypes.hour = self.timeTypes.minute * 60
self.timeTypes.midday = self.timeTypes.hour * 12
self.timeTypes.day = self.timeTypes.hour * 24
self.timeTypes.week = self.timeTypes.day * 7
self.timeTypes.year = self.timeTypes.day * 365
self.timeTypes.age = self.timeTypes.year * 100

local function numerize(tabIn)
	for index, month in pairs(self.indexedMonths) do
		tabIn[index] = tabIn[month]
	end
end

self.months = {
	january = 31,
	feburary = 28,
	march = 31,
	april = 30,
	may = 31,
	june = 30,
	july = 31,
	august = 31,
	september = 30,
	october = 31,
	november = 30,
	december = 31,
}

-- normalize so they start count from zero day
for month, days in pairs(self.months) do
	self.months[month] = days - 1
end

self.monthNames = {}

for monthName, days in pairs(self.months) do
	self.monthNames[monthName] = monthName:sub(1, 1):upper() .. monthName:sub(2)
end

self.monthsDaytimeMultiplier = {
	january = 0.4,
	feburary = 0.5,
	march = 0.55,
	april = 0.6,
	may = 0.85,
	june = 0.9,
	july = 1,
	august = 0.9,
	september = 0.85,
	october = 0.7,
	november = 0.5,
	december = 0.45,
}

self.monthsNighttimeMultiplier = {
	january = 0.5,
	feburary = 0.4,
	march = 0.375,
	april = 0.35,
	may = 0.35,
	june = 0.3,
	july = 0.25,
	august = 0.275,
	september = 0.3,
	october = 0.325,
	november = 0.35,
	december = 0.4,
}

self.monthsTimeInYear = {}
self.monthsTimeInYearNumeric = {}
self.monthLength = {}

do
	local lastTime = 0

	for i, value in pairs(self.indexedMonths) do
		local k = value
		local v = self.months[value]
		self.monthsTimeInYear[k] = lastTime + v * self.timeTypes.day
		lastTime = self.monthsTimeInYear[k]
		self.monthLength[k] = v * self.timeTypes.day
	end

	local i = 0

	for index, month in pairs(self.indexedMonths) do
		self.monthsTimeInYearNumeric[index] = self.monthsTimeInYear[month]
	end
end

self.dayStart = self.timeTypes.hour * 7
self.dayStartLighting = self.timeTypes.hour * 6
self.dayEnd = self.timeTypes.hour * 20
self.dayEndLighting = self.timeTypes.hour * 22

self.daylength = self.dayEnd - self.dayStart
self.middayTime = self.timeTypes.hour * 12

self.dayDiffPre = self.middayTime - self.dayStart
self.dayDiffPreLighting = self.middayTime - self.dayStartLighting
self.dayDiffPost = self.dayEnd - self.middayTime
self.dayDiffPostLighting = self.dayEndLighting - self.middayTime

numerize(self.months)
numerize(self.monthsDaytimeMultiplier)
numerize(self.monthsNighttimeMultiplier)
numerize(self.monthNames)
numerize(self.monthLength)