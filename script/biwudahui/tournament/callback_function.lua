--Create date:2008-1-9 10:29
--Author:yanjun
--Description:系统的回调脚本
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
g_szInfoHead = "";

--按钮回调函数
function OnButton(nBtID)
	local nSignUpInfo = GetTask(TSK_SIGN_UP);
	local nCurRealResult = GetTask(TSK_CURREALRESULT);	--当前较艺积分
	BWT_WeeklyClear();
	local nVersion,nCurGs = GetRealmType();
	if GetTaskTemp(TSK_TEMP_CAMP) ~= 0 then
		Talk(1,"","Kh玭g th� th鵦 hi謓 thao t竎 n祔!");
		return 0;
	end;
	local nLevel = GetLevel();
	if nBtID == 1 then	--“观看较艺”
		if nCurGs == 1 then
			Talk(1,"","Kh玭g th� th鵦 hi謓 thao t竎 n祔 � y.");
			return 0;
		end
		GLB_BW_ChangeItem();
		return 1;
	end;
	if nBtID == 2 then	--参加较艺
		if nCurGs == 1 then --在跨服区
			local selTab = {
				"Ta ch� mu鑞 tham gia 1 l莕 t� v� to祅 qu鑓/#join_list_confirm(1)",
				"T玦 ch� mu鑞 lu玭 tham gia t� v� to祅 qu鑓/#join_list_confirm(2)",
				"T筸 th阨 kh玭g tham gia/nothing",
			};
			Say("B筺 mu鑞 <color=yellow>tham gia 1 l莕 t� v� to祅 qu鑓<color> hay l� <color=yellow>lu玭 tham gia t� v� to祅 qu鑓<color>?",
				getn(selTab),
				selTab)
		else --在本服
			go_to_biwu_npc();
			return 1;
		end
	end;
	if nBtID == 3 then	--退出较艺
		BWT_QuitGestConvention();
		Talk(1,"","Ngi  ng鮪g so t礽.");
		return 1;
	end;
	if nBtID == 4 then	--领取奖励
		if nCurGs == 1 then
			Talk(1,"","Kh玭g th� th鵦 hi謓 thao t竎 n祔 � y.");
			return 0;
		end
		BWT_GetAward();
		return 1;
	end;
	if nBtID == 5 then	--登记积分
		if GetTask(TSK_CURWEEKMATCH) >= REQUIRE_MATCH_TIME then
			local nCurSignedResult = GetTask(TSK_CURSIGNEDRESULT);
			if nCurSignedResult ~= 0 and nCurRealResult <= nCurSignedResult then
				Talk(1,"","觤 so t礽 hi謓 gi� c馻 ngi th蕄 h琻 甶觤 ngi ng k� trc y, luy謓 t藀 th猰 r錳 h絥 n ng k�. <color=red>Nh璶g c莕 l璾 �: Khi 甶觤 th鵦 t� c馻 ngi th蕄 h琻 甶觤 ng k� 30 ho芻 nhi襲 h琻 n鱝, th� h� th鑞g s� cng ch� ng k�. Cho n猲, kh玭g n猲  cho 甶觤 th鵦 t� th蕄 h琻 甶觤 ng k� qu� nhi襲.<color>");
				return 0;
			end;
			local selTab = {
						"уng � ng k�/register_point_confirm",
						"T筸 th阨 kh玭g ng k�/nothing",
						}
			local szString1,szString2,szString3 = "","","";
			local nGetXinDeState = GetTask(TSK_GET_XINDE_STATE);
			local nCount = 0;
			if nGetXinDeState == 30 then
				szString1 = "<color=red>Х l穘h<color>";
				szString2 = "<color=red>Х l穘h<color>";
				szString3 = "<color=red>Х l穘h<color>";
			elseif nGetXinDeState == 20 then
				szString1 = "<color=red>Х l穘h<color>";
				szString2 = "<color=red>Х l穘h<color>";
				szString3 = "<color=yellow>Ch璦 l穘h<color>";
			elseif nGetXinDeState == 10 then
				szString1 = "<color=red>Х l穘h<color>";
				szString2 = "<color=yellow>Ch璦 l穘h<color>";
				szString3 = "<color=yellow>Ch璦 l穘h<color>";
			else
				szString1 = "<color=yellow>Ch璦 l穘h<color>";
				szString2 = "<color=yellow>Ch璦 l穘h<color>";
				szString3 = "<color=yellow>Ch璦 l穘h<color>";
			end;
			Say("120 甶觤 ng k� i 頲 10 quy觧 Th鵦 Chi課 T﹎ Ьc       "..szString1.."\n150 甶觤 ng k� i th猰 頲 10 quy觧 Th鵦 Chi課 T﹎ Ьc     "..szString2.."\n200 甶觤 ng k� c� th� i th猰 10 quy觧 Th鵦 Chi課 T﹎ Ьc     "..szString3.."\n觤 ng k� hi謓 gi� c馻 ngi l� <color=yellow>"..nCurSignedResult.."<color>, 甶觤 so t礽 hi謓 gi� c馻 ngi l� <color=yellow>"..nCurRealResult.."<color>, 11 gi� 30 t鑙 ch� nh藅 s� ti課 h祅h x誴 h筺g d鵤 theo 甶觤 ng k�, ngi x竎 nh薾 mu鑞 ng k� 甶觤 so t礽 hi謓 gi� c馻 m譶h ch�?",getn(selTab),selTab);
			return 1;
		else
			Talk(1,"","S� l莕 ngi tham gia so t礽 tu莕 n祔 輙 h琻 <color=yellow>"..REQUIRE_MATCH_TIME.."<color>, kh玭g th� ng k� 甶觤.");
			return 0;
		end;
	end;
	if nBtID == 6 then	--较艺说明
		know_detail();
		return 1;
	end;
	if nBtID == 7 then	--较艺查询
		if SubWorldID2Idx(100) < 0 then
			Talk(1,"","N琲 n祔 kh玭g th� ki觤 tra th玭g tin so t礽, h穣 n <color=yellow>Tuy襫 Ch﹗ ho芻 g莕 Tuy襫 Ch﹗<color> ch鋘 v祇 ph輒 n祔  ki觤 tra.");
			return 0;
		end;
		local nPIdx = 0;
		local nPoint = 0;
		local nLevel = 0;
		local szString = "Ngi c� 甶觤 cao nh蕋 trong cu閏 t� v� � th祅h n祔:\n"..gf_FormatStringLength("",20)..gf_FormatStringLength("觤 cao nh蕋",12)..gf_FormatStringLength("C蕄",4).."\n";
		nPIdx = GetPlayerByGestQueueIndex(GetGestQueueSize()-1);
		if nPIdx == 0 then
			szString = szString.."<color=yellow>"..gf_FormatStringLength("Чi h閕 t� v� Thi猲 H� е Nh蕋: ",20,0).."<color>"..gf_FormatStringLength("Ch璦",12)..gf_FormatStringLength("Ch璦",4).."\n";
		else
			nPoint = GetTask(TSK_CURREALRESULT,nPIdx);
			nLevel = GetLevel(nPIdx);
			szString = szString.."<color=yellow>"..gf_FormatStringLength(TB_BIWU_NAME[2]..": ",20,0).."<color>"..gf_FormatStringLength(nPoint,12)..gf_FormatStringLength(nLevel,4).."\n";
		end;
		Talk(1,"",szString);
		return 1;
	end;
end;

function OnOpenUI()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= g_nBWAwardBeginDate and GetTask(TSK_FIRST_OPEN_UI) ~= g_nBWAwardDate then
		local nYear,nMonth,nDay,nHour = gf_GetDateData(g_nBWAwardDate);
		--Say("    现在发布天下第一比武大会联赛奖励。\n    凡是<color=green>进了流派资格分排行榜或者得到资格分<color>的玩家，都有一份丰厚的奖励，可以领取一定数量的<color=green>"..g_szGloryAwardName.."<color>，同时将清空资格分。\n    比武积分在200分以下的玩家，积分增加100分，增加后的积分最多不超过200。\n    以后也会根据资格分不定期发放奖励。\n    请于<color=yellow>"..nYear.."年"..nMonth.."月"..nDay.."日"..nHour.."点前<color>到<color=green>汴京比武大会特使[173,176]<color>处领取你的奖励！",0);
		BWDH_SetTask(TSK_FIRST_OPEN_UI,g_nBWAwardDate);
	end;
end;
--=========================================================================================
function register_point_confirm()
	BWDH_SetTask(TSK_CURSIGNEDRESULT,GetTask(TSK_CURREALRESULT));
	local nRegPoint = GetTask(TSK_CURSIGNEDRESULT);
	local nGetXinDeState = GetTask(TSK_GET_XINDE_STATE);
	local nCount = 0;
	if nRegPoint >= 200 and nGetXinDeState < 30 then
		BWDH_SetTask(TSK_GET_XINDE_STATE,30);
		nCount = 30 - nGetXinDeState;
	elseif nRegPoint >= 150 and nGetXinDeState < 20 then
		nCount = 20 - nGetXinDeState;
		BWDH_SetTask(TSK_GET_XINDE_STATE,20);
	elseif nRegPoint >= 120 and nGetXinDeState < 10 then
		nCount = 10 - nGetXinDeState;
		BWDH_SetTask(TSK_GET_XINDE_STATE,10);
	end;
	if nCount > 0 then
		AddItem(2,1,1101,nCount);
		Msg2Player("B筺 nh薾 頲 "..nCount.." quy觧 Th鵦 Chi課 T﹎ Ьc");
	end;
	SignUpGestResult();	--将积分登记上去
	WriteLog("["..LOG_HEAD.."]:"..GetName().."觤 ng k� t� v�:"..nRegPoint.."Nh薾 頲"..nCount.." quy觧 Th鵦 Chi課 T﹎ Ьc");
	Talk(1,"","觤 c馻 ngi  ng k�.");
end;

function go_to_watch_confirm(nMapID)
	local nCurMapID = GetWorldPos();
	if nCurMapID ~= 100 and nCurMapID ~= 200 and nCurMapID ~= 300 then
		Talk(1,"","Ch� c� th� � Tuy襫 Ch﹗ v祇 xem t� v� ")
		return 0;
	end;
	if GetTaskTemp(TSK_TEMP_CAMP) ~= 0 or GetFightState() == 1 then
		Talk(1,"","Tr筺g th竔 hi謓 gi� c馻 ngi kh玭g th� th鵦 hi謓 thao t竎 n祔!");
		return 0;
	end;
	Pay(5000);
	UseScrollEnable(0);	--禁止使用回城符
--	SetLogoutRV(1);	--设置登陆点为城市重生点
--	UseMask(1,0);	--变为神秘人
	NewWorld(TB_MAPID[nMapID][1],1620,3180);
end;

function go_to_biwu_npc()
	if GetTaskTemp(TSK_TEMP_CAMP) ~= 0 or GetFightState() == 1 then
		Talk(1,"","Tr筺g th竔 hi謓 gi� c馻 ngi kh玭g th� th鵦 hi謓 thao t竎 n祔!");
		return 0;
	end;
--	if GetCash() < 5000 then
--		Talk(1,"","传送需要消耗50银，你身上不够。");
--		return 0
--	end
--	if Pay(500) == 1 then
		NewWorld(200,1390,2823);
--	end
end

function join_list_confirm(nType)
	if nType == 1 then	--只参加1次
		BWDH_SetTask(TSK_JOIN_LIST_TYPE,1);
		gf_ShowMsg("Ngi ng k� tham gia <color=yellow>so t礽 m閠 l莕<color>, sau khi so t礽 k誸 th骳 ngi s� t� ng <color=red>tho竧 ra<color>.");
	elseif nType == 2 then	--一直参加
		BWDH_SetTask(TSK_JOIN_LIST_TYPE,-1);
		gf_ShowMsg("Ngi  ng k� <color=yellow>tham gia so t礽 li猲 t鬰<color>.");
	end;
	BWT_JoinGestConvention();
end;

function realm_kick_player()
	local nHour = tonumber(date("%H%M"));
	local nVersion,nCurGs = GetRealmType();	
	if nCurGs == 1 then
		if nHour >= 2310 then
			local nOldIndex = PlayerIndex;			
			local tPlayers = GetMapPlayer(7100);
			for i = 1, getn(tPlayers) do
				PlayerIndex = tPlayers[i];
				ExitGame();
			end
			PlayerIndex = nOldIndex;
		end		
	end
end
--=========================================================================

function callback_open_biwudahui()
	if SubWorldID2Idx(7100) < 0 then return end
	--local nHour = tonumber(date("%H"));
	if BWT_CheckBiWuTime() == 1 then
		BWT_InitOneRound();
		local szMsg = "open a new biwudahui round..."
		gf_ShowDebugInfor(szMsg);
		if BWDH_DEBUG_VERSION == 1 then
			print(szMsg)
		end
	end;
	realm_kick_player();
end

callback_open_biwudahui();

