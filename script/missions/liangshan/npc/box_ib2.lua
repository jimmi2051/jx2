--Include("\\script\\missions\\liangshan\\head.lua")
--Include("\\script\\missions\\liangshan\\mission\\tmission.lua")
--Include("\\script\\class\\clause3.lua")
--Include("\\script\\online\\zgc_public_fun.lua")
--Include("\\script\\lib\\lingshi_head.lua")
--Include("\\settings\\static_script\\lib\\itemfunctions.lua")
--Include("\\script\\online_activites\\award.lua")--额外奖励
--
--Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")
----聚义宝箱对应脚本
--msg = format("恭喜$n从梁山群英会中获得了$i", itemName);
--tClause1 = {
--	{{TTGLInfo[4]          , {TTGLInfo[1],TTGLInfo[2],TTGLInfo[3],1},msg},  20},
--	{{TTGLInfo[4]          , {TTGLInfo[1],TTGLInfo[2],TTGLInfo[3],2},msg},  50},
--	{{TTGLInfo[4]          , {TTGLInfo[1],TTGLInfo[2],TTGLInfo[3],3},msg},  30},
--}
--tClause2 = {
--	{{"小包的陨铁精石"    	,{2,1,3356,1},msg},    10.00*100,7},
--	{{"打包的陨铁"         	,{2,1,1050,1}},        5.00*100,7},
--	{{"7级灵石包"          	,{2,1,30305,1},msg}, 	10.00*100,7},
--	{{TTGLInfo[4]          	,{TTGLInfo[1],TTGLInfo[2],TTGLInfo[3],1},msg},    1.00*100 },
--	{{TTGLInfo[4]          	,{TTGLInfo[1],TTGLInfo[2],TTGLInfo[3],1},msg},    0.50*100 },
--	{{"打包的陨铁碎片"     	,{2,1,1049,1},msg},   	3.00*100,7},
--	{{"6级灵石包"          	,{2,1,30306,1},msg}, 	10.00*100,7},
--	{{"黄金大红包（空）"   	,{2,1,538,1},msg}, 	17.00*100,30},
--	{{"定魂陨铁神石"       	,{2,1,1067,1},msg},    3.00*100,30},
--	{{"大军功章"       		,{2,1,9998,1}},    	23.00*100 ,7},
--	{{"辉煌军功章"       	,{2,1,9977,1},msg},    10.00*100 ,7},
--	{{"凌波微步"       		,{0,112,78,1},msg},    1.00*100 },
--	{{"和氏璧"       		,{2,1,1001,1},msg},    2.50*100 ,7},
--	
--	{{"3级千幻刻板"       		,{2,1,30408,1}},    	1.00*100 ,30},
--	{{"15级强化卷"       		,{2,1,30427,1},msg},    	0.50*100 ,30},
--	{{"14级强化卷"       		,{2,1,30426,1},msg},    	1.00*100 ,30},
--	{{"3级磨刀石"       		,{2,1,30430,1}},    	1.50*100 ,7},
--}
--tClause3 = {
--	{{"磐龙璧"           	,{2,1,1000,1}},        15.00*100 ,7},
--	{{"军功章"       		,{2,1,9999,1},msg},    6.00*100 ,7},
--	{{"大人参果"           	,{2,0,553,1}},        	5.00*100 ,7},
--	{{"高级师门秘籍包"      ,{2,1,30627,1}},        5.00*100 ,7},
----	{{"金刚般若经"          ,{0,107,166,1}},      	0.29*100 },
----	{{"潜龙寂灭经"          ,{0,107,167,1}},      	0.29*100 },
----	{{"无尘菩提经"          ,{0,107,168,1}},      	0.29*100 },
----	{{"天罗连珠录"          ,{0,107,169,1}},      	0.29*100 },
----	{{"如意金顶秘籍"        ,{0,107,170,1}},      	0.29*100 },
----	{{"碧海绝音谱"          ,{0,107,171,1}},      	0.29*100 },
----	{{"混沌镇岳秘籍"        ,{0,107,172,1}},      	0.29*100 },
----	{{"揆天游龙秘籍"        ,{0,107,173,1}},      	0.29*100 },
----	{{"幻影迷踪秘籍"        ,{0,107,174,1}},      	0.29*100 },
----	{{"君子截风秘籍"        ,{0,107,175,1}},      	0.29*100 },
----	{{"镇军飞龙枪谱"        ,{0,107,176,1}},      	0.29*100 },
----	{{"穿云落虹秘籍"        ,{0,107,177,1}},      	0.29*100 },
----	{{"幽冥封魔录"          ,{0,107,178,1}},      	0.29*100 },
----	{{"灵蛊幻邪录"          ,{0,107,179,1}},      	0.29*100 },
----	{{"九天风雷诀"        ,{0,107,198,1}},      	0.29*100 },
----	{{"红尘醉梦谱"          ,{0,107,202,1}},      	0.29*100 },
----	{{"风花千叶谱"          ,{0,107,203,1}},      	0.29*100 },
--	{{"打包的陨铁碎片"     	,{2,1,1049,1},msg},   	5.00*100 ,7},
--	{{"斗魂"     			,{2,1,1157,1},msg},   	5.00*100 ,30},
--	{{"大军功章"       		,{2,1,9998,1}},      	5.00*100 ,7},
--	--{{"五行玄石"       		,{2,1,30302,100},msg},	3.00*100 },
--	{{"翻羽"               	,{0,105,15,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    5.00*100,45},
--	{{"超光"               	,{0,105,19,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    5.00*100,45},
--	{{"奔宵"               	,{0,105,16,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    5.00*100,45},
--	{{"腾雾"               	,{0,105,20,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    5.00*100,45},
--	{{"将军白马"           	,{0,105,34,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    5.00*100,45},
--	--{{"无痕水"       		,{2,1,503,1},msg},	3.00*100,30},
--	--{{"洗髓丹"       		,{2,0,136,1}},	2.00*100 ,30},
--	--{{"洗髓灵丹"       		,{2,0,137,1},msg},	1.00*100 ,7},
--	{{"种子包"       		,{2,1,30087,1}},	4.00*100 ,7},
--	{{"大般若种子"       	,{2,0,398,1}},	5.00*100 ,7},
--	{{"小般若种子"       	,{2,0,504,1}},	7.00*100 ,7},
--	
--	{{"2级千幻刻板"       		,{2,1,30407,1}},    	1.00*100 ,30},
--	{{"14级强化卷"       		,{2,1,30426,1},msg},    0.25*100 ,30},
--	{{"13级强化卷"       		,{2,1,30425,1}},    	0.50*100 ,30},
--	{{"2级磨刀石"       		,{2,1,30429,1}},    	1.00*100 ,7},
--	{{"刻板"       				,{2,1,30373,1}},    	1.25*100 },
--	
--	{{"3级铁晶"       		,{2,1,30535,1},msg},      	3.00*100},
--	{{"秘银锤"       		,{2,1,30539,1}},      	3.00*100},
--	{{"秘银钻"       		,{2,1,30538,1}},      	2.00*100},
--	{{"冰晶石"       		,{2,1,30554,1}},      	1.00*100},
--}
--tClause4 = {
--	{{"小白驹丸"          	,{2,1,30307,1}},		5.00*100 ,7},
--	{{"小三清丸"          	,{2,1,30308,1}},		5.00*100 ,7},
--	{{"小六神丸"          	,{2,1,30309,1}},		5.00*100 ,7},
--	{{"传功丹"         	 	,{2,1,30313,1}}, 		5.00*100 ,7},
--	{{"高级师门秘籍包"      ,{2,1,30627,1}},        2.80*100 ,7},
----	{{"金刚般若经"          ,{0,107,166,1}},		0.16*100 },
----	{{"潜龙寂灭经"          ,{0,107,167,1}},		0.16*100 },
----	{{"无尘菩提经"          ,{0,107,168,1}},		0.16*100 },
----	{{"天罗连珠录"          ,{0,107,169,1}},		0.16*100 },
----	{{"如意金顶秘籍"        ,{0,107,170,1}},		0.16*100 },
----	{{"碧海绝音谱"          ,{0,107,171,1}},		0.16*100 },
----	{{"混沌镇岳秘籍"        ,{0,107,172,1}},		0.16*100 },
----	{{"揆天游龙秘籍"        ,{0,107,173,1}},		0.16*100 },
----	{{"幻影迷踪秘籍"        ,{0,107,174,1}},	 	0.16*100 },
----	{{"君子截风秘籍"        ,{0,107,175,1}},		0.16*100 },
----	{{"镇军飞龙枪谱"        ,{0,107,176,1}},		0.16*100 },
----	{{"穿云落虹秘籍"        ,{0,107,177,1}},		0.16*100 },
----	{{"幽冥封魔录"          ,{0,107,178,1}},		0.16*100 },
----	{{"灵蛊幻邪录"          ,{0,107,179,1}},		0.16*100 },
----	{{"九天风雷诀"        ,{0,107,198,1}},      	0.16*100 },
----	{{"红尘醉梦谱"          ,{0,107,202,1}},      	0.16*100 },
----	{{"风花千叶谱"          ,{0,107,203,1}},      	0.16*100 },
--	--{{"五行玄石"         	,{2,1,30302,2}}, 	 	10.00*100 },
--	--{{"五行宝箱"         	,{2,1,30320,1}},		3.00*100 },
--	{{"消劫散"         		,{2,0,141,1}},			3.00*100 ,30},
--	{{"八宝粽子"         	,{2,1,1125,1}},			5.00*100 },
--	{{"梁山特产"         	,{2,1,30310,1}},		14.20*100 },
--	{{"培元丹"         		,{2,1,30351,1}},		10.00*100},
--	
--	{{"1级千幻刻板"       	,{2,1,30406,1}},    	0.50*100 ,30},
--	{{"1级磨刀石"       	,{2,1,30428,1}},    	0.50*100 ,7},
--	
--	{{"勇士勋章"       	,{2,1,30498,1}},    	10*100},
--	{{"1级铁晶"       	,{2,1,30533,1}},    	10*100},
--	{{"2级铁晶"       	,{2,1,30534,1}},    	5*100},
--	{{"千里传音符纸"       	,{2,1,3508,1}},    	10*100},
--	{{"洗尘丹"       	,{2,1,30613,1}},    	4*100},
--	{{"四灵归元丹"       	,{2,1,30352,1}},    5.00*100},
--}
--tClause5 = {
--	{{"武林早报"         	,{2,1,30314,1}},       20.00*100,7},
--	{{"师门圣物"         	,{2,1,30311,1}},      	20.00*100,7},
--	{{"小传功丹"          	,{2,1,30312,1}},      	18.00*100,7},
--	{{"修真要诀残页"        ,{2,1,30315,1}},      	10.00*100,7},
----	{{"金刚伏魔经"			,{0,107,1,1}},			0.14*100},
----	{{"金刚伏魔心法"		,{0,107,2,1}},			0.14*100},
----	{{"潜龙秘籍"			,{0,107,3,1}},			0.14*100},
----	{{"潜龙心法"			,{0,107,4,1}},			0.14*100},
----	{{"无尘秘籍"			,{0,107,5,1}},			0.14*100},
----	{{"无尘心法"			,{0,107,6,1}},			0.14*100},
----	{{"天罗秘籍"			,{0,107,7,1}},			0.14*100},
----	{{"天罗心法"			,{0,107,8,1}},			0.14*100},
----	{{"如意秘籍"			,{0,107,9,1}},			0.14*100},
----	{{"如意心法"			,{0,107,10,1}},			0.14*100},
----	{{"碧海谱"				,{0,107,11,1}},			0.14*100},
----	{{"碧海心法"			,{0,107,12,1}},			0.14*100},
----	{{"混沌秘籍"			,{0,107,13,1}},			0.14*100},
----	{{"混沌心法"			,{0,107,14,1}},			0.14*100},
----	{{"揆天秘籍"			,{0,107,15,1}},			0.14*100},
----	{{"揆天心法"			,{0,107,16,1}},			0.14*100},
----	{{"幻影秘籍"			,{0,107,17,1}},			0.14*100},
----	{{"幻影心法"			,{0,107,18,1}},			0.14*100},
----	{{"君子秘籍"			,{0,107,19,1}},			0.14*100},
----	{{"君子心法"			,{0,107,20,1}},			0.14*100},
----	{{"镇军秘籍"			,{0,107,21,1}},			0.14*100},
----	{{"镇军心法"			,{0,107,22,1}},			0.14*100},
----	{{"穿云秘籍"			,{0,107,23,1}},			0.14*100},
----	{{"穿云心法"			,{0,107,24,1}},			0.14*100},
----	{{"幽冥鬼录"			,{0,107,25,1}},			0.14*100},
----	{{"幽冥心法"			,{0,107,26,1}},			0.14*100},
----	{{"灵蛊秘籍"			,{0,107,27,1}},			0.14*100},
----	{{"灵蛊心法"			,{0,107,28,1}},			0.14*100},
----	{{"惊风秘籍"			,{0,107,180,1}},			0.14*100},
----	{{"惊风心法"			,{0,107,181,1}},			0.14*100},
----	{{"醉梦秘籍"			,{0,107,188,1}},			0.14*100},
----	{{"醉梦心法"			,{0,107,189,1}},			0.14*100},
----	{{"繁花秘籍"			,{0,107,190,1}},			0.14*100},
----	{{"繁花心法"			,{0,107,191,1}},			0.14*100},
----	{{"五行玄石"         	,{2,1,30302,1}},          9*100},
----	{{"五行宝箱"         	,{2,1,30320,1}},   	1.00*100 },
--	
--	{{"勇士勋章"       	,{2,1,30498,1}},    	4.80*100},
--	{{"1级铁晶"       	,{2,1,30533,1}},    	9*100},
--	{{"2级铁晶"       	,{2,1,30534,1}},    	0.70*100},
--	{{"洗尘丹"       	,{2,1,30613,1}},    	5*100},
--	{{"千里传音符纸"       	,{2,1,3508,1}},    	8*100},
--	{{"四灵归元丹"       	,{2,1,30352,1}},    2.00*100},
--	{{"培元丹"         		,{2,1,30351,1}},		2.50*100},
--}
----灵石增加
--function addLinshi(nLevel, nCount)
--	lspf_AddLingShiInBottleEx(nLevel,nCount)
--	local notice = gsub(msg, "\$n", GetName());
--	notice = gsub(notice, "\$i", format("%d颗%d级灵石", nCount, nLevel));
--	Msg2Global(notice);
--end
----物品增加
--function giveItem(self)
--	ItemCreate:create(self[1])
--	local notice = gsub(msg, "\$n", GetName());
--	notice = gsub(notice, "\$i", self[1]);
--	Msg2Global(notice);
--end
--
--function getLootSeting(bossLv)
--	local t = {tClause1,tClause2,tClause3,tClause4,tClause5}
--	tClause = t[bossLv];
--	if not tClause then
--		print(format("[getLootSeting] [error bossLv] [bossLv=%s]", tostring(bossLv)));
--		assert()
--	end
--	return tClause;
--end
--
--function getLootItem(bossLv)
--	local tClause = getLootSeting(bossLv);
--
--	local nMax = 0;
--	for i = 1, getn(tClause) do
--		nMax = nMax + tClause[i][2];
--	end
--	local rnd = random(1, nMax);
--	for i = 1, getn(tClause) do
--		rnd = rnd - tClause[i][2];
--		if rnd <= 0 then
--			return i, tClause[i][1];
--		end
--	end
--	print("[getLootItem] [error random] [nMax=%d, rnd=%d]", nMax, rnd);
--	assert();
--end
--
--function main()
--	chooseDaye();
--end
--
--function chooseDaye()
--	local nNpcIdx = GetTargetNpc();
--	local daye = GetUnitCurStates(nNpcIdx, 4);
--	daye = (daye == 0 and GetMissionV(MV_DAYE_2)) or daye;
--
--	local szMsg = "花费2个"..TJYLInfo[4].."开启箱子";
--	local tSel = {
--		"我要开启箱子/#IamDaye("..nNpcIdx..")",
--		"结束对话/nothing",
--	};
--
--	if 0 ==  daye then
--		Say(szMsg, getn(tSel), tSel);
--	else
--		speLoot(nNpcIdx);
--	end
--end
--
--function IamDaye(nNpcIdx)
--
--	if 1 ~= tMission:CheckTargetNpc(nNpcIdx) then return end
--
--	local daye = GetMissionV(MV_DAYE_2);
--
--	if 0 ~= daye then
--		Talk(1, "", "已经有人开此箱子了");
--		return 0;
--	end
--
--	local bossId = tMission:chooseBoss(2, 1);
--	local bossLv = tMission:getBossLv(bossId);
--	if not bossLv then
--		Talk(1, "", "无法开启此箱子，该箱子不存在！");
--		return 0;
--	end
--
--	if DelItem(T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3],N_CALL_BOSS_TIANJIAOLING_NEED) == 1 then
--		SetMissionV(MV_DAYE_2, PlayerIndex);
--		SetMissionV(MV_LAO_ER_2, PlayerIndex);
--		SetMissionV(MV_CUR_BOSS_ID_2, bossId);
--		if 1 == bossLv then
--			SetTask(VET_MS_TASKID_JUYILING, 0);
--		else
--			gf_ModifyTask(VET_MS_TASKID_JUYILING, N_CALL_BOSS_TIANJIAOLING_NEED);
--			_stat_when_ib_consume(N_CALL_BOSS_TIANJIAOLING_NEED)--IB消耗统计
--		end
--		AddUnitStates(nChestIndex, 4, PlayerIndex);
--		speLoot(nNpcIdx);
--	else
--		Talk(1, "", "你身上没有["..T_TIANJIAOLING[4].."]，不能开启<color=green>聚义宝箱<color>。["..TJYLInfo[4].."]可以通过<color=yellow>商城<color>获得");
--	end
--end
--
--function speLoot(nNpcIdx)
--
--	if 1 ~= tMission:CheckTargetNpc(nNpcIdx) then return end
--
--    local bossId = GetMissionV(MV_CUR_BOSS_ID_2);
--	local bossLv = tMission:getBossLv(bossId);
--	local daye = GetMissionV(MV_DAYE_2);
--	if daye == 0 then
--		daye = GetTeamMember(0);
--	end
--	local tSel = {
--			"结束对话/nothing",
--		}
--	local OldPlayerIndex = PlayerIndex;
--	if daye == PlayerIndex then
--		local player_name = ""
--		for i = 1,GetTeamSize() do
--			PlayerIndex = GetTeamMember(i);
--			if PlayerIndex ~= OldPlayerIndex then
--				player_name = GetName();
--				player_name = zgc_pub_name_replace(player_name,"/","-");
--				player_name = zgc_pub_name_replace(player_name,"|","-");
--				player_name = zgc_pub_name_replace(player_name,":","-");
--				tinsert(tSel, 1, "我要把奖励分配给"..player_name.."/#lootAwardOther("..PlayerIndex..","..nNpcIdx..")");
--			end
--		end
--		PlayerIndex = OldPlayerIndex;
--		tinsert(tSel, 1, "我要拾取奖励/#lootAward("..PlayerIndex..","..nNpcIdx..")");
--	end
--
--
--	local nLootItemId = GetMissionV(MV_LOOT_ID_2);
--	if nLootItemId == 0 then
--		nLootItemId = getLootItem(bossLv);
--		SetMissionV(MV_LOOT_ID_2, nLootItemId);
--	end
--
--	local tClause = getLootSeting(bossLv);
--	local tLootItem = tClause[nLootItemId][1];
--	local nCount = (tLootItem[2] and tLootItem[2][4]) or 1;
--	local msg = format("<color=yellow>[%s]x%d<color>",tLootItem[1], nCount);
--	Say("<color=green>宝箱<color>: 这里有"..msg, getn(tSel), tSel);
--end
--
--function lootAwardOther(player_index, box_index)
--
--	if 1 ~= tMission:CheckTargetNpc(box_index) then return end
--
--	local player_index_save = PlayerIndex
--	--判断该索引是否还是在该队伍中
--	local index_chg_chk_flag = 0
--	local team_size = GetTeamSize()
--	if team_size ~= 0 then
--		index_chg_chk_flag = zgc_pub_same_team_chk(player_index)
--	else
--		index_chg_chk_flag = 1
--	end
--	if index_chg_chk_flag ~= 1 then
--		Talk(1,"","<color=green>提示<color>：请重新检查您要分配的对象是否在您的<color=yellow>队伍<color>中！")
--		return
--	end
--	--分配对象的空间负重检测
--	PlayerIndex = player_index
--	local s_palyer_name = GetName()
--	if GetFreeItemRoom()  < 3 then
--		Talk(1,"","<color=green>提示<color>：您的<color=yellow>包裹<color>空间不足！")
--		PlayerIndex = player_index_save
--		Talk(1,"","<color=green>提示<color>：<color=green>"..s_palyer_name.."<color>的<color=yellow>包裹<color>空间不足，无法进行分配！")
--		return
--	end
--
--	PlayerIndex = player_index_save
--
--	lootAward(player_index, box_index)
--
--end
--
--function lootAward(player_index, box_index)
--
--	if 1 ~= tMission:CheckTargetNpc(box_index) then return end
--
--	local player_index_save = PlayerIndex
--
--	PlayerIndex = player_index;
--	if gf_JudgeRoomWeight(3+2, 100, "") ~= 1 then return end --预留两个空间给活动奖励
--	PlayerIndex = player_index_save;
--
--	local bossId = GetMissionV(MV_CUR_BOSS_ID_2);
--	local bossLv = tMission:getBossLv(bossId);
--
--	local nLootItemId = GetMissionV(MV_LOOT_ID_2);
--	if nLootItemId == 0 then
--		nLootItemId = getLootItem(bossLv);
--	end
--	local tLoot = getLootSeting(bossLv)[nLootItemId];
--	SetMissionV(MV_LOOT_ID_2, 0);
--	SetMissionV(MV_DAYE_2, 0);
--	SetMissionV(MV_LAO_ER_2, 0);
--
--	SetNpcLifeTime(box_index, 0);
--	PlayerIndex = player_index;
--	gf_SetLogCaption("liangshan:ib_box2");
--	local nItemIndex = Clause3.giveClause(tLoot[1]);
--	if tLoot[3] then
--		SetItemExpireTime(nItemIndex,tLoot[3]*DAY_SECOND_NUM)
--	end
--	gf_SetLogCaption("");
--	PlayerIndex = player_index_save;
-----开启聚义宝箱额外获得的奖励
--	vaf_liangshan_juyibox()
--	
--	--天罡令
--	if tLoot[1][1] == TTGLInfo[4] then
--		_stat_when_ib_produce(tLoot[1][2][4])--IB道具产出统计
--	end
--end
