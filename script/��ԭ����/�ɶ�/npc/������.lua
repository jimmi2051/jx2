--�������ܽ��Ӳ�������
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

DSN_NPC = "<color=green>�� T� N��ng<color>: ";

function main()
	local tSay = {
		format("\nTi�m Linh �� Gi�i Ch�/#show_equip_shop(%d)", 3044),
		--format("\n����װ���̵�/#show_equip_shop(%d)", 3045),
		--format("\n�߼������̵�/#show_equip_shop(%d)", 3043),
		"\nTi�n c�p trang b� H�o Hi�p/NormalHaoxia2Level",
		"\nT�i ch� xem xem th�i/nothing",
	}		
	Say(DSN_NPC..format("%s c� th� gi�p ���c g� kh�ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end

tRecipe2Level = {
	[0] = {{"Vi�m Linh B�", {2, 1, 30676, 15}}, {"Linh Thi�t", {2, 1, 30681, 30}},	{"H�o Hi�p L�nh", {2, 95, 2084, 300}}},
	[1] = {{"Ma Lang Gi�p", {2, 1, 30677, 15}}, {"Linh Thi�t", {2, 1, 30681, 30}},	{"H�o Hi�p L�nh", {2, 95, 2084, 300}}},
	[2] = {{"Huy�n Vi�m C��ng", {2, 1, 30675, 20}}, {"Thi�n M�n Kim L�nh", {2, 1, 30370, 10}}, {"Thi�n Cang L�nh", {2, 95, 204, 10}}, {"Linh Kh� R�c R�", {2, 1, 31122, 2}},},
	[3] = {{"��a Long Gi�p", {2, 1, 30678, 15}}, {"Linh Thi�t", {2, 1, 30681, 30}},	{"H�o Hi�p L�nh", {2, 95, 2084, 300}}},
}

tWuxiaHaoxia = {
	[0] = {"V� H� H�o Hi�p L�nh (N�n)",	{2, 1, 30944, 1, 4}},
	[1] = {"V� H� H�o Hi�p L�nh (�o)",	{2, 1, 30945, 1, 4}},
	[2] = {"V� H� H�o Hi�p L�nh (V� Kh�)",    {2, 1, 30973, 1, 4}},
	[3] = {"V� H� H�o Hi�p L�nh (Qu�n)",	{2, 1, 30946, 1, 4}},
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
		format("��i V� H� H�o Hi�p L�nh (N�n)/#NormalHaoxia2Level_do(%d)", 0),
		format("��i V� H� H�o Hi�p L�nh (�o)/#NormalHaoxia2Level_do(%d)", 1),
		format("��i V� H� H�o Hi�p L�nh (Qu�n)/#NormalHaoxia2Level_do(%d)", 3),
		format("%s/#NormalHaoxia2Level_do(%d)", "��i V� H� H�o Hi�p L�nh (V� kh�)", 2),
		"\nT�i ch� xem xem th�i/nothing",
	}
	Say(DSN_NPC..format("Ti�n c�p trang b� H�o Hi�p, m�i %s h�y ch�n lo�i c�n ��i: <color=red> (H�y m�c trang b� H�o Hi�p tr�n ng��i)<color>", gf_GetPlayerSexName()), getn(tSay), tSay);
end

function NormalHaoxia2Level_do(nPos)
	local msg = "��i [<color=green>%s<color>] c�n ti�u hao: %s. <color=red>(Sau khi ��i trang b� H�o Hi�p �� c��ng h�a, ho�n tr� �� c��ng h�a theo quy t�c t�ch)<color>"
	local tRecipe = tRecipe2Level[nPos];
	local szCost = ""
	for i = 1, getn(tRecipe) do
		szCost = format("%s, %d [%s]", szCost, tRecipe[i][2][4], tRecipe[i][1])
	end
	szCost = strsub(szCost,2)
	msg = format(msg, tWuxiaHaoxia[nPos][1], szCost)
	Say(DSN_NPC..msg, 2, format("��i ngay/#Exchange2Wuxiaohao(%d)", nPos), "T�i h� ch� xem qua th�i/nothing")
end

function Exchange2Wuxiaohao(nPos)
	local nItemIndex = GetPlayerEquipIndex(nPos);
	local nEnhance = min(GetEquipAttr(nItemIndex, 2), 15);
	local nP = GetItemParticular(nItemIndex);
	if (nPos~= 2 and nP ~= 30568) or (nPos==2 and not(nP >= 30724 and nP <= 30743)) then
		Talk(1,"",DSN_NPC.."Ph�i m�c trang b� H�o Hi�p l�n ng��i m�i ���c ti�n c�p!");
		return 0;
	end
	local tRecipe = tRecipe2Level[nPos];
	for i = 1, getn(tRecipe) do
		if GetItemCount(tRecipe[i][2][1], tRecipe[i][2][2], tRecipe[i][2][3]) < tRecipe[i][2][4] then
			Talk(1,"",DSN_NPC..format("%s kh�ng �� %d c�i, kh�ng th� ho�n th�nh ��i.", tRecipe[i][1], tRecipe[i][2][4]));
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
			gf_AddItemEx2(v, GetItemName(v[1],v[2],v[3]), "Ti�n c�p H�o Hi�p", "Ho�n tr� �� c��ng h�a", 0, 1);
		end
	end
	local tAward = tWuxiaHaoxia[nPos];
	gf_AddItemEx2(tAward[2], tAward[1], "Ti�n c�p H�o Hi�p", "V� H� H�o Hi�p L�nh", 0, 1);
end
