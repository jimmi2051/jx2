--08春节活动指南脚本
--by vivi
--2008/01/15

function OnUse()
	local strtab = {
				"Li猲 quan n vi謈 n﹏g c蕄 Linh Kh� trang b� B竧 Qu竔/about_bagua",
				"Li猲 quan n ho箃 ng ch骳 t誸 m颽 xu﹏/about_bainian",
				"Li猲 quan n ho箃 ng h頿 th祅h Thanh уng/about_qingtongqi",
				"Li猲 quan n ho箃 ng nh薾 h錸g bao n╩ m韎/about_hongbao",
				"Li猲 quan n ho箃 ng Чi C秐h K� � Tuy襫 Ch﹗ B綾/about_pk",
				"T鋋  nh﹏ v藅 ho箃 ng/about_npc",
				"сng hng d蒼/nothing"
				};
	Say("C竎 h� mu鑞 t譵 hi觰 phng di謓 n祇?",
			getn(strtab),
			strtab)
end

function about_bagua()
	Talk(1,"about_bagua2","Ch� c� th� n﹏g c蕄 linh kh� cho <color=green>trang b� ch璦 kh秏 n筸 linh kh�<color>, <color=yellow> trang b� kh竎 c莕 ph秈 n﹏g c蕄. Ch� �: <color>\n<color=green>b� trang b� B竧 Qu竔<color> ph秈 頲 r� ra th祅h <color=green>trang b� B竧 Qu竔<color>. Ch� �: ph秈 <color=green>cho v祇 10000 gi� tr� m韎  m b秓 th竜 r阨 kh玭g g﹜ t鎛 th蕋 cho trang b�<color>, nh� s緋 x誴 kho秐g tr鑞g v� s鴆 l鵦 trong h祅h trang, ph� th竜 r阨 <color=green>b� trang b� B竧 Qu竔<color> tr� cho  t� c馻 s� ph� L璾, m鏸 ngi ch� c� <color=green>3 l莕<color> c� h閕 nh薾 ti襫 b錳 thng.");
end

function about_bagua2()
	Talk(1,"about_bagua3","<color=green>Trang b� B竧 Qu竔 tr猲 80 linh kh�<color> 頲 <color=green>mi詎 ph� t竎h l蕐 Linh th筩h<color>, tr� l筰 <color=green>to祅 b� linh th筩h kh秏 tr猲 trang b� (thu閏 t輓h Linh th筩h v� linh kh� ch絥 l� kh玭g i, tr� linh kh� s� t� t� dao ng), trang b� linh kh� (ch璦 k輈h ho箃, tr� s� trang b� nh� s鴆 c玭g k輈h v� kh� kh玭g i), Th竔 H� B竧 Qu竔 ti猽 hao khi k輈h ho箃 trang b� B竧 Qu竔<color> t� ch�  t� c馻 th� r蘮 L璾.");
end

function about_bagua3()
	Talk(1,"OnUse","Trang b� linh kh� <color=green>l韓 h琻 ho芻 b籲g 91<color> <color=green>mi詎 ph� ng蓇 nhi猲 t╪g gi韎 h筺 linh kh� 10, 12, 14, 16, 18, 20 甶觤<color>, cao nh蕋 n 120 (v� kh� c玭g k輈h kh玭g i), n誹 t鑞 <color=green>2 V� Ng蕁 Th駓<color> s� t╪g 20 甶觤 tr� linh kh�. Ch� �: trang b� c蕄 8, c蕄 9 c� 頲 trong k� n╪g s鑞g � ho箃 ng m颽 xu﹏ s� kh玭g th� t╪g.")
end

function about_bainian()
	Talk(1,"about_bainian2","M鏸 ng祔 t� 9 gi� s竛g s� b総 u g鰅 nhi謒 v� ch骳 t誸, ngi ch琲 c蕄 10 tr� l猲 c� th� nh薾 nhi謒 v� t筰 Ni猲 S�. Sau khi ho祅 th祅h nhi謒 v� ch骳 t誸, tr� v�  nh薾 ph莕 thng th輈h h頿. \n n鯽 ti課g s� g鰅 1 l莕 nhi謒 v�, n誹 ch璦 ho祅 th祅h ho芻 b� nhi謒 v� c� th� ho祅 th祅h v祇 l莕 sau.")
end

function about_bainian2()
	Talk(1,"OnUse","Sau khi ch骳 t誸 xong, c� th� nh薾 ph莕 thng cu鑙 c飊g � ch� Ni猲 S�. Ch� �: Ngi u ti猲 ho祅 th祅h nhi謒 v� ch骳 t誸 t蕋 c� m鋓 ngi 頲 g蕄 i ph莕 thng. Ngi th� nh� n ngi th� 5 ho祅 th祅h nhi謒 v� 頲 1.6 ph莕 thng, ngi th� s竨 n ngi th� 10 頲 1.2 ph莕 thng. M鋓 ngi ph秈 nhanh ch鉵g ho祅 th祅h. \n N誹 kh玭g h礽 l遪g b秐g x誴 h筺g l莕 n祔, c� th� tham gia l筰 v祇 l莕 sau. Nh璶g khi  nh薾 ph莕 thng th� kh玭g 頲 tham gia n鱝.")
end

function about_qingtongqi()
	Talk(1,"OnUse","Ho箃 ng n╩ m韎: nh qu竔 s� c� c� h閕 nh薾 頲 nguy猲 li謚 h頿 th祅h Thanh уng nh. Ch� �: Ъng c蕄 qu竔 v藅 c祅g cao, b筺 m韎 c� th� nh薾 頲 nguy猲 li謚 c祅g t鑤. Nguy猲 li謚 t鑤 nh蕋 ch� c� � ch� minh ch� B綾 L鬰 L﹎, Thng Th莕 Doanh Thi猲 v� L穘h Hng L╪g. \n Ng� C竎 c騨g c� b竛 1 s� nguy猲 li謚 nh� v� kh� Thanh уng, c� th� nh薾 頲 b蕋 k� nguy猲 li謚 n祇. \n L骳 n祔 s� d鬾g B筩h C﹗ ho祅, c� th� nh薾 頲 1 v礽 nguy猲 li謚 ho箃 ng. \n mua Thanh уng � Ng� C竎 s� ng蓇 nhi猲 nh薾 頲 m秐h Thanh уng, 2000 m秐h thanh ng  i 頲 ph莕 thng t筰 Ni猲 S�.")
end

function about_hongbao()
	Talk(1,"OnUse","N╩ m韎 n, h� th鑞g chu萵 b� cho m鋓 ngi i h錸g bao: g鰅 v祇 l骳 9:00, 13:00, 19:30, 21: 30 m鏸 ng祔, n s韒 nh薾 trc. Ch� �: ngi nh薾 i h錸g bao ph秈 t� c蕄 70 tr� l猲. Ngo礽 th阨 gian  ra c� th� nh薾 頲 ti觰 h錸g bao. Ai c騨g c� ph莕. M鏸 ngi ch� nh薾 頲 1 h錸g bao m鏸 ng祔.")
end

function about_pk()
	Talk(1,"OnUse","Th阨 gian ho箃 ng m颽 xu﹏, Tuy襫 Ch﹗ ph� B綾 l� khu v鵦 PK l� tng, kh玭g c� tr鮪g ph箃 PK, c� th� n b蕋 k� n琲 n祇 trong khu v鵦 n祔, t蕋 c� i sang tr筺g th竔  s竧, kh玭g th� t� i.")
end

function about_npc()
	Talk(1,"OnUse","Ni猲 S� xu蕋 hi謓 � Bi謓 Kinh, Th祅h Й, Tuy襫 Ch﹗, Tng Dng, Dng Ch﹗, Чi L�, t筼 : \nBi謓 Kinh 145, 178\nTh祅h Й 206, 222\nTuy襫 Ch﹗ 180, 175\nTng Dng 182, 185\nDng Ch﹗ 209, 196\nЧi L� 195, 185")
end


function nothing()

end