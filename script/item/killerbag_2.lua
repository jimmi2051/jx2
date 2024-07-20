-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 二级杀手包裹脚本                  
-- Edited by Starry                                 
-- 2005/12/5 PM 14:09                                    
                                                          
-- ======================================================
function OnUse()

local i = 0;
local j = 0;
local k = 0; 
local nCount = 0;
local nLuckyNum = 0;
local nNum = 0; 

	if DelItem(2,1,206,1) ~= 1 then
		return 0
	end
	
	--100%出高级药品:3个九转
	--AddItem(1,0,32,3,1);
	
	--50%出金锡
	if random(1,100) <= 50 then
		AddItem(2,1,149,1,1);
	end;
	
	--50%出陨铁
	if random(1,100) <= 50 then
		AddItem(2,2,8,1,1);
	end;
	
	--50%出陨铁碎片
	if random(1,100) <= 50 then
		AddItem(2,2,7,1,1);
	end;
		
	--50%出小块金锡
	if random(1,100) <= 50 then
		AddItem(2,1,148,1,1);
	end;
	
	--14%出神秘物品
	if random(1,100) <= 14 then
		local m = random(1,getn(SecretItem));
			AddItem(SecretItem[m][1],SecretItem[m][2],SecretItem[m][3],1,1);
	end; 
	
	--7.4%出套装帽子
	nNum = random(1,1000);
	
	if nNum <= 74 then
	local nRoute = GetPlayerRoute();
	local nbody = GetBody()  

			AddItem(SuitData[nRoute][nbody][1],SuitData[nRoute][nbody][2],SuitData[nRoute][nbody][3],1,1,-1,-1,-1,-1,-1,-1);
		
		return
	end;
		
	--12.9%出定制装备
	if nNum <= 203 then
	
		for i=1,getn(KillerBagData) do
			nCount = nCount + KillerBagData[i][1];
		end;
		
		nLuckyNum = random(1,nCount);
		nCount = 0;
		
		for i=1,getn(KillerBagData) do
			nCount = nCount + KillerBagData[i][1];
			if nCount>=nLuckyNum then
				k = getn(KillerBagData[i]);
				j = random(2,k);
				return AddItem(KillerBagData[i][j][1],KillerBagData[i][j][2],KillerBagData[i][j][3],KillerBagData[i][j][4],KillerBagData[i][j][5],KillerBagData[i][j][6],KillerBagData[i][j][7],KillerBagData[i][j][8],KillerBagData[i][j][9],KillerBagData[i][j][10],KillerBagData[i][j][11]);					
			end;
		end;
	end;
	
end;

KillerBagData = {
	--5级护身,5级戒指:经验提高2%;
	[1] = {14,{0,102,5,1,1,2,99,0,0,0,0},{0,102,15,1,1,2,99,0,0,0,0}},
	--5级护身,5级戒指:减需求2
	[2] = {29,{0,102,5,1,1,2,109,0,0,0,0},{0,102,15,1,1,2,109,0,0,0,0}},
	--60级武器,5级护身,5级戒指:力量13	根骨13	身法13;内功13	根骨13	洞察13;洞察13	身法13	根骨13
	[3] = {51,{0,102,5,1,1,5,95,5,94,5,96},
						{0,102,15,1,1,5,95,5,94,5,96},
						{0,102,5,1,1,5,98,5,94,5,97},
						{0,102,15,1,1,5,98,5,94,5,97},
						{0,102,5,1,1,5,97,5,96,5,94},
						{0,102,15,1,1,5,97,5,96,5,94},
						{0,0,11,1,1,3,86,5,98,3,64},
						{0,2,24,1,1,3,86,5,98,3,64},
						{0,0,11,1,1,3,85,5,95,3,63},
						{0,1,50,1,1,3,85,5,96,3,63},
						{0,9,83,1,1,3,85,5,97,3,63},
						{0,2,24,1,1,6,42,5,98,2,99},
						{0,10,72,1,1,3,86,5,98,3,64},
						{0,8,94,1,1,3,86,5,98,3,64},
						{0,5,37,1,1,3,85,5,95,3,63},
						{0,3,61,1,1,3,85,5,95,3,63},
						{0,6,105,1,1,3,85,4,95,2,63},
						{0,4,116,1,1,3,85,4,96,2,63},
						{0,11,9,1,1,3,86,5,98,3,64},
						{0,7,9,1,1,3,85,5,96,3,63},
						}
	}

SuitData = {

	--金刚之朝阳冠(少林俗家)
	[2] = {{0,103,251},{0,103,252}},
	--如来之朝阳冠(少林禅宗)
	[3] = {{0,103,351},{0,103,352}},
	--罗汉之朝阳冠(少林武宗)
	[4] = {{0,103,451},{0,103,452}},
	--侠客之朝阳冠(唐门)
	[6] = {{0,103,651},{0,103,652},{0,103,653},{0,103,654}},
	--观音之朝阳冠(峨嵋佛家)
	[8] = {{},{},{0,103,853},{0,103,854}},
	--玉女之朝阳冠(峨嵋俗家)
	[9] = {{},{},{0,103,953},{0,103,954}}, 
	--降龙之朝阳冠(丐帮净衣)
	[11] = {{0,103,1151},{0,103,1152},{0,103,1153},{0,103,1154}},
	--疯魔之朝阳冠(丐帮污衣)
	[12] = {{0,103,1251},{0,103,1252},{0,103,1253},{0,103,1254}},
	--真武之朝阳冠(武当道家)
	[14] = {{0,103,1451},{0,103,1452},{0,103,1453},{0,103,1454}},
	--一阳之朝阳冠(武当俗家)
	[15] = {{0,103,1551},{0,103,1552},{0,103,1553},{0,103,1554}},
	--车骑之战士冠(杨门枪骑)
	[17] = {{0,103,1751},{0,103,1752},{0,103,1753},{0,103,1754}},
	--扬威之定国冠(杨门弓骑)
	[18] = {{0,103,1851},{0,103,1852},{0,103,1853},{0,103,1854}},
	--幽珑之流云冠(五毒邪侠)
	[20] = {{0,103,2051},{0,103,2052},{0,103,2053},{0,103,2054}},
	--苗门之巫蛊冠(五毒蛊师)
	[21] = {{0,103,2151},{0,103,2152},{0,103,2153},{0,103,2154}},
}

SecretItem = {
	--龙骨
	[1] = {2,1,116},
	--尸王肋骨
	[2] = {2,1,118},
	--苍狼牙
	[3] = {2,1,113},
	--雷炎金沙
	[4] = {2,1,146},
	--防水油绸
	[5] = {2,1,114},
	--天衣无缝
	[6] = {2,1,147},
	--墨油
	[7] = {2,1,136},
	--染料
	[8] = {2,1,153},		
}
