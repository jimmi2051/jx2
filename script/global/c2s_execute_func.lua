-- 客户端要求执行的脚本

TRADE_EXPORT_LOCK_ID = 825
AUTO_LOCK_TIME_ID = 827

Include("\\script\\global\\get_offline_point.lua")
--Include("\\script\\global\\wuxing.lua")
--Include("\\script\\lib\\define.lua")
--Include("\\script\\lib\\task_id_manage.lua")
Include("\\script\\task\\global_task\\gtask_data.lua");
function main(dwParam)
        if dwParam >= 65536 then
                code = floor(dwParam / 65536);
                dwParam = mod(dwParam, 65536);
                return dostring(format("func_%d(%d)",dwParam, code))
        end
        dostring("func_"..dwParam.."(0)")
end

function cancel()
end

--离线时间兑换奖励
function func_5()
	offline_exchange_talk_main();
end
function func_1()
	MPUpdate("\\script\\master_prentice\\some_op.lua", "create_task_r2s", 1)
end

function func_9()
	SetPlayerScript("\\script\\missions\\yp\\biaotou_npc.lua");
	SendScript2VM("\\script\\missions\\yp\\biaotou_npc.lua", "bt_Talk_2_1()")
end

function func_10()
	SetPlayerScript("\\script\\missions\\yp\\biaotou_npc.lua");
	SendScript2VM("\\script\\missions\\yp\\biaotou_npc.lua", "bt_Talk_2_2()")
end
function func_11(id)
	if not id or id < 0 or id > 16 then return end
	SetPlayerScript("\\settings\\static_script\\misc\\missionaward.lua");
	SendScript2VM("\\settings\\static_script\\misc\\missionaward.lua", format("MA_OnOpen(%d)",id));
end

function func_12()
	SetPlayerScript("\\script\\missions\\yp\\yp_head.lua");
	SendScript2VM("\\script\\missions\\yp\\yp_head.lua", "yp_c2s_detail()")
end

function func_13()
	SetPlayerScript("\\script\\missions\\yp\\yp_head.lua");
	SendScript2VM("\\script\\missions\\yp\\yp_head.lua", "yp_c2s_getRqz()")
end
function func_32() 	-- 领奖
	tCampManage:ClearCampTaskID();
	SendScript2VM("\\script\\biwudahui\\wlzb_award.lua","exchange()");
end
function func_34()	-- 参战
	SendScript2VM("\\script\\biwudahui\\wlzb.lua",format("OnWant(%d,1)",PlayerIndex));
end
function func_35()	-- 观战
	SendScript2VM("\\script\\biwudahui\\wlzb.lua",format("OnView(%d)",PlayerIndex));
end
-- 锁定交易初始对话
function func_2()
	Say("Kh鉧 giao d辌h: B筺 c?th?ch鋘 th阨 gian kh鉧  kh鉧 giao d辌h ho芻 ch鋘 ch鴆 n╪g t?ng kh鉧 giao d辌h, gi韎 thi謚 c?th?sau ph莕 ch鋘 ch鴆 n╪g c?gi韎 thi謚 chi ti誸. Khuy課 kh輈h s?d鬾g ch鴆 n╪g kh鉧 giao d辌h t?ng c?th?b秓 m an to祅 cho t礽 kho秐 c馻 b筺!",
	    4,
	    "Ta mu鑞 kh鉧 giao d辌h di 24 ti課g/func_2_manual_24",
	    "Ta mu鑞 kh鉧 giao d辌h t?24 n 48 ti課g/func_2_manual_48",
	    "Ta mu鑞 thi誸 l藀 ch鴆 n╪g kh鉧 t?ng/func_2_auto",
	    "T筸 th阨 kh玭g th?kh鉧/cancel");
end

-- 自动锁定设置
function func_2_auto()
	local nSec = GetTask(AUTO_LOCK_TIME_ID)
	if (nSec <= 0) then
		Say("Kh鉧 giao d辌h: B筺 c?th?ch鋘 d遪g thi誸 l藀 t?ng kh鉧  ti課 h祅h kh鉧 giao d辌h t?ng. T?l莕 ng nh藀 sau n誹 kh玭g c?thi誸 l藀 th阨 gian kh鉧 giao d辌h ho芻 th阨 gian kh鉧 giao d辌h nh?h琻 th阨 gian d?ki課 kh鉧 giao d辌h th?IP m竬 s?thay i. L骳 n祔 c╪ c?v祇 d遪g ch鋘 t?ng kh鉧  kh鉧 giao d辌h trong 1 kho秐g th阨 gian.",
		    5,
		    "Sau khi online t?ng kh鉧 5 ph髏/#auto_lock_confirm(5)",
		    "Sau khi online t?ng kh鉧 15 ph髏/#auto_lock_confirm(15)",
		    "Sau khi online t?ng kh鉧 30 ph髏/#auto_lock_confirm(30)",
		    "Sau khi online t?ng kh鉧 60 ph髏/#auto_lock_confirm(60)",
		    "T筸 th阨 kh玭g th?kh鉧/cancel")
	else
		local nAutoMin = floor(nSec / 60)
		Say("Kh鉧 giao d辌h: B筺  ch鋘 kh鉧 t?ng "..nAutoMin.." ph髏. B筺 c?th?ch鋘 s鯽 th阨 gian kh鉧 t?ng c騨g c?th?t筸 th阨 h駓 ch鴆 n╪g kh鉧 t?ng: ",
		    6,
		    "Sau khi online t?ng kh鉧 5 ph髏/#auto_lock_confirm(5)",
		    "Sau khi online t?ng kh鉧 15 ph髏/#auto_lock_confirm(15)",
		    "Sau khi online t?ng kh鉧 30 ph髏/#auto_lock_confirm(30)",
		    "Sau khi online t?ng kh鉧 60 ph髏/#auto_lock_confirm(60)",
		    "X鉧 ch鴆 n╪g kh鉧 t?ng/#auto_lock_confirm(0)",
		    "T筸 th阨 kh玭g s鯽 th阨 gian kh鉧/cancel")
	end
end

-- 确认自动锁定的时间
function auto_lock_confirm(nParam)
	if (nParam <= 0) then
		Say("Kh鉧 giao d辌h: B筺  h駓 ch鴆 n╪g kh鉧 giao d辌h, c?th?g﹜ nguy hi觤 cho t礽 kho秐 c馻 b筺, b筺 x竎 nh薾 mu鑞 h駓?",
			2,
			"X竎 nh薾/#auto_lock_confirm_2(0)",
			"T筸 th阨 kh玭g s鯽 th阨 gian kh鉧/cancel")
	else
		Say("Kh鉧 giao d辌h: B筺 ch鋘 kh鉧 giao d辌h t?ng "..nParam.." ph髏, sau khi b筺 ng nh藀, n誹 kh玭g c?kh鉧 giao d辌h s?t?ng kh鉧 giao d辌h "..nParam.." ph髏. Khi b筺 ng nh藀 n誹 th阨 gian kh鉧 giao d辌h c馻 b筺 nh?h琻 "..nParam.." ph髏 c騨g s?t?ng kh鉧 giao d辌h "..nParam.." ph髏. B筺 mu鑞 m?ch鴆 n╪g kh鉧 t?ng?",
			2,
			"ng v藋/#auto_lock_confirm_2("..nParam..")",
			"T筸 th阨 kh玭g th?kh鉧/cancel")
	end
end

function auto_lock_confirm_2(nParam)
	local nSec = nParam * 60
	SetTask(AUTO_LOCK_TIME_ID, nSec)
	local nLastip, nCurip = GetLoginIP()
	
	WriteLog("[Kh鉧 giao d辌h]"..GetName().."Thi誸 l藀 kh鉧 giao d辌h, th阨 gian kh鉧 l?"..nParam.." ph髏, IP ng nh藀 "..nCurip..".");
	if (nParam <= 0) then
		Talk(1,"","Kh鉧 giao d辌h: B筺  h駓 ch鴆 n╪g kh鉧 giao d辌h!");
	else
		Talk(1,"","Kh鉧 giao d辌h: B筺  ch鋘 thi誸 l藀 th阨 gian kh鉧 giao d辌h t?ng <color=red>"..nParam.." ph髏<color>!");
	end
end

-- 手动锁定交易时间（24小时以下）
function func_2_manual_24()
	local nSec = GetTask(TRADE_EXPORT_LOCK_ID)
	if (nSec <= 0) then
		Say("Kh鉧 giao d辌h: B筺 ch鋘 d遪g th阨 gian kh鉧  thi誸 l藀 kh鉧 giao d辌h. Sau khi kh鉧, <color=red>t?l骳 b総 u kh鉧 n khi k誸 th骳 kh鉧 giao d辌h<color>, khi b筺 ng nh藀 l筰 s?kh玭g th?giao d辌h c竎 v藅 ph萴 nh?<color=red>ng﹏ lng, ng﹏ phi誹 v?t蕋 c?c竎 v藅 ph萴<color> v韎 ngi kh竎, c騨g kh玭g th?v鴗 b?nh璶g v蒼 c?th?nh薾 giao d辌h t?ngi kh竎.",
			8,
			"Ta mu鑞 kh鉧 giao d辌h 2h/#confirm_1_time(2)",
			"Ta mu鑞 kh鉧 giao d辌h 4h/#confirm_1_time(4)",
			"Ta mu鑞 kh鉧 giao d辌h 8h/#confirm_1_time(8)",
			"Ta mu鑞 kh鉧 giao d辌h12h/#confirm_1_time(12)",
			"Ta mu鑞 kh鉧 giao d辌h 16h/#confirm_1_time(16)",
			"Ta mu鑞 kh鉧 giao d辌h 20h/#confirm_1_time(20)",
			"Ta mu鑞 kh鉧 giao d辌h 24h/#confirm_1_time(24)",
			"T筸 th阨 kh玭g th?kh鉧/cancel");
	else
		local nLeftHour = floor(nSec / 3600)
		local nLeftMin = floor((nSec - nLeftHour * 3600) / 60)
		Say("Kh鉧 giao d辌h: B筺  kh鉧 giao d辌h. Hi謓 t筰 c遪 d?<color=red>"..nLeftHour.."h "..nLeftMin.." ph髏<color>. Sau khi b筺 ng nh藀 l筰 s?kh玭g th?giao d辌h <color=red>ng﹏ lng, ng﹏ phi誹 v?t蕋 c?v藅 ph萴<color> v韎 ngi kh竎 c騨g kh玭g th?v鴗 b? B筺 c?mu鑞 thi誸 l藀 l筰 thao t竎 kh鉧? H穣 ch??<color=red>Th阨 gian kh鉧 giao d辌h m韎 ch?c?th?l韓 h琻 th阨 gian kh鉧 giao d辌h c遪 l筰!<color>",
			8,
			"Ta mu鑞 kh鉧 giao d辌h 2h/#confirm_1_time(2)",
			"Ta mu鑞 kh鉧 giao d辌h 4h/#confirm_1_time(4)",
			"Ta mu鑞 kh鉧 giao d辌h 8h/#confirm_1_time(8)",
			"Ta mu鑞 kh鉧 giao d辌h12h/#confirm_1_time(12)",
			"Ta mu鑞 kh鉧 giao d辌h 16h/#confirm_1_time(16)",
			"Ta mu鑞 kh鉧 giao d辌h 20h/#confirm_1_time(20)",
			"Ta mu鑞 kh鉧 giao d辌h 24h/#confirm_1_time(24)",
			"T筸 th阨 kh玭g th?kh鉧/cancel");		
	end
end

-- 手动锁定交易时间（24小时 - 48小时）
function func_2_manual_48()
	local nSec = GetTask(TRADE_EXPORT_LOCK_ID)
	if (nSec <= 0) then
		Say("Kh鉧 giao d辌h: B筺 ch鋘 d遪g th阨 gian kh鉧  thi誸 l藀 kh鉧 giao d辌h. Sau khi kh鉧, <color=red>t?l骳 b総 u kh鉧 n khi k誸 th骳 kh鉧 giao d辌h<color>, khi b筺 ng nh藀 l筰 s?kh玭g th?giao d辌h c竎 v藅 ph萴 nh?<color=red>ng﹏ lng, ng﹏ phi誹 v?t蕋 c?c竎 v藅 ph萴<color> v韎 ngi kh竎, c騨g kh玭g th?v鴗 b?nh璶g v蒼 c?th?nh薾 giao d辌h t?ngi kh竎.",
			8,
			"Ta mu鑞 kh鉧 giao d辌h 1 ng祔 2h/#confirm_1_time(26)",
			"Ta mu鑞 kh鉧 giao d辌h 1 ng祔 4h/#confirm_1_time(28)",
			"Ta mu鑞 kh鉧 giao d辌h 1 ng祔 8h/#confirm_1_time(32)",
			"Ta mu鑞 kh鉧 giao d辌h 1 ng祔 12h/#confirm_1_time(36)",
			"Ta mu鑞 kh鉧 giao d辌h 1 ng祔 16h/#confirm_1_time(40)",
			"Ta mu鑞 kh鉧 giao d辌h 1 ng祔 20h/#confirm_1_time(44)",
			"Ta mu鑞 kh鉧 giao d辌h 1 ng祔 24h/#confirm_1_time(48)",
			"T筸 th阨 kh玭g th?kh鉧/cancel");
	else
		local nLeftHour = floor(nSec / 3600)
		local nLeftMin = floor((nSec - nLeftHour * 3600) / 60)
		Say("Kh鉧 giao d辌h: B筺  kh鉧 giao d辌h. Hi謓 t筰 c遪 d?<color=red>"..nLeftHour.."h "..nLeftMin.." ph髏<color>. Sau khi b筺 ng nh藀 l筰 s?kh玭g th?giao d辌h <color=red>ng﹏ lng, ng﹏ phi誹 v?t蕋 c?v藅 ph萴<color> v韎 ngi kh竎 c騨g kh玭g th?v鴗 b? B筺 c?mu鑞 thi誸 l藀 l筰 thao t竎 kh鉧? H穣 ch??<color=red>Th阨 gian kh鉧 giao d辌h m韎 ch?c?th?l韓 h琻 th阨 gian kh鉧 giao d辌h c遪 l筰!<color>",
			8,
			"Ta mu鑞 kh鉧 giao d辌h 1 ng祔 2h/#confirm_1_time(26)",
			"Ta mu鑞 kh鉧 giao d辌h 1 ng祔 4h/#confirm_1_time(28)",
			"Ta mu鑞 kh鉧 giao d辌h 1 ng祔 8h/#confirm_1_time(32)",
			"Ta mu鑞 kh鉧 giao d辌h 1 ng祔 12h/#confirm_1_time(36)",
			"Ta mu鑞 kh鉧 giao d辌h 1 ng祔 16h/#confirm_1_time(40)",
			"Ta mu鑞 kh鉧 giao d辌h 1 ng祔 20h/#confirm_1_time(44)",
			"Ta mu鑞 kh鉧 giao d辌h 1 ng祔 24h/#confirm_1_time(48)",
			"T筸 th阨 kh玭g th?kh鉧/cancel");		
	end
end

function confirm_1_time(nParam)

	local nSec = GetTask(TRADE_EXPORT_LOCK_ID)
	local nDesSec = nParam * 3600
	if (nDesSec < nSec) then
		Talk(1,"","Kh鉧 giao d辌h: Xin l鏸! Th阨 gian b筺 ch鋘 kh鉧 giao d辌h nh?h琻 th阨 gian c遪 l筰. V?th?kh玭g th?ti課 h祅h thao t竎 kh鉧 l筰.");
		return
	end

	local month = tonumber(date("%m"))
	local day = tonumber(date("%d"))
	local hour = tonumber(date("%H"))
	local minute = tonumber(date("%M"))

	local month1 = month
	local day1 = day
	local hour1 = hour + nParam
	
	if (hour1 >= 24) then
		hour1 = hour1 - 24
		day1 = day1 + 1
		
		if (hour1 >= 24) then
			hour1 = hour1 - 24
			day1 = day1 + 1
		end
		
		if (day1 > 31 and (month1 == 1 or month1 == 3 or month1 == 5 or month1 == 7 or month1 == 8 or month1 == 10)) then
			day1 = day1 - 31
			month1 = month1 + 1
		end
		if (month1 == 12 and day1 > 31) then
			day1 = day1 - 31
			month1 = 1
		end
		if (month1 == 2 and day1 > 28) then
			day1 = day1 - 28
			month1 = 3
		end
		if (day1 > 30 and (month1 == 4 or month1 == 6 or month1 == 9 or month1 == 11)) then
			day1 = day1 - 30
			month1 = month1 + 1
		end
	end

	Say("Kh鉧 giao d辌h: B筺 ch鋘 kh鉧 giao d辌h <color=red>"..nParam.."<color> gi? t?<color=red>"..month.."Nguy謙"..day.."Nh藅"..hour.." 甶觤"..minute.." ph髏 n "..month1.."Nguy謙"..day1.."Nh藅"..hour1.." 甶觤"..minute.." ph髏<color>, b筺 x竎 nh薾 mu鑞 kh鉧?",
		2,
		"\nX竎 nh薾/#confirm_2_time("..nParam..")",
		"\nKh玭g c莕/cancel");
end

function confirm_2_time(nParam)
	Say("Kh鉧 giao d辌h: B筺 ch鋘 kh鉧 giao d辌h <color=red>"..nParam.."<color> gi? b筺 x竎 nh薾 mu鑞 kh鉧?",
		2,
		"\nX竎 nh薾/#confirm_final_time("..nParam..")",
		"\nKh玭g c莕/cancel");
end

function confirm_final_time(nParam)
	local nSec = nParam * 3600
	SetTask(TRADE_EXPORT_LOCK_ID, nSec)
	local nLastip, nCurip = GetLoginIP()
	
	WriteLog("[Kh鉧 giao d辌h]"..GetName().." kh鉧 giao d辌h, th阨 gian kh鉧 l?"..nParam.." gi? IP ng nh藀 l?"..nCurip..".");
	Talk(1,"","Kh鉧 giao d辌h: B筺 ch鋘 kh鉧 giao d辌h <color=red>"..nParam.." gi?color> th祅h c玭g!");
end
function func_40()
	local nRet = OpenGTask();
end

function func_41()
	local nRet = FinishGTask();
end

function func_42(nTaskID)
	if not nTaskID or nTaskID == 0 then return end
	SetPlayerScript("\\script\\task\\global_task\\gtask_head.lua");
	SendScript2VM("\\script\\task\\global_task\\gtask_head.lua", format("tGtNpcMain:cancel_main(%d)",nTaskID));	
end

function func_43()
	SetPlayerScript("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua");
	SendScript2VM("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua", "vfs_open_JJ_shop()");	
end

function func_44()
	SetPlayerScript("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua");
	SendScript2VM("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua", "vfs_open_YJ_shop()");	
end

function func_45()
	SetPlayerScript("\\script\\missions\\nvn\\3v3\\3v3award.lua");
	SendScript2VM("\\script\\missions\\nvn\\3v3\\3v3award.lua", "get_3v3_last_week_award()");
end

function func_46()
	SetPlayerScript("\\script\\missions\\nvn\\3v3\\3v3award.lua");
	SendScript2VM("\\script\\missions\\nvn\\3v3\\3v3award.lua", "get_3v3_last_season_award()");
end

function func_47(nLotteryType)
	SetPlayerScript("\\script\\function\\lucky_box\\lb_head.lua");
	SendScript2VM("\\script\\function\\lucky_box\\lb_head.lua", format("_lb_DoAward(%d)", nLotteryType));
end

function func_48()
	SetPlayerScript("\\script\\function\\lucky_box\\lb_head.lua");
	SendScript2VM("\\script\\function\\lucky_box\\lb_head.lua", "_lb_UIChange_Clean()");
end

function func_49(nParam)
	local nLotteryType = nParam / 256;
	local nLotteryCount = mod(nParam, 256);
	SetPlayerScript("\\script\\isolate\\functions\\jubaozhai\\jbz_callback.lua");
	SendScript2VM("\\script\\isolate\\functions\\jubaozhai\\jbz_callback.lua", format("_jbz_DoAward(%d, %d)", nLotteryType, nLotteryCount));
end

function func_50()
	SetPlayerScript("\\script\\isolate\\functions\\jubaozhai\\jbz_callback.lua");
	SendScript2VM("\\script\\isolate\\functions\\jubaozhai\\jbz_callback.lua", "_jbz_Clean()");
end


function func_62()
	local szScript = "\\script\\isolate\\functions\\tong_title\\main.lua"
	SetPlayerScript(szScript);
	SendScript2VM(szScript, "tong_title_talk_main()")
end

function func_88()
	SetPlayerScript("\\script\\equip_shop\\equip_shop_head.lua");
	SendScript2VM("\\script\\equip_shop\\equip_shop_head.lua", "show_equip_shop(3080)");
end

