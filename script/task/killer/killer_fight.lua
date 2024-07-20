-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 通缉任务杀手Npc战斗死亡脚本                  
-- Edited by starry night                                 
-- 2005/09/12 PM 14:17                                    
                                                          
-- ======================================================

--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");
Include("\\script\\lib\\lingshi_head.lua");

function OnDeath(NpcIndex)

local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
local nKillerName = "S竧 th� "..getKillerName(nSurnameID,nFirstnameID);
local nKillerParName = nKillerName.." ng h祅h ";
local nNum = random(3,5);--随机出现复仇同伴数量（3～5个）
local nKillerParModeID = getKillerParModeID();
local nKillerParMode = getKillerParMode(nKillerParModeID);
local nMapID,nWx,nWy = GetWorldPos();
local i = 0;
local argKillerParIndex = {};
local nKillerIndex = GetTask(TASK_KILLER_NPCINDEX_ID);
local NpcIndex = tonumber(NpcIndex)
local nState = GetTask(TASK_KILLER_STATE_ID);

	SetNpcLifeTime(NpcIndex,0);--使得尸体消失
	SetNpcScript(NpcIndex,"");--撤销该Npc所挂脚本
	
	if nState == 1 and nKillerIndex == NpcIndex then--判断杀死该杀手的玩家是否为领该任务的玩家	 
	
		SetTask(TASK_KILLER_STATE_ID,2);--完成任务设置变量值为2
		
		local nExp = GetLevel()*GetLevel()*12;
		ModifyExp(nExp);
		Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒");
		
		TaskTip("Nhi謒 v� ho祅 th祅h! Xin n g苝 B� u l穘h thng!");
		
		--移除时间触发器
		RemoveTrigger(GetTrigger(500));
	
		--30%触发特殊事件
		if random(1,100) <= 30 then
		
			--80%出现复仇同伴then
			if random(1,100) <= 80 then
				
				Talk(1,"","<color=green>"..nKillerName.."<color>: уng h祅h c馻 ta s� kh玭g tha cho ngi厖");
				
				nNum,argKillerParIndex = CreateNpc(nKillerParMode,nKillerParName,nMapID,nWx,nWy,-1,nNum,1,200);
				
				nNum = nNum-1;
				
				--设置杀手同伴脚本
				for i=0,nNum do
				
					SetNpcScript(argKillerParIndex[i], "\\script\\task\\killer\\killer_par_fight.lua");
					SetNpcLifeTime(argKillerParIndex[i],600);

				end;
				
			else
				Talk(2,"","<color=green>"..nKillerName.."<color>: Ta c� l祄 ma c騨g s� kh玭g tha cho ngi厖","B筺 nh b筰 <color=yellow>"..nKillerName.."<color> l蕐 頲 1 <color=yellow>l謓h b礽 S竧 th�<color>.");
				--掉落杀手令
				AddItem(2,1,195,1,1);
			end;
			
		else
		
			Talk(1,"","<color=green>"..nKillerName.."<color>: Ta c� l祄 ma c騨g s� kh玭g tha cho ngi厖");
		
		end;
		local nLevel = GetLevel();
		if random(1,100) <= 10 then
			local nLSLevel = 0;
			if nLevel <= 30 then
				nLSLevel = 1;		
			elseif nLevel <= 40 then
				nLSLevel = random(1,2);
			elseif nLevel <= 50 then
				nLSLevel = random(1,3);
			elseif nLevel <= 60 then
				nLSLevel = random(1,4);
			elseif nLevel <= 80 then
				nLSLevel = random(1,5);
			elseif nLevel <= 100 then
				nLSLevel = random(2,5);
			end;
			lspf_AddLingShiInBottle(nLSLevel,1);
			if nLSLevel ~= 0 then
				Msg2Player("B筺 nh薾 頲 1 "..nLSLevel.." (c蕄) Linh th筩h,  nh藀 v祇 T� Linh жnh");		
			end;
		end;
	end;
end;
