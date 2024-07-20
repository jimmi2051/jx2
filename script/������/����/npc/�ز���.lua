-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 昆仑NPC秦不智Script
-- By StarryNight
-- 2007/08/16 AM 10:27

-- 大智若愚，不智者乃至智矣……

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\faction\\faction_head.lua")
NPC_NAME = "<color=green>T莕 B蕋 Tr�<color>: ";

--技能列表
SKILLS={
--昆仑天师
--太乙心法 (技能id=1017)
[1017]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={4,0,0,},
     --关键点（技能等级，玩家等级，消耗金钱，门派贡献度}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={3,13,0,0},
     [4]={10,27,0,0},
	 },
--雷祭 (技能id=1018)
[1018]={
     levelless={2,1,0,1017,1},
     [1]={1,10,300,0},
     [2]={1,10,0,0},
     },
--风祭 (技能id=1019)
[1019]={
     levelless={2,1,0,1017,1},
     [1]={1,10,300,0},
     [2]={1,10,0,0},
     },
--天雷符 (技能id=1020)
[1020]={
     levelless={4,1,0,1018,1},
     [1]={1,10,1000,0},
     [2]={2,12,800,0},
     [3]={3,15,0,0},
     [4]={7,27,0,0},
     },
--冰风诀 (技能id=1021)
[1021]={
     levelless={3,1,0,1019,1},
     [1]={1,10,1000,0},
     [2]={2,13,800,0},
     [3]={7,28,0,0},
     },
--御风诀 (技能id=1022)
[1022]={
     levelless={4,1,0,1019,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={3,15,0,0},
     [4]={6,24,0,0},
     },
--狂雷符 (技能id=1023)
[1023]={
     levelless={3,1,0,1020,1},
     [1]={1,20,8000,80},
     [2]={2,23,2500,80},
     [3]={7,33,0,80},
     },
--轰雷符 (技能id=1024)
[1024]={
     levelless={3,1,0,1020,1},
     [1]={1,30,27000,300},
     [2]={2,32,7500,300},
     [3]={6,40,0,300},
     },
--扬沙诀 (技能id=1025)
[1025]={
     levelless={4,1,0,1021,1},
     [1]={1,20,8000,80},
     [2]={2,21,1000,80},
     [3]={3,23,0,80},
     [4]={6,29,0,80},
     },
--罡风诀 (技能id=1026)
[1026]={
     levelless={4,1,0,1025,1},
     [1]={1,30,27000,300},
     [2]={2,31,7500,300},
     [3]={3,33,0,300},
     [4]={7,41,0,300},
     },
--爆雷符 (技能id=1027)
[1027]={
     levelless={3,1,0,1023,1},
     [1]={1,40,90000,700},
     [2]={2,42,24000,700},
     [3]={7,52,0,700},
     },
--仙风流散诀 (技能id=1028)
[1028]={
     levelless={4,1,0,1022,1},
     [1]={1,40,90000,700},
     [2]={2,41,24000,700},
     [3]={3,43,0,700},
     [4]={7,51,0,700},
     },
--五雷正法符 (技能id=1029)
[1029]={
     levelless={3,1,0,1024,1},
     [1]={1,40,90000,700},
     [2]={2,42,24000,700},
     [3]={8,54,0,700},
     },
--万雷碎星符 (技能id=1030)
[1030]={
     levelless={3,2,0,1027,1,1029,1},
     [1]={1,50,220000,1200},
     [2]={2,52,50000,1200},
     [3]={8,64,0,1200},
     },
--玄风缠意诀 (技能id=1031)
[1031]={
     levelless={5,2,0,1026,1,1028,1},
     [1]={1,50,220000,1200},
     [2]={2,53,70000,1200},
     [3]={5,62,0,1200},
     [4]={6,66,0,1200},
     [5]={7,70,0,1200},
     },
--无极风雷诀 (技能id=1032)
[1032]={
     levelless={5,2,1,1030,8,1031,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function main()
	if GetPlayerFaction() == 8 and GetPlayerRoute() == 22 then
		get_in_route(8, 23);
		return 0;
	end
	master_main(8,23)
end;
