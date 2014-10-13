RX2F4_Adjust = {} RX2F4_RuleDB = {} function RX2F4_Rule_AddTitle(Text) table.insert(RX2F4_RuleDB,{Type="Title",Text=Text}) end function RX2F4_Rule_AddText(Text) table.insert(RX2F4_RuleDB,{Type="Text",Text=Text}) end
-- ^ Dont Touch

/* ───────────────────────────────────────────────────
	General
─────────────────────────────────────────────────── */
	-- VIPs
		-- VIP Group. ( Its ULX Group. YOU NEED ULX. these group are able to access VIP Shop or VIP Job )
			RX2F4_Adjust.VIPGroup = {"owner","superadmin","admin","standarddonator","golddonator","diamonddonator","ultimatedonator","mod","donatoradmin"} -- <KEEP THESE LOWERCASE>
	
	-- Appearance
		-- Main Screen Size
			RX2F4_Adjust.Main_Size_X = 1 -- 1 Mean 100% fit to your screen. screen will cover your screen. if you want half size. set this to 0.5
			RX2F4_Adjust.Main_Size_Y = 1 -- 1 Mean 100% fit to your screen. screen will cover your screen. if you want half size. set this to 0.5
		-- Main Screen Main Text.
			RX2F4_Adjust.Main_MainText = "Endless Online Gaming"
			RX2F4_Adjust.Main_SubText = "We don't sell peanuts."


/* ───────────────────────────────────────────────────
	Custom Rules
─────────────────────────────────────────────────── */

	-- Custom Rule ( You may know what ' RXFR_Rule_AddTitle ' and ' RX2F4_Rule_AddText '  thing does )
		RX2F4_Rule_AddTitle("Rule")
		RX2F4_Rule_AddText[[ To Check the Rules.
							 Type in !motd ]]
		RX2F4_Rule_AddTitle("Rule 2")
		RX2F4_Rule_AddText[[ If Need Any Help. Please Contact an admin!
							 The Owner Is Awesomenessman ]]
							
							
/* ───────────────────────────────────────────────────
	Menu Order
─────────────────────────────────────────────────── */
RX2F4_Adjust.Menus = {}
	-- you can add or remove buttons.
	
		table.insert(RX2F4_Adjust.Menus,{
			N="Commands",P= function(PN) 
			return RX2F4_Open_MoneyCommand(PN) 
		end})
	
		table.insert(RX2F4_Adjust.Menus,{
			N="Job",P= function(PN) 
			return RX2F4_Open_JobSelector(PN,false)  -- by setting this to ' false ' its NOT VIP Job
		end})
		
		table.insert(RX2F4_Adjust.Menus,{
			N="Shop",P= function(PN) 
			return RX2F4_Open_Shop(PN,false)  -- by setting this to ' false ' its NOT VIP Shop
		end})
		
		table.insert(RX2F4_Adjust.Menus,{
			N="Website",P= function(PN) 
			return RX2F4_Open_HTML(PN,"endlessonlinegaming.tk")
		end})
		
		
		
		
		
/* ───────────────────────────────────────────────────
	Colors  < RX Blue >
─────────────────────────────────────────────────── */
RX2F4_Adjust.Colors = {}


	-- Main
	RX2F4_Adjust.Colors.Main = {}
		
		-- Main
		RX2F4_Adjust.Colors.Main.TitleText = Color(0,255,255,255)
		RX2F4_Adjust.Colors.Main.SubTitleText = Color(0,220,255,200)
		RX2F4_Adjust.Colors.Main.Line = Color(0,150,255,200)
	
		-- Category Button
		RX2F4_Adjust.Colors.Main.CB_Text = Color(0,255,255,255)
		RX2F4_Adjust.Colors.Main.CB_Effect = Color(0,120,255,50)
		
		-- ScrollBar 
		RX2F4_Adjust.Colors.Main.SCB_Boarder = Color(0,200,255,255)
		RX2F4_Adjust.Colors.Main.SCB_Inner = Color(0,200,255,5)
		
		
		
		
	-- Command Menu
	RX2F4_Adjust.Colors.CM = {}
	
	RX2F4_Adjust.Colors.CM.TitleColor = Color(0,255,255,255)
	RX2F4_Adjust.Colors.CM.TitleLine = Color(0,150,255,255)
	
		-- Money Actions
		RX2F4_Adjust.Colors.CM.MA_ButtonBoarder = Color(0,255,255,20)
		RX2F4_Adjust.Colors.CM.MA_ButtonText = Color(0,255,255,255)
		RX2F4_Adjust.Colors.CM.MA_ButtonFX = Color(0,255,255,255)
	
		-- DarkRP Actions
		RX2F4_Adjust.Colors.CM.DA_ButtonBoarder = Color(0,120,255,20)
		RX2F4_Adjust.Colors.CM.DA_ButtonText = Color(0,120,255,255)
		RX2F4_Adjust.Colors.CM.DA_ButtonFX = Color(0,120,255,255)
	
		-- Mayor Actions
		RX2F4_Adjust.Colors.CM.MOA_ButtonBoarder = Color(0,255,255,20)
		RX2F4_Adjust.Colors.CM.MOA_ButtonText = Color(0,255,255,255)
		RX2F4_Adjust.Colors.CM.MOA_ButtonFX = Color(0,255,255,255)
	
		-- Police Actions
		RX2F4_Adjust.Colors.CM.PA_ButtonBoarder = Color(0,255,255,20)
		RX2F4_Adjust.Colors.CM.PA_ButtonText = Color(0,255,255,255)
		RX2F4_Adjust.Colors.CM.PA_ButtonFX = Color(0,255,255,255)
	
		
	
	-- Job Menu
	RX2F4_Adjust.Colors.JM = {}
	
	RX2F4_Adjust.Colors.JM.TitleColor = Color(0,255,255,255)
	RX2F4_Adjust.Colors.JM.TitleLine = Color(0,150,255,255)
	RX2F4_Adjust.Colors.JM.Line = Color(0,100,255,20)
	RX2F4_Adjust.Colors.JM.WeaponList = Color(0,200,200,200)
	RX2F4_Adjust.Colors.JM.Salary_MaxText = Color(0,255,255,200)
	RX2F4_Adjust.Colors.JM.HoverFX = Color(0,150,255,10)
	
		-- Job Hovering Panel
		RX2F4_Adjust.Colors.JMHP = {}
		
		RX2F4_Adjust.Colors.JMHP.Boarder = Color(0,255,255,255)
		RX2F4_Adjust.Colors.JMHP.Description = Color(0,150,255,255)
	
	
	
	
	
	
	-- Shop Menu
	RX2F4_Adjust.Colors.SM = {}
	
	RX2F4_Adjust.Colors.SM.TitleColor = Color(0,255,255,255)
	RX2F4_Adjust.Colors.SM.TitleLine = Color(0,150,255,255)
	
		-- Left Category
		RX2F4_Adjust.Colors.SM.LC_Text = Color(0,255,255,200)
		RX2F4_Adjust.Colors.SM.LC_Effect = Color(0,150,255,50)
		
		-- Item List
		RX2F4_Adjust.Colors.SM.IL_Text = Color(0,255,255,255)
		RX2F4_Adjust.Colors.SM.IL_Price = Color(0,150,255,255)
		RX2F4_Adjust.Colors.SM.IL_Line = Color(0,200,255,20)
		RX2F4_Adjust.Colors.SM.IL_ButtonFX = Color(0,150,255,20)
	
	
	
	
	-- HTML Menu
	RX2F4_Adjust.Colors.HM = {}
	
	RX2F4_Adjust.Colors.HM.AdressBarLine = Color(0,255,255,255)
	RX2F4_Adjust.Colors.HM.Button = Color(0,150,255,255)
	RX2F4_Adjust.Colors.HM.AdressText = Color(0,255,255,255)
	RX2F4_Adjust.Colors.HM.AdressTextButtomLine = Color(0,150,255,255)
	
	
	
	
	
	-- Rule Menu
	RX2F4_Adjust.Colors.RM = {}
	
	RX2F4_Adjust.Colors.RM.Title = Color(0,255,255,255)
	RX2F4_Adjust.Colors.RM.TitleLine = Color(0,150,255,255)
	RX2F4_Adjust.Colors.RM.Body = Color(0,220,255,100)
	