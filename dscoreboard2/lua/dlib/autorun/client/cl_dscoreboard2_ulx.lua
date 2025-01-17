
--[[
Copyright (C) 2016-2019 DBotThePony


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

]]

local SimpleCommands = {
    'slay',
    'return',
    'god',
    'ungod',
    'gimp',
    'ungimp',
    'mute',
    'unmute',
    'gag',
    'ungag',
    'freeze',
    'unfreeze',
    'strip',
}

local function CommandClick(self, ...)
    if not IsValid(self.target) then return end
    RunConsoleCommand('ulx', self.command, self.target:Nick(), ...)
end

local function CreateCommand(startstr, start, max, step, endtext)
    return function(self)
        local menu = DermaMenu()

        if startstr then
            menu:AddOption(startstr, function() CommandClick(self) end)
        end

        for i = start, max, step do
            menu:AddOption(i .. ' ' .. endtext, function() CommandClick(self, i) end)
        end

        menu:Open()
    end
end

local CustomCommands = {
    {'psay', function(self)
        Derma_StringRequest('PSay', 'Text to send to ' .. self.target:Nick(), '', function(text) RunConsoleCommand('ulx', 'psay', self.target:Nick(), text) end, nil, 'Send')
    end},

    {'jail', CreateCommand('Infinity', 10, 120, 10, 'seconds')},
    {'unjail', CommandClick},
    {'jailtp', CreateCommand('Infinity', 10, 120, 10, 'seconds')},
    {'slap', CreateCommand('No damage', 10, 100, 10, 'damage')},
    {'hp', CreateCommand(nil, 10, 100, 10, 'health')},
    {'armor', CreateCommand(nil, 0, 100, 10, 'armor')},
    {'ignite', CreateCommand(nil, 20, 300, 20, 'seconds')},
    {'unignite', CommandClick},
    {'goto', CommandClick},
    {'bring', CommandClick},
    {'teleport', CommandClick},
    {'send', function(self)
        local menu = DermaMenu()

        for k, ply in ipairs(player.GetAll()) do
            menu:AddOption('Send to ' .. ply:Nick(), function() CommandClick(self, ply) end)
        end

        menu:Open()
    end},
}

local function TopPaint(self, w, h)
    surface.SetDrawColor(DScoreBoard2.Colors.bg)
    surface.DrawRect(0, 0, w, h)
    draw.DrawText('ULX Commands', 'DScoreBoard2.TopInfoText', 4, 3, DScoreBoard2.Colors.textcolor)
end

local function CreateButton(parent, command, ply)
    local button = parent:Add('DScoreBoard2_Button')
    button.target = ply
    button.command = command
    button.DoClick = CommandClick
    button:SetText(command[1]:upper() .. command:sub(2))
    button:SetWide(80)

    return button
end

local function Populate(canvas, self, ply)
    if not ulx then return end

    local top = canvas:Add('EditablePanel')
    top:DockMargin(0, 4, 0, 0)
    top.Paint = TopPaint
    top:Dock(TOP)

    local grid = self:CreateGrid()

    local lply = LocalPlayer()

    for k, v in ipairs(CustomCommands) do
        if not ULib.ucl.query(lply, 'ulx ' .. v[1]) then continue end
        local can = hook.Run(ULib.HOOK_PLAYER_TARGET, lply, v[1], ply)
        if can == false then continue end

        local button = CreateButton(canvas, v[1], ply)
        grid:AddItem(button)
        button.DoClick = v[2]
    end

    for k, v in ipairs(SimpleCommands) do
        if not ULib.ucl.query(lply, 'ulx ' .. v) then continue end
        local can = hook.Run(ULib.HOOK_PLAYER_TARGET, lply, v, ply)
        if can == false then continue end

        local button = CreateButton(canvas, v, ply)
        grid:AddItem(button)
    end

    grid:SetHeight(500)
end

local function Row(self, ply)
    if not ulx then return end

    local lply = LocalPlayer()

    if lply ~= ply and ULib.ucl.query(lply, 'ulx goto') then
        local can = hook.Run(ULib.HOOK_PLAYER_TARGET, lply, 'goto', ply)
        if can ~= false then
            local button = CreateButton(self, 'goto', ply)
            button:SetText(' GOTO ')
            button:Dock(RIGHT)
            button:DockMargin(2, 0, 2, 0)
            button:SizeToContents()
        end
    end

    if ULib.ucl.query(lply, 'ulx teleport') then
        local can = hook.Run(ULib.HOOK_PLAYER_TARGET, lply, 'teleport', ply)
        if can ~= false then
            local button = CreateButton(self, 'teleport', ply)
            button:SetText(' TP ')
            button:Dock(RIGHT)
            button:DockMargin(2, 0, 2, 0)
            button:SizeToContents()
        end
    end

    if lply ~= ply and ULib.ucl.query(lply, 'ulx bring') then
        local can = hook.Run(ULib.HOOK_PLAYER_TARGET, lply, 'bring', ply)
        if can ~= false then
            local button = CreateButton(self, 'bring', ply)
            button:SetText(' BRING ')
            button:Dock(RIGHT)
            button:DockMargin(2, 0, 2, 0)
            button:SizeToContents()
        end
    end
end

hook.Add('DScoreBoard2_PlayerInfo', 'ULX', Populate)
hook.Add('DScoreBoard2_PlayerRow', 'ULX', Row)
