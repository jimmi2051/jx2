--生产技能戒子材料制作
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

DSN_NPC = "<color=green>х T� Nng<color>: ";

function main()
	local tSay = {
		format("\nTi謒 Linh у Gi韎 Ch�/#show_equip_shop(%d)", 3044),
		--format("\n豪侠装备商店/#show_equip_shop(%d)", 3045),
		--format("\n高级材料商店/#show_equip_shop(%d)", 3043),
		"\nTi課 c蕄 trang b� H祇 Hi謕/NormalHaoxia2Level",
		"\nT玦 ch� xem xem th玦/nothing",
	}		
	Say(DSN_NPC..format("%s c� th� gi髉 頲 g� kh玭g?", gf_GetPlayerSexName()), getn(tSay), tSay)
end

tRecipe2Level = {
	[0] = {{"Vi猰 Linh B�", {2, 1, 30676, 15}}, {"Linh Thi誸", {2, 1, 30681, 30}},	{"H祇 Hi謕 L謓h", {2, 95, 2084, 300}}},
	[1] = {{"Ma Lang Gi竝", {2, 1, 30677, 15}}, {"Linh Thi誸", {2, 1, 30681, 30}},	{"H祇 Hi謕 L謓h", {2, 95, 2084, 300}}},
	[2] = {{"Huy襫 Vi猰 Cng", {2, 1, 30675, 20}}, {"Thi猲 M玭 Kim L謓h", {2, 1, 30370, 10}}, {"Thi猲 Cang L謓h", {2, 95, 204, 10}}, {"Linh Kh� R鵦 R�", {2, 1, 31122, 2}},},
	[3] = {{"мa Long Gi竝", {2, 1, 30678, 15}}, {"Linh Thi誸", {2, 1, 30681, 30}},	{"H祇 Hi謕 L謓h", {2, 95, 2084, 300}}},
}

tWuxiaHaoxia = {
	[0] = {"V� H� H祇 Hi謕 L謓h (N鉵)",	{2, 1, 30944, 1, 4}},
	[1] = {"V� H� H祇 Hi謕 L謓h (僶)",	{2, 1, 30945, 1, 4}},
	[2] = {"V� H� H祇 Hi謕 L謓h (V� Kh�)",    {2, 1, 30973, 1, 4}},
	[3] = {"V� H� H祇 Hi謕 L謓h (Qu莕)",	{2, 1, 30946, 1, 4}},
}

tEnhanceAward = {
	[1] = {{2,2,7,1,4}},
	[2] = {{2,2,7,2,4}},
	[3] = {{2,2,7,4,4}},
	[4] = {{2,2,7,8,4}},
	[5] = {{2,2,7,16,4}},
	[6] = {{2,2,7,16,4},{2,2,8,10,4}},
	[7] = {{2,2,7,16,4},{2,2,8,20,4}},
	[8] = {{2,2,7,16,4},{2,2,8,40,4}},
	[9] = {{2,2,7,16,4},{2,2,8,80,4}},
	[10] = {{2,2,7,16,4},{2,2,8,160,4}},	
	[11] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,4,4}},
	[12] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,8,4}},
	[13] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,16,4}},
	[14] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,32,4}},
	[15] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,64,4}},
}

function NormalHaoxia2Level()
	local tSay = {
		format("фi V� H� H祇 Hi謕 L謓h (N鉵)/#NormalHaoxia2Level_do(%d)", 0),
		format("фi V� H� H祇 Hi謕 L謓h (僶)/#NormalHaoxia2Level_do(%d)", 1),
		format("фi V� H� H祇 Hi謕 L謓h (Qu莕)/#NormalHaoxia2Level_do(%d)", 3),
		format("%s/#NormalHaoxia2Level_do(%d)", "фi V� H� H祇 Hi謕 L謓h (V� kh�)", 2),
		"\nT玦 ch� xem xem th玦/nothing",
	}
	Say(DSN_NPC..format("Ti課 c蕄 trang b� H祇 Hi謕, m阨 %s h穣 ch鋘 lo筰 c莕 i: <color=red> (H穣 m芻 trang b� H祇 Hi謕 tr猲 ngi)<color>", gf_GetPlayerSexName()), getn(tSay), tSay);
end

function NormalHaoxia2Level_do(nPos)
	local msg = "фi [<color=green>%s<color>] c莕 ti猽 hao: %s. <color=red>(Sau khi i trang b� H祇 Hi謕  cng h鉧, ho祅 tr�  cng h鉧 theo quy t綾 t竎h)<color>"
	local tRecipe = tRecipe2Level[nPos];
	local szCost = ""
	for i = 1, getn(tRecipe) do
		szCost = format("%s, %d [%s]", szCost, tRecipe[i][2][4], tRecipe[i][1])
	end
	szCost = strsub(szCost,2)
	msg = format(msg, tWuxiaHaoxia[nPos][1], szCost)
	Say(DSN_NPC..msg, 2, format("фi ngay/#Exchange2Wuxiaohao(%d)", nPos), "T筰 h� ch� xem qua th玦/nothing")
end

function Exchange2Wuxiaohao(nPos)
	local nItemIndex = GetPlayerEquipIndex(nPos);
	local nEnhance = min(GetEquipAttr(nItemIndex, 2), 15);
	local nP = GetItemParticular(nItemIndex);
	if (nPos~= 2 and nP ~= 30568) or (nPos==2 and not(nP >= 30724 and nP <= 30743)) then
		Talk(1,"",DSN_NPC.."Ph秈 m芻 trang b� H祇 Hi謕 l猲 ngi m韎 頲 ti課 c蕄!");
		return 0;
	end
	local tRecipe = tRecipe2Level[nPos];
	for i = 1, getn(tRecipe) do
		if GetItemCount(tRecipe[i][2][1], tRecipe[i][2][2], tRecipe[i][2][3]) < tRecipe[i][2][4] then
			Talk(1,"",DSN_NPC..format("%s kh玭g  %d c竔, kh玭g th� ho祅 th祅h i.", tRecipe[i][1], tRecipe[i][2][4]));
			return 0;
		end
	end
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end
	for i = 1, getn(tRecipe) do
		if DelItem(tRecipe[i][2][1], tRecipe[i][2][2], tRecipe[i][2][3], tRecipe[i][2][4]) ~= 1 then
			return 0;
		end
	end
	if DelItemByIndex(nItemIndex, -1) ~= 1 then
		return 0;
	end	
	if nEnhance > 0 then
		local t = tEnhanceAward[nEnhance];
		for _, v in t do
			gf_AddItemEx2(v, GetItemName(v[1],v[2],v[3]), "Ti課 c蕄 H祇 Hi謕", "Ho祅 tr�  cng h鉧", 0, 1);
		end
	end
	local tAward = tWuxiaHaoxia[nPos];
	gf_AddItemEx2(tAward[2], tAward[1], "Ti課 c蕄 H祇 Hi謕", "V� H� H祇 Hi謕 L謓h", 0, 1);
end
