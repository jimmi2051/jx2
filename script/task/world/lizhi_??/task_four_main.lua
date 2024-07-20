--扬州任务分支
--created by lizhi
--2005-9-2 10:12

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

---------------------------------------扬州分支四-------------------------------------

function four_00_00()
    local szTalk = {
        "G莕 y Йng H秈 H秈 T﹏ xu蕋 hi謓 nhi襲 ng� qu竔, nhi襲 ng� d﹏ kh玭g d竚 ra bi觧 nh b総, nghe n鉯 h�  ph筸 thng v韎 Long Vng gia, m韎 b� tr鮪g ph箃 nh� v藋.",
        "Chuy謓 g� l� v藋?",
        "Phu qu﹏ ta m蕐 ng祔 trc ra bi觧 hi謓 ch璦 tr� v�, ta e  b� l� th駓 t閏 gi誸 h筰. <sex> gi髉 ti觰 n� tr� th� 頲 kh玭g?",
        "Tr� th� b籲g c竎h n祇?",
        "Nghe n鉯 Йng H秈 H秈 T﹏ c� lo礽 u m鬰 ng� qu竔, ch� c莕 gi誸 ch髇g l� c� th� tr� th� cho phu qu﹏ ti觰 n�.",
        "Л頲! Ta ng �!"
    };
    TalkEx("four_00_01", szTalk);
end;

function four_00_01()
    SetTask(TASK_YZ_FOUR, 1);
    Msg2Player("дn Йng H秈 H秈 T﹏ gi誸 u m鬰 ng� qu竔");
    TaskTip("дn Йng H秈 H秈 T﹏ gi誸 u m鬰 ng� qu竔");
    GivePlayerAward("Level_50", "normal");
	GivePlayerExp(SkeyYZxiahouqin,"shirenyuguai1")		--嗜人鱼怪1
end;

function four_02_00()
    local szTalk = {
        "Ta  gi髉 c� nng h� u m鬰 ng� qu竔, y l� {Lang Nha ng鋍 b閕}, c� th� l� c馻 l謓h c玭g...",
        " t� ﹏ nh﹏! ng l� v藅 nh t譶h c馻 ch髇g ta, ch祅g v蒼 mang theo b猲 m譶h, huhu�",
        "Ta mu鑞 t譵 hi觰 r� {Йng H秈 h秈 t閏}, c� nng c� th� gi髉 ta kh玭g?",
        "Th� t譵 L� Ti課 D騨g xem!",
        "L莕 sau s� gh� th╩ c� nng, xin c竜 t�!"
    };
    TalkEx("four_02_01", szTalk);
end;

function four_02_01()
    SetTask(TASK_YZ_FOUR, 3);
    DelItem(2,0,304,1);   --琅玡玉佩
    Msg2Player("дn Dng Ch﹗ t譵 L� Ti課 D騨g h醝 th╩");
    TaskTip("дn Dng Ch﹗ t譵 L� Ti課 D騨g h醝 th╩");
    GivePlayerAward("Level_50", "normal");
	GivePlayerExp(SkeyYZxiahouqin,"shirenyuguai2")		--嗜人鱼怪2
end;

function four_03_00()
    local szTalk = {
        "L� ti猲 sinh kh醗 kh玭g?",
        "T譵 ta c� chuy謓 g�?",
        "Ch綾 ti襫 b鑙 c� nghe qua Йng H秈 h秈 t閏, t筰 h� ngh� kh玭g ph秈 Long Vng l穙 gia l祄, ngi c� cao ki課 g� kh玭g?",
        "Ta ch� nghe n鉯 tr猲 ngi ch髇g c� mang m閠 s� , ngi gi髉 ta thu th藀 thng y v� h� y c馻 d﹏ l祅g m鏸 th� 5 c竔 頲 kh玭g?",
        "Л頲 th玦!"
    };
    TalkEx("four_03_01", szTalk);
end;

function four_03_01()
    SetTask(TASK_YZ_FOUR, 4);
    CreateTrigger(0,544,KILL_YZ_SZ);
    CreateTrigger(0,545,KILL_YZ_SZSB);
    Msg2Player("Цnh Йng H秈 th駓 t閏 v� qu﹏ s� th駓 t閏 l蕐 thng y v� h� y m鏸 th� 5 c竔");
    TaskTip("Цnh Йng H秈 th駓 t閏 v� qu﹏ s� th駓 t閏 l蕐 thng y v� h� y m鏸 th� 5 c竔");
    GivePlayerAward("Level_50", "normal");
	GivePlayerExp(SkeyYZxiahouqin,"shirenyuguai3")		--嗜人鱼怪3
end;

function four_04_00()
    local szTalk = {
        "ng l� qu莕 竜 c馻 d﹏ l祅g b� m蕋. S竎h c� c� ghi ch衟, m鏸 khi th駓 t閏 xu蕋 hi謓 d﹏ l祅g s� bi課 m蕋.",
        "N誹 n鉯 v藋 th� d﹏ l祅g  b� bi課 th祅h {Йng H秈 th駓 t閏}.",
        "ng r錳!",
        "N誹 n鉯 v藋, th駓 t閏 r琲 ra ng鋍 b閕 ch輓h l� {phu qu﹏} c馻 Vi詎 Tinh. Ta ph秈 甶 b竜 ngay cho c� 蕐 bi誸!",
        "T筰 h� xin c竜 t�!"
    };
    local szMsg = {
        "Ta ch� nghe n鉯 tr猲 ngi ch髇g c� mang m閠 s� , ngi gi髉 ta thu th藀 thng y v� h� y c馻 d﹏ l祅g m鏸 th� 5 c竔 頲 kh玭g?"
    };
    if GetItemCount(2,0,305) >= 5 and GetItemCount(2,0,306) >= 5 then
        TalkEx("four_04_01", szTalk);
    else
        TalkEx("four_04_02", szMsg);
    end;
end;

function four_04_02()
    if GetTrigger(KILL_YZ_SZ) == 0 then
        CreateTrigger(0,544,KILL_YZ_SZ);
    end;
    if GetTrigger(KILL_YZ_SZSB) == 0 then
        CreateTrigger(0,545,KILL_YZ_SZSB);
    end;
end;

function four_04_01()
    SetTask(TASK_YZ_FOUR, 5);
    DelItem(2,0,305,5);
    DelItem(2,0,306,5);
    RemoveTrigger(GetTrigger(KILL_YZ_SZ));
    RemoveTrigger(GetTrigger(KILL_YZ_SZSB));
    Msg2Player("N鉯 s� th藅 v韎 cho Vi詎 Tinh");
    TaskTip("N鉯 s� th藅 v韎 cho Vi詎 Tinh");
end;

function four_05_00()
    local szTalk = {
        "<sex> n y c� chuy謓 g�?"
    };
    TalkEx("four_05_01", szTalk);
end;

function four_05_01()
    local szSay = {
        "Ta c� m閠 chuy謓 mu鑞 n鉯 v韎 c� nng.",
        "N鉯 s� th藅/tell_true",
        "G箃 c� ta/tell_false"
    };
    SelectSay(szSay);
end;

function tell_true()
    local szTalk = {
        "<sex> xin c� n鉯!",
        "Theo 甶襲 tra d﹏ l祅g kh玭g b� m蕋 t輈h m� l� bi課 th祅h Йng H秈 th駓 t閏.",
        "V� v藋 ngi ta gi誸 ch輓h l� {phu qu﹏} c�, xin th� l鏸!",
        "Huhu匱a  gi誸 ch祅g r錳!",
        "Зy c� ph秈 s� th藅 kh玭g!",
        "Huhu厖."
    };
    TalkEx("four_05_02", szTalk);
end;

function four_05_02()
    SetTask(TASK_YZ_FOUR, 6);
    GivePlayerAward("Level_50", "hell");
	GivePlayerExp(SkeyYZxiahouqin,"shirenyuguai4")		--嗜人鱼怪4
    ModifyReputation(10, 0);
end;

function tell_false()
    local szTalk = {
        "<sex> xin c� n鉯!",
        "Theo 甶襲 tra d﹏ l祅g kh玭g b� m蕋 t輈h m� l� b� {Йng H秈 th駓 t閏} b総 n Long cung l祄 lao d辌h, tu s鯽 long cung.",
        "N誹 n鉯 v藋 th� ng鋍 b閕  do m閠 ng� qu竔 kh竎 nh苩 頲, qua m閠 th阨 gian phu qu﹏ c� nng s� tr� v�.",
        " t� <sex>, hy v鋘g ch祅g c遪 s鑞g!"
    };
    TalkEx("four_05_03", szTalk);
end;

function four_05_03()
    SetTask(TASK_YZ_FOUR, 7);
    GivePlayerAward("Level_50", "hell", "chest", "Level_52");
	GivePlayerExp(SkeyYZxiahouqin,"shirenyuguai4")		--嗜人鱼怪4
end;

function four_06_00()
    local szTalk = {
        "L� ngi gi誸 phu qu﹏ ta! Mau tr� phu qu﹏ cho ta, huhu!"
    };
    TalkEx("", szTalk);
end;

function four_07_00()
    local szTalk = {
        "<sex> bi誸 頲 tin t鴆 g� v� phu qu﹏ kh玭g?"
    };
    TalkEx("", szTalk);
end;