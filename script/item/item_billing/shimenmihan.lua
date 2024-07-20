
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 师门密函脚本
-- 作用：领取一个师门随机任务
-- Edited by StarryNight
-- 2007/01/17 10:02

-- 我将在属于你的星座上留下一点点轨迹
-- 告诉你不要放弃不要放弃

-- ======================================================

Include("\\script\\task\\random\\task_head.lua");

USE_TIME = 559;

function OnUse()
	
	Say("B筺 mu鑞 d飊g s� m玭 m藅 h祄? N� c� th� gi髉 b筺 nh薾 nhi謒 v� s� m玭 ng蓇 nhi猲!",
	2,
	"уng �/confirm_use",
	"T筸 th阨 ch璦 s� d鬾g!/cancel_use"
	)

end

--确认使用师门密函
function confirm_use()

local nCoolDown = GetTime() - GetTask(USE_TIME);
local use_time = GetTime();

	-- 如果还没有入门派就不能使用
	if GetPlayerFaction() == 0 then
		Say("B筺 ch璦 gia nh藀 m玭 ph竔, kh玭g th� s� d鬾g v藅 ph萴 n祔",0);
		return
	end
	
	--之前已经领取师门任务则无法使用
	if GetTask(551) ~= 0 then
		Say("Ngi v蒼 ch璦 ho祅 th祅h nhi謒 v� s� m玭, l� n祇 mu鑞 h駓 b�  nh薾 nhi謒 v� m韎?",
		2,
		"Л頲/cancel_task",
		"H駓 b�/cancel_use"
		)
		return 0;
	end
	
	if nCoolDown < 7200 then
		Say("Trong 2 gi� kh玭g th� s� d鬾g li猲 ti誴 s� m玭 m藅 h祄, b筺 c遪"..TurnTime(7200-nCoolDown).." m韎 c� th� s� d鬾g.",0)
		return
	end

	if DelItem(2,1,1020,1) == 1 then	
		if CreateTask() == 1 then	--创建成功后才发通知　edited by yanjun 06-11-15
			RandomTaskTip("B筺 nh薾 頲 nhi謒 v� s� !");
			Msg2Player("N誹 li猲 t鬰 2 l莕 kh玭g th� ho祅 th祅h nhi謒 v� s� ph� giao s� b� m蕋 1 甶觤 danh v鋘g!");
			SetTask(USE_TIME,use_time);
		else
			AddItem(2,1,1020,1,1);--防止领取不了任务而补发一个师门秘籍
		end;
	else
		Say("B筺 kh玭g mang s� m玭 m藅 t辌h, kh玭g th� s� d鬾g.",0)
	end
	
end

--取消使用师门密函
function cancel_use()

end

--把一个秒数转换为时：分：秒
function TurnTime(nSec)

local nHour = floor(nSec/3600);
local nMinute = floor(mod(nSec,3600)/60); 
local nSecond = floor(mod((mod(nSec,3600)),60));
local str = "";

	str = " <color=yellow>"..nHour.."<color> gi� <color=yellow>"..nMinute.."<color> ph髏 <color=yellow>"..nSecond.."<color> gi﹜ ";
	
	return str

end

--清除原有任务状态
function cancel_task()

	SetTask(551,0);
	RemoveTrigger(100);

	Say("B筺 c� th� s� d鬾g M藅 H祄 S� m玭  t飝 � nh薾 nhi謒 v� s� m玭",0);
	
end