
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 门派接引人脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- Modify by yanjun
--2008/06/02 AM 11:43

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\faction\\faction_head.lua");

--=============================================================================
function main()
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Linh Th筩h xu蕋 hi謓 tr猲 giang h�, kh緋 n琲 bang ph竔 tranh h飊g, kh玭g bi誸 y l� ph骳 hay l� h鋋 cho gi韎 v� l﹎!");
	end;
	list_content(1);
end;

