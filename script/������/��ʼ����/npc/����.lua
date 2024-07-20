-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 秦始皇陵NPC残腿Script
-- By StarryNight
-- 2007/06/26 PM 4:12

-- 安安静静地，安安静静地生活……

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local strTalk = {};

	--SetNpcLifeTime(index,15);--使得尸体消失
	
	if nMemCount == 0 then -- 玩家未组队
		if GetTask(TASK_XB_ID_01) == 13 then
			--第一次杀死残腿
			if GetTask(CANTUI_DEAD_STATE) == 0 then
				AddItem(2,0,751,1,1);--打倒残腿得到一品金刚令之残腿
				SetTask(CANTUI_DEAD_STATE,1);
				--还没杀死断臂
				if GetTask(DUANBI_DEAD_STATE) == 0 then
					strTalk = {};
					--TalkEx("",strTalk);
					TaskTip(" ti猽 di謙 n鑤 nh鱪g t猲 c遪 l筰.");
					Msg2Player(" ti猽 di謙 n鑤 nh鱪g t猲 c遪 l筰.");
				--已经杀死断臂
				elseif GetTask(DUANBI_DEAD_STATE) == 1 then
					strTalk = {};
					--TalkEx("",strTalk);
					SetTask(TASK_XB_ID_01,14);--回去找车轮霸王
					TaskTip("Х gi秈 quy誸 xong nh鱪g t猲 c遪 l筰 n猲 quay v� t譵 Xa Lu﹏ B� Vng.");
					Msg2Player("Х gi秈 quy誸 xong nh鱪g t猲 c遪 l筰 n猲 quay v� t譵 Xa Lu﹏ B� Vng.");
				end
			--之前已经杀死残腿
			elseif GetTask(DUANBI_DEAD_STATE) == 0 then
				strTalk = {};
				--TalkEx("",strTalk);
				TaskTip(" ti猽 di謙 n鑤 nh鱪g t猲 c遪 l筰.");
				Msg2Player(" ti猽 di謙 n鑤 nh鱪g t猲 c遪 l筰.");
			elseif GetTask(DUANBI_DEAD_STATE) == 1 then
				strTalk = {};
				--TalkEx("",strTalk);
				SetTask(TASK_XB_ID_01,14);--回去找车轮霸王
				TaskTip("Х gi秈 quy誸 xong nh鱪g t猲 c遪 l筰 n猲 quay v� t譵 Xa Lu﹏ B� Vng.");
				Msg2Player("Х gi秈 quy誸 xong nh鱪g t猲 c遪 l筰 n猲 quay v� t譵 Xa Lu﹏ B� Vng.");
			end
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 13 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
			--第一次杀死断臂
			if GetTask(CANTUI_DEAD_STATE) == 0 then
				AddItem(2,0,751,1,1);--打倒残腿得到一品金刚令之残腿
				SetTask(CANTUI_DEAD_STATE,1);
				--还没杀死断臂
				if GetTask(DUANBI_DEAD_STATE) == 0 then
					strTalk = {};
					--TalkEx("",strTalk);
					TaskTip(" ti猽 di謙 n鑤 nh鱪g t猲 c遪 l筰.");
					Msg2Player(" ti猽 di謙 n鑤 nh鱪g t猲 c遪 l筰.");
				--已经杀死断臂
				elseif GetTask(DUANBI_DEAD_STATE) == 1 then
					strTalk = {};
					--TalkEx("",strTalk);
					SetTask(TASK_XB_ID_01,14);--回去找车轮霸王
					TaskTip(" ti猽 di謙 n鑤 nh鱪g t猲 c遪 l筰.");
					Msg2Player(" ti猽 di謙 n鑤 nh鱪g t猲 c遪 l筰.");
				end
			--之前已经杀死残腿
			elseif GetTask(DUANBI_DEAD_STATE) == 0 then
				strTalk = {};
				--TalkEx("",strTalk);
				TaskTip(" gi誸 nh鱪g t猲 c遪 l筰.");
				Msg2Player(" gi誸 nh鱪g t猲 c遪 l筰.");
			elseif GetTask(DUANBI_DEAD_STATE) == 1 then
				strTalk = {};
				--TalkEx("",strTalk);
				SetTask(TASK_XB_ID_01,14);--回去找车轮霸王
				TaskTip("Х gi秈 quy誸 xong nh鱪g t猲 c遪 l筰 n猲 quay v� t譵 Xa Lu﹏ B� Vng.");
				Msg2Player("Х gi秈 quy誸 xong nh鱪g t猲 c遪 l筰 n猲 quay v� t譵 Xa Lu﹏ B� Vng.");
			end
		end;
	end;
	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
  end;
end
