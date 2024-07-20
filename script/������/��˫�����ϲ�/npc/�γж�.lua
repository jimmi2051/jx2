-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC段承恩Script
-- By StarryNight
-- 2006/01/13 PM 20:37

--爱情在岁月流转中逐渐腿色，剩下的会是什么……

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- 玩家未组队
        if GetTask(TASK_DL_LV80_ID) == 1 then
        	SetTask(TASK_DL_LV80_ID, 2);
        	Msg2Player("Х nh b筰 祅 Th鮝 , ch綾 ch緉 Nh� Ho祅g T� � g莕 y th玦.");
        	TaskTip("Х nh b筰 祅 Th鮝 , ch綾 ch緉 Nh� Ho祅g T� � g莕 y th玦.");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV80_ID) == 1 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV80_ID, 2);
           	Msg2Player("Х nh b筰 祅 Th鮝 , ch綾 ch緉 Nh� Ho祅g T� � g莕 y th玦.");
           	TaskTip("Х nh b筰 祅 Th鮝 , ch綾 ch緉 Nh� Ho祅g T� � g莕 y th玦.");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
    end;
end
