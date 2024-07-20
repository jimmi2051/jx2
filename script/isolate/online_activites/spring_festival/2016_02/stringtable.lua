
Include("\\settings\\static_script\\lib\\normal_exchange.lua")

CAIJI_CD = 6			  -- 采集桃花枝的CD
CAIJI_LIMIT = 10          -- 采集桃枝次数限制
BOX_LIFE_TIME_SEC = 30*60 -- 财神宝箱生存时间
PUTCOIN_LIMIT = 50    -- 投入吉祥金币的次数限制
JUBAO_PREPARE_TIME = 60 --投入金币后聚宝盆准备时间
JUBAO_TIME_PRE_COIN = 300 --每一枚吉祥金币提供的聚宝时间
GET_JBP_CD = 60    -- 普通玩家领取聚宝盆奖励CD
GET_JBP_LIMIT = 100 -- 每个玩家每天最多领取聚宝盆奖励的次数
FENGHUAPOINT_PER_COIN = 30 -- 每投入一枚吉祥金币能够直接获得的风华点数
JUBAO_POINT_4_FREE = 10 --每一枚吉祥金币提供的免费积分



tb_box_refresh = {
	{300,1789,3753},	{300,1784,3483},	{300,1649,3539},	{300,1635,3698},	{300,1921,3539},	{300,1867,3421},
	{200,1478,2767},	{200,1375,2967},	{200,1317,2837},	{200,1340,2752},	{200,1197,2798},	{200,1351,2645},
	{100,1380,3216},	{100,1577,3126},	{100,1402,3044},	{100,1250,2988},	{100,1506,2930},	{100,1427,2864},
	{350,1428,2778},	{350,1351,2938},	{350,1415,3060},	{350,1491,3006},	{350,1620,2956},	{350,1491,2842},
};

tb_jbp_refresh = {
	{300,1769,3550,"Th祅h Й-Trung"},	{300,1703,3484,"T﹜ m玭 Th祅h Й"},	{300,1877,3476,"B綾 m玭 Th祅h Й"},	{300,1862,3625,"Йng m玭 Th祅h Й"},	{300,1681,3669,"Nam m玭 Th祅h Й"},
	{200,1378,2892,"Bi謓 Kinh-Trung"},	{200,1258,2736,"T﹜ m玭 Bi謓 Kinh"},	{200,1470,2778,"Bi謓 Kinh-C鯽 B綾"},	{200,1468,2945,"Йng m玭 Bi謓 Kinh"},	{200,1296,2947,"Nam m玭 Bi謓 Kinh"},	
	{100,1403,2978,"Tuy襫 Ch﹗-Trung"},	{100,1358,2895,"T﹜ m玭 Tuy襫 Ch﹗"},	{100,1524,2885,"B綾 m玭 Tuy襫 Ch﹗"},	{100,1507,3047,"Йng m玭 Tuy襫 Ch﹗"},	{100,1353,3049,"Tuy襫 Ch﹗-C鯽 Nam"},
	{350,1464,2946,"Tng Dng-Trung"},	{350,1345,2872,"T﹜ m玭 Tng Dng"},	{350,1533,2873,"B綾 m玭 Tng Dng"},	{350,1490,3028,"Йng m玭 Tng Dng"},	{350,1371,3047,"Nam m玭 Tng Dng"},
}

tb_taoshu_refresh = {
{200,	1346,	2849},		{300,	1729,	3497},
{200,	1341,	2854},		{300,	1736,	3491},
{200,	1336,	2859},		{300,	1740,	3498},
{200,	1332,	2875},		{300,	1745,	3520},
{200,	1337,	2880},		{300,	1750,	3506},
{200,	1342,	2885},		{300,	1768,	3524},
{200,	1361,	2903},		{300,	1773,	3528},
{200,	1366,	2908},		{300,	1780,	3535},
{200,	1370,	2913},		{300,	1784,	3540},
{200,	1379,	2922},		{300,	1789,	3544},
{200,	1389,	2904},		{300,	1807,	3563},
{200,	1396,	2898},		{300,	1793,	3574},
{200,	1401,	2892},		{300,	1787,	3578},
{200,	1416,	2878},		{300,	1781,	3584},
{200,	1421,	2873},		{300,	1775,	3589},
{200,	1426,	2869},		{300,	1768,	3596},
{200,	1430,	2863},		{300,	1751,	3584},
{200,	1425,	2858},		{300,	1744,	3577},
{200,	1418,	2852},		{300,	1738,	3572},
{200,	1396,	2834},		{300,	1725,	3562},
{200,	1391,	2829},		{300,	1719,	3556},
{200,	1386,	2823},		{300,	1714,	3549},
{200,	1379,	2816},		{300,	1702,	3538},
{200,	1374,	2821},		{300,	1696,	3533},
{200,	1369,	2826},		{300,	1704,	3523},
{200,	1364,	2831},		{300,	1711,	3516},

{100,	1444,	3007},
{100,	1439,	3012},
{100,	1433,	3018},
{100,	1427,	3024},
{100,	1421,	3018},
{100,	1416,	3012},
{100,	1396,	2994},
{100,	1389,	2986},
{100,	1384,	2981},
{100,	1390,	2974},
{100,	1394,	2969},
{100,	1401,	2964},
{100,	1419,	2945},
{100,	1424,	2940},
{100,	1429,	2936},
{100,	1434,	2941},
{100,	1440,	2947},
{100,	1459,	2967},
{100,	1464,	2973},
{100,	1470,	2979},
{100,	1465,	2983},

{350,	1476,	2957},
{350,	1481,	2962},
{350,	1485,	2967},
{350,	1490,	2971},
{350,	1487,	2979},
{350,	1482,	2985},
{350,	1453,	3014},
{350,	1446,	3021},
{350,	1439,	3026},
{350,	1434,	3022},
{350,	1429,	3017},
{350,	1424,	3012},
{350,	1405,	2994},
{350,	1399,	2987},
{350,	1393,	2981},
{350,	1387,	2975},
{350,	1393,	2969},
{350,	1400,	2962},
{350,	1432,	2937},
{350,	1439,	2931},
{350,	1446,	2926},
{350,	1452,	2931},
{350,	1457,	2936},
}

tb_pt_award = {
	{
	--	{name,g,d,p,n,bind,expiredays}
		{ {"Nh竛h Уo Ti",0,120,134,1,4,7} },
		{ {"Nh竛h Уo Ti",0,120,135,1,4,7} },
		{ {"Nh竛h Уo Ti",0,120,136,1,4,7} },
		{ {"Nh竛h Уo Ti",0,120,137,1,4,7} },
	},
	{
		{ {"Con C�-Eo (п)",0,120,126,1,4,7} },
		{ {"Con C�-Eo (п)",0,120,127,1,4,7} },
		{ {"Con C�-Eo (п)",0,120,128,1,4,7} },
		{ {"Con C�-Eo (п)",0,120,129,1,4,7} },
	},
	{
		{ {"Con C�-L璶g (п)",0,120,130,1,4,7} },
		{ {"Con C�-L璶g (п)",0,120,131,1,4,7} },
		{ {"Con C�-L璶g (п)",0,120,132,1,4,7} },
		{ {"Con C�-L璶g (п)",0,120,133,1,4,7} },
	},
	
	-------------------------------hh_pt_award
	{
	--	{name,g,d,p,n,bind,expiredays}
		{ {"Nh� � (Lam)",0,119,1,1,4,7} },
		{ {"Nh� � (Lam)",0,119,2,1,4,7} },
		{ {"Nh� � (Lam)",0,119,3,1,4,7} },
		{ {"Nh� � (Lam)",0,119,4,1,4,7} },
	},
	{
	--	{name,g,d,p,n,bind,expiredays}
		{ {"Si猽 Phong (Lam)",0,121,1,1,4,7} },
		{ {"Si猽 Phong (Lam)",0,121,2,1,4,7} },
		{ {"Si猽 Phong (Lam)",0,121,3,1,4,7} },
		{ {"Si猽 Phong (Lam)",0,121,4,1,4,7} },
	},
	{
	--	{name,g,d,p,n,bind,expiredays}
		{ {"Oanh Tr莕 V� (Lam)",0,120,1,1,4,7} },
		{ {"Oanh Tr莕 V� (Lam)",0,120,2,1,4,7} },
		{ {"Oanh Tr莕 V� (Lam)",0,120,3,1,4,7} },
		{ {"Oanh Tr莕 V� (Lam)",0,120,4,1,4,7} },
	},
	{
	--	{name,g,d,p,n,bind,expiredays}
		{ {"Nh竛h Уo Ti",0,120,134,1,4,30} },
		{ {"Nh竛h Уo Ti",0,120,135,1,4,30} },
		{ {"Nh竛h Уo Ti",0,120,136,1,4,30} },
		{ {"Nh竛h Уo Ti",0,120,137,1,4,30} },
	},
}

tExchg = {
	coin_clip = gtNormalExchange:new(),--金币碎片
}
tExchg.coin_clip.tConsume = {
	{"M秐h уng Ti襫", 2, 1, 31010, 10, },
}
tExchg.coin_clip.tAward = {
	{"уng Ti襫 C竧 Tng", 2, 1, 31007, 1, 4},
}
