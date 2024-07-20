Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\script\\missions\\kuafu_battle\\runtime_data_stat.lua")

function OnTimer()
	SetMissionV(KF_MV_BATTLE_GAME_FRAMETIME,GetGameLoop());
	local nState = GetMissionV(KF_MV_BATTLE_STATE);
	if nState == KF_MS_STATE_FIGHT then
		KF_FloatMsg2PlayerToAll();
	end
	local tFunc = {
		[KF_MS_STATE_PEACE] = "kf_state_peace()",
		[KF_MS_STATE_READY] = "kf_state_ready()",
		[KF_MS_STATE_FIGHT] = "kf_state_fight()",
		[KF_MS_STATE_COMPLETE] = "kf_state_complete()",
	}
	if tFunc[nState] then
		dostring(tFunc[nState]);
	end
end

function kf_state_peace()
	local nLoop = GetMissionV(KF_MV_BATTLE_TIMER_LOOP);
	local nPlayerOne = GetMSPlayerCount(KF_MISSION_ID,KF_CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(KF_MISSION_ID,KF_CampTwo_ID);
	if nLoop == 0 then
		if nPlayerOne >= KF_PLAYER_ALLOW_NUM and nPlayerTwo >= KF_PLAYER_ALLOW_NUM then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_READY_TIME);
			SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_READY_TIMER_LOOP);
			SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_READY);
			Msg2MSAll(KF_MISSION_ID,format("Chi�n tr��ng li�n ��u s� b�t ��u sau %ds, chi�m l�nh tr�n k� l� �i�m m�u ch�t �� gi�nh chi�n th�ng, c�c v� anh h�ng h�y chu�n b�.", (KF_READY_TIME * (KF_READY_TIMER_LOOP + 1))/KF_FRAME_PER_SECOND));
		else
			--û�п���
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_WAITOUT_TIME);
			SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_WAITOUT_TIMER_LOOP);
			SetMissionV(KF_MV_BATTLE_WINNER, KF_ALL_ID);
			SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_COMPLETE);
			SetMissionV(KF_MV_BATTLE_IS_OPEN_SUCC, KF_MISSION_OPEN_FAIL_FLAG);
			Msg2MSAll(KF_MISSION_ID,"Do s� ng��i 2 b�n tham gia kh�ng ��, chi�n tr��ng li�n ��u ch�a th� kh�i ��ng.");
			WriteLog("[Chi�n tr��ng li�n ��u b�t ��u]: "..tostring(date()).."Ch�a th� kh�i ��ng th�nh c�ng");
			
			_stat_on_misson_none_start()
		end 
	else
		SetMissionV(KF_MV_BATTLE_TIMER_LOOP, nLoop-1);
		if mod(nLoop, 6) == 0 then --30�벥��һ��
			Msg2MSAll(KF_MISSION_ID, "Ti�n �� th�i gian: ["..(KF_PEACE_TIMER_LOOP-nLoop+1)..":"..(KF_PEACE_TIMER_LOOP+1).."]");
			local nTime = (nLoop - 1) * KF_PEACE_TIME / KF_FRAME_PER_SECOND
			local szMsg = format("S� ng��i hai b�n hi�n t�i: %s[%d]:%s[%d], %ds, chi�n ��u b�t ��u.", KF_CampOne_Name, nPlayerOne, KF_CampTwo_Name, nPlayerTwo, nTime)
			Msg2MSAll(KF_MISSION_ID, szMsg);
		end
		if nPlayerOne >= KF_PLAYER_MAX_NUM and nPlayerTwo >= KF_PLAYER_MAX_NUM then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_READY_TIME);
			SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_READY_TIMER_LOOP);
			SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_READY);
			Msg2MSAll(KF_MISSION_ID,format("Chi�n tr��ng li�n ��u s� b�t ��u sau %d ph�t, chi�m l�nh tr�n k� l� �i�m m�u ch�t �� gi�nh chi�n th�ng, c�c v� anh h�ng h�y chu�n b�.", 1));
		end
	end
end

t_player_num_to_score ={
	--min,max,score
	{-2100000000,19,0},
	{20,39,2000},
	{40,79,4000},
	{80,159,6000},
	{160,240,8000},
	{241,2100000000,8000},
}
--ʤ������
function kf_initial_top_socre(nTotalPlayerCount)
	if nTotalPlayerCount >=0 and nTotalPlayerCount < 2100000000 then
		for i=1,getn(t_player_num_to_score) do
			local t = t_player_num_to_score[i]
			if nTotalPlayerCount >= t[1] and nTotalPlayerCount <= t[2] then
				SetMissionV(KF_SCORE_MAX, t[3])
				SetMissionV(KF_JIANGJUN_SCORE, floor(t[3] / 2))
				SetMissionV(KF_SCORE_JIANGJUN, floor(t[3] * 20 / 100))
			end
		end
	end
end

function kf_state_ready()
	local nLoop = GetMissionV(KF_MV_BATTLE_TIMER_LOOP);
	local nPlayerOne = GetMSPlayerCount(KF_MISSION_ID,KF_CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(KF_MISSION_ID,KF_CampTwo_ID);	
	if nLoop == 0 then
		--�ж�������
		StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
		RunMission(KF_MISSION_ID);
		kf_initial_top_socre(nPlayerOne+nPlayerTwo)
		WriteLog("[Chi�n tr��ng li�n ��u b�t ��u]: Th�i gian l�"..tostring(date()).."Chi�n tr��ng li�n ��u �� b�t ��u, s� ng��i hi�n t�i: ["..nPlayerOne.."]:["..nPlayerTwo.."], t�ng s� ng��i l�: "..(nPlayerOne+nPlayerTwo));
		
		_stat_on_misson_start(KF_MISSION_ID)
	else
		SetMissionV(KF_MV_BATTLE_TIMER_LOOP, nLoop-1);
		Msg2MSAll(KF_MISSION_ID," c�n "..tostring(KF_READY_TIME/18*nLoop).."s, chi�n tr��ng li�n ��u ch�nh th�c b�t ��u. S� ng��i hi�n t�i l�: "..KF_CampOne_Name.."["..nPlayerOne.."]:"..KF_CampTwo_Name.."["..nPlayerTwo.."]");
	end;
end

function kf_state_fight()
	local nLoop = GetMissionV(KF_MV_BATTLE_TIMER_LOOP);
	local nPlayerAll = GetMSPlayerCount(KF_MISSION_ID, KF_ALL_ID);
	local nPlayerOne = GetMSPlayerCount(KF_MISSION_ID, KF_CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(KF_MISSION_ID, KF_CampTwo_ID);	
	if nLoop == 0 then
		StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
		StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_WAITOUT_TIME);
		SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_WAITOUT_TIMER_LOOP);
		SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_COMPLETE);
		--�жϷ���
		local nSongScore = GetMissionV(KF_MV_BATTLE_SONG_SCORE);
		local nLiaoScore = GetMissionV(KF_MV_BATTLE_LIAO_SCORE);
		if nSongScore > nLiaoScore then
			SetMissionV(KF_MV_BATTLE_WINNER, KF_CampOne_ID);
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampOne_ID}, KF_ALL_ID);
			if nSongScore >= GetMissionV(KF_SCORE_MAX) then
				Msg2MSAll(KF_MISSION_ID, format("Phe %s �i�m t�ch l�y ��t tr��c %d,�� gi�nh chi�n th�ng tr�n li�n ��u chi�n tr��ng n�y.", KF_CampOne_Name, GetMissionV(KF_SCORE_MAX)));	
			else
				Msg2MSAll(KF_MISSION_ID, format("�i�m t�ch l�y phe %s cao h�n phe %s, %s gi�nh chi�n th�ng!", KF_CampOne_Name, KF_CampTwo_Name, KF_CampOne_Name));	
			end
			
			_stat_on_misson_end(KF_MISSION_ID, 1)
			return 0;		
		elseif nSongScore < nLiaoScore then
			SetMissionV(KF_MV_BATTLE_WINNER, KF_CampTwo_ID);
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampTwo_ID}, KF_ALL_ID);
			if nSongScore >= GetMissionV(KF_SCORE_MAX) then
				Msg2MSAll(KF_MISSION_ID, format("Phe %s �i�m t�ch l�y ��t tr��c %d,�� gi�nh chi�n th�ng tr�n li�n ��u chi�n tr��ng n�y.", KF_CampTwo_Name, GetMissionV(KF_SCORE_MAX)));
			else
				Msg2MSAll(KF_MISSION_ID, format("�i�m t�ch l�y phe %s cao h�n phe %s, %s gi�nh chi�n th�ng!", KF_CampTwo_Name, KF_CampOne_Name, KF_CampTwo_Name));	
			end
			
			_stat_on_misson_end(KF_MISSION_ID, 2)
			return 0;
		else
			local nSongActivity = GetMissionV(KF_MV_BATTLE_SONG_ACTIVITY);
			local nLiaoActivity = GetMissionV(KF_MV_BATTLE_LIAO_ACTIVITY);
			if nSongActivity > nLiaoActivity then
				SetMissionV(KF_MV_BATTLE_WINNER, KF_CampOne_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampOne_ID}, KF_ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("�� t�ch c�c [%s:%d]:[%s:%d], %s gi�nh ���c chi�n th�ng chi�n tr��ng li�n ��u l�n n�y.",KF_CampOne_Name, nSongActivity, KF_CampTwo_Name, nLiaoActivity, KF_CampOne_Name));
				
				_stat_on_misson_end(KF_MISSION_ID, 1)
				return 0;
			elseif nSongActivity < nLiaoActivity then
				SetMissionV(KF_MV_BATTLE_WINNER, KF_CampTwo_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampTwo_ID}, KF_ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("�� t�ch c�c [%s:%d]:[%s:%d], %s gi�nh ���c chi�n th�ng chi�n tr��ng li�n ��u l�n n�y.",KF_CampOne_Name, nSongActivity, KF_CampTwo_Name, nLiaoActivity, KF_CampTwo_Name));
				
				_stat_on_misson_end(KF_MISSION_ID, 2)
				return 0;
			else
				SetMissionV(KF_MV_BATTLE_WINNER, KF_ALL_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_ALL_ID}, KF_ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("�� t�ch c�c [%s:%d]:[%s:%d], tr�n chi�n tr��ng li�n ��u l�n n�y b�t ph�n th�ng b�i.",KF_CampOne_Name, nSongActivity, KF_CampTwo_Name, nLiaoActivity));
				
				_stat_on_misson_end(KF_MISSION_ID, 0)
				return 0;
			end
		end
	else
		SetMissionV(KF_MV_BATTLE_TIMER_LOOP, nLoop-1)
		--ÿ��15��ͼ��˫��������
		if mod(nLoop, 5) == 0 then
			local tMissionV = {
				KF_MV_BATTLE_FLAG_JM,
				KF_MV_BATTLE_FLAG_MM,
				KF_MV_BATTLE_FLAG_SM,
				KF_MV_BATTLE_FLAG_SI,
				KF_MV_BATTLE_FLAG_DA,
			}
			for i = 1, getn(tMissionV) do
				local nTag = GetMissionV(tMissionV[i]);
				KF_AddScore(KF_ZHENQI_INC, nTag);
			end
		end
		--�жϷ���
		local nSongScore = GetMissionV(KF_MV_BATTLE_SONG_SCORE);
		local nLiaoScore = GetMissionV(KF_MV_BATTLE_LIAO_SCORE);
		--���ȷ�
		if nSongScore >= GetMissionV(KF_SCORE_MAX) and nLiaoScore >= GetMissionV(KF_SCORE_MAX) then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_WAITOUT_TIME);
			SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_WAITOUT_TIMER_LOOP);
			SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_COMPLETE);
			--�жϷ���			
			local nSongActivity = GetMissionV(KF_MV_BATTLE_SONG_ACTIVITY);
			local nLiaoActivity = GetMissionV(KF_MV_BATTLE_LIAO_ACTIVITY);
			if nSongActivity > nLiaoActivity then
				SetMissionV(KF_MV_BATTLE_WINNER, KF_CampOne_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampOne_ID}, KF_ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("�� t�ch c�c [%s:%d]:[%s:%d], %s gi�nh ���c chi�n th�ng chi�n tr��ng li�n ��u l�n n�y.",KF_CampOne_Name, nSongActivity, KF_CampTwo_Name, nLiaoActivity, KF_CampOne_Name));
				
				_stat_on_misson_end(KF_MISSION_ID, 1)
				return 0;
			elseif nSongActivity < nLiaoActivity then
				SetMissionV(KF_MV_BATTLE_WINNER, KF_CampTwo_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampTwo_ID}, KF_ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("�� t�ch c�c [%s:%d]:[%s:%d], %s gi�nh ���c chi�n th�ng chi�n tr��ng li�n ��u l�n n�y.",KF_CampOne_Name, nSongActivity, KF_CampTwo_Name, nLiaoActivity, KF_CampTwo_Name));
				
				_stat_on_misson_end(KF_MISSION_ID, 2)
				return 0;
			else
				SetMissionV(KF_MV_BATTLE_WINNER, KF_ALL_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_ALL_ID}, KF_ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("�� t�ch c�c [%s:%d]:[%s:%d], tr�n chi�n tr��ng li�n ��u l�n n�y b�t ph�n th�ng b�i.",KF_CampOne_Name, nSongActivity, KF_CampTwo_Name, nLiaoActivity));
				
				_stat_on_misson_end(KF_MISSION_ID, 0)
				return 0;
			end
			return 0;								
		end		
		if nSongScore >= GetMissionV(KF_SCORE_MAX) then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_WAITOUT_TIME);
			SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_WAITOUT_TIMER_LOOP);
			SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_COMPLETE);
			SetMissionV(KF_MV_BATTLE_WINNER, KF_CampOne_ID);
			Msg2MSAll(KF_MISSION_ID, format("Phe %s �i�m t�ch l�y ��t tr��c %d,�� gi�nh chi�n th�ng tr�n li�n ��u chi�n tr��ng n�y.", KF_CampOne_Name, GetMissionV(KF_SCORE_MAX)));
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampOne_ID}, KF_ALL_ID);	
			
			_stat_on_misson_end(KF_MISSION_ID, 1)
			return 0;			
		end
		if nLiaoScore >= GetMissionV(KF_SCORE_MAX) then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_WAITOUT_TIME);
			SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_WAITOUT_TIMER_LOOP);
			SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_COMPLETE);
			SetMissionV(KF_MV_BATTLE_WINNER, KF_CampTwo_ID);
			Msg2MSAll(KF_MISSION_ID, format("Phe %s �i�m t�ch l�y ��t tr��c %d,�� gi�nh chi�n th�ng tr�n li�n ��u chi�n tr��ng n�y.", KF_CampTwo_Name, GetMissionV(KF_SCORE_MAX)));
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampTwo_ID}, KF_ALL_ID);		
			
			_stat_on_misson_end(KF_MISSION_ID, 2)
			return 0;
		end
		if nPlayerOne == 0 and nPlayerTwo ~= 0 then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_WAITOUT_TIME);
			SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_WAITOUT_TIMER_LOOP);
			SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_COMPLETE);
			SetMissionV(KF_MV_BATTLE_WINNER, KF_CampTwo_ID);
			Msg2MSAll(KF_MISSION_ID, format("S� ng��i phe %s kh�ng ��, %s �� gi�nh chi�n th�ng tr�n li�n ��u l�n n�y.", KF_CampOne_Name, KF_CampTwo_Name));
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampTwo_ID}, KF_ALL_ID);	
			
			_stat_on_misson_end(KF_MISSION_ID, 2)
			return 0;
		end
		if nPlayerTwo == 0 and nPlayerOne ~= 0 then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_WAITOUT_TIME);
			SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_WAITOUT_TIMER_LOOP);
			SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_COMPLETE);
			SetMissionV(KF_MV_BATTLE_WINNER, KF_CampOne_ID);
			Msg2MSAll(KF_MISSION_ID, format("S� ng��i phe %s kh�ng ��, %s �� gi�nh chi�n th�ng tr�n li�n ��u l�n n�y.", KF_CampTwo_Name, KF_CampOne_Name));
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {KF_CampOne_ID}, KF_ALL_ID);	
			
			_stat_on_misson_end(KF_MISSION_ID, 1)
			return 0;
		end
		if mod(nLoop, 10) == 0 then
			Msg2MSAll(KF_MISSION_ID,"Ti�n �� th�i gian: ["..(KF_FIGHT_TIMER_LOOP-nLoop+1)..":"..(KF_FIGHT_TIMER_LOOP+1).."]");
			Msg2MSAll(KF_MISSION_ID,"�i�m t�ch l�y 2 phe hi�n t�i l�: "..KF_CampOne_Name.."["..nSongScore.."]:"..KF_CampTwo_Name.."["..nLiaoScore.."]")
			KF_OperateAllPlayer(KF_KickSleep, {}, KF_ALL_ID); --˯�ߵ�ǿ���߳�ս��
		end		
		if mod(nLoop, 20) == 0 then
			Msg2MSAll(KF_MISSION_ID,format("S� ng��i 2 phe hi�n t�i l�: %s[%d]:%s[%d]", KF_CampOne_Name, nPlayerOne, KF_CampTwo_Name, nPlayerTwo));
		end;
		KF_OperateAllPlayer(KF_KickDeather, {}, KF_ALL_ID); --������ǿ���߳�ս��
		if GetMissionV(KF_MV_BATTLE_JIANGJUN_TAG) == 0 and (nSongScore >= GetMissionV(KF_JIANGJUN_SCORE) or nLiaoScore >= GetMissionV(KF_JIANGJUN_SCORE)) then
			KF_CreateJiangJun(); --��������
		end
		if mod(nLoop, 15) == 0 then
			SetMissionV(KF_MV_BATTLE_TEMP_SAFE_POS_INDEX_SONG, random(3));
			SetMissionV(KF_MV_BATTLE_TEMP_SAFE_POS_INDEX_LIAO, random(3));
		end
	end
	--�㲥�������
	if mod(nLoop, 10) == 0 then
		KF_MsgZhenQiState();
	end
end

function kf_state_complete()
	local nLoop = GetMissionV(KF_MV_BATTLE_TIMER_LOOP);
	if nLoop == 0 then
		if GetMissionV(KF_MV_BATTLE_IS_OPEN_SUCC) ~= KF_MISSION_OPEN_FAIL_FLAG then
			KF_KillPaiMing();
		end
		StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
		CloseMission(KF_MISSION_ID);
	else
		SetMissionV(KF_MV_BATTLE_TIMER_LOOP, nLoop-1);
	end;
end