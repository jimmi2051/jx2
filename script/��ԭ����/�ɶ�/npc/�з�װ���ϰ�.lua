
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 服装店老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");


function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Kh秏 n筸 linh th筩h d飊g  l祄 trang b� B竧 Qu竔  xu蕋 hi謓 tr猲 giang h�, ta s緋 c� m鑙 l祄 ╪ r錳 y!");
	end;		
	if (nState==2) and (GetSex()== 1) then
	
		task_002_00_male();
		return
	
	else
		i=random(1,3)
		if (i == 1) then
			Sale(42)
		elseif (i == 2) then
			Sale(42)
		else
			Sale(42)
		end
	end
	return
end;
