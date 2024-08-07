--=============================================
--create by baiyun 2009.4.9
--describe:越南版4月份种树活动
--=============================================
Include("\\script\\online_activites\\award.lua")
Include("\\script\\online\\viet_2009_4\\planttrees\\planttrees_head.lua")
Include("\\script\\lib\\globalfunctions.lua");

--------------------------------------
--main()
--主函数
--------------------------------------
function main()
	local nPlantTimePassed = 0;
	local nWaterTimePassed = 0;
	local npcIdx, npcModel, npcName = GetTriggeringUnit();--获得当前触发器里的NPC索引，模板ID，显示名字
	if npcIdx == 0 then
		WriteLog("[Ho箃 ng tr錸g c﹜ th竛g 4  sai s鉻]:"..GetName().."Trong l骳 ti c﹜, GetTriggeringUnit th� nh蕋 s� tr� v� 0");
		return 0;
	end
	local nNameLen = strlen(GetName());
	local bJudgeByName = 0;
	if GetName() == strsub(npcName, 1, nNameLen) then --用名字来判断是不是玩家的树
		bJudgeByName = 1;
	end
	local bIsTree = 0;
	for i = 1, getn(TREE_TYPE) do
		if npcModel == TREE_TYPE[i][1] then
			bIsTree = 1;
			break;
		end
	end
	if bIsTree == 0 then
		SetNpcScript(npcIdx, "");
		WriteLog("[L鏸 khi tr錸g c﹜ th竛g 4]:NPC:"..npcName.."L鏸 files g鑓");
		return 0;
	end
	local npcTreeIndex = GetTargetNpc(); --获取玩家的动作对象Npc
	if npcTreeIndex == 0 then
		WriteLog("[Ho箃 ng tr錸g c﹜ th竛g 4  sai s鉻]:"..GetName.."Khi ti nc, GetTargetNpc tr� quay l筰 l� 0");
		return 0;
	end;
	if bJudgeByName == 0 then
		if npcTreeIndex ~= GetTask(TASK_TREE_INDEX) then
			Msg2Player("Зy kh玭g ph秈 l� c﹜ b筺 tr錸g");
			return 0;
		end
	end
	local nTreeGrow = GetTask(TASK_TREE_GROW);
	nPlantTimePassed = GetTime() - GetTask(TASK_PLANT_TREE_TIME);
	nWaterTimePassed = GetTime() - GetTask(TASK_WATER_TREE_TIME);
	
	local sSysSth = "";
	local selTab = {};
	--如果是不死树
	if GetTask(TASK_PLANT_TREE_TYPE) == 2 then
		if nPlantTimePassed < 240 then
			Talk(1, "", "C﹜ B蕋 T� v蒼 ch璦 trng th祅h, b﹜ gi� kh玭g th� thu ho筩h 頲, i <color=yellow>" .. 240 - nPlantTimePassed .. " gi﹜<color> h穣 ti誴 t鬰 thu ho筩h");
			return 0;
		else
			tinsert(selTab, "B﹜ gi� thu ho筩h /getTree");
			tinsert(selTab, "ьi m閠 l骳 h穣 thu ho筩h ti誴/doNothong");
			sSaySth = "C﹜  trng th祅h, mu鑞 thu ho筩h b﹜ gi�? N誹 nh�<color=yellow>" .. 300 - nPlantTimePassed .. "<color> gi﹜ sau kh玭g thu ho筩h, c﹜ s� t� ng ch誸 甶";
		end
	else
		if nTreeGrow == 1 then
			if nPlantTimePassed	< TREE_PARAM[nTreeGrow][3] then
				Talk(1, "", "C莕 ph秈 i th猰 <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][3] - nPlantTimePassed ..
						 "<color> gi﹜ m韎 c� th� ti nc, c� 甶襲 ng c� ch箉 甶 qu� xa, n誹 nh� <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][2] - nPlantTimePassed .. 
						 "<color> gi﹜ sau kh玭g ti nc, c﹜ thi誹 nc s� ch誸 甶."
				);	
				return 0;
			end
		end
		if nTreeGrow < 6 and nTreeGrow ~= 1 then
			if nPlantTimePassed > TREE_PARAM[nTreeGrow - 1][3] and nPlantTimePassed	<= TREE_PARAM[nTreeGrow][3] then
				Talk(1, "", "C莕 ph秈 i th猰 <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][3] - nPlantTimePassed ..
						 "<color> gi﹜ m韎 c� th� ti nc, c� 甶襲 ng c� ch箉 甶 qu� xa, n誹 nh� <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][2] - nPlantTimePassed .. 
						 "<color> gi﹜ sau kh玭g ti nc, c﹜ thi誹 nc s� ch誸 甶."
				);	
				return 0;
			end
		end
		if nTreeGrow == 6 then
			if nPlantTimePassed < TREE_PARAM[nTreeGrow][3] then
				Talk(1, "", TREE_TYPE[GetTask(TASK_PLANT_TREE_TYPE)][2] .. "V蒼 ch璦 trng th祅h, n猲 kh玭g th� thu ho筩h b﹜ gi� 頲<color=yellow>" ..TREE_PARAM[nTreeGrow][3] - nPlantTimePassed .. " gi﹜<color> h穣 ti誴 t鬰 thu ho筩h");
				return 0;
			end
			tinsert(selTab, "B﹜ gi� thu ho筩h /getTree");
			tinsert(selTab, "ьi m閠 l骳 h穣 thu ho筩h ti誴/doNothong");
			sSaySth = "C﹜  trng th祅h, mu鑞 thu ho筩h b﹜ gi�? N誹 nh�<color=yellow>" .. getDateTimeString(TREE_PARAM[nTreeGrow][2] - nPlantTimePassed) .. "<color> gi﹜ sau kh玭g thu ho筩h, c﹜ s� t� ng ch誸 甶";
		else
				tinsert(selTab, "Ti nc (c莕 " .. TREE_PARAM[nTreeGrow + 1][4] .. " ph莕 L� Th駓)/giveWater");
				tinsert(selTab, "Sau n祔 h穣 ti./doNothing");
				sSaySth = TREE_TYPE[nTreeGrow][2] .. " 產ng c莕 ti L� Th駓, c� mu鑞 ti kh玭g? N誹 sau <color=yellow>" .. getDateTimeString(TREE_PARAM[nTreeGrow][2] - nPlantTimePassed) .. "<color> gi﹜ sau kh玭g ti nc, c﹜ thi誹 nc s� ch誸 甶.";
		end
	end
	
	Say(sSaySth, getn(selTab), selTab);
end

--------------------------------------
--giveWater()
--给树浇水
--------------------------------------
function giveWater()
	local nTreeGrow = GetTask(TASK_TREE_GROW);
	local npcTreeIndex = GetTask(TASK_TREE_INDEX);
	if npcTreeIndex == 0 then
		WriteLog("[Ho箃 ng tr錸g c﹜ th竛g 4  sai s鉻]:" .. GetName() .. "L骳 ti nc, nhi謒 v� bi課 lng TASK_TREE_INDEX l� 0");
		return 0;
	end
	if DelItem(2, 0, 351, TREE_PARAM[nTreeGrow][4]) ~= 1 then
		Talk(1, "", "Kh玭g  L� Th駓!");
		return 0;
	end

	SetNpcLifeTime(npcTreeIndex, TREE_PARAM[nTreeGrow + 1][2] - (GetTime() - GetTask(TASK_PLANT_TREE_TIME)));
	SetTask(TASK_TREE_GROW, nTreeGrow + 1);
	SetTask(TASK_WATER_TREE_TIME, GetTime());
	Talk(1, "", "Ti nc th祅h c玭g!");
end

--------------------------------------
--getTree()
--拔树
--------------------------------------
function getTree()

-----判断背包和负重------------------------
	if gf_Judge_Room_Weight(4, 20, "Xin l鏸, ") == 0 then
		return 0
	end
	
	local npcTreeIndex = GetTargetNpc();
	if npcTreeIndex == 0 then
		WriteLog("[Ho箃 ng tr錸g c﹜ th竛g 4  sai s鉻]:" .. GetName() .. "L骳 nh� c﹜, GetTargetNpc tr� quay l筰 l� 0");
		return 0;
	end
	local nTreeType = GetTask(TASK_PLANT_TREE_TYPE);
	if nTreeType ~= 1 and nTreeType ~= 2 and nTreeType ~= 3 and nTreeType ~= 4 and nTreeType ~= 5 then
		WriteLog("[Ho箃 ng tr錸g c﹜ th竛g 4  sai s鉻]:" .. GetName() .. "Trong l骳 thu ho筩h thu 頲 lo筰 c﹜ kh玭g ng");
		return 0;
	end

	SetNpcScript(npcTreeIndex, "");
	SetNpcLifeTime(npcTreeIndex, 0);
	SetTask(TASK_TREE_INDEX, 0);
	SetTask(TASK_TREE_GROW, 0);
	SetTask(TASK_WATER_TREE_TIME, 0);
	
	Give_Zhongzi2_Award();
	FireEvent("event_mission_task_award", "planttree", "plantseedtree", 0)
			
-----给经验奖励----------------------
	local nRand = 0;
	local nExp = 0;
	if nTreeType == 1 then			--枯干树
		nExp = 100000;
	elseif nTreeType == 2 then	--不死树
		nExp = 200000;	
	elseif nTreeType == 3 then	--白银树
		nRand = PlantTree_GetRandItem(WHITE_SILVER_TREE_EXP_REWARD_PARAM);
		nExp = WHITE_SILVER_TREE_EXP_REWARD_PARAM[nRand][1];
	elseif nTreeType == 4 then	--黄金树
		nRand = PlantTree_GetRandItem(YELLOW_GOLDEN_TREE_EXP_REWARD_PARAM);
		nExp = YELLOW_GOLDEN_TREE_EXP_REWARD_PARAM[nRand][1];
	else 												--白金树
		nRand = PlantTree_GetRandItem(WHITE_GOLDEN_TREE_EXP_REWARD_PARAM);
		nExp = WHITE_GOLDEN_TREE_EXP_REWARD_PARAM[nRand][1];
	end
	
	ModifyExp(nExp);
	Msg2Player("B筺 nh薾 頲 " .. nExp.." 甶觤 kinh nghi謒");
	WriteLog("[Ho箃 ng tr錸g c﹜ th竛g 04]:" .. GetName() .. "Nh薾 頲 " .. nExp.. " 甶觤 kinh nghi謒");
	

-----给物品奖励，只有黄金树和白金树才给
	if nTreeType == 4 or nTreeType == 5 then
		local nMainType = 0;
		local nSecondryType = 0;
		local nDetailType = 0;
		local nCount = 1;
		local sItemName = "";
		local nLimitFlag = 0;
		local nLimitTime = 0;
		local nItem = 0;
		local nproperty = 0;
		local nReturn = 0;
		local nIndex = 0;
		
		if nTreeType == 4 then										-- 黄金树
			nItem = PlantTree_GetRandItem(GOLDEN_TREE_REWARD_ITEM_PARAM);
			nMainType = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][3];
			nSecondryType = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][4];
			nDetailType = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][5];
			nCount = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][7];			
			sItemName = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][1];
			nLimitTime = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][6];
		elseif nTreeType == 5 then								--白金树
			nItem = PlantTree_GetRandItem(WHITE_TREE_REWARD_ITEM_PARAM);
			nMainType = WHITE_TREE_REWARD_ITEM_PARAM[nItem][3];
			nSecondryType = WHITE_TREE_REWARD_ITEM_PARAM[nItem][4];
			nDetailType = WHITE_TREE_REWARD_ITEM_PARAM[nItem][5];
			nCount = WHITE_TREE_REWARD_ITEM_PARAM[nItem][7];			
			sItemName = WHITE_TREE_REWARD_ITEM_PARAM[nItem][1];
			nLimitTime = WHITE_TREE_REWARD_ITEM_PARAM[nItem][6];
			if nItem >= 1 and nItem <= 5 then
				nproperty = 1;
			end
		end
		
		if nproperty == 1 then
			nReturn, nIndex = AddItem(nMainType, nSecondryType, nDetailType, nCount, 1, -1, -1, -1, -1, -1, -1);
		else
			nReturn, nIndex = AddItem(nMainType, nSecondryType, nDetailType, nCount);
		end
		
		if nReturn == 1 then
			if nLimitTime ~= 0 then
				SetItemExpireTime(nIndex, nLimitTime);
			end
			Msg2Player("B筺 nh薾 頲 " .. nCount .. "c竔" .. sItemName);
			WriteLogEx("Hoat dong thang 4",TREE_TYPE[nTreeType][2],nCount,sItemName)
		end
	end
	
-----白银树给校旗箱奖励
	if nTreeType == 3 then
		nRand = random(1, 100);
		if nRand > 0 and nRand <= 40 then
			if AddItem(2, 1, 30079, 100) == 1 then
				Msg2Player("B筺 nh薾 頲 " .. "100" .. "c竔" .. "Rng Hi謚 K�");
				WriteLogEx("Hoat dong thang 4","C﹜ B筩h Ng﹏",100,"Rng Hi謚 K�")
			end
		elseif nRand > 40 and nRand <= 50 then
			if AddItem(2, 1, 30079, 200) == 1 then
				Msg2Player("B筺 nh薾 頲 " .. "200" .. "c竔" .. "Rng Hi謚 K�");
				WriteLogEx("Hoat dong thang 4","C﹜ B筩h Ng﹏",200,"Rng Hi謚 K�")
			end			
		end
	end
	
end