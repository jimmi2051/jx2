--奥运七夕活动点灯头文件
--by vivi
--2008\07\17

Include("\\script\\online\\qixi08\\function.lua");

--任务变量
TSK_AOYUN_LIGHT_AWARD = 1970;    --是否领取过奖励
TSK_AOYUN_LIGHT_DATE = 1971;		 --领取奖励的日期
TSK_AOYUN_LIGHT_GUAN = 1972;     --通了第几关
TSK_AOYUN_LIGHT_NUM = 1973;      --连续通关次数	

--MISSION相关
AOYUN_LIGHT_MISSION_ID = 45;        --mission id
AOYUN_LIGHT_TIMER_ID = 74;           --计时器ID
AOYUN_LIGHT_LOG_ID = 1113;          --登陆触发器ID
AOYUN_LIGHT_LOG_CUSTOM_ID = 558;    --登陆触发器自定义编号

--=========================================================================================
AOYUN_LIGHT_FRAME_PER_SECOND = 18;								--游戏运行速度：每秒１８帧
--定义各个阶段的持续时间，只能填非0正整数==================================================
AOYUN_LIGHT_READY_TIME = 20;										--准备时间，20s
AOYUN_LIGHT_STARTED_TIME = 120;								--进行时间，2分钟
AOYUN_LIGHT_ENDING_TIME = 20;									--等待结束时间，20s

--定义各个阶段计时器的触发间隔=============================================================
AOYUN_LIGHT_READY_TIMER_INTERVAL = 10;							--计时器触发的时间间隔，单位s
AOYUN_LIGHT_READY_TIMER_COUNT = (AOYUN_LIGHT_READY_TIME/AOYUN_LIGHT_READY_TIMER_INTERVAL)-1;	
AOYUN_LIGHT_DIANDENG_TIMER_INTERVAL = 10;            --系统每5s点一次灯
AOYUN_LIGHT_STARTED_TIMER_INTERVAL = 30;					
AOYUN_LIGHT_STARTED_TIMER_COUNT = (AOYUN_LIGHT_STARTED_TIME/AOYUN_LIGHT_STARTED_TIMER_INTERVAL)-1;	
AOYUN_LIGHT_ENDING_TIMER_INTERVAL = 10;
AOYUN_LIGHT_ENDING_TIMER_COUNT = (AOYUN_LIGHT_ENDING_TIME/AOYUN_LIGHT_ENDING_TIMER_INTERVAL)-1;	

--MissionV变量=============================================================================
AOYUN_LIGHT_MISSION_STATE = 1;								--记录Mission状态
AOYUN_LIGHT_TIMER_LOOP = 2;									--记录计时器的计数
AOYUN_LIGHT_MISSION_UID = 3;									--记录Mission的唯一ID
AOYUN_LIGHT_MAPID = 4;                        --记录mission地图的id
AOYUN_LIGHT_MAPIDX = 5;											--记录mission地图的索引
AOYUN_LIGHT_GUAN_TYPE = 6;                   --记录挑战第几关
AOYUN_LIGHT_GUAN_SUC = 7;                    --闯关是否成功

AOYUN_LIGHT_IDX = 11;                      --11-26为圣火台索引

--MissionS变量=============================================================================
AOYUN_LIGHT_DENG_SEQ = 1;                  --点灯顺序
AOYUN_LIGHT_PLAYER_SEQ = 2;                --玩家点灯顺序

--Mission状态集============================================================================
AOYUN_LIGHT_STATE_IDEL = 0;									--场地空闲
AOYUN_LIGHT_STATE_READY = 1;									--准备阶段
AOYUN_LIGHT_STATE_DIANDENG = 2;               --系统点灯阶段
AOYUN_LIGHT_STATE_STARTED = 3;								--玩家点灯阶段
AOYUN_LIGHT_STATE_ENDING = 4;								--等待结束阶段
--=========================================================================================

--全局变量
tMapId = {
	{977,1622,3181},
	{{100,1445,2950},
	 {200,1412,2853},
	 {300,1776,3541}
	}};
tLightNpc = {
	{"Уi 畊鑓","n 1",1621,3141,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"Уi 畊鑓","n 2",1607,3154,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"Уi 畊鑓","n 3",1593,3167,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"Уi 畊鑓","n 4",1579,3183,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"Уi 畊鑓","n 5",1594,3198,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"Уi 畊鑓","n 6",1608,3214,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"Уi 畊鑓","n 7",1624,3228,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"Уi 畊鑓","n 8",1640,3213,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"Уi 畊鑓","n 9",1654,3200,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"Уi 畊鑓","n 10",1667,3187,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"Уi 畊鑓","n 11",1649,3170,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"Уi 畊鑓","n 12",1636,3154,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"Уi 畊鑓","n 13",1635,3168,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"Уi 畊鑓","n 14",1609,3194,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"Уi 畊鑓","n 15",1610,3169,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"Уi 畊鑓","n 16",1638,3197,"\\script\\online\\qixi08\\light\\light_npc.lua"}
	};

AOYUN_LIGHT_CAMP = 1;							--点灯阵营
AOYUN_LIGHT_TOTAL_MAP = 10;        --最多20组人在关卡

--奖励
tLightAward = {--经验，宝石包裹id，数量，健康经验
	{1000000,2,1,2642,2,2500000},
	{1000000,2,1,2642,3,3000000},
	{1000000,2,1,2642,4,3500000},
	{1000000,2,1,2642,5,4000000},
	{2000000,2,1,2642,6,4000000}
};

function aoyun_light_random(nMin,nMax,nType)
	local tLetter = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P"};
	local sBackNum = "";
	if nType == 1 then	
		for i=nMin,nMax do
			local nRand = random(nMin,nMax);
			sBackNum = sBackNum..tLetter[nRand];
		end
	elseif nType == 2 then
		local tArgNum = {};
		for i=nMin,nMax do
			tinsert(tArgNum,i);
		end
		for j=1,getn(tArgNum) do
			local nRand = random(1,getn(tArgNum));
			sBackNum = sBackNum..tLetter[nRand];
			tremove(tLetter,nRand);
			tremove(tArgNum,nRand);
		end
	end
	return sBackNum;
end

--获取动态关卡ID
function aoyun_light_GetIdleRoom()
	local nCount = 0;
	local nMapID,nMapIdx = 0,0;
	nCount = GetMapLoadCount(tMapId[1][1]);
	if nCount < AOYUN_LIGHT_TOTAL_MAP then
		nMapID,nMapIdx = DynamicLoadMap(tMapId[1][1]);
		return nMapID,nMapIdx;
	end;			
	return 0,0;
end;

--开启一场关卡
function aoyun_light_OpenMatch()
	local nMapID,nMapIdx = aoyun_light_GetIdleRoom();
	if nMapID == 0 and nMapIdx == 0 then
		Talk(1,"","Khu thi u hi謓 t筰  y, xin quay l筰 sau.")
		return 0;
	end;
	local nOldPIdx = PlayerIndex;
	if mf_OpenMission(AOYUN_LIGHT_MISSION_ID,nMapID) == 1 then
		mf_SetMissionV(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_GUAN_TYPE,1,nMapID);	
		mf_SetMissionV(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_MAPID,nMapID,nMapID);
		mf_SetMissionV(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_MAPIDX,nMapIdx,nMapID);
		ClearMapTrap(nMapID); --清楚当前地图的trap点
		local nTeamSize = GetTeamSize();
		if nTeamSize == 0 or nTeamSize == 1 then
			mf_JoinMission(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_CAMP,nMapID);
		else	
			for i=1,GetTeamSize() do
				PlayerIndex = GetTeamMember(i);
				mf_JoinMission(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_CAMP,nMapID);
			end
		end
	end
	PlayerIndex = nOldPIdx;
end;

--初始化场地boss
function aoyun_light_InitFieldNpc(nType)
	local nMapID = gf_GetCurMapID();
	local nNpcIdx = 0;
	if nType == 1 then	
		for i=1,8 do
			nNpcIdx = CreateNpc(tLightNpc[i][1],tLightNpc[i][2],nMapID,tLightNpc[i][3],tLightNpc[i][4]);
			SetNpcScript(nNpcIdx,tLightNpc[i][5]);
			SetMissionV(i+10,nNpcIdx);
		end
	end
	if nType == 2 or nType == 4 then
		return
	end 
	if nType == 3 then
		for i=9,12 do
			nNpcIdx = CreateNpc(tLightNpc[i][1],tLightNpc[i][2],nMapID,tLightNpc[i][3],tLightNpc[i][4]);
			SetNpcScript(nNpcIdx,tLightNpc[i][5]);
			SetMissionV(i+10,nNpcIdx);
		end	
	end
	if nType == 5 then
		for i=13,16 do
			nNpcIdx = CreateNpc(tLightNpc[i][1],tLightNpc[i][2],nMapID,tLightNpc[i][3],tLightNpc[i][4]);
			SetNpcScript(nNpcIdx,tLightNpc[i][5]);
			SetMissionV(i+10,nNpcIdx);
		end	
	end
end;

--关闭点灯场地
function aoyun_light_CloseField()
	local nMapID = GetMissionV(AOYUN_LIGHT_MAPID);
	local nMapIdx = GetMissionV(AOYUN_LIGHT_MAPIDX);
	CloseMission(AOYUN_LIGHT_MISSION_ID);
	local nRetCode = FreeDynamicMap(nMapID,nMapIdx);	--FreeDynamicMap也会调用CloseMisssion
	if nRetCode ~= 1 then
		WriteLog("[Th� v薾 h閕 th緋 n b� l鏸]:FreeDynamicMap b� l鏸, nRetCode:"..nRetCode);
	end;
end;

--转换Mission当前状态
function aoyun_light_ChangeMSState(nState)
	if nState == AOYUN_LIGHT_STATE_IDEL then
		StopMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID);	--结束前一个计时器
		SetMissionV(AOYUN_LIGHT_MISSION_STATE,AOYUN_LIGHT_STATE_IDEL);
	elseif nState == AOYUN_LIGHT_STATE_READY then
		SetMissionV(AOYUN_LIGHT_MISSION_STATE,AOYUN_LIGHT_STATE_READY);	--设置Mission的状态为准备状态
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,AOYUN_LIGHT_READY_TIMER_COUNT);	--设置计时器总计时次数
		StopMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID);	--结束前一个计时器
		StartMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID,AOYUN_LIGHT_READY_TIMER_INTERVAL*AOYUN_LIGHT_FRAME_PER_SECOND);	--开始一个计时器	
	elseif nState == AOYUN_LIGHT_STATE_DIANDENG then
		SetMissionV(AOYUN_LIGHT_MISSION_STATE,AOYUN_LIGHT_STATE_DIANDENG);
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ)));
		StopMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID);
		StartMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID,AOYUN_LIGHT_DIANDENG_TIMER_INTERVAL*AOYUN_LIGHT_FRAME_PER_SECOND);
	elseif nState == AOYUN_LIGHT_STATE_STARTED then
		SetMissionV(AOYUN_LIGHT_MISSION_STATE,AOYUN_LIGHT_STATE_STARTED);	--设置Mission的状态为开始状态
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,AOYUN_LIGHT_STARTED_TIMER_COUNT);	--设置开始状态的持续时间
		StopMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID);	--结束前一个计时器
		StartMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID,AOYUN_LIGHT_STARTED_TIMER_INTERVAL*AOYUN_LIGHT_FRAME_PER_SECOND);	--开始一个新的计时器
	elseif nState == AOYUN_LIGHT_STATE_ENDING then
		SetMissionV(AOYUN_LIGHT_MISSION_STATE,AOYUN_LIGHT_STATE_ENDING);
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,AOYUN_LIGHT_ENDING_TIMER_COUNT);
		StopMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID);
		StartMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID,AOYUN_LIGHT_ENDING_TIMER_INTERVAL*AOYUN_LIGHT_FRAME_PER_SECOND);
	end;
end;

function aoyun_light_right_seq(nType)
	local tLetter = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P"};
	local sSeq = "";
	if nType == 1 then
		for i=1,strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ)) do
			for j=1,getn(tLetter) do
				if strsub(GetMissionS(AOYUN_LIGHT_DENG_SEQ),i,i) == tLetter[j] then
					if i ~= strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ)) then	
						sSeq = sSeq..j..",";
					else
						sSeq = sSeq..j;
					end
					break;
				end
			end
		end
	elseif nType == 2 then
		for i=1,strlen(GetMissionS(AOYUN_LIGHT_PLAYER_SEQ)) do
			for j=1,getn(tLetter) do
				if strsub(GetMissionS(AOYUN_LIGHT_PLAYER_SEQ),i,i) == tLetter[j] then
					if i ~= strlen(GetMissionS(AOYUN_LIGHT_PLAYER_SEQ)) then	
						sSeq = sSeq..j..",";
					else
						sSeq = sSeq..j;
					end
					break;
				end
			end
		end		
	end
	return sSeq;
end
