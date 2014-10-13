if CLIENT then
local PANEL = {}

function RX2F4_Open_Shop(Parent,VIPMode)
	GAMEMODE.ConnectedPlayersPanel = vgui.Create("RX2F4_M_Shop",Parent)
	GAMEMODE.ConnectedPlayersPanel:SetSize(Parent:GetWide(),Parent:GetTall())
	GAMEMODE.ConnectedPlayersPanel.VIPMode = VIPMode or false
	return GAMEMODE.ConnectedPlayersPanel
end

function PANEL:Init()
end
function PANEL:Initialize()
end
	
function PANEL:Paint()
end

function PANEL:Install()
	self:SetDraggable(false)
	self:ShowCloseButton(false)
	self:SetTitle(" ")

	self.HasParent = HasParent
	self.TopLabel = vgui.Create( "DPanel" , self)
	self.TopLabel:SetPos(2,2)
	self.TopLabel:SetSize( self:GetWide(),40 )
	self.TopLabel.Paint = function(slf)
			surface.SetDrawColor( RX2F4_Adjust.Colors.SM.TitleLine )
			surface.DrawRect( 1, 39, slf:GetWide()-2, 1 )
		draw.SimpleText("Shop", "RXF2_TrebOut_S40", 20,20, RX2F4_Adjust.Colors.SM.TitleColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end
	
	self.FilterList = vgui.Create("DPanelList", self)
		self.FilterList:SetPos(10,50)
		self.FilterList:SetSize(150,self:GetTall() - 60)
		self.FilterList:SetSpacing(5);
		self.FilterList:SetPadding(0);
		self.FilterList:EnableVerticalScrollbar(true);
		self.FilterList:EnableHorizontal(true);
		self.FilterList:RX2F4_PaintListBarC()
		self.FilterList.Paint = function(slf)
			surface.SetDrawColor( 0,0,0,50 )
			surface.DrawRect( 0, 0, slf:GetWide(), slf:GetTall() )
		end
		
	local Menus = {} -- N is Printname. Do not touch M
		table.insert(Menus,{M="ammo",N="Ammos"})
		table.insert(Menus,{M="weapons",N="Weapons"})
		table.insert(Menus,{M="shipment",N="Shipments"})
		table.insert(Menus,{M="entity",N="Entities"})
		table.insert(Menus,{M="vehicle",N="Vehicles"})
		
		for k,v in pairs(Menus) do
			local SButton = vgui.Create( "RX2F4_DSWButton" )
				SButton:SetSize( self.FilterList:GetWide() , 30 )
				SButton.BoarderCol = Color(0,0,0,0)
				SButton.FXCol = RX2F4_Adjust.Colors.SM.LC_Effect
				SButton.TextCol = RX2F4_Adjust.Colors.SM.LC_Text
				SButton:SetTexts( v.N )
				SButton.PaintBackGround = function(slf)
					if self.CurFilter == v.M then
						surface.SetDrawColor( RX2F4_Adjust.Colors.SM.LC_Effect )
						surface.DrawRect( 0, 0, slf:GetWide(), slf:GetTall() )
					end
				end
				SButton.Click = function(slf)
					self:UpdateList(v.M)
				end
			self.FilterList:AddItem(SButton)
		end
	
	self.ItemList = vgui.Create("DPanelList", self)
		self.ItemList:SetPos(170,50)
		self.ItemList:SetSize(self:GetWide()-180,self:GetTall() - 60)
		self.ItemList:SetSpacing(5);
		self.ItemList:SetPadding(0);
		self.ItemList:EnableVerticalScrollbar(true);
		self.ItemList:EnableHorizontal(true);
		self.ItemList:RX2F4_PaintListBarC()
		self.ItemList.Paint = function(slf)
			surface.SetDrawColor( 0,0,0,50 )
			surface.DrawRect( 0, 0, slf:GetWide(), slf:GetTall() )
		end
		
	self:UpdateList()
end

function PANEL:UpdateList(filter)
	filter = filter or "ammo"
	self.CurFilter = filter
	
	self.ItemList:Clear()
	List = self.ItemList
	
	---- Ammo ----
	if filter == "ammo" then
		local function AddAmmoIcon(Count,DATA)
			local Name = DATA.name
			local Currency = GAMEMODE.Config.currency or "$"
			local Price = DATA.price
			
				local BGP = vgui.Create("RX2F4_DSWButton")
				BGP:SetSize(List:GetWide()/2-5,70)
				BGP:SetBoarderColor(Color(0,0,0,0))
				BGP.FXCol = RX2F4_Adjust.Colors.SM.IL_ButtonFX
				BGP.Click = function() if self.VIPMode and !RX2F4VIPCheck(LocalPlayer()) then return end RunConsoleCommand("DarkRP","buyammo",DATA.ammoType) end
				BGP.PaintOverlay = function(slf)
					surface.SetDrawColor( RX2F4_Adjust.Colors.SM.IL_Line )
					surface.DrawRect( 1, slf:GetTall()-1, slf:GetWide()-2, 1 )
					draw.SimpleText(Name, "RXF2_TrebOut_S30", 90,5, RX2F4_Adjust.Colors.SM.IL_Text)
					draw.SimpleText(Currency .. " " .. Price, "RXF2_TrebOut_S25", 90,35, RX2F4_Adjust.Colors.SM.IL_Price)
				end
				BGP:SetToolTip(Name)
				BGP:RX2F4_PanelAnim_Fade({Speed=0.2,Delay=math.ceil(Count/2)/20,Fade=10})
				
				local icon = vgui.Create("ModelImage",BGP)
				icon:SetSize(BGP:GetTall(),BGP:GetTall())
				icon:SetModel(DATA.model)
			self.ItemList:AddItem(BGP)
		end
		local Count = 0
		for k,v in pairs(GAMEMODE.AmmoTypes) do
			if !self.VIPMode and v.VIPOnly then 
				continue 
			end
			if self.VIPMode and !v.VIPOnly then 
				continue 
			end
			
			if not v.customCheck or v.customCheck(LocalPlayer()) then
				Count = Count + 1
				AddAmmoIcon(Count,v)
			end
		end
	end
	---- CustomShipments ----
	if filter == "weapons" then
		local function AddIcon(Count,DATA)
			local Name = DATA.name
			local Currency = GAMEMODE.Config.currency or "$"
			local Price = (DATA.pricesep or "")
			
				local BGP = vgui.Create("RX2F4_DSWButton")
				BGP:SetSize(List:GetWide()/2-5,70)
				BGP:SetBoarderColor(Color(0,0,0,0))
				BGP.FXCol = RX2F4_Adjust.Colors.SM.IL_ButtonFX
			BGP.Click = function()  if self.VIPMode and !RX2F4VIPCheck(LocalPlayer()) then return end RunConsoleCommand("DarkRP","buy",DATA.name) end
				BGP.PaintOverlay = function(slf)
					surface.SetDrawColor( RX2F4_Adjust.Colors.SM.IL_Line )
					surface.DrawRect( 1, slf:GetTall()-1, slf:GetWide()-2, 1 )
					draw.SimpleText(Name, "RXF2_TrebOut_S30", 90,5, RX2F4_Adjust.Colors.SM.IL_Text)
					draw.SimpleText(Currency .. " " .. Price, "RXF2_TrebOut_S25", 90,35, RX2F4_Adjust.Colors.SM.IL_Price)
				end
				BGP:SetToolTip(Name)
				BGP:RX2F4_PanelAnim_Fade({Speed=0.2,Delay=math.ceil(Count/2)/20,Fade=10})
				
				local icon = vgui.Create("ModelImage",BGP)
				icon:SetSize(BGP:GetTall(),BGP:GetTall())
				icon:SetModel(DATA.model)
			self.ItemList:AddItem(BGP)
		end
		local Count = 0
		for k,v in pairs(CustomShipments) do
			if !self.VIPMode and v.VIPOnly then 
				continue 
			end
			if self.VIPMode and !v.VIPOnly then 
				continue 
			end
			if not GAMEMODE:CustomObjFitsMap(v) then continue end
			if (v.seperate and (not GAMEMODE.Config.restrictbuypistol or
				(GAMEMODE.Config.restrictbuypistol and (not v.allowed[1] or table.HasValue(v.allowed, LocalPlayer():Team())))))
				and (not v.customCheck or v.customCheck and v.customCheck(LocalPlayer())) then
				Count = Count + 1
				AddIcon(Count,v)
			end
		end
	end
	---- CustomShipments B----
	if filter == "shipment" then
		local function AddShipIcon(Count,DATA)
			local Name = DATA.name
			local Currency = GAMEMODE.Config.currency or "$"
			local Price = (DATA.price or 0)
			
				local BGP = vgui.Create("RX2F4_DSWButton")
				BGP:SetSize(List:GetWide()/2-5,70)
				BGP:SetBoarderColor(Color(0,0,0,0))
				BGP.FXCol = RX2F4_Adjust.Colors.SM.IL_ButtonFX
				BGP.Click = function()  if self.VIPMode and !RX2F4VIPCheck(LocalPlayer()) then return end RunConsoleCommand("DarkRP","buyshipment",DATA.name) end
				BGP.PaintOverlay = function(slf)
					surface.SetDrawColor( RX2F4_Adjust.Colors.SM.IL_Line )
					surface.DrawRect( 1, slf:GetTall()-1, slf:GetWide()-2, 1 )
					draw.SimpleText(Name, "RXF2_TrebOut_S30", 90,5, RX2F4_Adjust.Colors.SM.IL_Text)
					draw.SimpleText(Currency .. " " .. Price, "RXF2_TrebOut_S25", 90,35, RX2F4_Adjust.Colors.SM.IL_Price)
				end
				BGP:SetToolTip(Name)
				BGP:RX2F4_PanelAnim_Fade({Speed=0.2,Delay=math.ceil(Count/2)/20,Fade=10})
				
				local icon = vgui.Create("ModelImage",BGP)
				icon:SetSize(BGP:GetTall(),BGP:GetTall())
				icon:SetModel(DATA.model)
			self.ItemList:AddItem(BGP)
		end
		local Count = 0
		for k,v in pairs(CustomShipments) do
			if !self.VIPMode and v.VIPOnly then 
				continue 
			end
			if self.VIPMode and !v.VIPOnly then 
				continue 
			end
			
			if not GAMEMODE:CustomObjFitsMap(v) then continue end
			if not v.noship and table.HasValue(v.allowed, LocalPlayer():Team())
				and (not v.customCheck or (v.customCheck and v.customCheck(LocalPlayer()))) then
				Count = Count + 1
				AddShipIcon(Count,v)
			end
		end
	end
	---- Entities ----
	if filter == "entity" then
		local function AddEntIcon(Count,DATA)
			local Name = DATA.name
			local Currency = GAMEMODE.Config.currency or "$"
			local Price = (DATA.price or 0)
			
				local BGP = vgui.Create("RX2F4_DSWButton")
				BGP:SetSize(List:GetWide()/2-5,70)
				BGP:SetBoarderColor(Color(0,0,0,0))
				BGP.FXCol = RX2F4_Adjust.Colors.SM.IL_ButtonFX
				BGP.Click = function()  if self.VIPMode and !RX2F4VIPCheck(LocalPlayer()) then return end RunConsoleCommand("DarkRP",DATA.cmd) end
				BGP.PaintOverlay = function(slf)
					surface.SetDrawColor( RX2F4_Adjust.Colors.SM.IL_Line )
					surface.DrawRect( 1, slf:GetTall()-1, slf:GetWide()-2, 1 )
					draw.SimpleText(Name, "RXF2_TrebOut_S30", 90,5, RX2F4_Adjust.Colors.SM.IL_Text)
					draw.SimpleText(Currency .. " " .. Price, "RXF2_TrebOut_S25", 90,35, RX2F4_Adjust.Colors.SM.IL_Price)
				end
				BGP:SetToolTip(Name)
				BGP:RX2F4_PanelAnim_Fade({Speed=0.2,Delay=math.ceil(Count/2)/20,Fade=10})
				
				local icon = vgui.Create("ModelImage",BGP)
				icon:SetSize(BGP:GetTall(),BGP:GetTall())
				icon:SetModel(DATA.model)
			self.ItemList:AddItem(BGP)
		end
		local function AddFoodIcon(Count,K,DATA)
			local Name = K
			local Currency = GAMEMODE.Config.currency or "$"
			local Price = (15)
			
				local BGP = vgui.Create("RX2F4_DSWButton")
				BGP:SetSize(List:GetWide()/2-5,70)
				BGP:SetBoarderColor(Color(0,0,0,0))
				BGP.FXCol = RX2F4_Adjust.Colors.SM.IL_ButtonFX
				BGP.Click = function()  if self.VIPMode and !RX2F4VIPCheck(LocalPlayer()) then return end RunConsoleCommand("DarkRP",DATA.cmd) end
				BGP.PaintOverlay = function(slf)
					surface.SetDrawColor( RX2F4_Adjust.Colors.SM.IL_Line )
					surface.DrawRect( 1, slf:GetTall()-1, slf:GetWide()-2, 1 )
					draw.SimpleText(Name, "RXF2_TrebOut_S30", 90,5, RX2F4_Adjust.Colors.SM.IL_Text)
					draw.SimpleText(Currency .. " " .. Price, "RXF2_TrebOut_S25", 90,35, RX2F4_Adjust.Colors.SM.IL_Price)
				end
				BGP:SetToolTip(Name)
				BGP:RX2F4_PanelAnim_Fade({Speed=0.2,Delay=math.ceil(Count/2)/20,Fade=10})
				
				local icon = vgui.Create("ModelImage",BGP)
				icon:SetSize(BGP:GetTall(),BGP:GetTall())
				icon:SetModel(DATA.model)
			self.ItemList:AddItem(BGP)
		end
			local Count = 0
						for k,v in pairs(DarkRPEntities) do
							if !self.VIPMode and v.VIPOnly then 
								continue 
							end
							if self.VIPMode and !v.VIPOnly then 
								continue 
							end
							if not v.allowed or (type(v.allowed) == "table" and table.HasValue(v.allowed, LocalPlayer():Team()))
								and (not v.customCheck or (v.customCheck and v.customCheck(LocalPlayer()))) then
								local cmdname = string.gsub(v.ent, " ", "_")
								Count = Count + 1
								AddEntIcon(Count,v)
							end
						end

						if FoodItems and (GAMEMODE.Config.foodspawn or LocalPlayer():Team() == TEAM_COOK) and LocalPlayer():Team() == TEAM_COOK then
							for k,v in pairs(FoodItems) do
								if !self.VIPMode and v.VIPOnly then 
									continue 
								end
								if self.VIPMode and !v.VIPOnly then 
									continue 
								end
								Count = Count + 1
								AddFoodIcon(Count,k,v)
							end
						end
	end
	---- Entities ----
	if filter == "vehicle" then
		local function AddVehicleIcon(Count,DATA)
			local Skin = (DarkRP.getAvailableVehicles and DarkRP.getAvailableVehicles()[DATA.name] and DarkRP.getAvailableVehicles()[DATA.name].KeyValues and DarkRP.getAvailableVehicles()[DATA.name].KeyValues.Skin) or "0"
			local Name = DATA.name
			local Currency = GAMEMODE.Config.currency or "$"
			local Price = DATA.price
			
				local BGP = vgui.Create("RX2F4_DSWButton")
				BGP:SetSize(List:GetWide()/2-5,70)
				BGP:SetBoarderColor(Color(0,0,0,0))
				BGP.FXCol = RX2F4_Adjust.Colors.SM.IL_ButtonFX
				BGP.Click = function()  if self.VIPMode and !RX2F4VIPCheck(LocalPlayer()) then return end RunConsoleCommand("DarkRP","buyvehicle",DATA.name) end
				BGP.PaintOverlay = function(slf)
					surface.SetDrawColor( RX2F4_Adjust.Colors.SM.IL_Line )
					surface.DrawRect( 1, slf:GetTall()-1, slf:GetWide()-2, 1 )
					draw.SimpleText(Name, "RXF2_TrebOut_S30", 90,5, RX2F4_Adjust.Colors.SM.IL_Text)
					draw.SimpleText(Currency .. " " .. Price, "RXF2_TrebOut_S25", 90,35, RX2F4_Adjust.Colors.SM.IL_Price)
				end
				BGP:SetToolTip(Name)
				BGP:RX2F4_PanelAnim_Fade({Speed=0.2,Delay=math.ceil(Count/2)/20,Fade=10})
				
				local icon = vgui.Create("SpawnIcon",BGP)
				icon:SetSize(BGP:GetTall(),BGP:GetTall())
				icon:SetModel(DATA.model)
				icon:SetSkin(Skin)
			self.ItemList:AddItem(BGP)
		end
			local Count = 0
					for k,v in pairs(CustomVehicles) do
						if !self.VIPMode and v.VIPOnly then 
							continue 
						end
						if self.VIPMode and !v.VIPOnly then 
							continue 
						end
						if (not v.allowed or table.HasValue(v.allowed, LocalPlayer():Team())) and (not v.customCheck or v.customCheck(LocalPlayer())) then
							Count = Count + 1
							AddVehicleIcon(Count,v)
						end
					end
	end
end
vgui.Register("RX2F4_M_Shop", PANEL, "DFrame")

end -- client end