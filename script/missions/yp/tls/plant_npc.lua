--玩家的太虚古树

Include("\\script\\missions\\yp\\award.lua");

function main() --npc树的对话
	Talk(1, "", "T輓h n╪g t筸 ng nh� !!!!")
	do return end
	-- local nNpcIDX = GetTargetNpc();
	-- local strNpcName = GetNpcName(nNpcIDX);
	-- local nCurStep = GetUnitCurStates(nNpcIDX,0);
	-- local nFinish = GetUnitCurStates(nNpcIDX,5);
	-- local nPlantTime = GetTask(TASK_FIELD_PVP_TREE_TIME);
	-- if GetNpcTempData(nNpcIDX, 1) == PlayerIndex then
		-- if nFinish == 0 then
			-- Talk(1,"","Ngi  nh薾 ph莕 thng c馻 c﹜ n祔!");
			-- return 0;
		-- end
		-- if nCurStep ~= 3 then
			-- Talk(1,"",format("C﹜ n祔 v蒼 ch璦 ch輓, c竎h th阨 gian ch輓 c遪 <color=yellow>%s<color>.",Get_Time_String(120*60 - (GetTime()-nPlantTime),"hms")));
		-- else
			-- Say("Ch骳 m鮪g, Th竔 H� C� Th�  ch輓.",
				-- 2,
				-- "\n Nh薾 ph莕 thng/#pl_getAward(1,"..nNpcIDX..")",
				-- "\nK誸 th骳 i tho筰/nothing")
		-- end
	-- else
		-- if nCurStep ~= 3 then
			-- Talk(1,"","Ta l� m閠 m莔 c﹜ nh�, mau mau trng th祅h!");
		-- else
			-- Say("M祏 xanh c馻 c祅h l� di 竛h n緉g m苩 tr阨, b筺 nh� nh祅g ng鰅 m飅 hng trong kh玭g kh�. V� s� k� 鴆 l筰 tr祅 v� trong u, h譶h d竛g quen thu閏  l筰 hi謓 ra trc m総.",
				-- 2,
				-- "\n Nh薾 ph莕 thng/#pl_getAward(2,"..nNpcIDX..")",
				-- "\nK誸 th骳 i tho筰/nothing")			
		-- end
	-- end
end

function pl_getAward(nType,nNpcIDX)
	if nType == 1 then
		if gf_Judge_Room_Weight(2,10,"") == 1 then
--			SetNpcLifeTime(nNpcIDX,0);
			SetTask(TASK_FIELD_PVP_TREE_IDX,0);
			SetTask(TASK_FIELD_PVP_TREE_TIME,0);
			SetTask(TASK_FIELD_PVP_TREE_SHOWTIME,0);
			AddUnitStates(nNpcIDX,5,-GetUnitCurStates(nNpcIDX,5));
--			Talk(1,"","奖励未加！");
			yp_aw_giveAward_11();
			local nNum = GetUnitCurStates(nNpcIDX,6);
			local nFinish = GetUnitCurStates(nNpcIDX,5); 			
			if nNum == 0 and nFinish == 0 then
				SetNpcLifeTime(nNpcIDX,0)
			end			
		end
	elseif nType == 2 then
		local nNum = GetUnitCurStates(nNpcIDX,6);
		local nFinish = GetUnitCurStates(nNpcIDX,5); 
		if nNum <= 0 then
			Talk(1,"","Х nh薾 ph莕 thng c馻 c﹜ n祔 r錳!");
			return 0;
		end
		local nLsatTime = GetTask(TASK_FIELD_PVP_TREE_AWARD_CD)
		if nLsatTime ~= 0 and GetTime() - nLsatTime < 60 then
			Talk(1,"","Gi穘 c竎h nh薾 thng l� 1 ph髏!");
			return 0;
		end
		if gf_Judge_Room_Weight(1,10,"") == 1 then
			SetTask(TASK_FIELD_PVP_TREE_AWARD_CD,GetTime());
			AddUnitStates(nNpcIDX,6,-1);
			if nNum == 1 and nFinish == 0 then
				SetNpcLifeTime(nNpcIDX,0)
			end
--			Talk(1,"","奖励未加！");
			yp_aw_giveAward_12();
		end
	end
end
