--培元丹物品脚本

Include ("\\script\\meridian\\meridian_script_api.lua")
Include ("\\script\\system_switch_config.lua")

MAX_USETIME_PER_DAY=12
SZ_THIS_SCRIPT="\\settings\\static_script\\meridian\\item_peiyuandan.lua"
N_THIS_CALL_BACK_CODE=17 --随便的一个数值 用于校验的(<100表示要检查真气容量)

N_ADD_ZHENQI_TYPE = AWARD_QENUINEQI_DAILY_TASK

SZ_ITEM_NAME="B錳 Nguy猲 Кn"
N_ONE_CALL_BACK_SEC = 5
N_ONE_CALL_BACK_CNT = 3
N_ONE_AWARD_ZHENQI = 2

N_CNT_DAILY_TASK_IDX=3
N_CNT_DAILY_TASK_BYTE_IDX=1

t_rand_npc_sfx = 
{
	927, 931, 935
}

--步进回调函数
function OnProcessCallBack(wCurProcess, wMaxProcess, wCheckCode)
	if wCheckCode ~= N_THIS_CALL_BACK_CODE then
		return 0
	end
	--print(format("OnProcessCallBack(%d/%d) check code=%d", wCurProcess, wMaxProcess, wCheckCode))
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetCurrentNpcSFX(nPidxNpc,926,0,1); --地面特效
	SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1,getn(t_rand_npc_sfx))],2,1); --特效
	if wCurProcess >= wMaxProcess then
		DoStartScriptCallBack(0, 0, 0, "", 1)--停止冲击
	else
		if 1 ~= AwardGenuineQiByType(N_ONE_AWARD_ZHENQI, N_ADD_ZHENQI_TYPE) then
			DoStartScriptCallBack(0, 0, 0, "", 1)--停止冲击
		end
	end
end

function OnUse_Real(id)
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("H� th鑞g kinh m筩h v蒼 ch璦 khai th玭g, hi謓 v蒼 ch璦 th� s� d鬾g v藅 ph萴 n祔!"))
		return 0
	end
	if MeridianGetLevel() < 1 then
		Talk(1,"",format("Ch璦 ph秈 c秐h gi韎 k輈h ho箃, t筸 th阨 kh玭g th� s� d鬾g v藅 ph萴 n祔!"))
		return 0
	end
	
	local nDailiCapacity = GetTodayAwardGenuineQiLeftCapacityByType(N_ADD_ZHENQI_TYPE)
	if nDailiCapacity <= 0 then
		Talk(1,"",format("Th玭g qua %s trong ng祔 h玬 nay  kh玭g th� nh薾 th猰 ch﹏ kh�!", t_type_zhenqi_limit_para[N_ADD_ZHENQI_TYPE][5]))
		return
	else
		_DoUseItem(id)
	end
	
--	local nTodayUseCnt = _GetTodayUseCount()
--	if nTodayUseCnt < MAX_USETIME_PER_DAY then
--		local nDailiCapacity = GetTodayAwardGenuineQiLeftCapacityByType(N_ADD_ZHENQI_TYPE)
--    	if nDailiCapacity <= 0 then
--    		Talk(1,"",format("今日通过%s已经不能再获得真气!", t_type_zhenqi_limit_para[N_ADD_ZHENQI_TYPE][5]))
--    		return
--    	elseif nDailiCapacity < N_ONE_AWARD_ZHENQI * N_ONE_CALL_BACK_CNT then
--    		local szTitle = format("使用%s最多可获得%d点真气，你今日通过%s最多还可以获得%d点真气，多余的将造成浪费,确定使用吗?", SZ_ITEM_NAME, N_ONE_AWARD_ZHENQI * N_ONE_CALL_BACK_CNT
--    			, t_type_zhenqi_limit_para[N_ADD_ZHENQI_TYPE][5], nDailiCapacity)
--        		local tbSay = {}
--        		tinsert(tbSay, format("确定使用/#_DoUseItem(%d)", id))
--        		tinsert(tbSay, "算了，还是不使用了/no")
--        		Say(szTitle, getn(tbSay), tbSay)
--    		return
--    	else
--    		_DoUseItem(id)
--    	end
--	else
--		Talk(1,"",format("今日使用%s的已经超过%d次，请明天再吃吧!", SZ_ITEM_NAME, MAX_USETIME_PER_DAY))
--	end

--	local szTitle = format("使用%s最多可获得%d点真气，你今日通过%s最多还可以获得%d点真气，多余的将造成浪费,确定使用吗?", SZ_ITEM_NAME, N_ONE_AWARD_ZHENQI * N_ONE_CALL_BACK_CNT
--		, t_type_zhenqi_limit_para[N_ADD_ZHENQI_TYPE][5], nDailiCapacity)
--		local tbSay = {}
--		tinsert(tbSay, format("确定使用/#_DoUseItem(%d)", id))
--		tinsert(tbSay, "算了，还是不使用了/no")
--		Say(szTitle, getn(tbSay), tbSay)
end

function _DoUseItem(id)
	
	local nDelResult = DelItemByIndex(id, -1)
	if 1 == nDelResult then
		AwardGenuineQiByType(N_ONE_AWARD_ZHENQI * N_ONE_CALL_BACK_CNT, N_ADD_ZHENQI_TYPE)
	end
	
--	if 1 == DoStartScriptCallBack(N_ONE_CALL_BACK_SEC, N_ONE_CALL_BACK_CNT + 1, N_THIS_CALL_BACK_CODE, SZ_THIS_SCRIPT, 0) then
--		--删除物品
--		local nDelResult = DelItemByIndex(id, -1)
--		if 1 == nDelResult then
--			local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
--			SetCurrentNpcSFX(nPidxNpc,926,0,1); --地面特效
--			SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1,getn(t_rand_npc_sfx))],2,1); --特效
--
--			if 1 ~= _AddTodayUseCount() then
--				DoStartScriptCallBack(0, 0, 0, "", 1)--停止修炼
--			end
--			--DoWait(0, 0,g_nReadTime-nReadTime);
--			
--			local nTodayUseCnt = _GetTodayUseCount()
--			local szMsg = format("你今天还能使用%d/%d个%s", MAX_USETIME_PER_DAY - nTodayUseCnt, MAX_USETIME_PER_DAY, SZ_ITEM_NAME)
--			Msg2Player(szMsg)
--		else
--			DoStartScriptCallBack(0, 0, 0, "", 1)--停止修炼
--		end
--	end
end

function _GetTodayUseCount()
	local nDailyTaskVal = GetDailyTask(N_CNT_DAILY_TASK_IDX)
	local nCnt = GetByte(nDailyTaskVal, N_CNT_DAILY_TASK_BYTE_IDX)
	return nCnt
end

function _AddTodayUseCount()
	local nDailyTaskVal = GetDailyTask(N_CNT_DAILY_TASK_IDX)
	local nCnt = GetByte(nDailyTaskVal, N_CNT_DAILY_TASK_BYTE_IDX)
	if nCnt < 255 then
		nCnt = nCnt + 1
		local nNewVal = SetByte(nDailyTaskVal, N_CNT_DAILY_TASK_BYTE_IDX, nCnt)
		SetDailyTask(N_CNT_DAILY_TASK_IDX, nNewVal)
		return 1
	else
		return 0
	end
	
	return 0
end

function no()
end
