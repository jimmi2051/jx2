Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
--����
DebugOutput = nothing

--�Ƿ�Ϊ�·�������
--Experience server Switch
CK_ES_SWITCH = 0;
EXT_CDKEY = 3	

function _ck_check_tong()
	if IsTongMember() <= 0 then
		--Say(CK_NPC_NAME.."�����������������������", 0);
		return 0;
	end
	return 1
end
function _ck_check_shili()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp > 0 and nCamp <= 3 then
		return 1
	end
	return 0
end
function _ck_check_yueka()
	if IsActivatedVipCard() ~= 1 then
		--Say(CK_NPC_NAME.."����û�м����κ��¿��������������", 0);
		return 0;
	end
	return 1
end
function _ck_del_300_ziguangjifen()
	--���Ϲ����
	local TSK_POINT = 652;			--��¼��Ҹ��˹ؿ�����
	if GetTask(TSK_POINT) < 300 then
		Say(CK_NPC_NAME..format("�i�m t�ch l�y t� quang kh�ng �� <color=red>%d<color> �i�m", 300), 0);
		return 0;
	end
	SetTask(TSK_POINT, GetTask(TSK_POINT) - 300);
	return 1
end
function _ck_check_300_ziguangjifen()
	local TSK_POINT = 652;			--��¼��Ҹ��˹ؿ�����
	if GetTask(TSK_POINT) < 300 then
		return 0;
	end
	return 1
end

--��һ�ű�����¼�������� ��ǰ���ֹ������ܲ���
CK_EXT_AWARD = 0
T_CK_TASK_LIST = {
	--{enable, name,{condition,desc},{exp,score,exaward_func,ext_rate},{task_index,task_bit_get,task_bit_finish|func_check_finish,task_bit_award}}
	--��ս���� ������������
	[1101] = {0, "V�n ti�u", {"Ho�n th�nh 1 l�n nhi�m v� v�n ti�u", "��n b�n �� th� l�c ch� NPC Ti�u ��u Tr�n Vi�n Ti�u C�c �� nh�n nhi�m v� v�n ti�u"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 1, 2, 3}},
	[1102] = {0, "C��p ti�u", {"Ho�n th�nh 1 l�n nhi�m v� c��p ti�u", "��n b�n �� th� l�c ch� NPC Ti�u ��u Tr�n Vi�n Ti�u C�c �� nh�n nhi�m v� �o�t ti�u"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 4, 5, 6}},
	[1103] = {0, "Thu th�p Ng�c Ph�ch", {"Thu th�p 1 Ng�c Ph�ch", "��n Th�i H� C� Th� c�a th� l�c tr�ng 1 h�t gi�ng, thu th�p 1 Ng�c Ph�ch"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 7, 8, 9}},
	[1104] = {0, "Tr�m Ng�c Ph�ch", {"��n th� l�c kh�c tr�m 1 Ng�c Ph�ch", "V�o b�n �� th� l�c kh�c �� tr�m 1 Ng�c Ph�ch"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 10, 11, 12}},
	[1105] = {0, "T�y V�c Truy�n ��o", {"Tham gia t�nh n�ng T�y V�c Truy�n ��o, nh�p v�o 3 th�nh v�t �� nh�n th��ng", "V�o b�n �� th� l�c tham gia t�nh n�ng T�y V�c Truy�n ��o, nh�p v�o 3 th�nh v�t �� nh�n th��ng"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 13, 14, 15}},
	[1106] = {0, "BOSS Th� L�c", {"Nh�n b�o v� BOSS c�a th� l�c v� ti�u di�t BOSS c�a th� l�c phe ��ch �� nh�n ���c ph�n th��ng", "Bu�i t�i s� xu�t hi�n BOSS c�a th� l�c phe ta ho�c phe ��ch, b�o v� BOSS c�a phe ta v� ti�u di�t BOSS c�a phe ��ch s� nh�n ���c ph�n th��ng"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 16, 17, 18}},
	[1107] = {0, "Th� S�n Ti�n Th��ng", {"Ho�n th�nh 1 l�n nhi�m v� Th� S�n Ti�n Th��ng", "Ho�n th�nh 1 l�n nhi�m v� Th� S�n Ti�n Th��ng"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 19, 20, 21}},
	[1108] = {0, "Nhi�m v� ��o Kho B�u", {"Ho�n th�nh 1 l�n nhi�m v� ��o Kho B�u", "V�o th� l�c nh�n 1 T�ng B�o ��, ho�n th�nh 1 l�n nhi�m v� ��o Kho B�u"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 22, 23, 24}},
	
	--��ս���� ��������
--	[1201] = {},
--	[1202] = {},
--	[1203] = {},
--	[1204] = {},
--	
--	--��ս���� PvP����
--	[1301] = {},
--	[1302] = {},
--	[1303] =  {0, "��������pk", {"�������������1λ�ж����", "ɱ���ж�������1����ң�֤�����������"}, {8000000, 24}, {8, 25, 26, 27}},
--	[1304] = {},
--	[1305] = {},
--	[1306] = {},
--	[1307] = {},
	
	--��ս�پ� �������
	[2101] = {0, "Gia nh�p bang h�i", {"Gia nh�p m�t bang h�i b�t k�, tr� th�nh m�t th�nh vi�n trong bang", "Gia nh�p bang h�i, c�ng v�i th�nh vi�n kh�c c� g�ng �� gi�p bang h�i ng�y c�ng l�n m�nh"}, {3000000, 100}, {9, 0, _ck_check_tong, 1}},
	[2102] = {0, "T�i chi�n Th�n Th�", {"N�p 300 �i�m t�ch l�y t� quang (Sau khi giao nhi�m v� th� hai b�n s� b� tr� 300 �i�m t�ch l�y t� quang)", "Ch� c� ng��i m�i c� th� thu�n ph�c T� Quang Th�n Th�!"}, {5000000, 100, _ck_del_300_ziguangjifen}, {9, 0, _ck_check_300_ziguangjifen, 2}},
	[2103] = {0, "N�p �i�m c�ng hi�n bang h�i", {"Tham gia t�nh n�ng Bang H�i Vinh Danh, giao n�p 10 �i�m c�ng hi�n bang h�i", "Tham gia t�nh n�ng Bang H�i Vinh Danh, giao n�p 10 �i�m c�ng hi�n bang h�i"}, {8000000, 100}, {9, 0, 3, 4}},
	[2104] = {0, "Nh�n ph�n th��ng Bang H�i Vinh Danh", {"Nh�n ph�n th��ng Bang H�i Vinh Danh", "Tham gia t�nh n�ng Bang H�i Vinh Danh v� nh�n ph�n th��ng"}, {10000000, 300}, {9, 0, 5, 6}},
	
	[2201] = {0, "Th� Th�ng", {"K�ch ho�t 1 th� th�ng", "K�ch ho�t th� th�ng, ch�i tr� ch�i nh� nh�ng h�n"}, {5000000, 1200}, {10, 0, _ck_check_yueka, 1}},
	[2202] = {0, "Gia nh�p th� l�c", {"Gia nh�p 1 th� l�c trong ba phe", "Gia nh�p 1 th� l�c trong ba phe"}, {5000000, 300}, {10, 0, _ck_check_shili, 2}},
	[2203] = {0, "V�n ti�u", {"Ho�n th�nh 1 l�n v�n ti�u", "V�o th� l�c nh�n nhi�m v� v�n ti�u, ho�n th�nh 1 l�n v�n ti�u"}, {5000000, 600}, {10, 0, 3, 4}},
	[2204] = {0, "C��p ti�u", {"Ho�n th�nh 1 l�n c��p ti�u", "V�o th� l�c nh�n nhi�m v� c��p ti�u, ho�n th�nh 1 l�n c��p ti�u"}, {5000000, 600}, {10, 0, 5, 6}},
	[2205] = {0, "Tr�ng c�y", {"Ho�n th�nh 1 l�n nhi�m v� tr�ng c�y", "V�o th� l�c ch� C�y Th�i H� ho�n th�nh 1 l�n nhi�m v� tr�ng c�y"}, {5000000, 600}, {10, 0, 7, 8}},
	[2206] = {0, "��o r��ng", {"Ho�n th�nh 1 l�n nhi�m v� ��o r��ng", "Ho�n th�nh 1 l�n nhi�m v� ��o r��ng"}, {5000000, 600}, {10, 0, 9, 10}},
	[2207] = {0, "Th� S�n Ti�n Th��ng", {"Ho�n th�nh 1 l�n nhi�m v� Th� S�n Ti�n Th��ng", "Ho�n th�nh 1 l�n nhi�m v� Th� S�n Ti�n Th��ng"}, {5000000, 600}, {10, 0, 11, 12}},
	[2208] = {0, "T�y V�c Truy�n ��o", {"D�ng 1 ��o c� b�t k� sau ��y: Kim L�ng T�u, T�ng Ki�m B� Truy�n T�m Kinh, B�ch Hi�u Sinh B� Ph�p", "Tham gia t�nh n�ng T�y V�c Truy�n ��o, s� d�ng 1 ��o c� b�t k� sau ��y: Kim L�ng T�u, T�ng Ki�m B� Truy�n T�m Kinh, B�ch Hi�u Sinh B� Ph�p"}, {5000000, 600}, {10, 0, 13, 14}},
}

--�������б�,������������Ի�
T_CK_TASK_GROUP_LIST = {
	--name, {type,desc}, {sub_list_group}
	[1] = {
		"Tr�m Tr�n Tr�m Th�ng", {1, "H�ng ng�y nh�n ng�u nhi�n, nh�n ���c nhi�u EXP v� �� n�ng ��ng!"},
		{
			--name, random_count, {task_index_list}
			[1] = {"Nhi�m v� Th� L�c Ba Phe", 4, {1101,1102,1103,1104,1105,1106,1107,1108}}, --��ս����-������������
		},
	},
	[2] = {
		"T�c Chi�n T�c Th�ng", {2, "Trong th�i gian ho�t ��ng ch� ho�n th�nh 1 l�n, nh�n ���c nhi�u EXP v� �� n�ng ��ng!"},
		{
			[1] = {"Nhi�m v� bang h�i", 0, {2101,2102,2103,2104}}, --��ս�پ�-�������
			[2] = {"Nhi�m v� h��ng d�n", 0, {2201,2202,2203,2204,2205,2206,2207,2208}}, --��ս�پ�-ָ������
		},
	},
}

function ck_task_daily_clear()--ÿ������
	--��ս���������������
	local t = T_CK_TASK_GROUP_LIST[1][3]
	for _,t1 in t do
		for _,task_index in t1[3] do
			local tBitSet = _ck_get_task_bitset(task_index)
			local nGroupTaskIndex = tBitSet[1]
			local nBitGet = tBitSet[2]
			local nBitFinish = tBitSet[3]
			local nBitAward = tBitSet[4]
			if gDebug:is_debug() == 1 then--����ģʽ
				print("ck_task_daily_clear", task_index, nGroupTaskIndex, nBitGet, nBitFinish, nBitAward)
			end
			CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitGet, 0)
			CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitFinish, 0)
			CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitAward, 0)
		end
	end
end

--�ⲿ���� ����ĳһ������Ϊ���״̬
function ck_global_set_task_finish(nTaskIndex)
	--gf_TeamOperateEX(function()
		local t = _ck_get_task_cfg(nTaskIndex)
		if ck_IsOpen() ~= 1 then
			if gDebug:is_debug() == 1 then--����ģʽ
				print("ck_global_set_task_finish not open", nTaskIndex)
			end
			return 0;
		end
		if ck_GetTitleType() == 0 then
			if gDebug:is_debug() == 1 then--����ģʽ
				print("ck_global_set_task_finish title error", nTaskIndex)
			end
			return 0;
		end
		if _ck_check_task_enable(nTaskIndex)==0 then
			if gDebug:is_debug() == 1 then--����ģʽ
				print("ck_global_set_task_finish not enable", nTaskIndex)
			end
			return 0
		end
		if _ck_check_task_getflag(nTaskIndex)~=1 then
			if gDebug:is_debug() == 1 then--����ģʽ
				print("ck_global_set_task_finish not get", nTaskIndex)
			end
			return 0
		end
		local tBitSet = _ck_get_task_bitset(nTaskIndex)
		local nGroupTaskIndex = tBitSet[1]
		local nBitFinish = tBitSet[3]
		local szTaskName = t[2]
		if type(nBitFinish)=="number" and nBitFinish > 0 then
			if CK_TASK_GROUP:GetTaskBit(nGroupTaskIndex, nBitFinish) ~= 1 then
    		--ck_BZBD_SetType(14, 15, 16);
    		CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitFinish, 1);
    		Msg2Player(format("B�n �� ho�n th�nh CD Key nhi�m v� [%s]", szTaskName));
    	end
    else
    	if gDebug:is_debug() == 1 then--����ģʽ
				print("ck_global_set_task_finish bit error", nTaskIndex, nGroupTaskIndex, nBitFinish, szTaskName)
			end
    	--error(format("CDKey: no need to set finish of task %d", %nTaskIndex))
		end
	--end);
end

function ck_task_group_talk1(nMainIndex)
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	
	local t = T_CK_TASK_GROUP_LIST[nMainIndex]
	local tSay = {}
	local szTitle = format("<color=gold>%s<color>%s, %s", t[1], "Nhi�m v�", t[2][2])
	for i, tTaskGroup in T_CK_TASK_GROUP_LIST[nMainIndex][3] do
		tinsert(tSay, format("%s/#ck_task_group_talk2(%d, %d)", tTaskGroup[1], nMainIndex, i))
	end
	tinsert(tSay, format("%s/nothing", "T�i h� ch� xem qua th�i"))
	Say(CK_NPC_NAME..szTitle, getn(tSay), tSay)
end

function ck_task_group_talk2(nMainIndex, nSubIndex)
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	
	local t = T_CK_TASK_GROUP_LIST[nMainIndex]
	local tt = t[3][nSubIndex]
	local nRandCnt = tt[2]
	local tTaskList = tt[3]
	if nRandCnt > 0 then --û����ȡ����Ļ��������
		_ck_rand_task_list(tTaskList, nRandCnt)
	end
	
	local tSay = {}
	local szTitle = format("<color=gold>%s<color>%s", t[1], tt[1])
	for _, nTaskIndex in tTaskList do
		local szStatus = _ck_get_task_status(nTaskIndex)
		if _ck_check_task_getflag(nTaskIndex)==1 then
			local t = _ck_get_task_cfg(nTaskIndex)
			tinsert(tSay, format("%s(%s)/#ck_task_talk(%d)", t[2] , szStatus, nTaskIndex))
		end
	end
	if gDebug:is_debug() == 1 then--����ģʽ
		tinsert(tSay, format("%s/ck_DailyReset", "dailyclear"))
	end
	tinsert(tSay, format("%s/nothing", "T�i h� ch� xem qua th�i"))
	Say(CK_NPC_NAME..szTitle, getn(tSay), tSay)
end

--����Ի�
function ck_task_talk(nTaskIndex)
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	if _ck_check_task_enable(nTaskIndex)==0 then
		return 0
	end
	local t = _ck_get_task_cfg(nTaskIndex)
	local tSay = {}
	tinsert(tSay, format("\n%s/#_ck_task_award(%d)", "Ho�n th�nh nhi�m v�", nTaskIndex))
	if gDebug:is_debug() == 1 then--����ģʽ
		tinsert(tSay, format("\n%s/#ck_global_set_task_finish(%d)", "debugfinish", nTaskIndex))
	end
	tinsert(tSay, format("\n%s/nothing", "T�i h� ch� xem qua th�i"))
	local szStatus = _ck_get_task_status(nTaskIndex)
	local Msg = format("T�n nhi�m v�: <color=gold>%s(%s)<color>\n�i�u ki�n:\n  %s\nH��ng d�n:\n  %s\nPh�n th��ng:\n  EXP: %d, �� n�ng ��ng: %d",
		t[2], szStatus, t[3][1], t[3][2], t[4][1], t[4][2])
	Say(CK_NPC_NAME..Msg, getn(tSay), tSay)
end

function _ck_get_task_bitset(nTaskIndex)
	local t = _ck_get_task_cfg(nTaskIndex)
	return t[5]
end

--��ȡ�������
function _ck_rand_task_list(tTaskList, nCount)
	if nCount <= 0 then
		return
	end
	local nPass = 0
	local nMaxPass = 0
	local nGet = 0
	if ck_GetTitleType()==3 then--��Ծ����һ������
		nMaxPass = 1
	end
	
	for i = 1,getn(tTaskList) do --�ȼ����û������
		local nTaskIndex = tTaskList[i]
		if _ck_check_task_getflag(nTaskIndex) == 1 then --�Ѿ�������Ͳ��������
			return
		end
		if _ck_check_task_enable(nTaskIndex)==2 then
			if nPass<nMaxPass then
				nPass = nPass + 1
			else
				_ck_set_task_getflag(nTaskIndex)
				nGet = nGet + 1
			end
		end
	end
	
	if nGet>0 then
		return
	end
	
	local tGet = {}
	local nRand = min(nCount,getn(tTaskList))
	if gDebug:is_debug() == 1 then--����ģʽ
		print("_ck_rand_task_list", nCount, nRand)
	end
	for i=1,nRand do
		for j=1,5 do --����ͻ5��
			local nR = random(1,getn(tTaskList))
			if not tGet[nR] then
				local nTaskIndex = tTaskList[nR]
				tGet[nR] = 1
				if nPass<nMaxPass then
  				nPass = nPass + 1
  			else
  				_ck_set_task_getflag(nTaskIndex)
  				nGet = nGet + 1
  			end
				_ck_set_task_enable(nTaskIndex, 2)
				break
			end
		end
	end
end

function _ck_task_award(nTaskIndex)
	if ck_CheckCondition() ~= 1 then
		if gDebug:is_debug() == 1 then--����ģʽ
			print("condition false")
		end
		return 0;
	end
	if _ck_check_task_enable(nTaskIndex)==0 then
		if gDebug:is_debug() == 1 then--����ģʽ
			print(format("disable task %d", nTaskIndex))
		end
		return 0
	end
	if _ck_check_task_getflag(nTaskIndex)~=1 then
		Talk(1, "", "Kh�ng c� nhi�m v� n�y")
		return 0
	end
	if _ck_check_task_awardflag(nTaskIndex)==1 then
		Talk(1, "", "B�n �� nh�n ph�n th��ng nhi�m v� n�y r�i!")
		return 0
	end
	if _ck_check_task_finishflag(nTaskIndex)~=1 then
		Talk(1, "", "Nhi�m v� n�y v�n ch�a ho�n th�nh!")
		return 0
	end
	
	local t = _ck_get_task_cfg(nTaskIndex)
	if t[4][3] and (t[4][3]() ~= 1) then--����Ľ�������
		return 0
	end
	
	local tBitSet = _ck_get_task_bitset(nTaskIndex)
	local nGroupTaskIndex = tBitSet[1]
	local nBitAward = tBitSet[4]
	CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitAward, 1)
	local ext = t[4][4] or 0
	gf_ModifyExp(floor(t[4][1]*(1+ext)))
	ck_AddCkScore(floor(t[4][2]*(1+ext)))
	Msg2Player(format("Ch�c m�ng ho�n th�nh nhi�m v� [%s]", t[2]))
end

function _ck_get_task_cfg(nTaskIndex)
	local t = T_CK_TASK_LIST[nTaskIndex]
	if not t then
		error(format("CDKey: not find task %d", nTaskIndex))
	end
	return t
end

function _ck_get_task_status(nTaskIndex)
	local nType = 0
	local tType = {"Ch�a ho�n th�nh", "Ch�a nh�n", "Ch�a ho�n th�nh", "C� th� giao", "�� ho�n th�nh"}
	if _ck_check_task_enable(nTaskIndex)==0 then
		nType = 1
	elseif _ck_check_task_getflag(nTaskIndex)~=1 then
		nType = 2
	elseif _ck_check_task_finishflag(nTaskIndex)~=1 then
		nType = 3
	elseif _ck_check_task_awardflag(nTaskIndex)~=1 then
		nType = 4
	else
		nType = 5
	end
	return tType[nType] or ""
end

function _ck_set_task_getflag(nTaskIndex)--�����ѽ��ܱ�־
	if gDebug:is_debug() == 1 then--����ģʽ
		print("_ck_set_task_getflag", nTaskIndex)
	end
	if _ck_check_task_enable(nTaskIndex)==0 then--δ���������ܽ�
		return 0
	end
	local tBitSet = _ck_get_task_bitset(nTaskIndex)
	local nGroupTaskIndex = tBitSet[1]
	local nBit = tBitSet[2]
	if nBit and nBit > 0 then
		return CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBit, 1)
	end
	return 1 --����Ҫ����
end

function _ck_check_task_getflag(nTaskIndex)--����Ƿ��ѽ�������
	if _ck_check_task_enable(nTaskIndex)==0 then--δ���������ܽ�
		return 0
	end
	local tBitSet = _ck_get_task_bitset(nTaskIndex)
	local nGroupTaskIndex = tBitSet[1]
	local nBit = tBitSet[2]
	if nBit and nBit > 0 then
		local nRet = CK_TASK_GROUP:GetTaskBit(nGroupTaskIndex, nBit)
		if gDebug:is_debug() == 1 then--����ģʽ
			print("task_getflag", nTaskIndex, nGroupTaskIndex, nBit, nRet)
		end
		return nRet
	end
	return 1 --����Ҫ����
end
function _ck_check_task_enable(nTaskIndex)--����Ƿ���
	if not nTaskIndex or not T_CK_TASK_LIST[nTaskIndex] then--����δ����
		return 0
	end
	local t = _ck_get_task_cfg(nTaskIndex)
	return t[1]
end
function _ck_check_task_finishflag(nTaskIndex)--����Ƿ������
	if _ck_check_task_enable(nTaskIndex)==0 then--δ���������ܽ�
		return 0
	end
	local tBitSet = _ck_get_task_bitset(nTaskIndex)
	local nGroupTaskIndex = tBitSet[1]
	local nBit = tBitSet[3]
	if nBit then
		if type(nBit) == "function" then
			return nBit()
    	elseif nBit and nBit > 0 then
    		return CK_TASK_GROUP:GetTaskBit(nGroupTaskIndex, nBit)
    	else
    		return 1
    	end
	end
	return 0
end
function _ck_check_task_awardflag(nTaskIndex)--����Ƿ�����ȡ����
	if _ck_check_task_enable(nTaskIndex)==0 then--δ���������ܽ�
		return 1
	end
	local tBitSet = _ck_get_task_bitset(nTaskIndex)
	local nGroupTaskIndex = tBitSet[1]
	local nBit = tBitSet[4]
	if nBit and nBit > 0 then
		return CK_TASK_GROUP:GetTaskBit(nGroupTaskIndex, nBit)
	end
	error(format("CDKey: award bit error %d", nTaskIndex))
	return 1 --����bit�������
end

function _ck_set_task_enable(nTaskIndex, nFlag)
	local t = _ck_get_task_cfg(nTaskIndex)
	t[1] = nFlag or 1
--	if gDebug:is_debug() == 1 then--����ģʽ
--		print("set_task_enable", nTaskIndex)
--	end
end
function _ck_auto_set_task_enable()
	for _,t1 in T_CK_TASK_GROUP_LIST do
		for _,t2 in t1[3] do
			for _,task_index in t2[3] do
				_ck_set_task_enable(task_index)
			end
		end
	end
	--_ck_set_task_enable(1303)
end
_ck_auto_set_task_enable();--auto execute to reset tasks enabled flags

--����ֱǰϵ������
CK_TASK_FORWARD = {
	[1] = {"Ti�u di�t �c Lang", 226},
	[2] = {"Ti�u di�t H� Ly", 227},
	[3] = {"Ti�u di�t Xi H�a X�ch Gi�o ��", 228},
	[4] = {"Ti�u di�t Th��ng Vi�n", 229},
	[5] = {"Ti�u di�t Mi�u L�nh Th� Ty", 230},
	[6] = {"Ti�u di�t Ba T� Y�u C�", 231},
	[7] = {"Ti�u di�t Oa Qu�c �ao Kh�ch", 232},
	[8] = {"Ti�u di�t T� B� Ti�n T�", 233},
}

--��ս����ɱ������
CK_TASK_BZ_KILL = {
	[1] = {"Quay V� Ch�n C�", 234},
	[2] = {"Quay V� Ch�n C�", 235},
	[3] = {"Quay V� Ch�n C�", 236},
	[4] = {"Quay V� Ch�n C�", 237},
	[5] = {"Quay V� Ch�n C�", 238},
}

--��ս������������(���5��)
CK_TASK_BZ_RAID = {
	[1] = "Tham gia 1 l�n �i Th�i H�",
	[2] = "Tham gia 1 l�n �i L��ng S�n ",
	[3] = "Tham gia 1 l�n �i V�n Ki�m Tr�ng",
	[4] = "Tham gia 1 l�n �i ��a Huy�n Cung",
	[5] = "Tham gia 1 l�n �i Th�i Nh�t Th�p",
}

--��ս����PVP����
CK_TASK_BZ_PVP = {
	[1] = "Tham gia 3 l�n thi ��u 1v1",
	[2] = "Tham gia 3 l�n thi ��u 3v3",
	[3] = "��nh b�i 1 ng��i ch�i phe ��ch c�a th� l�c kh�c",	--"����һ��������ս��",
	[4] = "Tham gia 1 l�n Th�n l�ng chi�n",
	[5] = "Tham gia 1 l�n Th�o c�c chi�n",
	[6] = "Tham gia 1 l�n Ph�o ��i chi�n",
	[7] = "Tham gia 1 l�n Chi�n d�ch ch�nh Nh�n M�n",	
	[8] = "��nh b�i 1 ng��i ch�i phe ��ch c�a th� l�c kh�c",	
}

--��ֵ�ۼ�����
CK_TASK_ZILON_ATRR = {
	[1] = {"Gia nh�p giang h�", {0, 90, 2000, 2000, 10000}, {5000000, 100}},
	[2] = {"Ti�u H�u S� Th�nh", {0, 99, 3000, 3000, 20000}, {8000000, 200}},
	[3] = {"S� xu�t mao l�", {1, 90, 6000, 6000, 40000}, {11000000, 300}},
	[4] = {"S� Xu�t Mao L�", {2, 90, 8000, 8000, 80000}, {14000000, 400}},
	[5] = {"��i Lang ��o Sa", {3, 90, 10000, 10000, 120000}, {17000000, 500}},
	[6] = {"Ti�u H�u Danh Kh�", {4, 90, 12000, 12000, 180000}, {20000000, 600}},
	[7] = {"Tr�ng Ch� L�ng V�n", {5, 90, 15000, 15000, 250000}, {23000000, 1200}},
	[8] = {"Kh� tr�ng h� s�n", {6, 90, 16000, 16000, 280000}, {32000000, 1600}},
}
CK_TASK_ZILON_ATRR_BEGIN = 1

--�콾����������
CK_TASK_IB_COST = {
	--[1] = {"��Դ����", 5,   {12500000, 150}},
	--[2] = {"��������", 25,   {25000000, 300}},
	[1] = {"Phong Y T�c Th�c", 5,   {12500000, 150}},
	[2] = {"Uy Phong B�t Di�n", 25,  {25000000, 300}},
	[3] = {"Kinh t� gia ��nh", 50,  {37500000, 450}},	
	[4] = {"��i Ph� ��i Qu�", 100, {50000000, 900}},
	[5] = {"T�i ��i Kh� Th�", 200, {62500000, 1100}},
	[6] = {"Gia T�i V�n Qu�n", 300, {75000000, 1300}},
	[7] = {"Gi�u c� thi�n h�", 400, {100000000, 1500}},
	[8] = {"Ph� Kh� ��ch Qu�c", 500, {125000000, 1800}},
}
CK_TASK_IB_COST_BEGIN = getn(CK_TASK_ZILON_ATRR)+1


CK_JS_GUAIYI = {
	{"�o Cho�ng Ng� H�nh Kim Ch�", {0, 152, 4, 1, 4}},
	{"�o Cho�ng Ng� H�nh M�c Ch�", {0, 152, 5, 1, 4}},
	{"�o Cho�ng Ng� H�nh Th�y Ch�", {0, 152, 6, 1, 4}},
	{"�o Cho�ng Ng� H�nh H�a Ch�", {0, 152, 7, 1, 4}},
	{"�o Cho�ng Ng� H�nh Th� Ch�", {0, 152, 8, 1, 4}},
	{"�o Cho�ng Ng� H�nh �m Ch�", {0, 152, 9, 1, 4}},
}
CK_JS_HUIZHANG = { 
	{"Huy Ch��ng Kim Ch� ng� h�nh", {0, 153, 4, 1, 4}},
	{"Huy Ch��ng M�c Ch� ng� h�nh", {0, 153, 5, 1, 4}},
	{"Huy Ch��ng Th�y Ch� ng� h�nh", {0, 153, 6, 1, 4}},
	{"Huy Ch��ng H�a Ch� ng� h�nh", {0, 153, 7, 1, 4}},
	{"Huy Ch��ng Th� Ch� ng� h�nh", {0, 153, 8, 1, 4}},
	{"Huy Ch��ng �m Ch� ng� h�nh", {0, 153, 9, 1, 4}},
}
CK_JS_SHOE = {
	{"Chi�n H�i Kim Ch� ng� h�nh", {0, 154, 4, 1, 4}},
	{"Chi�n H�i M�c Ch� ng� h�nh", {0, 154, 5, 1, 4}},
	{"Chi�n H�i Th�y Ch� ng� h�nh", {0, 154, 6, 1, 4}},
	{"Chi�n H�i H�a Ch� ng� h�nh", {0, 154, 7, 1, 4}},
	{"Chi�n H�i Th� Ch� ng� h�nh", {0, 154, 8, 1, 4}},
	{"Chi�n H�i �m Ch� ng� h�nh", {0, 154, 9, 1, 4}},
}

CK_YAOYANG_JIEZI_1 = {
	{"Di�u D��ng-� L�n B�o Gi�i", {0, 102, 3176, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-T� Giao Ng�c B�i", {0, 102, 3178, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-V�n H� L�nh", {0, 102, 3180, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-X�ch T��c Ho�n", {0, 102, 3182, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-B�ch Quy Li�n", {0, 102, 3184, 1, 4, -1, -1, -1, -1, -1, -1}},
}

CK_YAOYANG_JIEZI_2 = {
	{"Di�u D��ng-� L�n B�o Gi�i", {0, 102, 3185, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-T� Giao Ng�c B�i", {0, 102, 3186, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-V�n H� L�nh", {0, 102, 3187, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-X�ch T��c Ho�n", {0, 102, 3188, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-B�ch Quy Li�n", {0, 102, 3189, 1, 4, -1, -1, -1, -1, -1, -1}},
}

CK_4_LEVEL_YUNLING = {
	{"H-Li�t Nham-Lv4", {0, 148, 53, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Ph� Kh�ng-Lv4", {0, 148, 54, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-T�y Ki�m-Lv4", {0, 148, 55, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-T�t Phong-Lv4", {0, 148, 56, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-T�n V�-Lv4", {0, 148, 57, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-�ng T�p-Lv4", {0, 148, 58, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Linh T�m-Lv4", {0, 148, 59, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Th�n L�c-Lv4", {0, 148, 60, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Ng�ng Th�n-Lv4", {0, 148, 61, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-V� Gian-Lv4", {0, 148, 62, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-V� C�c-Lv4", {0, 148, 63, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Cu�ng Nh�n-Lv4", {0, 148, 64, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-L�ng Nhu�-Lv4", {0, 148, 65, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Linh Vi�n-Lv4", {0, 148, 66, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-H�i V�n-Lv4", {0, 148, 67, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-H�i T�m-Lv4", {0, 148, 68, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Li�t Nham-Lv4", {0, 149, 53, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Ph� Kh�ng-Lv4", {0, 149, 54, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-T�y Ki�m-Lv4", {0, 149, 55, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-T�t Phong-Lv4", {0, 149, 56, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-T�n V�-Lv4", {0, 149, 57, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Qu�n Th�ch-Lv4", {0, 149, 58, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-N� Ng�m-Lv4", {0, 149, 59, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Xuy�n V�n-Lv4", {0, 149, 60, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Th�n L�c-Lv4", {0, 149, 61, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Ng�ng Th�n-Lv4", {0, 149, 62, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-V� Gian-Lv4", {0, 149, 63, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-V� C�c-Lv4", {0, 149, 64, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Cu�ng Nh�n-Lv4", {0, 149, 65, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-L�ng Nhu�-Lv4", {0, 149, 66, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Linh Vi�n-Lv4", {0, 149, 67, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-H�i V�n-Lv4", {0, 149, 68, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-H�i T�m-Lv4", {0, 149, 69, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Li�t Nham-Lv4", {0, 150, 53, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Ph� Kh�ng-Lv4", {0, 150, 54, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-T�y Ki�m-Lv4", {0, 150, 55, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-T�t Phong-Lv4", {0, 150, 56, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-T�n V�-Lv4", {0, 150, 57, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V� L��ng-Lv4", {0, 150, 58, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-M�c Minh-Lv4", {0, 150, 59, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Th�n L�c-Lv4", {0, 150, 60, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Ng�ng Th�n-Lv4", {0, 150, 61, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V� Gian-Lv4", {0, 150, 62, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V� C�c-Lv4", {0, 150, 63, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Cu�ng Nh�n-Lv4", {0, 150, 64, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-L�ng Nhu�-Lv4", {0, 150, 65, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Linh Vi�n-Lv4", {0, 150, 66, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-H�i V�n-Lv4", {0, 150, 67, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-H�i T�m-Lv4", {0, 150, 68, 1, 4, -1, -1, -1, -1, -1, -1}},
}

CK_5_LEVEL_YUNLING = {
	{"H-Li�t Nham-Lv5", {0, 148, 69, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Ph� Kh�ng-Lv5", {0, 148, 70, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-T�y Ki�m-Lv5", {0, 148, 71, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-T�t Phong-Lv5", {0, 148, 72, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-T�n V�-Lv5", {0, 148, 73, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-�ng T�p-Lv5", {0, 148, 74, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Linh T�m-Lv5", {0, 148, 75, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Th�n L�c-Lv5", {0, 148, 76, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Ng�ng Th�n-Lv5", {0, 148, 77, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-V� Gian-Lv5", {0, 148, 78, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-V� C�c-Lv5", {0, 148, 79, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Cu�ng Nh�n-Lv5", {0, 148, 80, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-L�ng Nhu�-Lv5", {0, 148, 81, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Linh Vi�n-Lv5", {0, 148, 82, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-H�i V�n-Lv5", {0, 148, 83, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-H�i T�m-Lv5", {0, 148, 84, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Li�t Nham-Lv5", {0, 149, 70, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Ph� Kh�ng-Lv5", {0, 149, 71, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-T�y Ki�m-Lv5", {0, 149, 72, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-T�t Phong-Lv5", {0, 149, 73, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-T�n V�-Lv5", {0, 149, 74, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Qu�n Th�ch-Lv5", {0, 149, 75, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-N� Ng�m-Lv5", {0, 149, 76, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Xuy�n V�n-Lv5", {0, 149, 77, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Th�n L�c-Lv5", {0, 149, 78, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Ng�ng Th�n-Lv5", {0, 149, 79, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-V� Gian-Lv5", {0, 149, 80, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-V� C�c-Lv5", {0, 149, 81, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Cu�ng Nh�n-Lv5", {0, 149, 82, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-L�ng Nhu�-Lv5", {0, 149, 83, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Linh Vi�n-Lv5", {0, 149, 84, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-H�i V�n-Lv5", {0, 149, 85, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-H�i T�m-Lv5", {0, 149, 86, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Li�t Nham-Lv5", {0, 150, 69, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Ph� Kh�ng-Lv5", {0, 150, 70, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-T�y Ki�m-Lv5", {0, 150, 71, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-T�t Phong-Lv5", {0, 150, 72, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-T�n V�-Lv5", {0, 150, 73, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V� L��ng-Lv5", {0, 150, 74, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-M�c Minh-Lv5", {0, 150, 75, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Th�n L�c-Lv5", {0, 150, 76, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Ng�ng Th�n-Lv5", {0, 150, 77, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V� Gian-Lv5", {0, 150, 78, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V� C�c-Lv5", {0, 150, 79, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Cu�ng Nh�n-Lv5", {0, 150, 80, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-L�ng Nhu�-Lv5", {0, 150, 81, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Linh Vi�n-Lv5", {0, 150, 82, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-H�i V�n-Lv5", {0, 150, 83, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-H�i T�m-Lv5", {0, 150, 84, 1, 4, -1, -1, -1, -1, -1, -1}},
}

CK_6_LEVEL_YUNLING = {
	{"T-Li�t Nham-Lv6", {0, 150,	85, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Ph� Kh�ng-Lv6", {0, 150,	86, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-T�y Ki�m-Lv6", {0, 150,	87, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-T�t Phong-Lv6", {0, 150,	88, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-T�n V�-Lv6", {0, 150,	89, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V� L��ng-Lv6", {0, 150,	90, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-M�c Minh-Lv6", {0, 150,	91, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Th�n L�c-Lv6", {0, 150,	92, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Ng�ng Th�n-Lv6", {0, 150,	93, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V� Gian-Lv6", {0, 150,	94, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V� C�c-Lv6", {0, 150,	95, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Cu�ng Nh�n-Lv6", {0, 150,	96, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-L�ng Nhu�-Lv6", {0, 150,	97, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Linh Vi�n-Lv6", {0, 150,	98, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-H�i V�n-Lv6", {0, 150,	99, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-H�i T�m-Lv6", {0, 150,100, 1, 4, -1, -1, -1, -1, -1, -1}},
}

function ck_GiveRandGem456()
	--Faction Cloth 9
	local VET_RandGem456 = {
        {1,20, "Huy�tTr�chTh�ch Lv4", {2,22,104,1},nil,nil,nil,nil},
        {1,20, "Nguy�tB�chTh�ch Lv4", {2,22,204,1},nil,nil,nil,nil},
        {1,20, "H� Ph�ch Th�ch C�p 4", {2,22,304,1},nil,nil,nil,nil},
        {1,20, "H�c Di�u Th�ch C�p 4", {2,22,404,1},nil,nil,nil,nil},
        {1,4, "Huy�tTr�chTh�ch Lv5", {2,22,105,1},nil,nil,nil,1},
        {1,4, "Nguy�tB�chTh�ch Lv5", {2,22,205,1},nil,nil,nil,1},
        {1,4, "H� Ph�ch Th�ch C�p 5", {2,22,305,1},nil,nil,nil,1},
        {1,4, "H�c Di�u Th�ch C�p 5", {2,22,405,1},nil,nil,nil,1},
        {1,1, "Huy�tTr�chTh�ch Lv6", {2,22,106,1},nil,nil,nil,1},
        {1,1, "Nguy�tB�chTh�ch Lv6", {2,22,206,1},nil,nil,nil,1},
        {1,1, "H� Ph�ch Th�ch C�p 6", {2,22,306,1},nil,nil,nil,1},
        {1,1, "H�c Di�u Th�ch C�p 6", {2,22,406,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem456,100,1, "CDKEY", "CDKEY")
end

function _award_jingjie(_nLevel, nExp)
	local nLevel = MeridianGetLevel()
	if nLevel < _nLevel then
		for i = nLevel + 1, _nLevel do
			MeridianUpdateLevel()
		end
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	else
		gf_Modify("Exp", nExp);
	end
end

function award_wuzhe()
	return _award_jingjie(1, 10000000)
end
function award_wujiang()
	return _award_jingjie(2, 30000000)
end
function award_wuwang()
	return _award_jingjie(3, 40000000)
end
function award_wuzun()
	return _award_jingjie(4, 200000000)
end
function award_5zhuan90()
	if gf_GetPlayerRebornCount() < 5 then
		gf_SetTaskByte(1538, 1, 5); 			--5ת
		gf_SetTaskByte(1538, 2, random(1,4)); 			--huong cs
		SetLevel(90, 1);								  --90��
		Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
	else
		gf_Modify("Exp", 20000000);
	end
end
function award_6zhuan90()
	if gf_GetPlayerRebornCount() < 6 then
		gf_SetTaskByte(1538, 1, 5); 			--1ת
		PlayerReborn(1,random(1,4))
		SetLevel(90, 1);								  --90��
		Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
		AddTitle(61,05)
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
	else
		gf_Modify("Exp", 50000000);
	end
end
	
function award_7zhuan73()
	if gf_GetTransLevel() >= 698 then
		if gf_GetPlayerRebornCount() < 7 then
			gf_SetTaskByte(1538, 1, 5); 			--1ת
			PlayerReborn(2,random(1,4))
			SetLevel(73, 1);						--73��
			Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
			RemoveTitle(61,05)
			AddTitle(61,06)
			PlaySound("\\sound\\sound_i016.wav");
			SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
		else
			gf_Modify("Exp", 500000000);
		end
	end
end

function award_yunling4()
	local nRandIndex = random(getn(CK_4_LEVEL_YUNLING));
	gf_AddItemEx2(CK_4_LEVEL_YUNLING[nRandIndex][2], CK_4_LEVEL_YUNLING[nRandIndex][1], "CDKEY", "CDKEY", 0, 1)
end
function award_yunling5()
	local nRandIndex = random(getn(CK_5_LEVEL_YUNLING));
	gf_AddItemEx2(CK_5_LEVEL_YUNLING[nRandIndex][2], CK_5_LEVEL_YUNLING[nRandIndex][1], "CDKEY", "CDKEY", 0, 1)
end
T_ZHANKUANG = {
	tHead = {
        { "Chi�n Cu�ng Thi�n ��a M�o", {0, 103, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 2},
        { "Chi�n Cu�ng Thi�n ��a M�o", {0, 103, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 2},
        { "Chi�n Cu�ng Thi�n T�n M�o", {0, 103, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 4},
        { "Chi�n Cu�ng Thi�n T�n M�o", {0, 103, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 4},
        { "Chi�n Cu�ng Ph� T� M�o", {0, 103, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 3},
        { "Chi�n Cu�ng Ph� T� M�o", {0, 103, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 3},
        { "Chi�n Cu�ng Tuy�t M�nh Qu�n", {0, 103, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 6},
        { "Chi�n Cu�ng Tuy�t M�nh Qu�n", {0, 103, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 6},
        { "Chi�n Cu�ng Tuy�t M�nh Qu�n", {0, 103, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 6},
        { "Chi�n Cu�ng Tuy�t M�nh Qu�n", {0, 103, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 6},
        { "Chi�n Cu�ng B� T�t Tr�m", {0, 103, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 8},
        { "Chi�n Cu�ng B� T�t Tr�m", {0, 103, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 8},
        { "Chi�n Cu�ng L�u Th�y Tr�m", {0, 103, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 9},
        { "Chi�n Cu�ng L�u Th�y Tr�m", {0, 103, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 9},
        { "Chi�n Cu�ng Th�n Du C�n", {0, 103, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 11},
        { "Chi�n Cu�ng Th�n Du C�n", {0, 103, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 11},
        { "Chi�n Cu�ng Th�n Du C�n", {0, 103, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 11},
        { "Chi�n Cu�ng Th�n Du C�n", {0, 103, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 11},
        { "Chi�n Cu�ng Ti�u Dao C�n", {0, 103, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 12},
        { "Chi�n Cu�ng Ti�u Dao C�n", {0, 103, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 12},
        { "Chi�n Cu�ng Ti�u Dao C�n", {0, 103, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 12},
        { "Chi�n Cu�ng Ti�u Dao C�n", {0, 103, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 12},
        { "Chi�n Cu�ng V� Vi Qu�n", {0, 103, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 14},
        { "Chi�n Cu�ng V� Vi Qu�n", {0, 103, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 14},
        { "Chi�n Cu�ng V� Vi Qu�n", {0, 103, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 14},
        { "Chi�n Cu�ng V� Vi Qu�n", {0, 103, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 14},
        { "Chi�n Cu�ng C�n Kh�n Qu�n", {0, 103, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 15},
        { "Chi�n Cu�ng C�n Kh�n Qu�n", {0, 103, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 15},
        { "Chi�n Cu�ng C�n Kh�n Qu�n", {0, 103, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 15},
        { "Chi�n Cu�ng C�n Kh�n Qu�n", {0, 103, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 15},
        { "Chi�n Cu�ng Thi�n Tinh  Kh�i", {0, 103, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 17},
        { "Chi�n Cu�ng Thi�n Tinh  Kh�i", {0, 103, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 17},
        { "Chi�n Cu�ng Thi�n Tinh  Kh�i", {0, 103, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 17},
        { "Chi�n Cu�ng Thi�n Tinh  Kh�i", {0, 103, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 17},
        { "Chi�n Cu�ng Xuy�n V�n Kh�i", {0, 103, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 18},
        { "Chi�n Cu�ng Xuy�n V�n Kh�i", {0, 103, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 18},
        { "Chi�n Cu�ng Xuy�n V�n Kh�i", {0, 103, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 18},
        { "Chi�n Cu�ng Xuy�n V�n Kh�i", {0, 103, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 18},
        { "Chi�n Cu�ng Minh T�n C�n", {0, 103, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 20},
        { "Chi�n Cu�ng Minh T�n C�n", {0, 103, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 20},
        { "Chi�n Cu�ng Minh T�n C�n", {0, 103, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 20},
        { "Chi�n Cu�ng Minh T�n C�n", {0, 103, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 20},
        { "Chi�n Cu�ng C� T�m C�n", {0, 103, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 21},
        { "Chi�n Cu�ng C� T�m C�n", {0, 103, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 21},
        { "Chi�n Cu�ng C� T�m C�n", {0, 103, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 21},
        { "Chi�n Cu�ng C� T�m C�n", {0, 103, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 21},
        { "Chi�n Cu�ng Phong L�i Qu�n", {0, 103, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 23},
        { "Chi�n Cu�ng Phong L�i Qu�n", {0, 103, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 23},
        { "Chi�n Cu�ng ��i ��a C�n", {0, 103, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 25},
        { "Chi�n Cu�ng ��i ��a C�n", {0, 103, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 25},
        { "Chi�n Cu�ng ��i ��a C�n", {0, 103, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 25},
        { "Chi�n Cu�ng ��i ��a C�n", {0, 103, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 25},
        { "Chi�n Cu�ng T�y M�ng Qu�n", {0, 103, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 26},
        { "Chi�n Cu�ng T�y M�ng Qu�n", {0, 103, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 26},
        { "Chi�n Cu�ng T�y M�ng Qu�n", {0, 103, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 26},
        { "Chi�n Cu�ng T�y M�ng Qu�n", {0, 103, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 26},
        { "Chi�n Cu�ng Ma V�c  Qu�n", {0, 103, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 27},
        { "Chi�n Cu�ng Ma V�c  Qu�n", {0, 103, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 27},
        { "Chi�n Cu�ng Ma V�c  Qu�n", {0, 103, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 27},
        { "Chi�n Cu�ng Ma V�c  Qu�n", {0, 103, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 27},
        { "Chi�n Cu�ng Th�nh N�  Tr�m", {0, 103, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 29},
        { "Chi�n Cu�ng Th�nh N�  Tr�m", {0, 103, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 29},
        { "Chi�n Cu�ng Th�nh Linh Tr�m", {0, 103, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 30},
        { "Chi�n Cu�ng Th�nh Linh Tr�m", {0, 103, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 30},
	},
	tCloth = {
        { "Chi�n Cu�ng Thi�n ��a B�o", {0, 100, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 2},
        { "Chi�n Cu�ng Thi�n ��a B�o", {0, 100, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 2},
        { "Chi�n Cu�ng Thi�n T�n B�o", {0, 100, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 4},
        { "Chi�n Cu�ng Thi�n T�n B�o", {0, 100, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 4},
        { "Chi�n Cu�ng Ph� T� B�o", {0, 100, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 3},
        { "Chi�n Cu�ng Ph� T� B�o", {0, 100, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 3},
        { "Chi�n Cu�ng Tuy�t M�nh Y", {0, 100, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 6},
        { "Chi�n Cu�ng Tuy�t M�nh Y", {0, 100, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 6},
        { "Chi�n Cu�ng Tuy�t M�nh Y", {0, 100, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 6},
        { "Chi�n Cu�ng Tuy�t M�nh Y", {0, 100, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 6},
        { "Chi�n Cu�ng B� T�t Y", {0, 100, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 8},
        { "Chi�n Cu�ng B� T�t Y", {0, 100, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 8},
        { "Chi�n Cu�ng L�u Th�yY", {0, 100, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 9},
        { "Chi�n Cu�ng L�u Th�yY", {0, 100, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 9},
        { "Chi�n Cu�ng Th�n Du Y", {0, 100, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 11},
        { "Chi�n Cu�ng Th�n Du Y", {0, 100, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 11},
        { "Chi�n Cu�ng Th�n Du Y", {0, 100, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 11},
        { "Chi�n Cu�ng Th�n Du Y", {0, 100, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 11},
        { "Chi�n Cu�ng Ti�u Dao Y", {0, 100, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 12},
        { "Chi�n Cu�ng Ti�u Dao Y", {0, 100, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 12},
        { "Chi�n Cu�ng Ti�u Dao Y", {0, 100, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 12},
        { "Chi�n Cu�ng Ti�u Dao Y", {0, 100, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 12},
        { "Chi�n Cu�ng V� Vi B�o", {0, 100, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 14},
        { "Chi�n Cu�ng V� Vi B�o", {0, 100, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 14},
        { "Chi�n Cu�ng V� Vi B�o", {0, 100, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 14},
        { "Chi�n Cu�ng V� Vi B�o", {0, 100, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 14},
        { "Chi�n Cu�ng C�n Kh�n B�o", {0, 100, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 15},
        { "Chi�n Cu�ng C�n Kh�n B�o", {0, 100, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 15},
        { "Chi�n Cu�ng C�n Kh�n B�o", {0, 100, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 15},
        { "Chi�n Cu�ng C�n Kh�n B�o", {0, 100, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 15},
        { "Chi�n Cu�ng Thi�n Tinh  Gi�p", {0, 100, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 17},
        { "Chi�n Cu�ng Thi�n Tinh  Gi�p", {0, 100, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 17},
        { "Chi�n Cu�ng Thi�n Tinh  Gi�p", {0, 100, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 17},
        { "Chi�n Cu�ng Thi�n Tinh  Gi�p", {0, 100, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 17},
        { "Chi�n Cu�ng Xuy�n V�n Gi�p", {0, 100, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 18},
        { "Chi�n Cu�ng Xuy�n V�n Gi�p", {0, 100, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 18},
        { "Chi�n Cu�ng Xuy�n V�n Gi�p", {0, 100, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 18},
        { "Chi�n Cu�ng Xuy�n V�n Gi�p", {0, 100, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 18},
        { "Chi�n Cu�ng Minh T�n Y", {0, 100, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 20},
        { "Chi�n Cu�ng Minh T�n Y", {0, 100, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 20},
        { "Chi�n Cu�ng Minh T�n Y", {0, 100, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 20},
        { "Chi�n Cu�ng Minh T�n Y", {0, 100, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 20},
        { "Chi�n Cu�ng C� T�m Y", {0, 100, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 21},
        { "Chi�n Cu�ng C� T�m Y", {0, 100, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 21},
        { "Chi�n Cu�ng C� T�m Y", {0, 100, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 21},
        { "Chi�n Cu�ng C� T�m Y", {0, 100, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 21},
        { "Chi�n Cu�ng Phong L�i B�o", {0, 100, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 23},
        { "Chi�n Cu�ng Phong L�i B�o", {0, 100, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 23},
        { "Chi�n Cu�ng ��i ��a Y", {0, 100, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 25},
        { "Chi�n Cu�ng ��i ��a Y", {0, 100, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 25},
        { "Chi�n Cu�ng ��i ��a Y", {0, 100, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 25},
        { "Chi�n Cu�ng ��i ��a Y", {0, 100, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 25},
        { "Chi�n Cu�ng T�y M�ng B�o", {0, 100, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 26},
        { "Chi�n Cu�ng T�y M�ng B�o", {0, 100, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 26},
        { "Chi�n Cu�ng T�y M�ng B�o", {0, 100, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 26},
        { "Chi�n Cu�ng T�y M�ng B�o", {0, 100, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 26},
        { "Chi�n Cu�ng Ma V�c  B�o", {0, 100, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 27},
        { "Chi�n Cu�ng Ma V�c  B�o", {0, 100, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 27},
        { "Chi�n Cu�ng Ma V�c  B�o", {0, 100, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 27},
        { "Chi�n Cu�ng Ma V�c  B�o", {0, 100, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 27},
        { "Chi�n Cu�ng Th�nh N�  Y", {0, 100, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 29},
        { "Chi�n Cu�ng Th�nh N�  Y", {0, 100, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 29},
        { "Chi�n Cu�ng Th�nh Linh Y", {0, 100, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 30},
        { "Chi�n Cu�ng Th�nh Linh Y", {0, 100, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 30},
	},
	tShoe = {
        { "Chi�n Cu�ng Thi�n ��a Trang", {0, 101, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 2},
        { "Chi�n Cu�ng Thi�n ��a Trang", {0, 101, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 2},
        { "Chi�n Cu�ng Thi�n T�n Trang", {0, 101, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 4},
        { "Chi�n Cu�ng Thi�n T�n Trang", {0, 101, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 4},
        { "Chi�n Cu�ng Ph� T� Trang", {0, 101, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 3},
        { "Chi�n Cu�ng Ph� T� Trang", {0, 101, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 3},
        { "Chi�n Cu�ng Tuy�t M�nh Trang", {0, 101, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 6},
        { "Chi�n Cu�ng Tuy�t M�nh Trang", {0, 101, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 6},
        { "Chi�n Cu�ng Tuy�t M�nh Trang", {0, 101, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 6},
        { "Chi�n Cu�ng Tuy�t M�nh Trang", {0, 101, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 6},
        { "Chi�n Cu�ng B� T�t Kh�", {0, 101, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 8},
        { "Chi�n Cu�ng B� T�t Kh�", {0, 101, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 8},
        { "Chi�n Cu�ng L�u Th�yKh�", {0, 101, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 9},
        { "Chi�n Cu�ng L�u Th�yKh�", {0, 101, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 9},
        { "Chi�n Cu�ng Th�n Du Trang", {0, 101, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 11},
        { "Chi�n Cu�ng Th�n Du Trang", {0, 101, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 11},
        { "Chi�n Cu�ng Th�n Du Trang", {0, 101, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 11},
        { "Chi�n Cu�ng Th�n Du Trang", {0, 101, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 11},
        { "Chi�n Cu�ng Ti�u Dao Trang", {0, 101, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 12},
        { "Chi�n Cu�ng Ti�u Dao Trang", {0, 101, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 12},
        { "Chi�n Cu�ng Ti�u Dao Trang", {0, 101, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 12},
        { "Chi�n Cu�ng Ti�u Dao Trang", {0, 101, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 12},
        { "Chi�n Cu�ng V� Vi Trang", {0, 101, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 14},
        { "Chi�n Cu�ng V� Vi Trang", {0, 101, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 14},
        { "Chi�n Cu�ng V� Vi Trang", {0, 101, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 14},
        { "Chi�n Cu�ng V� Vi Trang", {0, 101, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 14},
        { "Chi�n Cu�ng C�n Kh�n Trang", {0, 101, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 15},
        { "Chi�n Cu�ng C�n Kh�n Trang", {0, 101, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 15},
        { "Chi�n Cu�ng C�n Kh�n Trang", {0, 101, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 15},
        { "Chi�n Cu�ng C�n Kh�n Trang", {0, 101, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 15},
        { "Chi�n Cu�ng Thi�n Tinh  Trang", {0, 101, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 17},
        { "Chi�n Cu�ng Thi�n Tinh  Trang", {0, 101, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 17},
        { "Chi�n Cu�ng Thi�n Tinh  Trang", {0, 101, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 17},
        { "Chi�n Cu�ng Thi�n Tinh  Trang", {0, 101, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 17},
        { "Chi�n Cu�ng Xuy�n V�n Trang", {0, 101, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 18},
        { "Chi�n Cu�ng Xuy�n V�n Trang", {0, 101, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 18},
        { "Chi�n Cu�ng Xuy�n V�n Trang", {0, 101, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 18},
        { "Chi�n Cu�ng Xuy�n V�n Trang", {0, 101, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 18},
        { "Chi�n Cu�ng Minh T�n Trang", {0, 101, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 20},
        { "Chi�n Cu�ng Minh T�n Trang", {0, 101, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 20},
        { "Chi�n Cu�ng Minh T�n Trang", {0, 101, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 20},
        { "Chi�n Cu�ng Minh T�n Trang", {0, 101, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 20},
        { "Chi�n Cu�ng C� T�m Trang", {0, 101, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 21},
        { "Chi�n Cu�ng C� T�m Trang", {0, 101, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 21},
        { "Chi�n Cu�ng C� T�m Trang", {0, 101, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 21},
        { "Chi�n Cu�ng C� T�m Trang", {0, 101, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 21},
        { "Chi�n Cu�ng Phong L�i Trang", {0, 101, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 23},
        { "Chi�n Cu�ng Phong L�i Trang", {0, 101, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 23},
        { "Chi�n Cu�ng ��i ��a Trang", {0, 101, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 25},
        { "Chi�n Cu�ng ��i ��a Trang", {0, 101, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 25},
        { "Chi�n Cu�ng ��i ��a Trang", {0, 101, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 25},
        { "Chi�n Cu�ng ��i ��a Trang", {0, 101, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 25},
        { "Chi�n Cu�ng T�y M�ng Trang", {0, 101, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 26},
        { "Chi�n Cu�ng T�y M�ng Trang", {0, 101, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 26},
        { "Chi�n Cu�ng T�y M�ng Trang", {0, 101, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 26},
        { "Chi�n Cu�ng T�y M�ng Trang", {0, 101, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 26},
        { "Chi�n Cu�ng Ma V�c  Trang", {0, 101, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 27},
        { "Chi�n Cu�ng Ma V�c  Trang", {0, 101, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 27},
        { "Chi�n Cu�ng Ma V�c  Trang", {0, 101, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 27},
        { "Chi�n Cu�ng Ma V�c  Trang", {0, 101, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 27},
        { "Chi�n Cu�ng Th�nh N�  Kh�", {0, 101, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 29},
        { "Chi�n Cu�ng Th�nh N�  Kh�", {0, 101, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 29},
        { "Chi�n Cu�ng Th�nh Linh Kh�", {0, 101, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 30},
        { "Chi�n Cu�ng Th�nh Linh Kh�", {0, 101, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 30},
	},
	tWeapon = {
        { "Chi�n Cu�ng B�ng Thi�n �ao", {0, 3, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 2},
        { "Chi�n Cu�ng B�ng Thi�n �ao", {0, 3, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 2},
        { "Chi�n Cu�ng Thi�n ��nh Tr��ng", {0, 8, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 3},
        { "Chi�n Cu�ng Thi�n ��nh Tr��ng", {0, 8, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 3},
        { "Chi�n Cu�ng Th�nh Chi�n Th�", {0, 0, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 4},
        { "Chi�n Cu�ng Th�nh Chi�n Th�", {0, 0, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 4},
        { "Chi�n Cu�ng �o�t H�n Ch�m", {0, 1, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 6},
        { "Chi�n Cu�ng �o�t H�n Ch�m", {0, 1, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 6},
        { "Chi�n Cu�ng �o�t H�n Ch�m", {0, 1, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 6},
        { "Chi�n Cu�ng �o�t H�n Ch�m", {0, 1, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 6},
        { "Chi�n Cu�ng Ph�t Quang Ki�m", {0, 2, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 8},
        { "Chi�n Cu�ng Ph�t Quang Ki�m", {0, 2, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 8},
        { "Chi�n Cu�ng H� Bang C�m", {0, 10, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 9},
        { "Chi�n Cu�ng H� Bang C�m", {0, 10, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 9},
        { "Chi�n Cu�ng Tr�ng �c Th�", {0, 0, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 11},
        { "Chi�n Cu�ng Tr�ng �c Th�", {0, 0, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 11},
        { "Chi�n Cu�ng Tr�ng �c Th�", {0, 0, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 11},
        { "Chi�n Cu�ng Tr�ng �c Th�", {0, 0, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 11},
        { "Chi�n Cu�ng V� C�c C�n", {0, 5, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 12},
        { "Chi�n Cu�ng V� C�c C�n", {0, 5, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 12},
        { "Chi�n Cu�ng V� C�c C�n", {0, 5, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 12},
        { "Chi�n Cu�ng V� C�c C�n", {0, 5, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 12},
        { "Chi�n Cu�ng Khu Ma Ki�m", {0, 2, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 14},
        { "Chi�n Cu�ng Khu Ma Ki�m", {0, 2, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 14},
        { "Chi�n Cu�ng Khu Ma Ki�m", {0, 2, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 14},
        { "Chi�n Cu�ng Khu Ma Ki�m", {0, 2, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 14},
        { "Chi�n Cu�ng Th��ng Khung B�t", {0, 9, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 15},
        { "Chi�n Cu�ng Th��ng Khung B�t", {0, 9, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 15},
        { "Chi�n Cu�ng Th��ng Khung B�t", {0, 9, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 15},
        { "Chi�n Cu�ng Th��ng Khung B�t", {0, 9, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 15},
        { "Chi�n Cu�ng Th�n K�ch Th��ng", {0, 6, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 17},
        { "Chi�n Cu�ng Th�n K�ch Th��ng", {0, 6, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 17},
        { "Chi�n Cu�ng Th�n K�ch Th��ng", {0, 6, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 17},
        { "Chi�n Cu�ng Th�n K�ch Th��ng", {0, 6, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 17},
        { "Chi�n Cu�ng Xung Thi�n Cung", {0, 4, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 18},
        { "Chi�n Cu�ng Xung Thi�n Cung", {0, 4, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 18},
        { "Chi�n Cu�ng Xung Thi�n Cung", {0, 4, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 18},
        { "Chi�n Cu�ng Xung Thi�n Cung", {0, 4, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 18},
        { "Chi�n Cu�ng Luy�n Ng�c �ao", {0, 7, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 20},
        { "Chi�n Cu�ng Luy�n Ng�c �ao", {0, 7, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 20},
        { "Chi�n Cu�ng Luy�n Ng�c �ao", {0, 7, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 20},
        { "Chi�n Cu�ng Luy�n Ng�c �ao", {0, 7, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 20},
        { "Chi�n Cu�ng Nhi�p H�n Tr�o", {0, 11, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 21},
        { "Chi�n Cu�ng Nhi�p H�n Tr�o", {0, 11, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 21},
        { "Chi�n Cu�ng Nhi�p H�n Tr�o", {0, 11, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 21},
        { "Chi�n Cu�ng Nhi�p H�n Tr�o", {0, 11, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 21},
        { "Chi�n Cu�ng Thi�n Ph�t Ki�m", {0, 2, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 23},
        { "Chi�n Cu�ng Thi�n Ph�t Ki�m", {0, 2, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 23},
        { "Chi�n Cu�ng Ch�c Dung �ao", {0, 3, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 25},
        { "Chi�n Cu�ng Ch�c Dung �ao", {0, 3, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 25},
        { "Chi�n Cu�ng Ch�c Dung �ao", {0, 3, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 25},
        { "Chi�n Cu�ng Ch�c Dung �ao", {0, 3, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 25},
        { "Chi�n Cu�ng T� M�nh B�t", {0, 9, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 26},
        { "Chi�n Cu�ng T� M�nh B�t", {0, 9, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 26},
        { "Chi�n Cu�ng T� M�nh B�t", {0, 9, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 26},
        { "Chi�n Cu�ng T� M�nh B�t", {0, 9, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 26},
        { "Chi�n Cu�ng Truy H�n Tr�o", {0, 11, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 1, 27},
        { "Chi�n Cu�ng Truy H�n Tr�o", {0, 11, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 2, 27},
        { "Chi�n Cu�ng Truy H�n Tr�o", {0, 11, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 27},
        { "Chi�n Cu�ng Truy H�n Tr�o", {0, 11, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 27},
        { "Chi�n Cu�ng Phong Linh Phi�n", {0, 13, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 29},
        { "Chi�n Cu�ng Phong Linh Phi�n", {0, 13, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 29},
        { "Chi�n Cu�ng Kh�ng Minh ��ch", {0, 12, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 3, 30},
        { "Chi�n Cu�ng Kh�ng Minh ��ch", {0, 12, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9}, 4, 30},
	},
}
function _award_equip(tEquip)
	local nBodyType = GetBody()
	local nRoute = GetPlayerRoute()
	for i=1,getn(tEquip) do
		local t = tEquip[i]
		if nBodyType == t[3] and nRoute == t[4] then
			gf_AddItemEx2(t[2], t[1], "CDKEY", "CDKEY", 0, 1);
			return
		end
	end
end
function award_zhankuangku()
	return _award_equip(T_ZHANKUANG.tShoe)
end
function award_zhankuangyi()
	return _award_equip(T_ZHANKUANG.tCloth)
end
function award_zhankuangtou()
	return _award_equip(T_ZHANKUANG.tHead)
end
function award_zhankuangwuqi()
	return _award_equip(T_ZHANKUANG.tWeapon)
end
function award_fusheng2renwu() --��ɳ��︴��2����VNG���ܣ�
	Event_PhucSinhPET(); --Vet_Complete_Revive_OnePartner_FirstStage();
	Vet_Complete_Revive_OnePartner_SecondStage();
end
function award_guayi()
	_award_3jiantao(152)
end
function award_huizhang()
	_award_3jiantao(153)
end
function award_xie()
	_award_3jiantao(154)
end
function _award_3jiantao(nD)
	local nRandP = random(26,28)
	gf_AddItemEx2({0,nD,nRandP,1,4, -1, -1, -1, -1, -1, -1}, GetItemName(0, nD, nRandP), "CDKEY", "CDKEY", 0, 1);
end

function award_gem345()
	--Faction Cloth 9
	local VET_RandGem345 = {
		{1,25, "Huy�tTr�chTh�ch Lv3", {2,22,103,1},nil,nil,nil,nil},
		{1,25, "Nguy�tB�chTh�ch Lv3", {2,22,203,1},nil,nil,nil,nil},
		{1,25, "H� Ph�ch Th�ch C�p 3", {2,22,303,1},nil,nil,nil,nil},
		{1,25, "H�c Di�u Th�ch C�p 3", {2,22,403,1},nil,nil,nil,nil},
		{1,24, "Huy�tTr�chTh�ch Lv4", {2,22,104,1},nil,nil,nil,nil},
		{1,24, "Nguy�tB�chTh�ch Lv4", {2,22,204,1},nil,nil,nil,nil},
		{1,24, "H� Ph�ch Th�ch C�p 4", {2,22,304,1},nil,nil,nil,nil},
		{1,24, "H�c Di�u Th�ch C�p 4", {2,22,404,1},nil,nil,nil,nil},
		{1,1, "Huy�tTr�chTh�ch Lv5", {2,22,105,1},nil,nil,nil,1},
		{1,1, "Nguy�tB�chTh�ch Lv5", {2,22,205,1},nil,nil,nil,1},
		{1,1, "H� Ph�ch Th�ch C�p 5", {2,22,305,1},nil,nil,nil,1},
		{1,1, "H�c Di�u Th�ch C�p 5", {2,22,405,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem345,200,1, "CDKEY", "CDKEY")
end
function award_gem345_2()
	award_gem345()
	award_gem345()
end
function award_gem345_3()
	award_gem345()
	award_gem345()
	award_gem345()
end
function award_gem345_5()
	award_gem345()
	award_gem345()
	award_gem345()
	award_gem345()
	award_gem345()
end
function award_title()
	AddTitle(68, 4);
	SetTitleTime(68, 4, GetTime() + 60 * 24 * 3600);
	Msg2Player(format("Nh�n ���c danh hi�u [%s]", "Nhi�m V� ��t Nh�n"))
end

function award_tong_title3()
	SendScript2VM("\\script\\isolate\\functions\\tong_title\\tong_title.lua", format("force_give_max_lv(%d)", 3))
	Msg2Player(format("Nh�n ���c danh hi�u [%s]", "Kim Lan"))
end

function award_random_gem1_1()
	local VET_RandGem = {
    {1,25, "Huy�tTr�chTh�ch Lv1", {2,22,101,10,4},nil,nil,nil,nil},
    {1,25, "Nguy�tB�chTh�ch Lv1", {2,22,201,10,4},nil,nil,nil,nil},
    {1,25, "H� Ph�ch Th�ch C�p 1", {2,22,301,10,4},nil,nil,nil,nil},
    {1,25, "H�c Di�u Th�ch C�p 1", {2,22,401,10,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_gem1_2()
	local VET_RandGem = {
    {1,25, "Huy�tTr�chTh�ch Lv1", {2,22,101,20,4},nil,nil,nil,nil},
    {1,25, "Nguy�tB�chTh�ch Lv1", {2,22,201,20,4},nil,nil,nil,nil},
    {1,25, "H� Ph�ch Th�ch C�p 1", {2,22,301,20,4},nil,nil,nil,nil},
    {1,25, "H�c Di�u Th�ch C�p 1", {2,22,401,20,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_gem2_1()
	local VET_RandGem = {
    {1,25, "Huy�tTr�chTh�ch Lv2", {2,22,102,8,4},nil,nil,nil,nil},
    {1,25, "Nguy�tB�chTh�ch Lv2", {2,22,202,8,4},nil,nil,nil,nil},
    {1,25, "H� Ph�ch Th�ch C�p 2", {2,22,302,8,4},nil,nil,nil,nil},
    {1,25, "H�c Di�u Th�ch C�p 2", {2,22,402,8,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_gem2_2()
	local VET_RandGem = {
    {1,25, "Huy�tTr�chTh�ch Lv2", {2,22,102,12,4},nil,nil,nil,nil},
    {1,25, "Nguy�tB�chTh�ch Lv2", {2,22,202,12,4},nil,nil,nil,nil},
    {1,25, "H� Ph�ch Th�ch C�p 2", {2,22,302,12,4},nil,nil,nil,nil},
    {1,25, "H�c Di�u Th�ch C�p 2", {2,22,402,12,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_gem3_4()
	local VET_RandGem = {
    {1,25, "Huy�tTr�chTh�ch Lv3", {2,22,103,4,4},nil,nil,nil,nil},
    {1,25, "Nguy�tB�chTh�ch Lv3", {2,22,203,4,4},nil,nil,nil,nil},
    {1,25, "H� Ph�ch Th�ch C�p 3", {2,22,303,4,4},nil,nil,nil,nil},
    {1,25, "H�c Di�u Th�ch C�p 3", {2,22,403,4,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_gem3_5()
	local VET_RandGem = {
    {1,25, "Huy�tTr�chTh�ch Lv3", {2,22,103,5,4},nil,nil,nil,nil},
    {1,25, "Nguy�tB�chTh�ch Lv3", {2,22,203,5,4},nil,nil,nil,nil},
    {1,25, "H� Ph�ch Th�ch C�p 3", {2,22,303,5,4},nil,nil,nil,nil},
    {1,25, "H�c Di�u Th�ch C�p 3", {2,22,403,5,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_gem3_7()
	local VET_RandGem = {
    {1,25, "Huy�tTr�chTh�ch Lv3", {2,22,103,7,4},nil,nil,nil,nil},
    {1,25, "Nguy�tB�chTh�ch Lv3", {2,22,203,7,4},nil,nil,nil,nil},
    {1,25, "H� Ph�ch Th�ch C�p 3", {2,22,303,7,4},nil,nil,nil,nil},
    {1,25, "H�c Di�u Th�ch C�p 3", {2,22,403,7,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_gem3_9()
	local VET_RandGem = {
    {1,25, "Huy�tTr�chTh�ch Lv3", {2,22,103,9,4},nil,nil,nil,nil},
    {1,25, "Nguy�tB�chTh�ch Lv3", {2,22,203,9,4},nil,nil,nil,nil},
    {1,25, "H� Ph�ch Th�ch C�p 3", {2,22,303,9,4},nil,nil,nil,nil},
    {1,25, "H�c Di�u Th�ch C�p 3", {2,22,403,9,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_gem4_3()
	local VET_RandGem = {
    {1,25, "Huy�tTr�chTh�ch Lv4", {2,22,104,3,4},nil,nil,nil,nil},
    {1,25, "Nguy�tB�chTh�ch Lv4", {2,22,204,3,4},nil,nil,nil,nil},
    {1,25, "H� Ph�ch Th�ch C�p 4", {2,22,304,3,4},nil,nil,nil,nil},
    {1,25, "H�c Di�u Th�ch C�p 4", {2,22,404,3,4},nil,nil,nil,nil},
	} 
	gf_EventGiveRandAward(VET_RandGem,100,1, "CDKEY", "CDKEY")
end

function award_random_4pet()
	local tPet = {
		{16, 4500},
		{17, 4500},
		{18, 990},
		{19, 3},
		{20, 3},
		{21, 2},
		{22, 1},
		{23, 2},
	}
	local nID = gf_GetRandItemByTable(tPet, 10000, 1)
	AddPet(tPet[nID][1]);
	Msg2Player(GetPetName(tPet[nID][1]));
end

function award_tongscore(nScore)
	SendScript2VM("\\script\\isolate\\functions\\tong_title\\head.lua", format("add_tong_gxd(%d)", nScore))
end

CK_SCROE_AWARD_TABLE = {
	[1] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{900, 5000000, 100, 100, 1000, 10000},
		--{"select","Ӣ��ѫ��", {2,1,30499,4}},
		--{"item", "Ӣ��ѫ��", {2,1,30499,4}},
		{"func", "�� th�ng c�nh gi�i V� Hi�n", award_wuzhe},
	},
	[2] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{1000, 8000000, 160, 160, 1400, 0},
		{"item", "Ma Tinh", {2,1,30497,500,4}},
		{"func", "Chuy�n sinh 5 c�p 90", award_5zhuan90},
	},
	[3] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{1300, 12000000, 220, 220, 1800, 20000},
		{"func", "�� th�ng c�nh gi�i V� T��ng", award_wujiang},
	},
	[4] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{1700, 15000000, 280, 280, 2200, 0},
		{"item", "Ma Tinh", {2,1,30497,500,4}},
		{"item", "L�ng Ba Vi B�", {0,112,78,1}},
	},
	[5] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{2000, 20000000, 340, 340, 2600, 30000},
		{"func", "�� th�ng c�nh gi�i V� V��ng", award_wuwang},
	},
	[6] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{2400, 25000000, 400, 400, 3000, 0},
		{"item", "Ma Tinh", {2,1,30497,500,4}},
	},
	[7] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{2800, 28000000, 460, 460, 3400, 30000},
		{"func", "B�o Th�ch c�p 1*10", award_random_gem1_1},
	},
	[8] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{3100, 30000000, 520, 520, 3800, 0},
		{"func", "�� qu� c�p 1*20", award_random_gem1_2},
		{"func", "U�n Linh C�p 4", award_yunling4},
	},
	[9] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{3500, 32000000, 580, 580, 4200, 0},
		{"func", "�� qu� c�p 2*8", award_random_gem2_1},
	},
	[10] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{4000, 34000000, 580, 580, 4200, 0},
		{"func", "Non chi�n cu�ng+9", award_zhankuangtou},
		{"func", "�i�m c�ng hi�n bang", award_tongscore,{100}},
	},
	[11] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{5000, 36000000, 580, 580, 4200, 0},
		{"func", "�o chi�n cu�ng+9", award_zhankuangyi},
		{"func", "�� qu� c�p 2 *12", award_random_gem2_2},
		{"func", "�i�m c�ng hi�n bang", award_tongscore,{200}},
	},
	[12] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{6000, 38000000, 580, 580, 4200, 0},
		{"func", "Qu�n chi�n cu�ng+9", award_zhankuangku},
		{"func", "�i�m c�ng hi�n bang", award_tongscore,{300}},
	},
	[13] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{7000, 40000000, 580, 580, 4200, 0},
		{"item", "Hi�p Ngh�a Chi Ch�ng", {2, 1, 30912, 400, 4}},
		{"item", "Linh �� Gi�i (tr�i)", {0, 102, 30221, 1, 4}},
		{"item", "Linh �� Gi�i (ph�i)", {0, 102, 30222, 1, 4}},
		{"func", "U�n Linh C�p 5", award_yunling5},
--		{"select", "�ϳɲ��ϣ�3ѡ1��",
--			{
--				{"item", "ħ��Ƥ", {2, 1, 30672, 50, 4}},
--				{"item", "����Ƥ", {2, 1, 30673, 50, 4}},
--				{"item", "����˿", {2, 1, 30671, 50, 4}},
--			},
--		},
	},
	[14] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{8500, 42000000, 580, 580, 4200, 0},
		{"func", "V� kh� chi�n cu�ng+9", award_zhankuangwuqi},
--		{"item", "1���������", {0, 155, 1, 1}},
		{"select", "Th� c��i B�o B�o(3 ch�n 1)",
			{
				{"item", "B�o �en B�o B�o", {0, 105, 30029, 1, 4,-1,-1,-1,-1,-1,-1,-1},15*24*3600},
				{"item", "B�o V�ng B�o B�o", {0, 105, 30030, 1, 4,-1,-1,-1,-1,-1,-1,-1},15*24*3600},
				{"item", "Kim Mao Ng�u B�o B�o", {0, 105, 30022, 1, 4,-1,-1,-1,-1,-1,-1,-1},15*24*3600},
			},
		},
		--{"func", "Danh hi�u bang h�i c�p 3", award_tong_title3},
		{"item", "��ng T� Chi Nguy�n", {2,1,30913,21,4}},
	},
	[15] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{9500, 44000000, 580, 580, 4200, 0},
		{"func", "6 chuy�n 90 c�p", award_6zhuan90},
		{"item", "Tinh Hoa U�n Linh C�p 6", {2,1,30668,4, 4}},
		{"item", "Hi�p Ngh�a Chi Ch�ng", {2, 1, 30912, 400, 4}},
--		{"select", "�ϳɲ��ϣ�3ѡ1��",
--			{
--				{"item", "ħ��Ƥ", {2, 1, 30672, 100, 4}},
--				{"item", "����Ƥ", {2, 1, 30673, 100, 4}},
--				{"item", "����˿", {2, 1, 30671, 100, 4}},
--			},
--		},
	},
	[16] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{11000, 46000000, 580, 580, 4200, 0},
		{"func", "�� qu� c�p 3*5", award_random_gem3_5},
		{"item", "Tinh Hoa U�n Linh C�p 6", {2,1,30668,6,4}},
		{"item", "Tr�ng Linh Th�-Cao", {2,1,30728,1,4}},
		{"func", "�i�m c�ng hi�n bang", award_tongscore,{300}},
		{"item", "T�n V�t c�p 3", {0,155,3,1,4}},
		{"select", "Trang b� H�o hi�p(3 ch�n 1)",
			{
				{"item", "H�o Hi�p ��u", {0, 103, 30568, 1, 4}},
				{"item", "H�o Hi�p y", {0, 100, 30568, 1, 4}},
				{"item", "H�o Hi�p Trang", {0, 101, 30568, 1, 4}},
			},
		},
	},
	[17] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{15000, 48000000, 580, 580, 4200, 0},
		{"func", "�� qu� c�p 3*7", award_random_gem3_7},
		{"item", "Tinh Hoa U�n Linh C�p 6", {2,1,30668,8,4}},
		{"item", "��ng T� Chi Nguy�n", {2,1,30913,42,4}},
--		{"select", "�ϳɲ��ϣ�3ѡ1��",
--			{
--				{"item", "ħ��Ƥ", {2, 1, 30672, 150, 4}},
--				{"item", "����Ƥ", {2, 1, 30673, 150, 4}},
--				{"item", "����˿", {2, 1, 30671, 150, 4}},
--			},
--		},
	},
	[18] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{16000, 50000000, 580, 580, 4200, 0},
		{"func", "�� qu� c�p 3*9", award_random_gem3_9},
		--{"func", "�������", award_guayi},
		{"item", "Thi�t tinh c�p 4", {2, 1, 30612, 10, 4}},
		{"func", "�i�m c�ng hi�n bang", award_tongscore,{400}},
		{"select", "V�n Du, Thi�t Huy�t, �o kho�c Du Hi�p(ch�n 1 trong 3)",
			{
				{"item", "�o Cho�ng V�n Du", {0, 152, 28, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
				{"item", "�o Cho�ng Thi�t Huy�t", {0, 152, 27, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
				{"item", "�o Cho�ng Du Hi�p", {0, 152, 26, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
			},
		},
--		{"select", "�ϳɲ��ϣ�3ѡ1��",
--			{
--				{"item", "ħ��Ƥ", {2, 1, 30672, 170, 4}},
--				{"item", "����Ƥ", {2, 1, 30673, 170, 4}},
--				{"item", "����˿", {2, 1, 30671, 170, 4}},
--			},
--		},
	},
	[19] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{17000, 60000000, 580, 580, 4200, 0},
		{"func", "�� qu� c�p 4*3", award_random_gem4_3},
		--{"func", "�������", award_huizhang},
		{"item", "Thi�t tinh c�p 4", {2, 1, 30612, 20, 4}},
		{"func", "�i�m c�ng hi�n bang", award_tongscore,{500}},
		{"select", "V�n Du, Thi�t Huy�t, Huy ch��ng Du Hi�p(ch�n 1 trong 3)",
			{
				{"item", "Huy Ch��ng V�n Du", {0, 153, 28, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
				{"item", "Huy Ch��ng Thi�t Huy�t", {0, 153, 27, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
				{"item", "Huy Ch��ng Du Hi�p", {0, 153, 26, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
			},
		},
--		{"select", "�ϳɲ��ϣ�3ѡ1��",
--			{
--				{"item", "ħ��Ƥ", {2, 1, 30672, 180, 4}},
--				{"item", "����Ƥ", {2, 1, 30673, 180, 4}},
--				{"item", "����˿", {2, 1, 30671, 180, 4}},
--			},
--		},
	},
	[20] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{20000, 80000000, 580, 580, 4200, 0},
		{"func", "�� Qu� C�p 3-5 (Ng�u nhi�n)", award_gem345_2},
		--{"func", "�������", award_xie},
		{"item", "Thi�t tinh c�p 4", {2, 1, 30612, 30, 4}},
		{"func", "�i�m c�ng hi�n bang", award_tongscore,{600}},
		{"select", "V�n Du, Thi�t Huy�t, Gi�y Du Hi�p(ch�n 1 trong 3)",
			{
				{"item", "��o H�i V�n Du", {0, 154, 28, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
				{"item", "Chi�n H�i Thi�t Huy�t", {0, 154, 27, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
				{"item", "Chi�n H�i Du Hi�p", {0, 154, 26, 1, 4,-1,-1,-1,-1,-1,-1,-1,7}},
			},
		},
--		{"select", "�ϳɲ��ϣ�3ѡ1��",
--			{
--				{"item", "ħ��Ƥ", {2, 1, 30672, 200, 4}},
--				{"item", "����Ƥ", {2, 1, 30673, 200, 4}},
--				{"item", "����˿", {2, 1, 30671, 200, 4}},
--			},
--		},
	},
	[21] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{22000, 150000000, 580, 580, 4200, 0},
		{"func", "Chuy�n sinh 7 c�p 73", award_7zhuan73},
		{"func", "�� Qu� C�p 3-5 (Ng�u nhi�n)", award_gem345_3},
		{"item", "Ph�c Sinh ��n", {2, 1, 30814, 1, 4}},
		{"select", "Trang b� H�o hi�p(3 ch�n 1)",
			{
				{"item", "H�o Hi�p ��u", {0, 103, 30568, 1, 4}},
				{"item", "H�o Hi�p y", {0, 100, 30568, 1, 4}},
				{"item", "H�o Hi�p Trang", {0, 101, 30568, 1, 4}},
			},
		},
	},
	[22] = {
		--score, EXP ����ֵ ʦ��ֵ ����ֵ ����
		{24000, 250000000, 580, 580, 4200, 0},
		{"item", "Hi�p Ngh�a Chi Ch�ng", {2, 1, 30912, 400, 4}},
		{"func", "�� th�ng c�nh gi�i V� T�n", award_wuzun},
		{"func", "�� Qu� C�p 3-5 (Ng�u nhi�n)", award_gem345_5},
--		{"item", "4������", {2, 1, 30612, 30, 4}},
		{"item", "Tinh Hoa U�n Linh C�p 6", {2,1,30668,12,4}},
		{"func", "�i�m c�ng hi�n bang", award_tongscore,{600}},
--		{"item", "�����", {2, 1, 1001, 1, 4}},
		{"func", "Danh hi�u Nhi�m V� ��t Nh�n", award_title},
		{"select", "Trang b� H�o hi�p(3 ch�n 1)",
			{
				{"item", "H�o Hi�p ��u", {0, 103, 30568, 1, 4}},
				{"item", "H�o Hi�p y", {0, 100, 30568, 1, 4}},
				{"item", "H�o Hi�p Trang", {0, 101, 30568, 1, 4}},
			},
		},
	},
}
function ck_view_score_award(nType)
	local tSay = {
		format("\n Nh�n ph�n th��ng/#ck_get_score_award(%d)", nType),
		"\nT�i ch� xem xem th�i/nothing",
	}
	local tAward = CK_SCROE_AWARD_TABLE[nType]
	local tBase = tAward[1]
	local szMsg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", tBase[2], tBase[3], tBase[4], tBase[5], tBase[6])
	for i = 2,getn(tAward) do
		if tAward[i][1] == "item" then
			szMsg = format("%s,%s*%d", szMsg, tAward[i][2], tAward[i][3][4]);
		else
			szMsg = format("%s,%s", szMsg, tAward[i][2])
		end
	end
	Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", szMsg), getn(tSay), tSay);
	return 0;
end
function ck_get_score_award(nType)
	tSelect = tSelect or {}
	local tAward = CK_SCROE_AWARD_TABLE[nType]
	if gf_Judge_Room_Weight(5, 100, " ") ~= 1 then
		return 0;
	end
	local nCurScore = ck_GetCkScore()
	local nNeedScore = tAward[1][1]
	if nCurScore < nNeedScore then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", nNeedScore), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, nType) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if gf_CheckBaseCondition(73) ~= 1 then
		return 0;
	end
	for i = 1, getn(tAward) do
		local t = tAward[i];
		if "select" == t[1] then
			ck_get_score_award_select(nType, i);
			return
		end
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, nType, 1)
	for i= 1,getn(tAward) do
		local t = tAward[i]
		if type(t[1]) == "number" then
			gf_Modify("Exp", t[2])
			gf_Modify("Rep", t[3])
			gf_Modify("ShiMen", t[4])
			gf_Modify("JunGong", t[5])
			if t[6] > 0 then
				gf_Modify("ZhenQi", t[6])
			end
		elseif "func" == t[1] then
			t[3](unpack(t[4] or {}))
			if t[3] == award_tongscore then
				Msg2Player(format("B�n nh�n ���c %d �i�m �� c�ng hi�n bang h�i", t[4][1]))
			end
		elseif "item" == t[1] then
			gf_AddItemEx2(t[3], t[2], "CDKEY", "Ph�n th��ng �i�m t�ch l�y", (t[4] or 0), 1);
		end		
	end
end

function ck_get_score_award_select(nType, i, j)
	local tAward = CK_SCROE_AWARD_TABLE[nType][i];
	if tAward[1] == "select" then
		if not j then
			local tDialog = {}
		  local szTitle = format("%s: H�y ch�n %s", CK_NPC_NAME, tAward[2])
		  local tSel = tAward[3]
		  for k = 1, getn(tSel) do
		  	if tSel[k][1] == "item" then
		  		tinsert(tDialog, format("%s*%d/#ck_get_score_award_select(%d, %d, %d)", tSel[k][2], tSel[k][3][4], nType, i, k));
		  	else
		  		tinsert(tDialog, format("%s/#ck_get_score_award_select(%d, %d, %d)", tSel[k][2], nType, i, k));
		  	end
		  end
		  tinsert(tDialog, "\nT�i ch� xem xem th�i/ck_get_score_award_select_cancle")
		  Say(szTitle, getn(tDialog), tDialog)
			return 0;
		end
		if not g_RecordIndex then g_RecordIndex = {} end
		if not g_RecordIndex[PlayerIndex] then g_RecordIndex[PlayerIndex] = {} end
		g_RecordIndex[PlayerIndex][i] = j;
	end
	local tNext = CK_SCROE_AWARD_TABLE[nType][i+1];
	if tNext then
		ck_get_score_award_select(nType, i+1);
	else
		ck_get_score_award_select_final(nType);
	end
end

function ck_get_score_award_select_cancle()
	if g_RecordIndex then
		g_RecordIndex[PlayerIndex] = nil
	end
end

function ck_get_score_award_select_final(nType)
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, nType, 1)
	local tAward = CK_SCROE_AWARD_TABLE[nType]
	for i= 1,getn(tAward) do
		local t = tAward[i]
		if type(t[1]) == "number" then
			gf_Modify("Exp", t[2])
			gf_Modify("Rep", t[3])
			gf_Modify("ShiMen", t[4])
			gf_Modify("JunGong", t[5])
			if t[6] > 0 then
				gf_Modify("ZhenQi", t[6])
			end
		elseif "func" == t[1] then
			t[3](unpack(t[4] or {}))
		elseif "item" == t[1] then
			gf_AddItemEx2(t[3], t[2], "CDKEY", "Ph�n th��ng �i�m t�ch l�y", (t[4] or 0), 1);
		elseif "select" == t[1] then
			local Index = g_RecordIndex[PlayerIndex][i];
			local tItem = t[3][Index];
			if "item" == tItem[1] then
				gf_AddItemEx2(tItem[3], tItem[2], "CDKEY", "Ph�n th��ng �i�m t�ch l�y", (tItem[4] or 0), 1);
			elseif "func" == tItem[1] then
				tItem[3]()
			end	
		end
	end
	g_RecordIndex[PlayerIndex] = nil;
end