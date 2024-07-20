-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 药王洞NPC药人草Script
-- By StarryNight
-- 2007/08/04 AM 11:23

-- 我是一颗草~(*^__^*) 嘻嘻……

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local strTalk = {};

	---------------------------------- 西北区18分支1_9芷寒烈阳----------------------------------
	
	SetNpcLifeTime(index,0);
	SetNpcScript(index,"");
	
	if nStep_XBTask_01 == 41 then
	
		SetTask(KILL_YAORENBOSS_NUM,GetTask(KILL_YAORENBOSS_NUM)+1);
		
		if GetTask(KILL_YAORENBOSS_NUM) >= 5 then
			
			DelItem(2,0,725,1);--删去烈阳水
			SetTask(KILL_YAORENBOSS_NUM,0);--变量清零
			SetTask(TASK_XB_ID_01,42);--成功消灭5株药人草
			strTalk = {
				"T輈h Dng th駓 qu� nhi猲 kh綾 ch� 頲 c t輓h c馻 Dc Nh﹏ Th秓, v藋 l� ﹎ m璾 c馻 Dc Vng v� T﹜ H� t筸 th阨 b� kh鑞g ch�. Chi b籲g n h醝  Dng H鋋 ti襫 b鑙 bc ti誴 theo n猲 l祄 sao.",
				}
			TalkEx("",strTalk);
			Msg2Player("Х ti猽 di謙 Dc Nh﹏ Th秓, quay v� t譵  Dng ti襫 b鑙 b祅 b筩.");
			TaskTip("Х ti猽 di謙 Dc Nh﹏ Th秓, quay v� t譵  Dng ti襫 b鑙 b祅 b筩.");
		
		else
			
			strTalk = {
				"L筰 di謙 頲 1 Dc Nh﹏ Th秓, xem ra T輈h Dng th駓 qu� l� c玭g hi謚, hi謓 gi�  ti猽 di謙 頲 "..GetTask(KILL_YAORENBOSS_NUM).." c﹜, ph秈 ti猽 di謙 5 c﹜ m韎 ki襪 h穖 頲 s� sinh s秐 c馻 Dc Nh﹏ Th秓"
				}
				
			TalkEx("",strTalk);
			
		end
		
	end

end
