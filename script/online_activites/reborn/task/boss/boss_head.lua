--==================================================
--create by zhangming 2010.03.18
--describe: 越南版 团体任务BOSS 头文件
--related files:
--==================================================
Include ("\\Script\\lib\\globalfunctions.lua")
VET_201003_STR_LOG_TITLE = "Nhi謒 v� chuy觧 sinh t� i"
VET_201003_STR_LOG_ACTION = "Ph莕 thng cho gi誸 boss m玭 h閕 nhi謒 v� t� i"

VET_201003_TB_BOSS_APPEAR_MAPID = {
    { --龙子 泉州府北
        {108,1420,3079,"B綾 Tuy襫 Ch﹗"},
        {108,1420,3041,"B綾 Tuy襫 Ch﹗"},
        {108,1393,2979,"B綾 Tuy襫 Ch﹗"},
        {108,1493,2911,"B綾 Tuy襫 Ch﹗"},
        {108,1491,2971,"B綾 Tuy襫 Ch﹗"},
        {108,1567,3048,"B綾 Tuy襫 Ch﹗"},
    },
    { --凤子 成都府西
        {301,1491,3191,"T﹜ Th祅h Й"},
        {301,1422,3142,"T﹜ Th祅h Й"},
        {301,1427,3047,"T﹜ Th祅h Й"},
        {301,1450,2898,"T﹜ Th祅h Й"},
        {301,1562,2849,"T﹜ Th祅h Й"},
        {301,1574,2937,"T﹜ Th祅h Й"},
    },
    { --虎子 泉州府北
        {108,1601,3064,"B綾 Tuy襫 Ch﹗"},
        {108,1576,2898,"B綾 Tuy襫 Ch﹗"},
        {108,1513,2930,"B綾 Tuy襫 Ch﹗"},
        {108,1438,2914,"B綾 Tuy襫 Ch﹗"},
        {108,1443,2999,"B綾 Tuy襫 Ch﹗"},
        {108,1520,3172,"B綾 Tuy襫 Ch﹗"},
    },
    { --鹰子 成都府西
        {301,1394,3109,"T﹜ Th祅h Й"},
        {301,1391,2962,"T﹜ Th祅h Й"},
        {301,1430,2950,"T﹜ Th祅h Й"},
        {301,1523,2893,"T﹜ Th祅h Й"},
        {301,1487,2796,"T﹜ Th祅h Й"},
        {301,1537,3100,"T﹜ Th祅h Й"},
    },
}


VET_201003_TB_BOSS_INF = {
    {"Long T�","Long T�","\\script\\online_activites\\reborn\\task\\boss\\boss_longzi.lua"},
    {"Ph鬾g T�","Ph鬾g T�","\\script\\online_activites\\reborn\\task\\boss\\boss_fengzi.lua"},
    {"H� T�","H� T�","\\script\\online_activites\\reborn\\task\\boss\\boss_huzi.lua"},
    {"g T�","g T�","\\script\\online_activites\\reborn\\task\\boss\\boss_yingzi.lua"},

}

VET_201003_TB_BOSS_AWARD = {
    {1,8000000,"Nh﹏ S﹎ V筺 N╩",{2,1,30071,1},0,0},
    {1,125,"Long T� B閕",{2,1,30155,1},0,0},
    {1,125,"Ph鬾g T� B閕",{2,1,30156,1},0,0},
    {1,125,"H� T� B閕",{2,1,30157,1},0,0},
    {1,125,"g T� B閕",{2,1,30158,1},0,0},
    {1,500000,"мnh H錸 Thi猲 Th筩h Th莕 Th筩h",{2,1,1067,1},0,0},
    {1,1000000,"Thi猲 th筩h",{2, 2, 8, 1},0,0},
    {1,499500,"M秐h Thi猲 th筩h",{2, 2, 7, 1},0,0},
}


function VET_201003_GIVE_BOSS_AWARD()
    gf_EventGiveRandAward(VET_201003_TB_BOSS_AWARD,10000000,1,VET_201003_STR_LOG_TITLE,VET_201003_STR_LOG_ACTION)
end
