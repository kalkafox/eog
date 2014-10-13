if CLIENT then
local PANEL = {}

	local function CreateSpaceM(PANEL,tall)
		local Spacing = PANEL:Add("DPanel")
		Spacing:SetSize(100,tall)
		Spacing.Paint = function(slf) end
	end 

local function MayorOptns()
	local MayCat = vgui.Create("DCollapsibleCategory")
	function MayCat:Paint()
	end
	MayCat:SetLabel("Mayor options")
		local maypanel = vgui.Create("DListLayout")
		maypanel:SetSize(740,170)
		
			local SearchWarrant = maypanel:Add("RX2F4_DSWButton")
			SearchWarrant.TextCol = RX2F4_Adjust.Colors.CM.MOA_ButtonText
			SearchWarrant.BoarderCol = RX2F4_Adjust.Colors.CM.MOA_ButtonBoarder
			SearchWarrant.FXCol = RX2F4_Adjust.Colors.CM.MOA_ButtonFX
			SearchWarrant:SetSize(700,30)
			SearchWarrant:SetTexts(DarkRP.getPhrase("searchwarrantbutton"))
			SearchWarrant.DoClick = function()
				local menu = DermaMenu()
				for _,ply in pairs(player.GetAll()) do
					if not ply:getDarkRPVar("warrant") and ply ~= LocalPlayer() then
						menu:AddOption(ply:Nick(), function()
							Derma_StringRequest("Warrant", "Why would you warrant "..ply:Nick().."?", nil,
								function(a)
									RunConsoleCommand("darkrp", "warrant", ply:SteamID(), a)
								end,
							function() end )
						end)
					end
				end
				menu:Open()
			end
			
			CreateSpaceM(maypanel,3)

			local Warrant = maypanel:Add("RX2F4_DSWButton")
			Warrant.TextCol = RX2F4_Adjust.Colors.CM.MOA_ButtonText
			Warrant.BoarderCol = RX2F4_Adjust.Colors.CM.MOA_ButtonBoarder
			Warrant.FXCol = RX2F4_Adjust.Colors.CM.MOA_ButtonFX
			Warrant:SetSize(700,30)
			Warrant:SetTexts(DarkRP.getPhrase("make_wanted"))
			Warrant.DoClick = function()
				local menu = DermaMenu()
				for _,ply in pairs(player.GetAll()) do
					if not ply:getDarkRPVar("wanted") and ply ~= LocalPlayer() then
						menu:AddOption(ply:Nick(), function() Derma_StringRequest("wanted", "Why would you make "..ply:Nick().." wanted?", nil,
								function(a)
									RunConsoleCommand("darkrp", "wanted", ply:SteamID(), a)
								end,
							function() end )
						end)
					end
				end
				menu:Open()
			end
			
			CreateSpaceM(maypanel,3)

			local UnWarrant = maypanel:Add("RX2F4_DSWButton")
			UnWarrant.TextCol = RX2F4_Adjust.Colors.CM.MOA_ButtonText
			UnWarrant.BoarderCol = RX2F4_Adjust.Colors.CM.MOA_ButtonBoarder
			UnWarrant.FXCol = RX2F4_Adjust.Colors.CM.MOA_ButtonFX
			UnWarrant:SetSize(700,30)
			UnWarrant:SetTexts(DarkRP.getPhrase("make_unwanted"))
			UnWarrant.DoClick = function()
				local menu = DermaMenu()
				for _,ply in pairs(player.GetAll()) do
					if ply:getDarkRPVar("wanted") and ply ~= LocalPlayer() then
						menu:AddOption(ply:Nick(), function() LocalPlayer():ConCommand("darkrp unwanted \"" .. ply:SteamID() .. "\"") end)
					end
				end
				menu:Open()
			end
			
			CreateSpaceM(maypanel,3)

			local Lockdown = maypanel:Add("RX2F4_DSWButton")
			Lockdown.TextCol = RX2F4_Adjust.Colors.CM.MOA_ButtonText
			Lockdown.BoarderCol = RX2F4_Adjust.Colors.CM.MOA_ButtonBoarder
			Lockdown.FXCol = RX2F4_Adjust.Colors.CM.MOA_ButtonFX
			Lockdown:SetSize(700,30)
			Lockdown:SetTexts(DarkRP.getPhrase("initiate_lockdown"))
			Lockdown.DoClick = function()
				LocalPlayer():ConCommand("darkrp lockdown")
			end
			
			CreateSpaceM(maypanel,3)

			local UnLockdown = maypanel:Add("RX2F4_DSWButton")
			UnLockdown.TextCol = RX2F4_Adjust.Colors.CM.MOA_ButtonText
			UnLockdown.BoarderCol = RX2F4_Adjust.Colors.CM.MOA_ButtonBoarder
			UnLockdown.FXCol = RX2F4_Adjust.Colors.CM.MOA_ButtonFX
			UnLockdown:SetSize(700,30)
			UnLockdown:SetTexts(DarkRP.getPhrase("stop_lockdown"))
			UnLockdown.DoClick = function()
				LocalPlayer():ConCommand("darkrp unlockdown")
			end
			
			CreateSpaceM(maypanel,3)

			local Lottery = maypanel:Add("RX2F4_DSWButton")
			Lottery.TextCol = RX2F4_Adjust.Colors.CM.MOA_ButtonText
			Lottery.BoarderCol = RX2F4_Adjust.Colors.CM.MOA_ButtonBoarder
			Lottery.FXCol = RX2F4_Adjust.Colors.CM.MOA_ButtonFX
			Lottery:SetSize(700,30)
			Lottery:SetTexts(DarkRP.getPhrase("start_lottery"))
			Lottery.DoClick = function()
				LocalPlayer():ConCommand("darkrp lottery")
			end
			
			CreateSpaceM(maypanel,3)

			local GiveLicense = maypanel:Add("RX2F4_DSWButton")
			GiveLicense.TextCol = RX2F4_Adjust.Colors.CM.MOA_ButtonText
			GiveLicense.BoarderCol = RX2F4_Adjust.Colors.CM.MOA_ButtonBoarder
			GiveLicense.FXCol = RX2F4_Adjust.Colors.CM.MOA_ButtonFX
			GiveLicense:SetSize(700,30)
			GiveLicense:SetTexts(DarkRP.getPhrase("give_license_lookingat"))
			GiveLicense.DoClick = function()
				LocalPlayer():ConCommand("darkrp givelicense")
			end
			
			CreateSpaceM(maypanel,3)

			local PlaceLaws = maypanel:Add("RX2F4_DSWButton")
			PlaceLaws.TextCol = RX2F4_Adjust.Colors.CM.MOA_ButtonText
			PlaceLaws.BoarderCol = RX2F4_Adjust.Colors.CM.MOA_ButtonBoarder
			PlaceLaws.FXCol = RX2F4_Adjust.Colors.CM.MOA_ButtonFX
			PlaceLaws:SetSize(700,30)
			PlaceLaws:SetTexts("Place a screen containing the laws.")
			PlaceLaws.DoClick = function()
				LocalPlayer():ConCommand("darkrp placelaws")
			end
			
			CreateSpaceM(maypanel,3)

			local AddLaws = maypanel:Add("RX2F4_DSWButton")
			AddLaws.TextCol = RX2F4_Adjust.Colors.CM.MOA_ButtonText
			AddLaws.BoarderCol = RX2F4_Adjust.Colors.CM.MOA_ButtonBoarder
			AddLaws.FXCol = RX2F4_Adjust.Colors.CM.MOA_ButtonFX
			AddLaws:SetSize(700,30)
			AddLaws:SetTexts("Add a law.")
			AddLaws.DoClick = function()
				Derma_StringRequest("Add a law", "Type the law you would like to add here.", "", function(law)
					RunConsoleCommand("darkrp", "addlaw", law)
				end)
			end
			
			CreateSpaceM(maypanel,3)

			local RemLaws = maypanel:Add("RX2F4_DSWButton")
			RemLaws.TextCol = RX2F4_Adjust.Colors.CM.MOA_ButtonText
			RemLaws.BoarderCol = RX2F4_Adjust.Colors.CM.MOA_ButtonBoarder
			RemLaws.FXCol = RX2F4_Adjust.Colors.CM.MOA_ButtonFX
			RemLaws:SetSize(700,30)
			RemLaws:SetTexts("Remove a law.")
			RemLaws.DoClick = function()
				Derma_StringRequest("Remove a law", "Enter the number of the law you would like to remove here.", "", function(num)
					LocalPlayer():ConCommand("darkrp removelaw " .. num)
				end)
			end
	MayCat:SetContents(maypanel)
	MayCat:SetSkin(GAMEMODE.Config.DarkRPSkin)
	return MayCat
end

local function CPOptns()
	local CPCat = vgui.Create("DCollapsibleCategory")
	function CPCat:Paint()
	end
	CPCat:SetLabel("Police options")
		local CPpanel = vgui.Create("DListLayout")
		CPpanel:SetSize(740,170)
		
			local SearchWarrant = CPpanel:Add("RX2F4_DSWButton")
			SearchWarrant.TextCol = RX2F4_Adjust.Colors.CM.PA_ButtonText
			SearchWarrant.BoarderCol = RX2F4_Adjust.Colors.CM.PA_ButtonBoarder
			SearchWarrant.FXCol = RX2F4_Adjust.Colors.CM.PA_ButtonFX
			SearchWarrant:SetSize(740,30)
			SearchWarrant:SetTexts(DarkRP.getPhrase("request_warrant"))
			SearchWarrant.DoClick = function()
				local menu = DermaMenu()
				for _,ply in pairs(player.GetAll()) do
					if not ply:getDarkRPVar("warrant") and ply ~= LocalPlayer() then
						menu:AddOption(ply:Nick(), function()
							Derma_StringRequest("Warrant", "Why would you warrant "..ply:Nick().."?", nil,
								function(a)
									RunConsoleCommand("darkrp", "warrant", ply:SteamID(), a)
								end,
							function() end )
						end)
					end
				end
				menu:Open()
			end
			
			CreateSpaceM(CPpanel,3)

			local Warrant = CPpanel:Add("RX2F4_DSWButton")
			Warrant.TextCol = RX2F4_Adjust.Colors.CM.PA_ButtonText
			Warrant.BoarderCol = RX2F4_Adjust.Colors.CM.PA_ButtonBoarder
			Warrant.FXCol = RX2F4_Adjust.Colors.CM.PA_ButtonFX
			Warrant:SetSize(740,30)
			Warrant:SetTexts(DarkRP.getPhrase("searchwarrantbutton"))
			Warrant.DoClick = function()
				local menu = DermaMenu()
				for _,ply in pairs(player.GetAll()) do
					if not ply:getDarkRPVar("wanted") and ply ~= LocalPlayer() then
						menu:AddOption(ply:Nick(), function()
							Derma_StringRequest("wanted", "Why would you make "..ply:Nick().." wanted?", nil,
								function(a)
									if not IsValid(ply) then return end
									RunConsoleCommand("darkrp", "wanted", ply:SteamID(), a)
								end,
							function() end )
						end)
					end
				end
				menu:Open()
			end
			
			CreateSpaceM(CPpanel,3)

			local UnWarrant = CPpanel:Add("RX2F4_DSWButton")
			UnWarrant.TextCol = RX2F4_Adjust.Colors.CM.PA_ButtonText
			UnWarrant.BoarderCol = RX2F4_Adjust.Colors.CM.PA_ButtonBoarder
			UnWarrant.FXCol = RX2F4_Adjust.Colors.CM.PA_ButtonFX
			UnWarrant:SetSize(740,30)
			UnWarrant:SetTexts(DarkRP.getPhrase("unwarrantbutton"))
			UnWarrant.DoClick = function()
				local menu = DermaMenu()
				for _,ply in pairs(player.GetAll()) do
					if ply:getDarkRPVar("wanted") and ply ~= LocalPlayer() then
						menu:AddOption(ply:Nick(), function() LocalPlayer():ConCommand("darkrp unwanted \"" .. ply:SteamID() .. "\"") end)
					end
				end
				menu:Open()
			end
			
			CreateSpaceM(CPpanel,3)

			if LocalPlayer():Team() == TEAM_CHIEF and GAMEMODE.Config.chiefjailpos or LocalPlayer():IsAdmin() then
				local SetJailPos = CPpanel:Add("RX2F4_DSWButton")
				SetJailPos.TextCol = RX2F4_Adjust.Colors.CM.PA_ButtonText
				SetJailPos.BoarderCol = RX2F4_Adjust.Colors.CM.PA_ButtonBoarder
				SetJailPos.FXCol = RX2F4_Adjust.Colors.CM.PA_ButtonFX
				SetJailPos:SetSize(740,30)
				SetJailPos:SetTexts(DarkRP.getPhrase("set_jailpos"))
				SetJailPos.DoClick = function() LocalPlayer():ConCommand("darkrp jailpos") end
				
				CreateSpaceM(CPpanel,3)

				local AddJailPos = CPpanel:Add("RX2F4_DSWButton")
				AddJailPos.TextCol = RX2F4_Adjust.Colors.CM.PA_ButtonText
				AddJailPos.BoarderCol = RX2F4_Adjust.Colors.CM.PA_ButtonBoarder
				AddJailPos.FXCol = RX2F4_Adjust.Colors.CM.PA_ButtonFX
				AddJailPos:SetSize(740,30)
				AddJailPos:SetTexts(DarkRP.getPhrase("add_jailpos"))
				AddJailPos.DoClick = function() LocalPlayer():ConCommand("darkrp addjailpos") end
				
				CreateSpaceM(CPpanel,3)
			end

			local ismayor -- Firstly look if there's a mayor
			local ischief -- Then if there's a chief
			for k,v in pairs(player.GetAll()) do
				if v:Team() == TEAM_MAYOR then
					ismayor = true
					break
				end
			end

			if not ismayor then
				for k,v in pairs(player.GetAll()) do
					if v:Team() == TEAM_CHIEF then
						ischief = true
						break
					end
				end
			end

			local Team = LocalPlayer():Team()
			if not ismayor and (Team == TEAM_CHIEF or (not ischief and Team == TEAM_POLICE)) then
				local GiveLicense = CPpanel:Add("RX2F4_DSWButton")
				GiveLicense.TextCol = RX2F4_Adjust.Colors.CM.PA_ButtonText
				GiveLicense.BoarderCol = RX2F4_Adjust.Colors.CM.PA_ButtonBoarder
				GiveLicense.FXCol = RX2F4_Adjust.Colors.CM.PA_ButtonFX
				GiveLicense:SetSize(740,30)
				GiveLicense:SetTexts(DarkRP.getPhrase("give_license_lookingat"))
				GiveLicense.DoClick = function()
					LocalPlayer():ConCommand("darkrp givelicense")
				end
			end
	CPCat:SetContents(CPpanel)
	CPCat:SetSkin(GAMEMODE.Config.DarkRPSkin)
	return CPCat
end


local function CitOptns()
	local CitCat = vgui.Create("DCollapsibleCategory")
	function CitCat:Paint()
	end
	CitCat:SetLabel("Citizen options")
		local Citpanel = vgui.Create("DListLayout")
		Citpanel:SetSize(740,110)

		local joblabel = Citpanel:Add("DLabel")
		joblabel:SetText(DarkRP.getPhrase("set_custom_job"))

		local jobentry = Citpanel:Add("DTextEntry")
		jobentry:SetAllowNonAsciiCharacters(true)
		jobentry:SetValue(LocalPlayer():getDarkRPVar("job") or "")
		jobentry.OnEnter = function()
			RunConsoleCommand("DarkRP", "job", tostring(jobentry:GetValue()))
		end

	CitCat:SetContents(Citpanel)
	return CitCat
end


local function MobOptns()
	local MobCat = vgui.Create("DCollapsibleCategory")
	function MobCat:Paint()
	end
	MobCat:SetLabel("Mobboss options")
		local Mobpanel = vgui.Create("DListLayout")
		Mobpanel:SetSize(740,110)

		local agendalabel = Mobpanel:Add("DLabel")
		agendalabel:SetText(DarkRP.getPhrase("set_agenda"))

		local agendaentry = Mobpanel:Add("DTextEntry")
		agendaentry:SetAllowNonAsciiCharacters(true)
		agendaentry:SetValue(LocalPlayer():getDarkRPVar("agenda") or "")
		agendaentry.OnEnter = function()
			RunConsoleCommand("darkrp", "agenda", tostring(agendaentry:GetValue()))
		end

	MobCat:SetContents(Mobpanel)
	return MobCat
end



function RX2F4_Open_MoneyCommand(Parent)
	GAMEMODE.ConnectedPlayersPanel = vgui.Create("RX2F4_M_MoneyCommand",Parent)
	GAMEMODE.ConnectedPlayersPanel:SetSize(Parent:GetWide(),Parent:GetTall())
	return GAMEMODE.ConnectedPlayersPanel
end
function PANEL:Init()

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
			surface.SetDrawColor( RX2F4_Adjust.Colors.CM.TitleLine )
			surface.DrawRect( 1, 39, slf:GetWide()-2, 1 )
		draw.SimpleText("Money and Commands", "RXF2_TrebOut_S40", 20,20, RX2F4_Adjust.Colors.CM.TitleColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end
	
	self.ItemList = vgui.Create("DPanelList", self)
		self.ItemList:SetPos(10,50)
		self.ItemList:SetSize(self:GetWide()-20,self:GetTall() - 60)
		self.ItemList:SetSpacing(20);
		self.ItemList:SetPadding(0);
		self.ItemList:EnableVerticalScrollbar(true);
		self.ItemList:EnableHorizontal(false);
		self.ItemList:RX2F4_PaintListBarC()
		self.ItemList.Paint = function(slf)
			surface.SetDrawColor( 0,0,0,50 )
			surface.DrawRect( 0, 0, slf:GetWide(), slf:GetTall() )
		end
		
	self:UpdateList()
end

function PANEL:UpdateList()
	self.ItemList:Clear()
	local FirstTabPanel = self.ItemList
		function FirstTabPanel:Update()
			self:Clear(true)
			local MoneyCat = vgui.Create("DCollapsibleCategory")
			MoneyCat.Paint = function(slf) end
			MoneyCat:SetLabel("Money")
				local MoneyPanel = vgui.Create("DListLayout")
				
				local function CreateSpace(tall)
					local Spacing = MoneyPanel:Add("DPanel")
					Spacing:SetSize(100,tall)
					Spacing.Paint = function(slf) end
				end
				
				local GiveMoneyButton = MoneyPanel:Add("RX2F4_DSWButton")
				GiveMoneyButton.TextCol = RX2F4_Adjust.Colors.CM.MA_ButtonText
				GiveMoneyButton.BoarderCol = RX2F4_Adjust.Colors.CM.MA_ButtonBoarder
				GiveMoneyButton.FXCol = RX2F4_Adjust.Colors.CM.MA_ButtonFX
				GiveMoneyButton:SetSize(100,30)
				GiveMoneyButton:SetTexts(DarkRP.getPhrase("give_money"))
				GiveMoneyButton.DoClick = function()
					Derma_StringRequest("Amount of money", "How much money do you want to give?", "", function(a) LocalPlayer():ConCommand("darkrp give " .. tostring(a)) end)
				end
					CreateSpace(3)
				local SpawnMoneyButton = MoneyPanel:Add("RX2F4_DSWButton")
				SpawnMoneyButton.TextCol = RX2F4_Adjust.Colors.CM.MA_ButtonText
				SpawnMoneyButton.BoarderCol = RX2F4_Adjust.Colors.CM.MA_ButtonBoarder
				SpawnMoneyButton.FXCol = RX2F4_Adjust.Colors.CM.MA_ButtonFX
				SpawnMoneyButton:SetSize(100,30)
				SpawnMoneyButton:SetTexts(DarkRP.getPhrase("drop_money"))
				SpawnMoneyButton.DoClick = function()
					Derma_StringRequest("Amount of money", "How much money do you want to drop?", "", function(a) LocalPlayer():ConCommand("darkrp dropmoney " .. tostring(a)) end)
				end
				
				/* -- buy health menu. seems like removed
					CreateSpace(3)
					
					if GAMEMODE.Config.enablebuyhealth then
						local health = MoneyPanel:Add("RX2F4_DSWButton")
						health.TextCol = RX2F4_Adjust.Colors.CM.MA_ButtonText
						health.BoarderCol = RX2F4_Adjust.Colors.CM.MA_ButtonBoarder
						health.FXCol = RX2F4_Adjust.Colors.CM.MA_ButtonFX
						health:SetSize(100,30)
						health:SetTexts(DarkRP.getPhrase("buy_health", tostring(GAMEMODE.Config.healthcost)))
						health.DoClick = function() LocalPlayer():ConCommand("darkrp /Buyhealth") end
					end
				*/
				
			MoneyCat:SetContents(MoneyPanel)

			
			
			
			

			local Commands = vgui.Create("DCollapsibleCategory")
			Commands.Paint = function(slf) end
			Commands:SetLabel("Actions")
				local ActionsPanel = vgui.Create("DListLayout")
				ActionsPanel:SetSize(740,210)
				
				local function CreateSpace(tall)
					local Spacing = ActionsPanel:Add("DPanel")
					Spacing:SetSize(100,tall)
					Spacing.Paint = function(slf) end
				end
				
					local rpnamelabel = ActionsPanel:Add("DLabel")
					rpnamelabel:SetText(DarkRP.getPhrase("change_name"))

					local rpnameTextbox = ActionsPanel:Add("DTextEntry")
					--/rpname does not support non-ASCII characters
					rpnameTextbox:SetText(LocalPlayer():Nick())
					rpnameTextbox.OnEnter = function() RunConsoleCommand("darkrp", "rpname", tostring(rpnameTextbox:GetValue())) end
						CreateSpace(3)
					local sleep = ActionsPanel:Add("RX2F4_DSWButton")
					sleep:SetSize(100,30)
					sleep.BoarderCol = RX2F4_Adjust.Colors.CM.DA_ButtonBoarder
					sleep.TextCol = RX2F4_Adjust.Colors.CM.DA_ButtonText
					sleep.FXCol = RX2F4_Adjust.Colors.CM.DA_ButtonFX
					sleep:SetTexts(DarkRP.getPhrase("go_to_sleep"))
					sleep.DoClick = function()
						LocalPlayer():ConCommand("darkrp sleep")
					end
						CreateSpace(3)
					local Drop = ActionsPanel:Add("RX2F4_DSWButton")
					Drop:SetSize(100,30)
					Drop.BoarderCol = RX2F4_Adjust.Colors.CM.DA_ButtonBoarder
					Drop.TextCol = RX2F4_Adjust.Colors.CM.DA_ButtonText
					Drop.FXCol = RX2F4_Adjust.Colors.CM.DA_ButtonFX
					Drop:SetTexts(DarkRP.getPhrase("drop_weapon"))
					Drop.DoClick = function() LocalPlayer():ConCommand("darkrp drop") end
						CreateSpace(3)
				if LocalPlayer():Team() ~= TEAM_MAYOR then
					local RequestLicense = ActionsPanel:Add("RX2F4_DSWButton")
						RequestLicense:SetSize(100,30)
						RequestLicense.BoarderCol = RX2F4_Adjust.Colors.CM.DA_ButtonBoarder
						RequestLicense.TextCol = RX2F4_Adjust.Colors.CM.DA_ButtonText
						RequestLicense.FXCol = RX2F4_Adjust.Colors.CM.DA_ButtonFX
						RequestLicense:SetTexts(DarkRP.getPhrase("request_gunlicense"))
						RequestLicense.DoClick = function() LocalPlayer():ConCommand("darkrp requestlicense") end
						CreateSpace(3)
				end

				local Demote = ActionsPanel:Add("RX2F4_DSWButton")
				Demote:SetSize(100,30)
				Demote.BoarderCol = RX2F4_Adjust.Colors.CM.DA_ButtonBoarder
				Demote.TextCol = RX2F4_Adjust.Colors.CM.DA_ButtonText
				Demote.FXCol = RX2F4_Adjust.Colors.CM.DA_ButtonFX
				Demote:SetTexts(DarkRP.getPhrase("demote_player_menu"))
				Demote.DoClick = function()
					local menu = DermaMenu()
					for _,ply in pairs(player.GetAll()) do
						if ply ~= LocalPlayer() and IsValid(ply) then
							menu:AddOption(ply:Nick(), function()
								Derma_StringRequest("Demote reason", "Why would you demote "..ply:Nick().."?", nil,
									function(a)
										RunConsoleCommand("darkrp", "demote", ply:SteamID(), a)
									end,
								function() end )
							end)
						end
					end
					menu:Open()
				end
						CreateSpace(3)

				local UnOwnAllDoors = ActionsPanel:Add("RX2F4_DSWButton")
						UnOwnAllDoors:SetSize(100,30)
						UnOwnAllDoors.BoarderCol = RX2F4_Adjust.Colors.CM.DA_ButtonBoarder
						UnOwnAllDoors.TextCol = RX2F4_Adjust.Colors.CM.DA_ButtonText
						UnOwnAllDoors.FXCol = RX2F4_Adjust.Colors.CM.DA_ButtonFX
						UnOwnAllDoors:SetTexts("Sell all of your doors")
						UnOwnAllDoors.DoClick = function() LocalPlayer():ConCommand("darkrp unownalldoors") end
			Commands:SetContents(ActionsPanel)
		FirstTabPanel:AddItem(MoneyCat)
		FirstTabPanel:AddItem(Commands)

		if LocalPlayer():Team() == TEAM_MAYOR then
			FirstTabPanel:AddItem(MayorOptns())
		elseif LocalPlayer():Team() == TEAM_CITIZEN then
			FirstTabPanel:AddItem(CitOptns())
		elseif LocalPlayer():isCP() then
			FirstTabPanel:AddItem(CPOptns())
		elseif LocalPlayer():Team() == TEAM_MOB then
			FirstTabPanel:AddItem(MobOptns())
		end
	end
	FirstTabPanel:Update()
	return FirstTabPanel
end
vgui.Register("RX2F4_M_MoneyCommand",PANEL,"DFrame")

end