-- =============================================================
-- FileName : wudang_baoguo.lua
-- Desc     : 武当boss掉落的包裹的脚本，门派boss任务中掉落的包裹，点击使用可以获得好多good东西的功能
-- Date     : Dec 26 2006
-- Creator  : Tony(Jizheng)
-- ID       : 2, 1, 958
-- =============================================================

-- 武当宝箱的脚本，发奖通用
Include("\\script\\task\\faction_boss\\boss_baoxiang_wudang.lua");

-- 默认使用的函数
function OnUse()
	-- 没有入流派就不能开箱子
	local nPlayerRoute = GetPlayerRoute()
	if (nPlayerRoute == 0 or nPlayerRoute == 1 or nPlayerRoute == 5 or nPlayerRoute == 7 or
		nPlayerRoute == 10 or nPlayerRoute == 13 or nPlayerRoute == 16 or nPlayerRoute == 19) then
		Say("B筺 v蒼 ch璦 b竔 s� h鋍 v�, t骾 qu� n祔 kh玭g th� m�!", 0)
		return
	end

	Say("B筺 x竎 nh m� t骾 th� t譶h n祔 ch�?",
		2,
		"уng �/confirm_get",
		"H駓 b�/cancel_dialog")
end;

-- 退出对话
function cancel_dialog()
end;

-- 确认打开包裹
function confirm_get()
	local nSel = random(1, 100)					-- 宝箱出东西的概率
	
	if (DelItem(2, 1, 958, 1) == 1) then		-- 把自己删除
		local nRand = random(1,1000);
		if nRand <= 300 then
		local nRandIdx = random(1,getn(tGaojiMiji[13]));
			AddItem(tGaojiMiji[13][nRandIdx][2],tGaojiMiji[13][nRandIdx][3],tGaojiMiji[13][nRandIdx][4],1);
			Msg2Player("Чi hi謕 m� T骾 t飝 th﹏, nh薾 頲 "..tGaojiMiji[13][nRandIdx][1]);
		else	
	
			if (nSel <= 37) then			-- 37%的概率，得到未开封的76级武器
				get_76_weapon()
				ModifyExp(3000000)
				Msg2Player("B筺 m� 頲 t骾 qu�, nh薾 頲 m閠 v� kh� c蕄 76 v� 3000000 甶觤 kinh nghi謒!")
			elseif (nSel <= 52) then		-- 15%   的概率，得到师门卷本上
				get_faction_misbook(0)
			elseif (nSel <= 61) then		-- 9%    的概率，得到师门卷本中
				get_faction_misbook(1)
			elseif (nSel <= 64) then		-- 3%    的概率，得到师门卷本下
				get_faction_misbook(2)
			elseif (nSel <= 88) then		-- 24%   的概率，得到师门套装二裤子
				get_suit_2_shoe()
				ModifyExp(3000000)
				Msg2Player("B筺 m� 頲 t骾 qu�, nh薾 頲 trang ph鬰 c馻 s� m玭 v� 3000000 甶觤 kinh nghi謒.")
			elseif (nSel <= 91) then		-- 3%    的概率，得到师门套装三头
				get_suit_3_head()
				Msg2Player("B筺 m� 頲 t骾 qu�, nh薾 頲 trang ph鬰 c馻 s� m玭")
			elseif (nSel <= 97) then		-- 6%    的概率，得到师门套装三首饰
				get_suit_3_deco()
				Msg2Player("B筺 m� 頲 t骾 qu�, nh薾 頲 b� trang s鴆 c馻 s� m玭!")
			elseif (nSel <= 100) then		-- 3%    的概率，得到大匠师手书
				AddItem(2, 0, 397, 1)
				Msg2Player("B筺 m� 頲 t骾 qu�, nh薾 頲 quy觧 m藅 t辌h!")
			end
		end
	end
end;
