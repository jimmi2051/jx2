Include("\\script\\newbattles\\mainbattle_primary\\mainbattle_head.lua");
Include("\\script\\newbattles\\box_effect_head.lua");
TBOX_FILE = new(KTabFile, "\\settings\\newbattles\\mainbattle\\kill_npc_effect.txt")
function OnDeath(npcIndex)
	SubWorld = SubWorldID2Idx(MAPID);
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	SetNpcLifeTime(npcIndex,DEAD_BODY_TIME);
	if PlayerIndex == 0 then	--如果是被NPC杀死而触发的，PlayerIndex则为0
		process_npc_kill_npc(npcIndex)
	else
		process_player_kill_npc(npcIndex)
	end;
end;

function get_emplacement_pos_index(nMapX,nMapY)
	for i=0,getn(tEmplacementPos) do
		if nMapX == tEmplacementPos[i][1] and nMapY == tEmplacementPos[i][2] then
			return i;
		end;
	end;
	BT_ShowDebugInfor("[Chi課 trng b竜 l鏸]: H祄 s� get_emplacement_pos_index t譵 kh玭g 頲 v� tr� ph竜 i");
	WriteLog("[Chi課 trng b竜 l鏸]: H祄 s� get_emplacement_pos_index t譵 kh玭g 頲 v� tr� ph竜 i");
end;
--处理NPC杀死NPC事件
function process_npc_kill_npc(npcIndex)	
	local nVillageCamp = GetGlbValue(GLB_VILLAGE);
	local sNpcName = GetNpcName(npcIndex);
	if sNpcName == "Th� d﹏" then	--根据村落战结果来确定给哪一方加分
		SetMissionV(MV_KILL_VILLAGER_COUNT,GetMissionV(MV_KILL_VILLAGER_COUNT)+1);
		if nVillageCamp ~= ALL_ID then
			BT_AddMissionPoint(SONGLIAO_ID-nVillageCamp,1);
		end;
		return 0;
	elseif sNpcName == "Th� l躰h th� d﹏" then	--根据村落战结果来确定给哪一方加分
		SetMissionV(MV_HEADER_DEATH,1);
		if nVillageCamp ~= ALL_ID then
			BT_AddMissionPoint(SONGLIAO_ID-nVillageCamp,2);
		end;
		return 0;
	elseif sNpcName == "K� nh﹏ d� s�" then	--这个是中立NPC
		SetMissionV(MV_HERO_DEATH,1);
		return 0;
	elseif sNpcName == "Ti詎 th竝-T鑞g" or sNpcName == "Ti詎 th竝-Li猽" then	--这个NPC是用来摆设的
		return 0;
	end;
	local nNpcCamp = get_npc_camp(sNpcName);
	if nNpcCamp ~= ALL_ID then
		local nNpcType = process_camp_fight_camp(SONGLIAO_ID-nNpcCamp,sNpcName,nNpcIndex);
		BT_AddMissionPoint(SONGLIAO_ID-nNpcCamp,tKillNpcPoint[nNpcType]);
	end;
end;
--处理玩家杀死NPC事件
function process_player_kill_npc(npcIndex)
	local sNpcName = GetNpcName(npcIndex);
	local nNpcType = 0;
	local nPlayerCamp = BT_GetCamp();
	local nEnemyCamp = 3 - nPlayerCamp;
	local nEmplacementPosIndex = 0;
	local BoxEffectFunc = function(tArg)
		Do_Box_Effect(TBOX_FILE);
	end;
	if sNpcName == "Th� d﹏" then
		nNpcType = TYPE_REFUGEE;
		BT_AddBattleActivity(BA_MAIN_KILL_NATIVE);
	elseif sNpcName == "Th� l躰h th� d﹏" then
		nNpcType = TYPE_HEADER;
		SetMissionV(MV_HEADER_DEATH,1);
		BT_AddBattleActivity(BA_MAIN_KILL_HEADER);
		Msg2MSGroup(MISSION_ID,"Ngi ch琲:"..GetName().."   gi誸 "..sNpcName..", binh s� ph蕁 ch蕁 h糿 l猲!",nPlayerCamp);
		BT_OperateAllPlayer(BoxEffectFunc,{},nPlayerCamp);
	elseif sNpcName == "K� nh﹏ d� s�" then
		nNpcType = TYPE_HERO;
		SetMissionV(MV_HERO_DEATH,1);
		BT_AddBattleActivity(BA_MAIN_KILL_HEADER);
		Msg2MSGroup(MISSION_ID,"Ngi ch琲:"..GetName().."   gi誸 "..sNpcName..", binh s� ph蕁 ch蕁 h糿 l猲!",nPlayerCamp);
		BT_OperateAllPlayer(BoxEffectFunc,{},nPlayerCamp);
	else
		nNpcType = process_camp_fight_camp(nPlayerCamp,sNpcName,npcIndex)
		if nNpcType == TYPE_EMPLACEMENT then
			BT_AddBattleActivity(BA_MAIN_KILL_EMPL);
		elseif nNpcType <= TYPE_CAPTAIN then
			BT_AddBattleActivity(BA_MAIN_KILL_ENEMY);	--杀死一个对方士兵，校尉，都统
		else 
			BT_AddBattleActivity(BA_MAIN_KILL_BOSS);	--杀死对方阵营的先锋、将军、元帅
		end;
	end;
	BT_EmperorAward(tKillNpcEAP[nNpcType],1);
	local nPoint = tKillNpcPoint[nNpcType]
	local nKillVillagerPoint = BT_GetData(PTNC_KILL_VILLAGER_POINT);
	local nKillSoldierPoint = BT_GetData(PTNC_KILL_SOLDIER_POINT);
	if nNpcType == TYPE_REFUGEE then	--如果杀的是土民，就记一下
		if nKillVillagerPoint < KILL_VILLAGER_POINT_LIMITED then	
			BT_AddPersonalPoint(nPoint,0,1);	--给予玩家一定的个人积分
			BT_SetData(PTNC_KILL_VILLAGER_POINT,nKillVillagerPoint+nPoint);
		end;
		SetMissionV(MV_KILL_VILLAGER_COUNT,GetMissionV(MV_KILL_VILLAGER_COUNT)+1);
	elseif nNpcType == TYPE_SOLDIER then	--如果杀的是士兵，也记一下
		if nKillSoldierPoint < KILL_SOLDIER_POINT_LIMITED then	
			BT_AddPersonalPoint(nPoint,0,1);	--给予玩家一定的个人积分
			BT_SetData(PTNC_KILL_SOLDIER_POINT,nKillSoldierPoint+nPoint);
		end;
		SetMissionV(MV_KILL_SONG_SOLDIER_COUNT+2-nPlayerCamp,GetMissionV(MV_KILL_SONG_SOLDIER_COUNT+2-nPlayerCamp)+1);
	else
		BT_AddPersonalPoint(nPoint,0,1);	--给予玩家一定的个人积分
	end;
	Judge_State_By_Point(nPlayerCamp);
end;
--处理一个阵营的玩家或NPC打死另一个阵营的NPC事件
--因为是泛化为NPC打NPC，因此这个函数里面不会对玩家状态进行操作，即可以忽略PlayerIndex
function process_camp_fight_camp(nPlayerCamp,sNpcName,nNpcIndex)
	local nEnemyCamp = 3 - nPlayerCamp
	local sNpcTypeName = get_npc_type(sNpcName);
	local _,nNpcPos_X,nNpcPos_Y = GetNpcWorldPos(nNpcIndex);
	local nEnemyNpcType = GetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1);
	if sNpcTypeName == "Ph竜 i" then
		local nEmplacementPosIndex = get_emplacement_pos_index(nNpcPos_X,nNpcPos_Y);
		Create_Emplacement(nEmplacementPosIndex,nPlayerCamp)
		if GetMissionV(MV_EMPLACEMENT0_POSSESSION) == GetMissionV(MV_EMPLACEMENT1_POSSESSION) and GetMissionV(MV_EMPLACEMENT0_POSSESSION) == GetMissionV(MV_EMPLACEMENT2_POSSESSION) then
			--Try_To_Create_FightNPC("元帅",nEnemyCamp);	--本方占据三门火炮，对方元帅出
		end;
		SetNpcLifeTime(nNpcIndex,0);	--炮台是立即消失的
		nNpcType = TYPE_EMPLACEMENT;
	elseif sNpcTypeName == "Binh tinh nhu�" or sNpcTypeName == "Cng n� binh" or sNpcTypeName == "D騨g s�" or sNpcTypeName == "Ng筺h ti詎 binh" then
		nNpcType = TYPE_SOLDIER;
	elseif sNpcTypeName == "Ti詎 th竝" then
		nNpcType = TYPE_ARROWBUILDING;
	elseif sNpcTypeName == "Hi謚 髖" then
		nNpcType = TYPE_LOOEY;
		SetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1,GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1)+1);
		if GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1) == LOOEY_COUNT then
			if GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1) == CAPTAIN_COUNT then
				if nEnemyNpcType == 0 then
					Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].."hi謚 髖 v�  th鑞g phe "..tCampNameZ[nEnemyCamp].." b� nh b筰, ti猲 phong phe ");
				end;
				Try_To_Create_FightNPC("Ti猲 phong",nEnemyCamp);	--对方校尉都统被屠戮殆尽，对方先锋出
			end;
		end;
	elseif sNpcTypeName == "Й th鑞g" then
		nNpcType = TYPE_CAPTAIN;
		SetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1,GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1)+1);
		if GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1) == CAPTAIN_COUNT then
			if GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1) == LOOEY_COUNT then
				if nEnemyNpcType == 0 then
					Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].."hi謚 髖 v�  th鑞g phe "..tCampNameZ[nEnemyCamp].." b� nh b筰, ti猲 phong phe ");
				end;
				Try_To_Create_FightNPC("Ti猲 phong",nEnemyCamp);	--对方校尉都统被屠戮殆尽，对方先锋出
			end;
			if GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1) == PIONEER_COUNT then
				if nEnemyNpcType == 1 then
					Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].." xu蕋 hi謓. Ti猲 phong "..tCampNameZ[nEnemyCamp].." b� nh b筰, Чi tng xu蕋 hi謓. ");
				end;
				Try_To_Create_FightNPC("Tng qu﹏",nEnemyCamp);	--对方都统先锋被屠戮殆尽，对方大将出
			end;
		end;
	elseif sNpcTypeName == "Ti猲 phong" then
		nNpcType = TYPE_PIONEER;
		SetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1,GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1)+1);
		if GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1) == PIONEER_COUNT then
			if GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1) == GENERAL_COUNT then
				if nEnemyNpcType == 2 then
					Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].." Чi tng v� Ti猲 phong phe "..tCampNameZ[nEnemyCamp].." b� nh b筰, Nguy猲 So竔 xu蕋 hi謓. ");
				end;
				Try_To_Create_FightNPC("Nguy猲 So竔",nEnemyCamp);	--对方大将和先锋都被灭，则对方元帅出
			end;
			if GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1) == CAPTAIN_COUNT then
				if nEnemyNpcType == 1 then
					Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].." xu蕋 hi謓. Ti猲 phong "..tCampNameZ[nEnemyCamp].." b� nh b筰, Чi tng xu蕋 hi謓. ");
				end;
				Try_To_Create_FightNPC("Tng qu﹏",nEnemyCamp);	--对方都统先锋被屠戮殆尽，对方先大将出
			end;
		end;
	elseif sNpcTypeName == "Tng qu﹏" then
		nNpcType = TYPE_GENERAL;
		SetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1,GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1)+1);
		if GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1) == GENERAL_COUNT then
			if GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1) == PIONEER_COUNT then
				if nEnemyNpcType == 2 then
					Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].." Чi tng ti猲 phong b� nh b筰,"..tCampNameZ[nEnemyCamp].." b� nh b筰, Nguy猲 So竔 xu蕋 hi謓. ");
				end;
				Try_To_Create_FightNPC("Nguy猲 So竔",nEnemyCamp);	--对方大将先锋被屠戮殆尽，对方元帅出
			end;
		end;
	elseif sNpcTypeName == "Nguy猲 So竔" then
		nNpcType = TYPE_MARSHAL;
		if PlayerIndex > 0 then
			Msg2MSAll(MISSION_ID,GetName().."  nh b筰, Nguy猲 So竔 phe "..tCampNameZ[nEnemyCamp]..", "..tCampNameZ[nPlayerCamp].."_gi祅h th緉g l頸 cu鑙 c飊g.");
		else
			Msg2MSAll(MISSION_ID,GetNpcName(npcIndex).."  nh b筰, Nguy猲 So竔 phe "..tCampNameZ[nEnemyCamp]..", "..tCampNameZ[nPlayerCamp].."_gi祅h th緉g l頸 cu鑙 c飊g.");
		end;
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_WINNER,nPlayerCamp);
		ClearMapNpc(MAPID);	
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	end;
	SetNpcDeathScript(npcIndex,"");
	return nNpcType;
end;

function tell_end(tArg)
	SetFightState(0);
	Say(tBattleName[BATTLE_TYPE].."  k誸 th骳, b筺 gi誸 頲 <color=yellow>"..BT_GetData(PTNC_KILL).."<color> ngi, t� tr薾 <color=yellow>"..BT_GetData(PTNC_DEATH).."<color> l莕. C竎 v�  r蕋 n� l鵦, h穣 chu萵 b� nh薾 ph莕 thng c馻 Ho祅g !",0);
end;
--根据NPC名字获取NPC的阵营
function get_npc_camp(szNpcName)
	local nNpcCamp = 0;
	if strsub(szNpcName,1,2) == "T鑞g" then
		nNpcCamp = SONG_ID;
	elseif strsub(szNpcName,1,2) == "Li猽" then
		nNpcCamp = LIAO_ID;
	else
		nNpcCamp = ALL_ID;
	end;
	return nNpcCamp;
end;
--根据NPC的名字获取NPC的类型
function get_npc_type(szNpcName)
	local nNameLen = strlen(szNpcName);
	return strsub(szNpcName,5,nNameLen);
end;