--这是模块化的一个标准主文件，各模块只需要实现对应的标准事件处理函数，不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调，以免空回调影响效率

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Include("\\script\\lib\\globalfunctions.lua")
t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "master_bai",
    szViewName 			= "N╩ M韎 B竔 S�",
    nTalkBeginDate		= 0,
    nBeginDate 			= 20151220,
    nEndDate 			= 20160103,
    nTaskGroup 			= 2,
    nTaskGroupVersion	= 23,
}

--以下为应用模块的可选配置，只要定义了这些变量和函数，系统就会自动注册和回调
t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskGroupIdx},
    {id={"id_bai_time_today", 6,}, clear="daily", }, --每日拜师次数
}

function on_add_watches()
	isolate_watch_event("event_player_interactive", "handle_on_bai", "gentle")
	isolate_watch_npc_talk("Uy Nh� T鑞", 100, "handle_on_npc_talk")
	isolate_watch_npc_talk("Gi竜 s�", 200, "handle_on_npc_talk")
	isolate_watch_npc_talk("Gi竜 s�", 300, "handle_on_npc_talk")
	--isolate_watch_npc_talk("罗莎", 100, "handle_on_npc_talk")
end


tCfg = {
	max_bai_oneday = 1,--每日拜师最大次数
	no_check_lv = 801,--8转玩家不检查实际等级
}

tOpenDate = {
	[20151225] = 1,
	[20160101] = 1,
	[20160102] = 1,
	[20160103] = 1,
}

function on_event_player_login(nExchangeComing)
	Msg2Player("N╩ m韎 2016 s緋 n r錳, c竎 b筺  h鋍 頲 nh鱪g g� ch璦, c� c﹗ n鉯 l� ba ngi c飊g 甶 ch綾 c� ngi ng m譶h h鋍 theo, ho箃 ng N╩ M韎 B竔 S� b総 u r錳! Chi ti誸 m阨 c竎 b筺 甶 Bi謓 Kinh, Th祅h Й, Tuy襫 Ch﹗ t譵 Gi竜 s�  t譵 hi觰 th猰")
end


function check_open_date()
	local today = tonumber(date("%Y%m%d"))
	return tOpenDate[today] or 0
end

function handle_on_bai()
	if check_open_date() ~= 1 then
		return 0;
	end
	if get_task("id_bai_time_today") >= tCfg.max_bai_oneday then
 		Talk(1,"",format("<color=green>%s<color>: M鏸 ngi ch� 頲 nh薾 thng %d l莕/ng祔.", isolate_view_name(), tCfg.max_bai_oneday));
 		return
 	end
 	local nTeamNum = GetTeamSize();
 	if nTeamNum ~= 2 then
		Talk(1,"",format("<color=green>%s<color>: Ph秈 hai ngi t� i m韎 頲 nh薾 thng.", isolate_view_name()));
		return
	end
	
	local nLv = gf_GetTransLevel();
 	local nTeamNum = GetTeamSize();
 	local nMapId,nPosX,nPosY = GetWorldPos();
 	
	local nOldIdx = PlayerIndex;
	local nMasterIdx = 0
	if GetTeamMember(1) == PlayerIndex then
		nMasterIdx = GetTeamMember(2);
	elseif GetTeamMember(2) == PlayerIndex then 
		nMasterIdx = GetTeamMember(1);
	else
		WriteLog("activity master bai:team error");
		return
	end
	PlayerIndex = nMasterIdx
	local nMapId2,nPosX2,nPosY2 = GetWorldPos();
	local nLv2 = gf_GetTransLevel();
	local sName2 = GetName();
	PlayerIndex = nOldIdx;
	
	if nMapId ~= nMapId2 or abs((nPosX-nPosX2)+(nPosY-nPosY2)) > 20 then --距离判断
		Talk(1,"",format("<color=green>%s<color>: B筺 v� i tng c莕 b竔 c竎h qu� xa, h穣 n g莕 h琻 n鱝!", isolate_view_name()));
		return
	end
	
	if nLv >= nLv2 and nLv2 < tCfg.no_check_lv then 
		Talk(1,"",format("<color=green>%s<color>: Ngi ch琲 c蕄 th蕄 l祄 ng t竎 L� ph衟 v韎 ngi ch琲 c蕄 cao trong i m韎 頲 thng.", isolate_view_name()))
		return
	end
	
	return _give_award(nLv, nLv2, sName2, nMasterIdx)
end

function _give_award(nLvLow, nLvHigh,szHighName,nMasterIdx)
	local szName = GetName()
	local nMul = 1
	local nRandom = random(1,100);
	if nRandom <= 2 then    --2%概率翻倍
		nMul = 2
	end
	if nLvLow < tCfg.no_check_lv then
		local nLv = mod(nLvLow, 100)
		local nExp = floor(((nLv^4)/(80^4))*3000000);
		local nExpFinal = nExp*nMul
		ModifyExp(nExpFinal)
		Msg2Player(format("Sau khi h祅h l� b竔 s� v韎 %s, c飊g nhau giao l璾 giang h� t﹎ c, v� th� n猲 EXP giang h� t╪g l猲 %d 甶觤.",szHighName, nExpFinal));
		if nMul > 1 then
			local szMsg = format("%s th祅h t﹎ th豱h gi竜 v� h鋍 v韎 %s, sau khi 頲 ch� 甶觤 th� v� c玭g ti課 b�, nh薾 頲 ph莕 thng g蕄 %d l莕, 頲 %d 甶觤 EXP.", 
				szName, szHighName, nMul, nExpFinal)
			Msg2Global(szMsg)
		end
	else
		if gf_Judge_Room_Weight(1, 100, "") ~= 1 then
			return 0
		end
		local nNum = 1*nMul
		AddItem(2,1,30913,nNum)
		Msg2Player(format("Sau khi h祅h l� b竜 s� v韎 %s, c飊g nhau giao l璾 giang h� t﹎ c, nh薾 頲 ph莕 thng %s.",szHighName, "уng T� Chi Nguy謓"))
		if nMul > 1 then
			local szMsg = format("%s th祅h t﹎ th豱h gi竜 v� h鋍 v韎 %s, sau khi 頲 ch� 甶觤 th� v� c玭g ti課 b�, nh薾 頲 ph莕 thng g蕄 %d l莕, 頲 %d %s", 
				szName, szHighName, nMul, nNum, "уng T� Chi Nguy謓")
			Msg2Global(szMsg)
		end
	end
	add_task("id_bai_time_today", 1)
	local nOldIdx = PlayerIndex
	PlayerIndex = nMasterIdx
	Msg2Player(format("%s h祅h l� b竔 s� v韎 b筺, c玭g l鵦 t╪g l猲 ng k�",szName))
	PlayerIndex = nOldIdx
	return 1
end

function handle_on_npc_talk(nIndex)
	local szDate = format("%s, %s~%s", isolate_get_str_date(20151225), isolate_get_str_date(20160101), isolate_get_str_date(20160103))
	local szTitle = format('<color=green>%s:<color> Trong th阨 gian %s, t譵 m閠 v� b籲g h鱱 giang h� v� t� i, th祅h vi猲 c蕄 th蕄 l祄 ng t竎 h祅h "L� ph衟" v韎 ngi ch琲 c蕄 cao  b祔 t� th祅h �, s� c� c� h閕 nh薾 頲 ph莕 thng EXP phong ph�! N誹 may m緉 th� c遪 c� th� 頲 ph莕 thng g蕄 i. цi v韎 cao th� giang h�  t chuy觧 sinh 8, n誹 c飊g giao l璾 giang h� t﹎ c, s� 頲 ph莕 thng <color=yellow>%s<color>! Ch� �: M鏸 ngi ch� 頲 h鋍 EXP giang h� %d l莕/ng祔!'
		, GetTargetNpcName(), szDate , "уng T� Chi Nguy謓", tCfg.max_bai_oneday)
    local tbSay = {
    	format("%s/nothing", "Bi誸 r錳!"),
    	}
    Say(szTitle, getn(tbSay), tbSay)
end
