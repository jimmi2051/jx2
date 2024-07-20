--日常任务头文件
Include("\\script\\task\\richangrenwu\\head.lua");
tTaskItemName = 
{
	{"B綾 L鬰 L﹎ l謓h",2,0,399},
	{"Tr鬰 秐h Thng",2,0,400},
	{"Tuy謙 T譶h Th筩h",2,0,401},
	{"L謓h b礽 t鎛g qu秐 ngo筰 vi謓",2,0,402},
	{"L謓h b礽 t鎛g qu秐 n閕 vi謓",2,0,403},
	{"Vi謙 N� ki誱",2,0,404},
	{"Trang ch� kim 蕁",2,0,405},
	{"Trng L穙 Ch� Ho祅",2,0,406},
}

function main()
	local npcIndex,npcModel,npcName = GetTriggeringUnit();
	if npcIndex == 0 then
		return 0;
	end;
     --是否完成团队日常任务
	local nDate = tonumber(date("%y%m%d"));
    	if GetTask(DAILY_TASK_0912_TEAM_TASK_DATE) < nDate then
        	SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
        	SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, 0);
    	end
     local nTeamTask = GetGlbValue(DAILY_TASK_0912_TEAM_TASK);
	local nTaskValue = GetTask(345);
--	if nTaskValue == 0 and  nTeamTask == 0 and GetTask(DAILY_TASK_0912_TEAM_TASK_ID) == 0 then
--		return 0;
--	end;
	if nTaskValue > 0 then		
		if tTaskItemName[nTaskValue][1] ~= npcName  then
			Talk(1,"","V藅 ph萴 n祔 kh玭g ng!");
			return 0;
		end;
	elseif nTeamTask > 0 and GetTask(DAILY_TASK_0912_TEAM_TASK_ID) > 0 then
		if DALIY_TASK_0912_TEAM_TASK_LIST[nTeamTask][3] ~= npcName then
			Talk(1,"","V藅 ph萴 n祔 kh玭g ng!");
			return 0;			
		end
		nTaskValue = nTeamTask
--	Nhi謒 v� chuy觧 sinh theo TaskTrans
	elseif GetTask(1537) == 11 or GetTask(1537) == 17 or GetTask(1537) == 29 then
		if npcName == "B綾 L鬰 L﹎ l謓h" then
			nTaskValue = 1
		elseif npcName == "Tr鬰 秐h Thng" then
			nTaskValue = 2
		elseif npcName == "Tuy謙 T譶h Th筩h" then
			nTaskValue = 3
		else
			return 0;
		end
	else
		return 0;
	end		
		
	local selTab = {
			"L藀 t鴆 nh苩 l猲!/#pickup("..npcIndex..","..nTaskValue..")",
			"в ta suy ngh�!/nothing",
			}
	Say("Зy l� th� s� ph� mu鑞 ta 甧m v� sao??",getn(selTab),selTab);
end;

function pickup(npcIndex,ItemNum)	
	local npcName = GetNpcName(npcIndex) or ""	
	if npcName == nil or  npcName == "" then
		Talk(1,"","V藅 ph萴  b� ngi kh竎 nh苩 m蕋 r錳!");
		return 0;
	end
	SetNpcLifeTime(npcIndex,0);
	SetNpcScript(npcIndex,"");
	local nRetCode = AddItem(tTaskItemName[ItemNum][2],tTaskItemName[ItemNum][3],tTaskItemName[ItemNum][4],1);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 "..tTaskItemName[ItemNum][1])
	end;
	if DAILY_TASK_0912_SWITCH == 1 then
            is_he_finish_the_team_task(npcName);
     end
	WriteLog("[Nhi謒 v� l藀 l筰 s� m玭]:"..GetName().."nh薾 頲"..tTaskItemName[ItemNum][1]..". AddItem tr� quay l筰 l�:"..nRetCode);
end;

function nothing()

end;