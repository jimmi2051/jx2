--任务
--地点： 任务：
--策划：樊万松  2004.03.
Include("\\script\\task\\world\\task_award.lua");


function main()

	if GetTask(150) == 9 then
		Say("T譵 ta c� vi謈 g�?",
			4,
			"T譵 hi觰 t譶h h譶h Giang T﹏ th玭/fengdu",
			"L祄 c竎h n祇 甶襲 khi觧 T醓 Y猽 chung?/suoyaozhong",
			"Чi hi謕! Ta c� th� gi髉 g�?/huanyouhun",
			"Kh玭g c� g�/no")
	else
		Say("T譵 ta c� vi謈 g�?",
			3,
			"T譵 hi觰 t譶h h譶h Giang T﹏ th玭/fengdu",
			"Чi hi謕! Ta c� th� gi髉 g�?/huanyouhun",
			"Kh玭g c� g�/no")
	end

end

function huanyouhun()
UWorld1402 = GetTask(1402)
if ( UWorld1402 > 20 )  then
		Say("Ta c莕 <color=red>K� Th筩h Tuy誸 Ph竎h<color> c馻 <color=red>B╪g Qu竔<color> � t莕g 2 B╪g T﹎ ng  l祄 Thi猲 Lang Ch﹎, n誹 ngi c� th� t譵 gi髉 ta <color=red>15 Tuy誸 Ph竎h<color>  ta l祄 ph竝 kh�, ta s� cho ngi 10 vi猲 k� th筩h <color=red>U H錸<color>.",
		2,
		"Лa ngi 15 Tuy誸 Ph竎h/huan",
		"Sau n祔 h穣 t輓h/no")
		else 
		Say("T筸 th阨 kh玭g c莕 ngi gi髉.",0)
end
end

function huan()
	if	GetItemCount(2,1,45) >= 15 then
	DelItem(2,1,45,15)
	AddItem(2,1,51,10)
	Say(" t� b籲g h鱱!", 0);	
	else
	Say("H譶h nh� Tuy誸 Ph竎h kh玭g ! B籲g h鱱 qu猲 mang theo r錳 �?",0)
end
end;


function fengdu()
UWorld1402 = GetTask(1402)
if ( UWorld1402 == 10 )  then
		Talk(2,"","Ta  tr髇g Thi c, mau t譵 <color=red>10 Ph� Ma Ch�<color> n kh綾 ch� ch髇g!","T筰 h� 甶 ngay!")
		SetTask(1402,15)
elseif ( UWorld1402  == 15 and  GetItemCount(2,3,12) < 9 ) then
		Talk(1,"","Mau t譵 <color=red>10 Ph� Ma Ch�<color> v� y! Nhanh l猲!")
elseif ( UWorld1402  == 15 and  GetItemCount(2,3,12) >  9 ) then
		if  DelItem(2,3,12,10) == 1 then 
				Talk(1,"","Hay l緈!  t� b籲g h鱱 tng tr�! Ta v鑞 ngh� ch� c莕 m閠 m譶h ta c騨g c� th� 畊鎖 b鋘 y猽 ma qu� qu竔 nh璶g xem ra kh玭g 頲. h穣 n <color=red>Nga My s琻<color> t譵 <color=red>Dng Nguy謙 S� Th竔<color>, v韎 ph竝 l鵦 c馻 b� ta kh玭g ch鮪g s� c� c竎h i ph�.")
				 SetTask(1402,20)
				 --AddItem(1,1,1,1)
				 Earn(800)
				 GivePlayerExp(SkeyFDGC,"fengduguicheng2")		--丰都鬼城2
				 ModifyReputation(10,0)
				 --AddNote("去峨眉山求助于阳月师太，看看有什么办法。")
				 TaskTip("дn Nga My s琻 nh� Dng Nguy謙 S� Th竔 gi髉 .")
		else
				 Talk(1,"","Chuy觧 giao v藅 ph萴 kh玭g th祅h c玭g")
		end
elseif ( UWorld1402  == 20 ) then
				Talk(1,"","Цm y猽 nghi謙 n祔 nh蕋 nh c� ch髏 xu蕋 s�, h穣 n <color=red>Nga My s琻<color> t譵 <color=red>Dng Nguy謙 S� Th竔<color>, v韎 ph竝 l鵦 c馻 b� ta kh玭g ch鮪g s� c� c竎h i ph�.")
else
		Talk(1,"","Ta nh蕋 nh s� di謙 tr� b鋘 y猽 nghi謙 n祔!")
end
end;

function suoyaozhong()

	if GetItemCount(2,1,19) >= 30 then
		Talk(5,"",
				"Ti襫 b鑙 y l� 30 畊玦 h�.",
				"Hay l緈! Ch� ta ch髏 x輚.",
				"M閠 l竧 sau厖",
				"Зy l� H祅h Thi v� H� Thi ngi c莕, mau 甧m v� cho <color=yellow>Gia C竧 K�<color>.",
				" t� ti襫 b鑙!"
				);
		DelItem(2,1,19,30);
		AddItem(2,0,85,25);
		AddItem(2,0,86,15);
		TaskTip("m Oan H錸 v� cho Gia C竧 K�");
	else
		Talk(2,"",
				"Л頲 bi誸 ti襫 b鑙 bi誸 c竎h d飊g T醓 Y猽 chung thu ph鬰 H祅h thi v� H� Thi n猲 m筼 mu閕 nh� ti襫 b鑙 ch� d蒼 cho!",
				"ng v藋! в ph竧 huy uy l鵦 c馻 T醓 Y猽 chung c莕 <color=yellow>30 c竔 畊玦 h�<color>, ngi th� n <color=yellow>Thi誹 L﹎<color> t譵 xem!"
				);
		TaskTip("m 30 玦 h� cho Trng ёnh");	
	end
end

function no()

end