--襄阳·探营任务主题脚本
--created by lizhi
--2005-8-18 16:43

--现在与NPC的对话触发器的处理机制是，完成对话后立刻卸载对话触发器
--这样做可以避免其他任务不能继续下去的情况，但是没有了任务提示
--以后如果实现了NPC对话时可以选择任务列表，就可以解决现在这种情况


Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

-----------------------------------襄阳探营-------------------------------------

function task_01_00()
    local szTalk = {
        "Chuy謓 n鉯 ra d礽 d遪g, v鮝 r錳 t筰 Bi謓 Kinh v穘 b鑙 畂箃 頲 b鴆 th� c馻 Thi猲  gi竜 Li猽 qu鑓, ti襫 b鑙 xem qua!",
    	"[C玭g T玭 Th� c b鴆 th璢",
    	" t� <sex>, ta s�  ph遪g! V� c玭g t莔 thng kh玭g th�  thng 頲 l穙 phu! Ha! Ha! Ha!",
    	"Ti襫 b鑙 v� c玭g c竔 th�, c� d辮 t筰 h� c騨g mu鑞 th豱h gi竜 v礽 chi猽.",
    	"Ha! Ha! <sex> r蕋 c� ch� kh� nh璶g hi謓 ta 產ng c� vi謈 h裯 <sex> v祇 d辮 kh竎.",
    	"Chuy謓 g�? T筰 h� gi髉 頲 kh玭g?",
    	"Nguy hi誱 l緈, ta kh玭g d竚 phi襫 <sex>! Ta c� b鴆 th� mu鑞 g鰅 cho T� H筩 Ch﹏ Nh﹏ � V� ng, c� th� gi髉 ta 頲 kh玭g?",
        "Л頲 th玦!"
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    SetTask(TASK_XYTY, 2);
    DelItem(2,0,50,1);
    Msg2Player("дn V� ng s琻 t譵 T� H筩 Ch﹏ Nh﹏");
    TaskTip("дn V� ng s琻 t譵 T� H筩 Ch﹏ Nh﹏");
    GivePlayerAward("Level_20", "hard");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan1")		--灵宝山1
end;

function task_02_00()
    local szTalk = {
        "Xu鑞g n骾 l﹗ nh� v藋 m� kh玭g c� tin t鴆 g� sao?",
    	"Tham ki課 ti襫 b鑙!",
    	"Mi詎 l�! Mi詎 l�! Kh玭g bi誸 t譵 b莕 o c� chuy謓 g�?",
    	"C玭g T玭 Th� ti襫 b鑙 nhi襲 ng祔 kh玭g nh薾 頲 tin t鴆 n猲 ph竔 t筰 h� n h醝 th╩.",
    	"M蕐 h玬 nay trong ph竔 g苝 m閠 s� chuy謓 b莕 o ch璦 li猲 l筩 k辮. Hi謓 b莕 o mu鑞 nh� ngi n Thi誹 L﹎ t譵 nh� ng.",
    	"в v穘 b鑙 n  m閠 chuy課!",
        "T鑤 qu�!  阯g c萵 th薾!"
    };
    TalkEx("task_02_01", szTalk);
end;

function task_02_01()
    SetTask(TASK_XYTY, 3);
    Msg2Player("T譵 th� ki誱 nh� ng");
    TaskTip("T譵 th� ki誱 nh� ng");
    GivePlayerAward("Level_21", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan2")		--灵宝山2
end;

function task_03_00()
    local szTalk = {
    	"L� l� la..",
    	"Cho h醝 y c� ph秈 {th� ki誱 nh� ng} kh玭g?",
    	"ng r錳! T筰 h� L鬰 Th竔 Thanh, huynh  hay g鋓 Ki誱 ng, k� b猲 l� s�  L鬰 Tr� B譶h hay c遪 g鋓 Th� ng. Ch髇g Ta ph鬾g m謓h s� ph� l猲 Thi誹 L﹎, gi鱝 阯g g苝 Li謕 h� Linh B秓 s琻, hai b猲 x秠 ra tranh ch蕄 ch髇g nh s�  b� thng, ta kh玭g d竚 v� g苝 s� ph� v�  ph筸 gi韎 nh璶g l筰 s� thng t輈h c馻 s� ...",
    	"Th玦  ta gi髉 hai ngi v� n鉯 v韎 s� ph�.",
        " t� <sex>."
    };
    TalkEx("task_03_01", szTalk);
end;

function task_03_01()
    SetTask(TASK_XYTY, 4);
    Msg2Player("V� b萴 b竜 T� H筩 Ch﹏ Nh﹏");
    TaskTip("V� b萴 b竜 T� H筩 Ch﹏ Nh﹏");
    GivePlayerAward("Level_21", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan3")		--灵宝山3
end;

function task_04_00()
    local szTalk = {
        "T譵 頲 hai  t� c馻 ta kh玭g?",
    	"е t� c馻 qu� ph竔 gi鱝 阯g kh玭g may g苝 b鋘 x蕌  thng, hi謓 甶 ng b蕋 ti謓 v穘 b鑙 v� th玭g b竜 trc cho ti襫 b鑙!",
    	"B鋘 ch髇g kh玭g nghe l阨 b莕 o, l筰 d飊g v� v韎 ngi kh竎, l莕 n祔 v� nh蕋 nh ph秈 d箉 d� cho th藅 t鑤.",
    	"Ti襫 b鑙 khoan n鉵g v閕, trc ti猲 tr� thng t輈h cho L鬰  , i h� v� h醝 u 畊玦 c﹗ chuy謓 x� ph箃 c騨g ch璦 mu閚.",
    	"Th玦 頲! в ch髇g t辬h dng th猰 v礽 ng祔, � y c� m蕐 vi猲 D﹏ S琻 n chuy猲 tr� n閕 thng nh璶g ta c莕 th猰 H� C鑤 t鰑 l祄 m錳 thu鑓, ngi gi髉 ta t譵 頲 kh玭g?",
    	"Vi謈 n祔  v穘 b鑙 lo!",
        "Phi襫 b籲g h鱱 n Linh B秓 s琻 l蕐 gi髉 ta 10 b� H� c鑤 v� y!"
    };
    TalkEx("task_04_01", szTalk);
end;

function task_04_01()
    SetTask(TASK_XYTY, 5);
    CreateTrigger(0, 518, KILL_XY_LAOHU); --杀老虎
    Msg2Player("Gi誸 h� d� � Linh B秓 s琻 l蕐 10 c竔 h� c鑤");
    TaskTip("Gi誸 h� d� � Linh B秓 s琻 l蕐 10 c竔 h� c鑤");
    GivePlayerAward("Level_21", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan4")		--灵宝山4
end;

function task_05_00()
	local szTalk = {
		"Phi襫 b籲g h鱱 n Linh B秓 s琻 l蕐 gi髉 ta 10 b� H� c鑤 v� y!"
	};
	TalkEx("task_06_02", szTalk);
end;

function task_06_00()
    local szTalk = {
        "T譵 頲 h� c鑤 ch璦?",
	    "T譵 頲 r錳!",
        "Phi襫 b籲g h鱱 甧m H� C鑤 M﹏ s琻 n cho hai  t� ta."
    };
    local szNot = {
        "H� c鑤 v蒼 ch璦 t譵  �?",
	    "V穘 b鑙 甶 ngay!"
	};
    if GetItemCount(2,0,55) >= 10 then
        TalkEx("task_06_01", szTalk);
    else
        TalkEx("task_06_02", szNot);
    end;
end;

function task_06_01()
    SetTask(TASK_XYTY, 7);
    RemoveTrigger(GetTrigger(KILL_XY_LAOHU));
    DelItem(2,0,55,10);
    AddItem(2,0,204,1);   --虎骨XX丹，暂时用绷带
    Msg2Player("m H� C鑤 M﹏ s琻 n cho th� ki誱 nh� ng");
    TaskTip("m H� C鑤 M﹏ s琻 n cho th� ki誱 nh� ng");
    GivePlayerAward("Level_21", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan5")		--灵宝山5
end;

function task_06_02()
    if GetTrigger(KILL_XY_LAOHU) == 0 then
        CreateTrigger(0, 518, KILL_XY_LAOHU); --杀老虎
    end;
end;

function task_07_00()
    local szTalk = {
        "Ta mong tin qu�! Chng m玭 n鉯 sao?",
    	"T� H筩 Ch﹏ Nh﹏ b秓 hai ngi tr� thng trc, y l� linh dc.",
    	" t� c鴘 m筺g!",
    	"[Ki誱 ng a thu鑓 cho th� ng]",
    	"Th鵦 ra kh玭g ph秈 b鋘 ta v� c� ra tay m� v� t譶h nghe 頲 b鋘 Li謕 h� n鉯 v� cp s琻 trang, h� nh gi誸 b鋘 ta di謙 kh萿.",
    	"Xem ra hai ngi c騨g c� � t鑤  ta v� b萴 b竜 v韎 i nh﹏.",
        " t� <sex>厖"
    };
    TalkEx("task_07_01", szTalk);
end;

function task_07_01()
    DelItem(2,0,204,1); --虎骨xx丹
    SetTask(TASK_XYTY, 8);
    Msg2Player("m chuy謓 b萴 b竜 l筰 v韎 T� H筩 Ch﹏ Nh﹏");
    TaskTip("m chuy謓 b萴 b竜 l筰 v韎 T� H筩 Ch﹏ Nh﹏");
    GivePlayerAward("Level_21", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan6")		--灵宝山6
end;

function task_08_00()
    local szTalk = {
        "Ngi c� d蒼 hai  t� c馻 ta v� kh玭g?",
    	"T筰 h� th蕐 h� ch璦 kh醝 n猲 v� y b竜 tin trc nghe n鉯 h� b� h祄 oan do can ng╪ m Li謕 h� cp s琻 trang.",
    	"H鮩! V� ngh� h鋍 ch璦 t韎 u m� mu鑞 h祅h hi謕 trng ngh躠.",
    	"Ti襫 b鑙 n鉯 ng.",
    	"Kh玭g d竚! Kh玭g d竚! M� ng r錳 nghe ngi n鉯 s琻 trang kh玭g l� M� Tuy誸 s琻 trang, ngi mau v� b萴 b竜 v韎 C玭g T玭 Th�, h譶h nh� h緉 c� qua l筰 trang ch� n琲 .",
    	"V穘 b鑙 甶 ngay!",
        "Ngi gi髉 V� ng r蕋 nhi襲, � y c� ch髏 qu� xem nh� b竜 p."
    };
    TalkEx("task_08_01", szTalk);
end;

function task_08_01()
    SetTask(TASK_XYTY, 9);
    Msg2Player("Th玭g b竜 cho C玭g T玭 Th�");
    TaskTip("Th玭g b竜 cho C玭g T玭 Th�");
    GivePlayerAward("Level_21", "hard", "legs", "Level_23");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan7")		--灵宝山7
end;

function task_09_00()
    local szTalk = {
        "Chuy謓 l韓 r錳!",
    	"<sex> ng n猲 h鑤 ho秐g, n鉯 cho ta nghe chuy謓 g� n祇?",
    	"Trong l骳 n V� ng v� t譶h nghe tin b鋘 ngi Linh B秓 s琻 c� �  cp {M� Tuy誸 s琻 trang} n猲 n y th玭g b竜.",
    	"Ra l� v藋! M蕐 h玬 nay ta c� nghe n chuy課 h祅g c馻 M� Tuy誸 s琻 trang nh� Ti猽 c鬰 chuy觧 甶 b� m蕋 t輈h, ch綾 c� li猲 quan n chuy謓. <sex> gi髉 ta n Linh B秓 s琻 h醝 nh鱪g {Th� s╪} tr猲  th� xem!",
        "Ti襫 b鑙 y猲 t﹎, t筰 h� 甶 y!"
    };
    TalkEx("task_09_01", szTalk);
end;

function task_09_01()
    CreateTrigger(0,519,KILL_XY_LIEHU);
    SetTask(TASK_XYTY, 10);
    Msg2Player("T譵 Li謕 h� Linh B秓 s琻 d� la tin t鴆");
    TaskTip("T譵 Li謕 h� Linh B秓 s琻 d� la tin t鴆");
    GivePlayerAward("Level_22", "easy");
	GivePlayerExp(SkeyBJKouzhun,"gongsunshu")		--寻找公孙书
end;

function task_10_00()
    local szTalk = {
        "<sex> gi髉 ta n Linh B秓 d� la tin t鴆 b鋘 ngi Li謕 h� 頲 kh玭g?"
    };
    TalkEx("task_10_01", szTalk);
end;

function task_10_01()
    if GetTrigger(KILL_XY_LIEHU) == 0 then
        CreateTrigger(0,519,KILL_XY_LIEHU);
    end;
end;

function task_11_00()
    local szTalk = {
        "Chuy課 甶 l莕 n祔 <sex> thu th藀 頲 g�?",
	    "Ta ph竧 hi謓 tr猲 ngi Li謕 h� c� c� c馻 ti猽 c鬰, c� th� ti猽 s�  b� h穖 h筰. Vi謈 n祔 x� l� ra sao, xin ti襫 b鑙 ch� gi竜.",
	    "Chuy謓 gi誸 ngi  cho quan ph� gi秈 quy誸. Trc m総 <sex> gi髉 ta n Linh B秓 s琻 t譵 h祅g h鉧 b� th蕋 l筩.",
        "Л頲 th玦!"
    };
    local szNot = {
        "Chuy課 甶 l莕 n祔 <sex> thu th藀 頲 g�?",
	    "Ta ph竧 hi謓 tr猲 ngi Li謕 h� c� c� c馻 ti猽 c鬰, do g蕄 g竝 n猲 ch璦 k辮 mang v�.",
	    "S� vi謈 h� tr鋘g <sex> ph秈 mang c� cho ta xem m韎 頲."
	};
    if GetItemCount(2,0,56) >= 1 then
        TalkEx("task_11_01", szTalk);
    else
        TalkEx("task_10_01", szNot);
    end;
end;

function task_11_01()
    DelItem(2,0,56,1);
    SetTask(TASK_XYTY, 12);
    Msg2Player("дn Linh B秓 s琻 nh Li謕 h� mang 20 ki謓 h祅g v�");
    TaskTip("дn Linh B秓 s琻 nh Li謕 h� mang 20 ki謓 h祅g v�");
    GivePlayerAward("Level_22", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshanduobiao1")		--灵宝山夺镖1
end;

function task_12_00()
    local szTalk = {
        "M� Tuy誸 s琻 trang m蕋 nhi襲 h祅g h鉧, phi襫 <sex> t譵 v�.",
        "V穘 b鑙 甶 ngay!"
    };
    TalkEx("task_10_01", szTalk);
end;

function task_13_00()
    local szTalk = {
        "Xem <sex> vui m鮪g v藋 ch綾 l蕐 頲 h祅g h鉧 v� r錳!",
    	"Ti襫 b鑙 ng ci, y l� tang v藅 ch� ti襫 b鑙 gi秈 quy誸.",
    	"в ta xem! Sao c� b鴆 th� M� Tuy誸 s琻 trang g鰅 cho T﹜ H�?",
    	"[C玭g T玭 Th� xem k� n閕 dung trong th璢",
    	"Trong th� ghi chuy課 h祅g n祔 M� Tuy誸 s琻 trang cp 頲 t� V� ng ph竔. Chuy謓 n祔 c� v� kh� nghi, ngi mau t譵 T� H筩 Ch﹏ Nh﹏ x竎 minh th� xem!",
        "V穘 b鑙 n V� ng y!"
    };
    local szNot = {
        "M� Tuy誸 s琻 trang m蕋 nhi襲 h祅g h鉧, phi襫 <sex> t譵 v�.",
        "V穘 b鑙 甶 ngay!"
    };
    if GetItemCount(2,0,57) >= 20 then
        TalkEx("task_13_01", szTalk);
    else
        TalkEx("task_10_01", szNot);
    end;
end;

function task_13_01()
    RemoveTrigger(GetTrigger(KILL_XY_LIEHU));
    SetTask(TASK_XYTY, 14);
    Msg2Player("m h祅g h鉧 n V� ng cho T� H筩 Ch﹏ Nh﹏ ki觤 ch鴑g");
    TaskTip("m h祅g h鉧 n V� ng cho T� H筩 Ch﹏ Nh﹏ ki觤 ch鴑g");
    GivePlayerAward("Level_22", "hard");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshanduobiao2")		--灵宝山夺镖2
end;

function task_14_00()
    local szTalk = {
        "Ng鋘 gi� n祇 a ngi n y?",
    	"C玭g T玭 Th� ti襫 b鑙 nh薾 頲 tin V� ng b� m蕋 m閠 s� v藅 ph萴 qu� n猲 ph竔 t筰 h� n h醝 th�!",
    	"Trong ph竔 ch� c� m蕐 ngi ch鴆 v� cao m韎 bi誸. C玭g T玭 Th� l蕐 tin t鴆 t� u?",
    	"Kh玭g gi蕌 g� t筰 Linh B秓 s琻 v穘 b鑙 ph竧 hi謓 chuy課 h祅g M� Tuy誸 s琻 trang, bi誸 頲 b猲 trong c� v藅 ph萴 qu� ph竔 n猲 甧m n tr�.",
    	"Mau a b莕 o xem!"
	};
	TalkEx("task_14_00_0", szTalk);
end;

function task_14_00_0()
    local szTalk = {
    	"[T� H筩 Ch﹏ Nh﹏ ki觤 tra h祅g h鉧]",
    	"Ngi bi誸 y l� b秓 v藅 g� kh玭g?",
    	"V穘 b鑙 kh玭g bi誸.",
    	"Зy ch輓h l� Huy襫 thi誸 B竧 Qu竔 k輓h b秓 v藅 ch蕁 ph竔 c馻 V� ng do b猲 trong 萵 ch鴄 m秐h S琻 H� X� T綾 v� v藋 m韎 b� l蕐 tr閙."
	};
	TalkEx("task_14_00_1", szTalk);
end;

function task_14_00_1()
    local szTalk = {
    	"V穘 b鑙 t鮪g nghe D� T萿 l穙 nh﹏ n鉯 m秐h S琻 H� X� T綾 c� uy l鵦 v� bi猲 nh璶g sao M� Tuy誸 s琻 trang l筰 d� d祅g a cho ngi kh竎?",
    	"Ta y c騨g kh玭g r�. Nh璶g b莕 o c� m閠 k� kh玭g ch鮪g h鱱 d鬾g.",
    	"Xin o trng ch� gi竜!",
    	"Ngi th� gi� d筺g ngi ti猽 c鬰 c遪 s鑞g n M� Tuy誸 s琻 trang d� la. Nh璶g ph秈 h誸 s鴆 c萵 th薾!",
        "Mu鑞 v祇 trong ch綾 ph秈 c� 竚 hi謚. в v穘 b鑙 t譵 m閠 s� ngi h醝 xem!"
    };
    TalkEx("task_14_01", szTalk);
end;

function task_14_01()
    DelItem(2,0,57,20);
    CreateTrigger(0,520,KILL_XY_MXSZ);
    SetTask(TASK_XYTY, 15);
    Msg2Player("Bu閏 thng kh竎h, ki誱 kh竎h M� Tuy誸 s琻 trang n鉯 ra 竚 hi謚");
    TaskTip("Bu閏 thng kh竎h, ki誱 kh竎h M� Tuy誸 s琻 trang n鉯 ra 竚 hi謚");
    GivePlayerAward("Level_24", "easy");
	GivePlayerExp(SkeyBJKouzhun,"muxueshanzhuang1")		--暮雪山庄1
end;

function task_15_00()
    local szTalk = {
        "M� Tuy誸 s琻 trang ph遪g th� nghi猰 ng苩, kh� m� l鋞 v祇 b猲 trong.",
        "Mu鑞 v祇 trong ch綾 ph秈 c� 竚 hi謚. в v穘 b鑙 t譵 m閠 s� ngi h醝 xem!"
    };
    TalkEx("task_15_01", szTalk);
end;
    
function task_15_01()
    if GetTrigger(KILL_XY_MXSZ) == 0 then
        CreateTrigger(0, 520, KILL_XY_MXSZ);
    end;
end;

function task_16_00()
    local szTalk = {
        "Ngi l� ai?",
    	"Ta...ch輓h l� ngi c馻 Ch蕁 Uy ti猽 c鬰. Ti猽 xa b� cp ch� m閠 m譶h ta tho竧 ch誸, mau cho ta v祇 b萴 b竜 v韎 trang ch�.",
    	"Ngi ti猽 c鬰 �? Sao ta kh玭g bi誸 v藋? C� 竚 hi謚 kh玭g?",
    	"{M閩 ai tr莔 tr莔, {Tuy誸} d� h玭 h玭, {S琻} l閏 tr飊g tr飊g, {Trang} x� th﹎ th﹎, ng kh玭g?",
    	"ng l� ngi nh�! H穣 甶 b萴 b竜 v韎 C鰑 u Kim Ph鬾g! Nh� 甧m theo l謓h b礽 n鉯 c� vi謈 c莡 ki課.",
        "[T譵 l謓h b礽 ti課 h祅h bc ti誴 theo]"
    };
    TalkEx("task_16_01", szTalk);
end;

function task_16_01()
    SetTask(TASK_XYTY, 17);
    CreateTrigger(0,520,KILL_XY_MXSZ);
    Msg2Player("Цnh Thng kh竎h, Ki誱 kh竎h l蕐 1 L謓h b礽!");
    TaskTip("Цnh Thng kh竎h, Ki誱 kh竎h l蕐 1 L謓h b礽!");
    GivePlayerAward("Level_24", "easy");
	GivePlayerExp(SkeyBJKouzhun,"muxueshanzhuang2")		--暮雪山庄2
end;

function task_17_00()
    local szTalk = {
        "T譵 C鰑 u Kim Ph鬾g. Nh� mang theo L謓h b礽!"
    };
    TalkEx("task_17_01", szTalk);
end;

function task_17_01()
    if GetTrigger(KILL_XY_MXSZ) == 0 then
        CreateTrigger(0,520,KILL_XY_MXSZ);
    end;
end;

function task_18_00()
    local szTalk = {
        "Ngi l� ai? Kh玭g th蕐 ta 產ng thng th鴆 ru sao?",
    	"T筰 h� l� ngi c馻 Ch蕁 Uy ti猽 c鬰, ti猽 xa b� cp � Linh B秓 s琻, t筰 h� may m緉 tho竧 kh醝, xin i t� s緋 x誴.",
    	"Ai m� to gan d竚 ng n M� Tuy誸 S琻 Trang?",
    	"L� m ngi Li謕 h� � Linh B秓 s琻.",
    	"Chuy謓 n祔  ta lo li謚, xem ra vi謈 l蕐 c緋 b竨 v藅 V� ng  b� b筰 l�! Ngi h穣 v祇 Th蕋 Tinh ng b竜 tin cho Ng﹏ H� trc!",
        "Thu閏 h� tu﹏ l謓h."
    };
    local szNot = {
        "Ngi l� ai? Kh玭g th蕐 ta 產ng thng th鴆 ru sao? ng qu蕐 r莥!",
        "[Xem ra ph秈 甧o l謓h b礽 m韎 頲]",
        "Thu閏 h� l藀 t鴆 c竜 lui."
    };
    if GetItemCount(2,0,58) >= 1 then
        TalkEx("task_18_01", szTalk);
    else
        TalkEx("task_17_01", szNot);
    end;
end;

function task_18_01()
    DelItem(2,0,58,1);
    RemoveTrigger(GetTrigger(KILL_XY_MXSZ));
    SetTask(TASK_XYTY, 19);
    Msg2Player("V� b萴 b竜 T� H筩 Ch﹏ Nh﹏");
    TaskTip("V� b萴 b竜 T� H筩 Ch﹏ Nh﹏");
    GivePlayerAward("Level_24", "easy");
	GivePlayerExp(SkeyBJKouzhun,"muxueshanzhuang3")		--暮雪山庄3
end;

function task_19_00()
    local szTalk = {
        "Ngi 甶襲 tra 頲 g� r錳?",
        "B萴 o trng ch th鵦 l� M� Tuy誸 s琻 trang l蕐 c緋 Huy襫 thi誸 B竧 Qu竔 k輓h, hi謓 hung th� 產ng 萵 n蕄 � {Th蕋 Tinh ng}.",
        "C� chuy謓 n祔 n鱝 sao? Th蕋 Tinh ng l� n琲 nguy hi觤, k� ch d竚 t nh藀 v祇 trong xem ra b莕 o ph秈 tri謚 t藀  t� n  r錳.",
        "T筰 h� t譶h nguy謓 v祇 trong b総 k� ch.",
        "Ngi th藅 gan d� nh璶g kh玭g n猲 xem thng k� ch ph秈 h誸 s鴆 c萵 th薾."
    };
    TalkEx("task_19_01", szTalk);
end;

function task_19_01()
    SetTask(TASK_XYTY, 20);
    Msg2Player("Цnh b筰 Ng﹏ H�");
    TaskTip("Цnh b筰 Ng﹏ H�");
    GivePlayerAward("Level_31", "easy");
	GivePlayerExp(SkeyBJKouzhun,"muxueshanzhuang4")		--暮雪山庄4
end;

function task_21_00()
    local szTalk = {
        "Ngi nh b筰 t猲 o t芻 ch璦?",
        "T猲 gi芻  th� ch誸 c騨g kh玭g ch辵 khu蕋 ph鬰, v穘 b鑙 ch� t譵 頲 m閠 t蕀 Danh b礽!",
        "Danh b礽? Лa ta xem!",
        "[T� H筩 Ch﹏ Nh﹏ c莔 xem r蕋 l﹗匽",
        "Ngi th� mang cho C玭g T玭 Th� xem, � y c� ch髏 qu� m鋘 xem nh� b莕 o t� 琻 ngi."
    };
    TalkEx("task_21_01", szTalk);
end;

function task_21_01()
    SetTask(TASK_XYTY, 22);
    GivePlayerAward("Level_31", "hell", "chest", "Level_28");
	GivePlayerExp(SkeyBJKouzhun,"qixingdong")		--暮雪山庄1
end;

-------------------------------------襄阳剑门--------------------------------------

function task_22_00()
    local szTalk = {
        "Chuy課 甶 V� ng l莕 n祔 <sex> c� thu ho筩h g� kh玭g?",
    	"B竨 v藅  ch th鵦 c馻 V� ng nghe n鉯 b猲 trong ch鴄 m秐h S琻 H� X� T綾. T筰 h� c遪 ph竧 hi謓 m鉵  tr猲 ngi k� tr閙.",
    	"[Лa Danh b礽 cho C玭g T玭 Th� xem]",
    	"Зy l� qu﹏ hi謚 T﹜ H�, kh玭g l� t猲 tr閙  l� l輓h T﹜ H�. Xem ra m鑙 quan h� gi鱝 M� Tuy誸 s琻 trang v� T﹜ H� th藅 kh玭g n gi秐. <sex> n s琻 trang m閠 chuy課 甶襲 tra xem sao.",
        "в t筰 h� 甶 h醝 {C鰑 u Kim Ph鬾g}."
    };
    TalkEx("task_22_01", szTalk);
end;

function task_22_01()
    SetTask(TASK_XYTY, 23);
    DelItem(2,0,59,1);
end;

function task_23_00()
    local szTalk = {
        "Ngi v� r錳 �? Ng﹏ H� u?",
    	"T筰 h� c� khuy猲 m� c� nng 蕐 kh玭g ch辵 v�, y l� qu﹏ hi謚 c� ta  l筰.",
    	"H鮩! D竚 g箃 ta �? Зy l� Qu﹏ hi謚, v藅 b蕋 ly th﹏ c馻 qu﹏ nh﹏ T﹜ H�, ngi ch輓h l� ngi c馻 V� ng! Ch糿g l� Ng﹏ H�  ch誸 di tay ngi? Ta ph秈 b竜 th�!",
        "[B筰 l� r錳, xem ra tr薾 chi課 kh玭g th� tr竛h kh醝]"
    };
    TalkEx("task_23_01", szTalk);
    SetTask(TASK_XY_TEMP, GetTargetNpc());
end;

function task_23_01()
    ChangeNpcToFight(GetTask(TASK_XY_TEMP));

--    SetTask(TASK_XYTY, 24);
--    --log触发器
--    CreateTrigger(3, 204, LEAVE_GAME_XY);
--    SetLogType(GetTrigger(LEAVE_GAME_XY), 1); --设置为蹬出类型
--    
--    --rect 触发器
--    CreateTrigger(2,1301,LEAVE_RECT_XY);
--    
--    SetDeathScript("\\script\\task\\world\\lizhi_襄阳\\task_Death.lua");
    Msg2Player("Цnh b筰 C鰑 u Kim Ph鬾g");
    TaskTip("Цnh b筰 C鰑 u Kim Ph鬾g");
end;

function task_25_00()
    local szTalk = {
        "Ngi l� ngi M� Tuy誸 s琻 trang �? Sao kh玭g th蕐 C鰑 u Kim Ph鬾g?",
    	"Чi t� d苙 ta n y a m藅 h祄.",
    	"[Th竎 B箃 K� nh薾 m藅 h祄]",
    	"Qu﹏ i  chu萵 b� s絥 s祅g � {Ki誱 M玭 Quan} ch� hi謚 l謓h {t藀 k輈h th祅h Tng Dng}, ngi mau v� b萴 b竜 v韎 trang ch� chu萵 b� ph鑙 h頿 t竎 chi課.",
    	"[Kh玭g xong r錳 qu﹏ i T﹜ H�  ti課 v祇 Ki誱 M玭 Quan, c莕 ph秈 ti猽 di謙 i qu﹏ ti猲 phong trc]"
    };
    TalkEx("task_25_01", szTalk);
end;

function task_25_01()
    DelItem(2,0,60,1);
    CreateTrigger(0,521,KILL_XY_DB);
    CreateTrigger(0,522,KILL_XY_QB);
    Msg2Player("Цnh b筰 i qu﹏ ti猲 phong c馻 T﹜ H�");
    TaskTip("Цnh b筰 i qu﹏ ti猲 phong c馻 T﹜ H�");
    SetTask(TASK_XYTY, 26);
    SetTask(TASK_XY_TEMP, 0);
    SetTask(TASK_XY_TEMP1, 0);
    GivePlayerAward("Level_26", "normal");
	GivePlayerExp(SkeyBJKouzhun,"jianmenweiji")		--剑门危机
end;

function task_26_00()
    local szTalk = {
        "Qu﹏ i  chu萵 b� s絥 s祅g � {Ki誱 M玭 Quan} ch� hi謚 l謓h {t藀 k輈h th祅h Tng Dng}, ngi mau v� b萴 b竜 v韎 trang ch� chu萵 b� ph鑙 h頿 t竎 chi課."
    };
    TalkEx("task_26_01", szTalk);
end;

function task_26_01()
    if GetTrigger(KILL_XY_DB) == 0 and GetTask(TASK_XY_TEMP) == 0 then
        CreateTrigger(0,521,KILL_XY_DB);
    end;
    if GetTrigger(KILL_XY_QB) == 0 and GetTask(TASK_XY_TEMP1) == 0 then
        CreateTrigger(0,522,KILL_XY_QB);
    end;
end;

function task_28_00()
    local szTalk = {
        "Chuy謓 kh玭g hay r錳!",
    	"Kh玭g n猲 h鑤 ho秐g, t� t� n鉯.",
    	"V穘 b鑙 ph竧 hi謓 qu﹏ i T﹜ H�  ti課 v祇 Ki誱 M玭 Quan, 產ng chu萵 b� t藀 k輈h th祅h Tng Dng.",
    	"Tng Dng th祅h l� y誹 甶觤 n誹 b� c玭g ph� th� h藆 qu� kh玭g th� lng 頲.",
    	"Ti襫 b鑙 kh玭g n猲 lo l緉g t筰 h�  nh b筰 i qu﹏ ti猲 phong T﹜ H�, thi誸 ngh� ch髇g kh玭g d竚 manh ng.",
    	"Kh� l緈! Vi謈 nh gi芻 trc gi� u qua b� tr薾 n誹 ch髇g ta c� 頲 b秐  b祔 binh b� tr薾 c馻 ch th� ph莕 th緉g s� cao h琻. <sex> ng � n Ki誱 M玭 Quan t譵 B� Tr薾  c馻 ngi T﹜ H� kh玭g?",
        "Ti襫 b鑙 y猲 t﹎ t筰 h� nh蕋 nh t譵 頲."
    };
    TalkEx("task_28_01", szTalk);
end;

function task_28_01()
    SetTask(TASK_XYTY, 29);
    CreateTrigger(0,523,KILL_XY_JMG);
    Msg2Player("T譵 B� Tr薾  T﹜ H�");
    TaskTip("T譵 B� Tr薾  T﹜ H�");
    GivePlayerAward("Level_26", "hard");
	GivePlayerExp(SkeyBJKouzhun,"jianmenduoying1")		--剑门危机1
end;

function task_29_00()
    local szTalk = {
        "Vi謈 nh gi芻 trc gi� u qua b� tr薾 n誹 ch髇g ta c� 頲 b秐  b祔 binh b� tr薾 c馻 ch th� ph莕 th緉g s� cao h琻. <sex> ng � n Ki誱 M玭 Quan t譵 B� Tr薾  c馻 ngi T﹜ H� kh玭g?"
    };
    TalkEx("task_29_01", szTalk);
end;

function task_29_01()
    if GetTrigger(KILL_XY_JMG) == 0 then
        CreateTrigger(0,523,KILL_XY_JMG);
    end;
end;

function task_30_00()
    local szTalk = {
        "<sex> t譵 頲 r錳 �?",
    	"Ti襫 b鑙 xem qua!",
    	"[C玭g T玭 Th� nghi猲 c鴘 k� B� Tr薾 ]",
    	"Qu薾 i T﹜ H� ch� y誹 l� b� binh, d飊g thu藅 h鉧 trang  d� tr� tr閚 nh璶g t鑓  di chuy觧 h琲 ch薽, b猲 trong B� Tr薾  v� ra 3 i doanh l韓 trong Ki誱 M玭 Quan, m鏸 i doanh u c� tng l躰h th鑞g so竔. N誹 c� th� t藀 k輈h gi誸 ch誸 tng l躰h qu﹏ i, T﹜ H� l藀 t鴆 i lo筺.",
        "Qu� l� cao ki課! в t筰 h� 甶 gi誸 3 t猲 tng l躰h T﹜ H�."
    };
    local szNot = {
        "<sex> t譵 頲 r錳 �?",
    	"Qu﹏ i T﹜ H� canh g竎 nghi猰 ng苩, kh玭g d� th﹎ nh藀 i v穘 b鑙 t譵 l筰."
    };
    if GetItemCount(2,0,61) >= 1 then
        TalkEx("task_30_01", szTalk);
    else
        TalkEx("task_29_01", szNot);
    end;
end;

function task_30_01()
    DelItem(2,0,61,1);
    RemoveTrigger(GetTrigger(KILL_XY_JMG));
    --CreateTrigger(0,524,KILL_XY_JL);
    SetTask(TASK_XYTY, 31);
    SetTask(TASK_XY_TEMP, 0);
    Msg2Player("Цnh b筰 3 t猲 tng l躰h T﹜ H�");
    TaskTip("Цnh b筰 3 t猲 tng l躰h T﹜ H�");
    GivePlayerAward("Level_28", "easy");
	GivePlayerExp(SkeyBJKouzhun,"jianmenduoying2")		--剑门危机2
end;

function task_32_00()
    local szTalk = {
        "Ta th蕐 <sex> 甶 h琲 l﹗ c� ch髏 lo l緉g nh璶g <sex> b譶h an tr� v� l� t鑤 r錳.",
    	"T筰 h� t譵 頲 m蕐 b鴆 th� tr猲 ngi tng l躰h ti襫 b鑙 xem qua.",
    	"Лa ta xem!",
    	"[C玭g T玭 Th� c th璢"
	};
	TalkEx("task_32_00_01", szTalk);
end;

function task_32_00_01()
	local szTalk = {
	    "Kh玭g xong r錳 ngi T﹜ H�  huy ng c� Nh蕋 Ph萴 阯g.",
    	"Ph秈 t� ch鴆 quy t� nhi襲 cao th� v� l﹎ kh玭g? Nh璶g � Ki誱 M玭 Quan t筰 h� ch� ph竧 hi謓 m蕐 t猲 l輓h qu蘮, kh玭g th蕐 cao th� n祇 h誸.",
    	"Trong th� ghi b鋘 Nh蕋 Ph萴 阯g t藀 k誸 � Ki誱 C竎 th鬰 o, c玭g vi謈 h� chuy猲 竚 s竧 tng l躰h, tr閙 c緋 v╪ th�.",
    	"в v穘 b鑙 n {Ki誱 C竎 th鬰 o} m閠 chuy課.",
        "<sex> nh�  � xem c� t輓 v藅 c馻 b鋘 ch髇g kh玭g."
	};
    TalkEx("task_32_01", szTalk);
end;

function task_32_01()
    DelItem(2,0,62,3);
    SetTask(TASK_XYTY, 33);
    CreateTrigger(0,525,KILL_XY_SD);
    Msg2Player("T譵 10 Nh蕋 Ph萴 b礽");
    TaskTip("T譵 10 Nh蕋 Ph萴 b礽");
    GivePlayerAward("Level_28", "hell", "trinket", "Level_30");
	GivePlayerExp(SkeyBJKouzhun,"jianmenduoying3")		--剑门危机3
end;

function task_33_00()
    local szTalk = {
        "Trong th� ghi b鋘 Nh蕋 Ph萴 阯g t藀 k誸 � Ki誱 C竎 th鬰 o, c玭g vi謈 h� chuy猲 竚 s竧 tng l躰h, tr閙 c緋 v╪ th�.<sex> nh b筰 b鋘 ch髇g l蕐 頲 t輓 v藅 s� c� l骳 h鱱 d鬾g."
    };
    TalkEx("task_33_01", szTalk);
end;

function task_33_01()
    if GetTrigger(KILL_XY_SD) == 0 then
        CreateTrigger(0,525,KILL_XY_SD);
    end;
end;

function task_34_00()
    local szTalk = {
        "<sex> v� r錳 �? C� thu 頲 g� kh玭g?",
    	"Kh玭g l祄 ti襫 b鑙 th蕋 v鋘! Зy l� Danh b礽 th祅h vi猲 c馻 ch髇g.",
    	"Kh� l緈! Ngi ti誴 t鬰 甶 Ki誱 M玭 Quan t譵 Th竎 B箃 K� xem h緉 c� ph秐 鴑g g� kh玭g?",
        "Tu﹏ l謓h."
    };
    local szNot = {
        "<sex> c� 甧m t輓 v藅 c馻 b鋘 ch髇g kh玭g?",
        "T筸 th阨 ch璦 ."
    };
    if GetItemCount(2,0,63) >= 10 then
        TalkEx("task_34_01", szTalk);
    else
        TalkEx("task_33_01", szNot);
    end;
end;

function task_34_01()
    RemoveTrigger(GetTrigger(KILL_XY_SD))
    DelItem(2,0,63,10);
    SetTask(TASK_XYTY, 35);
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyBJKouzhun,"xixiajianrui1")		--西夏尖锐1
end;

function task_35_00()
    local szTalk = {
        "Ngi n l祄 g� n鱝, ch糿g ph秈 b秓 ta t譵 M閰�",
    	"Th玦 甶! Ki誱 M玭 Quan b� ngi ta t藀 k輈h, ng tng ta kh玭g bi誸!",
    	"A! T猲 v� danh ti觰 t鑤 c騨g d竚 d箉 i ta h�?",
    	"L阨 c馻 i nh﹏ ngi qu猲 r錳 sao? Xem y l� g�!",
    	"L�...i nh﹏  sao, ti觰 nh﹏ kh玭g bi誸 xin th� t閕!",
    	"Th玦 甶! Ki誱 M玭 Quan b� ngi ngo礽 t藀 k輈h, ngi t輓h sao? Hay  ta ra tay?",
    	"Чi nh﹏ tha m筺g! Ti觰 nh﹏ s� cho ngi 甶襲 tra v� n祔, gi� i nh﹏ v� {Ki誱 C竎 th鬰 o} n鉯 gi髉 v韎 {Gia Lu藅 B� Nham} gia h筺 th猰 v礽 ng祔."
	};
	TalkEx("task_35_00_00", szTalk);
end;

function task_35_00_00()
    local szTalk = {
    	"[Kh玭g bi誸 Gia Lu藅 B� Nham c� lai l辌h nh� th� nao  ta th� h緉]",
    	"V� l�! T猲 c馻 i nh﹏ ngi 頲 ph衟 g鋓 sao?",
    	"Ti觰 nh﹏ bi誸 l鏸! Mong ti襫 b鑙 n鉯 gi髉 v礽 c﹗ trc {Gia Lu藅 Kim Cang} i nh﹏.",
    	"[Th� ra l� m閠 trong Th藀 i kim cang c馻 Nh蕋 ph萴 阯g 產ng l祄 c qu﹏ � Ki誱 C竎 th鬰 o]",
        "T筸 th阨 tha cho ngi, ng  x秠 ra chuy謓 n祔 n鱝 nh�!"
    };
    TalkEx("task_35_01", szTalk);
end;

function task_35_01()
    SetTask(TASK_XYTY, 36);
    Msg2Player("Цnh b筰 Gia Lu藅 B� Nham");
    TaskTip("Цnh b筰 Gia Lu藅 B� Nham");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyBJKouzhun,"xixiajianrui2")		--西夏尖锐2
end;

function task_37_00()
    local szTalk = {
        "Ta th蕐 kh� s綾 <sex> kh玭g 頲 t鑤, c� ph秈 b� ngi Nh蕋 Ph萴 阯g  thng?",
    	"T筰 h� kh玭g sao, nay n b竜 tin m鮪g cho ti襫 b鑙  h� 頲 Gia Lu藅 B� Nham c馻 Nh蕋 Ph萴 阯g, t筸 th阨 ch髇g kh玭g d竚 h祅h ng.",
    	"L� ta ph秈 ch骳 m鮪g <sex> m韎 ng v�  l藀 頲 c玭g l韓.",
    	"ng r錳! Tr猲 ngi Gia Lu藅 B� Nham c� chi誧 b譶h s�, v穘 b鑙 kh玭g bi誸 v藅 g� mu鑞 nh� ti襫 b鑙 xem.",
    	"[C玭g T玭 Th� xem qua chi誧 b譶h s鴀",
        "B猲 trong b譶h ch鴄 m閠 s� dc li謚, nh蕋 th阨 ta kh玭g bi誸 ch髇g l� g�, ngi th� n Л阯g M玭 h醝 чc Si xem."
    };
    TalkEx("task_37_01", szTalk);
end;

function task_37_01()
    SetTask(TASK_XYTY, 38);
    Msg2Player("дn Л阯g M玭 t譵 чc Si");
    TaskTip("дn Л阯g M玭 t譵 чc Si");
    GivePlayerAward("Level_30", "hell");
	GivePlayerExp(SkeyBJKouzhun,"shenmiduyao1")		--神秘毒药1
end;

function task_38_00()
    local szTalk = {
        "Ngi l� ai?",
    	"Зy c� ph秈 l� чc Si ti襫 b鑙? � y c� chi誧 b譶h s� ch鴄 dc li謚 mu鑞 nh� ti襫 b鑙 xem gi髉.",
    	"чc dc g� n鱝 y? Лa ta xem!",
    	"[чc Si xem ng鰅 xong li襫 l蕐 n髏 chai y l筰]",
    	"Зy l� Bi T� Thanh Phong, lo筰 c v� s綾 v� v� c馻 Nh蕋 Ph萴 阯g, ai tr髇g ph秈 trong 12 canh gi� kh玭g th� c� ng. Ta c� c竎h gi秈! H穣 v祇 Tr骳 Ty ng t譵 N� Ki誱 kh竎h l蕐 10 M� H錸 hng, t譵 th猰, 10 Ho祅g li猲, 5 ph莕 Nhi評 minh u."
    };
    TalkEx("task_38_00_00", szTalk);
end;

function task_38_00_00()
    local szTalk = {
    	"[чc Si m� b譶h ra h輙 m筺h m閠 c竔]",
    	"чc Si ti襫 b鑙!",
    	"�.",
        "[Xem ra h緉 ta b� 甶猲 r錳, mau gi髉 t譵 thu鑓 gi秈 th玦]"
    };
    TalkEx("task_38_01", szTalk);
end;

function task_38_01()
    SetTask(TASK_XYTY, 39);
    DelItem(2,0,64,1);
    CreateTrigger(0,526,KILL_XY_NJX);
    Msg2Player("T譵 cho чc Si 10 M� h錸 hng, 10 Ho祅g li猲, 5 Nhi評 minh u  ch� thu鑓 gi秈");
    TaskTip("T譵 cho чc Si 10 M� h錸 hng, 10 Ho祅g li猲, 5 Nhi評 minh u  ch� thu鑓 gi秈");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyBJKouzhun,"shenmiduyao2")		--神秘毒药2
end;

function task_39_00()
    local szTalk = {
        "�.",
        "[Xem ra h緉 ta b� 甶猲 r錳, mau gi髉 t譵 thu鑓 gi秈 th玦]"
    };
    TalkEx("task_39_01", szTalk);
end;

function task_39_01()
    if GetTrigger(KILL_XY_NJX) == 0 then
        CreateTrigger(0,526,KILL_XY_NJX);
    end;
end;

function task_40_00()
    local szTalk = {
        "�.",
    	"чc Si ti襫 b鑙, thu鑓 gi秈 y!",
    	"[чc Si d飊g s� thu鑓 b筺 mang n]",
        "Kh魠Kh�! Bi T� Thanh Phong qu� nhi猲 l頸 h筰 tay ch﹏ ta ph秈 qua 12 canh gi� m韎 c� th� c� ng. L莕 n祔 l穙 phu s� � nh gi� th蕄 lo筰 c dc n祔 hy v鋘g s� t譵 ra phng thu鑓 gi秈 c. Ngi th� n Nh蕋 Ph萴 阯g xem ngi b� c c� mang thu鑓 gi秈 kh玭g?"
    };
    local szNot = {
        "�.",
    	"чc Si ti襫 b鑙, thu鑓 gi秈 y!",
    	"[чc Si d飊g s� thu鑓 b筺 mang n]",
    	"�.",
    	"Xem ra lng thu鑓 gi秈 kh玭g ."
    };
    if GetItemCount(2,0,65) >= 10 and GetItemCount(1,2,3) >= 10 and GetItemCount(1,3,11) >= 5 then
        TalkEx("task_40_01", szTalk);
    else
        TalkEx("task_39_01", szNot);
    end;
end;

function task_40_01()
    SetTask(TASK_XYTY, 41);
    DelItem(2,0,65,10);
    DelItem(1,2,3,10);
    DelItem(1,3,11,5);
    RemoveTrigger(GetTrigger(KILL_XY_NJX));
    CreateTrigger(0,525,KILL_XY_SD);
    Msg2Player("L蕐 頲 5 ph莕 thu鑓 gi秈 t� Th輈h kh竎h Nh蕋 Ph萴 阯g");
    TaskTip("L蕐 頲 5 ph莕 thu鑓 gi秈 t� Th輈h kh竎h Nh蕋 Ph萴 阯g");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyBJKouzhun,"shenmiduyao3")		--神秘毒药3
end;

function task_41_00()
    local szTalk = {
        "Ngi b� c nh蕋 nh mang theo thu鑓 gi秈, ngi th� n Nh蕋 Ph萴 阯g m閠 chuy課 xem!"
    };
    TalkEx("task_41_01", szTalk);
end;

function task_41_01()
    if GetTrigger(KILL_XY_SD) == 0 then
        CreateTrigger(0,525,KILL_XY_SD);
    end;
end;

function task_42_00()
    local szTalk = {
        "<sex> t譵 頲 thu鑓 gi秈 ch璦?",
    	"чc Si ti襫 b鑙 n鉯 lo筰 c {Bi T� Thanh Phong} v� s綾 v� v�, ngi n祇 tr髇g ph秈 12 canh gi� sau m韎 c� ng 頲. Ngay c� ti襫 b鑙 c騨g kh玭g c� thu鑓 gi秈, t筰 h� ch� c� th� n Nh蕋 Ph萴 阯g nh Th輈h kh竎h mang thu鑓 gi秈 v�.",
    	"Lo筰 c l頸 h筰 nh� v藋, n誹 ngi T﹜ H� d飊g ch髇g l祄 v� kh� th� th藅 nguy hi觤, xem ra ngi ph秈 mau ch鉵g t譵 ra thu鑓 gi秈.",
        "N誹 d飊g c l祄 v� kh� th� c莕 ph秈 t輈h tr� nhi襲! в t筰 h� n {Ki誱 C竎 th鬰 o} ph� kho t輈h tr� c馻 ch髇g."
    };
    local szNot = {
        "<sex> t譵 頲 thu鑓 gi秈 ch璦?",
        "{Bi T� Thanh Phong} l� lo筰 c b� truy襫 c馻 Nh蕋 Ph萴 阯g, ngay c� чc Si ti襫 b鑙 c騨g kh玭g th� gi秈, t筰 h� ch� c� th� n Nh蕋 Ph萴 阯g nh Th輈h kh竎h mang thu鑓 gi秈 v�."
    };
    if GetItemCount(2,0,66) >= 5 then
        TalkEx("task_42_01", szTalk);
    else
        TalkEx("task_41_01", szNot);
    end;
end;

function task_42_01()
    RemoveTrigger(GetTrigger(KILL_XY_SD));
    CreateTrigger(0,527,KILL_XY_DYX);
    SetTask(TASK_XYTY, 43);
    DelItem(2,0,66,5);
    Msg2Player("Ph� h駓 5 rng c dc � Ki誱 C竎 th鬰 o");
    TaskTip("Ph� h駓 5 rng c dc � Ki誱 C竎 th鬰 o");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyBJKouzhun,"shenmiduyao4")		--神秘毒药4
end;

function task_43_00()
    local szTalk = {
        "<sex> n Ki誱 C竎 th鬰 o t譵 n琲 c蕋 gi蕌 c dc ph� h駓 ch髇g!"
    };
    TalkEx("task_43_01", szTalk);
end;

function task_43_01()
    if GetTrigger(KILL_XY_DYX) == 0 then
        CreateTrigger(0,527,KILL_XY_DYX);
    end;
end;

function task_44_00()
    local szTalk = {
        "<sex>  h鉧 gi秈 頲 cu閏 t蕁 c玭g c馻 T﹜ H�, Trng Ca M玭 ch髇g ta kh玭g bi誸 c秏 k輈h ra sao.",
        "Ti猲 sinh ng v閕 vui m鮪g, chuy謓 n祔 kh玭g n gi秐 y l� v藅 t譵 頲 trong thng kh� T﹜ H�.",
        "[Mang c玭g v╪ Li猽 Qu鑓 giao cho C玭g T玭 Th璢",
        "ng nh� <sex> d� 畂竛 cu閏 t蕁 c玭g l莕 n祔 do nc Li猽 khi猽 kh輈h, h� d飊g th� 畂筺 khuy猲 ph鬰 T﹜ H� bao quanh Ki誱 C竎 v韎 �  c玭g nh th祅h Tng Dng. <sex> gi髉 ta n Ph鬰 Ng璾 s琻 d� la 頲 kh玭g?",
        "V穘 b鑙 甶 ngay!"
    };
    TalkEx("task_44_01", szTalk);
end;

function task_44_01()
    SetTask(TASK_XYTY, 45);
    DelItem(2,0,67,1);
    Msg2Player("дn Ph鬰 Ng璾 s琻 d� la tin t鴆");
    TaskTip("дn Ph鬰 Ng璾 s琻 d� la tin t鴆");
    GivePlayerAward("Level_30", "easy", "legs", "Level_33");
	GivePlayerExp(SkeyBJKouzhun,"funiushanzhanluan1")		--伏牛山战乱1
end;

function task_45_00()
    local szTalk = {
        "Xin tha m筺g!",
    	"Ngi l� ai? Sao th蕐 ta l筰 la to竛g l猲?",
    	"Kh玭g ph秈 ngi nh truy gi誸 ta �?",
    	"Ngi v� ta kh玭g th� kh玭g o竛, gi誸 ngi l祄 g�?",
    	"<sex>! Ti觰 nh﹏ v鑞 l� n玭g d﹏ do thu ho筩h ko t鑤 n猲 c飊g m閠 s� huynh  l猲 Ph鬰 Ng璾 s琻 l祄 gi芻 c�. C玭g vi謈 ch� gi髉 qu衪 d鋘 n祇 ng� c� m qu﹏ s� nc Li猽 藀 n, c竎 anh em kh竎  ch誸 trong tr薾 lo筺 chi課  ri猲g ti觰 nh﹏ may m緉 tho竧 ch誸."
	};
	TalkEx("task_45_00_00", szTalk);
end;

function task_45_00_00()
    local szTalk = {
    	"Qu� nhi猲 Li猽 binh  n. Ngic� th� n鉯 s� v� t譶h h譶h � Ph鬰 Ng璾 s琻 頲 kh玭g?",
    	"Ch� c莕 <sex> gi髉 ti觰 nh﹏ gi誸 m蕐 t猲 Li猽 binh tr� th� cho c竎 huynh  ta s� kh玭g gi蕌 di誱 b蕋 c� chuy謓 g�.",
        "Л頲! в ta gi髉 m閠 tay!"
    };
    TalkEx("task_45_01", szTalk);
end;

function task_45_01()
    SetTask(TASK_XYTY, 46);
    CreateTrigger(0,528,KILL_XY_LDB);
    CreateTrigger(0,529,KILL_XY_LQB);
    CreateTrigger(0,530,KILL_XY_LNB);
    SetTask(TASK_XY_TEMP, 0);
    SetTask(TASK_XY_TEMP1, 0);
    SetTask(TASK_XY_TEMP2, 0);
    Msg2Player("Gi誸 15 Li猽 產o binh, 15 Li猽 thng qu﹏, 15 Li猽 Ti詎 binh");
    TaskTip("Gi誸 15 Li猽 產o binh, 15 Li猽 thng qu﹏, 15 Li猽 Ti詎 binh");
    GivePlayerAward("Level_32", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushanzhanluan2")		--伏牛山战乱2
end;

function task_46_00()
    local szTalk = {
        "<sex> gi髉 ti觰 nh﹏ gi誸 m蕐 t猲 Li猽 binh tr� th� cho c竎 huynh  ta s� kh玭g gi蕌 di誱 b蕋 c� chuy謓 g�."
    };
    TalkEx("task_46_01", szTalk);
end;

function task_46_01()
    if GetTrigger(KILL_XY_LDB) == 0 and GetTask(TASK_XY_TEMP) == 0 then
        CreateTrigger(0,528,KILL_XY_LDB);
    end;
    if GetTrigger(KILL_XY_LQB) == 0 and GetTask(TASK_XY_TEMP1) == 0 then
        CreateTrigger(0,529,KILL_XY_LQB);
    end;
    if GetTrigger(KILL_XY_LNB) == 0 and GetTask(TASK_XY_TEMP2) == 0 then
        CreateTrigger(0,530,KILL_XY_LNB);
    end;
end;

function task_49_00()
    local szTalk = {
    	"<sex> gi誸 頲 t猲 n祇 ch璦?",
    	"Ta  gi髉 ngi gi誸 m蕐 t猲 Li猽 binh.",
    	" t� <sex>  gi髉 ! Xin h醝 <sex>  g苝 qua m cao th� T� t╪g ch璦?",
    	"T� t╪g n祇?",
    	"Xem c竎h ╪ m芻 c馻 h� gi鑞g T� t╪g c馻 Ho祅g gi竜, c� l� t� b猲 T﹜ H� qua. V鮝 n穣 h� ni謒 ch� l猲 ngi m蕐 huynh . <sex> ra tay c鴘 h� 頲 kh玭g?",
        "T╪g nh﹏ T﹜ H� n qu蕐 r鑙 n鱝 �? � y c竎h {V� ng} kh玭g xa  ta t譵 {T� H筩 Ch﹏ Nh﹏} xem c� k� s竎h g� kh玭g?"
    };
    TalkEx("task_49_01", szTalk);
end;

function task_49_01()
    SetTask(TASK_XYTY, 50);
    Msg2Player("T譵 T� H筩 Ch﹏ Nh﹏ ngh� c竎h");
    TaskTip("T譵 T� H筩 Ch﹏ Nh﹏ ngh� c竎h");
    GivePlayerAward("Level_32", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushanzhanluan3")		--伏牛山战乱3
end;

function task_50_00()
    local szTalk = {
        "Sao ngi u s莡 v藋?",
    	"Kh玭g gi蕌 ch﹏ nh﹏ Li猽 binh 產ng t藀 k誸 � Ph鬰 Ng璾 s琻 �  c玭g nh Ki誱 M玭 Quan 畂箃 l蕐 Tng Dng, b猲  c� nhi襲 T� t╪g tr� gi髉, h� d飊g b颽 ch� h筰 ngi, t筰 h� n xem ngi c� c竎h ph� gi秈 kh玭g?",
        "Thi猲 Nh穘 Chu m祏 tr緉g tng 鴑g v韎 T鴆 ph竝, Thi猲 Nh穘 Chu m祏 甧n tng 鴑g v韎 Chu ph竝, Thi猲 Nh穘 Chu m祏 v祅g tng 鴑g v韎 T╪g ph竝, Thi猲 Nh穘 Chu m祏  tng 鴑g v韎 Ho礽 ph竝, T╪g nh﹏ T﹜ H� d飊g Chu ph竝 t蕋 nhi猲 h� s� mang theo Thi猲 Nh穘 Chu, ngi t譵 m閠 輙 v� nh� thu th藀 th猰 H綾 Khuy觧 Linh huy誸, ta s� c� c竎h."
    };
    TalkEx("task_50_01", szTalk);
end;

function task_50_01()
    SetTask(TASK_XYTY, 51);
    CreateTrigger(0,531,KILL_XY_XS);
    Msg2Player("T譵 10 Thi猲 Nh穘 Chu, 5 H綾 Khuy觧 Linh huy誸");
    TaskTip("T譵 10 Thi猲 Nh穘 Chu, 5 H綾 Khuy觧 Linh huy誸");
    GivePlayerAward("Level_32", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushanzhanluan4")		--伏牛山战乱4
end;

function task_51_00()
    local szTalk = {
        "Thi猲 Nh穘 Chu m祏 tr緉g tng 鴑g v韎 T鴆 ph竝, Thi猲 Nh穘 Chu m祏 甧n tng 鴑g v韎 Chu ph竝, Thi猲 Nh穘 Chu m祏 v祅g tng 鴑g v韎 T╪g ph竝, Thi猲 Nh穘 Chu m祏  tng 鴑g v韎 Ho礽 ph竝, T╪g nh﹏ T﹜ H� d飊g Chu ph竝 t蕋 nhi猲 h� s� mang theo Thi猲 Nh穘 Chu, ngi t譵 m閠 輙 v� nh� thu th藀 th猰 H綾 Khuy觧 Linh huy誸, ta s� c� c竎h."
    }
    TalkEx("task_51_01", szTalk);
end;

function task_51_01()
    if GetTrigger(KILL_XY_XS) == 0 then
        CreateTrigger(0,531,KILL_XY_XS);
    end;
end;

function task_52_00()
    local szTalk = {
        "T譵 頲 kh玭g?",
    	"Ti襫 b鑙 xem qua!",
    	"Ngi i ta m閠 l竧.",
    	"[T� H筩 Ch﹏ Nh﹏ c莔 v藅 ph萴 trong tay ni謒 ch骫",
    	"Зy l� Thi猲 Linh Ph� T� Chu, ngi 甧m cho h緉 u鑞g l� c� th� gi秈 tr� t� ma.",
        " t� ch﹏ nh﹏  t筰 h� mang v� cho h緉."
    };
    local szNot = {
        "T譵 頲 kh玭g?",
    	"V穘 b鑙 c莕 ch髏 th阨 gian!"
    };
    if GetItemCount(2,0,68) >= 10 and GetItemCount(2,2,33) >= 5 then
        TalkEx("task_52_01", szTalk);
    else
        TalkEx("task_51_01",szNot);
    end;
end;

function task_52_01()
    RemoveTrigger(GetTrigger(KILL_XY_XS));
    DelItem(2,0,68,10);
    DelItem(2,2,33,5);
    AddItem(2,0,211,1);   --天灵破邪珠
    SetTask(TASK_XYTY, 53);
    Msg2Player("m Thi猲 Linh Ph� T� Ch﹗ cho L筩 Ph竎h S琻 t芻");
    TaskTip("m Thi猲 Linh Ph� T� Ch﹗ cho L筩 Ph竎h S琻 t芻");
    GivePlayerAward("Level_32", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushanzhanluan5")		--伏牛山战乱5
end;

function task_53_00()
    local szTalk = {
        "<sex> v� r錳 �? Huynh  c馻 ta xem nh� 頲 c鴘 r錳.",
    	"Ti猲 n y mau a cho huynh  ngi.",
    	"[L筩 Ph竎h S琻 t芻 u鑞g thu鑓]",
    	"Чi 琻 i c c馻 <sex> kh玭g bi誸 l蕐 g� n p, l骳 n穣 ti觰 nh﹏ nghe m T� t╪g c� nh綾 b祔 b� tr薾 ph竝 trong Ki誱 M玭 Quan, i nh﹏ nh� th薾 tr鋘g! Зy c� t蕀 b秐  Ph鬰 Ng璾 s琻 v� t譶h h譶h binh l鵦 qu﹏ Li猽 t苙g i nh﹏ xem nh� n 琻 c鴘 m筺g.",
        " t� ngi! H裯 ng祔 g苝 l筰!"
    };
    TalkEx("task_53_01", szTalk);
end;

function task_53_01()
    SetTask(TASK_XYTY, 54);
    DelItem(2,0,211,1);   --天灵破邪珠
    AddItem(2,0,69,1);
    Msg2Player("Mang b秐  cho C玭g T玭 Th�");
    TaskTip("Mang b秐  cho C玭g T玭 Th�");
    GivePlayerAward("Level_32", "hard", "trinket", "Level_35");
	GivePlayerExp(SkeyBJKouzhun,"bingfenlianglu")		--兵分两路
end;

function task_54_00()
    local szTalk = {
        "<sex> d� la 頲 g� kh玭g?",
    	"Binh l鵦 qu﹏ Li猽 u ph﹏ b� tr猲 t蕀 b秐 , ti觧 b鑙 xem qua! Ngo礽 ra c遪 m閠 s� T� t╪g d飊g tr薾 ph竝 �  c玭g nh Ki誱 M玭 Quan.",
    	"[C玭g T玭 Th� xem qua b秐 ]",
    	"Xem ra nc Li猽 v� T﹜ H�  chu萵 b� s絥 nh璶g trc gi� t� kh玭g th� th緉g ch竛h, theo � ta n誹  m鑙 quan h� h� v鱪g ch綾 th� kh� m� c玭g ph�.",
    	"Ta ph秈 l祄 sao y?",
    	"Ch� c遪 c竎h chia binh hai 阯g c飊g ti課 nh. Chuy謓 n祔 c莕 ph秈 b祅 b筩 k�! Ngi mau t譵 T鎛g binh Tng Dng thng thuy誸 ti課 nh doanh tr筰 Li猽 qu﹏ trc. C遪 v� tr薾 ph竝 ph秈 nh� T� H筩 Ch﹏ Nh﹏ ch� c竎h ph� gi秈. <sex> xin h穣 l藀 t鴆 l猲 阯g!",
        "T筰 h� 甶 ngay!"
    };
    TalkEx("task_54_01", szTalk);
end;

function task_54_01()
    DelItem(2,0,69,1);
    SetTask(TASK_XY_ONE, 1);    --襄阳任务分支一，代表找郡守
    SetTask(TASK_XY_TWO, 1);    --襄阳任务分支二，代表找紫鹤真人
    SetTask(TASK_XYTY, 55);
end;

-------------------------------襄阳任务分支任务--------------------

function two_01_00()
    local szTalk = {
        "Ngi ph� gi秈 b颽 ch� ch璦?",
        "May nh� ti襫 b鑙 ch� gi竜, b颽 ch�  h鉧 gi秈 nh璶g T� t╪g T﹜ H� l筰 d飊g tr薾 ph竝 c玭g nh Ki誱 M玭 Quan, xin ti襫 b鑙 ngh� c竎h.",
        "H鮩! B鋘 ch髇g d竚 d飊g ph竝 thu藅  s竧 sinh linh, ngi mau gi髉 ta t譵 10 Huy襫 H筩 linh huy誸, 10 B輈h Huy誸 sa ta s� c� c竎h ph� gi秈."
    };
    TalkEx("two_01_01", szTalk);
end;

function two_01_01()
    SetTask(TASK_XY_TWO, 2);
    Msg2Player("T譵 10 Huy襫 H筩 Linh huy誸, 10 B輈h Huy誸 sa cho T� H筩 Ch﹏ Nh﹏");
    TaskTip("T譵 10 Huy襫 H筩 Linh huy誸, 10 B輈h Huy誸 sa cho T� H筩 Ch﹏ Nh﹏");
    GivePlayerAward("Level_36", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushandoufa1")		--伏牛山斗法1
end;

function two_02_00()
    local szTalk = {
        "T譵 頲 r錳 �?",
        "Х chu萵 b� !",
        "[T� H筩 Ch﹏ Nh﹏ l蕐 m閠 chi誧 b譶h b籲g ng b� thu鑓 v祇 trong ni謒 ch骫",
        "Ta  chu萵 b� Ph� Ch� th駓 ch� c莕 ngi d飊g ch髇g ti v祇 ngi ch� tr� tr薾 ph竝 l� 頲.",
        "C� c竎h h鉧 gi秈 r錳!",
        "Tr薾 ph竝 b� tr� xong s� c� V� t╪g h� gi�, ngi ph秈 h誸 s鴆 c萵 th薾!"
    };
    local szNot = {
        "T譵 頲 r錳 �?",
        "V穘 b鑙 v蒼 ch璦 t譵 !"
    };
    if GetItemCount(2,2,35) >= 10 and GetItemCount(2,2,32) >= 10 then
        TalkEx("two_02_01", szTalk);
    else
        TalkEx("", szNot);
    end;
end;

function two_02_01()
    SetTask(TASK_XY_TWO, 3);
    AddItem(2,0,210,3);
    DelItem(2,2,35,10);
    DelItem(2,2,32,10);
    --CreateTrigger(0,532,KILL_XY_ZS);
    Msg2Player("Mang Ph� Ch� th駓 ti猽 di謙 3 Ph竝 S� T﹜ H�");
    TaskTip("Mang Ph� Ch� th駓 ti猽 di謙 3 Ph竝 S� T﹜ H�");
    GivePlayerAward("Level_36", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushandoufa2")		--伏牛山斗法2
end;

function two_03_00()
	if GetTask(TASK_XY_TWO_ONE) < 0 or GetTask(TASK_XY_TWO_ONE) > 3 then
		SetTask(TASK_XY_TWO_ONE, 0)
	end
	
    local szTalk = {
        "Xem kh� s綾 <sex> kh玭g 頲 t鑤, c� ph秈 b� Ph竝 S� T﹜ H�  thng?",
        "T筰 h� kh玭g sao nh璶g ph秈 c莕 th猰 Ph� Ch� th駓 m韎 c� th� h鉧 gi秈 tr薾 ph竝.",
        "� y c遪 m蕐 b譶h, ngi c莔 l蕐 甶!"
    };
    local szNormal = {
        "<sex> ch� c莕 nh ngi ch� tr� tr薾 ph竝 d飊g Ph� Ch� th駓 ti l猲 ngi h� l� 頲."
    };
    if GetItemCount(2,0,210) < 3 then
        TalkEx("two_03_01", szTalk);
    else
        TalkEx("", szNormal);
    end;
end;

function two_03_01()
    AddItem(2,0,210,3);
end;
-------------------------------------------襄阳主线------------------------------------

function task_56_00()
    local szTalk = {
        "<sex>  y lui 頲 binh l輓h nc Li猽 v� T﹜ H� ng l� ph骳 c馻 mu玭 d﹏.",
        "Ti猲 sinh qu� l阨, tr� gian di謙 b筼 l� b鎛 ph薾 c馻 t筰 h�.",
        "Kh� l緈! <sex> qu� c� kh� ph竎h hi謕 kh竎h, m� y r蕋 mu鑞 k誸 giao m閠 ngi nh� v藋. <sex> c遪 ph竧 hi謓 g� th猰 � Ph鬰 Ng璾 s琻 kh玭g?",
        "T筰 h� ph竧 hi謓 m藅 h祄 b竜 cho ti襫 tuy課 {Nh蕋 Ph萴 阯g} v� {Thi猲  gi竜}, b鋘 h� v� chuy謓 {m秐h S琻 H� X� T綾} n Ph鬰 Ng璾 s琻.",
        "N誹  v藋 <sex> ng � n Ph鬰 Ng璾 s琻 d� la th猰 m閠 l莕 kh玭g? Kh玭g ch鮪g bi誸 頲 tung t輈h c馻 b秐  S琻 H� X� T綾."
    };
    TalkEx("task_56_01", szTalk);
end;

function task_56_01()
    DelItem(2,0,71,1);
    DelItem(2,0,72,1);
    SetTask(TASK_XYTY, 57);
    Msg2Player("дn Ph鬰 Ng璾 s琻 t譵 L筩 Ph竎h S琻 t芻 h醝 th╩");
    TaskTip("дn Ph鬰 Ng璾 s琻 t譵 L筩 Ph竎h S琻 t芻 h醝 th╩");
    GivePlayerAward("Level_32", "hell", "trinket", "Level_40");
    GivePlayerAward("Level_36", "hell", "legs", "Level_41");
	GivePlayerExp(SkeyBJKouzhun,"hutunshanhe11")		--龙虎吞山河11
	GivePlayerExp(SkeyBJKouzhun,"hutunshanhe12")		--龙虎吞山河12
end;

function task_57_00()
    local szTalk = {
        " nh﹏ t譵 ta c� chuy謓 g�?",
        "Ngi c� nghe qua m秐h b秐  S琻 H� X� T綾 ch璦?",
        "(Suy ngh�), nh� ra r錳  l� m鉵 b秓 b鑙 c馻 tr筰 ch� ta. T� l骳 c� n� 玭g ta t� th竔  n鉵g n秠 v韎 c竎 huynh , thng la m緉g nh p. H琻 n鱝 b秐  xu蕋 hi謓 Li猽 binh v� T╪g nh﹏ T﹜ H� c騨g k衞 n, xem ra y kh玭g ph秈 v藅 c竧 tng.",
        "Tr筰 ch� c馻 ngi hi謓 gi� � u?",
        "Nghe n鉯 tr筰 ch� 產ng tr鑞 trong Long H� ng, i nh﹏ th� n  t譵 xem!"
    };
    TalkEx("task_57_01", szTalk);
end;

function task_57_01()
    SetTask(TASK_XYTY, 58);
    GivePlayerAward("Level_40", "easy");
	GivePlayerExp(SkeyBJKouzhun,"hutunshanhe2")		--龙虎吞山河2
end;

function task_59_00()
    local szTalk = {
        "<sex> t譵 ra tung t輈h m秐h S琻 H� X� T綾 ch璦?",
        "M秐h S琻 H� X� T綾 ban u do u l躰h S琻 t芻 n緈 gi�. T筰 h� t譵 頲 tr猲 ngi h緉 b鴆 m藅 h祄 c馻 {Lng S琻}!",
        "[C玭g T玭 Th� xem qua b鴆 m藅 h祄]",
        --"公孙书：奇怪了，从这信上看，似乎是梁山的{宋江}请他来寻找山河社稷图碎片。我素闻这宋江体恤百姓、仁义为先，是个非常正直的人。而水泊梁山八百里，兵多将勇，物产也颇为丰厚。他为何也要贪图这山河社稷图呢？我看<sex>不妨找人打探打探消息，如果有何进展，还请来通知老夫。"
        "Ta t筸 th阨 gi� l筰 b鴆 th�. <sex> c� g緉g th猰."
    };
    TalkEx("task_59_01", szTalk);
end;

function task_59_01()
    --SetTask(TASK_XYTY, 60);
    SetTask(TASK_XYTY, 61); --暂时消除任务面板，没有后续任务
    DelItem(2,0,73,1);
    GivePlayerAward("Level_40", "hell", "chest", "Level_45");
	GivePlayerExp(SkeyBJKouzhun,"hutunshanhe3")		--龙虎吞山河3
end;

function task_61_00()
    local szTalk = {
        "<sex> c� g緉g th猰."
    };
    TalkEx("", szTalk);
end;
