
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 杂货店老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");


function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	if random(1,20) == 1 then
		NpcChat(GetTargetNpc(),"Linh Th筩h? Ch� ta ch糿g c�  b竛, ngi 甶 h醝 ngi c馻 C玭g D� Th� Gia xem sao!");
	end;	
	
	if (nState==5) then
	
		task_005_00();
		return

	else
		i = random(1,3)
		if (i == 1) then
			Sale(35)
		elseif (i == 2) then
			Sale(35)
		else
			Sale(35)
		end
	end
	return
end;

