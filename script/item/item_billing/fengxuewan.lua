------------------------------------------------------------
-- 凤血丸的脚本 fengxuewan.lua
--
-- comment: 使用后直接到达4000师门声望
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1004
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("B筺 mu鑞 d飊g <color=yellow>Ph鬾g Huy誸 ho祅<color>? Sau khi ph鬰 d飊g  c鑞g hi課 s� m玭 s� t 4000 甶觤.",
		2,
		"Л頲/use_fengxue_wan",
		"Kh玭g s� d鬾g/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

function use_fengxue_wan()
	local nPlayerRoute = GetPlayerRoute()
	if (nPlayerRoute == 0 or nPlayerRoute == 1 or nPlayerRoute == 5 or nPlayerRoute == 7 or
		nPlayerRoute == 10 or nPlayerRoute == 13 or nPlayerRoute == 16 or nPlayerRoute == 19) then
		Say("Ch璦 b竔 s� h鋍 ngh� kh玭g th� d飊g Ph鬾g Huy誸 ho祅!", 0)
		return
	end

	local nCurFactionRepu = GetTask(336)
	if (nCurFactionRepu >= 4000) then
		Say("ч c鑞g hi課 s� m玭 c馻 b筺 tr猲 m鴆 <color=yellow>4000<color>, kh玭g c莕 d飊g th猰 Ph鬾g Huy誸 ho祅!", 0)
		return
	end
	
	local nCurLevel = GetLevel()
	if (nCurLevel < 72) then
		Say("B筺 ch璦 t c蕄 <color=yellow>72<color> kh玭g th� d飊g Ph鬾g Huy誸 ho祅!", 0)
		return
	end
	
	if (DelItem(2, 1, 1004, 1) == 1) then
		SetTask(336, 4000)
		Say("ч c鑞g hi課 s� m玭 c馻 b筺  t <color=yellow>4000<color>!", 0)
		Msg2Player("ч c鑞g hi課 s� m玭 c馻 b筺  t 4000!")
	end
end;

