--File name:waitstart_timer.lua
--Describe:报名结束后倒计时脚本
--Create Date:2006-4-19
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnTimer()
	if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) >= LEASTPLAYER then
		local timeleft = GetMissionV(MV_TIMELEFT);
		if timeleft == 0 then
			RunMission(MISSION_ID);
		else
			StopMissionTimer(MISSION_ID,WAITSTART_TIMER_ID);
			StartMissionTimer(MISSION_ID,WAITSTART_TIMER_ID,WAITSTART_TIME);
			SetMissionV(MV_TIMELEFT,timeleft-1);
			timeleft = timeleft*WAITSTART_TIME/18;
			Msg2MSAll(MISSION_ID,"Tr薾 u c遪"..timeleft.." Gi﹜ ");
		end;
	else
		Msg2MSAll(MISSION_ID,"Do s� ngi tham gia di"..LEASTPLAYER.." ngi, cu閏 畊a kh玭g th� ti課 h祅h!");
		CloseMission(MISSION_ID);
	end;
end;