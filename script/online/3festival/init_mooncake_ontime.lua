--File name:init_mooncake_ontime.lua 
--Describe:三节连过，初始化月饼数量
--Create Date:2006-9-11
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")

function main()
	if Get_3festival_State() == 1 then
		SetMapTaskTemp(100,3,MAX_MOONCAKE_COUNT);
		SetMapTaskTemp(200,3,MAX_MOONCAKE_COUNT);
		SetMapTaskTemp(300,3,MAX_MOONCAKE_COUNT);
		Msg2SubWorld("Ni猲 s� 產ng ph竧 mi詎 ph� b竛h Trung Thu � Tuy襫 Ch﹗, Th祅h Й, Bi謓 Kinh, s� lng c� h筺, m鋓 ngi h穣 nhanh ch﹏ n l蕐!");
		AddGlobalNews("Ni猲 s� 產ng ph竧 mi詎 ph� b竛h Trung Thu � Tuy襫 Ch﹗, Th祅h Й, Bi謓 Kinh, s� lng c� h筺, m鋓 ngi h穣 nhanh ch﹏ n l蕐!");
	end;
end;