--filename:newyear_notice.lua
--create date:2006-01-04
--author:yanjun
--describe:春节活动公告脚本
Include("\\script\\online\\春节活动\\newyear_head.lua")	

function main()
	local nDate = tonumber(date("%y%m%d"))
	local nHour = GetLocalTime();
	if (Check_Date() == 0) and NEWYEAR_SWITCH == 1 then
		if nHour == 9 or nHour == 15 or nHour == 19 or nHour == 22 then
			AddLocalNews("Ngi ch琲 ch� �, c遪 30 ph髏 n鱝 Ph骳 Th莕 s� ph竧 t苙g 50 h錸g bao � Th祅h Й, Bi謓 Kinh, Tuy襫 Ch﹗.")
			Msg2SubWorld("Ngi ch琲 ch� �, c遪 30 ph髏 n鱝 Ph骳 Th莕 s� ph竧 t苙g 50 h錸g bao � Th祅h Й, Bi謓 Kinh, Tuy襫 Ch﹗.")
		elseif nHour == 13 or nHour == 18 or nHour == 21 then
			AddLocalNews("Ngi ch琲 ch� �, c遪 30 ph髏 n鱝, Ni猲 Th� s� xu蕋 hi謓!")
			Msg2SubWorld("Ngi ch琲 ch� �, c遪 30 ph髏 n鱝, Ni猲 Th� s� xu蕋 hi謓!")
		end		
	end
end
