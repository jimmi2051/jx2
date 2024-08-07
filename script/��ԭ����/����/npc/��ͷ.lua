-- ====================== 文件信息 ======================             
             
-- 剑侠情缘onlineII 通缉任务实体处理文件             
-- Edited by Starry              
-- 2005/09/05 PM 16:21             
             
-- ======================================================             

--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");

function main()

	local strButouTitle = "<color=green>B� u<color>:";
	local task_state = GetTask(TASK_KILLER_STATE_ID);
	local nLevel = GetLevel();
	
	if random(1,20) == 1 then
		NpcChat(GetTargetNpc(),"Nghe n鉯 tr猲 ngi c馻 b鋘 s竧 th� Л阯g c騨g c� Linh Th筩h, thi誹 hi謕 ph秈 theo d鈏 b鋘 ch髇g!");
	end;
	
	--接收任务的等级最低为10级
	if nLevel >= 10 then
	
		if task_state == 0 then
			Say(strButouTitle.."G莕 y s� t閕 ph筸 kh緋 n琲 kh玭g ng鮪g t╪g l猲, kh玭g bi誸 C竎 h� c� th� ra tay tng tr� gi髉 Quan ph� b総 ch髇g quy 竛?",
				2,
				"Ngi luy謓 v� nh� ch髇g ta sao c� th� ng l祄 ng�!/Task_Confirm",
				"T筰 h� c遪 c� chuy謓 ph秈 l祄!/Taks_Exit");	
		end;
		
		if task_state >= 1 then
		
			local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
			local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
			local nKillerName = getKillerName(nSurnameID,nFirstnameID);
			
			local nPosID = GetTask(TASK_KILLER_MAP_ID);
			local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);
			
			Say(strButouTitle.."C竎 h� c� ph秈  gi髉 ta nh b筰 s竧 th� xung quanh <color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color> (s竧 th�) <color=yellow>"..nKillerName.."<color>?",
				3,
				"Ta  gi誸/Task_Finish",
				"T筸 th阨 ch璦/Taks_Exit",
				"Ta kh玭g mu鑞 gi誸/Task_Cancel");		
		end;
	
	else
		Say("Ch� ng c蕄 c馻 ngi t <color=yellow>c蕄 10<color> h穣 n t譵 ta!",0)
			
	end;
end;

--接受任务
function Task_Confirm()

	local nKillerName = "";
	local nKillerMode = "";
	local nMapName = "";
	local nMapID = 0;
	local nWx,nWy,nMx,nMy = 0,0,0,0;
	local strButouTitle = "<color=green>B� u<color>:";
	local nDoNum = GetTask(TASK_KILLER_DONUM);
	local nTriggerID = 0;
	local nCustomID = 0;
	
	if Is_1stTask() == 1 then --进入游戏第一次做任务
	
		--生成一个杀手数据
		nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();

		Say(strButouTitle.."Theo tin th竚 b竜, s竧 th� <color=yellow>"..nKillerName.."<color> g莕 y hay xu蕋 hi謓 t筰 <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. H穣 mau 甶 di謙 tr�!",0);

		SetTask(TASK_KILLER_STATE_ID,1);--接受一个通缉任务，置变量为 1
		SetTask(TASK_KILLER_DONUM,1);--记录接获任务次数	
		SetTask(TASK_PLAYER_LEVEL,GetLevel());--记录玩家接获任务时的等级
		
		--生成时间触发器，计数值为900
		CreateTrigger(2,400,500);
		ContinueTimer(GetTrigger(500));
		
		--生成地图触发器
		nTriggerID,nCustomID = GetTriggerID(nMapID);
		CreateTrigger(2,nTriggerID,600);
		
		--保存地图触发器ID
		SetTask(TASK_TRIGGER_ID,nTriggerID);
		
		if GetItemCount(2,0,338) <= 0 then
			AddItem(2,0,338,1,1);
		end;
		
		TaskTip("B筺 nh薾 頲 m閠 nhi謒 v� truy n�, trong 15 ph髏 ph秈 n khu v鵦 , th玭g tin chi ti誸 c� th� xem trong Truy N� l謓h!");
		
	else
		if Is_1stTask_day() == 1 then -- 一天内第一次做任务
		 
		 	--在指定地方生成一个杀手数据
			nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();
			
			Say(strButouTitle.."Theo tin th竚 b竜, s竧 th� <color=yellow>"..nKillerName.."<color> g莕 y hay xu蕋 hi謓 t筰 <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. H穣 mau 甶 di謙 tr�!",0);			
			
			SetTask(TASK_KILLER_STATE_ID,1);--接受一个通缉任务，置变量为 1
			SetTask(TASK_KILLER_DONUM,1);--记录接获任务次数
			SetTask(TASK_PLAYER_LEVEL,GetLevel());--记录玩家接获任务时的等级
			
			--生成时间触发器，计数值为1800
			CreateTrigger(2,400,500);
			ContinueTimer(GetTrigger(500));
			
			--生成地图触发器
			nTriggerID,nCustomID = GetTriggerID(nMapID);
			CreateTrigger(2,nTriggerID,600);
		
			--保存地图触发器ID
			SetTask(TASK_TRIGGER_ID,nTriggerID);
			
			--得到任务物品通缉令
			if GetItemCount(2,0,338) <= 0 then
				AddItem(2,0,338,1,1);
			end;
			
			TaskTip("B筺 nh薾 頲 m閠 nhi謒 v� truy n�, trong 15 ph髏 ph秈 n khu v鵦 , th玭g tin chi ti誸 c� th� xem trong Truy N� l謓h!");
		
		else
			if nDoNum < 20 then --一天内接获任务次数少于20
			
				--在指定地方生成一个杀手数据
				nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();
			
				Say(strButouTitle.."Theo tin th竚 b竜, s竧 th� <color=yellow>"..nKillerName.."<color> g莕 y hay xu蕋 hi謓 t筰 <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. H穣 mau 甶 di謙 tr�!",0);
			
				SetTask(TASK_KILLER_STATE_ID,1);--接受一个通缉任务，置变量为 1
				SetTask(TASK_KILLER_DONUM,nDoNum+1);--记录接获任务次数
				SetTask(TASK_PLAYER_LEVEL,GetLevel());--记录玩家接获任务时的等级
				
				--生成时间触发器，计数值为1800
				CreateTrigger(2,400,500);
				ContinueTimer(GetTrigger(500));
				
				--生成地图触发器
				nTriggerID,nCustomID = GetTriggerID(nMapID);
				CreateTrigger(2,nTriggerID,600);
		
				--保存地图触发器ID
				SetTask(TASK_TRIGGER_ID,nTriggerID);
				
				if GetItemCount(2,0,338) <= 0 then
					AddItem(2,0,338,1,1);
			end;
			
			TaskTip("B筺 nh薾 頲 m閠 nhi謒 v� truy n�, trong 15 ph髏 ph秈 n khu v鵦 , th玭g tin chi ti誸 c� th� xem trong Truy N� l謓h!");
				
			else
				 Say(strButouTitle.."H玬 nay C竎 h�  gi髉 ta ti猽 di謙 s竧 th� 頲 20 l莕, t筸 th阨 kh玭g phi襫 C竎 h� n鱝.",0);
				 
			end;
			
		end;
		
	end;
		
end;

--完成任务及奖励配取
function Task_Finish()

	local strButouTitle = "<color=green>B� u<color>:";
	local task_state = GetTask(TASK_KILLER_STATE_ID);
	local nDoNum = GetTask(TASK_KILLER_DONUM);
	
	if task_state == 2 then
		Say(strButouTitle.."Ta thay m苩 Quan ph� v� b� t竛h c秏 t� C竎 h�! Xin nh薾 ch髏 ph莕 thng!",0);
		KillerAward();
		SetTask(TASK_KILLER_STATE_ID,0);--完成任务，任务状态置0
		SetTask(TASK_KILLER_DONUM,nDoNum+1);--完成任务，次数加1
		
		--删去通缉令
		if GetItemCount(2,0,338) > 0 then
			DelItem(2,0,338,1,1);
		end;
		-- 师徒任务 （杀手）
		local nChance, nMaxChance = CustomDataRead("mp_shashou")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_shashou", "dd", nChance, nMaxChance)
				Msg2Player("Ho祅 th祅h nhi謒 v� s� -s竧 th�:"..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
	else
		Say(strButouTitle.."H�! Tu鎖 c遪 nh� m� d竚 g箃 ta �?",0);
	end;
end;

--取消任务
function Task_Cancel()

local strButouTitle = "<color=green>B� u<color>:";

	Say(strButouTitle.."Sao d� n秐 l遪g v藋?",
	2,
	"Л頲 ta s� di謙 tr� b鋘 ch髇g!/Task_Exit",
	"Ta kh玭g gi誸 th� sao!/Task_CancelConfirm");
	
end;

--再次确认取消任务
function Task_CancelConfirm()

local strButouTitle = "<color=green>B� u<color>:";
local nDoNum = GetTask(TASK_KILLER_DONUM);
	
	SetTask(TASK_KILLER_DONUM,nDoNum+1);--取消任务，次数加1
	SetTask(TASK_KILLER_STATE_ID,0);--取消任务，任务状态置0
	SetTask(TASK_KILLER_STATE_STAR,0);
	Say(strButouTitle.."H�! у v� d鬾g!",0);

		--删去通缉令
		if GetItemCount(2,0,338) > 0 then
			DelItem(2,0,338,1,1);
		end;	
	
	--删掉该地图触发器
	RemoveTrigger(GetTrigger(600));
	--删掉时间触发器
	RemoveTrigger(GetTrigger(500));
	
end;
	
	
--空函数，不做任何事
function Taks_Exit()

end;
