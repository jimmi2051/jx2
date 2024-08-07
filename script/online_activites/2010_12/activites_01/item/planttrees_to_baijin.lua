--=============================================
--create by baiyun 2009.5.29
--describe:越南版7月份活动之五种树
--应越南方要求，获得白金树的概率是100%，但是其他流程一样，所以该文件根据\script\online\viet_event\200907\5\planttrees_process.lua
--=============================================
Include("\\script\\online\\viet_event\\200907\\5\\planttrees_head.lua")

-----------------------------------------------
--OnUse()
--点击树种触发事件
-----------------------------------------------
function OnUse(nItemIdx)
-----检查是否符合种树的条件
	if checkEventDate() == 0 then
		Talk(1, "", "Th阨 gian ho箃 ng  h誸.");
		return 0;
	end
--	if checkEventTime() == 0 then
--		Talk(1, "", "种树时间为00:00 – 12:00和17:00 – 00:00两个时间段");
--		return 0;
--	end
	
	if GetLevel() < PLANT_TREE_ROLE_LEVEL_LIMIT then
		Talk(1, "", "V蒼 ch璦 t n c蕄 <color=yellow>" .. PLANT_TREE_ROLE_LEVEL_LIMIT .. "<color> c蕄 kh玭g th� tr錸g c﹜");
		return 0;
	end
	if checkPlaceMainCity() == 0 then
		Talk(1, "", "мa 甶觤 tr錸g c﹜ kh玭g th輈h h頿");
		return 0;
	end
-----种树的日期检查，如果今天第一次种树，表示现在可以种树了，则清空任务变量-----
-----将种树的数量设为0，种树日期设为今天，种下树的时间和浇水时间设为现在--------
	local nDate = tonumber(date("%y%m%d"));
--如果今天还没有种树，则表示可以种树
	if GetTask(TASK_PLANT_TREE_DATE) < nDate then 
		SetTask(TASK_PLANT_TREE_COUNT, 0);
		SetTask(TASK_WATER_TREE_TIME, 0);
		SetTask(TASK_PLANT_TREE_TIME, 0);
	else
-----检查今天种的树是否已经到允许的最大数量--------------------------------------
		if GetTask(TASK_PLANT_TREE_COUNT) >= PLANT_TREE_LIMIT then
			Talk(1, "", "H玬 nay b筺  tr錸g <color=yellow>".. GetTask(TASK_PLANT_TREE_COUNT) .."<color> c﹜ r錳, i ngay mai h穣 ti誴 t鬰 nh�.");
			return 0;
		end
-----检查是否已经种下一棵树了----------------------------------------------------
		for i = 1, 6 do
			if GetTask(TASK_TREE_GROW) == i and GetTime() - GetTask(TASK_PLANT_TREE_TIME) < TREE_PARAM[i][2] and GetTask(TASK_WATER_TREE_TIME) ~= 0 then
				Talk(1, "", "Чi hi謕  tr錸g 1 c﹜ r錳");
				return 0;
			end
		end
		if GetTask(TASK_PLANT_TREE_TYPE) == 2 and GetTime() - GetTask(TASK_PLANT_TREE_TIME) < 300 then--如果种下不死树，则在没拨之前，都不能种别的树
				Talk(1, "", "Чi hi謕  tr錸g 1 c﹜ r錳");
				return 0;
		end
-----检查离上次种树是否已经过了PLANT_TREE_INTERVAL这么长时间---------------------
		if GetTime() - GetTask(TASK_PLANT_TREE_TIME) < PLANT_TREE_INTERVAL then
			Talk(1, "", "Th阨 gian gi穘 c竎h gi鱝 hai l莕 tr錸g c﹜ l� <color=yellow>" .. PLANT_TREE_INTERVAL .. " gi﹜.");
			return 0;
		end
	end
-----可以种树了------------------------------------------------------------------
	local selTab = {
				"H穣 mau tr錸g c﹜/#plantTree("..nItemIdx..")",
	 			"Sau n祔 tr錸g s� t鑤 h琻!/doNothing"
	 		}
	Say("Чi hi謕 mu鑞 tr錸g c﹜?", getn(selTab), selTab);		 
end

---------------------------
--plantTree()
--种树操作
---------------------------
function plantTree(nItemIdx)
	local nDate = tonumber(date("%y%m%d"));
-----删除身上的一个树种-------------------------------------------------------------------------
	if DelItemByIndex(nItemIdx, 1) == 1 then
		local nMapID, nMapX, nMapY = GetWorldPos();
-----此处运用树出现的概率来得到种下树的类型-----------------------------------------------------
		local nRand = 0;
		local nTreeType = 0;
		local nMin = 0;
	

--		nRand = random(1, 100);
--		if nRand > 0 and nRand <= TREE_TYPE[5][3] then
--			nMin = TREE_TYPE[5][3];
--			nTreeType = 5;
--		elseif nRand > nMin and nRand <= TREE_TYPE[4][3] + nMin then
--			nTreeType = 4;
--			nMin = nMin + TREE_TYPE[4][3];
--		elseif nRand > nMin and nRand <= TREE_TYPE[1][3] + nMin then
--			nTreeType = 1;
--			nMin = nMin + TREE_TYPE[1][3];
--		elseif nRand > nMin and nRand <= TREE_TYPE[2][3] + nMin then
--			nTreeType = 2;
--			nMin = nMin + TREE_TYPE[2][3];
--		else
--			nTreeType = 3;
--		end
                --by xiongyizhi 不用随机了，直接给定是白金
                nTreeType = 5;
		
		local npcTreeIndex = CreateNpc(TREE_TYPE[nTreeType][1], GetName().." tr錸g "..TREE_TYPE[nTreeType][2], nMapID, nMapX, nMapY);
		if npcTreeIndex == 0 then
			WriteLogEx(g_viet0908_event_title, "Tr錸g c﹜", nil, nil, nil, nil, nil, "Ham so CreatNPC tro ve 0. Nhap ham so Create:"
								 ..TREE_TYPE[nTreeType][1]..", " ..GetName().. " tr錸g "
								  ..TREE_TYPE[nTreeType][2].. ", " ..nMapID.. "," ..nMapX.. "," ..nMapY);
		end

-----如果获得白金树，则向全世界发公告
		if nTreeType == 5 then
			AddGlobalNews("Ch骳 m鮪g  "..GetName().." Х nh薾 頲." .. "C﹜ B筩h Kim" .. "T筰".. CITY_NAME_ID[GetWorldPos()]);
		end
		
-----设置树的存活时间----------------------------------------------------------------------------		
		SetTask(TASK_PLANT_TREE_TYPE, nTreeType);
		if nTreeType == 2 then
			SetNpcLifeTime(npcTreeIndex, TREE_PARAM[6][2]);--如果是不死树，不用露水浇灌，生存时间直接是300秒
		else
			SetNpcLifeTime(npcTreeIndex, TREE_PARAM[1][2]);--刚种下肯定是第一阶段
		end
		SetTask(TASK_TREE_INDEX, npcTreeIndex);
		SetTask(TASK_TREE_GROW, 1);
		SetTask(TASK_WATER_TREE_TIME, GetTime());
		SetNpcScript(npcTreeIndex, "\\script\\online\\viet_event\\200907\\5\\tree_npc.lua");
		SetTask(TASK_PLANT_TREE_DATE, nDate);
		SetTask(TASK_PLANT_TREE_COUNT, GetTask(TASK_PLANT_TREE_COUNT) + 1);
		SetTask(TASK_PLANT_TREE_TIME, GetTime());
		Say("H玬 nay, y l� l莕 th� <color=yellow>"..GetTask(TASK_PLANT_TREE_COUNT).."<color> l莕 tr錸g c﹜, h玬 nay c遪 c� th� tr錸g <color=yellow>"..PLANT_TREE_LIMIT - GetTask(TASK_PLANT_TREE_COUNT).."<color> c﹜. N誹 nh� " .. TREE_PARAM[1][2] .. " gi﹜ kh玭g ti nc, c﹜ s� t� ng ch誸 甶.", 0);
	end
end
