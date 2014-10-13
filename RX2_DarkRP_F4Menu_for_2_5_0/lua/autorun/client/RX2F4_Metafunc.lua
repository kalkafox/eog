local meta = FindMetaTable("Panel")
function meta:RX2F4_DrawBoarder(width,col)
	width = width or 1
	col = col or Color(255,255,255,255)
	
	surface.SetDrawColor( col )
	surface.DrawRect( 0, 0, self:GetWide(), width )
	surface.DrawRect( 0, self:GetTall()-width, self:GetWide(), width )
	surface.DrawRect( 0, 0, width, self:GetTall() )
	surface.DrawRect( self:GetWide()-width, 0, width, self:GetTall() )
end
	
function meta:RX2F4_PanelAnim_Fade(data)
	local Speed = (data.Speed or 1) -- 1초 후 애니메이션 끝.
	local StartTime = CurTime() + (data.Delay or 0)
	local Fade = (data.Fade or false)
		
	local OldThink = self.Think or function() end
		
		if self.SetDisabled then self:SetDisabled(true) end
		local SP = 0-self:GetWide()
		function self:Think()
			OldThink(self)
			
			local DeltaTime = math.min(Speed,CurTime() - StartTime)
			if DeltaTime > 0 then
				if self.SetDisabled then self:SetDisabled(false) end
				local DeltaSpeed = (math.pow(DeltaTime/Speed,1))
				if Fade then self:SetAlpha(DeltaSpeed*(255+Fade)-Fade) end
				if DeltaTime >= Speed then
					function self:Think()
						OldThink(self)
					end
					return
				end
			else
				self:SetAlpha(0)
			end
		end

end

function meta:RX2F4_PaintListBarC(bCol,iCol)
	local bCol = bCol or RX2F4_Adjust.Colors.Main.SCB_Boarder
	local iCol = iCol or RX2F4_Adjust.Colors.Main.SCB_Inner
	
	self.VBar.btnDown.Paint = function(selfk)
		selfk:RX2F4_DrawBoarder(1,bCol)
		surface.SetDrawColor( iCol.r,iCol.g,iCol.b,iCol.a )
		surface.DrawRect( 1, 1, selfk:GetWide()-2, selfk:GetTall()-2 )
	end
	self.VBar.btnUp.Paint = function(selfk)
		selfk:RX2F4_DrawBoarder(1,bCol)
		surface.SetDrawColor( iCol.r,iCol.g,iCol.b,iCol.a )
		surface.DrawRect( 1, 1, selfk:GetWide()-2, selfk:GetTall()-2 )
	end
	self.VBar.btnGrip.Paint = function(selfk)
		selfk:RX2F4_DrawBoarder(1,bCol)
		surface.SetDrawColor( iCol.r,iCol.g,iCol.b,iCol.a )
		surface.DrawRect( 1, 1, selfk:GetWide()-2, selfk:GetTall()-2 )
	end
	self.VBar.Paint = function(selfk)
	end
end



function meta:RX2F4_PanelAnim_Appear_FlyIn(data)
	local DelayValue = (data.Delay or 0)
	local Delay = CurTime() + DelayValue	
	local Dir = data.Dir or "FromLeft"
	local Speed = data.Speed or 1 -- 1초 후 애니메이션 끝.
	local StartTime = CurTime() + DelayValue
	local Smoother = data.Smooth or 1
	local Fade = data.Fade or false
		
	local OldThink = self.Think or function() end
	if Dir == "FromLeft" then
		---SETTINGS
		self.PA = {}
			local PX,PY = self:GetPos()
			self.PA.Pos = {x=PX,y=PY}
		---SETTINGS
		
		self:SetPos(0-self:GetWide(),PY)
		local SP = 0-self:GetWide()
		function self:Think()
			OldThink(self)
			
			local DeltaTime = math.min(Speed,CurTime() - StartTime)
			if DeltaTime > 0 then
				local DeltaSpeed = (math.pow(DeltaTime/Speed,1/Smoother))
				self:SetPos(SP+(PX+self:GetWide())*DeltaSpeed,PY)
				if Fade then self:SetAlpha(DeltaSpeed*(255+Fade)-Fade) end
				if DeltaTime >= Speed then
					function self:Think()
						OldThink(self)
					end
					return
				end
			end
		end
	elseif Dir == "FromRight" then
		---SETTINGS
		self.PA = {}
			local PX,PY = self:GetPos()
			self.PA.Pos = {x=PX,y=PY}
		---SETTINGS
	
		self:SetPos(ScrW(),PY)
		function self:Think()
			OldThink(self)
			
			local DeltaTime = math.min(Speed,CurTime() - StartTime)
			if DeltaTime > 0 then
				local DeltaSpeed = (math.pow(DeltaTime/Speed,1/Smoother))
				self:SetPos(ScrW() - ( ScrW()-PX)*DeltaSpeed,PY)
				if Fade then self:SetAlpha(DeltaSpeed*(255+Fade)-Fade) end
				if DeltaTime >= Speed then
					function self:Think()
						OldThink(self)
					end
					return
				end
			end
		end
	elseif Dir == "FromTop" then
		---SETTINGS
		self.PA = {}
			local PX,PY = self:GetPos()
			self.PA.Pos = {x=PX,y=PY}
		---SETTINGS
	
		self:SetPos(PX,0 - self:GetTall())
		function self:Think()
			OldThink(self)
			
			local DeltaTime = math.min(Speed,CurTime() - StartTime)
			if DeltaTime > 0 then
				local DeltaSpeed = (math.pow(DeltaTime/Speed,1/Smoother))
				self:SetPos(PX,PY*DeltaSpeed)
				if Fade then self:SetAlpha(DeltaSpeed*(255+Fade)-Fade) end
				if DeltaTime >= Speed then
					function self:Think()
						OldThink(self)
					end
					return
				end
			end
		end
	elseif Dir == "FromBottom" then
		---SETTINGS
		self.PA = {}
			local PX,PY = self:GetPos()
			self.PA.Pos = {x=PX,y=PY}
		---SETTINGS
	
		self:SetPos(PX,ScrH() + self:GetTall())
		function self:Think()
			OldThink(self)
			
			local DeltaTime = math.min(Speed,CurTime() - StartTime)
			if DeltaTime > 0 then
				local DeltaSpeed = (math.pow(DeltaTime/Speed,1/Smoother))
				self:SetPos(PX,ScrH()-(ScrH()-PY)*DeltaSpeed)
				if Fade then self:SetAlpha(DeltaSpeed*(255+Fade)-Fade) end
				if DeltaTime >= Speed then
					function self:Think()
						OldThink(self)
					end
					return
				end
			end
		end
	end
	
end


function meta:RX2F4_PanelAnim_Remove_FlyOut(data)
	data = data or {}
	local DelayValue = (data.Delay or 0)
	local Delay = CurTime() + DelayValue	
	local Dir = data.Dir or "ToLeft"
	local Speed = data.Speed or 1 -- 1초 후 애니메이션 끝.
	local StartTime = CurTime() + DelayValue
	local Smoother = data.Smooth or 1
	local Fade = data.Fade or false
	if Dir == "ToLeft" then
		---SETTINGS
		self.PA = {}
			local PX,PY = self:GetPos()
			self.PA.Pos = {x=PX,y=PY}
		---SETTINGS

		function self:Think()
			local DeltaTime = math.min(Speed,CurTime() - StartTime)
			if DeltaTime > 0 then
				local DeltaSpeed = (math.pow(DeltaTime/Speed,1/Smoother))
				self:SetPos(self.PA.Pos.x+(PX+self:GetWide())*DeltaSpeed,self.PA.Pos.y)
				if Fade then self:SetAlpha(255-(DeltaSpeed*(255+Fade)-Fade)) end
				if DeltaTime >= Speed then
					self:Remove()
					MsgN("REMV")
					return
				end
			end
		end
	end
	
end


function meta:RX2F4_PanelAnim_Remove_Fade(data)
	data = data or {}
	local DelayValue = (data.Delay or 0)
	local Delay = CurTime() + DelayValue
	local Speed = data.Speed or 1 -- 1초 후 애니메이션 끝.
	local StartTime = CurTime() + DelayValue
	local Smoother = data.Smooth or 1
	local Fade = data.Fade or false
		---SETTINGS
		self.PA = {}
			local PX,PY = self:GetPos()
			self.PA.Pos = {x=PX,y=PY}
		---SETTINGS

		function self:Think()
			local DeltaTime = math.min(Speed,CurTime() - StartTime)
			if DeltaTime > 0 then
				local DeltaSpeed = (math.pow(DeltaTime/Speed,1/Smoother))
				if Fade then self:SetAlpha(255-(DeltaSpeed*(255+Fade)-Fade)) end
				if DeltaTime >= Speed then
					self:Remove()
					MsgN("REMV")
					return
				end
			end
		end
	
end