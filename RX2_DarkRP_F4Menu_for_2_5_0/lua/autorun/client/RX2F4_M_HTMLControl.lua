--[[__                                       _     
 / _| __ _  ___ ___ _ __  _   _ _ __   ___| |__  
| |_ / _` |/ __/ _ \ '_ \| | | | '_ \ / __| '_ \ 
|  _| (_| | (_|  __/ |_) | |_| | | | | (__| | | |
|_|  \__,_|\___\___| .__/ \__,_|_| |_|\___|_| |_|
                   |_| 2010 --]]

local PANEL = {}

--[[---------------------------------------------------------
	
-----------------------------------------------------------]]
function PANEL:Init()

	local ButtonSize = 32
	local Margins = 2
	local Spacing = 0

	self.BackButton = vgui.Create( "DImageButton", self )
	self.BackButton:SetSize( ButtonSize, ButtonSize )
	self.BackButton:SetMaterial( "gui/HTML/back" )
	self.BackButton:Dock( LEFT )
	self.BackButton:DockMargin( Spacing*3, Margins, Spacing, Margins )
	self.BackButton.DoClick = function() self.BackButton:SetDisabled( true ) self.HTML:HTMLBack(); self.Cur = self.Cur - 1; self.Navigating = true end
	
	self.ForwardButton = vgui.Create( "DImageButton", self )
	self.ForwardButton:SetSize( ButtonSize, ButtonSize )
	self.ForwardButton:SetMaterial( "gui/HTML/forward" )
	self.ForwardButton:Dock( LEFT )
	self.ForwardButton:DockMargin( Spacing, Margins, Spacing, Margins )
	self.ForwardButton.DoClick = function() self.ForwardButton:SetDisabled( true ) self.HTML:HTMLForward(); self.Cur = self.Cur + 1; self.Navigating = true end
	
	self.RefreshButton = vgui.Create( "DImageButton", self )
	self.RefreshButton:SetSize( ButtonSize, ButtonSize )
	self.RefreshButton:SetMaterial( "gui/HTML/refresh" )
	self.RefreshButton:Dock( LEFT )
	self.RefreshButton:DockMargin( Spacing, Margins, Spacing, Margins )
	self.RefreshButton.DoClick = function() self.RefreshButton:SetDisabled( true ) self.Refreshing = true; self.HTML:Refresh() end
	
	self.HomeButton = vgui.Create( "DImageButton", self )
	self.HomeButton:SetSize( ButtonSize, ButtonSize )
	self.HomeButton:SetMaterial( "gui/HTML/home" )
	self.HomeButton:Dock( LEFT )
	self.HomeButton:DockMargin( Spacing, Margins, Spacing*3, Margins )
	self.HomeButton.DoClick = function() self.HTML:Stop() self.AddressBar:SetText( self.HomeURL ) self.HTML:OpenURL( self.HomeURL ) end
	
	self.StopButton = vgui.Create( "DImageButton", self )
	self.StopButton:SetSize( ButtonSize, ButtonSize )
	self.StopButton:SetMaterial( "gui/HTML/stop" )
	self.StopButton:Dock( RIGHT )
	self.StopButton:DockMargin( Spacing*3, Margins, Spacing*3, Margins )
	self.StopButton.DoClick = function() self.HTML:Stop() self:FinishedLoading() end
	
	self.AddressBar = vgui.Create( "DTextEntry", self )
	self.AddressBar:Dock( FILL )
	self.AddressBar:SetFont("RXF2_TrebOut_S20")
	self.AddressBar:DockMargin( Spacing, Margins * 3, Spacing, Margins * 3 )
	self.AddressBar:SetTextColor(RX2F4_Adjust.Colors.HM.AdressText)
	self.AddressBar:SetDrawBackground(false)
	self.AddressBar:SetCursorColor(RX2F4_Adjust.Colors.HM.AdressText)
	self.AddressBar.OnEnter = function(slf) 
		self.HTML:Stop() 
		self.HTML:OpenURL( self.AddressBar:GetValue() ) 
		slf.EnterTime = CurTime() + 0.5
	end
	
	self:SetHeight( ButtonSize + Margins * 2 )
	
	self.NavStack = 0;
	self.History = {}
	self.Cur = 1
	
	-- This is the default look, feel free to change it on your created control :)
	self:SetButtonColor( RX2F4_Adjust.Colors.HM.Button )
	self.BorderSize = 4
	self.BackgroundColor = Color( 200, 200, 200, 255 )
	self.HomeURL = " "
end

function PANEL:Paint()
	surface.SetDrawColor( Color(0,0,0,100) )
	surface.DrawRect( 0, 0, self:GetWide(), self:GetTall() )
	
	surface.SetDrawColor( RX2F4_Adjust.Colors.HM.AdressBarLine )
	surface.DrawRect( 0, 0, self:GetWide(), 1 )
	surface.DrawRect( 0, self:GetTall()-1, self:GetWide(), 1 )

	
	local DP = self.AddressBar
	local DX,DY = DP:GetPos()
	
	surface.SetFont("RXF2_TrebOut_S20")
	local Width, Height = surface.GetTextSize(DP:GetValue())
	
	if (DP.EnterTime or 0 ) > CurTime() then
		local DeltaTime = ((DP.EnterTime or 0 )-CurTime())
		local Col = Color(255,255,255,255)
		surface.SetDrawColor( Color(Col.r,Col.g,Col.b,DeltaTime*255) )
		surface.DrawRect( DX, DY, DP:GetWide(), DP:GetTall() )
	end
	
	surface.SetDrawColor( RX2F4_Adjust.Colors.HM.AdressTextButtomLine )
	surface.DrawRect( DX, DY + DP:GetTall()-1, Width, 1 )
	
	
end

function PANEL:SetHTML( html )

	self.HTML = html
	
	if ( html.URL ) then
		self.HomeURL = self.HTML.URL
	end
	
	self.AddressBar:SetText( self.HomeURL )
	self:UpdateHistory( self.HomeURL )
	
	local OldFunc = self.HTML.OpeningURL
	self.HTML.OpeningURL = function( panel, url, target, postdata, bredirect )
		
		self.NavStack = self.NavStack + 1
		self.AddressBar:SetText( url )
		self:StartedLoading()
		
		if ( OldFunc ) then
			OldFunc( panel, url, target, postdata, bredirect )
		end
	
		self:UpdateHistory( url )
	
	end
	
	local OldFunc = self.HTML.FinishedURL
	self.HTML.FinishedURL = function( panel, url )
		
		self:FinishedLoading()
		
		if ( OldFunc ) then
			OldFunc( panel, url )
		end
	
	end

end

function PANEL:UpdateHistory( url )

	--print( "PANEL:UpdateHistory", url )
	self.Cur = math.Clamp( self.Cur, 1, table.Count( self.History ) )
	
	if ( self.Refreshing ) then
	
		self.Refreshing = false
		self.RefreshButton:SetDisabled( false )
		return
		
	end
		
	if ( self.Navigating ) then
			
		self.Navigating = false
		self:UpdateNavButtonStatus()
		return;

	end
	
	-- We were back in the history queue, but now we're navigating
	-- So clear the front out so we can re-write history!!
	if ( self.Cur < table.Count( self.History ) ) then
	
		for i=self.Cur+1, table.Count( self.History ) do
			self.History[i] = nil
		end
	
	end
	
	self.Cur = table.insert( self.History, url )
	
	self:UpdateNavButtonStatus()

end

function PANEL:FinishedLoading()

	self.StopButton:SetDisabled( true )
	self.RefreshButton:SetDisabled( false )

end

function PANEL:StartedLoading()

	self.StopButton:SetDisabled( false )
	self.RefreshButton:SetDisabled( true )

end

function PANEL:UpdateNavButtonStatus()

	--print( self.Cur, table.Count( self.History ) )
	
	self.ForwardButton:SetDisabled( self.Cur >= table.Count( self.History ) )
	self.BackButton:SetDisabled( self.Cur == 1 )

end

function PANEL:SetButtonColor( col )

	self.BackButton:SetColor( col )
	self.ForwardButton:SetColor( col )
	self.RefreshButton:SetColor( col )
	self.HomeButton:SetColor( col )
	self.StopButton:SetColor( col )

end

vgui.Register("RX2F4_M_HTMLControl", PANEL, "DPanel")