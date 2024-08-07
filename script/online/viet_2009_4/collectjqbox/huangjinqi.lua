--=============================================
--create by baiyun 2009.4.13
--describe:越南版4月份收集校旗箱活动 黄金旗
--=============================================
Include("\\script\\online\\viet_2009_4\\collectjqbox\\jiaoqi_head.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua")

function OnUse()
	----检查活动时间
	if tonumber(date("%Y%m%d%H")) > 2009060724 then
		Talk(1, "", "Th阨 h筺 s� d鬾g v藅 ph萴 n祔  h誸!");
		return 0;
	end
	
	-----判断背包和负重------------------------
	if gf_Judge_Room_Weight(5, 50, "Xin l鏸, ") == 0 then
		return 0
	end
	
	if DelItem(2, 1, 30084, 1) ~= 1 then
		return 0;
	end
	
	--检查今天是否有得到经验
	--检查得到的经验是否到达上限
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(JQ_TASK_GET_GOLDEN_FLAG_REWARD_DATE) < nDate then --如果今天第一次获得经验
		SetTask(JQ_TASK_GET_GOLDEN_FLAG_REWARD_DATE, nDate);
	end;
	
	--给经验
	if GetTask(JQ_TASK_GOLDEN_FLAG_EXP_MAX) < JQ_GOLDEN_FLAG_EXP_MAX then
		ModifyExp(JQ_GOLDEN_FLAG_EACH_EXP);
		SetTask(JQ_TASK_GOLDEN_FLAG_EXP_MAX, GetTask(JQ_TASK_GOLDEN_FLAG_EXP_MAX) + JQ_GOLDEN_FLAG_EACH_EXP);
		Msg2Player("B筺 nh薾 頲 " .. JQ_GOLDEN_FLAG_EACH_EXP .. "Kinh nghi謒");
		WriteLog("[Ho箃 ng thu th藀 hi謚 k� th竛g 4]:" .. GetName() .. "Nh薾 頲" .. JQ_GOLDEN_FLAG_EACH_EXP .. "Kinh nghi謒");
	else
		Msg2Player("H玬 nay  s� d鬾g Ho祅g Kim K� t n kinh nghi謒 cao nh蕋 r錳!");
	end
	
	--得到随机物品
	local nItem = JQ_GetRandItem(JQ_YG_FLAG_ITEM_PARAM);
	
	--获得声望
	if nItem >= 8 and nItem <= 11 then 
		ModifyReputation(JQ_YG_FLAG_ITEM_PARAM[nItem][7], 0);
		Msg2Player("B筺 nh薾 頲 " .. JQ_YG_FLAG_ITEM_PARAM[nItem][7] .. " 甶觤" .. "Danh v鋘g");		
		WriteLogEx("Hoat dong thang 4","Ho祅g Kim K�",JQ_YG_FLAG_ITEM_PARAM[nItem][7],JQ_YG_FLAG_ITEM_PARAM[nItem][1]);		
		return 1;
	end
	--获得修为
	if nItem == 12 then
		ModifyPopur(20);
		Msg2Player("B筺 nh薾 頲 " .. JQ_YG_FLAG_ITEM_PARAM[nItem][7] .. " 甶觤" .. "Luy謓");
		WriteLogEx("Hoat dong thang 4","Ho祅g Kim K�",JQ_YG_FLAG_ITEM_PARAM[nItem][7],JQ_YG_FLAG_ITEM_PARAM[nItem][1]);		
		return 1;
	end
	--获得藏剑点
	if nItem == 13 then
		SetTask(1801, GetTask(1801) + JQ_YG_FLAG_ITEM_PARAM[nItem][7]);
		Msg2Player("B筺 nh薾 頲 " .. JQ_YG_FLAG_ITEM_PARAM[nItem][7] .. " 甶觤" .. "甶觤 t祅g ki誱");
		WriteLogEx("Hoat dong thang 4","Ho祅g Kim K�",JQ_YG_FLAG_ITEM_PARAM[nItem][7],JQ_YG_FLAG_ITEM_PARAM[nItem][1]);
		return 1;
	end
	--其它物品奖励
	local nResult, nIndex = AddItem(JQ_YG_FLAG_ITEM_PARAM[nItem][3], JQ_YG_FLAG_ITEM_PARAM[nItem][4], JQ_YG_FLAG_ITEM_PARAM[nItem][5], JQ_YG_FLAG_ITEM_PARAM[nItem][7]);
	if nResult == 1 then
		if JQ_YG_FLAG_ITEM_PARAM[nItem][6] ~= 0 then
			SetItemExpireTime(nIndex, JQ_YG_FLAG_ITEM_PARAM[nItem][6]);
		end
		Msg2Player("B筺 nh薾 頲 " .. JQ_YG_FLAG_ITEM_PARAM[nItem][7] .. "c竔" .. JQ_YG_FLAG_ITEM_PARAM[nItem][1]);
		WriteLogEx("Hoat dong thang 4","Ho祅g Kim K�",JQ_YG_FLAG_ITEM_PARAM[nItem][7],JQ_YG_FLAG_ITEM_PARAM[nItem][1]);
	end
	
end