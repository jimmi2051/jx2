--create date:2007-08-06 15:30
--author:yanjun
--describe:systemtimetask.txt配置脚本，用来关闭所有的关卡
Include("\\script\\missions\\tong_mission\\main_function.lua");
function main()
	local nWeekTime = tonumber(date("%w"));
	if nWeekTime == 0 then	--星期天
		TM_CloseAllField();
		Msg2SubWorld("Vt 秈 產ng � giai 畂筺 i m韎, t蕋 c� c鯽 秈 s� ng. Xin m阨 ngi ch琲 h穣 i m閠 ch髏 r錳 m韎 ti誴 t鬰 vt 秈.")
	end;
end;