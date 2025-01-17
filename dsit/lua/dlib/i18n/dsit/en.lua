
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


gui.dsit.friend = 'DSit Friend'

message.dsit.sit.toofast = 'You are moving too fast!'

message.dsit.check.pitch = 'Invalid sitting angle (pitch is #i when should <> +-20 or -180)'
message.dsit.check.roll = 'Invalid sitting angle (roll is #i when should <> +-20)'
message.dsit.check.unreachable = 'Position is unreachable'

message.dsit.status.entities = 'Sitting on entities is disabled'
message.dsit.status.npc = 'You cant sit on NPCs'
message.dsit.status.toofast = 'Target is moving too fast!'
message.dsit.status.recursion = 'You cant sit on a person who sits on you'
message.dsit.status.nolegs = 'Sitting on players legs is disabled'
message.dsit.status.noplayers = 'Sitting on players is disabled'
message.dsit.status.diasallowed = 'Target player disallowed sitting on him'
message.dsit.status.friendsonly = 'One or both of players has cl_dsit_friendsonly set to 1 and you are not friends'
message.dsit.status.nonowned = 'Sitting is allowed only on non owned entities'
message.dsit.status.onlyowned = 'Sitting is allowed only on entities owned by you'
message.dsit.status.restricted = 'Target player restricted amount of sitting on him'
message.dsit.status.hook = 'You can not sit right now'

info.dsit.nopos = 'No position were detected, returning you to last known position...'

gui.dsit.menu.author = 'DSit were created by DBotThePony'
gui.dsit.menu.sitonme = 'Allow to sit on me'
gui.dsit.menu.friendsonly = 'Allow only for friends'
gui.dsit.menu.getoff_check = 'Check for "get off" message in chat'
gui.dsit.menu.max = 'Max players on you'
gui.dsit.menu.hide = 'Hide players sitting on you'
gui.dsit.menu.getoff = 'Get off player on you'
gui.dsit.menu.getoff_e = 'Get off specific player on you'
gui.dsit.menu.interactive = 'Interactive angle choose'
