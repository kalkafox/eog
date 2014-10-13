if CLIENT then
local PANEL = {}

function RX2F4_Open_JobSelector(Parent,VIPMode)
	GAMEMODE.ConnectedPlayersPanel = vgui.Create("RX2F4_M_JobSelector",Parent)
	GAMEMODE.ConnectedPlayersPanel:SetSize(Parent:GetWide(),Parent:GetTall())
	GAMEMODE.ConnectedPlayersPanel.VIPMode = VIPMode or false
	return GAMEMODE.ConnectedPlayersPanel
end
function PANEL:Init()

end
function PANEL:Paint()

end

function PANEL:Install()
	self.TopLabel = vgui.Create( "DPanel" , self)
	self.TopLabel:SetPos(2,2)
	self.TopLabel:SetSize( self:GetWide(),40 )
	self.TopLabel.Paint = function(slf)
			surface.SetDrawColor( RX2F4_Adjust.Colors.JM.TitleLine )
			surface.DrawRect( 1, 39, slf:GetWide()-2, 1 )
		draw.SimpleText("Choose your job.", "RXF2_TrebOut_S40", 20,20, RX2F4_Adjust.Colors.JM.TitleColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end
	
	self.PlayerList = vgui.Create("DPanelList", self)
		self.PlayerList:SetPos(10,50)
		self.PlayerList:SetSize(self:GetWide()-20,self:GetTall() - 60)
		self.PlayerList:SetSpacing(8);
		self.PlayerList:SetPadding(0);
		self.PlayerList:EnableVerticalScrollbar(true);
		self.PlayerList:EnableHorizontal(false);
		self.PlayerList:RX2F4_PaintListBarC()
		self.PlayerList.Paint = function(slf)
			surface.SetDrawColor( 0,0,0,50 )
			surface.DrawRect( 0, 0, slf:GetWide(), slf:GetTall() )
		end
		
	self.JobInfoLister = vgui.Create("DPanelList", self)
		self.JobInfoLister:SetPos(10+self.JobInfoLister:GetWide()+5,50)
		self.JobInfoLister:SetSize(1,self:GetTall() - 60)
		self.JobInfoLister:SetSpacing(8);
		self.JobInfoLister:SetPadding(0);
		self.JobInfoLister:EnableVerticalScrollbar(true);
		self.JobInfoLister:EnableHorizontal(false);
		self.JobInfoLister:RX2F4_PaintListBarC()
		self.JobInfoLister.Paint = function(slf)
			surface.SetDrawColor( 0,0,0,50 )
			surface.DrawRect( 0, 0, slf:GetWide(), slf:GetTall() )
		end
		
	
		
	self:UpdateList()
end

function PANEL:UpdateList()
	self.PlayerList:Clear()
	local List = self.PlayerList
		local function AddIcon(Count,Model, name, description, Weapons, command, special, specialcommand)
			local JTB = {}
			local PlayerCount = 0
			for a,b in pairs(RPExtraTeams) do
				if b.name == name then
					for k,v in pairs(player.GetAll()) do
						if v:Team() == a then
							PlayerCount = PlayerCount + 1
						end
					end
					JTB = b
				end
			end
			
			local BGP = vgui.Create("RX2F4_DSWButton")
			BGP:SetSize(List:GetWide(),70)
			BGP:SetBoarderColor(Color(0,0,0,0))
			BGP.FXCol = RX2F4_Adjust.Colors.JM.HoverFX
			BGP.PaintOverlay = function(slf)
				surface.SetDrawColor( RX2F4_Adjust.Colors.JM.Line )
				surface.DrawRect( 1, slf:GetTall()-1, slf:GetWide()-2, 1 )
				draw.SimpleTextOutlined(name, "RXF2_Treb_S30", 80,-3, (JTB.color or Color(200,200,200,255)),TEXT_ALIGN_LEFT,TEXT_ALIGN_BOTTOM,1,Color(0,0,0,255))
				draw.SimpleText("Salary : $" .. JTB.salary, "RXF2_TrebOut_S20", 90,25, RX2F4_Adjust.Colors.JM.Salary_MaxText)
				draw.SimpleText("Max : " .. PlayerCount .. " / " .. JTB.max, "RXF2_TrebOut_S20", 90,45, RX2F4_Adjust.Colors.JM.Salary_MaxText)
			end
			BGP:RX2F4_PanelAnim_Fade({Speed=0.2,Delay=Count/20,Fade=10})
			
				local GUNISTER = vgui.Create("DPanelList", BGP)
					GUNISTER:SetPos(BGP:GetWide()-400,5)
					GUNISTER:SetSize(380,60)
					GUNISTER:SetSpacing(0);
					GUNISTER:SetPadding(0);
					GUNISTER:EnableVerticalScrollbar(true);
					GUNISTER:EnableHorizontal(false);
					GUNISTER:RX2F4_PaintListBarC(Color(0,0,0,0),Color(0,0,0,0))

				
				local GUN = vgui.Create("DPanel")
				GUN:SetSize(500,math.ceil(#(JTB.weapons or {})/2)*20)
				GUN.Paint = function(slf)
					for k,v in pairs(JTB.weapons or {}) do
						draw.SimpleText("-" .. v, "RXF2_TrebOut_S20", 0 + ((k+1)%2)*200,-20 + math.ceil(k/2)*20, RX2F4_Adjust.Colors.JM.WeaponList)
					end
				end
				GUN.OnCursorEntered = function(slf) BGP:OnCursorEntered() end
				GUN.OnCursorExited = function(slf) BGP:OnCursorExited() end
				GUNISTER:AddItem(GUN)
			
			local icon = vgui.Create("ModelImage",BGP)
			icon:SetSize(BGP:GetTall(),BGP:GetTall())
			local IconModel = Model
			if type(Model) == "table" then
				IconModel = Model[math.random(#Model)]
			end
			icon:SetModel(IconModel)
					icon.OnCursorEntered = function(slf) 
						slf.Hover = true 
						local IP = slf:CreateHoverInfoPanel()
						IP:SetSize(550,270)
						IP.Paint = function(slf)
							surface.SetDrawColor( 0,0,0,200 )
							surface.DrawRect( 0, 0, slf:GetWide(), slf:GetTall() )
							slf:RX2F4_DrawBoarder(1,RX2F4_Adjust.Colors.JMHP.Boarder)
							
							draw.SimpleText(name, "RXF2_TrebOut_S30", 10,5, (JTB.color or Color(200,200,200,255)))
						end
						local LABEL = vgui.Create("DLabel",IP)
						LABEL:SetText(description)
						LABEL:SetColor(RX2F4_Adjust.Colors.JMHP.Description)
						LABEL:SizeToContents()
						LABEL:SetPos(10,40)
						
						local PMD = vgui.Create( "Login_PlayerModelDrawer", IP )
							PMD:SetPos( IP:GetWide() - IP:GetTall()/1.3, 0)
							PMD:SetSize( IP:GetTall()/1.2, IP:GetTall()*1.15 )
							PMD:SetUp()
							PMD.PMEntity:SetModel(IconModel)
					end
				BGP.Click = function()
					 if self.VIPMode and !RX2F4VIPCheck(LocalPlayer()) then return end 
					local function DoChatCommand(frame)
						if special then
							local menu = DermaMenu()
							menu:AddOption("Vote" , function() RunConsoleCommand("darkrp","vote" .. command) frame:Close() end)
							menu:AddOption("Do not vote", function() RunConsoleCommand("darkrp",command) frame:Close() end)
							menu:Open()
						else
							if JTB.vote then
								RunConsoleCommand("darkrp","vote" .. command)
							else
								RunConsoleCommand("darkrp",command)
							end
							
							frame:Close()
						end
					end

					if type(Model) == "table" and #Model > 0 then
						local frame = vgui.Create("DFrame")
						frame:SetTitle("Choose model")
						frame:SetVisible(true)
						frame:MakePopup()
						frame.Paint = function(slf)
							surface.SetDrawColor( 0,0,0,200 )
							surface.DrawRect( 0, 0, slf:GetWide(), slf:GetTall() )
							slf:RX2F4_DrawBoarder()
						end
						
						local levels = 1
						local IconsPerLevel = math.floor(ScrW()/64)

						while #Model * (64/levels) > ScrW() do
							levels = levels + 1
						end
						frame:SetSize(math.Min(#Model * 64, IconsPerLevel*64), math.Min(90+(64*(levels-1)), ScrH()))
						frame:Center()

						local CurLevel = 1
						for k,v in pairs(Model) do
							local icon = vgui.Create("SpawnIcon", frame)
							if (k-IconsPerLevel*(CurLevel-1)) > IconsPerLevel then
								CurLevel = CurLevel + 1
							end
							icon:SetPos((k-1-(CurLevel-1)*IconsPerLevel) * 64, 25+(64*(CurLevel-1)))
							icon:SetModel(v)
							icon:SetSize(64, 64)
							icon:SetToolTip()
							icon.DoClick = function()
								RunConsoleCommand("rp_playermodel", v)
								RunConsoleCommand("_rp_ChosenModel", v)
								DoChatCommand(frame)
							end
						end
					else
						if special then
							local menu = DermaMenu()
							menu:AddOption("Vote", function() RunConsoleCommand("darkrp","vote"..command) end)
							menu:AddOption("Do not vote", function() RunConsoleCommand("darkrp",command) end)
							menu:Open()
						else
							if JTB.vote then
								RunConsoleCommand("darkrp","vote" .. command)
							else
								RunConsoleCommand("darkrp",command)
							end
						end
					end
				end
				self.PlayerList:AddItem(BGP)
		end
	
		local JCount = 0
	
		for k,v in ipairs(RPExtraTeams) do
			if LocalPlayer():Team() ~= k and GAMEMODE:CustomObjFitsMap(v) then
				local nodude = true
				
				
				if self.VIPMode and !v.VIPOnly then 
					nodude = false
				end
				
				if !self.VIPMode and v.VIPOnly then 
					nodude = false
				end
				
				if v.admin == 1 and not LocalPlayer():IsAdmin() then
					nodude = false
				end
				if v.admin > 1 and not LocalPlayer():IsSuperAdmin() then
					nodude = false
				end
				if v.customCheck and not v.customCheck(LocalPlayer()) then
					nodude = false
				end

				if (type(v.NeedToChangeFrom) == "number" and LocalPlayer():Team() ~= v.NeedToChangeFrom) or (type(v.NeedToChangeFrom) == "table" and not table.HasValue(v.NeedToChangeFrom, LocalPlayer():Team())) then
					nodude = false
				end

				if nodude then
					local weps = "no extra weapons"
					if #v.weapons > 0 then
						weps = table.concat(v.weapons, "\n")
					end
					if (not v.RequiresVote and v.vote) or (v.RequiresVote and v.RequiresVote(LocalPlayer(), k)) then
						local condition = ((v.admin == 0 and LocalPlayer():IsAdmin()) or (v.admin == 1 and LocalPlayer():IsSuperAdmin()) or LocalPlayer().DarkRPVars["Priv"..v.command])
						if not v.model or not v.name or not v.description or not v.command then chat.AddText(Color(255,0,0,255), "Incorrect team! Fix your shared.lua!") return end
						JCount = JCount + 1
						AddIcon(JCount,v.model, v.name, v.description, weps,v.command, condition,v.command)
					else
						if not v.model or not v.name or not v.description or not v.command then chat.AddText(Color(255,0,0,255), "Incorrect team! Fix your shared.lua!") return end
						JCount = JCount + 1
						AddIcon(JCount,v.model, v.name, v.description, weps,v.command)
					end
				end
			end
		end
	
	
end
vgui.Register("RX2F4_M_JobSelector",PANEL,"DPanel")

end