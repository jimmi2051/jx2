-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理10，45，50级任务过程处理文件
-- By StarryNight
-- 2005/12/29 PM 16:02

--十一月廿九 丁亥土井闭日  
--宜：  裁衣、筑堤、修仓、修造、动土、上梁、补塞、作灶  
--忌：  理发、嫁娶  

-- 昨晚小偷进屋，室友稍有损失，年关难过啊……

-- ======================================================

-- 引用剧情任务文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--领取女商人郑贯之任务
function task_000_00()
	
local strSelect = {
	"Ta th蕐 <sex> th﹏ th� kh玭g t�! C� th� gi髉 ti觰 n� m閠 vi謈 nh� kh玭g?",
	"Ta 甶 l筰 trong giang h� c騨g  nhi襲, c� nng c� vi謈 g� c莕 gi髉 xin c� n鉯 nh璶g ph秈 t鑞 15 Kim./Accept_Task_000",
	"Th藅 ng筰 qu�, b﹜ gi� ta c� vi謈 r錳./Task_Exit"
	};

	SelectSay(strSelect)
	
end;

function Accept_Task_000()

local strTalk = {
	"N誹 v藋 phi襫 b籲g h鱱 m閠 chuy課 nh�!",
	"Ti觰 n� l� Tr辬h Qu竛 Chi l莕 n祔 n Чi L� bu玭 b竛, kh玭g may b� ngi c馻 Xi H醓 gi竜 cp m蕋 dc li謚. C� th� gi髉 ta n Th髖 Y猲 M玭 甧m 15 dc li謚 v� kh玭g?",
	"Chuy謓 nh� th玦 m�!"
};
	if (GetCash() >= 150000) then
		Pay(150000)
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV10_ID,1);
		CreateTrigger(0,250,KILL_DL_POINSONBEE);
		TaskTip("Gi髉 Tr辬h Qu竛 Chi t譵 dc li謚.");
		Msg2Player("Gi髉 Tr辬h Qu竛 Chi t譵 dc li謚.");
	elseif ( GetCash() < 150000  ) then
			Talk(1,"","Tr阨! Xem b� d筺g ngi m閠 xu d輓h t骾 c騨g kh玭g c� �?")		
	end
end;

--已经领取了女商人任务	
function task_001_00()
	
local nNum = GetItemCount(2,0,362);
local strTalk_1 = {
	" t�! Phi襫 <sex> gi髉 ta t譵 15 dc li謚."
};
local strTalk_2 = {
	"Ta  t譵  {15 dc li謚}",
	"Nhanh nh� v藋  v� r錳 �? Nh璶g ta v鮝 ph竧 hi謓 h鉧 n mua h祅g  b� Xi H醓 Y猽 N� l蕐 甶. <sex> c� th� gi髉 ta 甧m v� 頲 kh玭g?",
	"е t� tu﹏ l謓h!"
};

	if nNum >= 15 then
		SetTask(TASK_DL_LV10_ID,2);
		DelItem(2,0,362,15);
		RemoveTrigger(GetTrigger(KILL_DL_POINSONBEE));
		TalkEx("",strTalk_2);
		TaskTip("дn Th髖 Y猲 t譵 Xi H醓 Y猽 N� (167.196) l蕐 h鉧 n.");	
		Msg2Player("дn Th髖 Y猲 t譵 Xi H醓 Y猽 N� (167.196) l蕐 h鉧 n.");
		GivePlayerAward("Level_10","xn_step_1");
		GivePlayerExp(SkeyDali,"zhaohuiyaocai")
		return
	--补发触发器
	elseif GetTrigger(KILL_DL_POINSONBEE) == 0 then
		CreateTrigger(0,250,KILL_DL_POINSONBEE);
		TalkEx("",strTalk_1);
		TaskTip("Gi髉 Tr辬h Qu竛 Chi t譵 dc li謚.");
		Msg2Player("Gi髉 Tr辬h Qu竛 Chi t譵 dc li謚.");
		return
	else
		TalkEx("",strTalk_1);
	end;
	
end;

--帮郑贯之找回丢失的货单
function task_002_00()

local strTalk = {
	"N誹 <sex> kh玭g t譵 頲 h鉧 n th� xem nh� l莕 n祔 ta n Чi L� c玭g c鑓 r錳."
} 	
	TalkEx("",strTalk);
	return
end;


--已经找回丢失的货单
function task_003_00()

local strTalk = {
	"C� nng xem y c� ph秈 l� {h鉧 n} c馻 c� kh玭g?",
	"ng r錳.  t� <sex>! Ch髏 th祅h � xin nh薾 cho!",
	"Ngh� c騨g k� l�, Xi H醓 gi竜 cp dc li謚 c馻 ta  l祄 g� ch�?",
	"C� c騨g kh玭g bi誸 nguy猲 nh﹏ v� sao �?",
	"Ta l� ngi H竛, m韎 n Чi L� l祄 ╪ n猲 c騨g kh玭g hi觰 t譶h h譶h � y l緈. Nh璶g nghe n鉯 n誹 c� g� li猲 quan n Xi H醓 gi竜 th� c� th� t譵 Qu鑓 c玭g Cao Th╪g Tuy襫  h醝.",
	"Л頲! в ta 甶 h醝 xem."
};
	DelItem(2,0,363,1);
	SetTask(TASK_DL_LV10_ID,4);
	TalkEx("",strTalk);
	TaskTip("дn Чi L� t譵 Qu鑓 c玭g Cao Th╪g Tuy襫");	
	Msg2Player("дn Чi L� t譵 Qu鑓 c玭g Cao Th╪g Tuy襫");
	GivePlayerAward("Level_10","xn_step_2","weapon","Level_10");
	GivePlayerExp(SkeyDali,"zhaohuihuodan")
end;


--领取苗岭信使任务1
function task_004_00()
	--大于45级才能领取任务
	if GetLevel() >= 45 then
		local strTalk = {
			"Tr辬h c� nng, l﹗ qu� kh玭g g苝, bu玭 b竛 th� n祇?",
			"<sex> c� gi髉 ta h醝 th╩ t譶h h譶h c馻 Xi H醓 gi竜 kh玭g?",
			"C� nng g莕 y c� nghe tin g� kh玭g?",
			"<sex> n th藅 ng l骳! M蕐 h玬 trc ta c� nghe m閠 thng nh﹏ n鉯 Xi H醓 gi竜 thu閏 � man i l藀 v韎 B筩h t閏. Nh璶g Чi L� l� do t� ti猲 c馻 B筩h t閏 g莥 d鵱g n猲.",
			"Th� ra l� v藋, th秓 n祇 h� lu玭 ch鑞g l筰 ho祅g t閏. Ta m韎 t� {Mi猽 L躰h} v�, nh鱪g ngi �  h譶h nh� c騨g c� quan h� v韎 {Xi H醓 gi竜}, h� mu鑞 ch鑞g l筰 Ho祅g д."
			}
			TalkEx("task_004_01",strTalk);
			return	
	else
		local strTalk = {
			"H玬 nay ta b薾 r錳. <sex> h玬 kh竎 l筰 n nh�!"
		}
		TalkEx("",strTalk);	
	end;
end;

--领取苗岭信使任务2
function task_004_01()

local strTalk = {
	"Nghe n鉯 T輓 s� c馻 Mi猽 L躰h � Y課 T� ng t莕g 1, may ra c� th� t譵 頲 ch髏 manh m鑙",
	"Kh玭g c� l� do g� n h醝 tin, e l� kh玭g 頲 r錳!",
	"Mu鑞 t譵 hi觰 m鑙 quan h� gi鱝 Mi猽 L躰h v� Xi H醓 gi竜 ch� c遪 c竎h l� cp th�, nh璶g nh� l� ng l祄 t鎛 h筰 n t輓h m謓h ch髇g.",
	"V藋 c騨g 頲! Nh璶g l祄 sao  t譵 ch髇g?",
	"Trc ti猲 h穣 n Y課 T� ng t莕g 1 t譵 10 t蕀 Da hu, ta s� gi髉 ngi l祄 t輓 hi謚 c馻 Mi猽 L躰h. Sau  quay l筰 Y課 T� ng t莕g 1, ch� c莕 ngi th鎖 l猲 th� Mi猽 L躰h L鵦 S� s� xu蕋 hi謓.",
	"Ta 甶 ngay y.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ID,7);
	SetTask(TASK_DL_LV45_ID,1);
	CreateTrigger(0,256,KILL_DL_MLHY);
	TaskTip("дn Y課 T� ng t莕g 1 nh Mi猽 L躰h H� 蕁 thu th藀 10 Da hu!");	
	Msg2Player("дn Y課 T� ng t莕g 1 nh Mi猽 L躰h H� 蕁 thu th藀 10 Da hu!");
	GivePlayerExp(SkeyDali,"dalihanren")
end

--已经领取苗岭信使任务
function task_005_00()

local strTalk = {
			"дn Y課 T� ng t莕g 1 thu th藀 10 t蕀 da hu",
				}
	if GetItemCount(2,0,366) >= 10 then
		strTalk = {
			"<sex>  t譵  r錳 �?",
			"{10 t蕀 Da hu} y!",
			"T鑤 qu�! Ta l藀 t鴆 l祄 T輓 ti猽 y. <sex> i ta m閠 l竧 nh�!.",
			"�",
			"Xong r錳. <sex> h穣 n Y課 T� ng d飊g T輓 ti猽 n祔 th鎖 l猲 l祄 t輓 hi謚 l藀 t鴆 T輓 s� Mi猽 L躰h s� xu蕋 hi謓. Nh璶g <sex> ph秈 c萵 th薾!",
			"Ta s� ch� � chuy謓 n祔.",
			}
		RemoveTrigger(GetTrigger(KILL_DL_MLHY));
		DelItem(2,0,366,10);--删去麂皮
		--得到召唤苗岭力士的哨子
		AddItem(2,0,367,1,1);
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV45_ID,2);
		Msg2Player("дn Y課 T� ng t莕g 1 d飊g ti課g s竜 l祄 t輓 hi謚 g鋓 s� gi�.");
		TaskTip("дn Y課 T� ng t莕g 1 d飊g ti課g s竜 l祄 t輓 hi謚 g鋓 s� gi�.");
		GivePlayerAward("Level_45","xn_step_1");
		GivePlayerExp(SkeyDali,"nipixinshao")
		return
	elseif GetTrigger(KILL_DL_MLHY) == 0 then
		TalkEx("",strTalk);
		CreateTrigger(0,256,KILL_DL_MLHY);--补发苗岭护印死亡触发器
		TaskTip("дn Y課 T� ng t莕g 1 nh Mi猽 L躰h H� 蕁 thu th藀 10 Da hu!");	
		Msg2Player("дn Y課 T� ng t莕g 1 nh Mi猽 L躰h H� 蕁 thu th藀 10 Da hu!");
		return
	else
		TalkEx("",strTalk);
		return
	end
end

--已经领取哨子
function task_006_00()

local strTalk = {
	"дn Y課 T� ng t莕g 1 d飊g t輓 hi謚, n誹 v蒼 ch璦 th蕐 v藅 ph萴 xin ki觤 tra l筰 rng",
	}
	if BigGetItemCount(2,0,367) < 1 then
		if GetFreeItemRoom() >= 1 and GetMaxItemWeight() - GetCurItemWeight() > 1 then
			AddItem(2,0,367,1,1);
			TalkEx("",strTalk)
		else 
			strTalk = {
				"Xin ki觤 tra l筰 h祅h trang c遪  kho秐g tr鑞g, sau  n nh薾 v藅 l祄 t輓 hi謚",
					}
			TalkEx("",strTalk);
		end
	else
		TalkEx("",strTalk)
	end
	
	return
end

--已经打败苗岭力士取回信件
function task_007_00()

local strTalk = {
	"<sex> v� r錳 �?",
	"Ta  l蕐 頲 b鴆 th�, nh璶g trong 蕐 vi誸 g� ta kh玭g hi觰.",
	"Лa ta xem! Ch綾 ta c騨g ph秈 n Чi L�  h鋍 ch� n祔 qu�!",
	"�",
	"Qu� nhi猲 l� Mi猽 L躰h v� Xi H醓 gi竜 c� quan h� v韎 nhau, nh璶g trong th� n鉯 g� ta c騨g kh玭g hi觰. <sex>  ta nh� ngi phi猲 d辌h , c� g� s� th玭g b竜 <sex> sau.",
	"V蕋 v� cho c� nng r錳.",
	}
	DelItem(2,0,369,1);--删掉信件
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV45_ID,4);
	GivePlayerAward("Level_45","xn_step_2","weapon","Level_46");
	GivePlayerExp(SkeyDali,"miaolinglishi")
	return
end


--已经把信件交给郑贯之后
function task_008_00()

	if GetLevel() >= 50 then
		local strTalk = {
			"Tr辬h c� nng, b鴆 th� 蕐 th� n祇 r?",
			"<sex> y猲 t﹎, tuy l� xem kh玭g hi觰, nh璶g ta c� bi誸 m閠 ngi c� th� c 頲 th� n祔.",
			"L� ai v藋?",
			"L� Tr莕 L藀 Ho祅h, g鑓 l� ngi H竛 nh璶g do n Чi L� c騨g  l﹗ n猲 hi觰 頲 ng玭 ng� � .",
			"T鑤 qu�, ta l藀 t鴆 甶 t譵 玭g 蕐!",
			}
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV45_ID,5);
		SetTask(TASK_DL_LV50_ID,1);
		TaskTip("дn ph輆 b綾 c馻 th祅h Чi L� t譵 Tr莕 L藀 Ho祅h.");	
		Msg2Player("дn ph輆 b綾 c馻 th祅h Чi L� t譵 Tr莕 L藀 Ho祅h.");
	else
		local strTalk = {
			"<sex> tranh th� th阨 gian n祔 luy謓 c玭g 甶.",
			}
		TalkEx("",strTalk);
		return
	end
end

--已经领取50级任务之后
function task_009_00()

local strTalk = {
	"Tr莕 L藀 Th祅h � ph輆 b綾 th祅h Чi L�.",
	}
	TalkEx("",strTalk);
	return
end

--已经打败苗岭首领并和苗岭族长对话后
function task_010_00()

local strTalk = {
	"<sex> v� r錳 �?",
	"Ta ngh� Xi H醓 Gi竜 v� ﹏ o竛 c馻 b� t閏 m� t竎 lo筺, m鬰 ch l�  g﹜ 竝 l鵦 ph� ng玦 琻g kim Ho祅g . Ta nghe T閏 trng Mi猽 L躰h n鉯 筺 Th� ch輓h l� � Man c� li猲 quan huy誸 th鑞g v韎 B筩h T閏. V� v藋 Xi H醓 gi竜 kh玭g nh鱪g ph秐 i m� c遪 駈g h� 筺 Th�.",
	"H� c遪 n鉯 g� n鱝?",
	"H� b秓 ta n g苝 {Cao Qu秐 Qu� T閏}  h醝.",
	"V藋 ngi mau 甶 h醝 甶. Ngi m� Mi猽 L躰h nh綾 n  ngi c� quen kh玭g?",
	"Ph秈 h醝 {Cao Qu秐 Qu� T閏} , ta c遪 ch璦 bi誸 {Qu鑓 C玭g Cao Th╪g Tuy襫} n鱝 k譨.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV50_ID,7);
	TaskTip("дn g苝 Cao Th╪g Tuy襫");	
	Msg2Player("дn g苝 Cao Th╪g Tuy襫");
	GivePlayerAward("Level_50","xn_step_4");
	GivePlayerWeapon("Level_52",1);
	GivePlayerExp(SkeyDali,"wujikeshi")
	return
end

--未与高升泉对话
function task_011_00()

local strTalk = {
	"V藋 ngi mau 甶 g苝 Qu鑓 c玭g Cao Th╪g Tuy襫, 玭g 蕐 � trong th祅h Чi l�.",
	}
	TalkEx("",strTalk);
	return
end

--领取郑贯之债款任务
function task_012_00()

local strTalk = {};
 
	if Pay(100000) == 1 then
			
		strTalk = {
			"Tr辬h c� nng, {фng Qu鑓 S瓆 nh� ta chuy觧 {ti襫 h祅g} cho c�.",
			"Ч t� <sex>.",
			"Ngi v鮝 m韎 nh b筰 D� Xoa �? V蕋 v� cho ngi qu�!",
			"Sao c� nng bi誸 chuy謓 n祔? Ta v鮝 甶 g苝 {фng Qu鑓 S瓆",
			"<sex> c� th� gi髉 ta 頲 kh玭g?",
			"Xin c� n鉯",
			"V� nng � Th祅h Й v� Bi謓 Kinh c遪 n� ta m閠 m鉵 ti襫, ngi c� th� 甶 l蕐 v� gi髉 ta kh玭g?",
			"Л頲! Ta s� 甶 ngay!",
			"M鏸 ngi c遪 n� ta 10 lng, phi襫 b籲g h鱱 nh�!",
			}
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV60_ID,9);
		SetTask(TASK_DL_LV60_1_ID,1);
		SetTask(TASK_DL_LV60_2_ID,1);
		Msg2Player("Gi髉 Tr辬h Qu竛 Chi n Bi謓 Kinh v� Th祅h Й i n�.");
		TaskTip("Gi髉 Tr辬h Qu竛 Chi n Bi謓 Kinh v� Th祅h Й i n�.");
		GivePlayerExp(SkeyDali,"daikuanzhuanjiao")
	else
		strTalk = {
			"Sao? Ti襫 b� m蕋 r錳?",
			}
		TalkEx("",strTalk);
	end;
end

--已经领取郑贯之债款任务后
function task_013_00()

local strSay = {
		"C� i 頲 n� kh玭g?",
		"L蕐 頲 r錳!/task_015_00",
		"V蒼 ch璦 t譵 頲./Task_Exit"
	}

	SelectSay(strSay);
	return
end

--已经领取了郑贯之的债款任务与成都舞娘对话
function task_014_11()

local strTalk = {
	"Ti襫 n� c馻 {Tr辬h Qu竛 Chi 祡? Ngi n鉯 l� ta qu猲 r錳.",
	"厖厖",
	"M蕐 h玬 trc 甶 ngang qua {觤 Thng s琻} b� {Ng鬰 H醓 Cu錸g Nh﹏} nh l衝! C� th� gi髉 ta h� t猲 n祔 kh玭g?",
	"Л頲! в ta gi髉!",
	"{Ng鬰 H醓 Cu錸g Nh﹏} � {觤 Thng S琻}.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_1_ID,2);
	Msg2Player("дn 觤 Thng S琻 nh b筰 Ng鬰 H醓 Cu錸g Nh﹏.");
	TaskTip("дn 觤 Thng S琻 nh b筰 Ng鬰 H醓 Cu錸g Nh﹏.");
	return
end

--未杀死狱火狂人
function task_014_21()

local strTalk = {
	"{Ng鬰 H醓 Cu錸g Nh﹏} � {觤 Thng S琻}.",
	}
	TalkEx("",strTalk);
	return
end

--已杀死狱火狂人任务
function task_014_31()

local strTalk = {
	"Ta  nh b筰 h緉 r錳.",
	"T鑤 qu�, {10 lng} y. Xin nh薾 l蕐!",
	}
	GivePlayerAward("Level_62","xn_step_1");
	GivePlayerExp(SkeyDali,"chengduwuniang")
--	Earn(100000);
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_1_ID,4);
		--两个舞娘任务均完成后
		if GetTask(TASK_DL_LV60_2_ID) == 3 then
			SetTask(TASK_DL_LV60_1_ID,5);
			SetTask(TASK_DL_LV60_2_ID,4);
			SetTask(TASK_DL_LV60_0_ID,1);
			Msg2Player("Х i 頲 n�, quay l筰 t譵 Tr辬h Qu竛 Chi.");
			TaskTip("Х i 頲 n�, quay l筰 t譵 Tr辬h Qu竛 Chi.");
		end	
	return
end

--已完成杀死狱火狂人任务后舞娘对话
function task_014_41()

local strTalk = {
	"Ch� ph秈 ngi  l蕐 頲 n� r錳 sao, ta ch糿g c遪 n� n莕 g� v韎 h� Tr辬h 蕐 c�.",
	}

	TalkEx("",strTalk);
	return
end

--领取收集血鸦羽任务
function task_014_12()

local strTalk = {
	"Ngi n gi髉 {Tr辬h Qu竛 Chi} i n�.",
	"ng v藋, c� nng c� th� tr� n� ch�?",
	"Th� n祔 v藋, ta 產ng mu鑞 may b� trang ph鬰 m韎 nh璶g c遪 thi誹 {10 Huy誸 Nha V騷, c� th� gi髉 ta kh玭g?",
	"Л頲 th玦.",
	"дn {B筩h Th駓 ng t莕g 2} nh {竎 l祡 c� th� t譵 頲 {Huy誸 Nha V騷.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_2_ID,2)
	--CreateTrigger(0,261,KILL_DL_BLOODCROW);
	Msg2Player("дn B筩h Th駓 ng t莕g 2 nh 竎 l� l蕐 10 Huy誸 Nha V�.");
	TaskTip("дn B筩h Th駓 ng t莕g 2 nh 竎 l� l蕐 10 Huy誸 Nha V�.");
	return

end	

--未收集10个血鸦羽
function task_014_22()

local strTalk = {
	"дn {B筩h Th駓 ng t莕g 2} nh {竎 l祡 c� th� t譵 頲 {Huy誸 Nha V騷.",
	}

	if GetItemCount(2,1,285) >= 10 then
		DelItem(2,1,285,10);
		strTalk = {
			"Ta  t譵  {10 Huy誸 Nha V騷",
			"T鑤 qu�, 10 lng y, xin nh薾 l蕐!",
			}
--		Earn(100000);
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV60_2_ID,3);
		GivePlayerAward("Level_62","xn_step_2");
		GivePlayerExp(SkeyDali,"bianjingwuniang")
		--两个舞娘任务均完成后
		if GetTask(TASK_DL_LV60_1_ID) == 4 then
			SetTask(TASK_DL_LV60_1_ID,5);
			SetTask(TASK_DL_LV60_2_ID,4);
			SetTask(TASK_DL_LV60_0_ID,1);
			Msg2Player("Х i 頲 n�, quay l筰 t譵 Tr辬h Qu竛 Chi.");
			TaskTip("Х i 頲 n�, quay l筰 t譵 Tr辬h Qu竛 Chi.");
		end
		return
	end
	--补发触发器
	--if GetTrigger(KILL_DL_BLOODCROW) == 0 then
		--CreateTrigger(0,261,KILL_DL_BLOODCROW);
		--Msg2Player("前往白水洞二层从夜啼血鸦身上收集10个血鸦羽");
		--TaskTip("前往白水洞二层从夜啼血鸦身上收集10个血鸦羽");
	--end
	TalkEx("",strTalk);
end

--已完成汴京舞娘任务
function task_014_32()

local strTalk = {
	"Ch� ph秈 ngi  l蕐 頲 n� r錳 sao, ta ch糿g c遪 n� n莕 g� v韎 h� Tr辬h 蕐 c�.",
	}
	TalkEx("",strTalk);
	return
end

--把欠款还给郑贯之
function task_015_00()

local	strTalk = {};
	
	if Pay(200000) == 1 then
		strTalk = {
			" t�! Ta  thu th藀 頲 m閠 s� tin t鴆 c馻 Xi H醓 gi竜. Cao Qu鑓 C玭g c莕 g苝 <sex>, h穣 甶 t譵 玭g 蕐!",
			}
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV60_0_ID,2);
		SetTask(TASK_DL_LV60_1_ID,6);
		SetTask(TASK_DL_LV60_2_ID,5);
		GivePlayerAward("Level_62","xn_step_3");
		GivePlayerExp(SkeyDali,"shouhuidiaokuan")
	else
		strTalk = {
			"Hay l� 甶 阯g l祄 r韙 r錳",
		}
		TalkEx("",strTalk);
	end;
end


--完成郑贯之的货款任务后领取62级任务失踪的伙计
function task_016_00()

local strTalk = {
	"Tr辬h c� nng, c� tin t鴆 g� c馻 {Xi H醓 gi竜} kh玭g?",
	"M蕐 h玬 trc � Long Nh穘 ng t莕g 1 c� t藀 h頿 m閠 s� Xi H醓 Trng L穙, y l� nh鱪g nh﹏ v藅 ch� y誹 c馻 Xi H醓 gi竜. Ta  cho ngi n  d� la nh璶g kh玭g th蕐 tr� v�. L莕 n祔 phi襫 b籲g h鱱 nh�!",
	"{Long Nh穘 ng} � u?",
	"T� Чi L� 甶 v� ph輆 nam, n 觤 Thng s琻 th� nh譶 th蕐 Long Nh穘 ng.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV62_ID,1);
	Msg2Player("V祇 Long Nh穘 ng th╩ d�");
	TaskTip("V祇 Long Nh穘 ng th╩ d�");
	return
end

--未前往龙眼洞查看
function task_017_00()

local strTalk = {
	"T� Чi L� 甶 v� ph輆 nam, n 觤 Thng s琻 th� nh譶 th蕐 Long Nh穘 ng.",
	}

	TalkEx("",strTalk);
	return
end

--前往龙眼洞查看后回来汇报
function task_018_00()

local strTalk = {
	"<sex> v� r錳 �? T譶h h譶h �  th� n祇?",
	"{Long Nh穘 ng t莕g 1} kh緋 n琲 u l� {Kh玦 L鏸 чc Nh﹏}, trong ng c遪 c� m閠 s� {Xi H醓 Trng L穙}",
	"V藋 �?...<sex> c� th� gi髉 ta 頲 kh玭g?",
	"Tr辬h c� nng c� n鉯.",
	"<sex> c� th� gi髉 ta gi誸 Kh玦 L鏸 чc Nh﹏ v� Xi H醓 trng l穙 頲 kh玭g?",
	"Ta nh蕋 nh s� gi髉 c�.",
	"Xin <sex> gi髉 ta ti猽 tr�15 Kh玦 L鏸 чc Nh﹏ v� 15 Xi H醓 Trng L穙 � Long Nh穘 ng t莕g 1.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV62_ID,3);
	CreateTrigger(0,262,KILL_DL_CREATUREMAN);
	CreateTrigger(0,263,KILL_DL_CHIHUO_ELDER);
	Msg2Player("дn Long Nh穘 ng t莕g 1 gi誸 15 Kh玦 L鏸 чc Nh﹏ v� 15 Xi H醓 Trng L穙.");
	TaskTip("дn Long Nh穘 ng t莕g 1 gi誸 15 Kh玦 L鏸 чc Nh﹏ v� 15 Xi H醓 Trng L穙.");
	GivePlayerAward("Level_63","xn_step_1");
	GivePlayerExp(SkeyDali,"xunzhaohuoji")
	return

end

--补领傀儡毒人和蚩火长老触发器
function task_019_00()

local strTalk = {
	"Nh� <sex>n Long Nh穘 ng t莕g 1 gi誸 15 Kh玦 L鏸 чc Nh﹏ v� 15 Xi H醓 Trng L穙.",
	}

	if GetTrigger(KILL_DL_CREATUREMAN) == 0 then
		CreateTrigger(0,262,KILL_DL_CREATUREMAN);
		Msg2Player("дn Long Nh穘 ng t莕g 1 gi誸 15 Kh玦 L鏸 чc Nh﹏ v� 15 Xi H醓 Trng L穙.");
		TaskTip("дn Long Nh穘 ng t莕g 1 gi誸 15 Kh玦 L鏸 чc Nh﹏ v� 15 Xi H醓 Trng L穙.");
	end;
	if GetTrigger(KILL_DL_CHIHUO_ELDER) == 0 then
		CreateTrigger(0,263,KILL_DL_CHIHUO_ELDER);
		Msg2Player("дn Long Nh穘 ng t莕g 1 gi誸 15 Kh玦 L鏸 чc Nh﹏ v� 15 Xi H醓 Trng L穙.");
		TaskTip("дn Long Nh穘 ng t莕g 1 gi誸 15 Kh玦 L鏸 чc Nh﹏ v� 15 Xi H醓 Trng L穙.");
	end;
	
	TalkEx("",strTalk);
	return
end

--杀死傀儡毒人和蚩火长老后
function task_020_00()

local strTalk = {
	"Ta  thay c� nng b竜 th� cho {誱 H醓 K諁 r錳.",
	" t�! B筩h Doanh Doanh gi竜 ch� Ng� чc gi竜 cho ngi n t譵. <sex> mau n  m閠 chuy課!",
	"е t� tu﹏ l謓h!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV62_ID,5);
	Msg2Player("B筩h Doanh Doanh gi竜 ch� Ng� чc gi竜 ph竔 ngi n t譵 ngi.");
	TaskTip("B筩h Doanh Doanh gi竜 ch� Ng� чc gi竜 ph竔 ngi n t譵 ngi.");
	GivePlayerAward("Level_63","xn_step_2","weapon","Level_64");
	GivePlayerExp(SkeyDali,"huojishizhong")
end

--未去见五毒教教主
function task_021_00()

local strTalk = {
	"B筩h Doanh Doanh gi竜 ch� Ng� чc gi竜 cho ngi n t譵 ngi, ngi mau n  m閠 chuy課 甶.",
	}

	TalkEx("",strTalk);
	return
end

--收集完10张大理旧志后找郑贯之对话1
function task_022_00()

local strTalk = {
	"<sex> v蕋 v� qu�!",
	"Kh玭g c莕 kh竎h s竜, ta c� v礽 u mu鑞 n鉯 v韎 c� nng.",
	"<sex> n鉯 甶.",
	"Sao c� nng quan t﹎ n {Xi H醓 gi竜} n v藋?",
	"�, ngay khi ta v鮝 m韎 n Чi L� l祄 ╪  b� Xi H醓 gi竜 g﹜ kh� d� n猲 m鑙 h薾 n祔 kh� qu猲.",
	"V藋 sao c� nng kh玭g r阨 kh醝 y. {Чi L齷 nguy hi觤 nh� v藋 kh玭g ph秈 l� n琲 l祄 ╪ t鑤.",
	"Ta th輈h n琲 n祔, thi猲 th阨 a l頸 ta kh玭g mu鑞 r阨 kh醝 y.",
	"B雐 v� c� nng l� ngi {Чi L齷, ng kh玭g?",
	"�"
	}
	TalkEx("task_022_01",strTalk);
end

--收集完10张大理旧志后找郑贯之对话2
function task_022_01()

local strTalk = {
	"Th﹏ th� c馻 c� nng ta r蕋 r�. C� nng thu閏 {l鬰 i gia t閏} � {Чi L齷 n祔. L莕 n祔 {Чi L齷 n閕 lo筺 c� nng n y gi� l祄 ngi bu玭 b竛  theo d鈏 nh蕋 c� nh蕋 ng c馻 {Xi H醓 gi竜}. Ta n鉯 v藋 ng kh玭g?",
	"�",
	"<sex> kh玭g ng� l筰 hi觰 ta n v藋. Kh玭g sai, ta thu閏 h� Tr辬h, trong m閠 trong l鬰 i gia t閏 � y.",
	"厖厖",
	"Ta l韓 l猲 � Tuy襫 Ch﹗, nh璶g gia t閏 ta trc gi� r蕋 quan t﹎ n t譶h h譶h c馻 Чi L�. L莕 n祔 Чi L� n閕 lo筺 m韎 ph竔 ta n y  th╩ d� tin t鴆 c馻 Xi H醓 gi竜.",
	"Sao c竎 ngi l筰 quan t﹎ n {Xi H醓 gi竜} n v藋?",
	}
	TalkEx("task_022_02",strTalk);
end
	
--收集完10张大理旧志后找郑贯之对话3
function task_022_02()

local strTalk = {
	"V� Di s琻 thu閏 B綾 Tuy襫 Ch﹗ c� Lng Th駓 ng. Xi H醓 gi竜  thng xu蕋 hi謓 � , h醝 ra m韎 bi誸 ch髇g c� quan h� v韎 Ma H� La Ca.",
	"{Ma H� La Ca}?",	
	"Con ngi n祔 h譶h d竛g k� d�, u ngi th﹏ r緉. Ma H� La Ca l� t猲 m鋓 ngi g鋓  x璶g t鬾g h緉. Th鵦 ch蕋 h緉 l� m閠 trong nh鱪g hung th� gi誸 gia t閏 h� Tr辬h ta.",
	"Ch� tr竎h gia t閏 c� nng l筰 l璾 t﹎ n h� nh� v藋.",
	}
	TalkEx("task_022_03",strTalk);
end

--收集完10张大理旧志后找郑贯之对话4
function task_022_03()
local strTalk = {
	"ng v藋, m鬰 ch c馻 ta n Чi L� l莕 n莥  th玭g qua Xi H醓 gi竜 t譵 ra tung t輈h c馻 Ma H� La Ca.",
	"V藋 d遪g h� c� nng kh玭g c遪 o竛 h﹏ {Dng Gia} n鱝 ch�, kh玭g mu鑞 畂箃 l筰 ng玦 v� {ho祅g t閏 t� h� 祅} �?",	
	"N╩  Dng Gia  nh� Ha M� La Ca gi誸 s筩h t閏 Tr辬h, may ta tho竧 頲. Nh璶g chuy謓 n祔 c騨g  l﹗ r錳, h藆 nh﹏ c馻 Dng Gia kh玭g tr鵦 ti誴 l祄 chuy謓  ta kh玭g mu鑞 b竜 th� h�. Nh璶g c遪 t猲 qu竔 v藅 Ha M� La Ca th� su鑤 i n祔 ta kh玭g th� n祇 tha cho h緉.",
	"C� nng  t譵 ra tung t輈h g� c馻 {Ma H� La Ca} ch璦?",
	}
	TalkEx("task_022_04",strTalk);
end

--收集完10张大理旧志后找郑贯之对话5
function task_022_04()

local strTalk = {
	"...C�!",
	"Qu竔 v藅  hi謓 gi� � u?",
	"Ha M� La Ca r蕋 c� kh� n╪g h緉 產ng � ph輆 b綾 T﹜ Song B秐 N筽. H緉 頲 Xi H醓 gi竜 g鋓 n   ph鬰 h錳 s鴆 m筺h. Hi謓 gi� s鴆 l鵦 c馻 h緉 h錳 ph鬰 ch璦 頲 nhi襲. <sex> h穣 tranh th� th阨 gian n  nh b筰 h緉. Ti猽 tr� 頲 t猲 qu竔 v藅 n祔 c� gia t閏 h� Tr辬h ta su鑤 i ghi 琻 ngi.",
	"Qu竔 v藅  nguy hi觤 nh� v藋, ta nh蕋 nh ph秈 gi髉 c� nng r錳.",
	" t� <sex>! Ma H� La Ca hi謓 � ph輆 b綾 T﹜ Song B秐 N筽. T鑤 nh蕋 n猲 c� ng i h� tr�.",
	"Ta bi誸 r錳!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV75_ID,7);
	GivePlayerExp(SkeyDali,"zhengshihouren")
	Msg2Player("дn t﹜ Song B秐 N筽 gi誸 Ma H� La Ca.");
	TaskTip("дn t﹜ Song B秐 N筽 gi誸 Ma H� La Ca.");
	return
end

--未打败摩呼罗迦对话
function task_023_00()

local strTalk = {
	". <sex> n猲 c� s� h� tr� c馻 ng i!",
	}
	
	TalkEx("",strTalk);
	return
end

--打败摩呼罗迦后对话
function task_024_00()

local strTalk = {
	"Ngi  di謙 頲 Ma H� La Ca r錳 �?",
	"ng v藋.",
	"Ngi qu� l� h秓 h竛, c� Tr辬h t閏 ta mang 琻 <sex>.",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV75_ID,9);
	GivePlayerAward("Level_80","xn_step_1",nil,nil,"YunTie",2);
	GivePlayerWeapon("Level_76",1);
	GivePlayerExp(SkeyDali,"weizhengshifuchou")
	return
end


--空函数，不做任何事情	
function Task_Exit()
end;