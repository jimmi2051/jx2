-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC血鳞毒蟒召唤和死亡Script
-- By StarryNight
-- 2005/12/31 PM 14:30

--乙酉年  戊子月 己丑日 
--宜: 纳采 订盟 嫁娶 祭祀 祈福 安香 出火 出行 会亲友 经络 求医 治病 解除 拆卸 起基 修造 动土 定磉 扫舍 栽种 牧养 造畜稠 
--忌: 斋醮 作梁 掘井 行丧 安葬 
--吉神宜趋: 阴德 守日 吉期 六合 不将 普护 宝光  
--凶神宜忌: 四离 叁丧  
--每日胎神占方: 占门厕外正北 
--五行: 霹雳火  除执位 
--冲: 冲羊(癸未)煞东 
--彭祖百忌: 己不破券二比并亡 丑不冠带主不还乡 

-- ======================================================
-- 引用剧情任务文件
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\大理\\lv20\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();
local nTime = GetTime() - GetTask(1321);

	if nMapID == 407 and GetFightState() == 1 then
		if GetTask(TASK_DL_LV20_ID) == 3 then
			if nTime >= 3600 then
				local nDMIndex = CreateNpc("Huy誸 L﹏ чc M穘g","Huy誸 L﹏ чc M穘g",nMapID,nWx,nWy,-1,1,1,50);
				SetNpcLifeTime(nDMIndex,900); 
				SetNpcScript(nDMIndex,"\\script\\task\\world\\大理\\Lv20\\血鳞毒蟒.lua");
				ChangeNpcToFight(nDMIndex);
				TaskTip("B筺  g鋓 頲 чc m穘g, mau gi誸 ch髇g.");
				Msg2Player("B筺  g鋓 頲 чc m穘g, mau gi誸 ch髇g.");
				DelItem(2,0,365,1);--药血
				SetTask(1321,GetTime());
				return
			else
				local strTalk = {
					"M鏸 l莕 g鋓 чc m穘g, c竎h m閠 gi� sau m韎 c� th� g鋓 l筰."
				};
				TalkEx("",strTalk);
			end
		else	
			return
		end
	else
		local strTalk = {
			"� y kh玭g th� g鋓 Huy誸 L﹏ чc M穘g!"
		};
		TalkEx("",strTalk);
		end;
	return
end;

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
		
	SetNpcLifeTime(index,15);--使得尸体消失
	
	if nMemCount == 0 then -- 玩家未组队
		if GetTask(TASK_DL_LV20_ID) == 3 then
			SetTask(TASK_DL_LV20_ID,4);
			TaskTip("Di謙 頲 Huy誸 L﹏ чc m穘g, quay v� g苝 Cao Th╪g Tuy襫.");
			Msg2Player("Di謙 頲 Huy誸 L﹏ чc m穘g, quay v� g苝 Cao Th╪g Tuy襫.");
		end;	
  else
    for i=1,nMemCount do
       PlayerIndex = GetTeamMember(i);
       local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
       local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
       if GetTask(TASK_DL_LV20_ID) == 3 and nDist >= 0 and nDist <= 50 then
       	SetTask(TASK_DL_LV20_ID, 4);
       	Msg2Player("Di謙 頲 Huy誸 L﹏ чc m穘g, quay v� g苝 Cao Th╪g Tuy襫.");
       	TaskTip("Di謙 頲 Huy誸 L﹏ чc m穘g, quay v� g苝 Cao Th╪g Tuy襫.");
       end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
  end;
end