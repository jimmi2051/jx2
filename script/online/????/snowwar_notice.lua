--filename:snowwar_notice.lua
--create date:2006-01-18
--author:yanjun
--describe:打雪仗活动公告脚本
Include("\\script\\online\\春节活动\\newyear_head.lua")	

function main()
	local nDay = GetCurDate()
	local nMonth = GetCurMonth()
	local nHour = GetLocalTime()
	if ((nMonth == 1 and nDay >= 20) or (nMonth == 2 and nDay <= 5)) and NEWYEAR_SWITCH == 1 then
		AddLocalNews("Ch� �: c遪 30 ph髏 n鱝 � 5 khu v鵦 n衜 tuy誸 s� ph竧 t苙g 100 ph莕 qu� n╩ m韎!")
		Msg2SubWorld("Ch� �: c遪 30 ph髏 n鱝 � 5 khu v鵦 n衜 tuy誸 s� ph竧 t苙g 100 ph莕 qu� n╩ m韎!")
	end
end		
