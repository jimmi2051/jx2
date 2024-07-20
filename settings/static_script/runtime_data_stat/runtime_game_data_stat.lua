Include("\\settings\\static_script\\vip_feedback_system\\ib_consumme_level.lua")
--给程序调的接口
RUNTIME_STAT_SYS_ENHANCE = 		1 --//强化
RUNTIME_STAT_SYS_REPAIR = 		2 --//修理
RUNTIME_STAT_SYS_ADVREPAIR = 	3 --//高级修理
RUNTIME_STAT_SYS_STALL = 		4 --//摆摊
RUNTIME_STAT_SYS_TRADE = 		5 --//直接交易
RUNTIME_STAT_SYS_ITEM_ADD_DEL = 6 --//AddItem DelItem
RUNTIME_STAT_SYS_GOLD_EARN_PAY = 7 --//Earn Pay

RUNTIME_STAT_SYS_LIANGSHAN = 		100 --//梁山
RUNTIME_STAT_SYS_TIANMENZHEN = 		101 --//天门阵
RUNTIME_STAT_SYS_DIXUANGONG = 		102 --//地玄宫
RUNTIME_STAT_SYS_WANJIANZHONG = 	103 --万剑冢
RUNTIME_STAT_SYS_KFBATTLE = 		104 --//跨服战场
RUNTIME_STAT_SYS_ITEM_USE = 		105 --//使用道具

RUNTIME_STAT_EVENT_PAY_MONEY = 1	--//付钱
RUNTIME_STAT_EVENT_GAIN_MONEY = 2	--//收钱
RUNTIME_STAT_EVENT_BUY_ITEM = 3	--//交易道具
--RUNTIME_STAT_EVENT_SELL_ITEM = 4	--//交易道具
RUNTIME_STAT_EVENT_ADD = 4	--//Add
RUNTIME_STAT_EVENT_DEL = 5	--//Del

RUNTIME_STAT_EVENT_FINISH_TASK = 100 --完成任务

_t_trade_item_stat={--需要统计的核心道具交易价格和数量
	--[gdp] = 1,
	[2+95*256+204*65536] = 1,--天罡令
	[2+1*256+30370*65536] = 1,--天门金令
	[2+1*256+30614*65536] = 1,--雷虎精魄2	1	30614
}


--程序传过来的统计信息
function runtime_stat_event(uSys, uEvent, uExt, uCount)
	local id = uSys*1000+uEvent
	if t_event_to_stat[id] then
		t_event_to_stat[id](uSys, uEvent, uExt, uCount)
	end
end

_t_evnet_pay_sys2main={
	[1001] = 1,
	[2001] = 8,
	[3001] = 15,
	[4001] = 22,
	[4002] = 29,
}
function _proc_runtime_stat_event_pay_(uSys, uEvent, uExt, uCount)
	local nType = ib_get_last_month_consume_level()
	local id = uSys*1000+uEvent
	local nSub = _t_evnet_pay_sys2main[id] + nType - 1
	local uGold = floor(uCount/10000)
	local uCoin = mod(uCount,10000)
	if nType > 0 and  nSub then
		AddRuntimeStat(9, nSub, 0, uGold) --main id = 9
		AddRuntimeStat(9, nSub, 1, uCoin) --main id = 9
	end
--	if RUNTIME_STAT_SYS_STALL == uSys and RUNTIME_STAT_EVENT_GAIN_MONEY==uEvent then
--		--交易的把金子产出和消耗都减掉
--		AddRuntimeStat(16, 1, 0, -1*uGold)
--		AddRuntimeStat(16, 1, 1, -1*uCoin)
--		AddRuntimeStat(16, 2, 0, -1*uGold)
--		AddRuntimeStat(16, 2, 1, -1*uCoin)
--	end
	if uEvent == RUNTIME_STAT_EVENT_PAY_MONEY and _t_trade_item_stat[uExt] then--核心道具摆摊交易价格
		AddRuntimeStat(9, 36, uExt, uGold) --main id = 9
		AddRuntimeStat(9, 36, uExt+10, uCoin) --main id = 9
	end
end
function _proc_runtime_stat_event_gain_(uSys, uEvent, uExt, uCount)
	_proc_runtime_stat_event_pay_(uSys, uEvent, uExt, uCount)
end
function _proc_runtime_stat_event_stall_buy_item_(uSys, uEvent, uExt, uCount)
	if uEvent == RUNTIME_STAT_EVENT_BUY_ITEM and _t_trade_item_stat[uExt] then--核心道具摆摊交易价格
		AddRuntimeStat(9, 37, uExt, uCount) --main id = 9
	end
end
function _proc_runtime_stat_event_trade_buy_item_(uSys, uEvent, uExt, uCount)
	if uEvent == RUNTIME_STAT_EVENT_BUY_ITEM and _t_trade_item_stat[uExt] then--核心道具摆摊交易价格
		AddRuntimeStat(13, 1, uExt, uCount) --main id = 9
	end
end

_t_evnet_finish_task_sys2main = {
	--main,sub_start,count
	[100100] = {3, 15, 3},
	[102100] = {1, 20, 3},
	[103100] = {4, 15, 4},
}
function _proc_runtime_stat_event_finish_task_(uSys, uEvent, uExt, uCount)
	local id = uSys*1000+uEvent
	local t = _t_evnet_finish_task_sys2main[id]
	if t then
		if uExt > 0 and uExt <= t[3] then
			local sub = t[2] + uExt - 1
			AddRuntimeStat(t[1], sub, 0, uCount)
		end
	end
end

_t_add_del_item_stat={--核心道具产出和消耗统计
	[2*1000*100000+95*100000+204] 	= 1,--天罡令
	[2*1000*100000+1*100000+30390] 	= 1,--天罡碎片
	[2*1000*100000+1*100000+30369] 	= 1,--古灵玉
	[2*1000*100000+1*100000+30370] 	= 1,--天门金令
	[2*1000*100000+1*100000+30410] 	= 1,--天门碎片
	[2*1000*100000+1*100000+30409] 	= 1,--通天令牌
	[2*1000*100000+1*100000+30411] 	= 1,--小包通天令牌
	[2*1000*100000+1*100000+30412] 	= 1,--大包通天令牌
	[2*1000*100000+95*100000+208] 	= 1,--聚义令
	[2*1000*100000+95*100000+210] 	= 1,--小包聚义令
	[2*1000*100000+95*100000+211] 	= 1,--大包聚义令
	[2*1000*100000+1*100000+536] 	= 1,--紫金红包（空）
	[2*1000*100000+1*100000+537] 	= 1,--紫金红包
	[2*1000*100000+1*100000+538] 	= 1,--黄金大红包（空）
	[2*1000*100000+1*100000+539] 	= 1,--黄金大红包
	[2*1000*100000+1*100000+30133] 	= 1,--黄金钥匙
	[2*1000*100000+1*100000+30228] 	= 1,--白金红包( 空)
	[2*1000*100000+1*100000+30229] 	= 1,--白金大红包
	[2*1000*100000+1*100000+30490] 	= 1,--黄金大银票
	[2*1000*100000+1*100000+199] 	= 1,--大银票
	[2*1000*100000+1*100000+30603] 	= 1,--逍遥玉
	[2*1000*100000+1*100000+30604] 	= 1,--逍遥玉袋
	[2*1000*100000+1*100000+30605] 	= 1,--逍遥玉包
	[2*1000*100000+1*100000+30614] 	= 1,--雷虎精魄
	[2*1000*100000+2*100000+7] 		= 1,--陨铁碎片
	[2*1000*100000+2*100000+8] 		= 1,--陨铁
	[2*1000*100000+1*100000+1009] 	= 1,--陨铁精石
	[2*1000*100000+1*100000+1049] 	= 1,--打包的陨铁碎片
	[2*1000*100000+1*100000+1050] 	= 1,--打包的陨铁
	[2*1000*100000+1*100000+1051] 	= 1,--打包的陨铁精石
	[2*1000*100000+1*100000+1067] 	= 1,--定魂陨铁神石
	[2*1000*100000+1*100000+1068] 	= 1,--陨铁灵石
	[2*1000*100000+1*100000+1113] 	= 1,--大定魂陨铁神石
	[2*1000*100000+1*100000+3356] 	= 1,--小包的陨铁精石
	[2*1000*100000+1*100000+30424] 	= 1,--12级强化卷
	[2*1000*100000+1*100000+30425] 	= 1,--13级强化卷
	[2*1000*100000+1*100000+30426] 	= 1,--14级强化卷
	[2*1000*100000+1*100000+30427] 	= 1,--15级强化卷
	[2*1000*100000+1*100000+30521] 	= 1,--1级洗心石
	[2*1000*100000+1*100000+30522] 	= 1,--2级洗心石
	[2*1000*100000+1*100000+30523] 	= 1,--3级洗心石
	[2*1000*100000+1*100000+30524] 	= 1,--4级洗心石
	[2*1000*100000+1*100000+30525] 	= 1,--5级洗心石
	[2*1000*100000+1*100000+30526] 	= 1,--6级洗心石
	[2*1000*100000+1*100000+30527] 	= 1,--1级炼炉铁
	[2*1000*100000+1*100000+30528] 	= 1,--2级炼炉铁
	[2*1000*100000+1*100000+30529] 	= 1,--3级炼炉铁
	[2*1000*100000+1*100000+30530] 	= 1,--4级炼炉铁
	[2*1000*100000+1*100000+30531] 	= 1,--5级炼炉铁
	[2*1000*100000+1*100000+30532] 	= 1,--6级炼炉铁
	[2*1000*100000+1*100000+30533] 	= 1,--1级铁晶
	[2*1000*100000+1*100000+30534] 	= 1,--2级铁晶
	[2*1000*100000+1*100000+30535] 	= 1,--3级铁晶
	[2*1000*100000+1*100000+30612] 	= 1,--4级铁晶
	[2*1000*100000+1*100000+30497] 	= 1,--魔晶
	[2*1000*100000+1*100000+30498] 	= 1,--勇士勋章
	[2*1000*100000+1*100000+30499] 	= 1,--英雄勋章
	[2*1000*100000+1*100000+30491] 	= 1,--金质俏衣劵
	[2*1000*100000+1*100000+30492] 	= 1,--银质俏衣劵
	[2*1000*100000+1*100000+30493] 	= 1,--铜质俏衣劵
	[2*1000*100000+1*100000+30230] 	= 1,--道具Xu
    [0*1000*100000+107*100000+204] 	= 1,--"金刚般若真卷",
    [0*1000*100000+107*100000+205] 	= 1,--"潜龙寂灭真卷",
    [0*1000*100000+107*100000+206] 	= 1,--"无尘菩提真卷",
    [0*1000*100000+107*100000+207] 	= 1,--"天罗连珠真卷",
    [0*1000*100000+107*100000+208] 	= 1,--"如意金顶真卷",
    [0*1000*100000+107*100000+209] 	= 1,--"碧海绝音真卷",
    [0*1000*100000+107*100000+210] 	= 1,--"混沌镇岳真卷",
    [0*1000*100000+107*100000+211] 	= 1,--"揆天游龙真卷",
    [0*1000*100000+107*100000+212] 	= 1,--"幻影迷踪真卷",
    [0*1000*100000+107*100000+213] 	= 1,--"君子截风真卷",
    [0*1000*100000+107*100000+214] 	= 1,--"镇军飞龙枪真卷"
    [0*1000*100000+107*100000+215] 	= 1,--"穿云落虹真卷",
    [0*1000*100000+107*100000+216] 	= 1,--"幽冥封魔真卷",
    [0*1000*100000+107*100000+217] 	= 1,--"灵蛊幻邪真卷",
    [0*1000*100000+107*100000+218] 	= 1,--"九天风雷真卷",
    [0*1000*100000+107*100000+222] 	= 1,--"红尘醉梦真卷",
    [0*1000*100000+107*100000+223] 	= 1,--"风花千叶真卷",
    [0*1000*100000+112*100000+78] 	= 1,--"凌波微步",
    [0*1000*100000+112*100000+158] 	= 1,--"凌波微步全本",

    [2*1000*100000+1*100000+31066] 	= 1,--"太一铜卷",
    [2*1000*100000+1*100000+31067] 	= 1,--"太一铁卷",
    [2*1000*100000+1*100000+31118] 	= 1,--"敦煌玄铁",
    [2*1000*100000+1*100000+31120] 	= 1,--"敦煌玄晶",
    [2*1000*100000+1*100000+31119] 	= 1,--"敦煌琥珀",
    [2*1000*100000+1*100000+31121] 	= 1,--"敦煌玛瑙,

}
function _proc_runtime_stat_event_item_add_del_(uSys, uEvent, uExt, uCount)
	if _t_add_del_item_stat[uExt] then
		if uEvent == RUNTIME_STAT_EVENT_ADD then
			AddRuntimeStat(16, 3, uExt, uCount)
		elseif uEvent == RUNTIME_STAT_EVENT_DEL then
			AddRuntimeStat(16, 4, uExt, uCount)
		end
	end
end

function _proc_runtime_stat_event_gold_earn_pay_(uSys, uEvent, uExt, uCount)
	local nGold = floor(uCount/10000)
	local nCoin = mod(uCount,10000)
	if uEvent == RUNTIME_STAT_EVENT_GAIN_MONEY then
		AddRuntimeStat(16, 1, 0, nGold)
		AddRuntimeStat(16, 1, 1, nCoin)
	elseif uEvent == RUNTIME_STAT_EVENT_PAY_MONEY then
		AddRuntimeStat(16, 2, 0, nGold)
		AddRuntimeStat(16, 2, 1, nCoin)
	end
end

t_event_to_stat={
	--[uSys*1000+uEvent] = func
	[1001] = _proc_runtime_stat_event_pay_,
	[2001] = _proc_runtime_stat_event_pay_,
	[3001] = _proc_runtime_stat_event_pay_,
	[4001] = _proc_runtime_stat_event_pay_,
	[4002] = _proc_runtime_stat_event_gain_,
	[4003] = _proc_runtime_stat_event_stall_buy_item_,
	[5003] = _proc_runtime_stat_event_trade_buy_item_,
	[100100] = _proc_runtime_stat_event_finish_task_,
	[102100] = _proc_runtime_stat_event_finish_task_,
	[6004] = _proc_runtime_stat_event_item_add_del_,
	[6005] = _proc_runtime_stat_event_item_add_del_,
	[7001] = _proc_runtime_stat_event_gold_earn_pay_,
	[7002] = _proc_runtime_stat_event_gold_earn_pay_,
}

------------------------------------------------------------------------------------------
tEquipShopStat = {--代币商店兑换统计
	--[uGoodID] = {uMainId, uSubId, uExtId}
	[34045] = {31, 3, 0},
	[34056] = {31, 2, 1},
	[34057] = {31, 2, 2},
	[34058] = {31, 2, 3},
	[34059] = {31, 2, 4},
	[34060] = {31, 2, 5},
	[34061] = {31, 2, 6},
	[34063] = {31, 1, 1},
	[34064] = {31, 1, 2},
	[34065] = {31, 1, 3},
	[34066] = {31, 1, 4},
	[34067] = {31, 1, 5},
	[34068] = {31, 1, 6},
	[34069] = {31, 1, 7},
	[34070] = {31, 1, 8},
	[34071] = {31, 1, 9},
	[34072] = {31, 1, 10},
	[34073] = {31, 1, 11},
	[34074] = {31, 1, 12},
	[34075] = {31, 1, 13},
	[34076] = {31, 1, 14},
	[34077] = {31, 1, 15},
	
	[34169] = {40, 1, 1},
    [34170] = {40, 1, 1},
    [34171] = {40, 1, 1},
    [34172] = {40, 1, 1},
    [34173] = {40, 1, 2},
    [34174] = {40, 1, 2},
    [34175] = {40, 1, 2},
    [34176] = {40, 1, 2},
    [34177] = {40, 1, 3},
    [34178] = {40, 1, 3},
    [34179] = {40, 1, 3},
    [34180] = {40, 1, 3},
    [34181] = {40, 1, 4},
    [34182] = {40, 1, 4},
    [34183] = {40, 1, 4},
    [34184] = {40, 1, 4},
    [34185] = {40, 2, 1},
    [34186] = {40, 2, 1},
    [34187] = {40, 2, 1},
    [34188] = {40, 2, 1},
    [34189] = {40, 2, 2},
    [34190] = {40, 2, 2},
    [34191] = {40, 2, 2},
    [34192] = {40, 2, 2},
    [34193] = {40, 2, 3},
    [34194] = {40, 2, 3},
    [34195] = {40, 2, 3},
    [34196] = {40, 2, 3},
    [34197] = {40, 2, 4},
    [34198] = {40, 2, 4},
    [34199] = {40, 2, 4},
    [34200] = {40, 2, 4},
    [34201] = {40, 3, 1},
    [34202] = {40, 3, 1},
    [34203] = {40, 3, 1},
    [34204] = {40, 3, 1},
    [34205] = {40, 3, 2},
    [34206] = {40, 3, 2},
    [34207] = {40, 3, 2},
    [34208] = {40, 3, 2},
    [34209] = {40, 3, 3},
    [34210] = {40, 3, 3},
    [34211] = {40, 3, 3},
    [34212] = {40, 3, 3},
    [34213] = {40, 3, 4},
    [34214] = {40, 3, 4},
    [34215] = {40, 3, 4},
    [34216] = {40, 3, 4},
    [34217] = {40, 4, 1},
    [34218] = {40, 4, 1},
    [34219] = {40, 4, 1},
    [34220] = {40, 4, 1},
    [34221] = {40, 4, 2},
    [34222] = {40, 4, 2},
    [34223] = {40, 4, 2},
    [34224] = {40, 4, 2},
    [34225] = {40, 4, 3},
    [34226] = {40, 4, 3},
    [34227] = {40, 4, 3},
    [34228] = {40, 4, 3},
    [34229] = {40, 4, 4},
    [34230] = {40, 4, 4},
    [34231] = {40, 4, 4},
    [34232] = {40, 4, 4},
    [34233] = {40, 5, 1},
    [34234] = {40, 5, 1},
    [34235] = {40, 5, 1},
    [34236] = {40, 5, 1},
    [34237] = {40, 5, 2},
    [34238] = {40, 5, 2},
    [34239] = {40, 5, 2},
    [34240] = {40, 5, 2},
    [34241] = {40, 5, 3},
    [34242] = {40, 5, 3},
    [34243] = {40, 5, 3},
    [34244] = {40, 5, 3},
    [34245] = {40, 5, 4},
    [34246] = {40, 5, 4},
    [34247] = {40, 5, 4},
    [34248] = {40, 5, 4},
    [34249] = {40, 6, 1},
    [34250] = {40, 6, 1},
    [34251] = {40, 6, 1},
    [34252] = {40, 6, 1},
    [34253] = {40, 6, 2},
    [34254] = {40, 6, 2},
    [34255] = {40, 6, 2},
    [34256] = {40, 6, 2},
    [34257] = {40, 6, 3},
    [34258] = {40, 6, 3},
    [34259] = {40, 6, 3},
    [34260] = {40, 6, 3},
    [34261] = {40, 6, 4},
    [34262] = {40, 6, 4},
    [34263] = {40, 6, 4},
    [34264] = {40, 6, 4},

    [34620] = {44,20,0},	--1级破碎头部刻板
	[34621] = {44,21,0},	--2级破碎头部刻板
	[34622] = {44,22,0},	--2级变换头部刻板
	[34623] = {44,23,0},	--1级破碎上装刻板
	[34624] = {44,24,0},	--2级破碎上装刻板
	[34625] = {44,25,0},	--2级变换上装刻板
	[34626] = {44,26,0},	--1级破碎下装刻板
	[34627] = {44,27,0},	--2级破碎下装刻板
	[34628] = {44,28,0},	--2级变换下装刻板
	[34629] = {44,29,0},	--1级破碎戒指刻板
	[34630] = {44,30,0},	--2级破碎戒指刻板
	[34631] = {44,31,0},	--2级变换戒指刻板
	[34632] = {44,32,0},	--1级破碎玉佩刻板
	[34633] = {44,33,0},	--2级破碎玉佩刻板
	[34634] = {44,34,0},	--2级变换首饰刻板
	[34635] = {44,35,0},	--寻宝箧
	[34636] = {44,35,0},	--寻宝箧
	[34637] = {44,35,0},	--寻宝箧
	[34638] = {44,35,0},	--寻宝箧

}
function runtime_stat_equip_shop_exchange(uShopId, uGoodID, uExchangeID, nRealExchgCnt)
	local t = tEquipShopStat[uGoodID]
	if t then
		AddRuntimeStat(t[1], t[2], t[3] or 0, nRealExchgCnt)
	end
end


tEquipShopConsumme = { --消耗的道具统计
	[200131066] = {44, 37, 0}, --太一铜券
	[200131067] = {44, 38, 0}, --太一铁券
	[200131118] = {44, 39, 0}, --敦煌玄铁
	[200131119] = {44, 40, 0}, --敦煌琥珀
	[200131120] = {44, 41, 0}, --敦煌玄晶
	[200131121] = {44, 42, 0}, --敦煌玄晶
}
function runtime_stat_equip_shop_consumme_item(uItemGDP, nNum, uShopId, uGoodID, uExchangeID)
	local t = tEquipShopConsumme[uItemGDP]
	if t then
		AddRuntimeStat(t[1], t[2], t[3] or 0, nNum)
	end
end
