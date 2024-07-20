--File name:create_boss_ontime.lua 
--Describe:三节连过，创建策划BOSS脚本
--Create Date:2006-8-22
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
function main()
	if Get_3festival_State() == 1 then
		local nNpcIndex = 0;
		local nBossIndex = 0;
		local tbBoss = {};
		local nCurHour = tonumber(date("%H"));
		for i=1,getn(tBossPos) do
			if SubWorldID2Idx(tBossPos[i][2]) ~= -1 and tBossInfo[i][5] == nCurHour then
				tinsert(tbBoss,i);
			end;
		end;
		if getn(tbBoss) == 0 then
			return 0;
		end;
		for i=1,getn(tbBoss) do
			nBossIndex = tbBoss[i];
			nNpcIndex = CreateNpc(tBossInfo[nBossIndex][1],tBossInfo[nBossIndex][3],tBossPos[nBossIndex][2],tBossPos[nBossIndex][3],tBossPos[nBossIndex][4]);
			SetNpcDeathScript(nNpcIndex,"\\script\\online\\3festival\\boss_death.lua");
			Msg2Global("Giang h� 竎 nh﹏"..tBossInfo[nBossIndex][3].."V藅 h緉 y猽 qu� nh蕋  xu蕋 hi謓"..tBossPos[nBossIndex][1]..", m鋓 ngi mau n !");
		end;
	end;
end;