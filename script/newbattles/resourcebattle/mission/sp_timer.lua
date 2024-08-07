--describe:特殊计时器。可以根据计时器的状态来选择触发一些事件
--一般来说这个事件的持续时间不长
Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function OnTimer()
	local nTimerState = GetMissionV(MV_SP_TIMER_STATE);
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		if nTimerState == TM_STATE_CATERAN_SONG or nTimerState == TM_STATE_CATERAN_LIAO then
			Process_Sp_Careran_Even(nTimerState);
		end;
	else
		SetMissionV(MV_SP_TIMER_STATE,0);
		SetGroupLifeTime(CATERAN_GROUP_SONG+nTimerState-1,0);
		ClearGroup(CATERAN_GROUP_SONG+nTimerState-1);
		StopMissionTimer(MISSION_ID,CATERAN_TIMER_ID);
	end;
end;
--山贼劫营事件,nCamp指的是山贼的阵营
function Process_Sp_Careran_Even(nCamp)
	local nLoop = GetMissionV(MV_SP_TIMER_LOOP);
	SetMissionV(MV_SP_TIMER_LOOP,nLoop-1)
	local nCateranCount = CountGroupUnit(CATERAN_GROUP_SONG+nCamp-1);
	local nEnemyCamp = 3 - nCamp;
	if nLoop == 0 then
		if nCateranCount > 0 then
			if nEnemyCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"S琻 t芻 h藆 doanh phe T鑞g dng nh� ch箉 m蕋 d筺g");
			else
				Msg2MSAll(MISSION_ID,"S琻 t芻 h藆 doanh phe Li猽 dng nh� ch箉 m蕋 d筺g");
			end;
		end;
		SetMissionV(MV_SP_TIMER_STATE,0);
		SetGroupLifeTime(CATERAN_GROUP_SONG+nCamp-1,0);
		ClearGroup(CATERAN_GROUP_SONG+nCamp-1);
		StopMissionTimer(MISSION_ID,CATERAN_TIMER_ID);
	elseif nLoop <= 45 then	--15秒后才有效果
		if nCateranCount == 0 then
			if nLoop > 30 then
				if nEnemyCamp == SONG_ID then
					Msg2MSAll(MISSION_ID,"S琻 t芻 trong h藆 doanh phe T鑞g g莕 nh� b� 畊鎖 甶 h誸");
				else
					Msg2MSAll(MISSION_ID,"S琻 t芻 trong h藆 doanh phe Li猽 g莕 nh� b� 畊鎖 甶 h誸");
				end;
			else
				if nEnemyCamp == SONG_ID then
					Msg2MSAll(MISSION_ID,"S琻 t芻 trong h藆 doanh phe T鑞g g莕 nh� b� 畊鎖 甶 h誸");
				else
					Msg2MSAll(MISSION_ID,"S琻 t芻 trong h藆 doanh phe Li猽 g莕 nh� b� 畊鎖 甶 h誸");
				end;
			end;
			SetMissionV(MV_SP_TIMER_STATE,0);
			StopMissionTimer(MISSION_ID,CATERAN_TIMER_ID);
			return 0;
		end;
		Add_Resource(nCamp,nCateranCount);	--nCamp方粮草增加
		Msg2MSGroup(MISSION_ID,"Цnh s琻 t芻: 畂箃 頲"..nCateranCount.." bao lng th秓",nCamp);
		Dec_Resource(nEnemyCamp,nCateranCount);	--nEnemyCamp方粮草减少
		Msg2MSGroup(MISSION_ID,"Цnh s琻 t芻:"..nCateranCount.." bao lng th秓 c馻 ta  b� s琻 t芻 cp 甶",nEnemyCamp);
	elseif nCateranCount == 0 then	--15秒内如果山贼数量为0
		if nEnemyCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,"Tng s�  phe T鑞g k辮 th阨 畊鎖 s琻 t芻 甶");
		else
			Msg2MSAll(MISSION_ID,"Tng s�  phe T鑞g k辮 th阨 畊鎖 s琻 t芻 甶");
		end;
		SetMissionV(MV_SP_TIMER_STATE,0);
		StopMissionTimer(MISSION_ID,CATERAN_TIMER_ID);
		return 0;		
	end;
end;
