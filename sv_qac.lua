--[[ 

Hi, This is Zero The Fallen
This is QAC (aka Quack Anti Cheat)
The Config is below, edit it to your likings, as I'll attempt to describe anything that seems confusing.
If you dont understand something, please post on the CH thread!
Thanks

Whats new:
=========
3/4/2014 

Hi, QAC 
--]]

util.AddNetworkString("Debug1")
util.AddNetworkString("Debug2")
util.AddNetworkString("checksaum")
util.AddNetworkString("gcontrol_vars")
util.AddNetworkString("control_vars")
util.AddNetworkString("QUACK_QUACK_MOTHER_FUCKER")
resource.AddFile("sound/qac/quack.wav")

print("QAC: Serverside Starting")
QAC = true

-----------------------------  Config ----------------------------------\

local BanWhenDetected 	 = true 	-- Ban when detected?
local crash 			 = false 	-- Crashes when they are detected.
local whitelist			 = true 	-- Will use whitelist
local time 				 = 0 		-- Ban time
local MaxPings 			 = 10 		-- Max pings they can not return
local KickForPings		 = false	-- If they exceed MaxPings
local alertAdmins		 = true    -- Alerts admins when detected
local AlertTimerDelay    = 30       -- Message repeat delay
local AlertTimer 		 = false    -- Repeat banned users msg?

-------------------------------------------------------
-- Ban Systems ----------------------------------------
-- Do not set more than 1 to true. Only 1 at a time. --
-------------------------------------------------------

local UseSourceBans = false -- sm_ban
local UseAltSB 		= false -- ulx sban
local evolve        = false -- Evolve Mod
local serverguard   = false -- Lemonpunch's admin mod.
local defaultBan    = false 	-- If all else fails, use this.

----------
-- Misc --
----------

local RepeatBan     = false 	-- Will ban them every time they're detected.
local E2Fix 		= true 	-- IF YOU USE E2 ON YOUR SERVER, USE THIS THANX. only shut off if you're having BD problems
------------------------------ End of Config --------------------------/


--------------------------------------------------------------------------------
--- DON'T TOUCH ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU'RE DOING-----
--------------------------------------------------------------------------------







-------------------
-- RunString Fix --
-------------------
oRunString = RunString
function RunString(var)
	//print("RunString ran with var: "..tostring(var))
	//error("RunString Callback: Contact ZTF")
	
	
	// fucknig runstring detour is useless
	if (E2Fix) then
		oRunString(var)
	end
end

 --[[
 To add more steamid's make sure the last steamid entry in the table doesnt have a comma at the end!
 All other entries should have one though!
 
 In otherwords, more steamid's would look like this!
 
 
	banned = {
	["STEAM_0:0:11101"] = true,
	["STEAM_0:0:11101"] = true,
	["STEAM_0:0:11101"] = true,
	["STEAM_0:0:11101"] = true,
	["STEAM_0:0:11101"] = true
	}


The last steamid shouldnt have a comma at the end! Thanks!

]]--


local banned = {} -- Dont touch this
 
if (whitelist) then
	banned = {
		["STEAM_0:1:38717786"] = true
	}
end

-------------------
--- Ban function --
-------------------

local function Ban(p, r)
	print("Detected " .. p:Name() .. " for " .. r .. "(" .. p:SteamID() .. ")")
	local alertreason = ""
	
	if (alertAdmins) then
		for k, v in pairs(player.GetAll()) do
			if v:IsAdmin() or v:IsSuperAdmin() then
				alertreason = p:Name() .. " has been detected with the reason: " .. r
				if !(AlertTimer) then
					v:ChatPrint(alertreason)
				else
					timer.Create("adminreadgoddamnit", AlertTimerDelay, 0, function()
						v:ChatPrint(alertreason)
					end)
				end
			end
		end
	end
	
	if !(BanWhenDetected) then
		local qacrnb = "Detected " .. p:Name() .. " for " .. r .. "(" .. p:SteamID() .. ") \n"
		file.Append("QAC Log.txt", qacrnb)	
		return
	end
	
	-- Check whitelist
	if (banned[p:SteamID()]) then
		return
	end
	
	print("Banning " .. p:Name() .. " for " .. r)
	
	-- Logging
	local qacr = "Banned " .. p:Name() .. " for " .. r .. "(" .. p:SteamID() .. ") \n"
	file.Append("QAC Log.txt", qacr)

	-- Repeat bans
	if !(RepeatBan) then
		banned[p:SteamID()] = true
	end
	
		
	for k, v in pairs(player.GetAll()) do
		net.Start("QUACK_QUACK_MOTHER_FUCKER")
		net.Send(v)
	end
	
	-- Default, ulx ban + player:Ban()
	
		if !(UseSourceBans) && !(UseAltSB) && (defaultBan) && !(serverguard) then
			p:Ban(time, r)
			RunConsoleCommand("ulx", "ban", p:Name() , time, r) -- So it shows up on ULX
			RunConsoleCommand("writeid")
		end
	
	-- serverguard
	
		if !(UseSourceBans) && !(UseAltSB) && !(defaultBan) && !(serverguard) then
			RunConsoleCommand("serverguard_ban", p:Name() , 7000, r)
		end
	
	-- sm_ban
	
		if (UseSourceBans) && !(UseAltSB) && !(defaultBan) && !(serverguard) then
			RunConsoleCommand("sm_ban", p:Name() , time, r)
		end
		
	-- ulx sban
	
		if (UseAltSB) && !(UseSourceBans) && !(defaultBan) && !(serverguard) then
			RunConsoleCommand("ulx","sban", p:Name() , time, r)
		end
	
	--evolve
	
		if !(UseAltSB) && !(UseSourceBans) && !(defaultBan) && !(serverguard) && (evolve) then
			RunConsoleCommand("ev", "ban", p:Name() , time, r)
		end
	
	--Crashing
	if (crash) then
			p:SendLua("cam.End3D()")
			if (IsValid(p)) then
				p:Kick()
			end
	end
	
	 hook.Call("QACBan", GAMEMODE, p, r)
end



------------------------------
-- Foreign Source Detection --
------------------------------

local scans = {}

net.Receive(
	"checksaum",
	function(l, p)
		local s = net.ReadString()
		
		local sr = scans[s]
		local br = "Detected foreign source file " .. s .. "."
		
		if (sr != nil) then
			if (sr) then
				return
			else
				Ban(p, br)
			end
		end
		
		if (file.Exists(s, "game")) then
			scans[s] = true
		else
			scans[s] = false
			Ban(p, br)
		end
	end
)

----------------------
-- ConVar Detection --
----------------------

local function CC(name, value)
	CreateConVar(name, value, 0, ";c" )
end

CC("sp00f_bs_sv_allowcslua", "0")
CC("sp00f_bs_sv_cheats", "0")
CC("sp00f_bs_host_timescale", "0")
CC("tmcb_allowcslua", "0")

local ctd = {
	"sv_cheats",
	"sv_allowcslua",
	"mat_fullbright",
	"mat_proxy",
	"mat_wireframe",
	"host_timescale",
}

for i, c in pairs(ctd) do
	ctd[i] = GetConVar(c)
end

local function sendvars(p)
	for _, c in pairs(ctd) do
		net.Start("gcontrol_vars")
			net.WriteTable({c = c:GetName(), v = c:GetString()})
		net.Send(p)
	end
end

net.Receive(
	"gcontrol_vars",
	function(l, p)
		sendvars(p)
	end
)

local function validatevar(p, c, v)
	if (GetConVar(c):GetString() != (v || "")) then
		Ban(p, "Recieved UNSYNCHED cvar (" .. c .." = " .. v .. ")")
	end
end

net.Receive(
	"control_vars",
	function(l, p)
		local t = net.ReadTable()
		validatevar(p, t.c, t.v)
	end
)


-----------------
-- Ping system --
-----------------
if SERVER then

	print("QAC Ping starting")
	
	local CoNum = 2 
	
	timer.Create("STC",10,0, function()
	for k, v in pairs(player.GetAll()) do
			net.Start("Debug2")
			net.WriteInt(CoNum, 10)
			if !v.Pings then 
				v.Pings = 0
			end
			if (KickForPings) then
				if v.Pings > MaxPings && !v:IsBot() then
					v:Kick("Not Ret")
					local retr = "Kicked " .. v:Name() .. " for  not returning our pings \n"
					file.Append("QAC Log.txt", retr)
					v.Pings = 0
				end
			end
			v.Pings = v.Pings + 1
			net.Send(v)
			end
	end)
		
	net.Receive("Debug1", function(len, ply)
		local HNum = net.ReadInt(16)
		if (HNum) && HNum == CoNum  then
			ply.Pings = ply.Pings - 1
		end
	end)
	
end



--[[
Possible fetch

http.fetch(blahlbalhl)

local numberversion = whatever

file.read(data/QACV.txt, GAME) etc etc

if number = data number then

print success

else  

print ur late

Maybe autoupdate system? Dunno if I can write to lua

RunString() autoupdate checkversion.

]]--


--------
--ZTF --
--------