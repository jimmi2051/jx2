
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 药店老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");


function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
--	Restore()    --恢复玩家的生命
--	RestoreNeili()   --恢复玩家的内力（全满）
--	RestoreStamina()    --恢复玩家的体力（全满）
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Giang h� h鏽 lo筺, nghe n鉯 T﹜ B綾 l筰 b総 u l閚 x閚, ta s緋 c� m鑙 l祄 ╪ m韎 y!");
	end;		
	if (nState==4) then
	
		task_004_00();
		return

	else
		
		Sale(30);

	end;
	
	return

end;

