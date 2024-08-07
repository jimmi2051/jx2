Include("\\script\\class\\mem.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\misc\\missionaward_head.lua")
Include("\\settings\\static_script\\missions\\base\\missionaward_equip_tbl.lua")
Include("\\script\\tmp_task_id_def.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

N_EQUIP_TEMP_TSK_ID = TMP_TASK_ID_GUANKA_AWARD_EQUIP_COUNT
N_MAX_RAND_RATE = 10000

--奖励初始化
function MissionAward_Initialize()
	SetTaskTemp(N_EQUIP_TEMP_TSK_ID, 0)
end

--奖励反初始化
function MissionAward_UnInitialize()
	SetTaskTemp(N_EQUIP_TEMP_TSK_ID, 0)
end

--t_award = 
--{
--	--------------------------------------------
--	t_free_award = 
--	{
--		sz_award_title = "万剑冢免费翻牌区"
--		--几次没有得到装备时必出装备
--		t_equip_round = {[3] = 1}
--		t_stage =
--		{
--			
--			[1] = 
--			{
--				n_equip_group_rate = 10--随机到装备组的概率
--            	t_equip_group = --装备组
--            	{
--            		--t_item_para, rate
--            		--t_item_para = {name, {g,d,p,n,bind}, expire_time, bGblMsg, {nNeedRoom, nNeedWeight}}
--            		--{{"紫霞秘籍",{0,107,65,1, 4}, 720, bGblMsg}, 150},
					--{{MissionAward_GiveExp, {}}, 150},
--            	}
--            	--------------------------------------------
--            	n_daibi_group_rate = 40--随机到代币组的概率
--            	n_max_daibi_perday = 30--一天最多获得多少代币
--            	t_daibi_group =
--            	{
--            	}
--            	--------------------------------------------
--            	t_other_group = --杂物组
--            	{
--            		--{exp=10000},
--            	}
--			}
--		}
--	}
--	
--	t_fix_award = 
--	{
--		t_stage =
--		{
--			[1] = {t_award},
--		}
--	}
--	--------------------------------------------
--	t_ib_award = 
--	{
--		sz_award_title = "万剑冢收费翻牌区"
--		t_stage = 
--		{
--			[1] =
--			{
--				t_cost = --消耗
--            	{
--            	}
--            	t_ib_award =--ib奖励
--            	{
--            	}
--			}
--		}
--		t_special = --如果有必出在这个表配置
--		{
--			nSaveTask=xxx
--			nSaveTaskWordIdx=1 or 2
--			nSureAwardCount=xxx
--			t_award =
--			{
--				{{MA_TianMenJinLing, {}}, 10000},
--			}
--		}
--	}
--}

function MissionAward_RandAward(nStage, nId, tAwardSettings, _call_back_func)
	local g,d,p,n = 0,0,0,0;
	if nId < 8 then
		g,d,p,n = _MissionAward_FreeRandAward(nStage, tAwardSettings.t_free_award)
	else
		g,d,p,n = _MissionAward_IbRandAward(nStage, tAwardSettings.t_ib_award)
	end
	if n and n > 0 then
		if _call_back_func then
			_call_back_func(g,d,p,n)
		end
		
		if nId >= 0 then
			MA_Team_SyncItem(nId,g,d,p,n,GetName());
		end
		return 1
	end
	return 0
end

-----------------------------------------------------------------
--必出处理 注意tSpecial可能为nil
function MissionAward_UpdateSpecialAward(tSpecial, szTitle, nAddCount, bDoAward)
	if not tSpecial then
		return
	end
	local nTask = tSpecial.nSaveTaskId
	local nTaskWordIdx = tSpecial.nSaveTaskWordIdx
	local nCurCount,nSureAwardCount = MissionAward_GetSpecialAwardCounter(tSpecial)
	
	--计数累加
	nCurCount = nCurCount + nAddCount;
	
	local bNeedAward = 0;
	if nCurCount >= nSureAwardCount then
		_MissionAward_SetSpecialAwardFlag(tSpecial, 1)	--设置必出标志
		bNeedAward = 1;
	end 
	local bSureAwardFlag = _MissionAward_GetSpecialAwardFlag(tSpecial)
	--给奖励
	if bDoAward == 1 then
		--计数器达到限额或设置了必出标志
		if bNeedAward==1 or bSureAwardFlag==1 then
			--给了东西返回哈 不然后面更新了计数器就洗刷刷了
			return MA_SpecialAward(tSpecial, szTitle)
		end
	end
	_MissionAward_SetSpecialAwardCounter(tSpecial, nCurCount)--更新计数器
	
	--什么东西都不返回
	return
end

--存放必给标志的二进制位
function _get_award_flag_bit_idx()
	return 16;
end

--IB消耗计数器相关接口
function MissionAward_GetSpecialAwardCounter(tSpecial)
	if not tSpecial then
		print("MissionAward_GetSpecialAwardCounter error")
		return
	end
	local nTask = tSpecial.nSaveTaskId
	local nTaskWordIdx = tSpecial.nSaveTaskWordIdx
	local nSureAwardCount = tSpecial.nSureAwardCount
	local nTaskVal = getTaskWord(nTask, nTaskWordIdx)
	local nCurCount = SafeSetBit(nTaskVal, _get_award_flag_bit_idx(), 0)
	return nCurCount,nSureAwardCount
end

function _MissionAward_SetSpecialAwardCounter(tSpecial,nCount)
	if not tSpecial or not nCount then
		print("_MissionAward_SetSpecialAwardCounter error")
		return
	end
	local nTask = tSpecial.nSaveTaskId
	local nTaskWordIdx = tSpecial.nSaveTaskWordIdx
	--local nSureAwardCount = tSpecial.nSureAwardCount
	local nTaskVal = getTaskWord(nTask, nTaskWordIdx)
	local nAwardFlagBit = GetBit(nTaskVal, _get_award_flag_bit_idx())
	local nNewVal = SafeSetBit(nCount, _get_award_flag_bit_idx(), nAwardFlagBit)
	return setTaskWord(nTask, nTaskWordIdx, nNewVal, tSpecial.nSaveTaskAccessCode)
end

function _MissionAward_GetSpecialAwardFlag(tSpecial)
	if not tSpecial then
		print("_MissionAward_GetSpecialAwardFlag error")
		return
	end
	local nTask = tSpecial.nSaveTaskId
	local nTaskWordIdx = tSpecial.nSaveTaskWordIdx
	--local nSureAwardCount = tSpecial.nSureAwardCount
	local nTaskVal = getTaskWord(nTask, nTaskWordIdx)
	local nFlag = GetBit(nTaskVal, _get_award_flag_bit_idx())
	return nFlag
end

function _MissionAward_SetSpecialAwardFlag(tSpecial, nVal)
	if not tSpecial or not nVal then
		print("_MissionAward_SetSpecialAwardFlag error")
		return
	end
	local nTask = tSpecial.nSaveTaskId
	local nTaskWordIdx = tSpecial.nSaveTaskWordIdx
	--local nSureAwardCount = tSpecial.nSureAwardCount
	local nTaskVal = getTaskWord(nTask, nTaskWordIdx)
	local nNewVal = SafeSetBit(nTaskVal, _get_award_flag_bit_idx(), nVal)
	return setTaskWord(nTask, nTaskWordIdx, nNewVal, tSpecial.nSaveTaskAccessCode)
end

--IB计数重置
function MissionAward_CheckAndResetSpecialAwardCouter(tSpecial)
	if not tSpecial then
		return
	end
	local nTask = tSpecial.nSaveTaskId
	local nTaskWordIdx = tSpecial.nSaveTaskWordIdx
--	local nSureAwardCount = tSpecial.nSureAwardCount
	local nCurCount,nMax = MissionAward_GetSpecialAwardCounter(tSpecial)
	if nCurCount >= nMax then
		--值重置已经满足必给条件的IB计数器
		_MissionAward_SetSpecialAwardCounter(tSpecial,0)
		WriteLog(format("[%s] CheckAndResetSpecialAwardCouter clear IB counter{nTask = %d nTaskWordIdx=%d} [%d]=>[%d]"
		, GetName(), nTask, nTaskWordIdx, nCurCount, getTaskWord(nTask, nTaskWordIdx)))
	end
end
-----------------------------------------------------------------

function _MissionAward_FreeRandAward(nStage, tAwardSettings)
	if tAwardSettings == nil then
		print("func _MissionAward_FreeRandAward tAwardSettings is nil")
		return
	end
	local szTitle = tAwardSettings.sz_award_title or ""
	local nRound = _MissionAward_GetNoneEquipRound()
	local tCfg = tAwardSettings.t_stage[nStage]
	local nRand = N_MAX_RAND_RATE

	--随装备组
	if not tAwardSettings.t_equip_round[nRound] then
		nRand = random(1, N_MAX_RAND_RATE)
	end
	if (tAwardSettings.t_equip_round[nRound] and 1 == _MissionAward_IsNeedRollEquip(nRound)) or nRand <= tCfg.n_equip_group_rate then
		_MissionAward_DisableNeedRollEquip(nRound)
		return _MissionAward_RandAward(tCfg.t_equip_group, szTitle)
	end
	_MissionAward_SetNoneEquipRound(nRound + 1)--未获得装备次数+1

	--随代币组
	local nDaibiCnt = _MissionAward_GetDailyDaibiCnt()
	if nDaibiCnt < tAwardSettings.n_max_daibi_perday then
		nRand = random(1, N_MAX_RAND_RATE)
		if nRand <= tCfg.n_daibi_group_rate then
			local g,d,p,n = _MissionAward_RandAward(tCfg.t_daibi_group, szTitle)
			_MissionAward_SetDailyDaibiCnt(nDaibiCnt + n)--获得的代币数量累加
			return g,d,p,n
		end
	end

	--随杂物组
	if tCfg.n_other_group_rate < N_MAX_RAND_RATE then
		nRand = random(1, N_MAX_RAND_RATE)
	end
	if nRand <= tCfg.n_other_group_rate then
		return _MissionAward_RandAward(tCfg.t_other_group, szTitle)
	end
end

--获取没有获得装备的次数
function _MissionAward_GetNoneEquipRound()
	return GetByte(GetTaskTemp(N_EQUIP_TEMP_TSK_ID),1)
end
--当前轮次已经获得装备
function _MissionAward_DisableNeedRollEquip(nRound)
	if not nRound or nRound > 23 or nRound < 0 then
    	print(format("_MissionAward_UpdateWhenGetEquip(nRound=%d), only support [0,23]", nRound))
    	return
    end
	local nOldVal = GetTaskTemp(N_EQUIP_TEMP_TSK_ID)
	local nNewVal = SafeSetBit(nOldVal, nRound + 9, 1)
	return SetTaskTemp(N_EQUIP_TEMP_TSK_ID, nNewVal)
end
function _MissionAward_IsNeedRollEquip(nRound)
	if not nRound or nRound > 23 or nRound < 0 then
    	print(format("_MissionAward_UpdateWhenGetEquip(nRound=%d), only support [0,23]", nRound))
    	return 0
    end
    local nVal = GetTaskTemp(N_EQUIP_TEMP_TSK_ID)
    local nFlag = GetBit(nVal, nRound + 9) or 0
	return (1 - nFlag)
end
--获取没有获得装备的次数
function _MissionAward_SetNoneEquipRound(nRound)
	local nOldVal = GetTaskTemp(N_EQUIP_TEMP_TSK_ID)
	if nRound > 23 or nRound < 0 then
		print(format("_MissionAward_SetNoneEquipRound(nRound=%d), only support [0,23]", nRound))
		return
	end
	local nNewVal = SafeSetByte(nOldVal, 1, nRound)

	return SetTaskTemp(N_EQUIP_TEMP_TSK_ID, nNewVal)
end
--获取今日获得代币数
function _MissionAward_GetDailyDaibiCnt()
	return GetDailyTask(DAILY_TASK_ID_DAILY_GET_DAIBI)
end
--设置今日获得代币数
function _MissionAward_SetDailyDaibiCnt(nCount)
	return SetDailyTask(DAILY_TASK_ID_DAILY_GET_DAIBI, nCount)
end


function _MissionAward_IbRandAward(nStage, tAwardSettings)
	local szTitle = tAwardSettings.sz_award_title or ""
	local tStage = tAwardSettings.t_stage[nStage]
	local tSpecial = tAwardSettings.t_special
	
	local nNeedRoom = 1
	local nNeedWeight = 100
	if gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,"") ~= 1 then
		Talk(1,"",format("H祅h trang kh玭g  � tr鑞g %d ho芻 nh﹏ v藅 kh玭g  s鴆 l鵦.!", nNeedRoom))
		return 0,0,0,-1
	end
	
	if _MissionAward_CheckCost(tStage.t_cost,1, szTitle) ~= 1 then
		return 0,0,0,-1
	end
	local nAdd = 0
	if tSpecial then
		nAdd = tSpecial.nAddcounterPerUpdate or 1
	end
	local g,d,p,n = MissionAward_UpdateSpecialAward(tSpecial, szTitle, nAdd, 1)--必出天门金令
	if not n or n == 0 then
		g,d,p,n = _MissionAward_RandAward(tStage.t_ib_award, szTitle)
	end
	return g,d,p,n
end

function _MissionAward_CheckCost(tCost,bDelete, szTitle)
	local nNum = getn(tCost);
	for i = 1, nNum do		
		if GetItemCount(tCost[i][2][1],tCost[i][2][2],tCost[i][2][3]) < tCost[i][2][4] then
			Talk(1,"",format("S� lng %s tr猲 ngi c竎 h� kh玭g ", tCost[i][1]));
			return 0;
		end
	end
	if bDelete then
		for i = 1, nNum do
			if DelItem(tCost[i][2][1],tCost[i][2][2],tCost[i][2][3],tCost[i][2][4]) ~= 1 then
				return 0;
			end
			local t = tCost[i][2]
			local item_para = format("%d,%d,%d,%d", t[1], t[2], t[3], t[4])
			gf_WriteLogEx(szTitle, "IB cost", "", tCost[i][1], item_para);
			--Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {tCost[i][2][1],tCost[i][2][2],tCost[i][2][3],tCost[i][2][4]})
			FireEvent("event_ib_cost", tCost[i][2][1],tCost[i][2][2],tCost[i][2][3],tCost[i][2][4])
			
			local _f_call_back = tCost[i][3]
			if _f_call_back then
				_f_call_back(t[4])
			end
		end
	end
	return 1;
end

function _MissionAward_RandAward(tAwardSettings, szTitle)
	local tSel = _MA_RandSelectItem(tAwardSettings)
	if tSel then
		return _MissionAward_GiveOneAward(tSel[1], szTitle)
	end
end

function MissionAward_FixAward(nStage, tAwardSettings)
	local tAward = tAwardSettings.t_fix_award or {}
	local szTitle = tAward.sz_award_title or ""
	local tStage = tAward.t_stage or {}
	local tCfg = tStage[nStage]
	if tCfg then
		gf_SetLogCaption(szTitle)
		for i = 1,getn(tCfg) do
			_MissionAward_GiveOneAward(tCfg[i], szTitle)
		end
		gf_SetLogCaption("")
	end
end

function _MissionAward_GiveOneAward(tAwardSettings, szMsgTitle)
	local g,d,p,n = 0,0,0,0
	if type(tAwardSettings[1]) == "function" then
		 g,d,p,n = tAwardSettings[1](tAwardSettings[2], szMsgTitle);
		 --n = tAwardSettings[2][1];
	else
		local tNeed = tAwardSettings[5] or {}
		if tNeed[1] and tNeed[2] then
			if gf_Judge_Room_Weight(tNeed[1],tNeed[2],"") ~= 1 then
				Talk(1,"",format("H祅h trang kh玭g  � tr鑞g %d ho芻 nh﹏ v藅 kh玭g  s鴆 l鵦.!", tNeed[1]))
				return 0,0,0,-1
			end
		end
		
		local nCount = tAwardSettings[2][4] or 0
		local nTime = (tAwardSettings[3] or 0) * 24 * 60 * 60--单位是天 转换成秒
		gf_AddItemEx2(tAwardSettings[2],tAwardSettings[1], szMsgTitle, "", nTime, 1)
		--local t = tAwardSettings[2]
		--local item_para = format("%d,%d,%d,%d,%d,%d", t[1], t[2], t[3], t[4], t[5] or -1, tAwardSettings[3] or -1)
		--gf_WriteLogEx(szMsgTitle, "gain award", "", tAwardSettings[1], item_para);
--		for i = 1,nCount do
--			local nResult,nItemIdx = gf_AddItemEx(tAwardSettings[2],tAwardSettings[1], 1);
--			if tAwardSettings[3] then--有效期
--    			local nTime = tAwardSettings[3]
--    			SetItemExpireTime(nItemIdx, nTime * 24 * 60 * 60)--单位是天 转换成秒
--			end
--		end
		if tAwardSettings[4] == 1 then
			local szNotice = format("Ch骳 m鮪g%sm�%snh薾 頲%sx%d", GetName(), szMsgTitle, tAwardSettings[1], nCount)
			Msg2Global(szNotice);
		end
		g,d,p,n = tAwardSettings[2][1], tAwardSettings[2][2], tAwardSettings[2][3], nCount
	end
	return g,d,p,n
end

--从道具表中随机
function _MA_RandSelectItem(tItemTbl)
	local nRand = random(1, N_MAX_RAND_RATE);
	for i = 1,getn(tItemTbl) do
		nRand = nRand - tItemTbl[i][2];
		if nRand <= 0 then
			return tItemTbl[i]
		end
	end
end

--tPara = {nCount, nBind, nExpireDays, bGblMsg}
function _MA_GiveRandItem(tItemTbl, tPara, szMsgTitle, bIsEquip)
	local tSel = _MA_RandSelectItem(tItemTbl)
	if tSel then
		local t = tSel[1]
		local tNeed = t[3] or {}
		local tAward = {t[1], {t[2][1], t[2][2], t[2][3], tPara[1], tPara[2]}, tPara[3], tPara[4], tNeed}
		if bIsEquip == 1 then
			tAward = {t[1], {t[2][1], t[2][2], t[2][3], tPara[1], tPara[2] or 1, -1, -1, -1, -1, -1, -1}
								, tPara[3], tPara[4], tNeed}
			--外装挂件不要有属性
			if t[2][1] == 0 and t[2][2] >= 119 and t[2][2] <= 121 then
				tAward[2][6] = 0
				tAward[2][7] = 0
				tAward[2][8] = 0
				tAward[2][9] = 0
				tAward[2][10] = 0
				tAward[2][11] = 0
			end
		end
		return _MissionAward_GiveOneAward(tAward, szMsgTitle)
	end
end

--给师门真卷
function MA_GiveFactionSuperBook(tPara, szMsgTitle)
	return _MA_GiveRandItem(t_FactionSuperBook, tPara, szMsgTitle, 1)
end

--给师门秘籍
function MA_GiveFactionBook(tPara, szMsgTitle)
	return _MA_GiveRandItem(t_FactionBook, tPara, szMsgTitle, 1)
end

--给随机师门4套
function MA_GiveFactionEquip4(tPara, szMsgTitle)
	return _MA_GiveRandItem(t_FactionEquip4, tPara, szMsgTitle, 1)
end

--给随机师门5套
function MA_GiveFactionEquip5(tPara, szMsgTitle)
	return _MA_GiveRandItem(t_FactionEquip5, tPara, szMsgTitle, 1)
end

--给随机皓月装备
function MA_GiveHaoYueEquip(tPara, szMsgTitle)
	return _MA_GiveRandItem(t_HaoYueEquip, tPara, szMsgTitle, 1)
end

--给随机九州装备
function MA_GiveJiuZhouEquip(tPara, szMsgTitle)
	return _MA_GiveRandItem(t_JiuZhouEquip, tPara, szMsgTitle, 1)
end

--给随机通天装备
function MA_GiveTongTianEquip(tPara, szMsgTitle)
	return _MA_GiveRandItem(t_TongTianEquip, tPara, szMsgTitle, 1)
end

--给随机白装
function MA_GiveNormalEquip(tPara, szMsgTitle)
	return _MA_GiveRandItem(t_NormalEquip, tPara, szMsgTitle, 1)
end

--给一级纹饰
function MA_GiveLevel1WenShi(tPara, szMsgTitle)
	return _MA_GiveRandItem(t_WenShiLevel1, tPara, szMsgTitle, 1)
end

--给二级纹饰
function MA_GiveLevel2WenShi(tPara, szMsgTitle)
	return _MA_GiveRandItem(t_WenShiLevel2, tPara, szMsgTitle, 1)
end

--给三级纹饰
function MA_GiveLevel3WenShi(tPara, szMsgTitle)
	return _MA_GiveRandItem(t_WenShiLevel3, tPara, szMsgTitle, 1)
end

--给经验
function MA_GiveExp(tPara)
	local nExp = tPara[1]
	if nExp > 0 then
		Msg2Player(format("Nh薾 kinh nghi謒%d", nExp))
		ModifyExp(nExp)
	end
end

--给钱
function MA_GiveMoney(tPara)
	local nMoney = tPara[1]
	if nMoney > 0 then
		Earn(nMoney)
	end
end

--给修为
function MA_GivePopur(tPara)
	local nPopur = tPara[1]
	if nPopur > 0 then
		ModifyPopur(nPopur)
		Msg2Player(format("C竎 h� nh薾 頲 %d 甶觤 tu luy謓", nPopur));
	end
end

function MA_GiveZhenQi(tPara)
	local nVal = tPara[1]
	if nVal > 0 then
		AwardGenuineQi(nVal)
		Msg2Player(format("C竎 h� nh薾 頲 %d 甶觤 ch﹏ kh�", nVal));
	end
end

function MA_StarEquipHuiZhang(tPara, szMsgTitle)
	return _MA_GiveRandItem(t_StarEquipHuiZhang, tPara, szMsgTitle, 1)
end

function MA_StarEquipPiFeng(tPara, szMsgTitle)
	return _MA_GiveRandItem(t_StarEquipPiFeng, tPara, szMsgTitle, 1)
end

function MA_StarEquipXie(tPara, szMsgTitle)
	return _MA_GiveRandItem(t_StarEquipXie, tPara, szMsgTitle, 1)
end

--特殊奖励，必出处理
function MA_SpecialAward(tPara, szMsgTitle)
	local nTask = tPara.nSaveTaskId
	local nTaskWordIdx = tPara.nSaveTaskWordIdx
--	local nSureAwardCount = tPara.nSureAwardCount
	local nCurCount = getTaskWord(nTask, nTaskWordIdx)

	--必出标记和IB计数器统一清0
	setTaskWord(nTask, nTaskWordIdx, 0, tPara.nSaveTaskAccessCode)
	WriteLog(format("[%s] SpecialAward clear IB counter{nTask = %d nTaskWordIdx=%d} [%d]=>[%d]"
		, GetName(), nTask, nTaskWordIdx, nCurCount, getTaskWord(nTask, nTaskWordIdx)))
	return _MissionAward_RandAward(tPara.t_award, szMsgTitle);
end

--给天门金令
function MA_TianMenJinLing(tPara, szMsgTitle)
	return _MissionAward_RandAward(t_TianMenJinLing, szMsgTitle)
end

--nWordIdx = 1 or 2
function getWord(nVal, nWordIdx)
	local nBytes = {SafeGetByte(nVal, 1),	SafeGetByte(nVal, 2),	SafeGetByte(nVal, 3),	SafeGetByte(nVal, 4),	}
	local nRet = 0
	if nWordIdx == 1 then
		nRet = nBytes[2] * 256 + nBytes[1]
	elseif nWordIdx == 2 then
		nRet = nBytes[4] * 256 + nBytes[3]
	else
		assert(0==1)
	end
	return nRet
end

function setWord(nVal, nWordIdx, nWordVal)
	local nRet = nVal
	local nStartByte = 0
	if nWordIdx == 1 then
		nStartByte = 1
	elseif nWordIdx == 2 then
		nStartByte = 3
	else
		nStartByte = 0
		assert(0==1)
	end
	if nStartByte > 0 then
		if nWordVal < 0 or nWordVal > 65535 then
			print(format("Role=%s setWord(nVal=%d, nWordIdx=%d, nWordVal=%d) nWordVal error", GetName() or "", nVal, nWordIdx, nWordVal))
			if nWordVal < 0 then
				nWordVal = 0
			else
				nWordVal = 65535
			end
		end
		local nNewTaskValueTemp = SafeSetByte(nVal, nStartByte, SafeGetByte(nWordVal, 1))
		local nNewTaskValue = SafeSetByte(nNewTaskValueTemp, nStartByte + 1, SafeGetByte(nWordVal, 2))
		nRet = nNewTaskValue
	end
	return nRet
end

--获取task的指定word 
function getTaskWord(nTask, nWordIdx)
	local nValue = GetTask(nTask)
	return getWord(nValue, nWordIdx)
end

--设定task的指定word nWordIdx = 1 or 2
function setTaskWord(nTask, nWordIdx, nVal, nAccessCode)
	local nValue = GetTask(nTask)
	local nNewVal = setWord(nValue, nWordIdx, nVal)
	return SetTask(nTask, nNewVal, nAccessCode)
end
