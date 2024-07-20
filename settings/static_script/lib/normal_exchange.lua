--ͨ�öһ�������
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

--��׼�Ľ����һ���ʽ
gtNormalExchange = {
	tConsume = {--������
		--{name,g,d,p,n}
--		{"�Ի;�����",2,1,9977,1},
--		{"��",-1, 0, 0, 100},
	},
	tAward = {--����
--		{name,g,d,p,n,bind,expiredays}
--		{"��ҫ������",2,1,30642,1,7},
	},
	nRate = 0,
	tAward2 = {},--ʧ�ܵĽ���
	tRoomWeight = {1,100},
	nBatchExchange = 100, --һ�����һ����ٸ� 
}

--�һ��ɹ��ص��������ɾ����ҵ��ȥʵ��
--function gtNormalExchange:do_exchange_callback()
--end

tNpcTalkTemp = {}--npc talk�����洢award index��

function gtNormalExchange:new()
	local t=gf_Inherit(self)
	return t
end

function gtNormalExchange:npc_talk_main(szNpcName,nTempIndex)
	nTempIndex = nTempIndex or 1
	tNpcTalkTemp[nTempIndex] = self--�Ȱ�self�����������������Ļص��ᱨ���
	
	local szConsume = self:get_consume_desc()
	local szAward = self:get_award_desc()
	local szMsg = ""
	if szConsume ~= "" then
		szMsg = format("��i [%s] c�n ti�u hao [%s], ��ng � kh�ng??", szAward, szConsume)
	else
		szMsg = format("��ng � ��i [%s] kh�ng??", szAward)
	end
	local szTitle = format("%s:%s", szNpcName, szMsg)
	local tbSay = {}
	tinsert(tbSay, format("%s/#npc_talk_ask_num(%d)", "X�c ��nh ��i", nTempIndex))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	Say(szTitle, getn(tbSay), tbSay)
end

function gtNormalExchange:get_consume_desc()
	return get_list_content(self.tConsume)
end

function gtNormalExchange:get_award_desc()
	local szAward = get_list_content(self.tAward)
	if self.nRate > 0 then
		local szAward2 = get_list_content(self.tAward2)
		szAward = format("C� x�c xu�t nh�t ��nh th�nh c�ng nh�n ���c {%s}", szAward)
		if szAward2 and szAward2~= "" then
			szAward = format("%s n�u kh�ng s� nh�n ���c {%s}", szAward, szAward2)
		end
	end
	return szAward
end

function gtNormalExchange:get_max_exchange_cnt()
	local tConsume = self.tConsume
	local nMaxExchangeCnt = 100
	for i = 1, getn(tConsume) do
		local nCurMax = 0
		local ti = tConsume[i]
		if ti[2] >= 0 then
			nCurMax = floor(GetItemCount(ti[2], ti[3], ti[4]) / ti[5])
		elseif ti[2] == -1 then
			nCurMax = floor(GetCash() / (ti[5]*10000))
		else
			error(format("unsupport consume %d", ti[2]))
		end
		nMaxExchangeCnt = min(nMaxExchangeCnt, nCurMax)
	end
	nMaxExchangeCnt = min(nMaxExchangeCnt, self.nBatchExchange or 100)--���һ�λ�100��
	return nMaxExchangeCnt
end

function gtNormalExchange:do_exchange(bDelete, bNotify)
	if gf_Judge_Room_Weight(self.tRoomWeight[1], self.tRoomWeight[2], "") ~= 1 then
		return 0
	end

	if check_and_consume_list(self.tConsume, bDelete, bNotify) ~= 1 then
		return 0
	end

	if 1 == bDelete then --���ж����ͨ���ˣ�ִ��ɾ��
		local tAward = self.tAward
		local nAwardType = 1
		if self.nRate > 0 and random(1,100) > self.nRate then --���ʧ�� ���ڶ��׽���
			tAward = self.tAward2
			nAwardType = 2
		end
		check_award_by_list(tAward, 1)
		award_by_list(tAward, bDelete, bNotify)
		if self.do_exchange_callback then--�һ��ɹ��ص�
			self:do_exchange_callback(nAwardType)
		end
	end
	return 1
end

function npc_talk_ask_num(nTempIndex)
	local t = tNpcTalkTemp[nTempIndex]
	if t.nBatchExchange > 1 then
		local nMax = t:get_max_exchange_cnt()
    	if nMax > 0 then
    		local szFunc = format("npc_talk_ask_num_cb_%d", nTempIndex)
    		AskClientForNumber(szFunc, 1, nMax, "H�y nh�p s� l��ng v�o")
    	else
    		Talk(1, "", "Kh�ng ��i ���c g� c�.")	
    	end
	else
		_npc_talk_ask_num_cb(nTempIndex, 1)
	end
	
end

function npc_talk_ask_num_cb_1(nNum) return _npc_talk_ask_num_cb(1, nNum) end
function npc_talk_ask_num_cb_2(nNum) return _npc_talk_ask_num_cb(2, nNum) end
function npc_talk_ask_num_cb_3(nNum) return _npc_talk_ask_num_cb(3, nNum) end
function npc_talk_ask_num_cb_4(nNum) return _npc_talk_ask_num_cb(4, nNum) end
function npc_talk_ask_num_cb_5(nNum) return _npc_talk_ask_num_cb(5, nNum) end
function npc_talk_ask_num_cb_6(nNum) return _npc_talk_ask_num_cb(6, nNum) end
function npc_talk_ask_num_cb_7(nNum) return _npc_talk_ask_num_cb(7, nNum) end
function npc_talk_ask_num_cb_8(nNum) return _npc_talk_ask_num_cb(8, nNum) end
function npc_talk_ask_num_cb_9(nNum) return _npc_talk_ask_num_cb(9, nNum) end
function npc_talk_ask_num_cb_10(nNum) return _npc_talk_ask_num_cb(10, nNum) end
function _npc_talk_ask_num_cb(nTempIndex,nNum)
	if nNum <= 0 then
		return
	end
	local t = tNpcTalkTemp[nTempIndex]
	for i=1,nNum do
		if 1 ~= t:do_exchange(1,1) then
			break
		end
	end
end

function _get_expire_days(tItem)
	local szMsg = ""
	if tItem and tItem[7] then
		szMsg = format("(Hi�u l�c %d ng�y)", tItem[7])
	end
	return szMsg
end

--gtListCfg = {
--	--
--	[-1] = {"����", GetCash, Pay, Earn, 10000},
--	[-2] = {"��Ϊ", nil, nil, ModifyPopur},
--	[-3] = {"����", nil, nil, ModifyExp},
--	[-4] = {"����", nil, nil, AwardGenuineQi},
--}

function check_and_consume_list(tConsume, bDelete, bNotify)
	for i = 1, getn(tConsume) do
    	local ti = tConsume[i]
    	if ti[2] >= 0 then
        	if GetItemCount(ti[2], ti[3], ti[4]) < ti[5] then
        		if 1 == bNotify then
        			Talk(1,"",format("%sx%d kh�ng ��", ti[1], ti[5]))
        		end
        		return 0
        	end
    	elseif ti[2] == -1 then
    		if GetCash() < ti[5]*10000 then
    			if 1 == bNotify then
        			Talk(1,"",format("Kh�ng c� %d%s",  ti[5], ti[1]))
        		end
        		return 0
    		end
    	else
    		error(format("unsupport consume %d", ti[2]))
    	end
	end
	if 1 == bDelete then --���ж����ͨ���ˣ�ִ��ɾ��
		for i = 1, getn(tConsume) do
            local ti = tConsume[i]
        	if ti[2] >= 0 then
        		local nDelResult = DelItem(ti[2], ti[3], ti[4], ti[5])
        		if not nDelResult or nDelResult ~= 1  then
        			return 0
        		end
        	elseif ti[2] == -1 then
        		if 1 ~= Pay(ti[5]*10000) then
        			return 0
        		end
        	else
        		error(format("unsupport consume %d", ti[2]))
        	end
    	end
    end
	return 1
end

function check_award_by_list(tAward, bNotify)
	local ret = 1
	local szMsg = ""
	for i = 1, getn(tAward) do
		local ti = tAward[i]
		if ti[2] == -3 then--����
			if CanModifyExp(ti[5]) ~= 1 then
				local msg = format("Hi�n t�i kh�ng th� nh�n %d EXP", ti[5])
				szMsg = format("%s\n%s", szMsg, msg)
				ret = 0;
			end
		elseif ti[2] == -4 then--����
			if MeridianGetLevel() < 1 or MeridianGetLeftGenuineQiCapcity() < ti[5] then
				local msg = format("Hi�n t�i kh�ng th� nh�n %d ch�n kh�", ti[5])
				szMsg = format("%s\n%s", szMsg, msg)
				ret = 0;
			end
		end
	end
	if 1 == bNotify and ret ~= 1 then
		Msg2Player(szMsg)
	end
	return ret,szMsg
end

function award_by_list(tAward, bDelete, bNotify, nTaskId, nBitIdx)
	if 1 ~= bDelete then
		return 0
	end
	
	for i = 1, getn(tAward) do
        local ti = tAward[i]
        if type(ti[2]) == "function" then --����
        	local tPara = {}
        	local t = ti[3]
        	for i = 1,getn(t) do
        		tPara[i] = t[i]
        	end
        	tPara[getn(tPara)+1] = nTaskId
        	tPara[getn(tPara)+1] = nBitIdx
        	ti[2](unpack(tPara))
        elseif ti[2] >= 0 then
        	local nBind = 100 * (ti[7] or 0) * 24 * 3600 + (ti[6] or 1)
			local nResult,nIndex = AddItem(ti[2], ti[3], ti[4], ti[5], nBind)
			local szMsg2Player = format("B�n �� nh�n ���c %d %s", ti[5], ti[1])
    		Msg2Player(szMsg2Player)
		elseif ti[2] == -1 then--����
			Earn(ti[5]*10000)
    		local szMsg2Player = format("Nh�n ���c %d V�ng", ti[5])
    		Msg2Player(szMsg2Player)
		elseif ti[2] == -2 then--��Ϊ
			ModifyPopur(ti[5])
    		szMsg2Player = format("C�c h� �� nh�n ���c %d �i�m tu luy�n", ti[5])
    		Msg2Player(szMsg2Player)
    	elseif ti[2] == -3 then--����
			local r = ModifyExp(ti[5])
			if r == 1 then
				local szMsg2Player = format("Thu ���c %d �i�m kinh nghi�m", ti[5])
    			Msg2Player(szMsg2Player)
			end
    	elseif ti[2] == -4 then--����
			AwardGenuineQi(ti[5])
			--szMsg2Player = format("������%d������", ti[5])
    		--Msg2Player(szMsg2Player)
    	elseif ti[2] == -5 then--����
			ModifyReputation(ti[5], 0)
    		local szMsg2Player = format("Thu ���c %d �i�m danh v�ng", ti[5])
    		Msg2Player(szMsg2Player)
    	elseif ti[2] == -6 then--ʦ�Ź��׶�
    		SetTask(336, GetTask(336) + ti[5])
    		local szMsg2Player = format("Thu ���c %d �i�m c�ng hi�n s� m�n", ti[5])
    		Msg2Player(szMsg2Player)
    	elseif ti[2] == -7 then--����
    		if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + ti[5]);
			else
				SetTask(701, GetTask(701) - ti[5]);
			end
    		local szMsg2Player = format("C�c h� nh�n ���c %d �i�m qu�n c�ng", ti[5])
    		Msg2Player(szMsg2Player)
		else
			return error(format("unsupport award %d", ti[2]))
        end
	end
	return 1
end

function get_list_content(tItems)
	local szDesc = ""
	if tItems and getn(tItems) >= 1 then
    	szDesc = _get_elem_desc(tItems[1])
    	for i = 2, getn(tItems) do
    		szDesc = format("%s, %s", szDesc, _get_elem_desc(tItems[i]))
    	end
    end
	return szDesc
end

function _get_elem_desc(tElem)
	local szDesc = ""
	if type(tElem[2]) == "function" then
		szDesc = tElem[1]
	else
		szDesc = format("%d %s%s", tElem[5], tElem[1], _get_expire_days(tElem))
	end
	return szDesc
end
