-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 翠烟门NPC彩凤儿Script
-- By StarryNight
-- 2006/03/22 PM 17:20

-- 直面自己的内心吧！

--村长：2009-03-09 增加实质的东西
--以前都是几个策划搞一个开发，现在随着时代的进步，变成了一个策划搞几个开发！
-- ======================================================
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
Include("\\script\\task\\faction\\faction_main_sl.lua"); -- 门派任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\practice\\practice_main.lua")
TASKID_CUIYAN_JOIN_TASK = 1019
TB_FACTION_TASKID_LIST = {1001,1002,1003,1004,1005,1031,1032,1033,1017,1018}
NPC_NAME = "<color=green>S礽 Ho祅g Nhi<color>: "
function main()
	local t_dia_sel = {
		"Ngu錸 g鑓 Th髖 Y猲/say1_1",
		"V� c玭g Th髖 Y猲/say1_2",
		"襲 ki謓 nh藀 m玭/say1_3",
		--"我要加入翠烟/say1_4",
		"Ta mu鑞 l祄 nhi謒 v� S� M玭/#ftask_repeat_main(10)",
		--"闭关修炼/#practice_main(10)",
		"Ta s緋 th祅h th﹏ n猲 ph秈 xu蕋 s�/#faction_graduate(10)",
		"Ch祇 h醝 chng m玭/end_dialog"
	}
		Say(NPC_NAME.."Th髖 Y猲 b鑞 m颽 u l� m颽 xu﹏, hoa r琲 l� t�, ngi t礽 t� t�.",
			getn(t_dia_sel),
			t_dia_sel
			)
end;	
function say1_1()
	Talk(4,"main",
		NPC_NAME.." V祇 n╩ Л阯g Minh Ho祅g, An L閏 S琻 ph秐 lo筺, b� t竛h l莔 than. H� v� t� b秓 v� m� l藀 n猲 c竎 nh鉳 trong d﹏ gian, trong  Th髖 Y猲 M玭 do 揤� Nng� t筼 th祅h. Trong chi課 lo筺, c竎 m玭 ph竔 u kh� kh╪, ph竔 ta linh ho箃 n猲 c� kh玭g gian sinh t錸, t�  thu h髏 ng祔 c祅g nhi襲 v� l﹎ nh﹏ s� gia nh藀.",
		NPC_NAME.."Nh璶g n khi 2 k� t礽 v� h鋍 L璾 C秐h v� L璾 Thng xu蕋 hi謓 m韎 l祄 ph竔 ta th祅h m玭 ph竔 v� l﹎ th藅 s�. Huynh  L璾 th� chia v� c玭g b鎛 ph竔 th祅h 2 hng: Linh N� gi醝 v� 甶襲 khi觧 Ti觰 猽 v� V� Ti猲 gi醝 m骯, i sau g鋓 h� l� 揟h髖 Y猲 Nh� T鏀. Sau  L璾 C秐h m蕋 s韒, L璾 Thng g苝 t譶h bi課, t鴆 gi薾 畊鎖 h誸  t� nam, ch� thu n筽 n�  t�.",
		NPC_NAME.." Cu鑙 i Л阯g, chi課 tranh l筰 n鎖 l猲, c竎 m玭 ph竔 lo ch髇g ta th鮝 l骳 h鏽 lo筺 m� r閚g th� l鵦 n猲  畊鎖 b鎛 m玭 kh醝 Trung Nguy猲. Chng m玭 S礽 Ho祅g Nhi c� kh骳 m綾 v韎 T鑞g ёnh n猲 c� th竔  th� ch v韎 c竎 m玭 ph竔 Trung Nguy猲, do v藋 kh玭g c� ng minh trong giang h�.",
		NPC_NAME.."B鎛 m玭 n鎖 danh giang h� kh玭g ch� v� v� c玭g vt tr閕, c遪 v� c竎  t� u l� m� n� tuy謙 s綾, khi課 v� s� nam nh﹏ giang h� si m�. C竎 B竎h Hoa S�, ai c騨g hoa nhng nguy謙 th裯, chim sa c� l苙."
		)
end
function say1_2()
	Talk(3,"main",
		NPC_NAME.."V� c玭g b鎛 m玭 g錷 2 ph竔, <color=yellow>V� Ti猲<color> v� <color=yellow>Linh N�<color>. <color=yellow>M蓇 Кn S� Chu T� V╪<color> truy襫 v� c玭g <color=yellow>V� Ti猲<color>, v� c玭g <color=yellow>Linh N�<color> do <color=yellow>Tng Vi S� H� Man Th祅h<color> truy襫 th�.",
		"<color=yellow>V� Ti猲<color> ch� d祅h cho n� nh﹏ bi誸 v� o. Th阨 Л阯g c� C玭g T玭 i nng khi m骯 ki誱 kh� vang d閕 t� phng. V� o b鎛 m玭 l� v� o h遖 t﹎ � b秐 th﹏ v祇 甶謚 m骯, ngi xem lay ng theo t﹎ � ngi m骯. K� ch nh譶 v祇, s� m蕋 h誸 � ch� chi課 u. H秓 h鱱 nh譶 v祇, � ch� chi課 u t╪g cao, c� th� h鋍 頲 k� n╪g tr蕁 ph竔 <color=yellow>Loan Ph鬾g C鰑 Thi猲<color>.",
		"<color=yellow>Linh N�<color> ch� d祅h cho n� nh﹏ c� t﹎ h錸 t� do. Linh N� h遖 h頿 v韎 v筺 v藅 n猲 頲 nhi襲 ng v藅 nh� qu� m課, h� nu玦 猽 l祄 b筺, khi chi課 u c騨g kh鑞g ch� Ti觰 猽 s竧 thng ch. Ngi v� 猽 ph鑙 h頿, uy l鵦 phi thng, 猽 h祅h ng theo l謓h khi課 k� th� b� cho竛g v� gi竛 畂筺 v� c玭g, kh玭g 頲 xem thng, c� th� h鋍 頲 v� c玭g tr蕁 ph竔 <color=yellow>C鰑 V� Hoa Ti猲 Quy誸<color>"
		)
end
function say1_3()
	Talk(1,"main","<color=green>S礽 Ho祅g Nhi<color>: Giai nh﹏ tuy謙 s綾 trong thi猲 h� ch� c莕 c� t蕀 l遪g lng thi謓, kh玭g ph秈 ph秐  b鎛 m玭, u 頲 gia nh藀 b鎛 m玭, nh璶g  t� sau khi nh藀 ph竔 ph秈 y猽 thng nhau, kh玭g 頲 qua l筰 v韎 nam nh﹏.")
end 
function say1_4()
	local task_step = GetTask(TASKID_CUIYAN_JOIN_TASK)
	local s_dia_no_pass = ""
	if GetSex() == 1 then
		 s_dia_no_pass = "Thi誹 hi謕 阯g xa n y, th藅 v蕋 v�. Nh璶g Th髖 Y猲 M玭 kh玭g nh薾 <color=red> t� nam<color>."
	elseif GetLevel() < 10 then
		s_dia_no_pass = "Ngi kh玭g  c蕄, t c蕄 <color=red>10<color> h穣 n t譵 ta."
	elseif GetPlayerRoute() ~= 0 then
		s_dia_no_pass =  "N� hi謕  c� <color=red>m玭 ph竔<color>, ta kh玭g th� nh薾."
	elseif GetPlayerFaction() == 8 then
		s_dia_no_pass =  "Ngi  l� ngi c馻 Th髖 Y猲 M玭, mau 甶 luy謓 c玭g."
	else
		for i = 1,getn(TB_FACTION_TASKID_LIST) do
			if GetTask(TB_FACTION_TASKID_LIST[i]) > 0 then
				s_dia_no_pass = "N� hi謕  nh薾 nhi謒 v� nh藀 m玭 c馻 m玭 ph竔 kh竎, kh玭g th� gia nh藀 b鎛 m玭."
				break
			end
		end
	end
	if task_step == 5 then
		Talk(2,"",
			NPC_NAME.."Kh玭g sai, hai v� <color=green>B竎h Hoa S�<color> r蕋 h礽 l遪g v� ngi, ngi c� th� gia nh藀 b鎛 m玭, nh藀 m玭 ph秈 tu﹏ th� quy nh, kh玭g 頲 qua l筰 v韎 nam nh﹏.",
			NPC_NAME.."V� c玭g b鎛 m玭 g錷 <color=yellow>V� Ti猲<color> v� <color=yellow>Linh N�<color>, sau khi nh藀 m玭 ngi c� th� t譵 <color=yellow>Chu T� V╪<color> ho芻 <color=yellow>H� Man Th祅h<color>  h鋍, <color=yellow>Chu T� V╪<color> tinh th玭g v� o, ngi c� th� h鋍 頲 甶謚 nh秠 m� ho芻 v� t﹎ ph竝 say h錸 c馻 n祅g 蕐; <color=yellow>H� Man Th祅h<color> t� nh� y猽 ng v藅, r蕋 th輈h nu玦 猽, k� n╪g d飊g Ti猽 kh鑞g ch� <color=yellow>Ti觰 猽<color>  t n m鴆 xu蕋 qu� nh藀 th莕."
		)
		SetPlayerFaction(10)
		SetPlayerRoute(28)
		TaskTip("Ngi  gia nh藀 Th髖 Y猲 M玭")
		SetTask(TASKID_CUIYAN_JOIN_TASK,6)
	elseif s_dia_no_pass == "" then
		if task_step == 0 then
			Talk(2,"",NPC_NAME.."Giai nh﹏ tuy謙 s綾 trong thi猲 h� c� th� gia nh藀 b鎛 m玭, nh璶g ngi ph秈 b竔 ki課 hai v� <color=green>B竎h Hoa S�<color> trong Th髖 Y猲 M玭, h� s� n鉯 ngi bi誸 n猲 l祄 th� n祇, h穣 t譵 <color=green>M蓇 Кn S� Chu T� V╪<color> (190/170) trc.","<color=green>Ngi ch琲<color>: Л頲, ta 甶 ngay!")
			TaskTip("T譵 M蓇 Кn S� Chu T� V╪")
			Msg2Player("T譵 M蓇 Кn S� Chu T� V╪ (190/170)")
			SetTask(TASKID_CUIYAN_JOIN_TASK,1)
			return
		else
			Talk(1,"",NPC_NAME.."Mu鑞 v祇 b鎛 m玭 h穣 t譵 <color=yellow>Chu T� V╪<color> ho芻 <color=yellow>H� Man Th祅h<color>!")
			return
		end
	else
		Talk(1,"",NPC_NAME..s_dia_no_pass)
		return
	end
end

function say1_5()
	
end

function say1_6()
	
end

