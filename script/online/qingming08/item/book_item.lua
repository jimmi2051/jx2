--脚本名称：清明节活动指南使用脚本
--脚本功能：对清明节活动的介绍
--策划人：阿松
--代码编写人：村长
--代码编写时间：2007-03-14
--代码修改记录：2008-03-20byMoxian
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\qingming08\\head_qingming.lua")

tomb_sweep_2008_task_reel_completed = 1849		--已完成的任务数
tomb_sweep_2008_times_count = 1851					--拜祭的次数统计
tomb_sweep_2008_date_seq = 1858
tomb_sweep_2008_goods_use_diff = 1859
tomb_sweep_2007_task_reel_diff = 1854
function OnUse()
	Say("� y ghi r� ho箃 ng <color=yellow>Ti誸 Thanh Minh<color>, b筺 mu鑞 t譵 hi觰 m鬰 n祇?",
	4,
	"Xem ti課 tri觧 ho箃 ng/player_step_inq",
	"Xem n閕 dung ho箃 ng./tomb_sweep_2007_inf",
	"Ti誸 Thanh Minh/tomb_sweep_story",
	"сng hng d蒼/end_dialog"
	)
end
--************************活动进展查询***************************
function player_step_inq()
	local kotowl_today_chk = "Ch璦 b竔 t�!"
	if GetTask(tomb_sweep_2008_date_seq) >= zgc_pub_day_turn(1) then
		kotowl_today_chk = "Х b竔 t�"
	end
	local totowl_times_count = GetTask(tomb_sweep_2008_times_count)
	if totowl_times_count == nil then
		totowl_times_count = 0
	end
	local task_inf = ""
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	local task_reel_table = {}
	if task_diff ~= 0 and task_diff ~= nil then
		if IS_SHOUFEI == TRUE then
			task_reel_table = {
				"<color=yellow>N閕 dung<color>: Ngo礽 th祅h c� m蕐 t猲 <color=yellow>C玭 <color> l祄 h筰 b� t竛h, 甶 nh b筰 <color=yellow>30<color> t猲, sau  n <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n   <color=yellow>Ph莕 thng: 95%<color> x竎 su蕋 <color=yellow>nh﹏ i<color> kinh nghi謒 ho芻 <color=yellow>5%<color> x竎 su蕋 g蕄 <color=yellow>11<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>.",
				"<color=yellow>N閕 dung nhi謒 v�: 玦 h�<color> L祄 thu鑓 c� th� 甶襲 tr� c竎 b謓h t藅, thu th藀 <color=yellow>20<color> <color=yellow>畊玦 h�<color> sau  quay v� <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n<color=yellow>Ph莕 thng: x竎 su蕋 90% nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>10%<color> x竎 su蕋 g蕄 <color=yellow>6<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>.",
				"<color=yellow>N閕 dung: Quan s�<color> � <color=yellow>Dng Trung ng<color> h� hi誴 b� t竛h, gi竜 hu蕁 <color=yellow>30<color> t猲 m閠 b礽 h鋍 sau  quay v� <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n<color=yellow>Ph莕 thng: x竎 su蕋 84% nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>16%<color> x竎 su蕋 g蕄 <color=yellow>4<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>.",
				"<color=yellow>N閕 dung<color>: Hi謓 tri襲 nh c莕 m閠 s� v藅 li謚, 甶 thu th藀 10 <color=yellow>Linh Chu t�<color>, 10 <color=yellow>Da g蕌<color> sau   quay v� <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n<color=yellow>Ph莕 thng: 80% x竎 su蕋 nh﹏ i <color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>20%<color> x竎 su蕋 g蕄 <color=yellow>3.5<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>.",
				"<color=yellow>N閕 dung<color>: Hi謓 tri襲 nh c莕 m閠 s� v藅 li謚, n <color=yellow>Ki誱 M玭 Quan<color> thu th藀 10 <color=yellow>b莡 ru da d�<color>, n <color=yellow>Ki誱 C竎 th鬰 o<color> thu th藀 10 <color=yellow>Kim Thoa<color> sau  quay v� Th� l╪g m�<color> ph鬰 m謓h.\n<color=yellow>Ph莕 thng: 70% x竎 su蕋 nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>30%<color> g蕄 <color=yellow>2.7<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>.",
				"<color=yellow>N閕 dung<color>: T譵 <color=yellow>2 Linh th筩h c蕄 2<color>, <color=yellow>2 Linh th筩h c蕄 3<color> t v祇 T� Linh nh xong, n g苝 <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng: 60% x竎 su蕋 nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>40%<color> x竎 su蕋 g蕄 <color=yellow>2.25<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>.",
				"<color=yellow>N閕 dung<color>:Hi謓 tri襲 nh c莕 m閠 s� v藅 li謚, 甶 thu th藀 10 <color=yellow>Gi竝 x竎 phi課 � Уo Hoa Фo<color>, 10 <color=yellow>b秐  r鮪g n骾 g鑓 � Чi Th秓 Nguy猲<color> sau  quay v� <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n<color=yellow>Ph莕 thng: 50% x竎 su蕋 nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>50%<color> x竎 su蕋 g蕄 <color=yellow>2<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>.",
				"<color=yellow>N閕 dung<color>: � Long M玭 tr蕁 c� <color=yellow>Cao th� quan ngo筰<color> h� hi誴 b� t竛h, h穣 甶 nh <color=yellow>30<color> t猲 trong b鋘 ch髇g, sau  n g苝 <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng: 35% x竎 su蕋 nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>65% x竎 su蕋<color> g蕄 <color=yellow>1.75<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>.",
				"<color=yellow>N閕 dung<color>: T譵 <color=yellow>2 Linh th筩h c蕄 4<color> t v祇 T� Linh nh xong n g苝 Th� l╪g m� ph鬰 m謓h.\n    <color=yellow>Ph莕 thng: x竎 su蕋 45%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>65%<color> x竎 su蕋 g蕄 <color=yellow>1.65<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>.",
				"<color=yellow>N閕 dung <color>: Sa m筩 m� cung c� <color=yellow>T莔 b秓 nh﹏<color> t蕁 c玭g nhi襲 nh﹏ s� giang h�, h穣 nh b筰 <color=yellow>30<color> t猲 trong b鋘 ch髇g, n g苝 <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng: Ph莕 thng: 100%<color> g蕄 <color=yellow>1.5<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>."
			}
		else
			task_reel_table = {
				"<color=yellow>N閕 dung<color>: Ngo礽 th祅h c� nh鱪g t猲 <color=yellow>C玭 <color> l祄 h筰 b� t竛h, 甶 nh b筰 <color=yellow>30<color> t猲, sau  n <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n   <color=yellow>Ph莕 thng: 95%<color> x竎 su蕋 <color=yellow>nh﹏ i<color> kinh nghi謒 ho芻 <color=yellow>5%<color> x竎 su蕋 g蕄 <color=yellow>11<color>l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>",
				"<color=yellow>N閕 dung: 玦 h�<color> l祄 thu鑓 c� th� 甶襲 tr� c竎 b謓h t藅, thu th藀 <color=yellow>20<color> <color=yellow>畊玦 h�<color> sau  quay v� <color=yellow>Th� l╪g m�<color>ph鬰 m謓h.\n<color=yellow>Ph莕 thng: x竎 su蕋 90% nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>10%<color> x竎 su蕋 g蕄 <color=yellow>6<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>.",
				"<color=yellow>N閕 dung: Quan s�<color> � <color=yellow>Dng Trung ng<color> h� hi誴 b� t竛h,  gi竜 hu蕁 <color=yellow>30<color> t猲 m閠 b礽 h鋍 sau  quay v� <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n<color=yellow>Ph莕 thng: x竎 su蕋 84% nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>16%<color> x竎 su蕋 g蕄 <color=yellow>4<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>.",
				"<color=yellow>N閕 dung<color>: Hi謓 tri襲 nh c莕 thu th藀 <color=yellow>4 Linh th筩h c蕄 1<color>, n g苝 <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng: 80% x竎 su蕋 nh﹏ i <color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>20%<color> x竎 su蕋 g蕄 <color=yellow>3.5<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>",
				"<color=yellow>N閕 dung<color>:Nhi謒 v�<color>: Hi謓 tri襲 nh c莕 m閠 s� v藅 li謚, n <color=yellow>Ki誱 M玭 Quan<color> thu th藀 10 <color=yellow>b莡 ru da d�<color>, n <color=yellow>Ki誱 C竎 th鬰 o<color> thu th藀 10 <color=yellow>Kim Thoa<color> sau  quay v� Th� l╪g m�<color> ph鬰 m謓h.\n<color=yellow>Ph莕 thng: 70% x竎 su蕋 nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>30%<color> g蕄 <color=yellow>2.7<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>.",
				"<color=yellow>N閕 dung<color>: T譵 <color=yellow>2 Linh th筩h c蕄 2<color>, <color=yellow>2 Linh th筩h c蕄 3<color> t v祇 T� Linh nh, n g苝 <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng: Ph莕 thng: 60% x竎 su蕋 nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>40%<color> x竎 su蕋 g蕄 <color=yellow>2.25<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>.",
				"<color=yellow>Nhi謒 v�<color>: Hi謓 tri襲 nh c莕 m閠 s� v藅 li謚, 甶 thu th藀 10 <color=yellow>Gi竝 x竎 phi課 � Уo Hoa Фo<color>, 10 <color=yellow>b秐  r鮪g n骾 g鑓 � Чi Th秓 Nguy猲<color> sau  quay v� <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n <color=yellow>Ph莕 thng: 50% x竎 su蕋 nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>50%<color> x竎 su蕋 g蕄 <color=yellow>2<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>.",
				"<color=yellow>N閕 dung<color>: <color=yellow>Cao th� quan ngo筰<color> � Long M玭 tr蕁  thng nhi襲 b� t竛h, h穣 nh b筰 <color=yellow>30<color> t猲 sau  t譵 <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng: 35%<color> x竎 su蕋 <color=yellow>nh﹏ i<color> kinh nghi謒 ho芻 <color=yellow>65%<color> x竎 su蕋 g蕄 <color=yellow>1.75<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>.",
				"<color=yellow>N閕 dung<color: T譵 <color=yellow>2 Linh th筩h c蕄 4<color> t v祇 T� Linh nh xong n ph鬰 m謓h Th� l╪g m�.\n    <color=yellow>Ph莕 thng: 45% x竎 su蕋 <color>  <color=yellow>g蕄 i<color> ho芻 <color=yellow>65%<color> g蕄 <color=yellow>1.65 l莕<color> 甶觤 s鴆 kh醗 chuy觧 甶觤 kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲 <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>.",
				"<color=yellow>N閕 dung: � Sa m筩 m� cung <color> c� <color=yellow>T莔 b秓 nh﹏<color>  thng kh玭g 輙 nh﹏ s� giang h�, sau khi nh b筰 <color=yellow>30<color> ngi, n <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng: 100%<color> x竎 su蕋 g蕄 <color=yellow>1.5 l莕<color> 甶觤 s鴆 kh醗 i 甶觤 kinh nghi謒. N誹 ngi ch琲 c蕄 99 s� nh薾 頲  <color=yellow>2 quy觧 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 1-7<color>."
			}
		end
		Talk(1,"","Nhi謒 v� hi謓 t筰:\n    T鎛g c閚g b筺 b竔 t� <color=yellow>"..totowl_times_count.." <color> l莕, h玬 nay "..kotowl_today_chk.."Hi謕 Ch駈g. \nHi謓 b筺 nh薾 m藅  nhi謒 v� th� <color=yellow>"..task_diff.."<color>, tin t鴆: \n"..task_reel_table[task_diff].."\nS� l莕 ho祅 th祅h nhi謒 v� c馻 b筺 hi謓 l�: <color=yellow>"..GetTask(tomb_sweep_2008_task_reel_completed).."<color>!")
	else
		Talk(1,"","Nhi謒 v� hi謓 t筰:\n    T鎛g c閚g b筺 b竔 t� <color=yellow>"..totowl_times_count.." <color> l莕, h玬 nay "..kotowl_today_chk.."Hi謕 Ch駈g. \nHi謓 b筺 ch璦 nh薾 m藅  nhi謒 v� Ti誸 Thanh Minh!".."\nS� l莕 ho祅 th祅h nhi謒 v� c馻 b筺 hi謓 l�: <color=yellow>"..GetTask(tomb_sweep_2008_task_reel_completed).."<color>!")
	end
end
--***************************活动详情****************************
function tomb_sweep_2007_inf()
	Talk(2,"tomb_sweep_2007_inf_1",
	"    Th阨 gian ho箃 ng: <color=yellow>3-4 n 12-4<color>.\n    Th﹏ l� n� nhi giang h� ph秈 n猲 b竔 t� t秓 m� c竎 v� anh h飊g v祇 d辮 t誸 Thanh Minh, trong  m� ph莕 c馻 <color=yellow>Ho祅g i hi謕, H祅 i hi謕, Hi猲 Vi猲 i hi謕<color> l� n猲 甶 b竔 t� nh蕋.",
	"     Trong th阨 gian ho箃 ng Thanh Minh, m鏸 ng祔 n m� b竔 t� c竎 i hi謕 <color=yellow>1<color> l莕, c騨g l� d飊g ng t竎 '<color=yellow>b竔<color>'. Nh薾 ph莕 thng c馻 c竎 i hi謕 s� gi髉 kinh nghi謒 giang h� c馻 b筺 t╪g l猲, t輈h l騳 th祅h t﹎ b竔 t� <color=yellow>8<color> ng祔 c� th� nh薾 頲 ph莕 thng l韓 h琻."
	)
end
function tomb_sweep_2007_inf_1()
	local nTemp = 0
	if IS_SHOUFEI == TRUE then
		nTemp = 2
	else
		nTemp = 1
	end
	Talk(2,"","     M鏸 ng祔 khi b竔 t� c� th� nh薾 頲 nhi謒 v� t� <color=yellow>Th� L╪g M�<color>. Sau khi ho祅 th祅h nhi謒 v� 甧m <color=yellow>m藅 t辌h n祔<color> n <color=yellow>Th� L╪g M�<color> ph鬰 m謓h  nh薾 <color=yellow>Ph莕 thng<color> v� <color=yellow>v藅 ph萴 b竔 t�<color>, m鏸 ng祔 m鏸 ngi c� th� l祄"..nTemp.." l莕 nhi謒 v� m藅 t辌h, t輈h l騳 ho祅 th祅h <color=yellow>8<color> l莕, c� th� nh薾 nhi襲 ph莕 thng h琻",
		"    Trc khi s� d鬾g v藅 ph萴 b竔 t� s� d鬾g ch髇g c� th� t╪g t� l� nh薾 頲 kinh nghi謒 giang h�, n誹  b竔 t� r錳 kh玭g th� t竔 s� d鬾g. T輈h l騳  8 l莕 nhi謒 v� m藅 t辌h c� th� 頲 ph莕 thng c馻 Th� L╪g M� c竎 v� i hi謕. Nghe n鉯 <color=yellow>Ng� C竎<color> c� b竛 <color=yellow>Gi蕐 c髇g t�<color>  t╪g s� l莕 nhi謒 v� m藅 t辌h trong ng祔 v� <color=yellow>h閜 m藅 t辌h nhi謒 v�<color>."
)
end
--**************************清明节由来***************************
function tomb_sweep_story()
	Talk(2,"tomb_sweep_story_1",
	"    Tng truy襫 v祇 th阨 chi課 qu鑓 phi t� c馻 <color=green>T蕁 Hi課 C玭g<color> l� <color=green>Li C�<color> v� mu鑞 con m譶h <color=green>H� T�<color> k� v� n猲 ﹎ m璾 gi誸 h筰 th竔 t� <color=green>Th﹏ Sanh<color>, <color=green>Th﹏ Sanh<color> b� 衟 t� s竧. L骳 n祔   c馻 <color=green>Th﹏ Sanh<color> l� <color=green>Tr鋘g Nh�<color> nh籱 tr竛h s� truy gi誸 n猲  b� tr鑞, trong th阨 gian n祔 ch辵 m鋓 u u蕋, t飝 t飊g 甶 theo ch� c� m蕐 ngi, trong s�  c� ngi th﹏ t輓 t猲 <color=green>Gi韎 T� Th玦<color>. C� l莕 <color=green>Tr鋘g Nh�<color> ng蕋 x豼 v� i. <color=green>Gi韎 T� Th玦<color> m閠 l遪g c鴘 <color=green>ch�<color>  l衝 c総 mi課g th辴 c馻 m譶h, nng ch輓 d﹏g cho Tr鋘g Nh�. 19 n╩ sau <color=green>Tr鋘g Nh�<color> v� nc l祄 vua tr� th祅h 1 trong ng� b� th阨 Xu﹏ Thu hi謚 <color=green>T蕁 V╪ C玭g<color>.",
	"    <color=green>T蕁 V╪ C玭g<color> sau khi n緈 quy襫  ban thng h藆 h躰h cho nh鱪g ai  c飊g 玭g l璾 vong ch辵 kh� duy ch� c� <color=green>Gi韎 T� Th玦<color> l� kh玭g c�. V� r錳 c� ngi t蕌 v韎 <color=green>T蕁 V╪ C玭g<color> c﹗ chuy謓 trc kia m� <color=green>Gi韎 T� Th玦<color>  l祄. <color=green>T蕁 V╪ C玭g<color> ch筺h l遪g nh� l筰 chuy謓 c�, l藀 t鴆 cho ngi m阨 <color=green>Gi韎 T� Th玦<color> v� tri襲 th� phong. Цng ti誧 ngi c� 甶 m阨 m蕐 l莕 m� <color=green>Gi韎 T� Th玦<color> v蒼 t� ch鑙."
	)
end
function tomb_sweep_story_1()
	Talk(2,"tomb_sweep_story_2",
	"    <color=green>T蕁 V╪ C玭g<color> ch th﹏ 甶 m阨 cho b籲g 頲 nh璶g khi <color=green>T蕁 V╪ C玭g<color> n n琲 <color=green>Gi韎 T� Th玦<color> th� th蕐 c鯽 ng.  nh﹏ kh玭g l阨 t� bi謙 d蒼 m� tr鑞 v祇 <color=yellow>C萴 s琻<color>. <color=green>T蕁 V╪ C玭g<color> cho Ng� L﹎ qu﹏ t譵 kh緋 <color=yellow>C萴 s琻<color> v蒼 kh玭g th蕐, c� ngi a ra ch� � t r鮪g,  l筰 m閠 阯g s鑞g, khi l鯽 l韓 <color=green>Gi韎 T� Th玦<color> 総 ph秈 ch箉 ra.",
	"    <color=green>T蕁 V╪ C玭g<color> h� l謓h t r鮪g, l鯽 ch竬 ba ng祔 ba m v蒼 kh玭g th蕐 <color=green>Gi韎 T� Th玦<color> xu蕋 hi謓. дn khi l鯽 t総 ph竧 hi謓 tr猲 n骾 x竎 ch誸 ch竬 c馻 hai m� con <color=green>Gi韎 T� Th玦<color> 產ng 玬 ch苩 g鑓 c﹜. <color=green>T蕁 V╪ C玭g<color> nh譶 thi th� <color=green>Gi韎 T� Th玦<color> b藅 kh鉩, sau  cho ngi an t竛g t� t�, nh鱪g ngi an t竛g thi th� <color=green>Gi韎 T� Th玦<color> ph竧 hi謓 m閠 c竔 hang b猲 trong c� r蕋 nhi襲 , trong  c� t� 竜 tr猲 ghi m蕐 d遪g huy誸 th�: "
	)
end
function tomb_sweep_story_2()
	Talk(2,"",
	"    C竧 nh鬰 ph鬾g qu﹏ t薾 產n t﹎, n nguy謓 ch� c玭g thng Thanh Minh. \n Li評 h� t竎 qu� chung b蕋 ki課, cng t� b筺 qu﹏ t竎 gi竛 th莕. \nThng nhc ch� c玭g t﹎ h鱱 ng�, 鴆 ng� chi th阨 thng t� t豱h. \n Th莕 t筰 c鰑 tuy襫 t﹎ v� qu�, c莕 ch輓h thanh minh ph鬰 thanh minh.",
	"    <color=green>T蕁 V╪ C玭g<color> cho ngi an t竛g hai m� con <color=green>Gi韎 T� Th玦<color> di g鑓 c﹜ li評. V�  tng nh� <color=green>﹏ nh﹏<color> b蘮 ra l謓h i <color=yellow>C萴 s琻<color> th祅h <color=yellow>Gi韎 s琻<color>, tr猲 n骾 x﹜ d鵱g am mi評 th� c髇g ng th阨 ng祔 t r鮪g 頲 xem l� T誸 H祅 Th鵦, ngi d﹏ trong ng祔 n祔 kh玭g 頲 t l鯽, ch� ╪  ngu閕. \n N╩ th� hai <color=green>T蕁 V╪ C玭g<color> c飊g m qu莕 th莕 l猲 n骾 c髇g b竔  t� l遪g bi誸 琻. Sau khi c髇g b竔 b蘮 nh ng祔 n祔 l� <color=yellow>Ti誸 Thanh Minh<color>."
	)
end
