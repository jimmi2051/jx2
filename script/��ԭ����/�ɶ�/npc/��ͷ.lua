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
	local nTotalPoint = GetTask(TASK_POINT_TOTAL); 
	
	--积分补偿
	if random(1,20) == 1 then
		NpcChat(GetTargetNpc(),"Nghe n鉯 tr猲 ngi c馻 b鋘 s竧 th� Л阯g c騨g c� Linh Th筩h, thi誹 hi謕 ph秈 theo d鈏 b鋘 ch髇g!");
	end;
	if nTotalPoint == 0 then
		local nPointCoefficient = GetPointCoefficient();
			nTotalPoint = GetTask(TASK_KILLER_DONUM)*100*nPointCoefficient;
		SetTask(TASK_POINT_TOTAL,nTotalPoint);
	end; 
			
	--检查时间是否为周一至周四20点至24点
	if CheckTime() == 1 then
	
		--接收任务的等级最低为20级
		if nLevel >= 20 then
					
			if task_state == 0 then
				Say(strButouTitle.."G莕 y t閕 ph筸 c竎 n琲 ng祔 m閠 nhi襲, ngi nha m玭 th� b薾 b辵 kh玭g bi誸 c竎 h� c� th� gi髉 m閠 tay kh玭g?",
					4,
					"Ngi luy謓 v� nh� ch髇g ta sao c� th� ng l祄 ng�!/Task_Confirm",
					"C竎 bc nhi謒 v�/Task_Show",
					"B鑙 c秐h nhi謒 v�/Task_Backdrop",
					"T筰 h� c遪 c� chuy謓 ph秈 l祄!/Taks_Exit");	
			end;
			
			if task_state >= 1 then
			
				local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
				local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
				local nKillerName = getKillerName(nSurnameID,nFirstnameID);	
				local nPosID = GetTask(TASK_KILLER_MAP_ID);
				local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);
				
				Say(strButouTitle.."C竎 h� c� ph秈  gi髉 ta nh b筰 s竧 th� xung quanh <color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color>: <color=yellow>"..nKillerName.."<color>?",
					3,
					"Ta  gi誸/Task_Finish",
					"T筸 th阨 ch璦/Taks_Exit",
					"Ta kh玭g mu鑞 gi誸/Task_Cancel");		
			end;
		
		else
			Say(strButouTitle.."Kinh nghi謒 c竎 h� c遪 k衜 h琻 n鱝 giang h� hi觤 竎 i t <color=yellow>c蕄 20<color> m韎 n t譵 ta!",0)
				
		end;
		
	elseif task_state >= 1 then
			
		local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
		local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
		local nKillerName = getKillerName(nSurnameID,nFirstnameID);		
		local nPosID = GetTask(TASK_KILLER_MAP_ID);
		local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);
				
			Say(strButouTitle.."C竎 h� c� ph秈  gi髉 ta nh b筰 s竧 th� xung quanh <color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color>: <color=yellow>"..nKillerName.."<color>?",
					3,
					"Ta  gi誸/Task_Finish",
					"T筸 th阨 ch璦/Taks_Exit",
					"Ta kh玭g mu鑞 gi誸/Task_Cancel");		
	else
		Say(strButouTitle.."T� <color=yellow>Th� hai<color> n <color=yellow>Th� N╩<color>, t� <color=yellow>20h:00<color> n <color=yellow>24h:00 <color>. Th阨 gian n祔 B� u m韎 c玭g b� Danh s竎h truy n�!",
				3,
				"C竎 bc nhi謒 v�/Task_Show",
				"B鑙 c秐h nhi謒 v�/Task_Backdrop",
				"K誸 th骳 i tho筰/Taks_Exit");
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
	local nTriggerID = 0;
	local nCustomID = 0;
	local nTime = 0;
	local nBuTouMapID = GetWorldPos();
	local nTotal_DoNum = 0;
	local i=0;
	local nNowTime = GetTime();
	local nLastTime = GetTask(TASK_ACCEPT_TIME);--获取上一次接获任务时间
	local nCoolTime = 300 - (nNowTime-nLastTime);
			if nLastTime == nil or nCoolTime < 0 then
				nCoolTime = 0;
			end;
	local strCoolTime = TurnTime(nCoolTime);
	
	--根据地点读取该地点目前接获通缉任务的人数
--	if nBuTouMapID == 100 then nTotal_DoNum = GetMapTaskTemp(100,1);i=1;end;--泉州
--	if nBuTouMapID == 150 then nTotal_DoNum = GetMapTaskTemp(150,1);i=2;end;--扬州
--	if nBuTouMapID == 200 then nTotal_DoNum = GetMapTaskTemp(200,1);i=3;end;--汴京
--	if nBuTouMapID == 300 then nTotal_DoNum = GetMapTaskTemp(300,1);i=4;end;--成都
--	if nBuTouMapID == 350 then nTotal_DoNum = GetMapTaskTemp(350,1);i=5;end;--襄阳
	
--	一天内同一地点捕快出接获任务次数少于100
--	if nTotal_DoNum < 100 then 
		
		--接获任务后需要5分钟方能接下一次任务
		if nCoolTime ~= 0 then
			Talk(1,"",strButouTitle.."ng n玭 n鉵g, c竎 h� c遪 "..strCoolTime.." m韎 nh薾 頲 nhi謒 v� k� ti誴, nhng c� h閕 cho ngi kh竎 甶!")
			return
		end;
		
		--生成一个杀手数据
		nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();
				
		SetTask(TASK_KILLER_STATE_ID,1);--接受一个通缉任务，置变量为 1
		--SetMapTaskTemp(nBuTouMapID,1,nTotal_DoNum+1);--记录一天内容易地点捕快接获任务次数
		SetTask(TASK_PLAYER_LEVEL,GetLevel());--记录玩家接获任务时的等级
		
		--nTotal_DoNum = GetMapTaskTemp(BuTouMapData[i][1],1);
		
		Say(strButouTitle.."Theo tin th竚 b竜, s竧 th� <color=yellow>"..nKillerName.."<color> g莕 y hay xu蕋 hi謓 t筰 <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. H穣 甶 di謙 tr� h緉 tr� h藆 h鋋!",0);--（这是本次该捕头发布的的第<color=yellow>"..nTotal_DoNum.."<color>次任务，每次发布任务数量为<color=yellow>100<color>次。）",0);
		
		--生成时间触发器，计数值为1800
		CreateTrigger(1,400,500);
		ContinueTimer(GetTrigger(500));
		
		--保存当前时间
		nTime = GetTime();--获取1970年至今经过的秒数
		SetTask(TASK_ACCEPT_TIME,nTime);
		
		--生成地图触发器
		nTriggerID,nCustomID = GetTriggerID(nMapID);
		CreateTrigger(2,nTriggerID,600);
		
		--保存地图触发器ID
		SetTask(TASK_TRIGGER_ID,nTriggerID);

		TaskTip("C莕 ho祅 th祅h nhi謒 v� trong 30 ph髏, xem th猰 trong l謓h truy n�!");
		
		if GetItemCount(2,0,338) <= 0 then
			AddItem(2,0,338,1,1);
		end;
				
--	else
--		Say(strButouTitle.."<color=yellow>"..BuTouMapData[i][2].."<color>本批通缉名单已发布完毕！",0);
--				 
--	end;
		
end;

--完成任务及奖励配取
function Task_Finish()

	local strButouTitle = "<color=green>B� u<color>:";
	local task_state = GetTask(TASK_KILLER_STATE_ID);
	local nDoNum = GetTask(TASK_KILLER_DONUM);
	
	if task_state == 2 then
		Say(strButouTitle.."Thay m苩 quan ph� c竚 琻 c竎 h� ra tay gi髉 , y l� ph莕 thng!",0);
		KillerAward();
		SetTask(TASK_KILLER_STATE_ID,0);--完成任务，任务状态置0
		SetTask(TASK_KILLER_DONUM,nDoNum+1);--完成任务，次数加1
		
		--积分累计处理
		local nTotalPoint = GetTask(TASK_POINT_TOTAL);
		local nPointCoefficient = GetPointCoefficient();
			nTotalPoint = nTotalPoint + 100*nPointCoefficient;
		SetTask(TASK_POINT_TOTAL,nTotalPoint);	
		
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
	"T筰 h� 甶 gi誸 ch髇g y!/Task_Exit",
	"Ta kh玭g gi誸 th� sao!/Task_CancelConfirm");
	
end;

--再次确认取消任务
function Task_CancelConfirm()

local strButouTitle = "<color=green>B� u<color>:";

	SetTask(TASK_KILLER_STATE_ID,0);--取消任务，任务状态置0
	SetTask(TASK_KILLER_STATE_STAR,0);
	Say(strButouTitle.."H�! у v� d鬾g!",0);
	
	TaskPunish();

		--删去通缉令
		if GetItemCount(2,0,338) > 0 then
			DelItem(2,0,338,1,1);
		end;	
	
	--删掉该地图触发器
	RemoveTrigger(GetTrigger(600));
	--删掉时间触发器
	RemoveTrigger(GetTrigger(500));
	
end;

--通缉任务流程说明
function Task_Show()

local str1 = "Nh﹏ s� <color=yellow>t� c蕄 20 tr� l猲<color>, l骳 <color=yellow>20h:00<color> n <color=yellow>24h:00<color> t� <color=yellow>Th� hai<color> n <color=yellow>Th� n╩<color> h祅g tu莕, c� th� n c竎 Nha m玭 g苝 <color=yellow>B� u<color> nh薾 nhi謒 v� Truy n�!";
local str2 = "Khi  nh薾 danh s竎h truy n� <color=yellow>n閕 trong 30 ph髏<color> ph秈 truy t譵 cho 頲 s竧 th�, n誹 qu� th阨 gian ho芻 h駓 b� nhi謒 v� th� xem nh� nhi謒 v� th蕋 b筰.";
local str3 = "D� ho祅 th祅h nhi謒 v�, h駓 nhi謒 v� hay nhi謒 v� th蕋 b筰 u ph秈 <color=yellow>5 ph髏<color> sau m韎 nh薾 ti誴 nhi謒 v�.";

	Talk(3,"",str1,str2,str3);

end;

--通缉任务背景说明
function Task_Backdrop()

local str1 = "Cng qu鑓 T﹜ H� n籱 � ph輆 t﹜ trung nguy猲 tuy v� ngo礽 kh玭g ng t躰h th鵦 ch蕋 ng蕄 ngh� l穘h th� trung nguy猲, ngo礽 c蕌 k誸 v韎 Minh gi竜  l頸 d鬾g l蒼 nhau, ch髇g c遪 gi髉 c竎 gian th莕 trong tri襲 nh.";
local str2 = "T﹜ H� t輓 ngng v� h鋍, s竛g l藀 ra Nh蕋 Ph莔 阯g v韎 c竎 k� nh﹏ d� s�. H� 頲 xem l� c� c蕌 i ngo筰 t鑤 nh蕋 c馻 T﹜ H�, t� ch鴆 n祔 t鮪g ph竔 s竧 th� n trung nguy猲 ph� ho筰 v� gi誸 kh玭g 輙 c竎 trung th莕.";
local str3 = "L� con ch竨 i T鑞g sao ngi c� th� khoanh tay ng nh譶�...";
	
	Talk(3,"",str1,str2,str3);
	
end;
	
--空函数，不做任何事
function Taks_Exit()

end;
