Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\settings\\static_script\\lib\\itemfunctions.lua")
Include("\\script\\class\\clause3.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\missions\\liangshan\\daily_tasks.lua")
Include("\\script\\missions\\liangshan\\head.lua")

Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")

Include("\\script\\equip_shop\\equip_shop_head.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

function giveItem(self)
	ItemCreate:create(self[1])
end
--�����һ�����
function exchange()
--	local szTitle = format("H�y l�a ch�n ph��ng th�c ��i")
--	local strtab = {
--			"\n ��i t�p v�t L��ng S�n C�u Ch�u Hi�n Vi�n/#show_equip_shop(19)",
--			"\n Ti�m Chi�n Cu�ng/_Open_ZhanKuang_Shop",
--			"\n N�ng c�p ��n ti�m Di�u D��ng/#show_equip_shop(3035)",
--			"\n Ph�n h�i/main",
--			"\n r�t lui/nothing",
--	};
--	Say(szTitle, getn(strtab), strtab)
--	local tDiaSel = {}
--	tinsert(tDiaSel,format(NpcSayInfo[14][10][2],NpcSayInfo[14][10][3][1]).."/jiuzhou_chg")
--	tinsert(tDiaSel,format(NpcSayInfo[14][10][2],NpcSayInfo[14][10][3][2]).."/xuanyuan_chg")
--	for i = 1,getn(TOthersChgInfo) do
--		tinsert(tDiaSel,(format(NpcSayInfo[14][10][2],TOthersChgInfo[i][1][1])..format(NpcSayInfo[14][10][4],TOthersChgInfo[i][2][1],TOthersChgInfo[i][2][2]).."/#other_chg("..i..")"))
--	end
--	tinsert(tDiaSel,NpcSayInfo[14][2].."/main")
--	tinsert(tDiaSel,NpcSayInfo[14][3].."/nothing")
--	Say(_name()..NpcSayInfo[14][10][1],getn(tDiaSel),tDiaSel)
end

function _Open_ZhanKuang_Shop()
	local szTitle = format("N�u ch�n s� d�ng trang b� Di�u D��ng n�ng c�p ��n trang b� Chi�n Cu�ng, xin ch� � s� <color=yellow> gi�m �� c��ng h�a <color>:\n")
	szTitle = format("%s 1. ch� c� trang b� Di�u D��ng +13,+14,+15 m�i ���c n�ng c�p\n", szTitle)
	szTitle = format("%s 2. n�ng c�p xong �� c��ng h�a s� b� gi�m: <color=yellow>+13 bi�n th�nh +0; +14,+15 bi�n th�nh +7<color>\n", szTitle)
	szTitle = format("%s 3. t�t c� <color=yellow> hi�u qu� ��nh h�n kh�ng ���c gi�<color>\n", szTitle)

	local strtab = {
			"\n mu�n m�/#show_equip_shop(3034)",
			"\n Ph�n h�i/exchange",
			"\n r�t lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end
--�����׵Ķһ�
--function jiuzhou_chg()
--	local tDiaSel = {}
--	tinsert(tDiaSel,NpcSayInfo[14][10][7].."/#Sale(49,100,1)")
--	for i = 1,getn(TJiuzhouChgInfo) do
--		tinsert(tDiaSel,format(format(NpcSayInfo[14][10][2],TJiuzhouChgInfo[i][1])..format(NpcSayInfo[14][10][4],TJiuzhouChgInfo[i][2],TJiuzhouChgInfo[i][3]).."/#jiuzhou_sel("..i..")"))
--	end
--	tinsert(tDiaSel,NpcSayInfo[14][2].."/exchange")
--	tinsert(tDiaSel,NpcSayInfo[14][3].."/nothing")
--	Say(_name()..NpcSayInfo[14][10][1],getn(tDiaSel),tDiaSel)
--end
--function jiuzhou_sel(nEquipDiff)
--	local tDiaSel = {}
--	--�����ɼ��
--	if (nEquipDiff == 4 or nEquipDiff == 5) then
--		local nPlayerRoute = GetPlayerRoute()
--		if gf_CheckPlayerRoute() ~= 1 then
--			Talk(1,"",format(LSSysTalk[15][4],TJiuzhouChgInfo[nEquipDiff][1]))
--			return
--		else
--			if nEquipDiff == 4 then
--				TGL_chg({TJiuzhouEquip[nEquipDiff][1][nPlayerRoute],TJiuzhouEquip[nEquipDiff][2][nPlayerRoute]},{TJiuzhouChgInfo[nEquipDiff][2],TJiuzhouChgInfo[nEquipDiff][3]})
--			else
--				TGL_chg(TJiuzhouEquip[nEquipDiff][nPlayerRoute],{TJiuzhouChgInfo[nEquipDiff][2],TJiuzhouChgInfo[nEquipDiff][3]})
--			end
--		end
--	else
--		local nPlayerBody = GetBody()
--		TGL_chg({TJiuzhouEquip[nEquipDiff][1][nPlayerBody],TJiuzhouEquip[nEquipDiff][2][nPlayerBody]},{TJiuzhouChgInfo[nEquipDiff][2],TJiuzhouChgInfo[nEquipDiff][3]})
--	end
--end
----��ԯװ���һ�
--function xuanyuan_chg()
--	local tDiaSel = {}
--	for i = 1,getn(TXuanyuanChgInfo) do
--		tinsert(tDiaSel,format(format(NpcSayInfo[14][10][2],TXuanyuanChgInfo[i][1])..format(NpcSayInfo[14][10][4],TXuanyuanChgInfo[i][2],TXuanyuanChgInfo[i][3]).."/#xuanyuan_sel("..i..")"))
--	end
--	tinsert(tDiaSel,NpcSayInfo[14][2].."/exchange")
--	tinsert(tDiaSel,NpcSayInfo[14][3].."/nothing")
--	Say(_name()..NpcSayInfo[14][10][1],getn(tDiaSel),tDiaSel)
--end
--function xuanyuan_sel(nEquipDiff)
--	local nPlayerRoute = GetPlayerRoute()
--	if gf_CheckPlayerRoute() ~= 1 then
--		Talk(1,"",_name()..LSSysTalk[15][4])
--		return
--	else
--		TGL_chg(TXuanyuanEquip[nEquipDiff][nPlayerRoute],{TXuanyuanChgInfo[nEquipDiff][2],TXuanyuanChgInfo[nEquipDiff][3]})
--	end
--end
----����
--function other_chg(nOtherSeq)
--	TGL_chg(TOthersChgInfo[nOtherSeq][1],TOthersChgInfo[nOtherSeq][2])
--end
----�һ�ͳһ����
--function TGL_chg(tEquipInfo,tConsumInfo)
--	local tDiaSel = {}
--	if getn(tEquipInfo) == 2 then
--		tinsert(tDiaSel,format(NpcSayInfo[14][10][6],tEquipInfo[1][1]).."/#TGL_chg_dtm("..tEquipInfo[1][2]..","..tEquipInfo[1][3]..","..tEquipInfo[1][4]..","..tConsumInfo[1]..","..tConsumInfo[2]..")")
--		tinsert(tDiaSel,format(NpcSayInfo[14][10][6],tEquipInfo[2][1]).."/#TGL_chg_dtm("..tEquipInfo[2][2]..","..tEquipInfo[2][3]..","..tEquipInfo[2][4]..","..tConsumInfo[1]..","..tConsumInfo[2]..")")
--	else
--		tinsert(tDiaSel,format(NpcSayInfo[14][10][6],tEquipInfo[1]).."/#TGL_chg_dtm("..tEquipInfo[2]..","..tEquipInfo[3]..","..tEquipInfo[4]..","..tConsumInfo[1]..","..tConsumInfo[2]..")")
--	end 
--	tinsert(tDiaSel,NpcSayInfo[14][2].."/exchange")
--	tinsert(tDiaSel,NpcSayInfo[14][3].."/nothing")
--	Say(_name()..format(NpcSayInfo[14][10][5],tConsumInfo[1],tConsumInfo[2]),
--		getn(tDiaSel),tDiaSel
--	)
--end
--function TGL_chg_dtm(nEquipid_1,nEquipid_2,nEquipid_3,nConsumInfo_1,nConsumInfo_2)
--	local tEquipInfo = {nEquipid_1,nEquipid_2,nEquipid_3}
--	local tConsumInfo = {nConsumInfo_1,nConsumInfo_2}
--	if TGL_money_check(tConsumInfo[1],tConsumInfo[2]) ~= 1 then
--		return
--	end
--	if TGL_money_del(tConsumInfo[1],tConsumInfo[2]) ~= 1 then
--		return
--	end
--	--���Ӵ���
--	local bAddFlag,nItemIndex  = 0,0
--	if tEquipInfo[1] == 0 then
--		bAddFlag,nItemIndex = AddItem(tEquipInfo[1],tEquipInfo[2],tEquipInfo[3],1,1,-1,-1,-1,-1,-1,-1)
--	else
--		bAddFlag,nItemIndex = AddItem(tEquipInfo[1],tEquipInfo[2],tEquipInfo[3],1)
--		--������Ʒ����ʱ��
--		if tEquipInfo[3] == 1067 then
--			SetItemExpireTime(nItemIndex,30*DAY_SECOND_NUM)
--		elseif tEquipInfo[3] == 1051 then
--			SetItemExpireTime(nItemIndex,7*DAY_SECOND_NUM)
--		end
--	end
--	if bAddFlag == 1 then
--		Msg2Player(format(LSMsgToPlayer[17],GetItemName(nItemIndex)))
--	else
--		WriteLog(format(SysLogInfo[1],GetName(),bAddFlag,tEquipInfo[1]))
--	end	
--end
----��Ʒ�ͽ�ǮЯ�����
--function TGL_money_check(nTGL,nMoney)
--	if GetItemCount(TTGLInfo[1],TTGLInfo[2],TTGLInfo[3]) < nTGL then
--		Talk(1,"",_name()..format(LSSysTalk[15][1],TTGLInfo[4],nTGL))
--		return 0
--	elseif GetCash() < (nMoney * 100 *100) then
--		Talk(1,"",_name()..format(LSSysTalk[15][2],nMoney))
--		return 0
--	elseif GetFreeItemRoom() < 1 then
--		Talk(1,"",_name()..LSSysTalk[15][3])
--		return 0
--	else
--		return 1
--	end
--end
----��Ʒɾ��
--function TGL_money_del(nTGL,nMoney)
--	if Pay(nMoney * 100 *100) ~= 1 then
--		Talk(1,"",_name()..format(LSSysTalk[15][2],nMoney))
--		return 0
--	elseif DelItem(TTGLInfo[1],TTGLInfo[2],TTGLInfo[3],nTGL) ~= 1 then
--		Talk(1,"",_name()..format(LSSysTalk[15][1],TTGLInfo[4],nTGL))
--		return 0
--	else 
--		return 1
--	end
--end
function main()
	--������ɽ�ؿ�ָ���������ȡ������
	if GetTask(2857) == 1 then
		SetTask(2857,0)
	end
	temp_Talk(T);
end

function _name()
	g_NpcName = g_NpcName or "<color=green>"..(GetNpcName(GetTargetNpc()) or "").."<color>:";
	return g_NpcName;
end

function join_consume(bTianJiaolingMode, bDelete)
--	if 1 == bDelete then
--		AddRuntimeStat(3,1,bTianJiaolingMode,1)
--	end
	if 1 == bTianJiaolingMode then
		if GetTeamMember(0) == PlayerIndex then
    		if GetItemCount(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3]) < N_JOIN_TIANJIAOLING_NEED then
    			Msg2Player(format(LSMsgToPlayer[13],T_TIANJIAOLING[4]))
    			return 0
    		end
    		if bDelete and bDelete == 1 then
        		--ɾ����Ʒ
        		if 1 ~= DelItem(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED) then
        			return 0
        		end
        		--Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED})
        		FireEvent("event_ib_cost", T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED)
        		--AddRuntimeStat(3,10,0,N_JOIN_TIANJIAOLING_NEED)
    		end
    	else
    		return 0
		end
	else
		local OldPlayerIndex = PlayerIndex;
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex > 0 then
    			local nCur,_ = ModifyEnergy(0, 1)
    			if nCur < N_JOIN_ENERGY_NEED then
    				MU_Msg2Team(format("[%s] tinh l�c kh�ng �� [%d] �i�m", GetName(), N_JOIN_ENERGY_NEED))
    				return 0
    			end
			end
		end
		if bDelete and bDelete == 1 then
    		for i = 1, GetTeamSize() do
    			PlayerIndex = GetTeamMember(i);
    			if PlayerIndex > 0 then
    				ModifyEnergy(-1*N_JOIN_ENERGY_NEED, 1)
    			end
    		end
		end
		PlayerIndex = OldPlayerIndex
	end
	return 1
end

function checkAll(bTianJiaolingMode)
--	do return 1,1,1 end
	
	local tLiupai = {};
	local bLiupai = 1;
	local bLevel = 1;
	local bEx = 1;
	local OldPlayerIndex = PlayerIndex;
	PlayerIndex = GetTeamMember(0)
	local nTown = GetWorldPos();
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetLevel() < NPlayerLevelMin then
			bLevel = 0;
		end
		if IsSleeping() == 1 then
			MU_Msg2Team(format(LSMsgToTeam[3],GetName()));
			bEx = 0;
		end
		if GetWorldPos() ~= nTown then
			MU_Msg2Team(format(LSMsgToTeam[4],GetName()))
			bEx = 0;
		end
		local nRoute = GetPlayerRoute()
		if gf_CheckPlayerRoute() ~= 1 then
			--print(LSMsgToTeam[5],GetName())
			MU_Msg2Team(format(LSMsgToTeam[5],GetName()))
			bEx = 0;
		end
		tLiupai[nRoute] = 1;
	end
	PlayerIndex = OldPlayerIndex;
	return bLiupai, bLevel, bEx;
end
function check(bTianJiaolingMode)
	local msg = LSLoginQuanli[1]
	local color = "";
	local ret = 1;
	if GetTeamSize() < NTeamMemberMin then
		color = "<color=red>";
		ret = 0;
	else
		color = "<color=green>"
	end
	msg = msg..color..format(LSLoginQuanli[2],NTeamMemberMin).."<color>"
	local _, bLevel, bEx = checkAll(bTianJiaolingMode);
	if bLevel ~= 1 then
		color = "<color=red>";
		ret = 0;
	else
		color = "<color=green>"
	end
	msg = msg..color..format(LSLoginQuanli[3],NPlayerLevelMin).."<color>"..LSLoginQuanli[4]
	if GetTeamMember(0) ~= PlayerIndex then
		color = "<color=red>";
		ret = 0;
	else--�ӳ����
		color = "<color=green>"
	end
	msg = msg..color..LSLoginQuanli[5]
	if bEx ~= 1 then
		ret = 0;
	end
	if 1 == ret then
		ret = join_consume(bTianJiaolingMode, 0)
	end
	return ret, msg;
end

function entry_jingli()
	entry(0, 0)
end
function entry_tianjiaoling()
	entry(1, 0)
end

function entry(bTianJiaolingMode, bSure)
	if CheckDailyNormalTimes() ~= 1 then
		return 0;
	end
	
	local tMaps = gf_GetDataTable(GetSameMaps(g_RealMapId));
	local nCount = getn(tMaps);
	if nCount >= 40 then
		Talk(1, "", _name()..LSSysTalk[2]);
		return
	end
	if 1 == bTianJiaolingMode then
		if not bSure or bSure ~= 1 then
			local tSay = {
				"��ng �/#entry(1,1)",
				"Ta ch� gh� qua th�i/nothing",
				}
			Say(format(NpcSayInfo[6][4][1],N_JOIN_TIANJIAOLING_NEED, T_TIANJIAOLING[4]),getn(tSay),tSay)
			return
		end
	end
	local bRet, msg = check(bTianJiaolingMode);
	if bRet ~= 1 then
		Talk(1, "", _name()..msg);
		return
	end
	
	if join_consume(bTianJiaolingMode,1) ~= 1 then
		return
	end

	createMission(g_RealMapId,bTianJiaolingMode)
end

function createMission(nOrgMapId,bTianJiaolingMode)
	local TASKID_LSB_TIMES_LIMIT = 3468
	local nOldIndex = PlayerIndex;
	local nMapID,nMapIdx = DynamicLoadMap(nOrgMapId);
	if mf_OpenMission(MISSION_ID,nMapID) == 1 then
		mf_SetMissionV(MISSION_ID,MV_MAP_INDEX,nMapIdx,nMapID);
		mf_SetMissionV(MISSION_ID,MV_RETURN_MAP_ID, GetWorldPos(),nMapID);
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			mf_JoinMission(MISSION_ID,1,nMapID);
			_stat_on_player_when_open_misson()--��������ʱ���������ͳ��
			--cdkey�
			SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(2)");	
		end
		PlayerIndex = nOldIndex;		
		if 1 == bTianJiaolingMode then
			SendScript2VM("\\script\\missions\\liangshan\\mission\\mission.lua", format("tStage_1:skip(1,%d)", nMapIdx))
		end
		
		_stat_when_open_mission(bTianJiaolingMode)--��������ʱ������ͳ��
		
		local oldPlayer = PlayerIndex
		for i=1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			SetTask(TASKID_LSB_TIMES_LIMIT,GetTask(TASKID_LSB_TIMES_LIMIT)+1);
		end
		PlayerIndex = oldPlayer;
	--SetTask(TASKID_LSB_TIMES_LIMIT,GetTask(TASKID_LSB_TIMES_LIMIT) + 1)
	else
		FreeDynamicMap(nMapID, nMapIdx);
	end
end
