-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北任务NPC骷髅王解除封印和死亡Script
-- By StarryNight
-- 2007/08/07 PM 11:05

-- ======================================================
-- 引用剧情任务文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

	if GetTask(TASK_XB_ID_02) == 8 then
		local strSay = {
			"竔�.d祬..u qu�!!&@%!#%......!? (Theo th莕 ch� m� C玭 L玭 m玭 nh﹏  c藀, c� th� s� gi秈 tr� phong 蕁 n祔)",
				KULOUWANG_CURSE[1].."/#Confirm_Curse(1)",
				KULOUWANG_CURSE[2].."/#Confirm_Curse(2)",
				KULOUWANG_CURSE[3].."/#Confirm_Curse(3)",
				"R阨 kh醝/Cancel_Curse"
				}
		SelectSay(strSay);			
	else
		local strTalk = {
			"竔�.d祬.u qu�!! &@%!#%....!",
			}
		TalkEx("",strTalk);
	end	
end;

--咒语确认
function Confirm_Curse(index)

local nCruseIndex = GetTask(KULOUWANG_CURSE_ID);
local nNpcIndex = GetTargetNpc();

	if nNpcIndex == nil then
		return
	end

	--咒语正确
	if nCruseIndex == index then
		ChangeNpcToFight(nNpcIndex);
		TaskTip("Gi秈 tr� phong 蕁 c馻 C� L﹗ vng th祅h c玭g, mau ti猽 di謙 n�.");
		Msg2Player("Gi秈 tr� phong 蕁 c馻 C� L﹗ vng th祅h c玭g, mau ti猽 di謙 n�.");
	else
		local strTalk = {
			"竔�.d祬.u qu�!! &@%!#%....!",
			"H譶h nh� kh玭g c� hi謚 qu� g�, l� n祇 l� th莕 ch� sai? V� h醝 C玭 L玭 m玭 nh﹏ 甶."
			}
		TalkEx("",strTalk);
	end
end

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nNpcIdx = 0;
		
	SetNpcLifeTime(index,15);--使得尸体消失
	nNpcIdx = CreateNpc("C� L﹗ vng", "C� L﹗ vng", 329,1620,3354);
	SetNpcScript(nNpcIdx, "\\script\\中原二区\\天师秘境\\npc\\骷髅王.lua");
	
	if nMemCount == 0 then -- 玩家未组队
		if GetTask(TASK_XB_ID_02) == 8 then
			DelItem(2,0,758,1);--斩妖符
			AddItem(2,0,717,1,1);--非常道符
			SetTask(TASK_XB_ID_02,9);
			SetTask(KULOUWANG_CURSE_ID,0);--清空骷髅王咒语
			TaskTip("Gi誸 C� L﹗ vng th祅h c玭g, mau n鉯 cho  t� C玭 L玭 bi誸.");
			Msg2Player("Gi誸 C� L﹗ vng th祅h c玭g, mau n鉯 cho  t� C玭 L玭 bi誸.");
		end;
  else
		for i=1,nMemCount do
			PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
      if GetTask(TASK_XB_ID_02) == 8 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
      	DelItem(2,0,758,1);--斩妖符
				AddItem(2,0,717,1,1);--非常道符
				SetTask(TASK_XB_ID_02,9);
				SetTask(KULOUWANG_CURSE_ID,0);--清空骷髅王咒语
				TaskTip("Gi誸 C� L﹗ vng th祅h c玭g, mau n鉯 cho  t� C玭 L玭 bi誸.");
				Msg2Player("Gi誸 C� L﹗ vng th祅h c玭g, mau n鉯 cho  t� C玭 L玭 bi誸.");
      end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
  end;
end

function Cancel_Curse()

end