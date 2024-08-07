-- IB物品

Include("\\script\\lib\\globalfunctions.lua")

tIBItems = {
--	{{"小包聚义令",2,95,210},{"聚义令",{2	,95,208,10}}},
--	{{"大包聚义令",2,95,211},{"聚义令",{2	,95,208,50}}},
--	{{"金蛋宝箱",2,95,213},{"金蛋",{2,95,189,10}}},
--	{{"一袋小金锤",2,95,215},{"小金锤",{2,95,187,1}}},
--	{{"一盒小金锤",2,95,216},{"小金锤",{2,95,187,10}}},
--	{{"一箱小金锤",2,95,217},{"小金锤",{2,95,187,100}}},
--	{{"一盒放大镜",2,95,218},{"放大镜",{2,95,195,3}}},
--	{{"小包新年许愿砂",2,95,232},{"新年许愿砂",{2,95,231,50}}},
--	{{"大包新年许愿砂",2,95,233},{"新年许愿砂",{2,95,231,250}}},
--	{{"小盒麻神笔录",2,95,614},{"麻神笔录",{2,95,613,10}}},
--	{{"大盒麻神笔录",2,95,615},{"麻神笔录",{2,95,613,50}}},	
--	{{"小包通天令牌",2,95,660},{"通天令牌",{2,95,621,10}}},
--	{{"大包通天令牌",2,95,661},{"通天令牌",{2,95,621,50}}},	
--	{{"天阴银符印包裹",2,95,670},{"天阴银符印",{2,95,619,10}}},
--	{{"天阴金符印包裹",2,95,671},{"天阴金符印",{2,95,620,10}}},	
--	{{"小包镇远换镖令",2,95,882},{"镇远换镖令",{2,95,918,10}}},	
--	{{"大包镇远换镖令",2,95,883},{"镇远换镖令",{2,95,918,100}}},	
--	{{"小包斗魄令",2,95,1516},{"斗魄令",{2,95,1511,50}}},	
--	{{"大包斗魄令",2,95,1517},{"斗魄令",{2,95,1511,250}}},
	{{"Bao Thi猲 Ki猽 L謓h Nh�",2,95,2086},{"Thi猲 Ki猽 L謓h",{2,97,236,10}}},	
	{{"Bao Thi猲 Ki猽 L謓h L韓",2,95,2087},{"Thi猲 Ki猽 L謓h",{2,97,236,50}}},	
}

function OnUse(nItemIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	local nType = 0;
	for i = 1,getn(tIBItems) do
		if nID1 == tIBItems[i][1][2] and nID2 == tIBItems[i][1][3] and nID3 == tIBItems[i][1][4] then
			nType = i;
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	local tSel = {
		format("Hi謓 t筰 d飊g/#onOpen(%d,%d)", nItemIdx,nType),
		"сng/nothing",
	}
	Say(format("D飊g %s s� nh薾 頲 <color=yellow>%d c竔 %s<color>, mu鑞 d飊g ngay kh玭g??",tIBItems[nType][1][1],tIBItems[nType][2][2][4],tIBItems[nType][2][1]),
		getn(tSel), tSel);
end

function onOpen(nItemIdx,nType)
	if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		gf_SetLogCaption("open packed ib item:"..tIBItems[nType][1][1]);
		gf_AddItemEx(tIBItems[nType][2][2], tIBItems[nType][2][1]);
		gf_SetLogCaption("");
	end
end

