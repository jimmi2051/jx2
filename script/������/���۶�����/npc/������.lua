-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC阿修罗Script
-- By StarryNight
-- 2006/01/13 PM 16:22

--爱情在岁月流转中逐渐腿色，剩下的会是什么……

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- 玩家未组队
        if GetTask(TASK_DL_LV70_ID) == 1 or GetTask(TASK_DL_LV70_ID) == 2 then
        	SetTask(TASK_DL_LV70_ID, 2);
        	AddItem(2,0,380,1);--得到蚩火教密函
        	Msg2Player("Nh薾 頲 Si H醓 Gi竜 m藅 h祄, h穣 mau m� ra xem c� manh m鑙 g� ch╪g!");
        	TaskTip("Nh薾 頲 Si H醓 Gi竜 m藅 h祄, h穣 mau m� ra xem c� manh m鑙 g� ch╪g!");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV70_ID) == 1 or GetTask(TASK_DL_LV70_ID) == 2 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV70_ID, 2);
           	AddItem(2,0,380,1);--得到蚩火教密函
           	Msg2Player("Nh薾 頲 Si H醓 Gi竜 m藅 h祄, h穣 mau m� ra xem c� manh m鑙 g� ch╪g!");
           	TaskTip("Nh薾 頲 Si H醓 Gi竜 m藅 h祄, h穣 mau m� ra xem c� manh m鑙 g� ch╪g!");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
    end;
end