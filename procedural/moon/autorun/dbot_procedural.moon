
--
-- Copyright (C) 2017 DBot
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

export DProcedural
DProcedural = DProcedural or {}

DProcedural.SIDE_LEFT = 0
DProcedural.SIDE_RIGHT = 1
DProcedural.SIDE_FORWARD = 2
DProcedural.SIDE_BACKWARD = 3

DProcedural.DIRECTION_WEST = 0
DProcedural.DIRECTION_EAST = 1
DProcedural.DIRECTION_NORTH = 2
DProcedural.DIRECTION_SOUTH = 3

include 'autorun/dbot_procedural/random.lua'
include 'autorun/dbot_procedural/space.lua'

if SERVER
    include 'autorun/dbot_procedural/skin.lua'
    include 'autorun/dbot_procedural/room.lua'
    include 'autorun/dbot_procedural/controller.lua'