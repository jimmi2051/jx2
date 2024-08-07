--create date:2007-07-09
--author:yanjun
--describe:帮会关卡管理者（关卡场地里面的NPC，用来保存进度和进行闯关的）
Include("\\script\\missions\\tong_mission\\main_function.lua");
g_THIS_FILE = "\\script\\missions\\tong_mission\\npc\\npc_stage_manager.lua";
g_szInfoHeader = "<color=green>T� Quang C竎 L穙 Nh﹏<color>: ";
function main()
	load_stage(GetMissionS(MS_TONG_NAME));
end;

function ask_reason()
	AskClientForString("leave","Nh� nh祅g r阨 kh醝...",1,32,"Sao ph秈 r阨 kh醝?");
end;	

function leave(sLeaveMsg)
	DelMSPlayer(MISSION_ID,ALL_CAMP);
	Msg2MSAll(MISSION_ID,GetName().."R阨 T� Quang C竎,  l筰 l阨 nh緉:"..sLeaveMsg);
end;

function know_rule()
	Talk(1,"main",g_szInfoHeader.."Sinh t錸 ch輓h l� quy t綾 c� b秐 nh蕋.");
end;

function go_out_room()
	local selTab = {
				"уng �/go_out_room_confirm",
				"H駓 b�/nothing",
				}
	Say(g_szInfoHeader.."Ngi c� ch綾 mu鑞 ra ngo筰 阯g?",getn(selTab),selTab);
end;

function go_out_room_confirm()
	SetPos(tPos_Out_Room[1],tPos_Out_Room[2]-10);
	SetTaskTemp(TSK_TEMP_STATUS,0);
	TM_StopTimeGuage(-1);
	Msg2MSAll(MISSION_ID,GetName().." 甶 ra t� n閕 阯g.");
end;

function apply_enter_in_room()
	if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
		return 0;
	end;
	local nNormalPlayerCount = TM_GetNormalPlayerCount();
	if nNormalPlayerCount >= MAX_NORMAL_PLAYER_COUNT then
		Talk(1,"main",g_szInfoHeader.."Trong bang  c� <color=yellow>"..MAX_NORMAL_PLAYER_COUNT.."<color> v� cao th� ti課 v祇 n閕 阯g, ngi h穣 ch� m閠 ch髏 x輚 n鱝 nh�.");
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	if TM_CheckNormalPlayer(nRoute) == 0 then
		Talk(1,"main",g_szInfoHeader.."N閕 阯g  c� <color=yellow>"..MAX_ROUTE_PLAYER_COUNT.."<color> v� cao th� c飊g h� ph竔 i hi謕, ngi h穣 i th猰 l骳 n鱝 nh�.");
		return 0;
	end;
	local nCurTime = GetTime();
	local nLastEnterTime = GetMissionV(MV_ENTER_TIME);
	--如果处于闯关阶段并且距离上次进入时间少于MIN_ENTER_INTERVAL
	if GetMissionV(MV_STAGE_OVER) ~= 1 and nCurTime - nLastEnterTime <= MIN_ENTER_INTERVAL then
		Talk(1,"",g_szInfoHeader.."c遪 <color=yellow>"..tf_GetTimeString(MIN_ENTER_INTERVAL-nCurTime+nLastEnterTime).."<color> m韎 c� th� ti課 v祇 n閕 阯g.");
		return 0;
	end;
	local nCurJob = IsTongMember();
	local szTongName = GetTongName();
	if (szTongName == GetMissionS(MS_TONG_NAME) and nCurJob ~= 0 and nCurJob <= 3) or LIMIT_VERSION == 0 then
		enter_in_room();	--帮会领导直接进入场地
	else
		sent_apply_to_tong_header();
	end;
end;

function sent_apply_to_tong_header()
	if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
		return 0;
	end;
	local nCurTime = GetTime();
	local nLastApplyTime = GetTask(TSK_APPLY_TIME);	--获得个人上次申请时间
	local nLastMSApplyTime = GetMissionV(MV_APPLY_TIME);	--获得Mission记录的上次玩家申请的时间
	if nCurTime - nLastMSApplyTime <= MIN_MS_APPLY_INTERVAL then
		Talk(1,"",g_szInfoHeader.."Hi謓 t筰  c� ngi ch琲 kh竎 b竜 danh v祇 n閕 阯g r錳, xin m阨 i th猰 l骳 n鱝.");
		return 0;
	end;
	if nCurTime - nLastApplyTime <= MIN_APPLY_INTERVAL then
		Talk(1,"",g_szInfoHeader.."c遪 <color=yellow>"..tf_GetTimeString(MIN_APPLY_INTERVAL-nCurTime+nLastApplyTime).."<color> m韎 c� th�  xu蕋 b竜 danh v祇 n閕 阯g.");
		return 0;		
	end;
	local _,__,tbTongHeader = TM_GetPlayerTable();
	local nHeaderCount = getn(tbTongHeader);
	local nOldPlayerIdx = PlayerIndex;
	local nMaxJob = 99999;
	if nHeaderCount <= 0 then
		Talk(1,"",g_szInfoHeader.."Hi謓 t筰 n閕 阯g kh玭g c� ngi th輈h h頿  x� l�  ngh� b竜 danh v祇 n閕 阯g n祔.");
		return 0;
	else
		SetMissionV(MV_PROPOSER,PlayerIndex);	--记录申请者的索引
		SetTask(TSK_APPLY_TIME,nCurTime);
		SetMissionV(MV_APPLY_TIME,nCurTime);
		Msg2MSAll(GetName().."B竜 danh v祇 n閕 阯g");
		Talk(1,"","Th玭g tin b竜 danh  頲 g鰅 甶!");
		local nMaxJobPlayerIdx = 0;
		local nCurJob = 0;
		for i=1,nHeaderCount do
			PlayerIndex = tbTongHeader[i];
			nCurJob = IsTongMember();
			if nCurJob ~= 0 and nCurJob < nMaxJob then	
				nMaxJobPlayerIdx = PlayerIndex;
				nMaxJob = nCurJob;
			end;
		end;
		PlayerIndex = nMaxJobPlayerIdx;	--职位最高的那位才可以批准
		Accept1v1(nOldPlayerIdx, GetName(nOldPlayerIdx).."B竜 danh v祇 n閕 阯g. C遪 kho秐g %d gi﹜", MIN_MS_APPLY_INTERVAL, g_THIS_FILE)
	end;
	PlayerIndex = nOldPlayerIdx;
end;

function OnAccept(nProposerIdx, nType)
	local nOldPlayerIdx = PlayerIndex;
	clear_apply_info();
	if nProposerIdx <= 0 then
		Talk(1,"","цi phng  r阨 kh醝 khu v鵦.");
		Msg2Player("цi phng  r阨 kh醝 khu v鵦");
		return 0;
	end;
	if nType == 0 then	--选择取消或操作超时
		PlayerIndex = nProposerIdx;
		Talk(1,"","B竜 danh v蒼 ch璦 頲 th玭g qua.");
		Msg2Player("B竜 danh v蒼 ch璦 頲 th玭g qua");
		PlayerIndex = nOldPlayerIdx;
		return 0;
	end;
	PlayerIndex = nProposerIdx;
	SetMissionV(MV_ENTER_TIME,GetTime());
	enter_in_room();
	PlayerIndex = nOldPlayerIdx;
	return 1;
end;

function clear_apply_info()
	SetMissionV(MV_APPLY_TIME,0);
	SetMissionV(MV_PROPOSER,0);
end;

function enter_in_room()
	if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
		return 0;
	end;
	SetPos(tPos_In_Room[1],tPos_In_Room[2]+10);
	SetTaskTemp(TSK_TEMP_STATUS,1);	
	Msg2MSAll(MISSION_ID,GetName().."Х ti課 v祇 n閕 阯g");
end;

function boss_info()
	local nCurStage = GetMissionV(MV_STAGE);
	if GetMissionV(MV_STAGE_OVER) == 1 then
		nCurStage = nCurStage + 1;
	end;
	Talk(1,"main",g_szInfoHeader..TB_BOSS_INFO[nCurStage]);
end;
--进入下一关
function next_stage()
	if GetTaskTemp(TSK_TEMP_HELPER) == 1 then
		Talk(1,"",g_szInfoHeader.."Ngo筰 tuy課 kh玭g th� kh雐 ng quan 秈.");
		return 0;
	end;
	if check_right() ~= 1 then
		return 0;
	end;
	local nPreStage = GetMissionV(MV_STAGE);	--上一关
	if nPreStage >= 4 then	--第4关之后
		init_stage(nPreStage+1);
	else
		remove_faction1();
	end;
end;

function remove_faction1()
	if check_right() ~= 1 then
		return 0;
	end;
	local selTab = {
				"Thi誹 L﹎/#remove_faction2(1)",
				"Л阯g M玭/#remove_faction2(2)",
				"Nga My/#remove_faction2(3)",
				"C竔 Bang/#remove_faction2(4)",
				"V� ng/#remove_faction2(5)",
				"Trang k�/remove_faction1_1",
				"Ch鋘 k誸 th骳/remove_faction_confirm",
				"Ta suy ngh� l筰!/nothing",
				}
	Say(g_szInfoHeader.."Xin m阨 b筺 ch鋘 b� lo筰 b鉵g h� v� <color=yellow>1<color>: ",getn(selTab),selTab);
end;

function remove_faction1_1()
	if check_right() ~= 1 then
		return 0;
	end;
	local selTab = {
				"Dng M玭/#remove_faction2(6)",
				"Ng� чc/#remove_faction2(7)",
				"C玭 L玭/#remove_faction2(8)",
				"Th髖 Y猲/#remove_faction2(10)",
				"Trang trc/remove_faction1",
				"Ch鋘 k誸 th骳/remove_faction_confirm",
				"Ta suy ngh� l筰!/nothing",
				}
	Say(g_szInfoHeader.."Xin m阨 b筺 ch鋘 b� lo筰 b鉵g h� v� <color=yellow>1<color>: ",getn(selTab),selTab);
end;

function remove_faction2(nFaction)
	local bStageOver = GetMissionV(MV_STAGE_OVER);
	if bStageOver ~= 1 then	--如果在关卡进行中操作是不起作用的
		return 0;
	end;
	if check_right() ~= 1 then
		return 0;
	end;
	if nFaction ~= nil then
		SetMissionV(MV_VALUE9,nFaction);
	end;
	local selTab = {
				"Thi誹 L﹎/#remove_faction_confirm(1)",
				"Л阯g M玭/#remove_faction_confirm(2)",
				"Nga My/#remove_faction_confirm(3)",
				"C竔 Bang/#remove_faction_confirm(4)",
				"V� ng/#remove_faction_confirm(5)",
				"Trang k�/remove_faction2_1",
				"Ch鋘 k誸 th骳/remove_faction_confirm",
				"Ta suy ngh� l筰!/nothing",
				}
	Say(g_szInfoHeader.."Xin m阨 b筺 ch鋘 b� lo筰 b鉵g h� v� <color=yellow>2<color>: ",getn(selTab),selTab);
end;

function remove_faction2_1()
	if check_right() ~= 1 then
		return 0;
	end;
	local selTab = {
				"Dng M玭/#remove_faction_confirm(6)",
				"Ng� чc/#remove_faction_confirm(7)",
				"C玭 L玭/#remove_faction_confirm(8)",
				"Th髖 Y猲/#remove_faction_confirm(10)",
				"Trang trc/remove_faction2",
				"Ch鋘 k誸 th骳/remove_faction_confirm",
				"Ta suy ngh� l筰!/nothing",
				}
	Say(g_szInfoHeader.."Xin m阨 b筺 ch鋘 b� lo筰 b鉵g h� v� <color=yellow>2<color>: ",getn(selTab),selTab);
end;

function remove_faction_confirm(nFaction)
	local bStageOver = GetMissionV(MV_STAGE_OVER);
	if bStageOver ~= 1 then	--如果在关卡进行中操作是不起作用的
		return 0;
	end;
	if nFaction == GetMissionV(MV_VALUE9) then
		Talk(1,"remove_faction2",g_szInfoHeader.."Ngi  ch鋘 lo筰 b鉵g h� v� n祔, xin m阨 ch鋘 1 lo筰 b鉵g h� v� kh竎.");
		return 0;
	end;
	if nFaction ~= nil then
		SetMissionV(MV_VALUE10,nFaction);
	end;
	local szFactionRemove = "";
	if GetMissionV(MV_VALUE9) ~= 0 then
		szFactionRemove = szFactionRemove..tb_Npc_Info[GetMissionV(MV_VALUE9)][2]
	end;
	if GetMissionV(MV_VALUE10) ~= 0 then
		szFactionRemove = szFactionRemove.." v�"..tb_Npc_Info[GetMissionV(MV_VALUE10)][2]
	end;
	local nPreStage = GetMissionV(MV_STAGE);	--上一关
	if szFactionRemove ~= "" then
		Msg2MSAll(MISSION_ID,"Quan 秈 n祔 b� nh鱪g lo筰 b鉵g h� v� sau: "..szFactionRemove);
	end;
	init_stage(nPreStage+1);
end;
--操作权限检查
function check_right()
	if GetTaskTemp(TSK_TEMP_STATUS) == 0 then
		return 0;
	end;
	local nCurJob = IsTongMember();
	if GetTaskTemp(TSK_TEMP_HELPER) == 1 then
		Talk(1,"",g_szInfoHeader.."Ngo筰 tuy課 kh玭g th� kh雐 ng quan 秈.");
		return 0;
	end;
	if nCurJob <= 0 or nCurJob > 3 then
		Talk(1,"",g_szInfoHeader.."Thao t竎 n祔 ph秈 頲 th鵦 hi謓 b雐 bang ch�, ph� bang ch� ho芻 trng l穙.");
		return 0;
	end;
	if GetMSPlayerCount(MISSION_ID,ALL_CAMP) < MIN_PLAYER_COUNT then
		Talk(1,"",g_szInfoHeader.."Hi謓 t筰 t鎛g s� ngi ch琲 輙 h琻 <color=yellow>"..MIN_PLAYER_COUNT.."<color> ngi, kh玭g th� b総 u vt 秈!	");
		return 0;
	end;
	if GetMissionV(MV_GET_BOX) == 1 then
		Talk(1,"",g_szInfoHeader.."Xin m阨 nh苩 b秓 rng r錳 m韎 ti誴 t鬰 v祇 秈 k� ti誴.");
		return 0;
	end;
	return 1;
end;

--进入某一关
function init_stage(nStage)
	if GetTaskTemp(TSK_TEMP_STATUS) == 0 then
		return 0;
	end;
	local bStageOver = GetMissionV(MV_STAGE_OVER);
	if bStageOver ~= 1 then	--如果在关卡进行中操作是不起作用的
		return 0;
	end;
	local nPreStage = GetMissionV(MV_STAGE);	--上一关
	Msg2MSAll(MISSION_ID,GetName().."Kh雐 ng 秈 "..(nPreStage+1)..".");
	TM_InitStage(nStage);	--初始化下一关
end;
--重置当前关卡
function reset_stage()
	local nStage = GetMissionV(MV_STAGE);
	TB_STAGE[nStage]:EndStage(0);
	SetMissionV(MV_STAGE,0);
end;
--读取进度
function load_stage(szTongName)
	ApplyRelayShareData(szTongName,0,0,g_THIS_FILE,"load_stage_callback");
end;

function load_stage_callback(szKey, nKey1, nKey2, nCount)
	local nStage = 0;
	gf_ShowDebugInfor(nCount);
	if nCount == 0 then
		nStage = 0;
	else
		nStage = GetRelayShareDataByKey(szKey,nKey1,nKey2,KEY_STAGE);
	end;
	gf_ShowDebugInfor(nStage);
	if nStage == nil then
		nStage = 0;
	end;
	if GetMissionV(MV_STAGE) == 0 then	--第一次点击时把之前的进度读进来
		SetMissionV(MV_STAGE,nStage);
	end;
	local selTab = {
				"Gi韎 thi謚 quy t綾/know_rule",
				}
	local bStageOver = GetMissionV(MV_STAGE_OVER);
	local nMissionState = GetMissionV(MV_MISSION_STATE);
	if nMissionState > MS_STATE_READY then	--准备时间结束后
		local nCurStage = GetMissionV(MV_STAGE);
		if bStageOver == 0 then	--只有正在打BOSS的时候才有此选项
			if DEBUG_VERSION == 1 then
				tinsert(selTab,"Reset 秈 hi謓 t筰 (Test)/reset_stage");
			end;
		end;
		if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
			if bStageOver == 1 and nCurStage < MAX_STAGE then
				tinsert(selTab,"B総 u vt 秈 (秈 "..(nStage+1)..")/next_stage");
				if DEBUG_VERSION == 1 then
					tinsert(selTab,"Ta mu鑞 vt 秈 1 (test)/#init_stage(1)");
					tinsert(selTab,"Ta mu鑞 vt 秈 2 (test)/#init_stage(2)");
					tinsert(selTab,"Ta mu鑞 vt 秈 3 (test)/#init_stage(3)");
					tinsert(selTab,"Ta mu鑞 vt 秈 4 (test)/#init_stage(4)");
					tinsert(selTab,"Ta mu鑞 vt 秈 5 (test)/#init_stage(5)");
					tinsert(selTab,"Ta mu鑞 vt 秈 6 (test)/#init_stage(6)");
				end;
			end;
			tinsert(selTab,"Tr� l筰 ngo筰 阯g	/go_out_room");
		else
			tinsert(selTab,"B竜 danh v祇 n閕 阯g/apply_enter_in_room");
		end;
	else
		tinsert(selTab,"L藀 t鴆 b総 u vt 秈/run_mission");
	end;
	if DEBUG_VERSION == 1 then
		tinsert(selTab,"K誸 th骳 秈 (test)/close_mission");
	end;
	tinsert(selTab,"Gi韎 thi謚 萵 s� T� Quang C竎/know_boss_info");
	tinsert(selTab,"M� rng	/open_box");
	tinsert(selTab,"Ta mu鑞 r阨 kh醝 n琲 y/ask_reason");
	tinsert(selTab,"Kh玭g c� vi謈 g�/nothing");	
	Say(g_szInfoHeader.."Nghe n鉯 n閕 阯g cao th� mu玭 v祅,  m� s鑞g s鉻 tho竧 kh醝 頲 n琲 y h譶h nh� kh玭g nhi襲 ngi, bang <color=yellow>"..szKey.."<color> n猲 c萵 th薾.",getn(selTab),selTab);
end;

function know_boss_info()
	local selTab = {
				"B鉵g h� v�/#know_boss_detail_info(0)",
				"秈 1: Li Y猲/#know_boss_detail_info(1)",
				"秈 2: B� Ki襲/#know_boss_detail_info(2)",
				"秈 3: Phong Dng, V﹏ Th飝/#know_boss_detail_info(3)",
				"秈 4: мa Huy襫/#know_boss_detail_info(4)",
				"秈 5: Ti誸 Ho祅h Th�/#know_boss_detail_info(5)",
				"秈 6: Thng C� H醓 K� L﹏ H醓 V�, Thng C� H醓 K� L﹏ L璾 Quang/#know_boss_detail_info(6)",
				"Ta ch� ti謓 阯g h醝 ch琲!/nothing",
				}
	Say(g_szInfoHeader.."",getn(selTab),selTab);
end;

function know_boss_detail_info(nType)
	Talk(1,"know_boss_info",g_szInfoHeader..TB_BOSS_INFO[nType]);
end;

function run_mission()
	local selTab = {
				"уng �/run_mission_confirm",
				"ьi m閠 t�	/nothing",
				}
	Say(g_szInfoHeader.."Ngi ch綾 ch緉 l藀 t鴆 kh雐 ng 秈 n祔?",getn(selTab),selTab);
end;

function run_mission_confirm()
	local nCurJob = IsTongMember();
	if nCurJob <= 0 or nCurJob > 3 then
		Talk(1,"",g_szInfoHeader.."Thao t竎 n祔 ph秈 頲 th鵦 hi謓 b雐 bang ch�, ph� bang ch� ho芻 trng l穙.");
		return 0;
	end;
	if GetMissionV(MV_STAGE_OVER) == MS_STATE_READY then
		RunMission(MISSION_ID);
		Talk(1,"",g_szInfoHeader.."B﹜ gi� ngi c� th� b総 u v祇 khu v鵦  vt 秈 頲 r錳 .");
	end;
end;

function team_enter_in_room()
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize == 0 then
		enter_in_room();
	else
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			enter_in_room();
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;

function close_mission()
	local selTab = {
				"уng �/close_mission_confirm",
				"Ta b蕀 nh莔 r錳/nothing",
				}
	Say(g_szInfoHeader.."X竎 nh mu鑞 k誸 th骳 秈 v� tho竧 kh醝 khu v鵦 n祔?",getn(selTab),selTab);
end;

function close_mission_confirm()
	CloseMission(MISSION_ID);
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"",g_szInfoHeader.."Ngi v蒼 ch璦 thu閏 v� rng c馻 m譶h.");
		return 0;
	end;
	OpenBox();
end;