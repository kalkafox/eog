-- For RocketMania's stuff
local Fonts = {}
	Fonts["RXF2_CoolV"] = "coolvetica"
	Fonts["RXF2_Treb"] = "Trebuchet MS"
	Fonts["RXF2_Cour"] = "Courier New"
	Fonts["RXF2_Verd"] = "Verdana"
	Fonts["RXF2_Ari"] = "Arial"
	Fonts["RXF2_Taho"] = "Tahoma"
	Fonts["RXF2_Luci"] = "Lucida Console"
	
	
for a,b in pairs(Fonts) do
	for k=10,70 do
		surface.CreateFont( a .. "_S"..k,{font = b,size = k,weight = 700,antialias = true})
		surface.CreateFont( a .. "Out_S"..k,{font = b,size = k,weight = 700,antialias = true,outline = true})
	end
end