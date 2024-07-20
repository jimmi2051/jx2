
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 随机任务头文件
-- Edited by peres
-- 2005/08/08 PM 13:45

-- 只有晚上他们是在一起的
-- 他靠近她，拥抱她
-- 他的手指和皮肤
-- 她看着他，心里柔软而疼痛
-- 她想，她还是爱他
-- 她不想抱怨什么
-- 每天晚上他们都在做爱
-- 她不知道，除了这种接触，她的安全感和温暖，还能从哪里取得
-- 她喜欢那一瞬间。仿佛在黑暗的大海上，漂向世界的尽头

-- ======================================================

-- 读入随机任务头文件
Include("\\script\\task\\random\\task_head.lua");
Include("\\script\\item\\item_billing\\shimenqingyuanshu.lua");

function main()

local nMap, nX, nY = GetWorldPos();
local nRandom = 1;

	if GetTime() - GetTask(USE_TIME) < 86400 then
		nRandom = ADD_RATE;
	end
	
	-- 三分之一的概率触发随机事件
	if random(1,3) >= nRandom then
		return	
	end;

	-- 如果还没有入门派就不触发了
	if GetPlayerFaction()==0 then return end;
	
	-- 如果获取战斗状态为 0 那也不触发
	if GetFightState()==0 then return end;
	
	-- 如果地图ID大于７００就不触发（大于７００的地图为特殊地图）
	if nMap > 700 then
		return
	end
	if CreateTask() == 1 then	--创建成功后才发通知　edited by yanjun 06-11-15
		RandomTaskTip("B筺 nh薾 頲 nhi謒 v� s� !");
		Msg2Player("N誹 li猲 t鬰 2 l莕 kh玭g th� ho祅 th祅h nhi謒 v� s� ph� giao s� b� m蕋 1 甶觤 danh v鋘g!");
	end;
end;


function GetRandomTimer()
	return 3600;
end;