function ChangeJobVGUI()
	if !F4Menu or !F4Menu:IsValid() then
		F4Menu = vgui.Create("RX2F4_Main")
		F4Menu:SetSize(ScrW()*RX2F4_Adjust.Main_Size_X, ScrH()*RX2F4_Adjust.Main_Size_Y)
		F4Menu:Center()
		F4Menu:Install()
	
		F4Menu:MakePopup()
	else
		F4Menu:Remove()
	end
end

// =============================================== Inventory Main ==============================================================================================
local PANEL = {}

function PANEL:Paint()
	local DeltaTime = CurTime() - self.CreatedTime
		local DeltaAlpha = DeltaTime*360
			DeltaAlpha = math.min(DeltaAlpha,220)
			
	surface.SetDrawColor( 0,0,0,DeltaAlpha )
	surface.DrawRect( 0, 0, self:GetWide(), self:GetTall() )
	
	draw.SimpleText(RX2F4_Adjust.Main_MainText, "RXF2_TrebOut_S55", 50,15, RX2F4_Adjust.Colors.Main.TitleText)
	draw.SimpleText(RX2F4_Adjust.Main_SubText, "RXF2_TrebOut_S30", self:GetWide()-50,40, RX2F4_Adjust.Colors.Main.SubTitleText,TEXT_ALIGN_RIGHT)
		
	surface.SetDrawColor( RX2F4_Adjust.Colors.Main.Line )
	surface.DrawRect( 50, 70, self:GetWide()-100, 1 )
	
	if input.IsKeyDown(95) then
		if self.ReadyToClose then
			self:Remove()
			return
		end
	else
		if CurTime() - self.CreatedTime > 0.2 then
			self.ReadyToClose = true
		end
	end
end

function PANEL:Init()
	self.CreatedTime = CurTime()
	self:SetTitle(" ")
	self:ShowCloseButton(false)
	self:SetDraggable(false)
end

function PANEL:Install()
		for k,v in pairs(RX2F4_Adjust.Menus) do
			local SButton = vgui.Create( "RX2F4_DSWButton",self )
				SButton:SetSize( 130 , 40 )
				SButton:SetPos( self:GetWide()/2 - (#RX2F4_Adjust.Menus/2*SButton:GetWide())+(SButton:GetWide()*(k-1)),70)
				SButton:SetTexts( v.N )
				SButton.FXCol = RX2F4_Adjust.Colors.Main.CB_Effect
				SButton.BoarderCol = Color(0,0,0,0)
				SButton.TextCol = RX2F4_Adjust.Colors.Main.CB_Text
				SButton.Click = function(slf)
					self:UpdateMenu(v.N,v.P)
				end
				if !self.Menus then
					self:UpdateMenu(v.N,v.P)
				end
				SButton.PaintBackGround = function(slf)
					if (self.Menus or "d") == v.N then
						surface.SetDrawColor( RX2F4_Adjust.Colors.Main.CB_Effect )
						surface.DrawRect( 0, 0, self:GetWide(), self:GetTall() )
					end
				end
		end

end

function PANEL:UpdateMenu(ModeName,ExecuteD)
	self.Menus = ModeName
	if self.MenuPanel then
		self.MenuPanel:RX2F4_PanelAnim_Remove_Fade({Delay=0,Speed=0.5,Smooth=2,Fade=1})
	--	self.MenuPanel:RX2F4_PanelAnim_Remove_FlyOut({Delay=0,Dir="ToLeft",Speed=0.5,Smooth=2,Fade=1})
	end
	local P = ExecuteD(self)
		P:SetPos(130,120)
		P:SetSize(self:GetWide()-260,self:GetTall()-140)
		P:Install(true)
		P.ModeName = ModeName
		P:RX2F4_PanelAnim_Appear_FlyIn({Delay=0,Dir="FromLeft",Speed=0.7,Smooth=30,Fade=3000})
		P.OldPaint = P.Paint
		P.Paint = function(slf)
			slf.OldPaint(slf)
			surface.SetDrawColor( 0,0,0,100 )
			surface.DrawRect( 0, 0, slf:GetWide(), slf:GetTall() )
		end
	self.MenuPanel = P
end

vgui.Register("RX2F4_Main",PANEL,"DFrame")


timer.Simple(0.7,function() -- Override --
GAMEMODE.ShowSpare2 = ChangeJobVGUI
end)
