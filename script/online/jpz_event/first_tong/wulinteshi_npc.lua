--File name:	wulinteshi_npc.lua
--Describe:		第一帮活动npc文件
--Create Date:	2008-07-17
--Author:		chenbenqian

Include("\\script\\online\\jpz_event\\first_tong\\first_tong_func.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\jpz_event\\first_tong\\mission_head.lua");
--==========================公共变量定义区域=============================

g_InfoHeader = "<color=green>V� L﹎ c S�<color>: "

tEnterPosTable =
{
	[1] = {969,1633,3263},
	[2] = {969,1610,3238},
	[3] = {969,1641,3236},
	[4] = {969,1581,3220},
	[5] = {969,1628,3176},
	[6] = {969,1578,3146},
	[7] = {969,1679,3115},
	[8] = {969,1641,3048},
	[9] = {969,1536,3039},
	[10] = {969,1565,2953},
	[11] = {969,1600,3004},
	[12] = {969,1604,3054},
}

--==============================主逻辑区域===============================
function main()
	if is_first_tong_jpz_open() == 0 then
		Say(g_InfoHeader.."H玬 nay kh玭g c� ho箃 ng bang h閕 tinh anh, i h玬 kh竎 h絥g n nh�.",0)
		return
	end

	local selTab = {
				"Ta mu鑞 tham gia ho箃 ng bang h閕 tinh anh/join_huashan",
				"Ta ch� n xem th�/nothing"
				}
	Say(g_InfoHeader.."Ho箃 ng bang h閕  b総 u, thi誹 hi謕 mu鑞 xem t譶h h譶h.",getn(selTab),selTab)

end

--参加第一帮活动
function join_huashan()
	if GetPlayerRoute() == 0 then
		Talk(1,"",g_InfoHeader.."V� m玭 ph竔 kh玭g th� tham gia ho箃 ng bang h閕 tinh anh!")
		return
	end
	
	local time_distance = START_TIME - Zgc_pub_today_sec_num_rtn()
	if time_distance > 0 then
		Talk(1,"",g_InfoHeader.."Ho箃 ng bang h閕 tinh anh v蒼 ch璦 b総 u, xin m阨 i! "..Zgc_pub_time_sec_change(time_distance,0).." _c� th� v祇!")
		return
	end
	
	local OldWorld = SubWorld
	SubWorld = SubWorldID2Idx(HUASHAN_MAP_ID)
	if SubWorld >= 0 then
		if GetMissionV(MV_MISSION_STATE) == 0 then
			Talk(1,"",g_InfoHeader.."Ho箃 ng bang h閕 tinh anh ch璦 b総 u, xin m阨 i th猰 ch髏 n鱝!")
		elseif GetMissionV(MV_MISSION_STATE) == 1 or GetMissionV(MV_MISSION_STATE) == 2 then
--			if GetMissionV(MV_TEAM_NUM) < MAX_TEAM_NUM then
				if check_enter() == 1 then
					goto_huashan()
				end
--			else
--				Talk(1,"",g_InfoHeader.."本次天下第一帮活动报名队伍数已达 "..MAX_TEAM_NUM.."，未能参加本次天下第一帮活动的玩家请等待下次活动的开始。")
--			end
--		elseif GetMissionV(MV_MISSION_STATE) == 2 then
--			Talk(1,"",g_InfoHeader.."天下第一帮活动已停止报名，未能参加本次活动的玩家请等待下次活动的开始。")
		elseif GetMissionV(MV_MISSION_STATE) == 3 then
			Talk(1,"",g_InfoHeader.."Ho箃 ng bang h閕 tinh anh  k誸 th骳, nh鱪g ngi ch璦 tham gia 頲 l莕 n祔 xin m阨 i l莕 ho箃 ng t韎.")
		else
			WriteLog(g_LogTitle.."[Error]: the state of MISSION is error, the error value is : "..GetMissionV(MV_MISSION_STATE) )
		end
	else
		WriteLog(g_LogTitle.."[Error]: In wulinteshi_npc.lua, the value of SubWorld is error, the error value is : "..SubWorld)
	end
	SubWorld = OldWorld
end

--传送到华山
function goto_huashan()
	local nRandom = random(1, getn(tEnterPosTable))
	local nOldPlayer = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			CleanInteractive()

			if NewWorld(tEnterPosTable[nRandom][1],tEnterPosTable[nRandom][2],tEnterPosTable[nRandom][3]) ~= 1 then
				Msg2Player("Chuy觧 a 甶猰 th蕋 b筰, i hi謕 kh玭g th� ti課 v祇 b秐  Hoa S琻")
				LeaveTeam()
				WriteLog(g_LogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] Sending failed, time : "..date("%Y%m%d%H%M"))
			end
		end
	end
	
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		AddMSPlayer(MISSION_ID,0)
		JoinMission(MISSION_ID,0)
--		Msg2Player("You have switched to the pk and die-without-fine condition!")
	end
	PlayerIndex = nOldPlayer

	SetMissionV(MV_TEAM_NUM, (GetMissionV(MV_TEAM_NUM)+1) )
	Msg2MSAll(MISSION_ID, GetName().." d蒼 d総 (g錷 c� "..GetTeamSize().."  ngi)  v祇 Hoa S琻, hi謓 t筰 � Hoa S琻 c� s� t� i  "..GetMissionV(MV_TEAM_NUM))
end

-- 队伍进入条件判断
function check_enter()
	local szItemName = "V� L﹎ L謓h B礽"
	local nSize = GetTeamSize()
	local nMapID = GetWorldPos()
	local szTongName = GetTongName()

	if is_team_captain() ~= 1 or is_tong_captain() ~= 1 then
		Talk(1,"",g_InfoHeader.."B総 bu閏 ph秈 bang ch� t� i m韎 c� th� ti課 v祇 頲")
		return 0
	end
	if nSize < 2 then
		Talk(1,"",g_InfoHeader.."S� ngi trong t� i ph秈 l韓 ho芻 b籲g 2 ngi")
		return 0
	end

	local OldPlayer = PlayerIndex
	for i=1, nSize do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			if GetTongName() ~= szTongName then
				PlayerIndex = OldPlayer
				Talk(1,"",g_InfoHeader.."Trong t� i c� ngi kh竎 bang h閕, kh玭g th� tham gia ho箃 ng bang h閕 tinh anh!")
				return 0
			end		
			if GetPlayerRoute() == 0 then
				PlayerIndex = OldPlayer
				Talk(1,"",g_InfoHeader.."V� m玭 ph竔 kh玭g th� tham gia ho箃 ng bang h閕 tinh anh!")
				return 0
			end
			if IsStalling() == 1 then
				PlayerIndex = OldPlayer
				Talk(1,"",g_InfoHeader.."Trong t� i v蒼 c� ngi 產ng b竛 h祅g, kh玭g th� tham gia ho箃 ng bang h閕 tinh anh!")
				return 0
			end
			if GetWorldPos() ~= nMapID then
				PlayerIndex = OldPlayer
		    	Talk(1,"",g_InfoHeader.."T蕋 c� th祅h vi猲 b総 bu閏 ph秈 trong c飊g 1 b秐 ")
				msg_2_team("T蕋 c� th祅h vi猲 b総 bu閏 ph秈 trong c飊g 1 b秐 ")
				return 0
			end
		end
	end
	PlayerIndex = OldPlayer

	--武林令牌存在检测
	if GetItemCount(2,1,29000) == 0 then
		Talk(1,"","Xin x竎 nh薾 tr猲 ngi c� mang <color=green>"..szItemName.."<color>!")
		return 0
	end
	--武林令牌扣除成功检测
	if DelItem(2,1,29000,1) == 0  then
		Talk(1,"","Xin x竎 nh薾 tr猲 ngi c� mang <color=green>"..szItemName.."<color>!")
		return 0
	end
	
	return 1
end
