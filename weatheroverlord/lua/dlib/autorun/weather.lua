
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

include('weatheroverlord/sh_init.lua')

if SERVER then
	AddCSLuaFile('weatheroverlord/sh_init.lua')
	AddCSLuaFile('weatheroverlord/cl_init.lua')
	include('weatheroverlord/sv_init.lua')
else
	include('weatheroverlord/cl_init.lua')
end