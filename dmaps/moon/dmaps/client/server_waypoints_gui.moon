
--
-- Copyright (C) 2017-2019 DBotThePony
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

import DMaps from _G
import Icon from DMaps

class ServerWaypointsContainer
	@EDIT_PERMISSION = 'basic'
	@_NAME_ON_PANEL = 'Basic'
	@NETWORK_STRING_PREFIX = 'DMaps.BasicWaypoint'
	@ROW_PART_NAME = 'DMapsWaypointRowServer'
	@DISPLAY_NAME = 'serverside'

	@IsValid = => IsValid(@CURRENT_CLASS)
	@GetContainer = => @CURRENT_CLASS

	@OnLoad = =>
		if not @IsValid()
			@(true)
		else
			@CURRENT_CLASS\ReadData()
			@CURRENT_CLASS\BuildList()
	@OnCreated = =>
		return if not @IsValid()
		read = @ReadWaypointData()
		table.insert(@CURRENT_CLASS.list, read)
	@OnModify = =>
		return if not @IsValid()
		read = @ReadWaypointData()
		for i, point in pairs @CURRENT_CLASS.list
			if point.id == read.id
				@CURRENT_CLASS.list[i] = read
				@CURRENT_CLASS\BuildList()
				return
		table.insert(@CURRENT_CLASS.list, read)
		@CURRENT_CLASS\BuildList()
	@OnRemoved = =>
		return if not @IsValid()
		id = net.ReadUInt(32)
		for i, point in pairs @CURRENT_CLASS.list
			if point.id == id
				table.remove(@CURRENT_CLASS.list, i)
				@CURRENT_CLASS\BuildList()
				return

	@RegisterNetwork = =>
		@__PERM_VIEW = "dmaps_view_#{@EDIT_PERMISSION}_waypoints"
		@__PERM_EDIT = "dmaps_edit_#{@EDIT_PERMISSION}_waypoints"
		@__PERM_DELETE = "dmaps_delete_#{@EDIT_PERMISSION}_waypoints"
		DMaps.WatchPermission(@__PERM_VIEW)
		DMaps.WatchPermission(@__PERM_EDIT)
		DMaps.WatchPermission(@__PERM_DELETE)
		@NETWORK_STRING = "#{@NETWORK_STRING_PREFIX}Load"
		@NETWORK_STRING_MODIFY = "#{@NETWORK_STRING_PREFIX}Modify"
		@NETWORK_STRING_CREATE = "#{@NETWORK_STRING_PREFIX}Create"
		@NETWORK_STRING_DELETE = "#{@NETWORK_STRING_PREFIX}Delete"
		net.Receive(@NETWORK_STRING, -> @OnLoad())
		net.Receive(@NETWORK_STRING_CREATE, -> @OnCreated())
		net.Receive(@NETWORK_STRING_DELETE, -> @OnRemoved())
		net.Receive(@NETWORK_STRING_MODIFY, -> @OnModify())

	@RegisterNetwork()

	new: (readData = true, openMenus = true) =>
		return Derma_Message("You need '#{@@__PERM_VIEW}' permission!", 'Mission permissions', 'Okay') if not DMaps.HasPermission(@@__PERM_VIEW)
		@data = {}
		@list = {}
		@points = {}
		@@CURRENT_CLASS = @
		@ReadData() if readData
		@OpenMenu() if openMenus
	@ReadWaypointData: => -- Override with super()
		read = {}
		read.id = net.ReadUInt(32)
		read.name = net.ReadString()
		read.posx = net.ReadInt(32)
		read.posy = net.ReadInt(32)
		read.posz = net.ReadInt(32)
		read.red = net.ReadUInt(8)
		read.green = net.ReadUInt(8)
		read.blue = net.ReadUInt(8)
		read.icon = Icon\GetIconName(net.ReadUInt(16))
		return read
	WriteWaypointData: (data, writeID = false) => -- Override with super()
		net.WriteUInt(data.id, 32) if writeID
		net.WriteString(data.name)
		net.WriteInt(data.posx, 32)
		net.WriteInt(data.posy, 32)
		net.WriteInt(data.posz, 32)
		net.WriteUInt(data.red, 8)
		net.WriteUInt(data.green, 8)
		net.WriteUInt(data.blue, 8)
		net.WriteUInt(Icon\GetNetworkID(data.icon), 16)
	ReadData: =>
		@data = {}
		count = net.ReadUInt(16) -- loal 65k waypoints. khm
		@data.count = count
		@list = [@@ReadWaypointData() for i = 1, count]
	IsValid: => IsValid(@frame)
	DoRemove: (id = 0) =>
		return Derma_Message("You need '#{@@__PERM_DELETE}' permission!", 'Mission permissions', 'Okay') if not DMaps.HasPermission(@@__PERM_DELETE)
		net.Start(@@NETWORK_STRING_DELETE)
		net.WriteUInt(id, 32)
		net.SendToServer()
	GrabData: (pnl) =>
		self = pnl
		color = @picker\GetColor()
		{
			name: @fields[1]\GetText()
			posx: tonumber(@fields[2]\GetText()) or 0
			posy: tonumber(@fields[3]\GetText()) or 0
			posz: tonumber(@fields[4]\GetText()) or 0
			red: color.r
			green: color.g
			blue: color.b
			icon: @icon\GetIconName()
		}
	@GenerateData: (posx = LocalPlayer()\GetPos().x, posy = LocalPlayer()\GetPos().y, posz = LocalPlayer()\GetPos().z) =>
		posx, posy, posz = math.floor(posx), math.floor(posy), math.floor(posz)
		{
			name: "New Waypoint at X: #{posx}, Y #{posy}, Z: #{posz}"
			:posx
			:posy
			:posz
			red: math.random(0, 255)
			green: math.random(0, 255)
			blue: math.random(0, 255)
			icon: Icon\GetIcons()[1]
		}
	OpenMenu: =>
		@frame = vgui.Create('DFrame')
		frame = @frame

		w, h = ScrW! - 200, ScrH! - 200
		frame\SetSize(w, h)
		frame\SetTitle("DMap #{@@DISPLAY_NAME} waypoints menu")
		frame\Center()
		frame\MakePopup()

		@topButtons = vgui.Create('EditablePanel', frame)
		@topButtons\Dock(TOP)
		@topButtons\SetSize(0, 20)

		@createButton = vgui.Create('DButton', @topButtons)
		@createButton\Dock(LEFT)
		@createButton\SetText('Create waypoint')
		@createButton\SizeToContents()
		@createButton.DoClick = ->
			@OpenEditMenu(@@GenerateData()) if DMaps.HasPermission(@@__PERM_VIEW)
			Derma_Message("You need '#{@@__PERM_EDIT}' permission!", 'Mission permissions', 'Okay') if not DMaps.HasPermission(@@__PERM_EDIT)
		@BuildList()
		return frame
	AddRowButtons: (row) => -- Override
	BuildList: =>
		return if not @IsValid()
		@scrollPanel\Remove() if IsValid(@scrollPanel)
		@scrollPanel = vgui.Create('DScrollPanel', @frame)
		@scrollPanel\Dock(FILL)
		v\Remove() for i, v in pairs @points
		@points = {}

		for point in *@list
			str = vgui.Create(@@ROW_PART_NAME, @scrollPanel)
			str\Dock(TOP)
			str\SetData(point)
			str.OnDelete = (pnl, id) -> @DoRemove(id)
			str.OpenEdit = (pnl, data) -> @OpenEditMenu(data)
			@AddRowButtons(str)
			table.insert(@points, str)
	CreateAdditionalMenus: (pnl) =>
	OpenEditMenu: (data) =>
		return Derma_Message("You need '#{@@__PERM_EDIT}' permission!", 'Mission permissions', 'Okay') if not DMaps.HasPermission(@@__PERM_EDIT)
		frame = vgui.Create('DFrame')
		@editFrame = frame
		Self = self
		self = frame
		confirmed = false

		w, h = 300, 500
		@SetSize(w, h)
		@SetTitle("Waypoint №#{data.id or '...'} edit menu")
		@Center()
		@MakePopup()
		@OnKeyCodePressed = (code = KEY_NONE) => @Close() if code == KEY_ESCAPE

		local newData

		@OnClose = ->
			return if not confirmed
			newData.id = data.id if newData
			local self
			self = Self

			if not data.id
				net.Start(@@NETWORK_STRING_CREATE)
				@WriteWaypointData(newData)
				net.SendToServer()
			else
				net.Start(@@NETWORK_STRING_MODIFY)
				@WriteWaypointData(newData, true)
				net.SendToServer()


		fieldsData = {
			{"Waypoint name", data.name}
			{"Position X", data.posx}
			{"Position Y", data.posy}
			{"Position Z", data.posz}
		}

		@labels = {}
		@fields = {}

		for field in *fieldsData
			str = vgui.Create('EditablePanel', @)
			with str
				\Dock(TOP)
				\SetSize(0, 20)
				.Paint = (w, h) =>
					surface.SetDrawColor(100, 100, 100)
					surface.DrawRect(0, 0, w, h)

			label = vgui.Create('DLabel', str)
			with label
				\Dock(LEFT)
				\DockMargin(5, 0, 5, 0)
				\SetText(field[1])
				\SetColor(color_white)
				\SizeToContents()
			table.insert(@labels, label)

			fieldPanel = vgui.Create('DTextEntry', str)
			with fieldPanel
				\Dock(FILL)
				\DockMargin(5, 0, 5, 0)
				\SetText(tostring(field[2]))
			table.insert(@fields, fieldPanel)

		timer.Simple 0.1, ->
			if IsValid(@) and IsValid(@fields[1])
				input.SetCursorPos(@fields[1]\LocalToScreen(5, 10))
				timer.Simple 0.1, -> gui.InternalMouseDoublePressed(MOUSE_LEFT)
				timer.Simple 0.2, -> gui.InternalMousePressed(MOUSE_LEFT)

		@iconStr = vgui.Create('EditablePanel', @)
		@iconStr\Dock(TOP)
		@iconStr\SetSize(0, 32)
		@iconStr.Paint = (w, h) =>
			surface.SetDrawColor(100, 100, 100)
			surface.DrawRect(0, 0, w, h)

		@iconStrLab = vgui.Create('DLabel', @iconStr)
		with @iconStrLab
			\SetColor(color_white)
			\Dock(LEFT)
			\SetText('Waypoint Icon:')
			\SizeToContents()
			\DockMargin(5, 0, 5, 0)

		dataColor = Color(data.red, data.green, data.blue)

		@icon = vgui.Create('DMapsIcon', @iconStr)
		@OnIconPress = (nIcon) =>
			if nIcon == @icon
				if IsValid(@IconList)
					@IconList\Close()
				else
					@IconList = vgui.Create('DMapsIconList')
					@IconList\Register(@)
					@IconList\SetColor(dataColor)
					x, y = @icon\LocalToScreen(32, 0)
					@IconList\OpenAt(x, y)
			else
				@IconList\Close()
				@icon\SetIcon(nIcon\GetIconName())
		@iconStr.OnIconPress = (s, icon) -> @OnIconPress(icon)

		@icon\SetIcon(data.icon)
		@icon\Dock(RIGHT)
		@icon\DockMargin(5, 0, 5, 0)
		@icon\SetColor(dataColor)
		@icon\RegisterThink(=> @SetColor(dataColor))

		decline = vgui.Create('DButton', @)
		with decline
			\SetText('Decline')
			\Dock(BOTTOM)
			\SetSize(0, 20)
			.DoClick = -> @Close()

		confirm = vgui.Create('DButton', @)
		with confirm
			\SetText('Save')
			\Dock(BOTTOM)
			\SetSize(0, 20)
			.DoClick = ->
				newData = Self\GrabData(@)
				confirmed = true
				@Close()

		Self\CreateAdditionalMenus(@, data)

		@picker = vgui.Create('DColorMixer', @)
		@picker\Dock(FILL)
		@picker\SetAlphaBar(false)
		@picker\SetColor(dataColor)
		@picker.ValueChanged = => dataColor = @GetColor()
		return frame
DMaps.ServerWaypointsContainer = ServerWaypointsContainer

import CAMI from _G

class ServerWaypointsContainerCAMI extends ServerWaypointsContainer
	@EDIT_PERMISSION = 'cami'
	@_NAME_ON_PANEL = 'CAMI usergroup'
	@NETWORK_STRING_PREFIX = 'DMaps.CAMIWaypoint'
	@DISPLAY_NAME = 'CAMI usergroups'

	@RegisterNetwork()

	new: (...) => super(...)

	@ReadWaypointData: => -- Override with super()
		read = super()
		read.ugroups = net.ReadString()
		return read
	WriteWaypointData: (data, writeID = false) => -- Override with super()
		super(data, writeID)
		net.WriteString(data.ugroups)
	@GenerateData: (...) =>
		data = super(...)
		data.ugroups = LocalPlayer()\GetUserGroup()
		return data
	AddRowButtons: (row) =>
		row.groups = vgui.Create('DLabel', row)
		with row.groups
			\Dock(LEFT)
			\SetText("Usergroups: #{row\GetData().ugroups}")
			\SetTooltip("Usergroups: #{row\GetData().ugroups}")
			\SizeToContents()
			\SetMouseInputEnabled(true)
			\SetTextColor(color_white)
	CreateBox: (select) =>
		newBox = vgui.Create('DComboBox', @groupsSelect)
		newBox\Dock(TOP)
		newBox\SetValue('<no group>')
		newBox\AddChoice('<no group>')
		i = 1
		newBox.groupsInv = {}
		for groupName, groupData in pairs CAMI.GetUsergroups()
			i += 1
			newBox\AddChoice(groupName)
			newBox.groupsInv[groupName] = i
		newBox\ChooseOptionID(newBox.groupsInv[select]) if select and newBox.groupsInv[select]
		newBox.OnSelect = (p, i, value) ->
			hit = false
			if i == 1 and #@boxes > 1
				for i, box in pairs @boxes
					if not box\GetSelectedID() or box\GetSelectedID() == 1
						if not hit
							hit = true
						else
							table.remove(@boxes, i)
							box\Remove()
							@groupsSelect\SetSize(0, #@boxes * 20 + 20)
							return
			elseif i ~= 1
				for i, box in pairs @boxes
					if not box\GetSelectedID() or box\GetSelectedID() == 1
						hit = true
						break
				@CreateBox() if not hit
		table.insert(@boxes, newBox)
		newBox\SetSize(0, 20)
		@groupsSelect\SetSize(0, math.min(#@boxes * 20 + 20, 120))
	CreateAdditionalMenus: (pnl, data) =>
		@groupsSelect = vgui.Create('DScrollPanel', pnl)
		with @groupsSelect
			\Dock(TOP)
			.Paint = (w, h) =>
				surface.SetDrawColor(100, 100, 100)
				surface.DrawRect(0, 0, w, h)
		@notifylab = vgui.Create('DLabel', @groupsSelect)
		@notifylab\Dock(TOP)
		@notifylab\SetText('Groups are inherited')
		@notifylab\SetTextColor(color_white)
		@boxes = {}
		grps = string.Explode(',', data.ugroups)
		if #grps ~= 0
			@CreateBox(group) for group in *grps
		@CreateBox()
	GrabData: (pnl) =>
		data = super(pnl)
		groups = {}
		for box in *@boxes
			if box\GetSelectedID() and box\GetSelectedID() ~= 1
				nm = box\GetSelected()
				table.insert(groups, nm) if not table.HasValue(groups, nm)
		data.ugroups = table.concat(groups, ',')
		return data

DMaps.ServerWaypointsContainerCAMI = ServerWaypointsContainerCAMI

class ServerWaypointsContainerTeam extends ServerWaypointsContainer
	@EDIT_PERMISSION = 'team'
	@_NAME_ON_PANEL = 'team'
	@NETWORK_STRING_PREFIX = 'DMaps.TeamWaypoint'
	@DISPLAY_NAME = 'teams waypoints'

	@RegisterNetwork()

	new: (...) => super(...)

	@ReadWaypointData: => -- Override with super()
		read = super()
		read.teams = net.ReadString()
		return read
	WriteWaypointData: (data, writeID = false) => -- Override with super()
		super(data, writeID)
		net.WriteString(data.teams)
	AddRowButtons: (row) =>
		row.teams = vgui.Create('DLabel', row)
		with row.teams
			\Dock(LEFT)
			teamStr = table.concat([team.GetName(tonumber(v)) or '%ERRORNAME%' for v in *string.Explode(',', row\GetData().teams)], ', ')
			\SetText("Teams: #{teamStr}")
			\SetTooltip("Teams: #{teamStr}")
			\SizeToContents()
			\SetMouseInputEnabled(true)
			\SetTextColor(color_white)
	@GenerateData: (...) =>
		data = super(...)
		data.teams = tostring(LocalPlayer()\Team())
		return data
	CreateBox: (select) =>
		newBox = vgui.Create('DComboBox', @teamsSelect)
		newBox\Dock(TOP)
		newBox\SetValue('<no team>')
		newBox\AddChoice('<no team>')
		i = 1
		newBox.teamsMap = {}
		newBox.teamsMap2 = {}
		newBox.teamsMap3 = {}
		for teamID, teamData in pairs team.GetAllTeams()
			i += 1
			newBox\AddChoice(teamData.Name)
			newBox.teamsMap[teamData.Name] = i
			newBox.teamsMap2[i] = teamID
			newBox.teamsMap3[teamID] = i
		newBox\ChooseOptionID(newBox.teamsMap3[select]) if select and newBox.teamsMap3[select]
		newBox.GetTeam = => @teamsMap2[@GetSelectedID()]
		newBox.OnSelect = (p, i, value) ->
			hit = false
			if i == 1 and #@boxes > 1
				for i, box in pairs @boxes
					if not box\GetSelectedID() or box\GetSelectedID() == 1
						if not hit
							hit = true
						else
							table.remove(@boxes, i)
							box\Remove()
							@teamsSelect\SetSize(0, #@boxes * 20 + 20)
							return
			elseif i ~= 1
				for i, box in pairs @boxes
					if not box\GetSelectedID() or box\GetSelectedID() == 1
						hit = true
						break
				@CreateBox() if not hit

		table.insert(@boxes, newBox)
		newBox\SetSize(0, 20)
		@groupsSelect\SetSize(0, math.min(#@boxes * 20 + 20, 120))
	CreateAdditionalMenus: (pnl, data) =>
		@teamsSelect = vgui.Create('DScrollPanel', pnl)
		with @teamsSelect
			\Dock(TOP)
			.Paint = (w, h) =>
				surface.SetDrawColor(100, 100, 100)
				surface.DrawRect(0, 0, w, h)
		@notifylab = vgui.Create('DLabel', @teamsSelect)
		@notifylab\Dock(TOP)
		@notifylab\SetText('Teams has explicit match')
		@notifylab\SetTextColor(color_white)
		@boxes = {}
		teams = [tonumber(v) for v in *string.Explode(',', data.teams)]
		if #teams ~= 0
			@CreateBox(tm) for tm in *teams
		@CreateBox()
	GrabData: (pnl) =>
		data = super(pnl)
		teams = {}
		for box in *@boxes
			if box\GetSelectedID() and box\GetSelectedID() ~= 1
				nm = box\GetTeam()
				table.insert(teams, nm) if not table.HasValue(teams, nm)
		data.teams = table.concat(teams, ',')
		return data

DMaps.ServerWaypointsContainerTeam = ServerWaypointsContainerTeam

class ServerWaypointsContainerUsergroups extends ServerWaypointsContainerCAMI
	@EDIT_PERMISSION = 'ugroup'
	@_NAME_ON_PANEL = 'usergroup'
	@NETWORK_STRING_PREFIX = 'DMaps.UsergroupWaypoint'
	@DISPLAY_NAME = 'usergroups'

	@RegisterNetwork()

	new: (...) => super(...)
	CreateAdditionalMenus: (pnl, data) =>
		super(pnl, data)
		@notifylab\SetText('Usergroups are excplicit')

DMaps.ServerWaypointsContainerUsergroups = ServerWaypointsContainerUsergroups

DMaps.ServerWaypointsContainers = {
	ServerWaypointsContainer
	ServerWaypointsContainerCAMI
	ServerWaypointsContainerTeam
	ServerWaypointsContainerUsergroups
}

DMaps.RegisterSVPointsContainer = (nclass) ->
	for c in *DMaps.ServerWaypointsContainers
		if c.__name == nclass.__name
			return false
	id = table.insert(DMaps.ServerWaypointsContainers, nclass)
	return true, id
hook.Run 'DMaps.RegisterSVPointsContainers', DMaps.RegisterSVPointsContainer, ServerWaypointsContainer
