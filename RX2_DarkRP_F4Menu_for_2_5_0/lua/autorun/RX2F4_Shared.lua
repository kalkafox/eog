function RX2F4VIPCheck(ply)
	local UG = ply:GetNWString("usergroup")
	UG = string.lower(UG)
	
	if table.HasValue(RX2F4_Adjust.VIPGroup,UG) then
		return true
	else
		return false
	end
end