
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 五毒门派任务实体处理脚本文件
-- Edited by Starry
-- 2006/02/09 PM 11:31

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\world\\task_head.lua");

--申请加入五毒
function task_000()

local strTalk = {
	"<sex> mu鑞 gia nh藀 b鎛 gi竜 ph秈 頲 s� ng � c馻 t� v� Qu� S�! H穣 甶 g苝 Th� t鋋 Qu� S� C﹗ S竎h trc!"
	}

	TalkEx("",strTalk);
	TaskTip("дn T﹜ B綾 Ng� чc Gi竜 t譵 Th� t鋋 Qu� S� C﹗ S竎h");
	Msg2Player("дn T﹜ B綾 Ng� чc Gi竜 t譵 Th� t鋋 Qu� S� C﹗ S竎h");
	SetTask(FN_WP,1);
end

-- 与勾册对话
function task_001()

local strTalk = {
		"Mu鑞 gia nh藀 Ng� чc gi竜? Hay l緈! Nh璶g ngi ph秈 vt qua v礽 th� th竎h, gi� h穣 甶 t譵 Phng Vi猲 Qu� S�!"
	}

	TalkEx("",strTalk);
	TaskTip("Qua ph遪g b猲 c筺h t譵 Phng Vi猲 Qu� S�");
	Msg2Player("Qua ph遪g b猲 c筺h t譵 Phng Vi猲 Qu� S�");
	SetTask(FN_WP,2);

end


-- 与方猿对话（未回答问题）
function task_002()

local strTalk = {
	"H�! Nh藀 gi竜 th� nh藀 gi竜! Kh玭g bi誸 Gi竜 ch� ngh� g�! Duy tr� truy襫 th鑞g c馻 b鎛 gi竜 c� g� kh玭g t鑤? C遪 nh c飊g b鋘 Thi誹 L﹎ x璶g huynh  g� , th藅 s�  l祄 tr竔 ch� � c馻 c竎 gi竜 ch� i trc.",
	"C﹗ S竎h Qu� S� n鉯 n y  kh秓 nghi謒 thng th鴆 v� l﹎, xin h醝 khi n祇 c� th� b総 u?",
	"L穙 C﹗ c騨g th藅 l�... R� r祅g ph秐 i chuy謓 thay gi竜 quy nh璶g l筰 kh玭g n鉯, c遪 gi髉 Gi竜 ch� s鯽 gi竜 quy. N鉯 l� l蕐 i cu閏 l祄 tr鋘g nh璶g gi竜 quy 頲 truy襫 t� i T� s� Ng� чc gi竜 n nay ch糿g l� kh玭g quan tr鋘g? Ta  ph� tr� qua 3 i Gi竜 ch�, ch璦 th蕐 ai nh� B筩h gi竜 ch駞�",
	"Xin h醝 v藋 c� c莕 ph秈 thi ki觤 tra?",
	"Л琻g nhi猲 ph秈 kh秓!"
	}
	TalkEx("task_003",strTalk);
end;

-- 与方猿对话（回答第一部分问题）
function task_003()

local strSay = {
	"D飊g ph輒 n祇  chuy觧 i gi鱝 ng v� ng錳?",
	"1.Ph輒 K./exam_fault1",
	"2.Ph輒 P/exam_fault1",
	"3.Ph輒 V/exam_pass1",
}
	SelectSay(strSay);
end	

--答对第1个问题后
function exam_pass1()

local strSay = {
	"Ph輒 chuy觧 i ch�  ch箉 t� ng l� ph輒 n祇?",
	"1.Ph輒 K./exam_fault1",
	"2.Ph輒 L/exam_pass2",
	"3.Ph輒 O/exam_fault1",
}
	SelectSay(strSay);
end	

--答对第2个问题后
function exam_pass2()

local strSay = {
	"Ph輒 nh苩 v藅 ph萴?",
	"1.Ph輒 Ctrl/exam_fault1",
	"2.Ph輒 Space/exam_pass3",
	"3.Ph輒 Enter/exam_fault1",
}
	SelectSay(strSay);
end

--答对第3个问题后
function exam_pass3()

local strTalk = {
	"Thng th鴆 v� l﹎ c騨g kh� y!"
	}
	TalkEx("task_004",strTalk);
	SetTask(FN_WP,3);
end;

--未答第4个问题前
function task_004()

local strSay = {
	"C﹗ h醝 cu鑙 c飊g, n╩ x璦 ta b� m閠 t猲 gian t芻 Thi誹 L﹎ nh m閠 c玭, n gi� m鏸 khi tr阨 m璦 l� l璶g m醝 ch﹏ 產u, ngi bi誸 h� ph竔 c馻 h緉 l� g�?",
	"1.Thi誹 L﹎ t鬰 gia/exam_pass4",
	"2.Thi誹 L﹎ thi襫 t╪g/exam_fault2",
	"3.Thi誹 L﹎ v� t╪g/exam_fault2",
	}
	SelectSay(strSay);
end	
	
--答对第4个问题后
function exam_pass4()

local strTalk = {
	"ng v藋! Ch輓h l� l穙 Huy襫 Bi Thi誹 L﹎ t鬰 gia. Th� n祔 ng祔 n祇 ch璦 tr� ta kh� m� vui 頲. Nh璶g ta  gi� r錳 cho n猲 thu nh薾 ngi l祄  t�, c� g緉g luy謓 v� c玭g sau n祔 thay ta tr� th�?",
	"Qu� S� y猲 t﹎! T筰 h� gia nh藀 Ng� чc gi竜 th�  l� ngi b鎛 gi竜, sau n祔 s� thay Qu� S� r鯽 h薾.",
	"T鑤 l緈! Gi� h穣 甶 t譵 V璾 Dung Qu� S�. H穣 men theo con 阯g nh� n ph輆 Йng s� g苝 h緉."
	}
	TalkEx("",strTalk);
	TaskTip("T譵 V璾 Dung Qu� S�");
	Msg2Player("T譵 V璾 Dung Qu� S�");
	SetTask(FN_WP,4);
end

--答错前3个问题后
function exam_fault1()

local strTalk = {
	"Sai r錳! Nh鱪g c﹗ n祔 kh玭g ph秈 ai c騨g tr� l阨 頲! Khi n祇 bi誸 r錳 h穣 n."
	}
	TalkEx("",strTalk);
end

--答错第4个问题后
function exam_fault2()

local strTalk = {
	"Sai r錳! H穣 nh� k�! K� nh ta m閠 c玭 l� Thi誹 L﹎ t鬰 gia, Thi誹 L﹎ t鬰 gia!"
	}
	TalkEx("",strTalk);
end

-- 与尤榕的对话1
function task_005()

local strTalk = {
	"Mu鑞 gia nh藀 b鎛 gi竜? Hay l緈! Ta th蕐 t� ch蕋 ngi c騨g kh�. Ta ng �!",
	"Kh玭g ph秈 c� v蕁  c莕 h醝?",
	"Thng th鴆 v� l﹎ trung nguy猲? Ta khinh! Ta c莕 g� ph秈 h鋍 h醝 b鋘 ch髇g?",
	"V藋 l� ngi ng � cho t筰 h� nh藀 gi竜?",
	"Л琻g nhi猲 kh玭g d� d祅g nh� v藋! Ngi a ta {1 lng b筩}! Gi竜 ph秈 c莕 ph秈 t鮪g bc ph竧 tri觧."
	}
	TalkEx("task_006",strTalk);
end

-- 与尤榕的对话2
function task_006()

local strSay = {
	"V藋 �!",
	"Лa 1 lng b筩/pay_money",
	"Kh玭g a/no_pay"
	}
	SelectSay(strSay);
end

--交一两银子给尤榕后
function pay_money()

local strTalk = {};
	
	if Pay(100) == 1 then	
		strTalk = {
			"H穣 甶 t譵 {T﹜ у Qu� S瓆 甶! g ta � {ph遪g b猲 c筺h}."
		}
		TalkEx("",strTalk);
		TaskTip("T譵 T﹜ у Qu� S�");
		Msg2Player("T譵 T﹜ у Qu� S�");
		SetTask(FN_WP,5);
	else
		strTalk = {
			"Kh玭g  ti襫 �? H穣 t譵 c竎h 甶! N誹 kh玭g s� kh玭g ch鴑g t� th祅h � mu鑞 nh藀 gi竜 c馻 ngi."
			}
		TalkEx("",strTalk);
	end
end

--不给尤榕银两
function no_pay()

local strTalk = {
				"Kh玭g  ti襫 �? H穣 t譵 c竎h 甶! N誹 kh玭g s� kh玭g ch鴑g t� th祅h � mu鑞 nh藀 gi竜 c馻 ngi."
			}
	TalkEx("",strTalk);
end

-- 与尤榕的对话3
function task_007()

local strTalk = {
	"Ha ha! V鮝 ng t鑙 h玬 qua thua s筩h tr琻, h玬 nay l筰 c� 1 lng b筩, th竛g n祔 coi nh� kh玭g ph秈 i r錳!",
	"厖厖",
	"Sao l筰 quay l筰? {T﹜ у} � {ph遪g b猲 c筺h}. H穣 甶 t譵 h緉!",
	"厖厖"
   }
  TalkEx("",strTalk);
end

--与西图对话
function task_008()

local strTalk = {
	"3 ngi   ng � c�? V藋 n lt ta h醝 ngi, n誹 tr� l阨 頲 xem nh� qua 秈.",
	"Xin 產 t�!"
	}
	TalkEx("task_009", strTalk);
end

--回答西图问题1
function task_009()

local strSay = {
	"Trong v� l﹎ mu鑞 甶 v� c竎 th祅h, phng ph竝 thng d飊g l�?",
	"1.T譵 Xa phu/exam_pass5",
	"2.T譵 Ch� t鰑 l莡/exam_fault3",
	"3.T譵 Ch� thng h閕/exam_fault3",
	}
	SelectSay(strSay);
end

--答对西图问题1
function exam_pass5()

local strSay = {
	"Giang h� h藆 b鑙 mu鑞 th╪g ng c蕄 nhanh, phng ph竝 hi謚 qu� nh蕋 l�?",
	"1.B祔 b竛/exam_fault3",
	"2.L祄 nhi謒 v� Thng h閕/exam_pass6",
	"3.Цnh c鋍 g�/exam_fault3",
	}
	SelectSay(strSay);
end

--答对西图问题2
function exam_pass6()

local strSay = {
	"N誹 h祅h trang c� nhi襲 ng﹏ lng, mu鑞 g鰅 m閠 輙, thng s� d鬾g phng ph竝 n祇?",
	"1.Mua b竛 h祅g h鉧./exam_fault3",
	"2.G鰅 � rng ch鴄 /exam_pass7",
	"3.Лa cho m閠 ngi kh竎 gi� gi飉/exam_fault3",
	}
	SelectSay(strSay);
end

--答对西图问题2
function exam_pass6()

local strSay = {
	"N誹 h祅h trang c� nhi襲 ng﹏ lng, mu鑞 g鰅 m閠 輙, thng s� d鬾g phng ph竝 n祇?",
	"1.Mua b竛 h祅g h鉧./exam_fault3",
	"2.G鰅 � rng ch鴄 /exam_pass7",
	"3.Лa cho m閠 ngi kh竎 gi� gi飉/exam_fault3",
	}
	SelectSay(strSay);
end

--答错西图问题后
function exam_fault3()

local strTalk = {
	"Ch� c� th� c騨g kh玭g bi誸! L祄 sao h祅h t萿 giang h�?"
	}
	TalkEx("",strTalk);
end

-- 答对西图问题3
function exam_pass7()

local strTalk = {
	"Ngi c騨g c� ch髏 ki課 th鴆! Ng� чc gi竜 c莕 nh鱪g ngi c� kinh nghi謒 giang h� nh� ngi, ch糿g l﹗ sau Ng� чc gi竜 ta s� vang danh thi猲 h�!",
	"Ngh躠 l祬",
	"Ngi h穣 甶 t譵 {C﹗ S竎h}! N鉯 l� b鋘 ta  ng � r錳!",
	" t� T﹜ у Qu� S�"
	}
	TalkEx("",strTalk);
	TaskTip("дn T﹜ B綾 Ng� чc Gi竜 t譵 Th� t鋋 Qu� S� C﹗ S竎h");
	Msg2Player("дn T﹜ B綾 Ng� чc Gi竜 t譵 Th� t鋋 Qu� S� C﹗ S竎h");
	SetTask(FN_WP,6);
end



--已经和四位鬼师对话后返回勾册处
function task_010()

local strTalk = {
	"Th� n祇? B鋘 h� ng � c� ch璦? H� c� n鉯 g� kh玭g?",
	"Tam v� Qu� S� u  ng � nh璶g Phng Vi猲 Qu� S� h琲 c� th祅h ki課 v韎 Thi誹 L﹎ ph竔.",
	"Ha ha! Trc y y c� kh骳 m綾 v韎 Thi誹 L﹎. C遪 V璾 Dung c� i ti襫 mi kh玭g?",
	"C﹗ S竎h Qu� S� u bi誸 c� �?",
	"T藅 x蕌 c馻 h� sao ta l筰 kh玭g bi誸. B鋘 h� v鮝 th� dai, c� b筩� cho n猲 3 i gi竜 ch� c馻 b鎛 gi竜 u l� n� l璾. Nh璶g ngi ng v� th� m� xem thng h�, b鋘 h� ai c騨g b秐 l躰h n誹 kh玭g  kh玭g th� ng錳 � v� tr� . Ch� c莕 ngi c� b秐 l躰h s� c� ng祔 ngi n鎖 danh tr猲 giang h�. H穣 nh� l蕐!",
	"Thu閏 h� hi觰 r�!",
	"Gi� ngi h穣 甶 t譵 B筩h gi竜 ch�! H穣 n鉯 t� v� Qu� S�  ng � cho ngi nh藀 gi竜.",
	" t� C﹗ S竎h Qu� S�!"
	}
	TalkEx("",strTalk);
	SetTask(FN_WP,7);
	TaskTip("дn t譵 B筩h Doanh Doanh xin gia nh藀 Ng� чc gi竜");
	Msg2Player("дn t譵 B筩h Doanh Doanh xin gia nh藀 Ng� чc gi竜");
end

--可以加入五毒教了
function task_011()

local strTalk = {
	"Th� n祇? B鋘 h� ng � c� ch璦?",
	"B鋘 h� u  ng �.",
	"Nh� v藋 xem nh� ngi  gia nh藀 Ng� чc gi竜. Sau n祔 h穣 c� g緉g luy謓 c玭g ph竧 dng quang i tuy謙 h鋍 b鎛 gi竜.",
	"Thu閏 h� hi觰 r�!",
	"Gi� ngi  c� th� h鋍 v� c玭g b鎛 gi竜. N誹 mu鑞 h鋍 Kh鑞g Thi thu藅 n t譵 Ng� Ng玭; n誹 mu鑞 h鋍 Luy謓 чc thu藅 t譵 Li評 T﹏ Tr骳!"
	}
	
	TalkEx("",strTalk);
	SetTask(FN_WP,8);
	SetPlayerFaction(7);
	i=GetBody();
	if i==1 then 
		AddItem(0,109,125,1,1);
		AddItem(0,108,123,1,1);
	elseif i==2 then
		AddItem(0,109,126,1,1);
		AddItem(0,108,124,1,1);
	elseif i==3 then
		AddItem(0,109,127,1,1);
		AddItem(0,108,125,1,1);
	else
		AddItem(0,109,128,1,1);
		AddItem(0,108,126,1,1);
	end
	ModifyReputation(10,0);
	TaskTip("B筺  gia nh藀 Ng� чc gi竜, c� th� b竔 s� h鋍 ngh�!")
	
	-- 清空其它门派任务的状态
	SetTask(FN_SL, 0);
	SetTask(FN_EM, 0);
	SetTask(FN_WD, 0);
	SetTask(FN_GB, 0);
	SetTask(FN_TM, 0);
	SetTask(FN_YM, 0);
	SetTask(FN_YMM, 0);
end

function task_exit()

end;

function fix_wp()
	SetTask(FN_WP,0);
	Say("C� ch髏 v蕁  x秠 ra nh璶g  頲 gi秈 quy誸! <sex> c� th� gia nh藀 m玭 ph竔 l筰.",0);
end;