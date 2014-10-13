if CLIENT then



local PANEL = {}

function RX2F4_Open_Rule(Parent)
	GAMEMODE.ConnectedPlayersPanel = vgui.Create("RX2F4_M_Rule",Parent)
	GAMEMODE.ConnectedPlayersPanel:SetSize(Parent:GetWide(),Parent:GetTall())
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

	self.ItemList = vgui.Create("DPanelList", self)
		self.ItemList:SetPos(10,10)
		self.ItemList:SetSize(self:GetWide()-20,self:GetTall() - 20)
		self.ItemList:SetSpacing(5);
		self.ItemList:SetPadding(0);
		self.ItemList:EnableVerticalScrollbar(true);
		self.ItemList:EnableHorizontal(false);
		self.ItemList:RX2F4_PaintListBarC()
		self.ItemList.Paint = function(slf)
			surface.SetDrawColor( 0,0,0,50 )
			surface.DrawRect( 0, 0, slf:GetWide(), slf:GetTall() )
		end
		
	self.ItemList:Clear()
	for k,v in pairs(RX2F4_RuleDB) do
		if v.Type == "Title" then
			local BG = vgui.Create("DPanel")
			BG:SetSize(self.ItemList:GetWide(),40)
			BG.Paint = function(slf)
				surface.SetDrawColor( RX2F4_Adjust.Colors.RM.TitleLine )
				surface.DrawRect( 1, 39, slf:GetWide()-2, 1 )
				draw.SimpleText(v.Text, "RXF2_TrebOut_S40", 10,20, RX2F4_Adjust.Colors.RM.Title, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			end
			self.ItemList:AddItem(BG)
		end
		if v.Type == "Text" then
			local BG = vgui.Create("DLabel")
			BG:SetText(v.Text)
			BG:SetFont("RXF2_TrebOut_S20")
			BG:SetColor(RX2F4_Adjust.Colors.RM.Body)
			BG:SizeToContents()
			self.ItemList:AddItem(BG)
		end
		
	end
end

vgui.Register("RX2F4_M_Rule", PANEL, "DFrame")

end -- client end