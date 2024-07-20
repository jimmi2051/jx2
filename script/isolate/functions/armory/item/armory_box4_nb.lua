Include("\\script\\isolate\\functions\\armory\\item\\armory_box_nb.lua")

g_tMagicAttribute.tMagicInfo = {
	[1] = { -- ͷ �·� ���� ����
		{10,	10,	10,	10,	{"Hi�u qu� t�ng s�c m�nh, hi�u qu� g�n c�t v� t�n c�ng ng� h�nh",	{819, 1},	{819, 1},	{855, 1},	{1174, 1}}},
		{10,	10,	10,	10,	{"Hi�u qu� t�ng s�c m�nh, hi�u qu� linh ho�t v� t�n c�ng ng� h�nh",	{820, 1},	{820, 1},	{856, 1},	{1175, 1}}},
		{20,	20,	20,	20,	{"Hi�u qu� t�ng s�c m�nh, hi�u qu� th�n ph�p v� t�n c�ng ng� h�nh",	{821, 1},	{821, 1},	{857, 1},	{1176, 1}}},
		{15,	15,	15,	15,	{"Hi�u qu� t�ng n�i c�ng, hi�u qu� linh ho�t v� t�n c�ng ng� h�nh",	{822, 1},	{822, 1},	{858, 1},	{1177, 1}}},
		{10,	10,	10,	10,	{"Hi�u qu� t�ng n�i c�ng, hi�u qu� th�n ph�p v� t�n c�ng ng� h�nh",	{823, 1},	{823, 1},	{859, 1},	{1178, 1}}},
		{10,	10,	10,	10,	{"Hi�u qu� t�ng n�i c�ng, hi�u qu� g�n c�t v� t�n c�ng ng� h�nh",	{824, 1},	{824, 1},	{860, 1},	{1179, 1}}},
		{15,	15,	15,	15,	{"Hi�u qu� t�ng linh ho�t, hi�u qu� th�n ph�p v� t�n c�ng ng� h�nh",	{825, 1},	{825, 1},	{861, 1},	{1180, 1}}},
		{5,	5,	5,	5,		{"Hi�u qu� t�ng linh ho�t, hi�u qu� g�n c�t v� t�n c�ng ng� h�nh",	{826, 1},	{826, 1},	{862, 1},	{1181, 1}}},
		{5,	5,	5,	5,		{"Hi�u qu� t�ng th�n ph�p, hi�u qu� g�n c�t v� t�n c�ng ng� h�nh",	{827, 1},	{827, 1},	{863, 1},	{1182, 1}}},
	},
	[2] = {
		{5,		5,	5,	5,	{"T�ng t�n c�ng Kim",		{779, 1},	{779, 1},	{779, 1},	{1183, 1},}},
		{5,		5,	5,	5,	{"T�ng t�n c�ng M�c",		{780, 1},	{780, 1},	{780, 1},	{1184, 1},}},
		{5,		5,	5,	5,	{"T�ng t�n c�ng Th�y",		{781, 1},	{781, 1},	{781, 1},	{1185, 1},}},
		{5,		5,	5,	5,	{"T�ng t�n c�ng H�a",		{782, 1},	{782, 1},	{782, 1},	{1186, 1},}},
		{5,		5,	5,	5,	{"T�ng t�n c�ng Th�",		{783, 1},	{783, 1},	{783, 1},	{1187, 1},}},
		{5,		5,	5,	5,	{"T�ng ph�ng ng� Kim",		{784, 1},	{784, 1},	{784, 1},	{1188, 1},}},
		{5,		5,	5,	5,	{"T�ng ph�ng ng� M�c",		{785, 1},	{785, 1},	{785, 1},	{1189, 1},}},
		{5,		5,	5,	5,	{"T�ng ph�ng ng� Th�y",		{786, 1},	{786, 1},	{786, 1},	{1190, 1},}},
		{5,		5,	5,	5,	{"T�ng ph�ng ng� H�a",		{787, 1},	{787, 1},	{787, 1},	{1191, 1},}},
		{5,		5,	5,	5,	{"T�ng ph�ng ng� Th�",		{788, 1},	{788, 1},	{788, 1},	{1192, 1},}},
		{15,	15,	15,	15,	{"S�t th��ng t�ng ",					{789, 1},	{789, 1},	{789, 1},	{1193, 1},}},
		{10,	10,	10,	10,	{"T�ng t� l� n�i k�ch",		{790, 1},	{790, 1},	{790, 1},	{1194, 1},}},
		{10,	10,	10,	10,	{"T�ng t� l� ngo�i c�ng",		{790, 1},	{790, 1},	{790, 1},	{1195, 1},}},
		{5,		5,	5,	5,	{"T�ng ch�nh x�c",				{792, 1},	{792, 1},	{792, 1},	{1196, 1},}},
		{5,		5,	5,	5,	{"T�ng n� tr�nh",				{793, 1},	{793, 1},	{793, 1},	{1197, 1},}},
		{5,		5,	5,	5,	{"T�ng Sinh l�c",				{795, 1},	{795, 1},	{795, 1},	{1198, 1},}},
	},
	[3] = {
			[1 ] = {1,   1,   1,   1,		{"T�ng t� l� n�i l�c sinh l�c v� kh�ng t�t c� Ng� H�nh",	{798, 1},	{799, 1},	{800, 1}, {1199, 1}}},
		},
};

g_tRouteArmory = {
	{1,	{"Quang Chi�u Thi�n V�n",	0,	116,	4000, "Thi�n V�n-��u-"}},
	{1,	{"Quang Chi�u Chi�n V�n",	0,	113,	4000, "Chi�n V�n-Ngo�i trang-"}},
	{1,	{"Quang Chi�u Huy�n V�n",	0,	114,	4000, "Huy�n V�n-H� Y-"}},
	{1,	{"Quang Chi�u Minh �i�u",	0,	115,	4000, "Minh �i�u-Trang s�c-"}},
	{1,	{"Quang Chi�u �m Kh�c",	0,	115,	4001, "�m Kh�c-Trang s�c-"}},
}

function Confirm(nSel)
	local tItem = g_tItem_NB[nSel];

	if not tItem then
		return 0;
	end

	g_tPlayerData[GetName()] = {};

	local szTitle	= format("<color=green>[%s]<color>: M� nh�n ���c 1 V�n S�c %s c�p 4 � v� tr� ch� ��nh, thu�c t�nh ng� h�nh, thu�c t�nh c� b�n, c�ng c� th� ch�n V�n S�c l�u ph�i v�i v� tr� ch� ��nh v� thu�c t�nh c� b�n. Ch� �: Thu�c t�nh ng� h�nh t��ng �ng v�i v� tr� c�a V�n S�c l�u ph�i.\n\n",tItem[1], g_tStringTable.tQuality[tItem[7]]);
	local tMenu	= {
		"V�n S�c l�u ph�i c�p 4/#Award(" .. nSel .. ", 1)",
		"V�n S�c c�p 4/#Award("..nSel..")",
		"�� ta ngh� l�i/nothing",
	};
	Say(szTitle, getn(tMenu), tMenu);

	return 1;
end

function Award(nSel, bRoute)
	local tItem = g_tItem_NB[nSel];

	if not tItem then
		return 0;
	end

	if 1 ~= gf_JudgeRoomWeight(1, 1, tItem[1]) then
		return 0;
	end

	g_tPlayerData[GetName()] = g_tPlayerData[GetName()] or {};
	if not g_tPlayerData[GetName()].bConfirm or 1 ~= g_tPlayerData[GetName()].bConfirm then
		MakeArmory(nSel, nil, bRoute);
		return 0;
	end

	local tData			= g_tPlayerData[GetName()];
	local tArmory			= {};
	local tMagicAttribute	= {};

	if not tData.nArmory or not tData.nSeries then
		return 0;
	end
	bRoute = tData.bRoute;
	
	if not bRoute then
		if not g_tArmory[tData.nArmory] or not g_tArmory[tData.nArmory][tItem[5]] or not g_tArmory[tData.nArmory][tItem[5]][tData.nSeries] then
			return 0;
		end
	else
		if not g_tRouteArmory[tData.nArmory] then
			return 0;
		end
	end

	if not bRoute then
		tArmory = g_tArmory[tData.nArmory][tItem[5]][tData.nSeries][2];
	else
		local tTempArmory = g_tRouteArmory[tData.nArmory][2];
		tArmory = {tTempArmory[1], tTempArmory[2], tTempArmory[3], tTempArmory[4] + tonumber(GetPlayerRoute()) * 10}
	end

	for k, v in g_tMagicAttribute.tMagicInfo do
		if not tData.tMagicAttribute or not tData.tMagicAttribute[k] or not v[tData.tMagicAttribute[k]] then
			return 0;
		end
		tMagicAttribute[k] = v[tData.tMagicAttribute[k]][5][1 + tItem[5]];
	end

	if 1 ~= DelItem(tItem[2], tItem[3], tItem[4], 1) then
		return 0;
	end
	
	gf_SetLogCaption(g_szLogCaption);
	local _, nIdx = gf_AddItemEx({tArmory[2], tArmory[3], tArmory[4], 1, 1, tMagicAttribute[1][2], tMagicAttribute[1][1], tMagicAttribute[2][2], tMagicAttribute[2][1], tMagicAttribute[3][2], tMagicAttribute[3][1], -1, tItem[6]}, tArmory[1]);
	SetArmoryQuality(nIdx, tItem[7]);

	nothing();

	return 1;
end

function MakeArmory(nSel, nStep, bRoute)
	if not nStep then
		g_tPlayerData[GetName()] = {};
		nStep = 1;
	end
	bRoute = bRoute or g_tPlayerData[GetName()].bRoute;
	if 1 == nStep and not bRoute then
		MakeArmory_Armory(nSel, nStep);
	elseif 2 == nStep and not bRoute then
		MakeArmory_Series(nSel, nStep);
	elseif 1 == nStep and bRoute then
		MakeArmory(nSel, nStep + 1, bRoute);
	elseif 2 == nStep and bRoute then
		MakeArmory_Route(nSel, nStep);
	elseif 3 == nStep then
		MakeArmory_MagicAttribute(nSel, nStep, 1);
	elseif 4 == nStep then
		MakeArmory_MagicAttribute(nSel, nStep, 2);
	elseif 5 == nStep then
		MakeArmory_MagicAttribute(nSel, nStep, 3);
	elseif 6 == nStep then
		MakeArmory_Confirm(nSel, nStep);
	elseif 7 == nStep then
		Award(nSel);
	else
		Confirm(nSel);
	end

	return 1;
end

function MakeArmory_Confirm(nSel, nStep, nValue)
	local tItem = g_tItem_NB[nSel];
	if not tItem then
		return 0;
	end

	local tData = g_tPlayerData[GetName()];
	if not tData then
		return 0;
	end
	if not nValue then
		local szMsg = format("<color=green>[%s]<color>: �� ch�n\n", tItem[1]);

		if tData.bRoute then
			if not tData.nArmory or not g_tRouteArmory[tData.nArmory] then
				return 0;
			end
		else
			if not tData.nArmory or not g_tStringTable.tArmoryEx[tData.nArmory] then
				return 0;
			end
		end
		if tData.bRoute then
			local tArmory = g_tRouteArmory[tData.nArmory][2];
			local szItemName = GetItemName(tArmory[2], tArmory[3], tArmory[4] + tonumber(GetPlayerRoute()) * 10);
			szMsg = szMsg .. format("\t\t%s\n", szItemName);
		else
			szMsg = szMsg..format("\t\t%s\n", g_tStringTable.tArmoryEx[tData.nArmory]);
		end

		if not tData.bRoute then
			if not tData.nSeries or not g_tStringTable.tSeries[tData.nSeries] then
				return 0;
			end
			szMsg = szMsg..format("\t\tNg� h�nh - %s\n", g_tStringTable.tSeries[tData.nSeries]);
		end

		for k, v in g_tMagicAttribute.tMagicInfo do
			if not tData.tMagicAttribute or not tData.tMagicAttribute[k] or not v[tData.tMagicAttribute[k]] then
				return 0;
			end
			szMsg = szMsg..format("\t\tThu�c t�nh - %s\n", v[tData.tMagicAttribute[k]][5][1]);
		end

		local tMenu = {
			format("\nX�c nh�n	/#MakeArmory_Confirm(%d,%d,%d)", nSel, nStep, 1),
			format("\n Ph�n h�i	/#MakeArmory(%d, %d)", nSel, nStep - 1),
			"Ra kh�i	/nothing",
		};

		Say(szMsg, getn(tMenu), tMenu);

		return 1;
	end

	if 1 == nValue then
		g_tPlayerData[GetName()].bConfirm = 1;
		MakeArmory(nSel, nStep + 1);
	end

	return 1;
end

function MakeArmory_Route(nSel, nStep, nValue)
		local tItem = g_tItem_NB[nSel];

	if not tItem then
		return 0;
	end

	if not nValue then
		local szMsg = format("<color=green>[%s]<color>: V�n S�c l�u ph�i chia l�m Thi�n V�n, Chi�n V�n, Huy�n V�n, Minh �i�u, �m Kh�c, kh�ng th� ch�n thu�c t�nh ng� h�nh c�a m�i c�i, c�ng t�o th�nh 1 b�, m�c 2 c�i tr� l�n s� c� thu�c t�nh b� trang th�m so v�i V�n S�c th��ng.\n\n", tItem[1]);
		local tMenu = {
			format("\n Ph�n h�i	/#Confirm(%d)", nSel),
			"Ra kh�i	/nothing",
		};
		for k, v in g_tRouteArmory do
			tinsert(tMenu, getn(tMenu) - 1, format("@ %s%s /#MakeArmory_Route(%d, %d, %d)", v[2][5], gf_GetRouteName(), nSel, nStep, k));
		end

		Say(szMsg, getn(tMenu), tMenu);

		return 1;
	end
	g_tPlayerData[GetName()].nArmory = nValue;
	g_tPlayerData[GetName()].nSeries = 1;
	g_tPlayerData[GetName()].bRoute = 1;
	MakeArmory(nSel, nStep + 1);

	return 1;
end