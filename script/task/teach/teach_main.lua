
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 教育任务实体处理文件
-- Edited by peres
-- 2005/05/07 PM 19:55

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================

-- 教育任务头文件
Include("\\script\\task\\teach\\teach_head.lua");

-- 教育任务奖励文件
Include("\\script\\task\\teach\\teach_award.lua");

-- 第一次与野叟对话
function task_000_00()
	local strMain = {
		"<color=green>D� T萿<color>: Ch祇 m鮪g n v韎 <color=yellow>V� L﹎ 2<color>, ta ch輓h l� D� T萿 trong truy襫 thuy課, <color=yellow>Hng d蒼 t﹏ th�<color> c馻 tr� ch琲. Ngi c� c莕 ta cho quy觧 <color=yellow>Gi韎 thi謚 tr� ch琲<color> v� <color=yellow>Gi髉  nhi謒 v�<color> kh玭g? Зy l� quy觧 Giang h� ch� nam do ch輓h ta vi誸.",
		" t� l穙 ti襫 b鑙!/task_000_okay", 
		"Ta n th╩ L穙 ti襫 b鑙 th玦 m�!/task_000_01"
	}
	SetTask(1, 1);
	AddItem(2,0,505,1)
	SelectSay(strMain);

end;

-- 选择听野叟讲解
function task_000_okay()

	local strMain = {

		"Ngi mu鑞 t譵 hi觰 v� v蕁  g�?",
		"Thao t竎 c� b秐/Teach_Basic",
		"T╪g c蕄 nh﹏ v藅/Teach_Level",
		"Ph﹏ ph鑙 ti襪 n╪g/Teach_Point",
		"Phng ph竝 ki誱 ti襫/Teach_Earn",
		"Gia nh藀 m玭 ph竔/Teach_Faction",
		"Hi謓 c� th� l祄 /Teach_Something",
		"Ta  hi觰 r錳/task_000_00"

	}

	SelectSay(strMain);

end;


-- 开始做教学任务
function task_000_01()

	local strMain = {
		"<color=yellow>Ch� ti謒 v� kh�, Ch� Ti謒 Nam ph鬰, Ch� Ti謒 N� ph鬰, Ch� Kim ho祅, Ch� Dc 甶誱, Ch� T筽 h鉧<color> trong th祅h u l� nh鱪g ngi hi觰 bi誸 r閚g! H穣 t譵 h� h鋍 h醝!",
		"Ngi th� n th╩ h�, bi誸 u s� nh薾 頲 <color=yellow>V藅 ph萴<color>. Nh� m� <color=yellow>B秐  nh�<color> 甶 cho ti謓!"
	}

	TE_Talk("task_000_02",strMain);

end;

-- 接了任务，改变任务变量：1
function task_000_02()
	SetTask(1, 1);
	TaskTip("дn g苝 Ch� Ti謒 v� kh�");
end;

-- 与武器店老板的对话
function task_001_00()

	local strMain = {
		"Hoan ngh猲h b籲g h鱱 tham gia th� gi韎 V� L﹎. <color=yellow>V� kh�<color> c馻 ta tuy ch� c蕄 4 tr� xu鑞g nh璶g c騨g l�  nh蕋 c馻 v飊g n祔. Mua 甶! Ta s� hng d蒼 cho c竎h s� d鬾g.",
		"Phi襫 ti襫 b鑙 ch� gi竜!/task_001_01",
		"Kh玭g c莕 u!/task_001_02"
	}
	SelectSay(strMain);

end;

-- 听武器店老板讲解
function task_001_01()

	local strMain = {
		"H祅h t萿 giang h�, c莕 ph秈 c� v� kh�  ph遪g th﹏. Nh鱪g th� n gi秐 nh� <color=yellow>H� th�<color>, <color=yellow>Ki誱<color>, <color=yellow>竚 kh�<color>, <color=yellow>C玭<color> kh玭g c莕 s� ph� hng d蒼, nh鱪g th� c遪 l筰 nh� 產o, c莔, b髏, trng ph秈 頲 hng d蒼.",
		"V� kh� tr猲 ngi tng 鴑g v韎 t鮪g ng c蕄, ngi ch琲 c� th� mua v� kh� th玭g thng � th� r蘮, c遪 nh鱪g lo筰 cao c蕄 ph秈 t� t筼 ho芻 mua l筰 t� ngi ch琲 kh竎.",
		"L骳 trc ta c� giao u v韎 cao th� ph竔 t� ki誱 ph竔 Thanh Th祅h, may 頲 m閠 v� V� ng ra tay c鴘 gi髉, tr猲 tay 玭g ta l� thanh b秓 ki誱 頲 kh秏 ng鋍, uy l鵦 kinh ngi. Nghe n鉯 y l� lo筰 k� th筩h h綾 b筩h c� th� kh秏 n筸 l猲 v� kh�.",
		"N誹 ngi g苝 c� duy猲 c� 頲 b秓 ki誱  th� vi謈 h祅h t萿 giang h� xem ra r蕋 nh� nh祅g.",
		"Gi� ngi c� th� 甶 g苝 <color=yellow>Ch� Ti謒 Nam ph鬰<color>."
	}
	TE_Talk("task_001_02",strMain);

end;

-- 听完讲解，改变任务变量：2
function task_001_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch� Ti謒 v� kh�");
	if GetSex()==1 then
		TaskTip("дn g苝 Ch� Ti謒 Nam ph鬰");
	else
		TaskTip("дn g苝 ch� Ti謒 N� ph鬰");
	end;
end;

-- 与服装店男老板的对话
function task_002_00_male()

	local strMain = {
		"Hoan ngh猲h b籲g h鱱 tham gia th� gi韎 V� L﹎. Ti謒 ta chuy猲 b竛 trang ph鬰 nam c蕄 4. Mua 甶. Mua 甶! Ta s� hng d蒼 v� c竎h s� d鬾g <color=yellow>trang ph鬰<color>.",
		"Phi襫 ti襫 b鑙 ch� gi竜!/task_002_01",
		"Kh玭g c莕 u!/task_002_02"
	}
	SelectSay(strMain);
end;

-- 与服装店女老板的对话
function task_002_00_female()

	local strMain = {
		"Hoan ngh猲h b籲g h鱱 tham gia th� gi韎 V� L﹎. Ti謒 ta chuy猲 b竛 trang ph鬰 n� c蕄 4. Mua 甶. Mua 甶! Ta s� hng d蒼 v� c竎h s� d鬾g <color=yellow>trang ph鬰<color>.",
		"Phi襫 ti襫 b鑙 ch� gi竜!/task_002_01",
		"Kh玭g c莕 u!/task_002_02"
	}
	SelectSay(strMain);
end;

-- 听服装店老板的讲解
function task_002_01()

	local strMaleMain = {
		"H祅h t萿 giang h� vi謈 trang b� cho m譶h m閠 trang ph鬰 l� 甶襲 t蕋 y誹. trang ph鬰 � y c� kh╪ u, thng y v� h� y, ch� � c竎h m芻 <color=yellow>thng y<color> do li猲 quan n ph遪g th�.",
		"Ch� ta ch� b竛 c竎 lo筰 h� th� th玭g thng n誹 mu鑞 c� trang ph鬰 t鑤 ph秈 t譵 th� gi醝 ch� t筼. Thng trang ph鬰 t鑤 l祄 ra kh玭g p l緈 nh璶g l筰 r蕋 hi謚 qu� trong vi謈 ph遪g th�. V� v藋 nh鱪g ngi c� ti襫 thng kho竎 th猰 <color=yellow>Ngo筰 trang<color>.",
		"Ch� ta ch� b竛 N閕 trang. B籲g h鱱 c� th� n n琲 kh竎 t譵 Ngo筰 trang cho m譶h.",
		"Зy c� m鉵 qu� nh�. Sau nh� chi誹 c� b鎛 ti謒 nh�! Gi� c� th� 甶 g苝 <color=yellow>Ch� Kim ho祅<color>."
	}

	local strFemaleMain = {
		"H祅h t萿 giang h� vi謈 trang b� cho m譶h m閠 trang ph鬰 l� 甶襲 t蕋 y誹. trang ph鬰 � y c� kh╪ u, thng y v� h� y, ch� � c竎h m芻 <color=yellow>thng y<color> do li猲 quan n ph遪g th�.",
		"Ch� ta ch� b竛 c竎 lo筰 h� th� th玭g thng n誹 mu鑞 c� trang ph鬰 t鑤 ph秈 t譵 th� gi醝 ch� t筼. Thng trang ph鬰 t鑤 l祄 ra kh玭g p l緈 nh璶g l筰 r蕋 hi謚 qu� trong vi謈 ph遪g th�. V� v藋 nh鱪g ngi c� ti襫 thng kho竎 th猰 <color=yellow>Ngo筰 trang<color>.",
		"Ch� ta ch� b竛 gi竝 N閕 trang. B籲g h鱱 c� th� n n琲 kh竎 t譵 Ngo筰 trang cho m譶h.",
		"Зy c� m鉵 qu� nh�. Sau n祔 nh� chi誹 c� b鎛 ti謒 nh�! Gi� h穣 甶 g苝 <color=yellow>Ch� Kim ho祅<color>!"
	}

	if GetSex()==1 then
		TE_Talk("task_002_02",strMaleMain);
	else
		TE_Talk("task_002_02",strFemaleMain);
	end;
	
end;

-- 与服装店老板对话结束后，改变任务变量：3
function task_002_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch� ti謒 trang ph鬰");
	TaskTip("дn g苝 Ch� Kim ho祅");
end;

-- 与饰品店老板的对话
function task_003_00()

local strMain = {
	"Hoan ngh猲h b籲g h鱱 tham gia th� gi韎 V� L﹎. � y chuy猲 b竛 trang s鴆 c蕄 2 v� s絥 s祅g hng d蒼 v� c竎h s� d鬾g <color=yellow>trang s鴆<color>.",
	"Mong ti襫 b鑙 ch� gi竜!/task_003_01",
	"Kh玭g c莕 u!/task_003_02"
}
SelectSay(strMain);

end;

-- 听饰品店的老板讲解
function task_003_01()

	local strMain = {
		"<color=yellow>Nam cao th�<color> thng mang Ng鋍 b閕, H� ph�, <color=yellow>N� k� hi謕<color> mang hng nang, H筺g li猲. C遪 nh蒼 c� nam n� u 甧o 頲.",
		"B鎛 ti謒 bu玭 b竛 nh� kh玭g c�  b秓 v藅 qu�! H穣 ra ngo礽 r鮪g th� v薾 may xem!"
	}
	TE_Talk("task_003_02",strMain);
end;

-- 听完饰品店老板讲解发奖励，改变任务变量：4
function task_003_02()

	local strMain = {
		"C� <color=yellow>ch髏 qu� m鋘<color>! Sau n祔 nh� chi誹 c� b鎛 ti謒 nh�! Gi� c� th� t譵 <color=yellow>Ch� dc 甶誱 <color>!"
	}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch� Kim ho祅");
	TaskTip("дn g苝 Ch� Dc 甶誱");
	TE_Talk("",strMain);

end;

-- 与药店老板的对话
function task_004_00()

	local strMain = {
		"Hoan ngh猲h b籲g h鱱 tham gia th� gi韎 V� L﹎. � y chuy猲 b竛 dc li謚 c蕄 2 v� s絥 s祅g hng d蒼 v� c竎h s� d鬾g <color=yellow>dc li謚<color>.",
		"Phi襫 ti襫 b鑙 ch� gi竜!/task_004_01",
		"Kh玭g c莕 u!/task_004_02"
	}
	SelectSay(strMain);

end;

-- 听药店老板的讲解
function task_004_01()

	local strMain = {
		"H祅h t萿 giang h� n dc mang theo ph遪g th﹏ l� 甶襲 t蕋 y誹, g莕 y v� l﹎ i lo筺 m閠 s� linh dc qu� ph秈 t� t筼 ho芻 nh� cao nh﹏ gi髉 .",
		"N誹 kh玭g c� n dc ta ch� c� th� s� d鬾g <color=yellow>dc th秓<color>. Tuy c玭g hi謚 kh玭g cao nh璶g gi髉 輈h cho nh鱪g ai m韎 t ch﹏ v祇 giang h�."
	}
	TE_Talk("task_004_02",strMain);

end;

-- 听完药店老板讲解或者直接跳到这里，改变任务变量：5
function task_004_02()

	local strMain = {
		"Ta c� 20 b譶h <color=yellow>Kim S竛g t竛<color> l祄 qu�! Gi� c� th� g苝 <color=yellow>Ch� T筽 h鉧<color>."
	}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch� Dc 甶誱");
	TaskTip("дn g苝 Ch� T筽 h鉧");
	TE_Talk("",strMain);

end;

-- 与杂货店老板的对话
function task_005_00()

	local strMain = {
		"Hoan ngh猲h b籲g h鱱 tham gia th� gi韎 V� L﹎. � y chuy猲 b竛  c竎 lo筰 <color=yellow>v藅 ph萴<color> v� c� hng d蒼 k蘭 theo, ngi c莕 g� n祇?",
		"Phi襫 ti襫 b鑙 ch� gi竜!/task_005_01",
		"Kh玭g c莕 u!/task_005_02"
	}
	SelectSay(strMain);

end;

-- 听杂货店老板的讲解
function task_005_01()

	local strMain = {
		"V藅 ph萴 tr猲 giang h� mu玭 h譶h v筺 tr筺g, c莕 hi觰 r�  v� sau s� d鬾g! C竎 lo筰 {Ch鴆 C萴} v� {Da th髛 c� th� ch� t筼 H� gi竝. {C竎 m秐h kim lo筰, B秓 Th筩h} c� th� ch� t筼V� kh�.",
		"Ng� c鑓 d飊g ch� t筼 lng th鵦, chu sa v� linh huy誸 d飊g luy謓 linh ph�, ngo礽 ra c遪 m閠 s� v藅 ph萴 th莕 b�.",
		"Nghe n鉯 <color=yellow>Thng Nh﹏ th莕 b�<color> 產ng thu th藀 k� tr﹏ d� b秓, ngi th� n  m閠 chuy課 xem sao."
	}
	TE_Talk("task_005_02",strMain);

end;

-- 听完杂货店老板的讲解后或者直接跳到这里，改变任务变量：6
function task_005_02()

	local strMain = {
		"B鎛 ti謒 bu玭 b竛 nh�, ch� c� 2 t蕀 <color=red>Gi竚 nh ph�<color> n祔 t苙g b筺 tr�! Sau n祔 nh qu竔 r琲 <color=yellow>trang b�<color>, ch� c莕 d飊g chu閠 ph秈 nh蕁 v祇 Gi竚 nh ph� a h譶h chu閠 t韎 trang b� l� c� th� bi誸 頲 thu閏 t輓h.",
		"Xem b籲g h鱱 c騨g m謙 r錳! H穣 v� g苝 <color=yellow>D� T萿<color> xem c� th豱h gi竜 頲 g� n鱝 kh玭g!"
	}
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch� T筽 h鉧");
	TaskTip("Quay v� g苝 D� T萿");
	TE_Talk("",strMain);

end;

-- 回来与野叟的对话
function task_006_00()

	local strMain = {
		"Thu ho筩h 頲 g� r錳?",
		"C竎 ch� ti謒 t苙g r蕋 nhi襲 , vui qu�!",
		"Haha! C遪 nhi襲 甶襲 kinh ng筩 n鱝 k譨! ьi ngi t <color=yellow>c蕄 4<color> l筰 n t譵 ta. я 甶觤 kinh nghi謒 nh� nh蕁 <color=yellow><F3><color> m� giao di謓 thu閏 t輓h <color=yellow>t╪g c蕄<color> cho nh﹏ v藅. N誹 b� thng v� ch� ta ch鱝 tr� mi詎 ph�.",
	}
	TE_Talk("task_006_01",strMain);

end;

-- 与野叟对话结束后改变任务变量：7
function task_006_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("дn g苝 D� T萿");
	TaskTip("Ra ngo礽 th祅h luy謓 c玭g, n c蕄 4 quay l筰 g苝 D� T萿.");
end;

-- 到了 4 级之后与野叟的对话
function task_007_00()

	local strMain = {
		"Ngi ti課 b� nhanh v藋 sao?",
		"Kh玭g! Qu竔 b猲 ngo礽 m筺h l緈!",
		"<color=yellow>V� binh th祅h m玭<color> v� <color=yellow>V� s�<color> ngo礽 th祅h r蕋 am hi觰 c竎h chi課 u v� ph﹏ b� qu竔, h穣 n  th豱h gi竜 甶."
	}
	TE_Talk("task_007_01",strMain);
end;

-- 与野叟对话结束后改变任务变量：8
function task_007_01()
	TE_SetTeachAdd();
	TaskTip("T譵 v� binh th祅h m玭 h醝 khu v鵦 luy謓 c玭g.");
end;

-- 与城门卫兵的对话
function task_008_00()

	local strMain = {
		"C� th� ch� cho ti觰 甶謙 y ch� <color=yellow>luy謓 c玭g<color> 頲 kh玭g?",
		"Ngi t譵 ng ngi r錳!",
		"Qu竔 頲 ph﹏ b� b猲 ngo礽 th祅h ho芻 g莕 m玭 ph竔, c祅g xa th祅h th� ng c蕄 qu竔 c祅g m筺h, qu竔 m筺h nh蕋 kho秐g <color=yellow>c蕄 50<color>.",
		"Kh玭g n猲 v祇 c竎 s琻 ng v� n琲  qu竔 r蕋 m筺h.",
		"L祄 sao  bi誸 qu竔 n琲  nguy hi觤?",
	}
	TE_Talk("task_008_00_01",strMain);

end;


function task_008_00_01()

	local strMain = {
		"в nh薾 bi誸 qu竔 ta nh譶 <color=yellow>m祏 s綾<color> t猲 c馻 ch髇g, <color=yellow>m祏 tr緉g<color> ch� qu竔 c蕄 th蕄; <color=yellow>m祏 <color> ch� qu竔 c蕄 cao; <color=yellow>m祏 xanh<color> ch� th� l躰h c蕄 nh�; <color=yellow>m祏 v祅g kim<color> ch� th� l躰h c蕄 cao, c莕 ph秈  ph遪g!",
		"May qu�! L骳 n穣 ta nh gi誸 m蕐 con qu竔 ch� .",
		"Haha! T﹏ th� nh� ngi ch� c� th� nh qu竔 xung quanh th祅h th玦!",
		"Чi ca c遪 g� ch� gi竜 kh玭g?",
		"Ta bi誸 r� qu竔 ph﹏ b� � u, n誹 c莕 th� n y <color=yellow>t譵 hi觰<color> n琲 luy謓 c玭g th輈h h頿. C遪 v� chi課 u th� t譵 v� s� th豱h gi竜.",
		"Hi觰 r錳!  t� i ca! Ta 甶 t譵 <color=yellow>V� s�<color> y!"
	}
	TE_Talk("task_008_01",strMain);

end;

-- 与卫兵对话结束后改变任务变量：9
function task_008_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("V� binh th祅h m玭");
	TaskTip("T譵 v� s� h鋍 c竎h chi課 u");
end;

-- 与武师对话
function task_009_00()

	local strMain = {
		"D� T萿 b秓 ta n t譵 ti襫 b鑙 h鋍 <color=yellow>c竎h chi課 u<color>.",
		"L穙 phu y r蕋 th輈h hng d蒼 h藆 b鑙 nh璶g trc ti猲 ph秈 hi觰 <color=yellow>k� n╪g chi課 u<color>. Ngi ph﹏ bi謙 頲 c玭g k輈h tr竔 v� c玭g k輈h ph秈 kh玭g?",
		"Kh玭g hi觰 l緈!",
		"B猲 tr竔 ch� nh V藅 l�, b猲 ph秈 l� nh v� c玭g. C� th� s� d鬾g <color=yellow>v� c玭g b猲 ph秈<color> nh qu竔. V� c玭g m玭 ph竔, m藅 t辌h ho芻 theo ta h鋍 u s� d鬾g 頲.",
		"Kh玭g ng� b猲 ph秈 h鱱 hi謚 n nh� v藋?",
		"Ngi mu鑞 nhanh ch鉵g h� 頲 qu竔 c莕 ph秈 bi誸 <color=yellow>thu閏 t輓h c馻 ch髇g<color>.",
		"Ti觰 b鑙 c� nghe v� binh n鉯 qua v� ng c蕄 qu竔, m祏 s綾 v� khu v鵦 ph﹏ b� c馻 ch髇g.",
	}	
	TE_Talk("task_009_00_01",strMain);
end;

function task_009_00_01()

	local strMain = {
		"Trong th鵦 ti詎 nh� v藋 v蒼 ch璦 , n鉯 v� <color=yellow>c竎h nh<color> 產 s� qu竔 u c� c竎 d筺g nh� t蕁 c玭g b� ng, t蕁 c玭g ch� ng, t蕁 c玭g nh譶 r�, bao v﹜, t k輈h. Ch� c莕 n緈 r� l� c� th� i ph� ch髇g.",
		"Ti襫 b鑙 hng d蒼 r� h琻 頲 kh玭g?",
		"<color=yellow>T蕁 c玭g b� ng<color> ch� qu竔 t� ng nh tr�; <color=yellow>T蕁 c玭g ch� ng<color> ch� qu竔 t� ng t蕁 c玭g; <color=yellow>T蕁 c玭g nh譶 r�<color> ch� qu竔 nh箉 b衝 quan s竧 頲 i phng xu蕋 chi猽; <color=yellow>Bao v﹜<color> ch� qu竔 h� tr� cho ng i; <color=yellow>t k輈h<color> ch� qu竔 lm v藅 ph萴 c馻 ngi ch琲, ph秈 nh b筰 ch髇g m韎 l蕐 l筰 頲 v藅 ph萴.",
		"<color=yellow>Thu閏 t輓h c玭g k輈h<color> c馻 ch髇g th� sao?",	
	}
	TE_Talk("task_009_01",strMain);
end;

-- 与武师对话的扩展
function task_009_01()

	local strMain = {
		"<color=yellow>Thu閏 t輓h c玭g k輈h<color> ch� t� ch蕋 qu竔 c� th� thay i c玭g ph遪g, ch� y誹 kim, m閏, th駓, h醓, th�, ﹎, v�. Qu竔 c蕄 th蕄 kh玭g mang thu閏 t輓h, qu竔 t� c蕄 20 m韎 c� <color=yellow>thu閏 t輓h ng� h祅h<color>, ch髇g thay i theo t輓h tng sinh tng kh綾 ng� h祅h.",
			"V藋 ta ph秈 ch鋘 trang b� ng� h祅h, c遪 <color=yellow>thu閏 t輓h ﹎<color> th� sao?",
		"T� khi <color=yellow>m秐h S琻 H� X� T綾<color> tan r�, m閠 lo筰 qu竔 m韎 mang thu閏 t輓h ﹎ xu蕋 hi謓, ch髇g kh玭g s� c玭g k輈h thng, v� kh� ng� h祅h hay v� c玭g n gi秐 kh玭g th�  thng ch髇g.",
		"Th蕋 b筰 trong chi課 u tr鮪g ph箃 ra sao? C� t� vong kh玭g?",
	}
	TE_Talk("task_009_02",strMain);
end;

-- 与武师对话的扩展
function task_009_02()

	local strMain = {
		"Trong tr� ch琲 kh玭g c� t� vong, n誹 nh thua qu竔, ch� m蕋 1% kinh nghi謒 hi謓 t筰, 5% ng﹏ lng v� m閠 輙 danh v鋘g, kh玭g may c� th� b� <color=yellow>ngo筰 thng<color> ho芻 <color=yellow>n閕 thng<color>. Chi課 u th蕋 b筰 ngi c� th� ch鋘 v� th祅h ho芻 i cao th� Nga My ph藅 gia n c鴘, n誹 c鴘 s鑞g ch� t鎛 th蕋 ng﹏ lng v� danh v鋘g m� kh玭g t鎛 th蕋 kinh nghi謒, n閕 thng.",
		"Ti襫 b鑙 c� th� ch� v礽 chi猽 cho ti觰 b鑙 頲 kh玭g?",
		"Ta c� m鉵 v� <color=yellow>khinh c玭g<color> nh d箉 ngi, nh璶g l筰 c� vi謈 g蕄 r錳, th玦  khi kh竎 v藋.",
		" t� ti襫 b鑙! Ta ph秈 quay v� g苝 <color=yellow>D� T萿<color>."
	}
	TE_Talk("task_009_03",strMain);
end;

-- 与武师对话结束后改变任务变量：10
function task_009_03()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("V� s�");
	LearnSkill(20)--直接学会轻功
	TaskTip("C竎 h�  l躰h h閕 頲 khinh c玭g, c� th� quay v� g苝 D� T萿")
end;

-- 回去与野叟对话
function task_010_00()

	local strMain = {
		"Ngi  bi誸 c竎h chi課 u r錳 �?",
		"Nghe v� s� v� v� binh ch� gi竜  hi觰 r� h琻 m閠 ch髏.  t� ti襫 b鑙!",
		"дn c蕄 6 nh� quay l筰 t譵 ta. Sao ngi mang theo nhi襲  v藋? дn t譵 <color=yellow>Th� kh�<color> xem sao!"
	}
	TE_Talk("task_010_01",strMain);
end;

-- 与野叟对话后改变任务变量：11
function task_010_01()
	TE_SetTeachAdd();
	TaskTip("дn c蕄 6 quay l筰 t譵 D� T萿.");
end;

-- 等级到了 6 级时回来与野叟的对话
function task_011_00()

	local strMain = {
		"Th� n祇 r錳?",
		"Ch糿g c� g� th� v�, tuy h鋍 h醝 頲 r蕋 nhi襲 t� m蕐 ch� ti謒 nh璶g h� u b薾. N誹 c� ngi <color=yellow>n鉯 chuy謓<color> th� hay bi誸 m蕐!",
		"Kh玭g vui l� ph秈 r錳! Ngi ph秈 thng xuy猲 n鉯 chuy謓 v韎 h�.",
		"Th� n祔 v藋! H穣 t譵 <color=yellow>Ch� t鰑 l莡<color> v� <color=yellow>Ti猽 s�<color>, kh玭g ch鮪g h� s� ch� d箉 頲 g� th猰!",
		"Hay qu�! V藋 ti觰 b鑙 甶 t譵 <color=yellow>Ch� t鰑 l莡<color> y!"
	}
	TE_Talk("task_011_01",strMain);
end;

-- 与野叟对话后改变任务变量：12
function task_011_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch� t鰑 l莡");
	TaskTip("T譵 ch� t鰑 l莡 h鋍 c竎h giao l璾.");
end;

-- 与酒楼老板的对话
function task_012_00()
	local strMain = {
		"Ti襫 b鑙 c� th� ch� cho c竎h <color=yellow>giao l璾<color> 頲 kh玭g?",
		"Кn gi秐 th玦! Trong tr� ch琲 mu鑞 i tho筰 v韎 ai ch� c莕 nh蕁 ph輒 <color=yellow><Ctrl><color> k誸 h頿 v韎 chu閠 ph秈 l猲 i phng ch鋘 d遪g th輈h h頿 l� 頲.",
		"<color=yellow>T譵 hi觰<color>: Xem th玭g tin i phng; <color=yellow>T竛 g蓇<color>: Chat m藅 v韎 i phng; <color=yellow>Theo sau<color>:  theo m閠 ngi n祇 ; <color=yellow>Giao d辌h<color>: M阨 ngi ch琲 kh竎 giao d辌h; <color=yellow>T� i<color>: M阨 ngi ch琲 c飊g t� i.",
		"Ngi ch琲 kh玭g n籱 trong ph筸 vi th� giao l璾 b籲g c竎h n祇?",
	}
	TE_Talk("task_012_00_01",strMain);
end;


function task_012_00_01()
	local strMain = {
		"Khi mu鑞 t竛 g蓇, nh蕁 <color=yellow><Enter><color> ho芻 ch鋘 <color=yellow>T莕 s� t竛 g蓇 <color>, nh藀 t猲 ngi ch琲 v� n閕 dung mu鑞 g鰅 甶, nh蕁 <Enter> l� 頲.",
		"T莕 s� t竛 g蓇 l� sao?",
		"C� nhi襲 t莕 s�  t竛 g蓇. <color=yellow>T莕 s� ph� c薾<color> ngi ch琲 xung quanh nh譶 th蕐. <color=yellow>T莕 s� c玭g c閚g<color> ngi ch琲 to祅 server nh譶 th蕐. <color=yellow>T莕 s� h� th鑞g<color> hi觧 th� th玭g b竜 c馻 h� th鑞g.",
		"<color=yellow>T莕 s� i ng�<color> ch� trong i m韎 th蕐; <color=yellow>T莕 s� M玭 ph竔<color> ch� thu閏 m玭 ph竔 m韎 th蕐; <color=yellow>B莕 s� bang ph竔<color> ch� ngi trong bang m韎 th蕐.",
		"Sao c� l骳 ch鋘 t莕 s� r錳 v蒼 kh玭g t竛 g蓇 頲?",
	}
	TE_Talk("task_012_01",strMain);
end;

-- 与酒楼老板的对话扩展
function task_012_01()

	local strMain = {
		"в m b秓 cho ch蕋 lng t竛 g蓇, m鏸 t莕 s� u c� h筺 ch� ri猲g. T莕 s� m玭 ph竔 c莕 ngi ch琲 ph秈 gia nh藀 m玭 ph竔, c竎h nhau 1 ph髏. T莕 s� c玭g c閚g i h醝 ngi ch琲 tr猲 c蕄 30, c竎h nhau 3 ph髏. T莕 s� b� h筺 ch� s� hi謓 m祏  r蕋 d� nh譶 th蕐.",
		"Ta hi觰 r錳!",
		"Mu鑞 k誸 giao h秓 h鱱 n猲 t譵 <color=yellow>Ti猽 s�<color>, ngi n祔 c� nhi襲 b籲g h鱱, nh蕋 nh s� gi髉 頲 ngi!",
		" t� ti襫 b鑙! Ta 甶 t譵 <color=yellow>Ti猽 s�<color> y!"
	}
	TE_Talk("task_012_02",strMain);
end;

-- 与酒楼老板对话后改变任务变量：13
function task_012_02()
	TE_SetTeachAdd();
	TaskTip("T譵 ti猽 s� h鋍 c竎h k誸 giao b筺 h鱱.");
end;

-- 与镖师的对话
function task_013_00()

	local strMain = {
		"Xin ti襫 b鑙 ch� d蒼 cho nh鱪g kinh nghi謒 <color=yellow>K誸 giao b筺 h鱱<color>!",
		"Qu� khen! Кn gi秐 th玦 mu鑞 k誸 b籲g h鱱 v韎 ai nh蕁 <color=yellow><ctrl><color> k誸 h頿 chu閠 ph秈 nh蕄 l猲 ngi i phng ch鋘 <color=yellow>h秓 h鱱<color>, h� th鑞g t� ng xin ph衟 ngi ch琲 . N誹 ng � t猲 ngi  l藀 t鴆 hi謓 trong danh s竎h h秓 h鱱. V� sau ch� c莕 nh蕁 <color=yellow><F6><color> l� bi誸 頲 h� c� online hay kh玭g.",
		"Ta nghe c� ngi n鉯 v�  th﹏ thi謓, ti襫 b鑙 c� th� n鉯 r� 頲 kh玭g?",
	}
	TE_Talk("task_013_00_01",strMain);
end;

function task_013_00_01()
	local strMain = {
		"Ngi ch琲 sau khi tr� th祅h h秓 h鱱 s� c� th猰 <color=yellow>甶觤 th﹏ thi謓<color>. Ngi ch琲 b譶h thng t� i nh qu竔, t竛 g蓇 c騨g 頲 t輓h 甶觤 th﹏ thi謓, m閠 s� v藅 ph萴 c bi謙 nh� hoa h錸g c騨g gi髉 t╪g 甶觤 th﹏ thi謓. N誹 tr猲 1000 甶觤 th﹏ thi謓 c� th� <color=yellow>K誸 Ngh躠 Kim Lan<color>, tr猲 1500 甶觤, hai ngi kh竎 gi韎 c� th� n C� o t譵 Nguy謙 L穙 k誸 th祅h <color=yellow>phu th�<color>.",
		"H秓 h鱱, kim lan ho芻 phu th� b譶h thng c飊g t� i luy謓 c玭g s� 頲 t輓h th猰 kinh nghi謒.",
		"Th秓 n祇 g莕 y c� nhi襲 ngi xin 頲 t� i.",
		"R秐h r鏸 n猲 甶 g苝 <color=yellow>V� Nng<color>! B﹜ gi� c� th� quay v� g苝 D� T萿.",
		" t�! Ta 甶 t譵 <color=yellow>D� T萿<color> y!"
	}
	TE_Talk("task_013_01",strMain);
end;

-- 与镖师对话结束后改变任务变量：14
function task_013_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ti猽 s�");
	TaskTip("Quay v� g苝 D� T萿");
end;

-- 回来与野叟的对话
function task_014_00()

	local strMain = {
		"Hi觰 c竎h giao l璾 r錳 ph秈 kh玭g?",
		"Hi觰 r錳! Hay qu�!",
		"Gi� h穣 甶 m阨 m閠 ngi b筺 theo ngi v� y, s� c� <color=yellow>L� v藅<color> cho ngi! N誹 kh玭g t譵 頲 c� th� t� l藀 t� i r錳 m阨 b筺 h鱱 v�, nh璶g  <color=yellow>l� v藅<color> s� kh玭g t鑤 l緈!"
	}
	TE_Talk("task_014_01",strMain);
end;

-- 与野叟对话后改变任务变量：15
function task_014_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("trao i nhi謒 v� v韎 ngi kh竎");
	TaskTip("T譵 m閠 ngi b筺 ho芻 t� t� i t譵 D� T萿");
end;



-- 玩家再次带朋友来与野叟对话
-- 传入参数：1 为已经组队  2 为还没有组队  3 为选不知道怎么组对  4 为选还没有组队
function task_015_check(nState)
	local strMain = {
		"C� m鉵 qu� nh� t苙g c竎 ngi, hy v鋘g hai ngi s� l� h秓 h鱱 t鑤 c馻 nhau.",
		"Mu鑞 g箃 ta �? <color=yellow>h秓 h鱱<color> c馻 ngi u?",
		"Nh蕁 <color=yellow>t� i<color>, m阨 ngi kh竎 gia nh藀 t� i sau  n t譵 ta.",
		"Nhi襲 ngi n t譵 ta r錳, ngi c遪 kh玭g nhanh ch﹏!",
		"Hy v鋘g ngi t譵 頲 ngi b筺 th輈h h頿.",
		"N誹 kh玭g t譵 頲 h秓 h鱱 th� c� t� i v韎 ai  r錳 n g苝 ta!"
	
	
	}
	
	if (nState==1) then
		Talk(1,"task_015_01",strMain[1]);
	elseif (nState==2) then
		Talk(1,"",strMain[2]);
	elseif (nState==3) then
		Talk(1,"",strMain[3]);
	elseif (nState==4) then
		Talk(1,"",strMain[4]);
	elseif (nState==5) then
		Talk(1,"task_015_01",strMain[5]);
	elseif (nState==6) then
		Talk(1,"",strMain[6]);
	end
	
	return
	
end;

-- 带领了朋友来之后改变任务变量：16
function task_015_01()

local strMain = {
	"дn c蕄 8 nh� quay l筰 nh�!"
}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("Nhi謒 v� k誸 giao h秓 h鱱");
	TaskTip("Nhi謒 v� ho祅 th祅h n c蕄 8 quay l筰 t譵 D� T萿!");
	TE_Talk("",strMain);
end;

-- 到了 8 级之后和野叟的对话
function task_016_00()

	local strMain = {
		"Nhanh th藅! Ch� c遪 2 c蕄 n鱝 l� b筺 tr� c� th� gia nh藀 m玭 ph竔 r錳!",
		"C騨g nh� ti襫 b鑙 hng d蒼 t薾 t譶h.",
		"ng kh竎h s竜, nhi謒 v� c馻 ta l� hng d蒼 T﹏ th� m�! Ngi mau n c竎 m玭 ph竔 t譵 hi觰 n衪 <color=yellow>c s綾<color> � .",
		"Nh璶g ti觰 b鑙 c遪 ch璦 bi誸 ph秈 b総 u t� u!",
		"Trong m鏸 th祅h th� u c� <color=yellow>S� gi� m玭 ph竔<color>, h穣 n  th豱h gi竜! L莕 trc <color=yellow>B竎h Hi觰 Sinh<color> c� h醝 ta <color=yellow>6 c﹗ h醝<color>, chuy課 n祔 tr� v� gi髉 ta gi秈 p 頲 kh玭g?"
	}

	TE_Talk("task_016_01",strMain);
end;

-- 与野叟对话结束后改变任务变量：17
function task_016_01()
	TE_SetTeachAdd();
	TaskTip("T譵 hi觰 c s綾 m玭 ph竔 v� tr� l阨 6 c﹗ h醝 c馻 D� T萿")
end;

-- 再次回来与野叟的对话
function task_017_00()
	Say("Ngi hi觰 h誸 c s綾 c馻 c竎 m玭 ph竔 ch璦?",2,"Hi觰 r錳!/Teach_Qustion_001","Ch璦 hi觰 l緈!/task_exit");
	return
end;

-- 完全正确的回答问题后
function task_017_01()

	local strMain = {
		"Kh� l緈! Mang p 竛 n祔 n g苝 <color=yellow>B竎h Hi觰 Sinh<color> 甶!"
	}
	TE_Talk("task_017_02",strMain);
end;

-- 改变任务变量：18
function task_017_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Hi觰 v� c竎 m玭 ph竔");
	TaskTip("m p 竛 n鉯 cho B竎h Hi觰 Sinh");
end;

-- 与百晓生的对话
function task_018_00()

	local strMain = {
		"Theo B竎h ti猲 sinh p 竛 nh� v藋 ng kh玭g?",
		"ng r錳! Ngi bi誸 g� v� s�, hi謕, 萵 tam i <color=yellow>l璾 ph竔<color>?",
		"Nh� ti猲 sinh ch� gi竜!",
		"<color=green>B竎h Hi觰 Sinh<color>: Trong giang h� c� 10 m玭 ph竔, l莕 lt l� Thi誹 L﹎, V� ng, Nga My, C竔 Bang, Л阯g M玭, Minh Gi竜, C玭 L玭, Ng� чc, Th髖 Y猲 v� Thi猲 Ba Dng ph�, hi謓 u 產ng chi猽 m� m玭 .",
		"<color=green>B竎h Hi觰 Sinh<color>: Trong  Thi誹 L﹎ chia 3 hng Thi襫 T玭g, V� T玭g, T鬰 Gia; V� ng chia 2 hng T鬰 Gia, Чo Gia; Nga My chia 2 hng T鬰 Gia, Ph藅 Gia; C竔 Bang chia 2 hng T辬h Y, � Y; Л阯g M玭 ch� c� 1 hng; Thi猲 Ba Dng Ph� chia 2 hng Thng K� v� Cung K�; Ng� чc Gi竜 chia 2 hng C� S� v� T� Hi謕, C玭 L玭 ch� c� 1 hng l� Thi猲 S�; Minh Gi竜 chia 3 hng Th竛h Chi課, Huy誸 Nh﹏, Tr薾 Binh; Th髖 Y猲 chia 2 hng V� N� v� Linh N�. D� m玭 ph竔 chia m蕐 hng, ngi ch琲 c騨g ch� c� th� ch鋘 1 hng  tu luy謓.",
		"<color=green>Ngi ch琲<color>: 20 hng ch� 頲 theo 1, th藅 kh� ch鋘.",
		"<color=green>B竎h Hi觰 Sinh<color>: V� v藋 m韎 c� l璾 ph竔. Th藅 ra v� c玭g thi猲 h� u n籱 trong 3 l璾 ph竔 S�, Hi謕, 耼. N誹 ngi hi觰 頲 th� s� kh玭g th蕐 kh� ch鋘 n鱝.",
		"Ti猲 sinh n鉯 r� h琻 頲 kh玭g?",
	}
	TE_Talk("task_018_00_01",strMain);
end;

function task_018_00_01()
	local strMain = {
		"S�, hi謕, 萵 th鵦 t� ch� hng tu luy謓 c馻 nh﹏ v藅, ngi ch琲 theo <color=yellow>s�<color> c� th﹏ th� cng tr竛g v� s鴆 m筺h h琻 ngi.",
		"Theo <color=yellow>Hi謕<color> s鴆 m筺h v� nhanh nhen c﹏ b籲g; theo <color=yellow>萵<color> kh玭g quan tr鋘g b猲 ngo礽, ch� y誹 r蘮 luy謓 tinh th莕.",
		"Ti猲 sinh n鉯 xem ta n猲 甶 theo hng n祇?",
		"Ngi ch璦 gia nh藀 m玭 ph竔, sao ch鋘 頲 hng 甶, n猲 th﹏ tr鋘g khi a ra quy誸 nh.",
		"Ti猲 sinh hng d蒼 th猰 頲 kh玭g?",	
	}
	TE_Talk("task_018_01",strMain);
end;

-- 与百晓生的对话扩展
function task_018_01()

	local strMain = {
		"Th藅 ra theo hng n祇 c騨g c� 璾 甶觤 ri猲g c馻 n�, c莕 ph秈 ch鋘 l鵤 s� ph� sau khi gia nh藀 m玭 ph竔.",
		"Nhi襲 m玭 ph竔 v� nhi襲 hng tu luy謓, ta ph秈 l祄 sao?",
		"Tu h祅h t飝 m鏸 ngi th玦!",
		" t� ti猲 sinh!",
		"H穣 quay v� g苝 <color=yellow>D� T萿<color> 甶!"
	}
	TE_Talk("task_018_02",strMain);
end;

-- 与百晓生对话结束后改变任务变量：19
function task_018_02()
	TE_SetTeachAdd();
    Earn(100);
	ModifyReputation(4,0);
	GivePlayerExp(SKeyXinShou,"baixiaosheng")
	TaskTip("V� g苝 D� T萿");
end;

-- 再次回来与野叟的对话
function task_019_00()

	local strMain = {
		"Sao 甶 l﹗ v藋? B竎h Hi觰 Sinh n鉯 g�?",
		"B竎h ti猲 sinh n鉯 v韎 v穘 b鑙 v� s� , hi謕, 萵 tam i l璾 ph竔.",
		"B竎h Hi觰 Sinh qu� th藅 m璾 tr� h琻 ngi, v� sau c莕 g� ngi c� n  th豱h gi竜. Чt <color=yellow>c蕄 9<color> n t譵 ta! Gi� h穣 甶 th豱h gi竜 <color=yellow>Ch� thng h閕<color>!"
	}
	TE_Talk("task_019_01",strMain);
end;

-- 与野叟对话结束后改变任务变量：20
function task_019_01()
	TE_SetTeachAdd();
	TaskTip("Ho祅 th祅h nhi謒 v� t譵 hi觰 m玭 ph竔 t c蕄 9 t譵 D� T萿");
end;

-- 玩家到了 9 级之后和野叟对话
function task_020_00()

	local strMain = {
		"30 n╩ r錳卪au th藅!",
		"Ti襫 b鑙 n鉯 30 n╩ trc l� sao?",
		"Kh玭g c� g�! Xin gi髉 ta mang b鴆 th� cho <color=yellow>Tri謚 Di猲 Ni猲 � Bi謓 Kinh<color>, v� ta s� n鉯 sau!",
	}

	TE_Talk("task_020_01",strMain);

end;

-- 与野叟对话结束后改变任务变量：21
function task_020_01()
	TE_SetTeachAdd();
	TaskTip("D� T萿 nh� b筺 mang b鴆 th� cho Tri謚 Di猲 Ni猲 � Bi謓 Kinh");
	AddItem(2,0,48,1);
	GivePlayerExp(SKeyXinShou,"yeshou3")
	RestoreStamina()
	--CreateTrigger(4,199,80);
end;


function task_021_00()

	local strMain = {
		"V� "..GetPlayerSex().." n nh c� v韎 ta ch╪g?",
		"D� T萿 nh� ta mang b鴆 th� cho ti襫 b鑙!",
		"Ra l� v藋! L筰 b� phi襫 ph鴆 n鱝 r錳!",
		"(Tri謚 Di猲 Ni猲 m� th� ra xem)",
		"Ta i qu�, ngi c� th� t譵 cho ta 1 c竔 <color=yellow>b竛h ng�<color> 頲 kh玭g?",
		"M骯 ki誱 th� 頲, b竛h ng� th�.....",
		"B竛h ng� n gi秐 th� c騨g kh玭g l祄 頲, sao h祅h t萿 giang h�!",
		"Nh� k�! Ngi m� <color=yellow>giao di謓 k� n╪g<color> ch鋘 <color=yellow>tuy謙 k� gia truy襫<color> sau  nh蕁 <color=yellow>B竛h ng�<color> r錳 <color=yellow>уng �<color> l� 頲.",
		"в v穘 b鑙 th� xem!",
	}

	TE_Talk("task_021_01",strMain);

end;

-- 与赵延年对话结束后改变任务变量：22
function task_021_01()
	TE_SetTeachAdd();
	DelItem(2,0,48,1);
	GivePlayerExp(SKeyXinShou,"zhaoyannian")
	TaskTip("Tri謚 Di猲 Ni猲 nh� b筺 l祄 1 c竔 b竛h ng�");
end;



function task_022_00()

	local strMain = {
		"Ngi qu� l� ngi t鑤 b鬾g,  l穙 phu k� ngi nghe c﹗ chuy謓 30 n╩ v� trc.",
		"L祄 phi襫 ti襫 b鑙!",
		"30 n╩ trc th竔 t� Tri謚 Khu玭g D蒼 畂箃 頲 <color=yellow>b秐  S琻 H� X� T綾<color> t� tay S礽 Vinh, b� m藅 li猲 l筩 c竎 m玭 ph竔 c飊g t譵 b秐  kho b竨 b猲 trong ng th阨 ph竧 ng binh bi課 Tr莕 ki襲, m璾  so竔 v�. Kh玭g ai bi誸  ch輓h l� t蕀 b秐  c馻 Thi猲, мa, Nh﹏ <color=yellow>Tam Gi韎 ch蕁 ph�<color>, long m筩h c馻 Trung Nguy猲, b竨 v藅 m� S礽 Vinh 甧m t輓h m筺g ra gi祅h l蕐. Vi謈 l祄 c馻 th竔 t� d蒼 n tr阨 t c╩ ph蒼, trong ng祔 i l� t� tr阨, S琻 H� X� T綾 t nhi猲 h鉧 th祅h tro b鬷, bay 甶 kh緋 n琲.",
		"Th竔 t� bi誸 m譶h  l祄 ngh辌h � tr阨, o l閚 c祅 kh玭 tam gi韎, y猽 ma hi謓 th�, Trung Nguy猲 s緋 l﹎ v祇 i ki誴. в s鯽 sai l莔, m閠 b猲 ch蕁 ch豱h l筰 c竎 c鬰 di謓, m苩 kh竎 b� c竜 thi猲 h�, hy v鋘g t譵 頲 ngi ki誱 l筰 nh鱪g m秐h b秐  S琻 H� X� T綾."
	};

	if GetItemCount(1,1,1)>=1 then
	    DelItem(1,1,1,1);
		TE_Talk("task_022_01",strMain);
		return
	else
		Say("Ch璦 l祄 xong b竛h ng� �? H穣 m� k� n╪g s鑞g ra xem 甶!",0);
	end;
	
end;

-- 与赵延年对话结束后改变任务变量：23
function task_022_01()

	local strMsg = {
		"C﹗ chuy謓 tng ch鮪g ch譵 v祇 qu猲 l穘g, t nhi猲 c� tin th竔 t� b筼 b謓h qua i, ngi k� v� kh玭g ph秈 th竔 t� Tri謚 c Phng m� l� em vua Tri謚 Quang Ngh躠, tin n lan truy襫 n d﹏ gi﹏....100 ng祅 binh l輓h c馻 nc Li猽  k� c薾 Nh筺 M玭 Quan, m閠 s� h祇 ki謙 lai l辌h kh玭g r� chi誱 c� Lng S琻 B筩, Th祅h Й ph� v� Tuy襫 Ch﹗ ph� xung quanh xu蕋 hi謓 nhi襲 qu� qu竔.",
		"K� t�  tin t鴆 v� t蕀 b秐  S琻 H� X� T綾 lan truy襫 kh緋 Trung Nguy猲.",
		"Tng lai kh玭g xa, Trung Nguy猲 s� ph秈 i m苩 v韎 m閠 c鬰 di謓 tranh gi祅h, t祅 s竧 l蒼 nhau  c� 頲 t蕀 b秐  qu� gi� 蕐."
	};
	local strMain = {
		"Ta kh玭g th� khoanh tay ng nh譶, ph秈 t譵 c竎h c鴘 Trung Nguy猲 th玦!",
		"S� ph薾 do tr阨, ngi ng qu� lo l緉g! Чt c蕄 10 quay l筰 t譵 ta.",
		"Nh蕋 nh v穘 b鑙 s� quay l筰!"
	};

	TE_SetTeachAdd();
	TaskTip("Luy謓 n c蕄 10 t譵 Tri謚 Di猲 Ni猲");
	GivePlayerExp(SKeyXinShou,"zhaoyannian_wotou")
	TE_Talk("",strMsg);
	TE_Talk("", strMain);
end;

function task_023_00()

	local strMain = {
		"Kh� l緈! Kh玭g l祄 ta th蕋 v鋘g.",
		"Ta c� 3 b鴆 th� nh� mang cho <color=yellow>D� T萿<color>. L祄 phi襫 b籲g h鱱 qu�!",
		"S� kh玭g l祄 ti襫 b鑙 th蕋 v鋘g!"
	}
	TE_Talk("task_023_01",strMain);
end;

-- 与赵延年对话结束后改变任务变量：24
-- 给予玩家三封信
function task_023_01()
	TE_SetTeachAdd();
	AddItem(2,0,49,3);
	TaskTip("Tri謚 Di猲 Ni猲 nh� mang 3 b鴆 th� cho D� T萿");
end;


function task_024_00()

	local strMain = {
		"V� r錳 �? Ngi bi誸 Tri謚 Di猲 Ni猲 l� ai kh玭g?",
		"V穘 b鑙 kh玭g bi誸!",
		"Tri謚 Di猲 Ni猲 v鑞 ngi ho祅g t閏, do ch竛 c秐h tranh quy襫 ch鑞 ho祅g cung m� quy誸 nh b� h誸 danh l頸, phi猽 b箃 giang h�.",
		"Th� ra l� v藋!",
		"<color=green>D� T萿<color>: Hi謓 t筰 ngi  c� ch髏 th祅h t鵸, n誹 mu鑞 ti誴 t鬰 h穣 n Th藀 Чi <color=yellow>M玭 Ph竔<color> h鋍 t藀 l辌h luy謓. D� c� kh� kh╪ th� n祇, h穣 ki猲 tr� ti誴 t鬰.",
		" t� ti襫 b鑙!"
	}
	TE_Talk("task_024_01",strMain);
end;


function task_024_01()

	local strMain = {
		"Ngi gi髉 ta chuy觧 3 b鴆 th� c馻 Tri謚 Di猲 Ni猲 頲 kh玭g?",
		"Л頲 th玦! Nh璶g mang n cho ai v藋?",
		"Tri謚 Di猲 Ni猲 lo c竎 a phng x秠 ra <color=yellow>bi課 c�<color>, cho n猲 mu鑞 li猲 l筩 c竎 v� sau. <color=yellow>Kh蕌 Chu萵<color> ngi ch輓h tr鵦 hi謓 產ng l祄 quan � <color=yellow>Bi謓 Kinh<color>; <color=yellow>Ph筸 Tr鋘g Y猰<color> v╪ quan hi謓 � <color=yellow>Nam Th祅h Й<color>; <color=yellow>Vng Nghi謕 V�<color> thng gia s祅h s� hi謓 � <color=yellow>Tuy襫 Ch﹗<color>.",
		"Ch� c莕 mang th� n cho b鋘 h� l� Л頲! Зy ta c� ch髏 qu� t苙g ngi, 甶 阯g c萵 th薾 nh�!",
		"Xin 產 t�! V穘 b鑙 甶 y."
	}
	TE_Talk("task_024_02",strMain);
end


-- 与野叟对话结束后改变任务变量：25
function task_024_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Chuy謓 giang h�");
	TaskTip("Ho祅 th祅h nhi謒 v� T﹏ th� c� th� phi猽 b箃 giang h�!");
	SetTask(130,1); --王业伟
	SetTask(131,1); --寇准
	SetTask(132,1); --范仲淹
end;


-- 放弃做教育任务
function task_giveout()
--	TE_SetTeachState(23);
	Say("Th蕐 ngi b秐 l躰h h琻 ngi, l穙 y kh玭g c莕 d箉 nhi襲, v� sau 甶襲 g� kh玭g hi觰 c� th� n t譵 ta.", 0);
end;

-- 什么也不做的空函数
function task_exit()

end;






-- 基本操作
function Teach_Basic()

	local strMain = {
		"D飊g chu閠 ch� v祇 b蕋 k� n琲 n祇 trong b秐   di chuy觧 nh﹏ v藅. N誹 kh玭g x竎 nh 頲 v� tr�, m� <color=yellow>B秐  nh�<color>, d蕌 ch蕀 <color=yellow>v祅g<color> b猲 trong ch� cho v� tr� c馻 ngi ch琲.",
		"Ra ngo礽 th祅h n誹 kh玭g may ch� chu閠 l猲 qu竔, nh﹏ v藅 s� t� ng nh qu竔 li猲 t鬰, c莕 ch� �!",
	}
	TE_Talk("task_000_okay",strMain);
end;

-- 人物等级提升
function Teach_Level()

	local strMain = {
		"Nh﹏ v藅 d飊g <color=yellow>觤 kinh nghi謒<color>  t╪g c蕄. Nh蕁 <color=yellow><F3><color> m� Giao di謓 trang b� nh﹏ v藅 s� th蕐 <color=yellow>n髏 t╪g c蕄<color>. Khi 甶觤 kinh nghi謒 l韓 h琻 kinh nghi謒  t╪g c蕄, c� th� <color=yellow>t╪g c蕄 nh﹏ v藅<color>. Sau khi t╪g c蕄 nh﹏ v藅 s� c� <color=yellow>觤 ti襪 n╪g<color>. Ъng c蕄 c祅g cao 甶觤 ti襪 n╪g c祅g nhi襲.",
		"C� nhi襲 c竎h  nh薾 <color=yellow>觤 kinh nghi謒<color>, nh� nh qu竔, l祄 nhi謒 v�, b� quan tu luy謓 th薽 ch� truy襫 c玭g...Kinh nghi謒 hi謓 t筰 秐h hng ng c蕄 v� k� n╪g nh﹏ v藅, n猲 c莕 ch� � t� l� ph﹏ b� c﹏ b籲g!"
	}
	TE_Talk("task_000_okay",strMain);
end;

-- 介绍潜能点分配
function Teach_Point()

	local strMain = {
		"Nh﹏ v藅 c� 5 ti襪 n╪g: <color=yellow>S鴆 m筺h<color>, <color=yellow>N閕 c玭g<color>, <color=yellow>G﹏ c鑤<color>, <color=yellow>Th﹏ ph竝<color>, <color=yellow>Linh ho箃<color>.",
		"<color=yellow>S鴆 m筺h<color> quy誸 nh nh ngo筰 c玭g v� s鴆 l鵦; <color=yellow>N閕 c玭g<color> quy誸 nh n閕 l鵦, nh n閕 c玭g v� ph遪g th� n閕.",
		"<color=yellow>G﹏ c鑤<color> quy誸 nh sinh l鵦 v� ph遪g th� ngo筰; <color=yellow>Th﹏ ph竝<color> quy誸 nh n� tr竛h, ch輓h x竎 v� t鑓  nh; <color=yellow>nh譶 r�<color> quy誸 nh t蕁 c玭g ch� m筺g v� t� ng n� tr竛h, 秐h hng ch輓h x竎 v� t鑓  nh.",
		" LiT﹏ th� n猲 t╪g nhi襲 v祇 <color=yellow>S鴆 m筺h<color> v� <color=yellow>G﹏ c鑤<color>."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- 介绍赚钱
function Teach_Earn()

	local strMain = {
		"Ngi c� th� ra ngo礽 th祅h nh qu竔 mang v藅 ph萴 v� b竛 cho c竎 ch� ti謒 ho芻 l祄 m閠 v礽 nhi謒 v� n gi秐. <color=yellow>B竎h Hi觰 Sinh<color> trong th祅h c� c﹗ h醝 cho T﹏ th�, p ng s� 頲 ph莕 thng. B猲 c筺h  tri襲 nh c遪 ph竔 Kh﹎ Sai i th莕 ti誴 t� T﹏ th�, nh� n緈 b総 c� h閕 nh�!",
		"дn <color=yellow>c蕄 10<color> c� th� mua b竛, v薾 ti猽, t譵 ki誱 kho b竨, nh l玦 i..."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- 介绍拜入门派
function Teach_Faction()

	local strMain = {
		"Hi謓 c竎 m玭 ph竔 產ng thu nh薾  t�, ta th蕐 ngi t� ch蕋 c騨g kh玭g t�, ch� c莕 c� g緉g luy謓 n c蕄 10 i tho筰 v韎 <color=yellow>S� gi� m玭 ph竔<color> l� c� th� gia nh藀.",
		"M鏸 m玭 ph竔 c� hng tu luy謓 kh竎 nhau, c莕 t譵 hi觰 k� c s綾 c馻 h�."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- 介绍当前能做的事情
function Teach_Something()

	local strMain = {
		"Ngi m韎 ra giang h� c莕 <color=yellow>Giao l璾<color> nhi襲 v韎 ngi trong th祅h!",
		"Ngi c� th� ra ngo礽 nh qu竔, nh璶g kh玭g n猲 甶 qu� xa v� n琲  qu竔 r蕋 m筺h, n誹 l� b� thng v� t譵 ta tr� li謚 mi詎 ph�. T鑤 nh蕋 甶 c飊g ng i.",
		"N誹 c� g緉g ho祅 th祅h nhi謒 v� hng d蒼 T﹏ th� s� c� l頸 cho ngi, c莕 ch� � nh鱪g c﹗ th玭g b竜 b猲 di ho芻 nh蕁 <color=yellow><F11><color>  xem hng d蒼."
	}
	TE_Talk("task_000_okay",strMain);
end;





-- 六个问答题的内容
function Teach_Qustion_001()
	Say("Gi� ta s� h醝 ngi m閠 v礽 v蕁 , c﹗ h醝 1: Hi謓 c� m蕐 i ph竔 thu nh薾  t�?",4,"C鰑 i m玭 ph竔/Teach_Qustion_Error","B竧 i m玭 ph竔/Teach_Qustion_Error","Th藀 i m玭 ph竔/Teach_Qustion_002","Tam i m玭 ph竔/Teach_Qustion_Error");
	return
end

function Teach_Qustion_002()
	Say("Tr� l阨 t鑤 l緈! C﹗ h醝 ti誴 theo: Ki誱 ph竝 V� ng xu蕋 th莕 nh藀 qu� do  t� o gia hay  t� t鬰 gia luy謓?",3,"Чo gia  t�/Teach_Qustion_003","T鬰 gia  t�/Teach_Qustion_Error","C� hai u ng/Teach_Qustion_Error");
	return
end

function Teach_Qustion_003()
	Say("Kh� l緈! C﹗ h醝 3: Л阯g M玭 頲 xem l� gia t閏 m玭 ph竔, v藋 ngi ph� tr竎h m玭 ph竔 l� ai?",4,"M玭 ch�/Teach_Qustion_Error","L穙 l穙/Teach_Qustion_004","Chng m玭/Teach_Qustion_Error","T鎛g qu秐/Teach_Qustion_Error");
	return
end

function Teach_Qustion_004()
	Say("C﹗ h醝 ti誴 theo: е t� t鬰 gia Nga My s� d鬾g binh kh� n祇?",4,"Th輈h/Teach_Qustion_Error","Ki誱/Teach_Qustion_Error","C莔/Teach_Qustion_005","B髏/Teach_Qustion_Error");
	return
end

function Teach_Qustion_005()
	Say("ng r錳! C﹗ h醝 5: V� c玭g Thi誹 L﹎ tinh th﹎ kh� 畂竛, 72 tuy謙 k� danh ch蕁 thi猲 h�. V藋 Thi誹 L﹎ c� m蕐 hng tu luy謓?",4,"M閠/Teach_Qustion_Error","Hai/Teach_Qustion_Error","Ba/Teach_Qustion_006","B鑞/Teach_Qustion_Error");
	return
end

function Teach_Qustion_006()
	Say("C﹗ h醝 cu鑙 c飊g: Nghe n鉯  t� C竔 Bang c� � Y, T辬h Y, v藋  t� T辬h Y tu luy謓 v� c玭g n祇?",4,"C玭 ph竝/Teach_Qustion_Error","Chng ph竝/task_017_01","Thu莕 dng/Teach_Qustion_Error","B蓎/Teach_Qustion_Error");
	return
end

function Teach_Qustion_Error()
	Say("Nh璶g ta nghe ngi ta n鉯 kh玭g ph秈 nh� v藋, ngi th� v� xem l筰!",1,"Л頲! в ta xem l筰!/task_exit");
end
