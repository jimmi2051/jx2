--�칤������ʫӢ
Include("\\script\\isolate\\functions\\armory\\item\\armory_box4_nb.lua")

g_NpcName = "<color=green>Thi�n c�ng x�o th� L�u Thi Anh<color>:";

function main()
	local strtab = {
		format("%s/#lsy_enhance(201)", "Mu�n c��ng h�a thu�c t�nh c� b�n c�a V�n S�c"),
		format("%s/#lsy_enhance(202)", "Mu�n t�ng ph�m ch�t V�n S�c"),
--		format("%s/#lsy_enhance(203)", "��Ҫ�߼�ǿ�����εȼ�"),
--		format("%s/#lsy_enhance(204)", "��Ҫ������������"),
		--format("%s/change_lv4_armory", "ת��4������ר�������������(ÿ��10000��)"),
		format("%s/lsy_intro_main", "Gi�i thi�u V�n S�c"),
		format("%s/nothing", "Ra kh�i"),
	};
	Say(g_NpcName.."",
		getn(strtab),
		strtab)
end

function lsy_enhance(nType)
	nType = nType or 201;
	SendScript2Client(format("Open([[CommonEnhanceItem]],%d);", nType));
end

function lsy_intro_main()
	local strtab = {
		format("%s/#lsy_intro(1)", "V�n S�c l� g�"),
		format("%s/#lsy_intro(2)", "C��ng h�a c�p V�n S�c c� t�c d�ng g�"),
		format("%s/#lsy_intro(3)", "T�ng ph�m ch�t V�n S�c c� t�c d�ng g�"),
		-- format("%s/#lsy_intro(4)", "��ξ�����������"),
		format("%s/#lsy_intro(5)", "C�ch nh�n V�n S�c"),
		format("%s/#lsy_intro(6)", "C�ch nh�n nguy�n li�u c��ng h�a V�n S�c"),
		format("%s/#lsy_intro(7)", "C��ng h�a V�n S�c Nh� Th� N�o"),
		format("%s/#lsy_intro(8)", "N�ng c�p ph�m ch�t V�n S�c nh� th� n�o"),
		format("%s/nothing", "Ra kh�i"),
	};
	Say(g_NpcName.."",
		getn(strtab),
		strtab)
end


lsy_tIntro = {
	[1] = "Nguy�n li�u V�n S�c g�m Ch� V�ng, Ng�n Ti, Ng�c Th�ch, M� N�o, s� d�ng k� thu�t c� ��ng Ph��ng �� r�p h�nh v�o trang b�, \n     c� s�c m�nh ng� h�nh, kh�ng ch� t�ng thu�c t�nh chi�n ��u c�a ng��i mang, m� c�n t�ng ph�ng ng� ng� h�nh. ",
	[2] = "C��ng h�a c�p V�n S�c s� t�ng kh�ng t�nh ng� h�nh t��ng �ng, gi�m s�t th��ng c�a thu�c t�nh ng� h�nh t��ng �ng.",
	[3] = "V�n S�c g�m 4 ph�m ch�t: V�, Th��ng, V� H�, Ho�n m�.\n    T�ng ph�m ch�t V�n S�c s� t�ng gi� tr� c�a b� ph�n V�n S�c �ang �eo ho�c t�t c� thu�c t�nh chi�n ��u.",
	[4] = "Tinh luy�n/tr�ng luy�n V�n S�c c� th� tr�ng luy�n V�n S�c V� H� v� Ho�n M� th�nh V�n S�c Kh�c B�n c�ng v� tr� c�p cao h�n, c�n c� �� c��ng h�a c�a V�n S�c ban ��u ho�n tr� nguy�n li�u c��ng h�a v�i s� l��ng nh�t ��nh. Quy t�c ho�n tr� nh� sau:\n",
	[5] = "Th�i �� c�a Chi�t Xung X� ��i v�i b�n s� quy�t ��nh lo�i v�n s�c m� b�n c� th� nh�n ���c, cho n�n n�ng c�p danh v�ng Chi�t Xung X� c� th� nh�n ���c t�t c� c�c lo�i trang s�c. \n ti�u hao kh�c b�n v�n s�c c� th� nh�n ���c v�n s�c t��ng �ng v� tr� v�i thu�c t�nh ng�u nhi�n v� ng� h�nh.",
	[6] = "Trong ph� b�n anh h�ng Ki�m ��ng Y�n V�n c� th� nh�n ���c nguy�n li�u c��ng h�a v�n s�c.",
	[7] = "C��ng h�a v�n s�c c�n ti�u hao L�u Kim, trong qu� tr�nh c��ng h�a c� th� th�m v�o Thi�n V�n Th�ch �� gi�m t�n th�t khi c��ng h�a th�t b�i.\n    Sau khi �� c��ng h� V�n S�c ��t ��n 10, ti�p t�c c��ng h�a ph�i th�m v�o Thi�n V�n Th�ch m�i c� th� ti�n h�nh c��ng h�a.",
	[8] = "N�ng c�p ph�m ch�t c�n ti�u hao V�n S�c c� ��ng c�p, v� tr�, ph�m ch�t ��u gi�ng nhau.\n    Nguy�n li�u th�m v�o c�ng nhi�u, x�c su�t th�nh c�ng th� c�ng cao. <color=red>(n�u V�n S�c c�n n�ng c�p ph�m ch�t ho�c nguy�n li�u �� n�ng c�p c� v�t ph�m kh�a, th� V�n S�c sau khi n�ng c�p c�ng s� b� kh�a. )<color>",
};

function lsy_intro(nType)
	if not lsy_tIntro[nType] then return end
	Talk(1,"lsy_intro_main",g_NpcName..lsy_tIntro[nType]);
end

g_tPosName = {
	[17] = "V�n S�c ��u",
	[18] = "V�n S�c �o",
	[19] = "V�n S�c Qu�n",
	[20] = "V�n S�c Trang S�c 1",
	[21] = "V�n S�c Trang S�c 2",
};

g_tPosDetail = {
	[17] = 116,
	[18] = 113,
	[19] = 114,
	[20] = 115,
	[21] = 115,
}

g_nLiuIndex = 20131018
g_tItem_NB[g_nLiuIndex] = {g_NpcName,2,1,10032,4, 0,0,{{1,2,3,4,5,6,7,8,9}, {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}, {1}}};
	

function change_lv4_armory()
	local szMsg = g_NpcName .. "C� th� d�ng 10000 V�ng ch�n l�i thu�c t�nh trang b� c�a V�n S�c l�u ph�i c�p 4, kh�ng �nh h��ng ��n �� c��ng h�a, ph�m ch�t v� thu�c t�nh b� trang.";
	local tSel = {
		format("%s/#want_to_exchange(17)", "Mu�n chuy�n ��i V�n S�c ��u hi�n c�"),
		format("%s/#want_to_exchange(18)", "Mu�n chuy�n ��i V�n S�c �o hi�n c�"),
		format("%s/#want_to_exchange(19)", "Mu�n chuy�n ��i V�n S�c Qu�n hi�n c�"),
		format("%s/#want_to_exchange(20)", "Mu�n chuy�n ��i V�n S�c Trang S�c 1 hi�n c�"),
		format("%s/#want_to_exchange(21)", "Mu�n chuy�n ��i V�n S�c Trang S�c 2 hi�n c�"),
		format("%s/main", "tr� l�i"),
		format("%s/nothing", "K�t th�c ��i tho�i"),
	}
	Say(szMsg, getn(tSel), tSel);
end

function want_to_exchange(nPos)
	local nEquipIndex = GetPlayerEquipIndex(nPos)
	
	if nEquipIndex <= 0 then
		Talk(1, "", g_NpcName .. "Kh�ng c� trang b�" .. g_tPosName[nPos] .. " .");
		return 0;
	end
	
	local g, d, p = GetItemInfoByIndex(nEquipIndex);
	if g ~= 0 or g_tPosDetail[nPos] ~= d then
		Talk(1, "", "V� tr� ch� ��nh ch�a trang b� V�n S�c l�u ph�i c�p 4, sau khi ��ng � h�y th� l�i.");
		return 0;
	end
	
	p = p - tonumber(GetPlayerRoute()) * 10;
	
	if p ~= 4000 and p ~= 4001 then
		Talk(1, "", "V� tr� ch� ��nh ch�a trang b� V�n S�c l�u ph�i c�p 4, sau khi ��ng � h�y th� l�i.");
		return 0;
	end
	
	if GetItemSpecialAttr(nEquipIndex,"LOCK") == 1 or GetItemSpecialAttr(nEquipIndex,"UNLOCKING") == 1 then
		Talk(1, "", "V�n S�c ch� ��nh �ang trong tr�ng th�i kh�a ho�c �ang m� kh�a, kh�ng th� chuy�n ��i thu�c t�nh.");
		return 0;
	end
	
	if GetItemOwner(nEquipIndex) ~= "" then
		Talk(1, "", "V�n S�c ch� ��nh �ang trong tr�ng th�i T�a H�n, kh�ng th� chuy�n ��i thu�c t�nh.");
		return 0;
	end
	
	if GetCash() < 100000000 then
		Talk(1, "", "Tr�n ng��i b�n Kh�ng �� 10000 V�ng.");
		return 0;
	end

	local nValue = nPos - 16;
	if nPos == 20 or nPos == 21 then 
		if p == 4001 then
			nValue = 5;
		else
			nValue = 4;
		end
	end
	g_tPlayerData[GetName()] = {};
	g_tPlayerData[GetName()].nEquipIndex = nEquipIndex;
	g_tPlayerData[GetName()].nArmory = nValue;
	g_tPlayerData[GetName()].nSeries = 1;
	g_tPlayerData[GetName()].bRoute = 1;
	g_tPlayerData[GetName()].nPos = nPos;
	
	MakeArmory(g_nLiuIndex, 3);
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

		if not tData.nArmory or not g_tRouteArmory[tData.nArmory] then
			return 0;
		end
		local tArmory = g_tRouteArmory[tData.nArmory][2];
		local szItemName = GetItemName(tArmory[2], tArmory[3], tArmory[4] + tonumber(GetPlayerRoute()) * 10);
		szMsg = szMsg .. format("\t\t%s <color=yellow>(B�o l�u �� c��ng h�a v� ph�m ch�t c�a V�n S�c ban ��u)<color>\n", szItemName);
		
		for k, v in g_tMagicAttribute.tMagicInfo do
			if not tData.tMagicAttribute or not tData.tMagicAttribute[k] or not v[tData.tMagicAttribute[k]] then
				return 0;
			end
			szMsg = szMsg..format("\t\tThu�c t�nh - %s\n", v[tData.tMagicAttribute[k]][5][1]);
		end

		local tMenu = {
			format("\n%s	/#MakeArmory_Confirm(%d,%d,%d)", "��ng �", nSel, nStep, 1),
			format("\n%s	/#MakeArmory(%d, %d)", "tr� l�i", nSel, nStep - 1),
			format("%s/nothing", "Ra kh�i"),
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
		change_lv4_armory();
		return 0;
	end

	local tData = g_tPlayerData[GetName()];
	local tArmory = {};
	local tMagicAttribute	= {};

	if not tData.nArmory or not tData.nSeries then
		return 0;
	end
	
	if not g_tRouteArmory[tData.nArmory] then
		return 0;
	end

	local tTempArmory = g_tRouteArmory[tData.nArmory][2];
	tArmory = {tTempArmory[1], tTempArmory[2], tTempArmory[3], tTempArmory[4] + tonumber(GetPlayerRoute()) * 10}

	for k, v in g_tMagicAttribute.tMagicInfo do
		if not tData.tMagicAttribute or not tData.tMagicAttribute[k] or not v[tData.tMagicAttribute[k]] then
			return 0;
		end
		tMagicAttribute[k] = v[tData.tMagicAttribute[k]][5][1 + tItem[5]];
	end

	local nPos = tData.nPos;
	local nEquipIndex = GetPlayerEquipIndex(nPos);
	
	if nEquipIndex ~= tData.nEquipIndex then
		Talk(1, "", "Trang b� tr�n ng��i b�n l�i, h�y th� l�i.");
		return 0;
	end
	
	if nEquipIndex <= 0 then
		Talk(1, "", g_NpcName .. "Kh�ng c� trang b�" .. g_tPosName[nPos] .. " .");
		return 0;
	end
	
	local g, d, p = GetItemInfoByIndex(nEquipIndex);
	
	if g ~= 0 or g_tPosDetail[nPos] ~= d then
		Talk(1, "", "V� tr� ch� ��nh ch�a trang b� V�n S�c l�u ph�i c�p 4, sau khi ��ng � h�y th� l�i.");
		return 0;
	end
	
	p = p - tonumber(GetPlayerRoute()) * 10;
	
	if p ~= 4000 and p ~= 4001 then
		Talk(1, "", "V� tr� ch� ��nh ch�a trang b� V�n S�c l�u ph�i c�p 4, sau khi ��ng � h�y th� l�i.");
		return 0;
	end
	
	if GetItemSpecialAttr(nEquipIndex,"LOCK") == 1 or GetItemSpecialAttr(nEquipIndex,"UNLOCKING") == 1 then
		Talk(1, "", "V�n S�c ch� ��nh �ang trong tr�ng th�i kh�a ho�c �ang m� kh�a, kh�ng th� chuy�n ��i thu�c t�nh.");
		return 0;
	end
	
	if GetItemOwner(nEquipIndex) ~= "" then
		Talk(1, "", "V�n S�c ch� ��nh �ang trong tr�ng th�i T�a H�n, kh�ng th� chuy�n ��i thu�c t�nh.");
		return 0;
	end
	
	if GetCash() < 100000000 then
		Talk(1, "", "Tr�n ng��i b�n Kh�ng �� 10000 V�ng.");
		return 0;
	end
	
	if Pay(100000000) ~= 1 then
		Talk(1, "", "Tr�n ng��i b�n Kh�ng �� 10000 V�ng.");
		return 0;
	end

	local nExhance = GetEquipAttr(nEquipIndex,2);
	local nQuality = GetArmoryQuality(nEquipIndex);

	ItemLog(nEquipIndex, "L�u Thi Anh chuy�n ��i thu�c t�nh V�n S�c c�p 4. V�t ph�m ban ��u");
	if 1 ~= DelItemByIndex(tData.nEquipIndex, -1) then
		return 0;
	end
	local szItemName = GetItemName(tArmory[2], tArmory[3], tArmory[4]);
	gf_SetLogCaption("L�u Thi Anh chuy�n ��i thu�c t�nh V�n S�c c�p 4.");
	local _, nIdx = gf_AddItemEx({tArmory[2], tArmory[3], tArmory[4], 1, 1, tMagicAttribute[1][2], tMagicAttribute[1][1], tMagicAttribute[2][2], tMagicAttribute[2][1], tMagicAttribute[3][2], tMagicAttribute[3][1], -1, nExhance}, szItemName);
	SetArmoryQuality(nIdx, nQuality);
	
	gf_SetLogCaption("");
	
	g_tPlayerData[GetName()] = nil;
	
	nothing();

	return 1;
end

function MakeArmory_Route()
	change_lv4_armory();
end