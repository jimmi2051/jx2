
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 酒楼老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\大理\\lv58\\task_main.lua");
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

function main()

	--活动的
	local tSay = {};
	local tActivityID = {132, 139};
	for k, v in tActivityID do
		tSay = aah_GetSayDialog(tonumber(v));
	end
	if getn(tSay) > 0 then
		tinsert(tSay, "Ra kh醝/nothing")
		Say("Kh竎h quan n ti觰 甶誱 t譵 ru thng h筺g �? B秓 m s� 頲 h礽 l遪g!", getn(tSay), tSay);
		return 
	end
	
	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==12) then
		task_012_00();
		return
	end;
	
	if GetTask(TASK_DL_LV55_ID) == 7 and GetItemCount(2,0,377) < 1 then
		--跟襄阳酒楼老板买玉带糕              
		buy_gift_talk(4);
		return
	end;
	
	Talk(1,"","Kh竎h quan n ti觰 甶誱 t譵 ru thng h筺g �? B秓 m s� 頲 h礽 l遪g!");
	
end
