
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 服装店老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03
--*****************************************定义常量及预处理*********************************
Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\lifeskill\\skill_lvlup.lua")
LEVELTASKID49=518					--花笼百鸟裙
TASK_GATHER_FLAG=1931 --任务物品采集标示

strName = "";
strTitle = "";

--*****************************************MAIN函数*****************************************
function main()
		strName = GetTargetNpcName();
		if random(1,15) == 1 then
			NpcChat(GetTargetNpc(),"Kh秏 n筸 linh th筩h d飊g  l祄 trang b� B竧 Qu竔  xu蕋 hi謓 tr猲 giang h�, ta s緋 c� m鑙 l祄 ╪ r錳 y!");
		end;	
		if strName=="" or strName==nil then return end;
		strTitle = "<color=green>"..strName.."<color>: ";
		
		local nState = TE_GetTeachState()
		local nLevel = GetLevel()

	----------------------------------------------主对话-----------------------------------------------
		if (nState==2) and (GetSex()== 2) then	
			task_002_00_female();
			return
		else
			i=random(1,3)
			if (i == 1) then
				Sale(34)
			elseif (i == 2) then
				Sale(34)
			else
				Sale(34)
			end
		end
		return
end;

