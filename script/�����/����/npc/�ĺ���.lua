--在扬州任务夏侯琴
--created by lizhi
--2005-8-24 10:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_扬州\\task_main.lua");
Include("\\script\\task\\world\\lizhi_扬州\\task_two_main.lua");
Include("\\script\\task\\world\\lizhi_长歌门\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

szTaskThreeTalk = {
    "C� nng c� ph秈 l� H� H莡 C莔?",
    "Ta ng祔 ng祔 ng錳 g穣 n, n祇 ph秈 n� hi謕 g� u?",
    "Ta v鮝 nh b筰 Chng V� Cng, 畂箃 頲 m藅 h祄 b猲 trong ghi chuy課 h祅g  頲 chuy觧 甶 n琲 kh竎, ngo礽 ra c遪  c藀 c� ch輓h l� ngi li猲 l筩 v韎 {Trng Ca M玭}, c莕 ph秈 tr� kh�!",
    "V藋 �? Ngi c� 甧m m藅 h祄 t韎 kh玭g? Chuy襫 h祅g  r鑤 cu閏 l� g�?",
    "Зy! M阨 c� xem qua! Theo t筰 h� 頲 bi誸 chuy課 h祅g  nghe u c� li猲 quan n m秐h S琻 H� X� T綾.",
    "C� chuy謓 i s� th藅 r錳, 產 t�  <sex> th玭g b竜. Зy ch髏 t� l�, xin nh薾 l蕐!"
};
szTaskFourTalk = {
    "Th鵦 ra ta ch輓h l� ngi li猲 l筩 v韎 {Trng Ca M玭}, chuy謓 n祔 b総 u t� ng祔 khai qu鑓. L骳  Th竔 T� {b譶h nh giang s琻}, c竎 v� tng nh� Th筩h Th� T輓, Cao Ho礽 c, Trng L謓h Phong, {Tri謚 Ng筺 Huy} u c竜 l穙 h錳 hng, an dng tu鎖 gi�. Цng ti誧 Tri謚 Ng筺 Huy i nh﹏ kh玭g ch辵 n鎖 s� c� n b蘮 li猲 l筩 m閠 s� b筺 b� giang h�, ng﹎ th�, t� v� ngh�.",
    "V� sau nh鱪g v� b籲g h鱱 n祔 th祅h l藀 th祅h m閠 m玭 ph竔. L骳  trong ph竔 nhi襲 ngi s竛g t竎 nh筩 l祄 th� cho n猲 m韎 c� t猲 {Trng Ca M玭}.",
    "Ta c� th� gi髉 頲 g� cho c� nng y."
};

szFinished = {
    "<sex> qu� nhi猲 th﹏ th� b蕋 ph祄! Ch髏 qu� m鋘 xin nh薾 l蕐!"
};
szTaskFiveTalk = {
    "Hy v鋘g <sex> c� th� gi髉 ta th玭g b竜 cho nh鱪g ngi li猲 l筩 kh竎 trong {Trng Ca M玭}, l� {C玭g T玭 Th瓆 (Tng Dng), {Tri謚 Di猲 Ni猲} (Bi謓 Kinh), {Gia C竧 K鷠 (Giang T﹏ Th玭).",
    "Ta s� 甶 ngay!"
};
szTaskFiveFinished = {
    "Ta  ho祅 th祅h nhi謒 v� c� nng y猽 c莡!",
    " t� <sex>, y l� ch髏 qu� m鋘, xin nh薾 l蕐!"
};

function main()
    
    if GetTask(124) == 1 then
    	talk_one();
    	return
   	end;
    
    local nStep = GetTask(TASK_YZ_TWO);
    if nStep == 6 then
        two_06_00();
        return
    elseif nStep == 7 then
        two_07_00();
        return
    end;
    
    nStep = GetTask(TASK_FIVE);
    if nStep == 6 then
        task_06_00();
        return
    elseif nStep == 7 then
        task_07_xh_00();
        return
    elseif nStep == 11 then
        task_11_00();
        return
    elseif nStep == 12 then
        task_12_00();
        return
    elseif nStep == 18 then
        task_18_00();
        return
    elseif nStep == 19 then
        Talk(1,"","Ngi ch璦 mang <color=yellow>Thi猲 Thi襪 H鉧 чc Cao<color> cho <color=yellow>H� H莡 Li猲<color> sao?");
        return
    elseif nStep == 20 then
        task_20_00();
        return
    elseif nStep == 21 then
        Talk(1,"","Mau n <color=yellow>Thanh Kh� ng <color> � <color=yellow>Long Tuy襫 th玭<color> c鴘 <color=yellow>L玦 Th緉g<color> tho竧 n筺!");
        return
    elseif nStep == 22 then
        task_22_00();
        return
    elseif nStep == 23 then
        task_23_00();
        return
    elseif nStep == 24 then
        task_24_00();
        return
    elseif nStep == 25 then
        task_25_00();
        return
    elseif nStep == 26 then
        task_26_00();
        return
    elseif nStep == 27 then
        Talk(1,"","H穣 mang <color=yellow>b秓 v藅 th莕 b�<color> n t薾 tay <color=yellow>Л阯g Ninh<color> � <color=yellow>V� Di s琻<color>!");
        return
    elseif nStep == 28 then
        task_28_00();
        return
    elseif nStep == 29 then
        local szTalk = {
            "Hi謓 ch璦 c� g� c莕 ngi gi髉. <sex> h穣 甶 tu luy謓 th猰!"
        };
        TalkEx("", szTalk);
        return
    end;
    
    if GetTask(TASK_THREE) == 1 then
        TalkEx("task_four_00", szTaskThreeTalk);
        return
    end;
    
    local nStep = GetTask(TASK_FOUR);
    if nStep == 1 then
        TalkEx("task_four_01", szTaskFourTalk);
        return
    elseif nStep == 2 then
        Talk(1, "task_four_02_00", "Phi襫 b籲g h鱱 n Long Tuy襫 th玭 gi誸 20 con h� ly.");
        return
    elseif nStep == 3 then
        TalkEx("task_four_03", szFinished);
        return
    end;
    
    nStep = GetTask(TASK_FIVE);
    if nStep == 1 then
        TalkEx("task_five_00", szTaskFiveTalk);
        return
    elseif nStep == 2 then
        Talk(1, "", "Mau b竜 r� t譶h h譶h n琲 n祔 cho c竎 ngi li猲 l筩 c馻 Trng Ca M玭!");
        return
    elseif nStep == 5 then
        RemoveTrigger(GetRunningTrigger());
        SetTask(TASK_FIVE, 6);
        GivePlayerAward("Level_18", "hard", "head", "Level_21");
        TalkEx("", szTaskFiveFinished);
        return
    end;
    
    local szTalk = {
        "<sex> n誹 r秐h r鏸, h穣 nghe ta t蕌 kh骳!"
    };
    TalkEx("", szTalk);
end;

function talk_one()
    local szTalk = {
        "Ta ph鬾g m謓h Tri謚 Di猲 Ni猲 ti襫 b鑙 th玭g b竜 cho c� nng c莕  ph遪g b鋘 d� t閏 v� s�",
        " t� <sex>, ta s�  ph遪g."
    };
    GivePlayerAward("Level_20", "hard");
    GivePlayerExp(SkeyBJShuxin,"shitaijinji2")		--事态紧急1
    SetTask(124, 2);
    if GetTask(125) == 2 and GetTask(126) == 2 then
        SetTask(111, 111);
    end;
    TalkEx("", szTalk);
end;

function task_four_00()
    SetTask(TASK_THREE, 2);
    SetTask(TASK_FOUR, 1);
    DelItem(2, 0, 40, 1);
    GivePlayerAward("Level_18", "hard");
end;

function task_four_01()
    local szTalkFourTalk2 = {
        "Th﹏ ph薾 ta  b� ngi {Xi H醓 gi竜} ph竧 hi謓, ngi mau gi髉 ta n {Long Tuy襫 Th玭} gi誸 20 con {h� ly} v� y!",
        "Л頲! Ta 甶 ngay!"
    };
    TalkEx("task_four_02", szTalkFourTalk2);
end;

function task_four_02()
    SetTask(TASK_FOUR, 2);
    CreateTrigger(0,506,99);	--杀狐狸
    Msg2Player("Gi誸 20 con h� ly � Long Tuy襫 Th玭");
    TaskTip("Gi誸 20 con h� ly � Long Tuy襫 Th玭");
end;

function task_four_02_00()
	if GetTrigger(99) == 0 then
		CreateTrigger(0,506,99);	--杀狐狸
	end;
end;

function task_four_03()
    SetTask(TASK_FOUR, 4);
    SetTask(TASK_FIVE, 1);
    GivePlayerAward("Level_18", "hard");
end;

function task_five_00()
    SetTask(127,1);
    SetTask(128,1);
    SetTask(129,1);
    
    AddItem(2, 0, 41, 1);   --诸葛棋的信
    AddItem(2, 0, 42, 1);   --公孙书的信
    AddItem(2, 0, 43, 1);   --赵延年的信
    
    Msg2Player("Li猲 l筩 3 v韎 3 ngi c遪 l筰 trong Trng Ca M玭");
    TaskTip("Li猲 l筩 3 v韎 3 ngi c遪 l筰 trong Trng Ca M玭");
    
    SetTask(TASK_FIVE, 2);
end;