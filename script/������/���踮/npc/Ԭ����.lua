-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 凤翔府NPC袁飞云Script
-- By StarryNight
-- 2007/06/12 AM 11:25

-- 感谢主啊，可以让我放屁

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local nNpcIndex = GetTargetNpc();

	--取不到Index直接返回
	if nNpcIndex == 0 then
		return
	end

	--判断是否为当前玩家召唤出来的Npc
	if GetTask(YUANFEIYUN_NPCINDEX) == nNpcIndex then
	
		---------------------------------- 西北区05陈仓暗度----------------------------------
		
		--与袁飞云对话取得路线图
		if nStep_XBTask == 19 then
			task_005_04_0();
			return
		end
		
		--与袁飞云对话准备劫囚
		if nStep_XBTask == 23 then
			task_005_08_0(nNpcIndex);
			return
		end
		
		---------------------------------- 西北区07男儿铮骨----------------------------------
		
		--与袁飞云对话送与伤药
		if nStep_XBTask == 35 then
			task_007_07_0();
			return
		end
	
	else
		strTalk = {
			"Dng nh� nh莔 ngi."
			}
		TalkEx("",strTalk);
	end

end;

--袁飞云死亡脚本
function OnDeath(NpcIndex)

	NpcIndex = tonumber(NpcIndex);
	SetNpcLifeTime(NpcIndex,15);--使得尸体消失
	SetNpcScript(NpcIndex,"");--撤销该Npc所挂脚本
	
	if GetTask(TASK_XB_ID) == 23 and GetTask(YUANFEIYUN_NPCINDEX) == NpcIndex then
		--刷出娃娃杀手
		KillFollower();
		--清除路线图物品
		DelItem(2,0,693,1);
		DelItem(2,0,694,1);--删除烟雾弹
		task_005_08_3();
	end
		
end