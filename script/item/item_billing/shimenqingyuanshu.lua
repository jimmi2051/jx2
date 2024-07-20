
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 师门请愿书脚本
-- 作用：增加24小时内领取师门任务概率
-- Edited by StarryNight
-- 2007/01/16 16:50

-- 我的夜晚是你的白天
-- 当你醒时我梦里相见
-- 只为了和你再见一面
-- 我会不分昼夜的想念

-- ======================================================

USE_TIME = 558;
ADD_RATE = 2;--增加领取任务概率（单位：倍数）

function OnUse()
	
	Say("B筺 mu鑞 d飊g s� m玭 th豱h nguy謓 th�? N� c� th� gi髉 b筺 t╪g t� l� nh薾 nhi謒 v� s� m玭 ng蓇 nhi猲 g蕄 4 l莕 trong 24 gi�.",
	2,
	"уng �/confirm_use",
	"T筸 th阨 ch璦 s� d鬾g!/cancel_use"
	)

end

--确认使用师门请愿书
function confirm_use()

local use_time = GetTime();

	-- 如果还没有入门派就不能使用
	if GetPlayerFaction() == 0 then
		Say("B筺 ch璦 gia nh藀 m玭 ph竔, kh玭g th� s� d鬾g v藅 ph萴 n祔",0);
		return
	end

	if GetTime() - GetTask(USE_TIME) < 86400 then
		Say("B筺  d飊g s� m玭 th豱h nguy謓 th�, trong 24h kh玭g th� s� d鬾g ti誴",0)
		return
	end

	if DelItem(2,1,1019,1) == 1 then	
		SetTask(USE_TIME,use_time);
		Say("B筺  d飊g s� m玭 th豱h nguy謓 th�, trong 24h t� l� nh薾 nhi謒 v� s� m玭 ng蓇 nhi猲 g蕄 i",0)
	else
		Say("B筺 kh玭g mang s� m玭 th豱h nguy謓 th�, kh玭g th� s� d鬾g.",0)
	end
	
end

--取消使用师门请愿书
function cancel_use()

end