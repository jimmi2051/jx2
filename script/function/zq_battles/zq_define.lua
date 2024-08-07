ZQ_MAP_ID = 6026; --地图ID

ZQ_ITEM_IB = {2, 1, 30481, "Ma Th筩h"} --核心IB道具

--记录军功值的任务变量
ZQ_CONST_JG_TASK = 701;

--阵营index
ALL_ID = 0;
SONG_ID = 1;
LIAO_ID = 2;

ZQ_tCampString = {
	[ALL_ID] = "camp_evil",
	[SONG_ID] = "camp_player",
	[LIAO_ID] = "camp_enemy",
}

ZQ_TICKET_CAST = 90000; --门票

ZQ_ITEM_FLAG = {
	[SONG_ID] = {2, 1, 30478, "T鑞g Qu﹏ Truy襫 L謓h K�"},
	[LIAO_ID] = {2, 1, 30479, "Li猽 Qu﹏ Truy襫 L謓h K�"},
}

ZQ_EXIT_POS = {300, 1802, 3364}  --退出点

--频道
ZQ_BATTLE_CHANNEL = {
	[ALL_ID] = {"K猲h chi課 trng", 39},
	[SONG_ID] = {"K猲h T鑞g", 40},
	[LIAO_ID] = {"K猲h Li猽", 41},
}

--采集道具
ZQ_CAIJI_ITEM = {
	{0, 200, 14, "Thi誸 ph�", 5000},
	{0, 200, 11, "Cu鑓 chim", 5000},
	{0, 200, 16, "Cu鑓 thu鑓", 5000},
}

--log
ZQ_szLogTitle = "zhenqi_battle";

--===============真气战场使用的任务变量============================================
ZQ_BATTLE_TASK1 = 3117 --第一字节记录当前的阵营,9-30记录任务，31记录阵灵计数生效
ZQ_BATTLE_TASK2 = 3118 --1-20记录任务,21,22表示当前修复阵灵的次数，23记录是否参加邪灵赌约,24表示是否参加重启封印,25,26,27表示修复所用的魔石数目,28,29记录买哪一个采集道具，30记录是否参加守卫阵灵，31记录是否参加修复阵灵
ZQ_BATTLE_TASK3 = 3119 --1-3字节记录采集是点击的道具的Index,第4字节记录触发器计数
ZQ_BATTLE_TASK4 = 3120 --第1,2字节记录当前采集的X坐标，第3,4字节记录X坐标，
ZQ_BATTLE_TASK5 = 3121 --记录采集目标的npc索引
ZQ_BATTLE_TASK6 = 3122 --第1字节守卫封印杀怪数,9位记录是否是IB模式，10,15记录参与小游戏的次数，16表示点击NPC生效，3、4记录第1个目标的table index
ZQ_BATTLE_TASK7 = 3124 --1,2记录第2个目标的table index，3,4记录第三个目标table index
ZQ_BATTLE_TASK8 = 3125 --第一字节表示当前猜拳的次数,第2个字节表示重启封印的次数,第三字节表示当前要重启的tableidx，25-27表示修复结果,29位表示是否正在重启一个封印，30位表示是否重启在读条,31重启封印是否老板模式
ZQ_BATTLE_TASK9 = 3126 --第一二字节表示守卫封印时间计数，第三四字节记录修复阵灵的timer计数
ZQ_BATTLE_TASK10 = 3127 --记录进入小关卡前的位置
ZQ_BATTLE_TASK11 = 3128 --第一二字节表示小关卡计时器,17为表示参加关卡的标记

--任务
ZQ_TASK_LIST = {
	[1] = {
		--{任务ID，任务变量，是否开放，是否已接}
		[1] = {111, ZQ_BATTLE_TASK1, 9, 10, "An Ninh"},
		[2] = {112, ZQ_BATTLE_TASK1, 11, 12, "Ti猽 nhc qu﹏ Li猽"},
		[3] = {113, ZQ_BATTLE_TASK1, 13, 14, "G苝 ma"},
		[4] = {114, ZQ_BATTLE_TASK1, 15, 16, "Thanh tr� c秐 tr�"},
		[5] = {115, ZQ_BATTLE_TASK1, 17, 18, "T玭 nghi猰 c馻 ngi ch誸"},
	},

	[2] = {
		[1] = {116, ZQ_BATTLE_TASK1, 19, 20, "Qu衪 d鋘 c秐 tr�"},
		[2] = {117, ZQ_BATTLE_TASK1, 21, 22, "Quy誸 di謙 qu﹏ T鑞g"},
		[3] = {118, ZQ_BATTLE_TASK1, 23, 24, "Th蕋 th�"},
		[4] = {119, ZQ_BATTLE_TASK1, 25, 26, "Ni襪 vinh d� c馻 th� t閏"},
		[5] = {120, ZQ_BATTLE_TASK1, 27, 28, "S� nh鬰"},	
	},

	[3] = {
		[1] = {121, ZQ_BATTLE_TASK1, 29, 30, "H錸 Quy C� Hng"},	
		[2] = {122, ZQ_BATTLE_TASK2, 1, 2, "Lng dc ph鑙 phng 1"},
		[3] = {123, ZQ_BATTLE_TASK2, 3, 4, "Lng dc ph鑙 phng 2"},
		[4] = {124, ZQ_BATTLE_TASK2, 5, 6, "C鴘 tr� thng binh"},
	},

	[4] = {
		[1] = {125, ZQ_BATTLE_TASK2, 7, 8, "Si猽  vong h錸"},	
		[2] = {126, ZQ_BATTLE_TASK2, 9, 10, "Nguy猲 li謚 n dc 1 "},
		[3] = {127, ZQ_BATTLE_TASK2, 11, 12, "Nguy猲 li謚 n dc 2"},
		[4] = {128, ZQ_BATTLE_TASK2, 13, 14, "D騨g gi� b蕋 t�"},
	},

	[5] = {
		[1] = {129, ZQ_BATTLE_TASK2, 15, 16, "Th蕋 tinh hoa"},	
		[2] = {130, ZQ_BATTLE_TASK2, 17, 18, "T� Kim M閏"},
		[3] = {131, ZQ_BATTLE_TASK2, 19, 20, "Kho竛 tinh thi誸"},
	},
}

ZQ_TASK_TOTAL = 5;

--任务使用的任务变量
ZQ_KILL_PLAYER_SONG = 3113;
ZQ_KILL_PLAYER_LIAO = 3114;
ZQ_CURE_SONG = 3115;
ZQ_CURE_LIAO = 3116;

--采集
ZQ_TASK_QXH = 3129;
ZQ_TASK_ZJM = 3130;
ZQ_TASK_JTK = 3131;

--最大击杀数目
ZQ_KILL_PLAYER_SONG_MAX_COUNT = 10;
ZQ_KILL_PLAYER_LIAO_MAX_COUNT = 10;
--最大治愈数量
ZQ_CURE_SONG_MAX_COUNT = 3;
ZQ_CURE_LIAO_MAX_COUNT = 3;

--玩家死亡脚本
ZQ_PLAYER_DEATH_SCRIPT = "\\script\\function\\zq_battles\\zq_player_death.lua";

--有任务击杀玩家获得真气
ZQ_TASK_KILLPLAYER_AWARD = 5;

--采集表
ZQ_GATHER_LIST = {
		--{"工具", "任务", "需消耗的耐久", "获得的物品", "消耗耐久的道具", "采集特效"，"采集次数任务变量记录"}
		["T� Kim M閏"] = {"Thi誸 ph�", 130, 10, {2, 1, 30461, 1}, {0, 200, 14}, 1, ZQ_TASK_ZJM},
		["Kho竛 tinh thi誸"] = {"Cu鑓 chim", 131, 10, {2, 1, 30462, 1}, {0, 200, 11}, 3, ZQ_TASK_JTK},
		["Th蕋 tinh hoa"] = {"Cu鑓 thu鑓", 129, 10, {2, 1, 30463, 1}, {0, 200, 16}, 4, ZQ_TASK_QXH},	
}

--采集读条的时间s
ZQ_GATHER_TIME = 3;

--开启补给包花费
ZQ_OPEN_PAK_COST_L1 = 0;
ZQ_OPEN_PAK_COST_L2 = 8;
ZQ_OPEN_PAK_COST_L3 = 25;

--天门阵补给箱奖励表
ZQ_TMZ_PAK_AWARD = {
	--必得奖励
	ConstAward = {
		[ZQ_OPEN_PAK_COST_L1] = {
			{2, 33, 150000, 1},
			{28, 33, 25, 1},
			{32, 34, 30, 1},
		},
		[ZQ_OPEN_PAK_COST_L2] = {
			{1, 25, "Ma Th筩h", {2, 1, 30481, 1}, 0},
   		{2, 25, 400000, 1},
   		{28, 25, 100, 1},
   		{32, 25, 150, 1},
		},
		[ZQ_OPEN_PAK_COST_L3] = {
			{1, 25, "Ma Th筩h", {2, 1, 30481, 2}, 0},
   		{2, 25, 800000, 1},
   		{28, 25, 200, 1},
   		{32, 25, 300, 1},
		},
	},
	--随机奖励
	RandomAward = {
		[ZQ_OPEN_PAK_COST_L1] = {
			{1, 20, "Ma Th筩h", {2, 1, 30481, 1}, 0},
			{3, 5, 10000, 1},
			{3, 10, 20000, 1},
			{3, 5, 40000, 1},
			{27, 10, 150, 1},
			{27, 5, 300, 1},
			{27, 5, 450, 1},
			{4, 5, 1, 1},
			{4, 10, 2, 1},
			{4, 5, 3, 1},
			{5, 5, 2, 1},
			{5, 10, 4, 1},
			{5, 5, 6, 1},
		},
		[ZQ_OPEN_PAK_COST_L2] = {
			{1, 10, "Ma Th筩h", {2, 1, 30481, 1}, 0},
			{3, 8, 20000, 1},
			{3, 4, 40000, 1},
			{3, 1, 80000, 1},
			{27, 20, 200, 1},
			{27, 8, 400, 1},
			{27, 2, 600, 1},
			{4, 18, 2, 1},
			{4, 8, 3, 1},
			{4, 2, 4, 1},
			{5, 10, 3, 1},
			{5, 7, 6, 1},
			{5, 2, 9, 1},
		},
		[ZQ_OPEN_PAK_COST_L3] = {
			{1, 10, "Ma Th筩h", {2, 1, 30481, 1}, 0},
			{3, 8, 40000, 1},
			{3, 4, 80000, 1},
			{3, 1, 120000, 1},
			{27, 20, 300, 1},
			{27, 8, 600, 1},
			{27, 2, 900, 1},
			{4, 18, 3, 1},
			{4, 8, 4, 1},
			{4, 2, 5, 1},
			{5, 10, 4, 1},
			{5, 7, 8, 1},
			{5, 2, 12, 1},
		},
	},		
}

--修复封印NPC表
ZQ_REPAIRREAL_NPC = {
	{"B筩h T� Gi竎", "ZM_baixijiao",	1631, 3289},
	{"Kim Vng Gi竝", "ZM_jinwangjia",	1610, 3266},
	{"Th竔 S� M謓h Th筩h", "ZM_taichumingshi",	1578, 3290},
	{"H錸g Tr莕 T�", "ZM_hongchensi",	1577, 3325},
	{" Tr莔 M閏", "ZM_chenyinmu",	1628, 3284},
	{"Lam B輈h Th筩h", "ZM_lanbishi",	1606, 3271},
	{"H� Sa B�", "ZM_hushapi",	1574, 3294},
	{"K� Huy誸 Th筩h", "ZM_jixueshi",	1581, 3329},
	{"Чi La Tinh Kim", "ZM_dalujinjin",	1629, 3279},
	{"Tuy誸 Tinh", "ZM_xuejing",	1602, 3274},
	{"K譶h Vng n", "ZM_jingwangdan",	1570, 3298},
	{"H綾 V╪ Long Kim", "ZM_heiwenlongjin",	1584, 3333},
	{"B╪g Tinh Th筩h", "ZM_binjingshi",	1633, 3282},
	{"V� C鵦 Thi誸", "ZM_wujitie",	1607, 3276},
	{"Y猽 H鉧 C鑤", "ZM_yaohuagu",	1574, 3301},
	{"Ti猲 L鬰 L� Tinh", "ZM_xianlvleijing",	1585, 3323},
	{"T� Linh Th駓 Tinh", "ZM_zilingshuijin",	1635, 3285},
	{"Linh C鑤 Ng鋍", "ZM_lingguyu",	1611, 3273},
	{"V� C╪ Щng", "ZM_wugenteng",	1578, 3296},
	{"V筺 Ni猲 Y猽 Кn", "ZM_wannianyaodan",	1582, 3321},
}

ZQ_JMZL_NPC_NAME = "<color=green>C秐h M玭 Tr薾 Linh:<color>"
ZQ_FIND_GOAL_TIME = 20 --寻找目标的时间s
ZQ_SEAL_EX_TIME = 20 --使用魔石延长的时间s
ZQ_SEAL_USE_MAX = 5 --魔石使用的最大值
ZQ_SEAL_START_TIME = (ceil((ZQ_FIND_GOAL_TIME + ZQ_SEAL_EX_TIME*ZQ_SEAL_USE_MAX) / 10) + 1) * 10 --阵灵开启时间s (ZQ_SEAL_START_TIME > ZQ_FIND_GOAL_TIME)
ZQ_REPAIRREAL_TIME_MAX = 30000; --时间触发器最大计数

--景门封印奖励
ZQ_REPAIRREAL_AWARD = {
	--{真气， 经验}
	[1] = {20, 100000, 1},
	[2] = {40, 200000, 1},
	[3] = {100, 500000, 1},
	--保底奖励
	[4] = {10, 50000, 0},
};

ZQ_REPAIRREAL_COUNT_MAX = 3; --最大修复次数


ZQ_OUTER_EXITPOS = {
	[SONG_ID] = {1582, 3792},
	[LIAO_ID] = {1905, 3288},
}

ZQ_JOIN_GAME_TIMES_MAX = 8; --一天最大参见小游戏的次数


--邪灵赌约奖励
ZQ_EVILBET_AWARD = {
	[1] = {40, 100000, 1},
	[2] = {80, 200000, 2},
	[3] = {160, 400000, 3},
	[4] = {320, 800000, 4},
	[5] = {640, 1600000, 5},
	[6] = {1280, 3200000, 6},	
	--保底奖励
	[7] = {10, 50000, 0},
}

--重启封印
ZQ_RESTART_REAL_NPC = {
	--1
	[1] = {"Kh秏", "ZM_fengyinkan", 1580, 3465},
	[2] = {"C蕁", "ZM_fengyinken", 1566, 3492},
	[3] = {"Kh玭", "ZM_fengyinshen", 1545, 3501},
	--2
	[4] = {"礽", "ZM_fengyindui", 1532, 3450},
	[5] = {"C祅", "ZM_fengyinqian", 1551, 3434},
	[6] = {"T鑞", "ZM_fengyinyi", 1571, 3441},
	--3
	[7] = {"Ch蕁", "ZM_fengyinzhen", 1523, 3494},
	[8] = {"Ly", "ZM_fengyinli", 1517, 3470},	
}

ZQ_RESTART_JIGUAN_NPC = {
	{"C� quan", "ZM_jiguan1", 1572, 3490},
	{"C� quan", "ZM_jiguan2", 1580, 3491},
	{"C� quan", "ZM_jiguan1", 1584, 3477},
	{"C� quan", "ZM_jiguan2", 1593, 3475},
	{"C� quan", "ZM_jiguan1", 1590, 3464},
	{"C� quan", "ZM_jiguan2", 1582, 3448},
	{"C� quan", "ZM_jiguan1", 1577, 3434},
	{"C� quan", "ZM_jiguan2", 1566, 3427},
	{"C� quan", "ZM_jiguan1", 1559, 3439},
	{"C� quan", "ZM_jiguan2", 1561, 3453},
	{"C� quan", "ZM_jiguan1", 1573, 3456},
	{"C� quan", "ZM_jiguan2", 1574, 3471},
	{"C� quan", "ZM_jiguan1", 1566, 3467},
	{"C� quan", "ZM_jiguan2", 1601, 3458},
	{"C� quan", "ZM_jiguan3", 1543, 3431},
	{"C� quan", "ZM_jiguan1", 1542, 3455},
	{"C� quan", "ZM_jiguan4", 1528, 3443},
	{"C� quan", "ZM_jiguan2", 1524, 3454},
	{"C� quan", "ZM_jiguan1", 1530, 3462},
	{"C� quan", "ZM_jiguan2", 1536, 3467},
	{"C� quan", "ZM_jiguan1", 1533, 3477},
	{"C� quan", "ZM_jiguan2", 1524, 3468},
	{"C� quan", "ZM_jiguan1", 1515, 3460},
	{"C� quan", "ZM_jiguan3", 1508, 3473},
	{"C� quan", "ZM_jiguan2", 1515, 3486},
	{"C� quan", "ZM_jiguan3", 1525, 3481},
	{"C� quan", "ZM_jiguan4", 1542, 3479},
	{"C� quan", "ZM_jiguan3", 1532, 3490},
	{"C� quan", "ZM_jiguan4", 1514, 3501},
	{"C� quan", "ZM_jiguan3", 1521, 3511},
	{"C� quan", "ZM_jiguan4", 1532, 3519},
	{"C� quan", "ZM_jiguan1", 1541, 3506},
	{"C� quan", "ZM_jiguan2", 1541, 3494},
	{"C� quan", "ZM_jiguan1", 1548, 3520},
	{"C� quan", "ZM_jiguan2", 1556, 3505},
	{"C� quan", "ZM_jiguan1", 1553, 3493},
	{"C� quan", "ZM_jiguan2", 1551, 3485},
	{"C� quan", "ZM_jiguan1", 1559, 3479},
}

ZQ_SMZL_NPC_NAME = "<color=green>T� M玭 Tr薾 Linh: <color>";

ZQ_RESTARTSEAL_DIS_MAX = 50; --应该保持的最大距离

ZQ_RESTARTSEAL_PROGRESS_TIME = 10 * 18;  --重启封印时间10s

ZQ_RESTARTSEAL_ITEM = {2, 1, 30496, "T� Linh L謓h"};

ZQ_RESTARTSEAL_COUNT_MAX = 3; --最大重启数目

ZQ_RESTARTSEAL_AWARD = {
	[1] = {20, 100000, 1},
	[2] = {40, 200000, 1},
	[3] = {100, 500000, 1},
	--这里是保底奖励
	[4] = {10, 50000, 0},
}

ZQ_MMZL_NPC_NAME = "<color=green>Di謙 M玭 Tr薾 Linh: <color>";

ZQ_PROTECTSEAL_MAP_TASKTEMP = 1; --6026,1号变量记录守卫封印，是否有人在进行

ZQ_PROTECTSEAL_TIME_TOTLE = 5 * 60; --一场持续时间上限

ZQ_MMZL_NPC_TABLE = {
	{"Qu竔 v藅", "ZM_guaiwu1", 1887, 3533},
	{"Qu竔 v藅", "ZM_guaiwu2", 1902, 3519},
	{"Qu竔 v藅", "ZM_guaiwu3", 1919, 3542},
	{"Qu竔 v藅", "ZM_guaiwu4", 1930, 3558},
	{"Qu竔 v藅", "ZM_guaiwu1", 1913, 3574},
	{"Qu竔 v藅", "ZM_guaiwu2", 1898, 3588},
	{"Qu竔 v藅", "ZM_guaiwu3", 1886, 3562},
	{"Qu竔 v藅", "ZM_guaiwu4", 1901, 3544},
	{"Qu竔 v藅", "ZM_guaiwu1", 1887, 3533},
	{"Qu竔 v藅", "ZM_guaiwu2", 1902, 3519},
	{"Qu竔 v藅", "ZM_guaiwu3", 1919, 3542},
	{"Qu竔 v藅", "ZM_guaiwu4", 1930, 3558},
	{"Qu竔 v藅", "ZM_guaiwu1", 1887, 3533},
	{"Qu竔 v藅", "ZM_guaiwu2", 1902, 3519},
	{"Qu竔 v藅", "ZM_guaiwu3", 1919, 3542},
	{"Qu竔 v藅", "ZM_guaiwu4", 1930, 3558},
	{"Qu竔 v藅", "ZM_guaiwu1", 1913, 3574},
	{"Qu竔 v藅", "ZM_guaiwu2", 1898, 3588},
	{"Qu竔 v藅", "ZM_guaiwu3", 1886, 3562},
	{"Qu竔 v藅", "ZM_guaiwu4", 1901, 3544},
	{"Qu竔 v藅", "ZM_guaiwu1", 1887, 3533},
	{"Qu竔 v藅", "ZM_guaiwu2", 1902, 3519},
	{"Qu竔 v藅", "ZM_guaiwu3", 1919, 3542},
	{"Qu竔 v藅", "ZM_guaiwu4", 1930, 3558},
	{"Qu竔 v藅", "ZM_guaiwu1", 1887, 3533},
	{"Qu竔 v藅", "ZM_guaiwu2", 1902, 3519},
	{"Qu竔 v藅", "ZM_guaiwu3", 1919, 3542},
	{"Qu竔 v藅", "ZM_guaiwu4", 1930, 3558},
	{"Qu竔 v藅", "ZM_guaiwu1", 1913, 3574},
	{"Qu竔 v藅", "ZM_guaiwu2", 1898, 3588},
	{"Qu竔 v藅", "ZM_guaiwu3", 1886, 3562},
	{"Qu竔 v藅", "ZM_guaiwu4", 1901, 3544},
	{"Qu竔 v藅", "ZM_guaiwu1", 1887, 3533},
	{"Qu竔 v藅", "ZM_guaiwu2", 1902, 3519},
	{"Qu竔 v藅", "ZM_guaiwu3", 1919, 3542},
	{"Qu竔 v藅", "ZM_guaiwu4", 1930, 3558},
	{"Qu竔 v藅", "ZM_guaiwu1", 1887, 3533},
	{"Qu竔 v藅", "ZM_guaiwu2", 1902, 3519},
	{"Qu竔 v藅", "ZM_guaiwu3", 1919, 3542},
	{"Qu竔 v藅", "ZM_guaiwu4", 1930, 3558},
	{"Qu竔 v藅", "ZM_guaiwu1", 1913, 3574},
	{"Qu竔 v藅", "ZM_guaiwu2", 1898, 3588},
	{"Qu竔 v藅", "ZM_guaiwu3", 1886, 3562},
	{"Qu竔 v藅", "ZM_guaiwu4", 1901, 3544},
	{"Qu竔 v藅", "ZM_guaiwu1", 1887, 3533},
	{"Qu竔 v藅", "ZM_guaiwu2", 1902, 3519},
	{"Qu竔 v藅", "ZM_guaiwu3", 1919, 3542},
	{"Qu竔 v藅", "ZM_guaiwu4", 1930, 3558},
	{"Qu竔 v藅", "ZM_guaiwu1", 1887, 3533},
	{"Qu竔 v藅", "ZM_guaiwu2", 1902, 3519},
	{"Qu竔 v藅", "ZM_guaiwu3", 1919, 3542},
	{"Qu竔 v藅", "ZM_guaiwu4", 1930, 3558},
	{"Qu竔 v藅", "ZM_guaiwu1", 1913, 3574},
	{"Qu竔 v藅", "ZM_guaiwu2", 1898, 3588},
	{"Qu竔 v藅", "ZM_guaiwu3", 1886, 3562},
	{"Qu竔 v藅", "ZM_guaiwu4", 1901, 3544},
	{"Qu竔 v藅", "ZM_guaiwu1", 1887, 3533},
	{"Qu竔 v藅", "ZM_guaiwu2", 1902, 3519},
	{"Qu竔 v藅", "ZM_guaiwu3", 1919, 3542},
	{"Qu竔 v藅", "ZM_guaiwu4", 1930, 3558},
}

ZQ_PROTECTSEAL_KILL_MIN = 10; --杀怪下限

ZQ_PROTECTSEAL_AWARD = {
	[1] = {ZQ_PROTECTSEAL_KILL_MIN, 20, 100000, 1},
	[2] = {20, 40, 200000, 2},
	[3] = {40, 100, 500000, 3},
	[4] = {100, 200, 1000000, 4},
		--保底奖励
	[5] = {10000, 10, 50000, 0},
}

ZQ_PLAYER_DEATH_TAG = 9999; --玩家死亡标记

ZQ_COPY_TIME_MAX = 10 * 60; --关卡持续时间




