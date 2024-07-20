------------------------------------------------------------
-- 师门令书的脚本 shimenlingshu.lua
--
-- comment: 使用后师门贡献度获得2倍加成
-- creator: Tony(Jizheng)
-- Date   : Jan 18th, 2007
--
-- Item ID:  2,1,1016
------------------------------------------------------------

LAST_USE_DATE = 85
MULTI_COUNT = 86

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("B筺 mu鑞 d飊g <color=yellow>s� m玭 l謓h th�<color>? N� c� th� gi髉 b筺 nh薾  c鑞g hi課 s� m玭 g蕄 <color=yellow>2 l莕<color>.",
		2,
		"Л頲/use_shimenlingshu",
		"Kh玭g s� d鬾g/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

function use_shimenlingshu()
	local nPlayerRoute = GetPlayerRoute()
	if (nPlayerRoute == 0 or nPlayerRoute == 1 or nPlayerRoute == 5 or nPlayerRoute == 7 or
		nPlayerRoute == 10 or nPlayerRoute == 13 or nPlayerRoute == 16 or nPlayerRoute == 19) then
		Say("B籲g h鱱 ch璦 b竔 s�, kh玭g th� s� d鬾g s� m玭 l謓h th�!", 0)
		return
	end

	local nLastDate = GetTask(LAST_USE_DATE)
	local nMultiCount = GetTask(MULTI_COUNT)
	
	--		          年	       月	       日
	local nCurrTime = {date("%Y"), date("%m"), date("%d")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- 现在的日期
	
	if (nCurDate > nLastDate) then
		if (DelItem(2, 1, 1016, 1) == 1) then
			SetTask(LAST_USE_DATE, nCurDate)
			SetTask(MULTI_COUNT, 2)
			Say("B筺  d飊g <color=yellow>s� m玭 l謓h th�<color>, nh薾 頲  c鑞g hi課 s� m玭 g蕄 2 l莕!", 0)
			Msg2Player("B筺  d飊g s� m玭 l謓h th� nh薾 頲  c鑞g hi課 s� m玭 g蕄 2 l莕!")
		end
	elseif (nMultiCount == 2) then
		Say("B筺  d飊g 1 <color=yellow>S� m玭 l謓h th�<color>, ng祔 mai h穣 quay l筰!", 0)
	elseif (nMultiCount == 3) then
		Say("H玬 nay b筺  s� d鬾g 1 <color=yellow>S� m玭 l謓h k�<color>, ng祔 mai h穣 quay l筰!", 0)
	end
end;

