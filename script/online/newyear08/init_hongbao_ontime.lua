--08春节发放红包初始化脚本
--by vivi
--2008/01/11

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function main()
	if get_spring_festival_state() == 1 then
		SetMapTaskTemp(100,MAP_HONGBAO_NUM,0);
		SetMapTaskTemp(150,MAP_HONGBAO_NUM,0);
		SetMapTaskTemp(200,MAP_HONGBAO_NUM,0);
		SetMapTaskTemp(300,MAP_HONGBAO_NUM,0);
		SetMapTaskTemp(350,MAP_HONGBAO_NUM,0);
		SetMapTaskTemp(400,MAP_HONGBAO_NUM,0);
		Msg2SubWorld("Ni猲 S�  ph竧 h錸g bao, m鋓 ngi mau n nh薾!");	
--		AddLocalNews("新年使者已经在发放大红包了，大家快去抢啊！");	
	end		
end