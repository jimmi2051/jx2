--File name:npc_qmtransportout.lua
--Describe:扫墓传送人（传出）
--Create Date:2006-3-16
--Author:yanjun
--脚本修改记录：
--2007年清明节活动修改。
--2008年清明节活动修改。byMoxian
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\qingming08\\head_qingming.lua")
Include("\\script\\lib\\lingshi_head.lua")
--================================以下是全局变量=======================================

tomb_sweep_2007_start_goodsID = 675
tomb_sweep_2008_task_reel_completed = 1849		--已完成的任务数
tomb_sweep_2008_task_reel_date_seq = 1852			--任务的日期序数
--tomb_sweep_2008_task_reel_date_seq这是记录每天任务次数是否更新用的
tomb_sweep_2008_task_reel_num = 1853					--可完成的任务数量
tomb_sweep_2008_task_reel_diff = 1854				--当前的任务种类
tomb_sweep_2008_task_reel_step = 1855				--当前任务步骤（杀怪）
task_reel_table = {
	--任务类型(（1、为杀怪；2为收集；3为灵石）-怪物名称-触发器ID-奖励百分几率-奖励倍数-返回的触发器索引--说明
	{1,"C玭 ",1205,5,11,900,"    Ti誸 Thanh Minh  n, ch� ta c� m閠 s� m藅  nhi謒 v� d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v�<color>: Ngo礽 th祅h c� nh鱪g t猲 <color=yellow>C玭 <color> l祄 h筰 b� t竛h, gi誸 <color=yellow>30<color> t猲 sau  quay v� <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n   <color=yellow>Ph莕 thng nhi謒 v�: x竎 su蕋 95%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>5%<color> x竎 su蕋 g蕄 <color=yellow>11<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒."},
	--任务类型-收集物品种类个数-任务奖励百分几率-任务奖励倍数-随机祭品数-收集的物品名称-收集的物品大类-副类-小类-数量--说明<color>
	{2,1,10,6,2,"H� v�",2,1,19,20,"    Ti誸 Thanh Minh  n, ch� ta c� m閠 s� m藅  nhi謒 v� d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v�: 玦 h�<color> l祄 thu鑓 c� th� 甶襲 tr� c竎 b謓h t藅, thu th藀 <color=yellow>20<color> <color=yellow>畊玦 h�<color> sau  quay v� <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n   <color=yellow>Ph莕 thng nhi謒 v�: x竎 su蕋 90%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>10%<color> x竎 su蕋 g蕄 <color=yellow>6<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒."},
	{1,"Quan s�",1206,16,4,901,"    Ti誸 Thanh Minh  n, ch� ta c� m閠 s� m藅  nhi謒 v� d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v�: Quan s�<color> � <color=yellow>Dng Trung ng<color> h� hi誴 b� t竛h, gi竜 hu蕁 <color=yellow>30<color> t猲 sau  quay v� <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n   <color=yellow>Ph莕 thng nhi謒 v�: x竎 su蕋 84%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>16%<color> x竎 su蕋 g蕄 <color=yellow>4<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒."},
	--任务类型-收集物品种类个数-任务奖励百分几率-任务奖励倍数-随机祭品数-收集的灵石名称-收集的灵石数量-收集的灵石数量的任务变量-说明
	{3,1,20,3.5,2,"Linh th筩h c蕄 1",4,SYS_TSK_LINGSHI_ONE,"    Ti誸 Thanh Minh  n, ch� ta c� m閠 s� m藅  nhi謒 v� d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v�<color>: Hi謓 tri襲 nh c莕 m閠 s� v藅 li謚, thu th藀 <color=yellow>4 Linh th筩h c蕄 1<color> sau  quay v� <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n   <color=yellow>Ph莕 thng nhi謒 v�: x竎 su蕋 80%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>20%<color> x竎 su蕋 g蕄 <color=yellow>3.5<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒."},
	{2,2,30,2.7,2,"B莡 ru da d�",2,1,60,10,"Kim Thoa",2,1,41,10,"    Ti誸 Thanh Minh  n, ch� ta c� m閠 s� m藅  nhi謒 v� d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v�<color>: Hi謓 tri襲 nh c莕 m閠 s� v藅 li謚, n <color=yellow>Ki誱 M玭 Quan<color> thu th藀 10 <color=yellow>b莡 ru da d�<color>, n <color=yellow>Ki誱 C竎 th鬰 o<color> thu th藀 10 <color=yellow>Kim Thoa<color> sau  quay v� Th� l╪g m� <color>ph鬰 m謓h.\n   <color=yellow>Ph莕 thng nhi謒 v�: x竎 su蕋 70%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>30%<color> x竎 su蕋 g蕄 <color=yellow>2.7<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒."},
	{3,2,40,2.25,2,"Linh th筩h c蕄 2",2,SYS_TSK_LINGSHI_TWO,"Linh th筩h c蕄 3",2,SYS_TSK_LINGSHI_THREE,"    Ti誸 Thanh Minh  n, ch� ta c� m閠 s� m藅  nhi謒 v� d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>Ph莕 thng nhi謒 v�<color>: T譵 <color=yellow>2 Linh th筩h c蕄 2<color>, <color=yellow>2 Linh th筩h c蕄 3<color> t v祇 T� Linh nh sau  quay v� <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n   <color=yellow>Ph莕 thng nhi謒 v�: x竎 su蕋 60%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>40%<color> x竎 su蕋 g蕄 <color=yellow>2.25<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒."},
	{2,2,50,2,2,"Gi竝 x竎 phi課",2,1,177,10,"Kh� S琻 ch�",2,1,98,10,"    Ti誸 Thanh Minh  n, ch� ta c� m閠 s� m藅  nhi謒 v� d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v�<color>: Hi謓 tri襲 nh c莕 m閠 s� v藅 li謚, thu th藀 10 <color=yellow>Gi竝 x竎 phi課 � Уo Hoa Фo<color>, 10 <color=yellow>b秐  r鮪g n骾 g鑓 � Чi Th秓 Nguy猲<color> sau  quay v� <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n   <color=yellow>Ph莕 thng nhi謒 v�: x竎 su蕋 50%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>50%<color> x竎 su蕋 g蕄 <color=yellow>2<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒."},
	{1,"Cao th� quan ngo筰",1207,65,1.75,902,"    Ti誸 Thanh Minh  n, ch� ta c� m閠 s� m藅  nhi謒 v� d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v�<color>: Cao th� quan ngo筰 <color=yellow>�<color> Long M玭 tr蕁  thng b� t竛h, gi誸 <color=yellow>30<color> t猲 sau  quay v� <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n   <color=yellow>Ph莕 thng nhi謒 v�: x竎 su蕋 35%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>65%<color> x竎 su蕋 g蕄 <color=yellow>1.75<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒."},
	{3,1,80,1.65,2,"Linh th筩h c蕄 4",2,SYS_TSK_LINGSHI_FOUR,"    Ti誸 Thanh Minh  n, ch� ta c� m閠 s� m藅  nhi謒 v� d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v�<color>: T譵 <color=yellow>2 Linh th筩h c蕄 4<color> t v祇 T� Linh nh sau  quay v� Th� l╪g m� ph鬰 m謓h.\n   <color=yellow>Ph莕 thng nhi謒 v�: x竎 su蕋 45%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>65%<color> x竎 su蕋 g蕄 <color=yellow>1.65<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒."},
	{1,"T莔 B秓 Nh﹏",1208,100,1.5,903,"    Ti誸 Thanh Minh  n, ch� ta c� m閠 s� m藅  nhi謒 v� d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v�: � Sa m筩 m� cung<color> c� <color=yellow>T莔 b秓 nh﹏<color>  thng kh玭g 輙 nh﹏ s� giang h�, gi誸 <color=yellow>30<color> t猲 sau  quay v� <color=yellow>Th� l╪g m�<color> ph鬰 m謓h.\n   <color=yellow>Ph莕 thng nhi謒 v�: 100%<color> x竎 su蕋 g蕄 <color=yellow>1.5<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒."}
	}
--========================================函数主逻辑区=====================================
--***********************************对话主函数****************************
function main()
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	local selTab = {}
	if task_diff == nil or task_diff == 0 then
		selTab = {
				"Xin a ta v�!/#gohome("..get_type()..")",
				"T譵 hi觰 ho箃 ng Ti誸 Thanh Minh./tomb_sweep_2007_inf",
				"M謙 qu�! Cho ng錳 ngh� ch髏 !/end_dialog",
				}
	else
		selTab = {
				"Xin a ta v�!/#gohome("..get_type()..")",
				"Nh薾 ph莕 thng./get_teel_task_prize",
				"H駓 nhi謒 v�./teel_task_release",
				"T譵 hi觰 ho箃 ng Ti誸 Thanh Minh./tomb_sweep_2007_inf",
				"M謙 qu�! Cho ng錳 ngh� ch髏 !/end_dialog",
				}
	end
	Say("<color=green>"..get_transport_name().."<color>:  t�"..Zgc_pub_sex_name().."n b竔 t� m� ch� nh﹏, c� c莕 ti觰 nh﹏ a ng礽 v� kh玭g?",getn(selTab),selTab);
end
--*******************************传回三大主城*****************************
function gohome(MapIndex)
	NewWorld(LeavePointTab[MapIndex][1],LeavePointTab[MapIndex][2],LeavePointTab[MapIndex][3]);
end
--********************************任务奖励换取****************************
function get_teel_task_prize()
	--在活动期间有效
	if is_qingming_opened() ~= 1 then				
		Talk(1,"","<color=green>"..get_transport_name().."<color>: Ti誸 Thanh Minh  qua, "..Zgc_pub_sex_name().."N誹 c� l遪g n╩ sau nh� n c髇g b竔!")
		return
	end
	--玩家负重检测
	if Zgc_pub_goods_add_chk(2,10) ~= 1 then
		return
	end
	--任务次数检测
	local reel_task_date_seq_save = GetTask(tomb_sweep_2008_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2008_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)	
	if reel_task_date_seq_save >= date_seq_now and reel_task_num_save == 0 then
		--收费区二次
		local nTemp = 0
		if IS_SHOUFEI == TRUE then
			nTemp = 2
		else
			nTemp = 1
		end
		Talk(1,"","<color=green>"..get_transport_name().."<color>: V祇 ti誸 Thanh Minh, m藅  nhi謒 v� m鏸 ng祔 ch� c� th� ho祅 th祅h <color=yellow>"..nTemp.."<color> l莕, Ngi c� th� v祇 Ng� C竎 mua <color=yellow>gi蕐 c髇g t�<color> t╪g s� l莕 ho祅 th祅h!")
		return
	end
	
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	--任务检测
	if task_diff == 0 or task_diff == nil then
		Talk(1,"","<color=green>"..get_transport_name().."<color>: Trc m� ti猲 nh﹏ kh玭g 頲 n鉯 b藋"..Zgc_pub_sex_name().."B籲g h鱱 nh薾 nhi謒 v� khi n祇?")
		return
	end
	--任务卷轴检测
	if GetItemCount(2,0,(tomb_sweep_2007_start_goodsID + task_diff -1)) < 1 then
		Talk(1,"","<color=green>"..get_transport_name().."<color>: Ngi kh玭g mang theo m藅  nhi謒 v�!")
		return
	end
	if task_reel_table[task_diff][1] == 1 then			--杀怪任务
		if GetTask(tomb_sweep_2008_task_reel_step) ~= 1 then
			Talk(1,"","<color=green>"..get_transport_name().."<color>: "..Zgc_pub_sex_name().."kh玭g 頲 n鉯 b藋 trc m� ti猲 nh﹏, l祄 xong nhi謒 v� m韎 n y!")
			return
		end
	elseif task_reel_table[task_diff][1] == 2 then    --普通物品任务
		--物品拥有检测
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 5
			if task_reel_table[task_diff][10+add_num] ~= 1 then
				if GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) < task_reel_table[task_diff][10+add_num] then
					Talk(1,"","<color=green>"..get_transport_name().."<color>: X竎 nh薾 ngi  mang  <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
					return
				end
			else
				if GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) < task_reel_table[task_diff][10+add_num] then
					Talk(1,"","<color=green>"..get_transport_name().."<color>: X竎 nh薾 ngi  mang  <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
					return
				--收装备时为了防止收错，多于收的件数一律不收。
				elseif GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) > task_reel_table[task_diff][10+add_num] then
					Talk(1,"","<color=green>"..get_transport_name().."<color>: "..task_reel_table[task_diff][6+add_num].."d� ra <color=yellow>1<color> c竔, l穙 phu kh玭g th� nh薾.")
					return
				end
			end
		end
	else --灵石任务
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 3
			if GetTask(task_reel_table[task_diff][8+add_num]) < task_reel_table[task_diff][7+add_num] then
				Talk(1,"","<color=green>"..get_transport_name().."<color>: X竎 nh薾 trong T� Linh nh c�  <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
					return
			end;--if
		end;--for
			
	end
	local player_level = GetLevel()
	local exp_chg_num = 0
	local exp_add_num = 0
	if IS_SHOUFEI == TRUE then--判断收费免费
		exp_chg_num = floor(600000*player_level*player_level/(80*80))
		exp_add_num = floor(900000*player_level*player_level/(80*80))
	else
		exp_chg_num = 0
		exp_add_num = floor(1200000*player_level*player_level/(80*80))
	end;
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	local szProbability = "0%"
	local nExpChgTimes = 0
	local nExpAddTimes = 0
	local n99Lingshi = 1
	local n99Book = 2
	if task_reel_table[task_diff][1] == 1  then			--杀怪任务
		szProbability = task_reel_table[task_diff][4].."%"
		nExpChgTimes = floor(exp_chg_num * (task_reel_table[task_diff][5]))
		nExpAddTimes = floor(exp_add_num * (task_reel_table[task_diff][5]))
		n99Lingshi = floor(task_reel_table[task_diff][5])
		n99Book = floor(2 * task_reel_table[task_diff][5])
	elseif  task_reel_table[task_diff][1] == 2 then
		szProbability = task_reel_table[task_diff][3].."%"
		nExpChgTimes = floor(exp_chg_num * (task_reel_table[task_diff][4]))
		nExpAddTimes = floor(exp_add_num * (task_reel_table[task_diff][4]))
		n99Lingshi = floor(task_reel_table[task_diff][4])
		n99Book = floor(2 * task_reel_table[task_diff][4])
	elseif	task_reel_table[task_diff][1] == 3 then
		szProbability = task_reel_table[task_diff][3].."%"
		nExpChgTimes = floor(exp_chg_num * (task_reel_table[task_diff][4]))
		nExpAddTimes = floor(exp_add_num * (task_reel_table[task_diff][4]))
		n99Lingshi = floor(task_reel_table[task_diff][4])
		n99Book = floor(2 * task_reel_table[task_diff][4])
	end
	--收费区100万健康*等级衰减+150万经验*等级衰减
	if IS_SHOUFEI == TRUE then
		local golden_exp = GetGoldenExp()
		if GetLevel() ~= 99 then
			if golden_exp < exp_chg_num then
				Say("<color=green>"..get_transport_name().."<color>: 觤 s鴆 kh醗 hi謓 t筰 c馻 ngi l� <color=yellow>"..golden_exp.."<color> 甶觤, kh玭g  i <color=yellow>"..exp_chg_num.."<color> 甶觤, ng th阨 nh薾 頲 <color=yellow>"..exp_add_num.."<color> kinh nghi謒. C� <color=yellow>"..szProbability.."<color> nh薾 頲 <color=yellow>"..nExpAddTimes.."<color> kinh nghi謒. C� mu鑞 i kh玭g?",
				2,
				"Ta x竎 nh薾/golden_exp_chg",
				"в ta suy ngh� l筰/end_dialog")
			else
				Say("<color=green>"..get_transport_name().."<color>: 觤 s鴆 kh醗 hi謓 t筰 c馻 ngi l� <color=yellow>"..golden_exp.."<color> 甶觤. Theo ng c蕄 hi謓 t筰 c馻 ngi, ngi c� th� l蕐 <color=yellow>"..exp_chg_num.."<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒, ng th阨 nh薾 頲 <color=yellow>"..exp_add_num.."<color> kinh nghi謒. C騨g c� <color=yellow>"..szProbability.."<color> l蕐 <color=yellow>"..nExpChgTimes.."<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒, ng th阨 nh薾 頲 <color=yellow>"..nExpAddTimes.."<color> kinh nghi謒. C� mu鑞 i kh玭g?",
				2,
				"Ta x竎 nh薾/golden_exp_chg",
				"в ta suy ngh� l筰/end_dialog")
			end	
		else
			Say("<color=green>"..get_transport_name().."<color>: Ngi nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 c蕄 1-7, <color>ho芻<color=yellow>"..szProbability.."<color> x竎 su蕋 nh薾 <color=yellow>"..n99Book.."<color> cu鑞 Thi猲 Th阨 Ch� Gi秈, <color=yellow>"..n99Lingshi.."<color> Linh th筩h ng蓇 nhi猲 c蕄 1~7. C� mu鑞 i kh玭g?",
				2,
				"Ta x竎 nh薾/golden_exp_chg",
				"в ta suy ngh� l筰/end_dialog")
		end
	else
		if GetLevel() ~= 99 then
			Say("<color=green>"..get_transport_name().."<color>: Hi謓 t筰 kinh nghi謒 nh薾 頲 c馻 ngi l� <color=yellow>"..exp_add_num.."<color> 甶觤, c� <color=yellow>"..szProbability.."<color> nh薾 頲 <color=yellow>"..nExpAddTimes.."<color> kinh nghi謒. C� mu鑞 i kh玭g?",
				2,
				"Ta x竎 nh薾/golden_exp_chg",
				"в ta suy ngh� l筰/end_dialog")
		else
			Say("<color=green>"..get_transport_name().."<color>: Ngi nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch� Gi秈, 1 Linh th筩h c蕄 c蕄 1-7, <color>ho芻<color=yellow>"..szProbability.."<color> x竎 su蕋 nh薾 <color=yellow>"..n99Book.."<color> cu鑞 Thi猲 Th阨 Ch� Gi秈, <color=yellow>"..n99Lingshi.."<color> Linh th筩h ng蓇 nhi猲 c蕄 1~7. C� mu鑞 i kh玭g?",
				2,
				"Ta x竎 nh薾/golden_exp_chg",
				"в ta suy ngh� l筰/end_dialog")
		end
	end
end
--*******************************健康经验转经验***************************
function golden_exp_chg()
	--99级负重检测
	if GetLevel() == 99 then
		if Zgc_pub_goods_add_chk(4,50) ~= 1 then
			return
		end
	else
		if Zgc_pub_goods_add_chk(3,50) ~= 1 then
			return
		end
	end
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	if task_reel_table[task_diff][1] == 2 then
		--物品删除检测
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 5
			if DelItem(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num],task_reel_table[task_diff][10+add_num]) ~= 1 then
				Talk(1,"","<color=green>"..get_transport_name().."<color>: X竎 nh薾 ngi  mang  <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>")
				return
			end
		end
	elseif task_reel_table[task_diff][1] == 3 then
		--灵石删除
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 3
			if GetTask(task_reel_table[task_diff][8+add_num]) < task_reel_table[task_diff][7+add_num] then
				Talk(1,"","<color=green>"..get_transport_name().."<color>: X竎 nh薾 trong T� Linh nh c�  <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
				return
			else
				SetTask(task_reel_table[task_diff][8+add_num],GetTask(task_reel_table[task_diff][8+add_num])-task_reel_table[task_diff][7+add_num]);
			end;--if
		end;--for
	end
	--任务卷轴删除检测
	if DelItem(2,0,(tomb_sweep_2007_start_goodsID + task_diff -1),1) ~= 1 then
		Talk(1,"","<color=green>"..get_transport_name().."<color>: Nh� mang theo m藅  Thanh Minh tng 鴑g v韎 nhi謒 v� ngi  l祄, n誹 kh玭g l穙 phu r蕋 kh� x�!")
		return
	end
	--祭品增加
	Talk(1,"","<color=green>"..get_transport_name().."<color>: R蕋 c秏 k輈h s� c鑞g hi課 c馻 ngi, m閠 ch髏 l� v藅 b祔 t� t﹎ �.")
	if tonumber(date("%y%m%d")) ~= 20080412 then			--最后一天不增加祭品
		for i = 1,2 do
			AddItem(2,0,random(387,389),1)
		end
	end
	--健康经验转经验
	local player_level = GetLevel()
	local golden_exp = GetGoldenExp()
	local exp_chg_num = 0
	local exp_add_num = 0
	if IS_SHOUFEI == TRUE then
		exp_chg_num = floor(600000*player_level*player_level/(80*80))
		exp_add_num = floor(900000*player_level*player_level/(80*80))
	else
		exp_chg_num = 0
		exp_add_num = floor(1200000*player_level*player_level/(80*80))
	end
	if player_level ~= 99 then
		--收费区100万健康*等级衰减+150万经验*等级衰减
		if task_reel_table[task_diff][1] == 1 and random(1,100) <= task_reel_table[task_diff][4] then			--杀怪任务
			exp_chg_num = exp_chg_num * (task_reel_table[task_diff][5])
			exp_add_num = exp_add_num * (task_reel_table[task_diff][5])
		elseif  task_reel_table[task_diff][1] == 2 and  random(1,100) <= task_reel_table[task_diff][3] then
			exp_chg_num = exp_chg_num * (task_reel_table[task_diff][4])
			exp_add_num = exp_add_num * (task_reel_table[task_diff][4])
		elseif	task_reel_table[task_diff][1] == 3 and	random(1,100)	<= task_reel_table[task_diff][3] then
			exp_chg_num = exp_chg_num * (task_reel_table[task_diff][4])
			exp_add_num = exp_add_num * (task_reel_table[task_diff][4])
		end
		if GetTask(tomb_sweep_2008_task_reel_completed) == 7 then--完成8次卷轴任务得到奖励e
			exp_chg_num = exp_chg_num * 5
			exp_add_num = exp_add_num * 5
		end --ifGetTask
		exp_chg_num = floor(exp_chg_num)--向下取整
		if exp_chg_num > golden_exp then
			exp_chg_num = golden_exp
		end
		if IS_SHOUFEI == TRUE then
			if exp_chg_num ~= 0 then
				ModifyGoldenExp(-exp_chg_num)
				ModifyExp(exp_chg_num)
				Msg2Player("Ch骳 m鮪g b筺 chuy觧"..exp_chg_num.." 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒!")
			end
		end
		exp_add_num = floor(exp_add_num)
		ModifyExp(exp_add_num)
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..exp_add_num.." 甶觤 kinh nghi謒!")
	else
		local n99Times = 1
		local n99Book = 2
		if task_reel_table[task_diff][1] == 1 and random(1,100) <= task_reel_table[task_diff][4] then			--杀怪任务
			n99Times = task_reel_table[task_diff][5]
		elseif  task_reel_table[task_diff][1] == 2 and  random(1,100) <= task_reel_table[task_diff][3] then
			n99Times = task_reel_table[task_diff][4]
		elseif	task_reel_table[task_diff][1] == 3 and	random(1,100)	<= task_reel_table[task_diff][3] then
			n99Times = task_reel_table[task_diff][4]
		end
		if mod(GetTask(tomb_sweep_2008_task_reel_completed),8) == 7 then--完成8次卷轴任务得到奖励e
			n99Times = 5
			Msg2Player("Do ngi  ho祅 th祅h 8 l莕 nhi謒 v�, cho n猲 nh薾 頲 ph莕 thng g蕄 5 l莕!")
		end --ifGetTask
		n99Book = floor(n99Book * n99Times)
		if Zgc_pub_goods_add_chk(2,50) == 1 then--天时注解可以叠加999本
			AddItem(2,1,3210,n99Book)--获得天时注解n99Book本
			Msg2Player("B筺 nh薾 頲 Thi猲 Th阨 Ch� Gi秈 "..n99Book.." quy觧!")
		end --if zgc_pub_gooods_add_chk
		n99Times = floor(n99Times)
		local nTemp = 1
		for nTemp = 1,n99Times,1 do
			--======获得随机1-7灵石1颗,获得7级灵石的几率调整到1/20
			local lvLingShi = 1
			local nRander = random(1,210)
			if nRander <= 120 then
				--1~4级灵石
				lvLingShi = random(1,4)
			elseif nRander <= 203 then
				--5~6级灵石
				lvLingShi = random(5,6)
			else
				lvLingShi = 7
			end
			SetTask(SYS_TSK_LINGSHI_ONE + lvLingShi - 1,GetTask(SYS_TSK_LINGSHI_ONE + lvLingShi - 1)+1)
			Msg2Player("B筺 nh薾 頲 "..lvLingShi.."(c蕄) Linh Th筩h!")
		end--for
	end -- lv99
	--任务完成处理
		--数据获取
	if task_reel_table[task_diff][1] == 1 then				--如果是杀怪任务则删除杀怪触发器
		RemoveTrigger(GetTrigger(task_reel_table[task_diff][6]))--重复删除触发器？
	end
	local reel_task_date_seq_save = GetTask(tomb_sweep_2008_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2008_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)
	--数据保存
	if reel_task_date_seq_save < date_seq_now then
		SetTask(tomb_sweep_2008_task_reel_date_seq,date_seq_now)
		if IS_SHOUFEI == TRUE then
			SetTask(tomb_sweep_2008_task_reel_num,1)
			--清空昨日的任务次数？>.<收费区每天两次，做了一次，还剩一次
		else
			SetTask(tomb_sweep_2008_task_reel_num,0)
		end
		--tomb_sweep_2008_task_reel_date_seq这是记录每天任务次数是否更新用的
	elseif reel_task_date_seq_save >= date_seq_now and reel_task_num_save > 0 then
		SetTask(tomb_sweep_2008_task_reel_num,(reel_task_num_save-1))
	else
		SetTask(tomb_sweep_2008_task_reel_num,0)
	end;
	SetTask(tomb_sweep_2008_task_reel_completed,GetTask(tomb_sweep_2008_task_reel_completed)+1)
	SetTask(tomb_sweep_2008_task_reel_diff,0)
	SetTask(tomb_sweep_2008_task_reel_step,0)
end
--**********************************任务取消******************************
function teel_task_release()
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	if task_diff == 0 or task_diff == nil then
		Talk(1,"","<color=green>"..get_transport_name().."<color>: Trc m� ti猲 nh﹏ kh玭g 頲 n鉯 b藋"..Zgc_pub_sex_name().."Ngi ch璦 nh薾 qua nhi謒 v� n猲 kh玭g th� h駓!")
		return
	elseif task_diff >= 1 and task_diff <= 10 then
		Say("<color=green>"..get_transport_name().."<color>: M藅  n祔 l� "..Zgc_pub_sex_name().."ngi h鱱 duy猲 m韎 c�, ngi th藅 s� mu鑞 h駓 kh玭g?",
		2,
		"ng/task_release_dtm",
		"в ta suy ngh� l筰/end_dialog"
		)
	else			--数据出错的情况
		SetTask(tomb_sweep_2008_task_reel_diff,0)
	end
end
--********************************任务数据清除*******************************
function task_release_dtm()
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	if task_reel_table[task_diff][1] == 1 then				--如果是杀怪任务则删除杀怪触发器
		RemoveTrigger(GetTrigger(task_reel_table[task_diff][6]))
	end
	SetTask(tomb_sweep_2008_task_reel_diff,0)
	Msg2Player("B筺  h駓 nhi謒 v� Thanh Minh!")
end
--********************************活动详情描述*******************************
function tomb_sweep_2007_inf()
	Talk(2,"tomb_sweep_2007_inf_1",
	"<color=green>"..get_transport_name().."<color>:\n    Th阨 gian ho箃 ng: <color=yellow>3/4-12/4<color>. \n    Trong Ti誸 Thanh Minh vi謈 t秓 m� l� ch� y誹, ta c莕 c髇g b竔 c竎 v� nh� <color=yellow>Ho祅g i hi謕, H祅 i hi謕, Hi猲 Vi猲 i hi謕<color>.",
	"<color=green>"..get_transport_name().."<color>:\n    Trong Ti誸 Thanh Minh m鏸 ng祔 n b蕋 k� m� ph莕 c髇g b竔 <color=yellow>1<color> l莕 b籲g c竎h '<color=yellow>v竔 l箉<color>' l� 頲. B� i hi謕 kh輈h l�, s� khi課 cho kinh nghi謒 giang h� c馻 ngi t╪g kh玭g 輙. C遪 c� c� h閕 t╪g kinh nghi謒 giang h�. N誹 trong th阨 gian di詎 ra ho箃 ng, th祅h t﹎ c髇g b竔 <color=yellow>8<color> ng祔, s� nh薾 頲 kh輈h l� l韓"
	)
end
function tomb_sweep_2007_inf_1()
	Talk(2,"","<color=green>"..get_transport_name().."<color>:\n    C髇g b竔 m鏸 ng祔 c遪 nh薾 頲 nhi謒 v� do <color=yellow>Th� L╪g M�<color> giao. Ho祅 th祅h nhi謒 v� mang <color=yellow>m藅 <color> giao tr� <color=yellow>Th� L╪g M�<color> s� nh薾 頲 ph莕 thng <color=yellow>nh蕋 nh<color> v� <color=yellow>v藅 ph萴 c髇g b竔<color>.",
		"<color=green>"..get_transport_name().."<color>:\n    V藅 ph萴 c髇g b竔 s� d鬾g trc khi c髇g m鏸 ng祔 x竎 su蕋 t╪g kinh nghi謒 giang h� nh薾 頲 r蕋 cao. H玬 nay  c髇g r錳 kh玭g th� s� d鬾g l筰."
)
end
