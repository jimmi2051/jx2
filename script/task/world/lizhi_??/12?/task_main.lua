--  ===============文件信息=================
--  剑侠情缘onlineII 泉洲 12 级任务主体脚本
--  Edited by lizhi
--  2005-8-2 15:36
--  ========================================

-- 剧情任务文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_泉州\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function can_not_accept_task()
    local szTalk = {
        "N琲 n祔 c遪 ch� cho ngi ngh蘯 tr� kh玭g?"
    };
    TalkEx("", szTalk);
end;

function task_000_00()
    local szTalk = {
        "Nghe n鉯 ngi t鮪g l� thu閏 h� Di猽 L藀 Th祅h c� tham gia v� cp Vng Nghi謕 V�.",
        "Ngi l� ai? Ph秈 Di猽 L藀 Th祅h ph竔 n gi誸 ta di謙 kh萿 kh玭g? Hay l� ngi quan ph�? Ta c� bi誸 chuy謓 g� u!",
        "Y猲 t﹎! Ta ch� mu鑞 bi誸 chuy謓 c馻 Di猽 L藀 Th祅h.",
        "в ch鴑g minh, ngi gi髉 ta nh b筰 {10 t猲 L璾 manh} v� {10 t猲 C玭 }!",
        "Л頲 th玦!"
    };
    TalkEx("task_001_00", szTalk);
end;

function task_001_00()
    
	Msg2Player("Tr� 10 t猲 L璾 manh v� 10 t猲 C玭 ");
	TaskTip("Tr� 10 t猲 L璾 manh v� 10 t猲 C玭 ");
	
	CreateTrigger(0, 191, 81);  --杀死流氓10人
	CreateTrigger(0, 192, 82);  --杀死无赖10人
	
    SetTask(TASK_LEV_12_ID, 1);
    SetTask(TASK_LEV_10_ID, GetTask(TASK_LEV_10_ID) + 1);   --消除任务面板
    
end;

function task_001_01()
    
    local szTalk = {
        "Ngi nh b筰 {10 t猲 L璾 manh} v� 10 {t猲 C玭 } ta m韎 tin!"
    };
    TalkEx("task_001_02", szTalk);
end;

function task_001_02()
    if GetTrigger(81) == 0 then
        CreateTrigger(0, 191, 81);  --杀死流氓10人
    end;
    
    if GetTrigger(82) == 0 then
        CreateTrigger(0, 192, 82);  --杀死无赖10人
    end;
end;

function task_003_00()

    local szTalk = {    
        "Kh� l緈! Th鵦 ra ta c騨g kh玭g mu鑞 l祄 vi謈 cho Di猽 L藀 Th祅h nh璶g th� t� b� b謓h thng h祅, c莕 dc li謚 tr� b謓h.",
        "Ngi c莕 dc li謚 n祇?",
        "Чi phu n鉯 {Dc phng} c莕 {Ng秈 b鬷}, {R� s緉}, {B閕 Lan}, {Li猲 Ki襲}, {Kim Ng﹏ hoa} m鏸 th� {3 c竔} v� {10 l玭g} {S鉯 xanh }.",
        "Tr� b謓h l� quan tr鋘g,  ta gi髉 ngi t譵 ch髇g v�!"
    };
    TalkEx("task_004_00", szTalk);
end;

function task_004_00()

    Msg2Player("дn T﹜ Tuy襫 Ch﹗ t譵 Ng秈 b鬷, R� s緉, B閕 Lan, Li猲 Ki襲, Kim Ng﹏ hoa m鏸 th� 3 c竔 v� 10 l玭g S鉯 xanh.");
    TaskTip("T譵 Ng秈 b鬷, R� s緉, B閕 Lan, Li猲 Ki襲, Kim Ng﹏ hoa m鏸 th� 3 c竔 v� 10 l玭g S鉯 xanh.");
    
    CreateTrigger(0, 193, 83);  --杀死药草
    SetTask(TASK_LEV_12_ID, 4);
    GivePlayerAward("Level_12", "easy");    --奖励
    GivePlayerExp(SkeyQZWangyewei,"xiajiedekuzhong1")		--夏杰的苦衷1
end;

function task_004_01()
    
    local szFinished = {
        "Dc li謚 y r錳!  t� ﹏ nh﹏! Di猽 L藀 Th祅h h譶h nh� l� ti觰 u m鬰 c馻 {Xi H醓 gi竜}, {m秐h S琻 H� X� T綾} hi謓 n籱 trong chuy課 h祅g c馻 Vng Nghi謕 V�.",
        "V� v藋 Di猽 L藀 Th祅h m韎 cp chuy課 h祅g c馻 Vng Nghi謕 V�. Nh璶g sao ch髇g l筰 cp s� s竎h?",
        "H譶h nh� chuy課 h祅g Di猽 L藀 Th祅h cp 頲 kh玭g c� m秐h S琻 H� X� T綾 v� v藋 m韎 l蕐 s� s竎h xem  b竛 cho ai mong t譵 ra manh m鑙 t蕀 b秐 .",
        "V藋 l� r綾 r鑙 to r錳.",
        "ng v藋! H穣 n {Tuy襫 Ch﹗} t譵 {Vng Nghi謕 V軁 xem danh s竎h ngi mua.",
        "Ta 甶 ngay!",
        "M鉵  n祔 ta gi� l筰 c騨g kh玭g d飊g, t苙g cho ngi!"
    };
    local szNotFinished = {
        "Чi phu n鉯 {Dc phng} c莕 {Ng秈 b鬷}, {R� s緉}, {B閕 Lan}, {Li猲 Ki襲}, {Kim Ng﹏ hoa} m鏸 th� {3 c竔} v� {10 l玭g} S鉯 xanh."
    };
    local nQingCount = 0;
    local nGeCount = 0;
    local nPeiCount = 0;
    local nLianCount = 0;
    local nJinCount = 0;
    local nMaoCount = 0;
    
    nQingCount = GetItemCount(2, 0, 33);    --青蒿
    nGeCount = GetItemCount(2, 0, 34);      --葛根
    nPeiCount = GetItemCount(2, 0, 35);     --佩兰
    nLianCount = GetItemCount(2, 0, 36);    --连翘
    nJinCount = GetItemCount(2, 0, 37);     --金银花
    nMaoCount = GetItemCount(2, 1, 5);      --狼毛
    
    if ((nQingCount >= 3) and (nGeCount >= 3) and (nPeiCount >= 3) and (nLianCount >= 3) and (nJinCount >= 3) and (nMaoCount >= 10)) then
        TalkEx("task_005_00", szFinished);
    else
        TalkEx("task_005_01", szNotFinished);
    end;

end;

function task_005_01()
    if GetTrigger(83) == 0 then
        CreateTrigger(0, 193, 83);  --杀死药草
    end;
end;

function task_005_00()
    GivePlayerAward("Level_12", "hard", "head", "Level_13");    --奖励
	GivePlayerExp(SkeyQZWangyewei,"xiajiedekuzhong2")		--夏杰的苦衷2
    SetTask(TASK_LEV_12_ID, 5);
    --删除任务道具
    DelItem(2, 0, 33, 3);
    DelItem(2, 0, 34, 3);
    DelItem(2, 0, 35, 3);
    DelItem(2, 0, 36, 3);
    DelItem(2, 0, 37, 3);
    DelItem(2, 1, 5, 10);
    RemoveTrigger(GetTrigger(83));  --删除草药触发器
end;