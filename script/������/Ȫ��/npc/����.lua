-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 峨眉门派任务成都无赖脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_main_em.lua");


function main()

local nTaskValue = FN_GetTaskState(FN_EM);
local strMain = {

		"Mu閕 mu閕 ng y猽 qu竻.N祇! T韎 y ca ca h玭 c竔 coi!",
		"Qu� nhi猲 l� 竎 ! в ta cho ngi bi誸 l� !"

	}
	if (nTaskValue==3) then
		TE_Talk(getn(strMain), "task_010", strMain);
		return
	else
		Say("Kh玭g c� g� th� bi課 甶!",0);
	end

end