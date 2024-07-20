--通用兑换物设置
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

--标准的奖励兑换格式
gtNormalExchange = {
	tConsume = {--消耗物
		--{name,g,d,p,n}
--		{"辉煌军功章",2,1,9977,1},
--		{"金",-1, 0, 0, 100},
	},
	tAward = {--奖励
--		{name,g,d,p,n,bind,expiredays}
--		{"荣耀军功章",2,1,30642,1,7},
	},
	nRate = 0,
	tAward2 = {},--失败的奖励
	tRoomWeight = {1,100},
	nBatchExchange = 100, --一次最多兑换多少个 
}

--兑换成功回调函数，由具体的业务去实现
--function gtNormalExchange:do_exchange_callback()
--end

tNpcTalkTemp = {}--npc talk用来存储award index的

function gtNormalExchange:new()
	local t=gf_Inherit(self)
	return t
end

function gtNormalExchange:npc_talk_main(szNpcName,nTempIndex)
	nTempIndex = nTempIndex or 1
	tNpcTalkTemp[nTempIndex] = self--先把self保存起来，否则后面的回调会报错的
	
	local szConsume = self:get_consume_desc()
	local szAward = self:get_award_desc()
	local szMsg = ""
	if szConsume ~= "" then
		szMsg = format("фi [%s] c莕 ti猽 hao [%s], ng � kh玭g??", szAward, szConsume)
	else
		szMsg = format("уng � i [%s] kh玭g??", szAward)
	end
	local szTitle = format("%s:%s", szNpcName, szMsg)
	local tbSay = {}
	tinsert(tbSay, format("%s/#npc_talk_ask_num(%d)", "X竎 nh i", nTempIndex))
	tinsert(tbSay, format("%s/nothing", "Ra kh醝"))
	Say(szTitle, getn(tbSay), tbSay)
end

function gtNormalExchange:get_consume_desc()
	return get_list_content(self.tConsume)
end

function gtNormalExchange:get_award_desc()
	local szAward = get_list_content(self.tAward)
	if self.nRate > 0 then
		local szAward2 = get_list_content(self.tAward2)
		szAward = format("C� x綾 xu蕋 nh蕋 nh th祅h c玭g nh薾 頲 {%s}", szAward)
		if szAward2 and szAward2~= "" then
			szAward = format("%s n誹 kh玭g s� nh薾 頲 {%s}", szAward, szAward2)
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
	nMaxExchangeCnt = min(nMaxExchangeCnt, self.nBatchExchange or 100)--最多一次换100个
	return nMaxExchangeCnt
end

function gtNormalExchange:do_exchange(bDelete, bNotify)
	if gf_Judge_Room_Weight(self.tRoomWeight[1], self.tRoomWeight[2], "") ~= 1 then
		return 0
	end

	if check_and_consume_list(self.tConsume, bDelete, bNotify) ~= 1 then
		return 0
	end

	if 1 == bDelete then --所有都检查通过了，执行删除
		local tAward = self.tAward
		local nAwardType = 1
		if self.nRate > 0 and random(1,100) > self.nRate then --随机失败 给第二套奖励
			tAward = self.tAward2
			nAwardType = 2
		end
		check_award_by_list(tAward, 1)
		award_by_list(tAward, bDelete, bNotify)
		if self.do_exchange_callback then--兑换成功回调
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
    		AskClientForNumber(szFunc, 1, nMax, "H穣 nh藀 s� lng v祇")
    	else
    		Talk(1, "", "Kh玭g i 頲 g� c�.")	
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
		szMsg = format("(Hi謚 l鵦 %d ng祔)", tItem[7])
	end
	return szMsg
end

--gtListCfg = {
--	--
--	[-1] = {"金子", GetCash, Pay, Earn, 10000},
--	[-2] = {"修为", nil, nil, ModifyPopur},
--	[-3] = {"经验", nil, nil, ModifyExp},
--	[-4] = {"真气", nil, nil, AwardGenuineQi},
--}

function check_and_consume_list(tConsume, bDelete, bNotify)
	for i = 1, getn(tConsume) do
    	local ti = tConsume[i]
    	if ti[2] >= 0 then
        	if GetItemCount(ti[2], ti[3], ti[4]) < ti[5] then
        		if 1 == bNotify then
        			Talk(1,"",format("%sx%d kh玭g ", ti[1], ti[5]))
        		end
        		return 0
        	end
    	elseif ti[2] == -1 then
    		if GetCash() < ti[5]*10000 then
    			if 1 == bNotify then
        			Talk(1,"",format("Kh玭g c� %d%s",  ti[5], ti[1]))
        		end
        		return 0
    		end
    	else
    		error(format("unsupport consume %d", ti[2]))
    	end
	end
	if 1 == bDelete then --所有都检查通过了，执行删除
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
		if ti[2] == -3 then--经验
			if CanModifyExp(ti[5]) ~= 1 then
				local msg = format("Hi謓 t筰 kh玭g th� nh薾 %d EXP", ti[5])
				szMsg = format("%s\n%s", szMsg, msg)
				ret = 0;
			end
		elseif ti[2] == -4 then--真气
			if MeridianGetLevel() < 1 or MeridianGetLeftGenuineQiCapcity() < ti[5] then
				local msg = format("Hi謓 t筰 kh玭g th� nh薾 %d ch﹏ kh�", ti[5])
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
        if type(ti[2]) == "function" then --函数
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
			local szMsg2Player = format("B筺  nh薾 頲 %d %s", ti[5], ti[1])
    		Msg2Player(szMsg2Player)
		elseif ti[2] == -1 then--金子
			Earn(ti[5]*10000)
    		local szMsg2Player = format("Nh薾 頲 %d V祅g", ti[5])
    		Msg2Player(szMsg2Player)
		elseif ti[2] == -2 then--修为
			ModifyPopur(ti[5])
    		szMsg2Player = format("C竎 h�  nh薾 頲 %d 甶觤 tu luy謓", ti[5])
    		Msg2Player(szMsg2Player)
    	elseif ti[2] == -3 then--经验
			local r = ModifyExp(ti[5])
			if r == 1 then
				local szMsg2Player = format("Thu 頲 %d 甶觤 kinh nghi謒", ti[5])
    			Msg2Player(szMsg2Player)
			end
    	elseif ti[2] == -4 then--真气
			AwardGenuineQi(ti[5])
			--szMsg2Player = format("你获得了%d点真气", ti[5])
    		--Msg2Player(szMsg2Player)
    	elseif ti[2] == -5 then--声望
			ModifyReputation(ti[5], 0)
    		local szMsg2Player = format("Thu 頲 %d 甶觤 danh v鋘g", ti[5])
    		Msg2Player(szMsg2Player)
    	elseif ti[2] == -6 then--师门贡献度
    		SetTask(336, GetTask(336) + ti[5])
    		local szMsg2Player = format("Thu 頲 %d 甶觤 c鑞g hi課 s� m玭", ti[5])
    		Msg2Player(szMsg2Player)
    	elseif ti[2] == -7 then--军功
    		if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + ti[5]);
			else
				SetTask(701, GetTask(701) - ti[5]);
			end
    		local szMsg2Player = format("C竎 h� nh薾 頲 %d 甶觤 qu﹏ c玭g", ti[5])
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
