-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 昆仑NPC周不惑Script
-- By StarryNight
-- 2007/08/16 AM 10:26

-- 能做掌门又如何……

-- ======================================================
--村长2009-3-12增加实质东西
--还没有做策划NB
-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
Include("\\script\\task\\faction\\faction_main_sl.lua"); -- 门派任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\practice\\practice_main.lua")
NPC_NAME = "<color=green>Chu B蕋 Ho芻<color>: "
PLAYER_NAME = "<color=green>Ngi ch琲<color>: Л頲, ta 甶 ngay!"
KUN_FACTION_ID = 8
TB_FACTION_TASKID_LIST = {1002,1003,1004,1005,1031,1032,1033,1017,1018,1019,1001}
KUN_FACTION_TASK_FINISH = 5

function main()
	local dia_sel = {
		"Ngu錸 g鑓 C玭 L玭/say1_1",
		"V� c玭g C玭 L玭/say1_2",
		"襲 ki謓 nh藀 m玭/say1_3",
		--"我要加入昆仑/say1_4",
		"Ta mu鑞 l祄 nhi謒 v� S� M玭/#ftask_repeat_main(8)",
		--"闭关修炼/#practice_main(8)",
		"Ta d� nh th祅h th﹏ n猲 mu鑞 xu蕋 s� /#faction_graduate(8)",
		"Ch祇 h醝 chng m玭/end_dialog",
	}
	Say(NPC_NAME.."C玭 L玭 s鮪g s鱪g, ti猲 kh� bao quanh, l� th竛h a tu t﹎ dng t輓h.",
		getn(dia_sel),dia_sel
	)
end;
--昆仑派起源
function say1_1()
	Talk(3,"main",
		NPC_NAME.."Ph竔 ta � T﹜ V鵦 xa x玦 輙 khi v祇 Trung Nguy猲. Do  nh鱪g ph竔 kh竎 kh玭g hi觰 v� b鎛 ph竔. Cho n khi ta ph竔 m閠 k� t礽 t韎 Trung Nguy猲 l藀 頲 uy danh hi觧 h竎h, ph竔 ta m韎 頲 c竎 i m玭 ph竔 ch� �.",
		NPC_NAME.."Trc gi� ph竔 ta lu玭 萵 c� chuy猲 t﹎ tu h祅h, kh玭g tranh danh l頸 th� t鬰. Nh璶g m閠 khi xu蕋 hi謓 y猽 ma th� ph秈 h誸 s鴆 di謙 tr�.",
		NPC_NAME.."Trung Nguy猲 g莕 y y猽 ma ho祅h h祅h, n猲  t� trong ph竔 甶 kh緋 n琲 gi竛g ma ph鬰 y猽. Nh璶g c竎 m玭 ph竔 kh竎 l筰 nghi ng� h祅h ng c馻 ph竔 ta, n猲 b鎛 kh竔 kh玭g c� ng minh trong v� l﹎."
	)
end
--昆仑派武功
function say1_2()
	Talk(3,"main",
		NPC_NAME.."V� h鋍 b鎛 ph竔 c� 2 nh竛h Thi猲 S� v� Ki誱 T玭. Thi猲 S� chia l祄 2 h� phong l玦. Ki誱 T玭 d飊g kh� ng� ki誱, theo 畊鎖 c秐h gi韎 t鑙 cao nh﹏ ki誱 h頿 nh蕋.",
		NPC_NAME.."Thi猲 S� l玦 quy誸 uy l鵦 v� c飊g, d飊g  tr� ma ph鬰 y猽, i th� mu鑞 ch鑞g l筰 頲 uy l鵦 c馻 n� ph秈 ti猽 hao th猰 n閕 l鵦. N誹 b� thi猲 l玦 nh tr髇g d� l� cao th� c騨g ph秈 h玭 m�. Phong quy誸 linh ho箃, c� th� che gi蕌 b秐 th﹏, lt 甶 nh� gi�. V� h鋍 b鎛 m玭 v鑞 bi課 h鉧 產 d筺g, l筰 d飊g phong quy誸  t╪g t鑓 b秐 th﹏, c� th� g鋓 cu錸g phong, bao v﹜  i th� kh玭g th� h祅h ng. Ki誱 T玭 c� th� luy謓 h鉧 linh ki誱, d飊g kh� ng� ki誱, ki誱 thu藅 t� nhi猲, l蕐 nhanh nh ch薽, chi誱 th� thng phong, Ki誱 T玭 tu luy謓 n c秐h gi韎 nh﹏ ki誱 h頿 nh蕋 th� ki誱 chi猽 h鉧 th祅h v� h譶h.",
		NPC_NAME.."V� c玭g <color=yellow>Thi猲 S�<color> C玭 L玭 do <color=yellow>T莕 B蕋 Tr�<color> truy襫 th�, c� th� h鋍 頲 k� n╪g tr蕁 ph竔 <color=yellow>V� C鵦 Phong L玦 Quy誸<color>! V� c玭g <color=yellow>Ki誱 T玭<color> C玭 L玭 do <color=yellow>V﹏ Hy H遖<color> truy襫 th�, c� th� h鋍 頲 k� n╪g tr蕁 ph竔 <color=yellow>V筺 Ki誱 H鉧 V� Tr薾<color>!"
	)
end
--入门条件
function say1_3()
	Talk(1,"",NPC_NAME.."V� c玭g C玭 L玭 v鑞 <color=yellow>ch� truy襫 cho nam<color>, n猲 b鎛 gi竜 ch� cho <color=yellow>nam<color> gia nh藀, nam nhi ch璦 gia nh藀 ph竔 kh竎 v� kh玭g ph秈 ph秐  u c� th� v祇.")
end
--我要加入昆仑
function say1_4()
	--等级判断
	if GetLevel() <10 then
		Talk(1,"",NPC_NAME.."C蕄 kh玭g , t c蕄 <color=yellow>10<color> r錳 quay l筰.")
		return
	end
	--性别判断
	if GetSex() == 2 then
		Talk(1,"",NPC_NAME.."N� hi謕 th祅h t﹎ t韎 C玭 L玭 h鋍 o ph竝, th藅 ng khen, nh璶g v� c玭g C玭 L玭 ta ch� truy襫 cho nam, ta kh玭g th� cho n� hi謕 gia nh藀 頲.")
		return
	end
	--本门判断
	if GetPlayerFaction() == KUN_FACTION_ID then
		Talk(1,"",NPC_NAME.."Ngi  l�  t� ph竔 C玭 L玭, mau 甶 luy謓 c玭g.")
		return
	end
	--流派判断
	if GetPlayerFaction() > 0 then
		Talk(1,"",NPC_NAME.."Thi誹 hi謕  c� m玭 ph竔, ta kh玭g th� nh薾.")
		return
	end
	--入门任务判断
	local faction_task_step = without_other_factask(KUN_FACTION_ID) 
	if faction_task_step == -1 then
		Talk(1,"",NPC_NAME.."Х nh薾 nhi謒 v� c馻 ph竔 kh竎, kh玭g th� gia nh藀 b鎛 ph竔.")
		return
	elseif faction_task_step == KUN_FACTION_TASK_FINISH then
		Talk(4,"",
			NPC_NAME.."е t� b鎛 m玭 c莕 thanh t﹎ t辬h kh�, tu th﹏ dng c, chuy猲 t﹎ tu luy謓.",
			PLAYER_NAME.."е t� ph秈 nh� s� hu蕁, ch╩ ch� tu luy謓.",
			NPC_NAME.."H穣 t譵 <color=green>T莕 B蕋 Tr�<color> h鋍 v� c玭g, k� ngh� <color=yellow>C玭 L玭 Thi猲 S�<color> do 玭g 蕐 truy襫 th�, sau  l祄 quen nh鱪g quy t綾 kh竎.",
			PLAYER_NAME.."е t� tu﹏ m謓h."
		)
		TaskTip("Х gia nh藀 C玭 L玭 Ph竔")
		SetPlayerFaction(8)
		SetPlayerRoute(22)
		SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],6)
	else
		if faction_task_step == 0 then
			SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],1)
			TaskTip(" t譵 M� B蕋 Ti襫 i tho筰")
			Msg2Player(" t譵 M� B蕋 Ti襫 (197/203) i tho筰")
		end
		Talk(1,"",NPC_NAME.."C玭 L玭 s鮪g s鱪g, thanh t辬h, l� th竛h a tu th﹏ dng t輓h. Ai c� ch� u c� th� gia nh藀 b鎛 ph竔, chi ti誸 nh藀 m玭 do <color=yellow>M� B蕋 Ti襫<color>(197/203) x� l�, ch� c莕 玭g 蕐 ng � l穙 phu s� cho ngi gia nh藀.")
	end
end
--处理函数
function without_other_factask(faction_diff)
	for i = 1,getn(TB_FACTION_TASKID_LIST) do
		if i ~= faction_diff and GetTask(TB_FACTION_TASKID_LIST[i]) > 0 then
			return -1
		end
	end
	return GetTask(TB_FACTION_TASKID_LIST[faction_diff])
end
