-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理NPC陈立衡Script
-- By StarryNight
-- 2005/01/09 PM 15:38

--农历网站坏了，以后看不到通胜了～～～

-- ======================================================

-- 引用剧情任务文件
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\大理\\lv50\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nTask_DL_State_50 = GetTask(TASK_DL_LV50_ID);
--print("nTask_DL_State_50:"..nTask_DL_State_50)
	
	--领取土司佩刀任务
	if nTask_DL_State_50 == 1 then
		task_000_00();
		return
	end
	
	--已经领取土司佩刀任务
	if nTask_DL_State_50 == 2 then
		task_001_00();
		return
	end
	
	--已经完成土司佩刀任务还没与苗岭族长对话
	if nTask_DL_State_50 == 3 then
		task_002_00();
		return
	end
	
	--一般情况下的对话
	local strTalk = {
		"Nghe n鉯 c� v� gi竜 s� n t� Trung Nguy猲, mi謓g n鉯 nh鱪g l阨 kh� hi觰! Ta mu鑞 di謓 ki課 h緉 m閠 phen!",
		"Tr莕 L藀 Ho祅h: bala b玪� bili! --(c� ng� Чi L�)",
		}
	TalkEx("",strTalk);
	return
	
end;
