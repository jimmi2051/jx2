-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理NPC刘典Script
-- By StarryNight
-- 2006/01/13 PM 10:09

--十一月廿九 丁亥土井闭日  
--宜：  裁衣、筑堤、修仓、修造、动土、上梁、补塞、作灶  
--忌：  理发、嫁娶  

-- 昨晚小偷进屋，室友稍有损失，年关难过啊……

-- ======================================================

-- 引用剧情任务文件
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\大理\\lv75\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nTask_DL_State_75 = GetTask(TASK_DL_LV75_ID);
--print("nTask_DL_State_75:"..nTask_DL_State_75)

	--未触发75级任务之前
	if nTask_DL_State_75 < 4 then
		local strTalk = {
			"Sao phi襫 ph鴆 th�! Chi b籲g quay v� giao ph� cho Tri謚 i nh﹏ xem!",
			}
		TalkEx("",strTalk);
		return
	end

	--未与刘典对话
	if nTask_DL_State_75 == 4 then
		task_000_00()
		return
	end
	
	--未/已收集完10张大理旧志
	if nTask_DL_State_75 == 5 then
		task_001_00()
		return
	end
	
	--未与郑贯之对话
	if nTask_DL_State_75 == 6 then
		task_002_00()
		return
	end
	
	--完成黑猩猩任务后
	if nTask_DL_State_75 > 6 then
		local strTalk = {
			"L蕐 頲 Чi L� c鵸 ch� v�, Tri謚 i nh﹏ nh蕋 nh s� r蕋 vui!",
			}
		TalkEx("",strTalk);
		RemoveTrigger(GetTrigger(KILL_DL_JOCKO));
		return
	end
end
