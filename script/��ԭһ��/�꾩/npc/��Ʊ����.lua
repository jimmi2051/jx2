--function main()
--IdentiryAll()
--end;
-- -----------------------------------------
-- Newbie Quest Lua Scripts / Danexx 2005.01
-- -----------------------------------------
-- Include Files
Include( "\\script\\中原一区\\汴京\\npc\\init_新手任务.lua" )

-- Variable
	
-- Start of Main Function
function main()
--  新手任务相关
	NewbieTaskStrings =	 {"    цi th� thng s� d鬾g v� kh� ng� h祅h mang t輓h s竧 thng gi韎 h筺, ch� c莕 d飊g <color=blue>v� kh� ng� h祅h<color> d鵤 theo t輓h tng kh綾 l� c� th� t筼 ra s竧 thng l韓.",
						  "    Ha! Ha! V� kh� ng� h祅h c騨g c� tai h筰 khi i m苩 v韎 thu閏 t輓h tng sinh kh玭g th� t筼 ra s竧 thng l韓 nh璶g kh玭g sao ch� c莕 ph鑙 h頿 ng thu閏 t輓h ng� h祅h th� uy l鵦 s� cao g蕄 b閕."}

--  每个任务可以得到的奖励
	TaskExp		= 	 	 {10,0}
	TaskReward	=	 	 {0,0}
	TaskItem	=		{{0,0,0},
						 {0,0,0}}
--	TaskMagic	=		{{0,0,0},
--						 {0,0,0}}
						 
    if ( GetTask(103) == 1 ) then
		Talk(1, "", NewbieTaskStrings[1])
		SetTask(103, 2)
		SetTask(100, (GetTask(100) + 1))
		ModifyExp(TaskExp[1])
		-- AddItem() 五行武器
	else
		Talk(1, "", NewbieTaskStrings[2])
	end
end;

