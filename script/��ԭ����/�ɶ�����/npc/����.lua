-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 峨眉门派任务成都无赖脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_main_em.lua");

function OnDeath()

local nTaskValue = FN_GetTaskState(FN_EM);

	if (nTaskValue==3) then
		task_010();
		Msg2Player("Quay v� t譵 Chu Thi謓 Nh﹏!");
		Say("Quay v� t譵 Chu Thi謓 Nh﹏!",0);
	end

end;