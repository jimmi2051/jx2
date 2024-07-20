
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 汴京任务主体脚本
-- Edited by lizhi
-- 2005-8-8 10:27
-- ======================================================

-- 剧情任务文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

function task_000_00()

local strMain = {
	"Kh玭g 頲厖L祄 sao b﹜ gi�?",
	"Ti襫 b鑙 c� ph秈 Kh蕌 Chu萵 i nh﹏ kh玭g? Tri謚 Di猲 Ni猲 v� D� T萿 nh� ta mang b鴆 th� t韎, m阨 ti襫 b鑙 xem qua!",
	"Лa ta xem n祇!",
	"[Kh蕌 Chu萵 c b鴆 th璢",
	"<sex> n th藅 ng l骳, ta c騨g kh玭g gi蕌! Hi謓 Li猽 binh 產ng ti誴 c薾 bi猲 gi韎, qu﹏ t譶h kh萵 c蕄 t� Nh筺 M玭 quan, h琻 n鱝 g莕 y Bi謓 Kinh l筰 x秠 ra chuy謓�",
	"Chuy謓 n祔 v鑞 do quan sai ph� tr竎h! Nh璶g nh﹏ l鵦 產 s� b� 甶襲 甶 n琲 kh竎, hi謓 ch� c遪 l筰 m閠 s� gi� nua y誹 韙. Ta th蕐 <sex> v� c玭g phi ph祄, nh蕋 nh kh玭g t� ch鑙 gi髉 l穙 phu 甶 gi秈 v﹜!",
	"Ti襫 b鑙 c� d苙 d�!",
	"T鑤 qu�! N鉯 chuy謓 v韎 <sex> th藅 s秐g kho竔! Gi� phi襫 <sex> n Thi猲 Ba Dng ph� g苝 Xa Th竔 Qu﹏, b� 蕐 產ng c� chuy謓 b鵦 m譶h!",
}

TalkEx("task_000_01", strMain);

end;


function task_000_01()
    DelItem(2,0,49,1);
	Msg2Player("Kh蕌 Chu萵 b秓 b筺 n Thi猲 Ba Dng ph� t譵 Xa Th竔 Qu﹏");
	TaskTip("Kh蕌 Chu萵 b秓 b筺 n Thi猲 Ba Dng ph� t譵 Xa Th竔 Qu﹏");
	SetTask(TASK_BJ_ID, 1);
end;


function task_001_00()

    local strMain = {
        "H�! Di ch﹏ thi猲 t� m� ch髇g d竚 ng玭g cu錸g v藋 �!",
    	"B萴 th竔 qu﹏ t筰 h� 頲 Kh蕌 Chu萵 i nh﹏ ph竔 n ch� ngi sai b秓!",
    	"Th� ra <sex> l� ngi c馻 Kh蕌 Chu萵 ph竔 n. Bi謓 Kinh d筼 n祔 kh玭g y猲 鎛, ta 甶襲 tra 頲 l� do m閠 m L璾 manh g﹜ ra, hi謓 ngi trong ph� u ra tr薾 gi誸 gi芻, mong <sex> gi髉 ta tr鮪g tr� b鋘 ch髇g!",
    	"V藋 n u m韎 t譵 頲 m蕐 t猲 L璾 manh ?",
    	"Цm l璾 manh thng xu蕋 hi謓 � ph� ng Bi謓 Kinh, T﹜ Bi謓 Kinh, Nam Bi謓 Kinh. N誹 c� th� <sex> gi髉 ta l蕐 10 b譶h Thi猽 t鰑 tr猲 ngi ch髇g 頲 kh玭g!"
    };
    
    TalkEx("task_001_01", strMain);

end;


function task_001_01()
	Msg2Player("Xa Th竔 Qu﹏ b秓 b筺 tr鮪g tr� 20 t猲 L璾 manh v� t譵 10 b譶h Thi猽 t鰑");
	TaskTip("Xa Th竔 Qu﹏ b秓 b筺 tr鮪g tr� 20 t猲 L璾 manh v� t譵 10 b譶h Thi猽 t鰑");
	CreateTrigger(0, 200, KILL_BJ_LM);  --杀死20个流氓
	SetTask(TASK_BJ_ID, 2);
end;

function task_002_00()
    Talk(1,"","Ngi gi髉 ta tr鮪g tr� 20 t猲 l璾 manh v� 甧m 10 b譶h Thi猽 T鰑 v� y!");
    if GetTrigger(KILL_BJ_LM) == 0 then
        CreateTrigger(0, 200, KILL_BJ_LM);
    end;
end;

function task_003_00()

    local strMain = {
    	"Xem ra ta ph竔 ch th﹏ ra tay m韎 頲!",
    	"B萴 Th竔 qu﹏! T筰 h�  tr鮪g tr� m L璾 manh v� mang Thi猽 t鰑 v� y!",
    	"Nhanh v藋? <sex> qu� nhi猲 v� c玭g cao cng! N誹 ngi c馻 Thi猲 Ba Dng ph� � y th� m C玭  kh玭g d竚 l閚g h祅h.",
    	"C玭 ? C� ngi kh竎 g﹜ s� n鱝 sao?",
    	"Kh玭g gi蕌 <sex> v鮝 l骳 n穣 qu﹏ s� n b竜 ngo礽 th祅h c� m閠 m C玭  lai l辌h kh玭g r� 產ng g﹜ s�, ta ph竔 m閠 s� gia 甶nh n  ng╪ c秐 kh玭g ng� b� ch髇g nh cho tr鋘g thng.",
    	"Ta th蕐 m蕐 t猲 C玭  n祔 th藅 kh玭g n gi秐. <sex> gi髉 ta n  xem th藅 h� th� n祇 頲 kh玭g?",
    };


	if GetItemCount(2, 1, 12) >= 10 then
		TalkEx("task_004_00", strMain);
	else
		Talk(1,"","Ngi gi髉 ta tr鮪g tr� 20 t猲 l璾 manh v� 甧m 10 b譶h Thi猽 T鰑 v� y!");
	end;

end;


function task_004_00()
	Msg2Player("Xa Th竔 Qu﹏ b秓 b筺 tr鮪g tr� 10 t猲 C玭 ");
	TaskTip("Xa Th竔 Qu﹏ b秓 b筺 tr鮪g tr� 10 t猲 C玭 ");
	
	GivePlayerAward("Level_10", "hell");    	--奖励
	GivePlayerExp(SkeyBJShuxin,"liumang")		--流氓经验奖励
	-- 删除 10 个烧酒
	DelItem(2, 1, 12, 10);
	
	CreateTrigger(0, 198, KILL_BJ_WL);  --杀死10个无赖
	SetTask(TASK_BJ_ID, 4);
end;

function task_004_01()
    Talk(1,"","Mau 甶 tr鮪g ph箃 10 t猲 C玭 !");
    if GetTrigger(KILL_BJ_WL) == 0 then
        CreateTrigger(0, 198, KILL_BJ_WL);
    end;
end;

function task_005_00()
    local strMain = {
    	"V� r錳 �! <sex>  thu th藀 頲 tin t鴆 g� r錳?",
    	"Цm C玭  n祔 qu� nhi猲 v� ngh� cao cng!",
    	"Ch綾 ch緉 sau l璶g ch髇g c� ngi ng ch� 甶觤. <sex> 甶 b総 1 v礽 t猲 C玭   v� 甶襲 tra th� xem sao!",
    	"Chuy謓 nh� th玦! Xin i tin vui c馻 t筰 h�!",
    };
    TalkEx("task_005_01", strMain);
end;


function task_005_01()
	
	GivePlayerAward("Level_10", "easy");    	--奖励
	GivePlayerExp(SkeyBJShuxin,"wulai1")		--无赖1
	Msg2Player("Xa Th竔 Qu﹏ sai b筺 甶 b総 5 t猲 C玭  v�  甶襲 tra");
	TaskTip("Xa Th竔 Qu﹏ sai b筺 甶 b総 5 t猲 C玭  v�  甶襲 tra");
	CreateTrigger(0, 199, KILL_BJ_WL);
	SetTask(TASK_BJ_ID, 6);
end;

function task_006_00()

    local strMain = {
        "V� r錳 �? 襲 tra 頲 g� r錳?",
        "ng nh� ngi d� 畂竛. B鋘 n祔 b� 1 ngi t猲 l� {Ti猽 H祅} x骾 gi鬰. Ch髇g v鑞 l� du d﹏ ngo礽 quan 秈! H莥! C騨g ch� v� 2 ch� Ph� qu� m� th玦!",
        "Nghe n鉯 t猲 Ti猽 H祅 n祔 l� ngi Li猽 qu鑓. L莕 n祔 may nh� c� <sex>, h鮩�.",
        "L穙 Th竔 qu﹏! T筰 h� c遪 chuy謓 n祔 mu鑞 h醝 ngi!",
        "L� chuy謓 g�?",
        "T筰 h� nghe 1 t猲 C玭  n鉯: {Ti猽 H祅} 產ng mu鑞 t譵 1 ngi t猲 {B竎h Th秓 g}! Th竔 Qu﹏ c� nghe qua ngi n祔 ch璦?",
        "B竎h Th秓 g? Ngi n祔 l� 1 th莕 y � Bi謓 Kinh. Kh玭g bi誸 t猲 Ti猽 H祅 kia t譵 玭g ta  l祄 g�? Ngi h穣 mau n H筺h Hoa th玭  b秓 v� cho B竎h Th秓 g! Nh﹏ ti謓 甶襲 tra manh m鑙!",
        "Tu﹏ l謓h! T筰 h� 甶 ngay!"
    };

    ---无赖口供
	if GetItemCount(2,0,46) >= 5 then
		TalkEx("task_006_02", strMain);
	else
		Talk(1,"task_006_01","Ngi v蒼 ch璦 l蕐 頲 kh萿 cung t猲 C玭  n祇 sao?");
	end;
end;

function task_006_01()
    if GetTrigger(KILL_BJ_WL) == 0 then
        CreateTrigger(0, 199, KILL_BJ_WL);
    end;
end;

function task_006_02()
	Msg2Player("дn H筺h Hoa th玭 b秓 v� B竎h Th秓 g");
	TaskTip("дn H筺h Hoa th玭 b秓 v� B竎h Th秓 g");
	
	GivePlayerAward("Level_10", "hard", "legs", "Level_15");    --奖励
	GivePlayerExp(SkeyBJShuxin,"wulai2")		--无赖2
	RemoveTrigger(GetTrigger(KILL_BJ_WL));
	DelItem(2,0,46,5);
	SetTask(TASK_BJ_ID, 7);
end;


function task_007_00()
    local strMain = {
    	"�.",
    	"V� c� nng n祔! T筰 h� n th╩ B竎h Th秓 g ti襫 b鑙! Xin h醝�",
    	"[C� g竔 m蕄 m竬 m玦 nh璶g kh玭g ph竧 ra ti課g]",
    	"Ta c� th� gi髉 g� c� nng kh玭g?",
    	"[Лa b筺 1 t� gi蕐]",
    	"{T� Ong 5 c竔}, t譵 � {H筺h Hoa th玭}; {C竧 C竛h 5 c竔} t譵 � ngo礽 th祅h {Nam Bi謓 Kinh}収﹜ l� b礽 thu鑓?",
    	"[C� g竔 g藅 u]",
    	"Л頲! Xin i t筰 h� 甶 l蕐 ch髇g v�!"
    }
    TalkEx("task_007_01", strMain);
end;

function task_007_01()
	Msg2Player("B竎h Th髖 B譶h nh� b筺 甶 t譵 5 T� Ong v� n ph輆 Nam Bi謓 Kinh t譵 5 C竧 C竛h");
	TaskTip("B竎h Th髖 B譶h nh� b筺 甶 t譵 5 T� Ong v� n ph輆 Nam Bi謓 Kinh t譵 5 C竧 C竛h");
	SetTask(TASK_BJ_ID, 8);
end;


function task_008_00()

local strMain = {
	"[C� g竔 c� v� r蕋 c╪g th糿g]",
	"C� nng! Ta  mang dc li謚 v� y!",
	"[C� g竔 l藀 t鴆 ph鑙 thu鑓, sau  u鑞g ngay]",
	"<sex>!  c鴘 m筺g n祔 ti觰 n� xin t筩 d� ghi ﹏! <sex>! Xin h醝 ngi t譵 gia ph� c馻 ti觰 n� c� vi謈 g�?",
	"Ta ph鬾g m謓h Xa Th竔 Qu﹏ n b秓 v� cho B竎h l穙 b�!",
	"!...Ngi n ch薽 1 bc r錳! Gia ph� m蕐 ng祔 trc  b� 1 m cao th� n b総 甶 u kh玭g bi誸 n鱝!",
	"Th藅 ng tr竎h! Gi� c� c竎h n祇 t譵 頲 t玭g t輈h c馻 l謓h 玭g kh玭g?",
	"Vi謈 n祔 c騨g kh玭g kh� g�! Gi� h穣 ra ngo礽 b総 1 輙 Thi誸 Gi竝 tr飊g. Lo筰 n祔 r蕋 th輈h m飅 thu鑓 tr猲 ngi gia ph�! Nh蕋 nh ch髇g s� bay 甶 d蒼 阯g ch髇g ta. <sex>! Xin h穣 甶 ra th玭 t譵 10 No穘 tr飊g v� cho ti觰 n� luy謓 thu鑓 trc !",
	"Chuy謓 nh�! Xin i tin t筰 h�!",
}

    -- 蜂巢 2，1，13  桔梗 1，2，2
	if GetItemCount(2, 1, 13) >= 5 and GetItemCount(1, 2, 2) >= 5 then
		TalkEx("task_008_01", strMain);
	else
		Talk(1,"","�.");
	end;
	
end;

function task_008_01()
	Msg2Player("B竎h Th髖 B譶h nh� b筺 甶 t譵 10 No穘 tr飊g");
	TaskTip("B竎h Th髖 B譶h nh� b筺 甶 t譵 10 No穘 tr飊g");
	
	GivePlayerAward("Level_14", "easy");    --奖励
	GivePlayerExp(SkeyBJShuxin,"yaoshimizong")		--药室迷踪
	--删除 5 个蜂巢，5个桔梗
	DelItem(2, 1, 13, 5);
	DelItem(1, 2, 2, 5);
	SetTask(TASK_BJ_ID, 9);
end;


function task_009_00()

local strMain = {
	"<sex> No穘 tr飊g  t譵 頲 ch璦?",
	"C� ph秈 l� 10 No穘 tr飊g n祔 kh玭g?",
	"[B竎h Th髖 B譶h b� No穘 tr飊g v祇 1 b譶h s鴀",
	"Зy l� M辌h T玭g C�. <sex>! B鋘 Thi誸 Gi竝 tr飊g n祔 s� d蒼 ngi n n琲 c馻 gia ph�. <sex>! Gi� xin tr玭g c藋 v祇 t礽 ngh� c馻 ngi! Mong <sex> v� gia ph� b譶h y猲 tr� v�!",
	"C� nng y猲 t﹎! Зy c騨g l� chuy謓 c馻 t筰 h�!",
}

	if (GetItemCount(2, 1, 6) >= 10) then
		TalkEx("task_009_01", strMain);
	else
		Talk(1,"","Х t譵 頲 10 No穘 tr飊g ch璦?");
	end;

end;

function task_009_01()
	
	-- 给予玩家觅踪金甲蛊
	AddItem(2,0,47,1);
	Msg2Player("B筺 mang theo M辌h T玭g C� 甶 t譵 tung t輈h B竎h Th秓 g!");
	TaskTip("B筺 mang theo M辌h T玭g C� 甶 t譵 tung t輈h B竎h Th秓 g!");
	
	GivePlayerAward("Level_14", "hard", "legs", "Level_16");    --奖励
	GivePlayerExp(SkeyBJShuxin,"shimiliaoren")		--神秘辽人
	
	-- 删除虫卵
	DelItem(2, 1, 6, 10);
	SetTask(TASK_BJ_ID, 10);
end;

function task_010_00()
    Talk(1,"","Xin mang theo M辌h T玭g C� n祔 甶 t譵 Gia ph�!");
    if GetItemCount(2,0,47) == 0 then
        AddItem(2,0,47,1);
    end;
end;

function task_013_00()
    local szTalk = {
    	"<sex>  v� r錳 �? M鋓 vi謈 thu薾 l頸 ch�?",
        "Kh蕌 i nh﹏! Зy c� 1 b鴆 th� c馻 {Thi猲  gi竜}! Xin ngi c qua!",
        "[Kh蕌 Chu萵 c nhanh]",
        "Ra l� v藋!...Ta nghe n鉯 Thi猲  gi竜 l� m閠 t玭g gi竜 th莕 b� r蕋 c� 秐h hng v韎 gi韎 qu� t閏 Li猽 qu鑓. Li猲 quan n Trng ca m玭, t鑤 nh蕋 n猲 甶 h醝 Tri謚 Di猲 Ni猲!",
        "V藋 t筰 h� 甶 b竔 ki課 Tri謚 ti襫 b鑙 y!",
        "Ngi  v� ta m� v蕋 v� nhi襲 qu�! C� ch髏 t譶h �, xin <sex> nh薾 l蕐!"
    };
    TalkEx("task_013_01", szTalk);
end;

function task_013_01()
    SetTask(TASK_BJ_ID, 14);
    
    GivePlayerAward("Level_18", "hell", "chest", "Level_18");    --奖励
    GivePlayerExp(SkeyBJShuxin,"shitaijinji1")		--事态紧急1
    SetTask(111, 101) --找赵延年的任务
end;

function task_014_00()
    local szTalk = {
        "Thi猲  gi竜 l� 1 t玭g gi竜 th莕 b� r蕋 c� 秐h hng v韎 gi韎 qu� t閏 Li猽 qu鑓. Li猲 quan n Trng ca m玭, ngi t鑤 nh蕋 n猲 甶 h醝 Tri謚 Di猲 Ni猲!"
    };
end;