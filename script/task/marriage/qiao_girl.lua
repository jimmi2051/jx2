--脚本名称:巧女对话脚本
--脚本功能:结婚二期NPC"巧女"对话脚本,用于随机增加任务卷轴
--策划人:铁羊
--代码开发人:村长
--代码开发时间:2007年5月15日
--代码修改记录
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
CALLBACK_FILE = "\\script\\task\\marriage\\qiao_girl.lua";
--================================公共变量定义区================================
	Frag_att_num_TaskID = 1220
	goods_id_chg_use_id = 168
	goods_id_chg_id = 169
	get_task_reel_TaskID = 1216

	Tb_frag = {}
	Tb_frag[568] = "Gi竝 M閏 dng"
	Tb_frag[569] = "蕋 M閏 ﹎"
	Tb_frag[570] = "B輓h h醓 dng"
	Tb_frag[571] = "nh H醓 ﹎"

	Tb_ring_up_info = {
	{104,105,"Nh蒼 kim cng thng"},
	{106,107,"Nh蒼 kim cng"}
	}

	Tb_ring_attr = {
		{115,20,40,60,80,100},
		{421,20,40,60,80,100}
	}
function main()
	local mate_name = GetMateName()
	if mate_name == "" or mate_name == nil then
		Say("<color=green> <color>: Ngi n祔 <color=yellow>"..Zgc_pub_sex_name().."<color> c� � trung nh﹏ ch璦? дn t譵 ta khi  th祅h h玭!",
		3,
		"T玦 mu鑞 dem theo khi ch誸/kill_follower",
		"Ta mu鑞 s鯽 v蕁  k誸 h玭/repair_marriage",
		"R阨 kh醝/end_dialog")
	else
		if BigGetItemCount(2,1,583) == 0 then
			if Zgc_pub_goods_add_chk(1,1) ~= 1 then
				return
			else
				AddItem(2,1,583,1)
			end
		end
		Say("<color=green> <color>: Ta l� X秓 N� tr猲 tr阨, th輈h gi髉 m鋓 ngi c� t譶h nh﹏. Th阨 gian n祔 c� nhi襲 L璾 tinh r琲 xu鑞g, ch� c莕 ngi v� t譶h nh﹏ <color=yellow>m鏸 tu莕 <color> 1 l莕 n nh薾 <color=yellow>Nhi謒 v� Phu th�<color>, s� t譵 頲 m秐h v� L璾 tinh, d飊g n� h頿 th祅h v藅 qu� hi誱,  t譶h c秏 v� ch錸g th猰 sau m, c� th� h鋍 頲 s鴆 m筺h c bi謙 trong H玭 Nh﹏. Sau khi nh薾 <color=yellow>Khi猲 V﹏ Phi Tinh Ph�<color> th� nh薾 <color=yellow>Nhi謒 v� Phu th�<color> tu莕 n祔.",
		8,
		"T玦 mu鑞 nh薾 Nhi謒 v� Phu th� tu莕 n祔/get_task_dtm",
		"T玦 mu鑞 trao i m秐h v� ph輆 tr猲/ma_frag_chg",
		"T玦 mu鑞 i thu閏 t輓h nh蒼/up_diamand_ring",
		"Thuy誸 minh Nhi謒 v� Phu th�/get_att_info",
		"Thuy誸 minh k� n╪g Phu th�/ma_skill_info",
		"T玦 mu鑞 dem theo khi ch誸/kill_follower",
		"Ta mu鑞 s鯽 v蕁  k誸 h玭/repair_marriage",
		"R阨 kh醝/end_dialog"
	)
	end
end

function kill_follower()
	local selTab = {
				"уng �/kill_follower_confirm",
				"H駓 b�/end_dialog",
				}
	Say("<color=green> <color>: N誹 b筺 cho r籲g qu� Xu蕋 H錸 c� v蕁 , ch鋘 'X竎 nh' h駓 b� v藅 甶 theo, n誹 kh玭g c� th� ng ch鋘.",getn(selTab),selTab);
end;

function kill_follower_confirm()
	KillFollower();
end;
--钻戒升级
function up_diamand_ring()
	Say("<color=yellow> n祔"..Zgc_pub_sex_name().."<color>, c竎 ngi c遪 y猽 nhau kh玭g? H穣 mang <color=yellow>nh蒼 kim cng<color> tng tr璶g cho l阨 th� t譶h y猽 n, ta s� d飊g ti猲 thu藅 l祄 t╪g t譶h y猽 c馻 c竎 ngi. Nh璶g <color=yellow>nh蒼 kim cng<color> sau khi th╪g c蕄 s� theo ngi su鑤 i, <color=red>kh玭g 頲 giao d辌h n鱝<color>. S� ti猽 hao <color=yellow>10<color> vi猲 <color=yellow>L璾 tinh chi sa<color> v� <color=yellow>5<color> vi猲 <color=yellow>B祅 long b輈h<color>. C� mu鑞 th猰 thu閏 t輓h cho nh蒼 kim cng kh玭g?",
	3,
	"уng �/ring_up_way",
	"L祄 sao c� 頲 l璾 tinh chi sa/star_ash_inf",
	"в ta suy ngh� l筰/end_dialog"
	)
end
--怎样得到流星之沙
function star_ash_inf()
	Talk(1,"","Ta nghe n鉯 l骳 n祔 c� m閠 ngi t猲 �<color=green>Tr莕 c玭g t�<color>� ho箃 ng kh緋 n琲, trong qu� tr譶h t譵 <color=yellow>m秐h L璾 tinh<color>, c� khi s� g苝 h緉 ho芻 th� h�, h� s� ch� ng c玭g k輈h. Nh璶g c竎 ngi kh玭g ph秈 s�, b鋘 ngi n祔 n╪g l鵦 kh玭g m筺h, sau khi nh b筰 b鋘 h�, s� c� 頲 <color=yellow>L璾 tinh chi sa<color>.")
end
--升级方式选择
function ring_up_way()
	Say("Nh蒼 kim cng c� <color=yellow>hai<color> thu閏 t輓h. M閠 l� nh qu竔 c� 頲 kinh nghi謒 t╪g th猰; hai l� t╪g t蕋 c� 甶觤 s�. M鏸 l莕 th猰 thu閏 t輓h ph秈 ti猽 hao <color=yellow>5<color> vi猲 <color=yellow>B祅 long b輈h<color>. H穣 th猰 thu閏 t輓h cho nh蒼 kim cng Ph� th玭g, hay kh玭g h礽 h礽 l遪g v� thu閏 t輓h c馻 <color=yellow>nh蒼 kim cng<color>  c�, c� mu鑞 <color=yellow>th猰 l筰 thu閏 t輓h<color>? Nh綾 l莕 n鱝, <color=yellow>nh蒼 kim cng<color> th猰 thu閏 t輓h kh玭g 頲 giao d辌h.",
	3,
	"Ta mu鑞 th猰 thu閏 t輓h cho nh蒼 kim cng Ph� th玭g/#ring_up(1)",
	"Ta kh玭g h礽 l遪g v韎 thu閏 t輓h nh蒼 kim cng hi謓 nay, mu鑞 th猰 thu閏 t輓h/ring_reup_dtm",
	"в ta suy ngh� l筰/end_dialog"
	)
end
--重新升级戒指确认对话
function ring_reup_dtm()
	Say("Tuy ta c� th� <color=yellow>ban<color> thu閏 t輓h, nh璶g do thu閏 t輓h c閚g th猰 xu蕋 hi謓 ng蓇 nhi猲, ta kh玭g th� b秓 m thu閏 t輓h l莕 n祔 s� t鑤 h琻 l莕 trc. Ngi c遪 mu鑞 <color=yellow>th猰 l筰 thu閏 t輓h<color> kh玭g?",
		2,
		"уng �/#ring_up(2)",
		"в ta suy ngh� l筰/end_dialog"
	)
end
--钻戒升级
function ring_up(up_diff)
	--戒指携带检测
	local player_sex = GetSex()
	local ring_num = GetItemCount(0,102,Tb_ring_up_info[up_diff][player_sex])
	if ring_num == 0 then
		Talk(1,"","<color=yellow> n祔"..Zgc_pub_sex_name().."<color>, ta ch璦 th蕐 <color=yellow>nh蒼 kim cng<color> c馻 ngi.")
		return
	end
	if up_diff == 2 and ring_num ~= 1 then
		Talk(1,"","<color=yellow> n祔"..Zgc_pub_sex_name().."<color>  mang <color=red>"..ring_num.."<color> chi誧 <color=yellow>nh蒼 kim cng<color>, ta bi誸 ch鋘 c竔 n祇? H穣 s緋 x誴 l筰.")
		return
	end
	--磐龙璧携带检测
	if GetItemCount(2,1,1000) < 5 then
		Talk(1,"","<color=yellow>Thu閏 t輓h<color> kim cng c莕 luy謓 ng鋍, n猲 kh玭g th� thi誹 <color=yellow>B祅 Long b輈h<color>, ngi h穣 mang <color=yellow>5<color> vi猲 <color=yellow>B祅 Long b輈h<color> n  th猰 thu閏 t輓h cho nh蒼 kim cng. <color=yellow>B祅 Long b輈h<color> c� b竛 <color=yellow>t筰<color>Ng� C竎 Thng L筩 Hi猲.")
		return
	end
	--流星之沙携带检测
	if GetItemCount(2,1,584) < 10 then
		Talk(1,"","Thu閏 t輓h <color=yellow>nh蒼 kim cng<color> ph秈 bao h祄 nguy猲 t� L璾 tinh, n猲 c莕 n <color=yellow>10<color> m秐h <color=yellow>L璾 tinh chi sa<color>, n誹 kh玭g ta c騨g b� tay. H穣 thu th藀 <color=yellow>10<color> vi猲 <color=yellow>L璾 tinh chi sa<color> r錳 h穣 n.")
		return
	end
	--负重空间检测
	if Zgc_pub_goods_add_chk(1,20) ~= 1 then
		return
	end
	--流星之沙删除检测
	if DelItem(2,1,584,10) ~= 1 then
		Talk(1,"","Thu閏 t輓h <color=yellow>nh蒼 kim cng<color> ph秈 bao h祄 nguy猲 t� L璾 tinh, n猲 c莕 n <color=yellow>10<color> m秐h <color=yellow>L璾 tinh chi sa<color>, n誹 kh玭g ta c騨g b� tay. H穣 thu th藀 <color=yellow>10<color> vi猲 <color=yellow>L璾 tinh chi sa<color> r錳 h穣 n.")
		return
	end
	--磐龙璧删除检测
	if DelItem(2,1,1000,5) ~= 1 then
		Talk(1,"","<color=yellow>Thu閏 t輓h<color> kim cng c莕 luy謓 ng鋍, n猲 kh玭g th� thi誹 <color=yellow>B祅 Long b輈h<color>, ngi h穣 mang <color=yellow>5<color> vi猲 <color=yellow>B祅 Long b輈h<color> n  th猰 thu閏 t輓h cho nh蒼 kim cng. <color=yellow>B祅 Long b輈h<color> c� b竛 <color=yellow>t筰<color>Ng� C竎 Thng L筩 Hi猲.")
		return
	end
	--戒指删除检测
	if DelItem(0,102,Tb_ring_up_info[up_diff][player_sex],1) ~= 1 then
		Talk(1,"","<color=yellow> n祔"..Zgc_pub_sex_name().."<color>, ta ch璦 th蕐 <color=yellow>nh蒼 kim cng<color> c馻 ngi.")
		return
	end
	--戒指增加
		--戒指属性生成
		local ran_num_1 = random(1,Tb_ring_attr[1][6])
		local ran_num_2 = random(1,Tb_ring_attr[2][6])
		local attr_level_1 = 1
		local attr_level_2 = 1
		for i = 2,6 do
			if ran_num_1 <= Tb_ring_attr[1][i] then
				attr_level_1 = i - 1
				break
			end
		end
		for i = 2,6 do
			if ran_num_2 <= Tb_ring_attr[2][i] then
				attr_level_2 = i - 1
				break
			end
		end
		--戒指增加
		local add_flag = AddItem(0,102,Tb_ring_up_info[2][player_sex],1,1,attr_level_1,Tb_ring_attr[1][1],attr_level_2,Tb_ring_attr[2][1],-1,-1)
		if add_flag == 1 then
			Talk(1,"","Ta  nh譶 th蕐 bi觰 hi謓 t譶h y猽 c馻 c竎 ngi, y l� ph莕 thng cho s� chung th駓 c馻 c竎 ngi, ch骳 c竎 ngi s鑞g n u b筩 r╪g long, l骳 n祇 c騨g gi� ch苩 l阨 th� s綾 son tr猲 chi誧 nh蒼 n祔. N誹 kh玭g h礽 l遪g v� thu閏 t輓h c馻 <color=yellow>nh蒼 kim cng<color>, c� th� thu th藀 th猰 <color=yellow>10<color> m秐h <color=yellow>L璾 tinh chi sa<color> r錳 n t譵 ta, ta c� th� <color=yellow>th猰<color> thu閏 t輓h gi髉 ngi.")
			return
		else
			WriteLog("K誸 h玭 k� hai-Ngi ch琲:"..GetName().."Th╪g c蕄 nh蒼 b� l鏸, log l�:"..add_flag)
		end
end
--*******************************碎片交换**************************
function ma_frag_chg()
	Say("Ta c� th� i gi髉 ngi <color=yellow>m秐h 產ng c�<color> th祅h m秐h <color=yellow>kh竎<color>. Nh璶g c竎h n祔 ti猽 hao nhi襲 nguy猲 kh�, n猲 ch� c� th� d飊g <color=red>3 m秐h gi鑞g nhau i l蕐 1 m秐h<color>. Ngi mu鑞 i <color=yellow>m秐h<color> n祇?",
	5,
	"Ta mu鑞 i Gi竝 M閏 Dng/#ma_frag_chg_use(568)",
	"Ta mu鑞 i 蕋 M閏 /#ma_frag_chg_use(569)",
	"Ta mu鑞 i B輓h H醓 Dng/#ma_frag_chg_use(570)",
	"Ta mu鑞 i nh H醓 /#ma_frag_chg_use(571)",
	"в ta suy ngh� l筰/end_dialog"
	)
end
function ma_frag_chg_use(use_goods_id)
	--数量判断
	if GetItemCount(2,1,use_goods_id) < 3 then
		Talk(1,"","<color=yellow>Ngi kh玭g c�  -"..Tb_frag[use_goods_id].."<color> <color=red>3<color> vi猲, kh玭g th� i!")
		return
	end
	--对话
	local dia_chg = {}
	for i = 568, 571 do
		if i ~= use_goods_id then
			tinsert(dia_chg,"Ta mu鑞 i "..Tb_frag[i].."/#chg_num_in("..use_goods_id..","..i..")")
		end
	end
	tinsert(dia_chg,"в ta suy ngh� l筰/end_dialog")
	Say("Ngi c� th� i <color=red>3<color> vi猲"..Tb_frag[use_goods_id].."  i <color=yellow>1<color> m秐h <color=red>L璾 tinh<color> kh竎 <color=yellow>t飝 �<color>, ngi mu鑞 i m秐h n祇?",
		getn(dia_chg),
		dia_chg
	)
end
--交换的数量输入
function chg_num_in(use_goods_ID,goods_ID)
	SetTaskTemp(goods_id_chg_use_id,use_goods_ID)
	SetTaskTemp(goods_id_chg_id,goods_ID)
	local goods_num_max = floor(GetItemCount(2,1,use_goods_ID)/3)
	AskClientForNumber("ma_chg_deal",1,goods_num_max,"H穣 nh藀 s� lng i")
end
--交换的操作
function ma_chg_deal(chg_num)
	if chg_num == 0 then
		return
	end
	--数据取出
	local use_goods_ID = GetTaskTemp(goods_id_chg_use_id)
	local goods_Id = GetTaskTemp(goods_id_chg_id)
	SetTaskTemp(goods_id_chg_use_id,0)
	SetTaskTemp(goods_id_chg_id,0)
	--数据校验
	if use_goods_ID <568 or use_goods_ID > 571 or goods_Id <568 or goods_Id > 571 then
		return
	end
	if use_goods_ID == goods_Id then
		return
	end
	--物品数量检测
	if GetItemCount(2,1,use_goods_ID) < (chg_num * 3) then
		Talk(1,"","<color=yellow>Ngi kh玭g c�  -"..Tb_frag[use_goods_ID].."<color>, kh玭g th� i!")
		return
	end
	--玩家包裹空间和负重检测
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--材料删除检测
	if DelItem(2,1,use_goods_ID,(chg_num * 3)) ~= 1 then
		Talk(1,"","<color=yellow>Ngi kh玭g c�  -"..Tb_frag[use_goods_ID].."<color>, kh玭g th� i!")
		return
	else
		if AddItem(2,1,goods_Id,chg_num) == 1 then
			Msg2Player("Ch骳 m鮪g b筺  i 頲 r錳."..chg_num.."c竔"..Tb_frag[goods_Id].."!")
		end
	end
end
--获得元素方位对话
function ma_skill_info()
	Talk(3,"ma_skill_info_1",
				"<color=yellow>K� n╪g phu th�<color> l� k誸 qu� t譶h y猽 gi鱝 hai v� ch錸g, mu鑞 h鋍 k� n╪g phu th� ph秈 chia l祄 <color=yellow>3 bc<color>.",
				"<color=red>Bc th� nh蕋:<color> t譵 <color=yellow>m秐h L璾 tinh<color>, a m秐h L璾 tinh t譵 頲 v祇 <color=yellow>Khi猲 V﹏ Phi Tinh ph�<color>.",
				"<color=red>Bc th� hai:<color> d飊g <color=yellow>Khi猲 V﹏ Phi Tinh ph�<color> h頿 th祅h <color=yellow>S竎h k� n╪g h玭 nh﹏<color>. Trong , <color=yellow>b鎛 quy觧<color> 頲 <color=yellow>s� d鬾g<color> khi h鋍 k� n╪g, <color=yellow>t祅 quy觧<color> 頲 <color=yellow>s� d鬾g<color> khi n﹏g c蕄 k� n╪g."
		)
end
function ma_skill_info_1()
	Talk(2,"",	"<color=red>Bc th� ba:<color> l� <color=yellow>nh蕄 chu閠 ph秈<color> s� d鬾g quy觧 k� n╪g h玭 nh﹏, s� h鋍 頲 k� n╪g tng 鴑g.",
				"Hi謓 t筰 c� <color=yellow>3<color> k� n╪g. M閠 l� <color=yellow>tng t�<color>, c� t竎 d鬾g <color=yellow>Phu th� truy襫 t鑞g l蒼 nhau<color>; hai l� <color=yellow>揌鉧 甶謕�<color>, c� t竎 d鬾g <color=yellow>h錳 sinh b筺 i<color>; ba l� <color=yellow>摟i謕 bi課�<color>, c� t竎 d鬾g <color=yellow>t╪g cng n╪g l鵦 c馻 b筺 i trong m閠 th阨 gian<color>."
	)
end
--*********************************获得任务************************
--获得元素方位对话
function get_task_dtm()
	Say("Nh﹏ gian k誸 duy猲, tr阨 ban 甶襪 l祅h. C竎 ngi  se s頸 ch� h錸g, k誸 th祅h phu th�, c� th� t譵 d蕌 v誸 L璾 tinh r琲 xu鑞g t. � y tu莕 n祇 ta c騨g ghi l筰 v� tr� L璾 tinh r琲 v祇 quy觧 Khi猲 V﹏ Phi Tinh ph�. Ngi c� ch綾 mu鑞 ghi v� tr� <color=yellow>tu莕 n祔<color> v祇 <color=yellow>Khi猲 V﹏ Phi Tinh ph�<color>?",
	2,
	"уng �/get_task",
	"H駓 b�/end_dialog"
	)
end
function get_task()
	--本周是否已经领取过检测
	if GetTask(get_task_reel_TaskID) == Zgc_pub_week_seq() then
		Talk(1,"","Tu莕 n祔 ngi  nh薾 nhi謒 v� phu th�, mu鑞 ghi th猰 nhi襲 v� tr� th� tu莕 l筰 n!")
		return
	end
	--携带纤云飞星谱检测
	if GetItemCount(2,1,583) == 0 then
		Talk(1,"","Xin x竎 nh薾 c� mang theo <color=yellow>Khi猲 V﹏ Phi Tinh ph�<color>!")
		return
	end
	--给予任务
	local ran_num = random(1,100)
	local task_num = 14
	if ran_num <= 30 then
		task_num = 21
	elseif ran_num <= 20 then
		task_num = 42
	end
	SetTask(Frag_att_num_TaskID,(GetTask(Frag_att_num_TaskID)+task_num))
	SetTask(get_task_reel_TaskID,Zgc_pub_week_seq())
	Talk(1,"","Ngi  c� 頲"..task_num.." v� tr� L璾 tinh, ta  ghi n� v祇 trong <color=yellow>Khi猲 V﹏ Phi Tinh ph�<color> c馻 ngi . Nh蕄 v祇 v藅 ph萴 n祔 s� c� 頲 t鋋  L璾 tinh!")
end
--**************************流星采集说明************************
function get_att_info()
	Talk(3,"OnUse",
					"<color=yellow>Nhi謒 v� phu th�<color> c� t竎 d鬾g nh薾 <color=yellow>b秓 v藅 phu th�<color>, c� <color=yellow>hai bc<color> c� 頲 b秓 v藅. <color=yellow>Bc th� nh蕋:<color> nh薾 m秐h <color=yellow>L璾 tinh<color> khu v鵦 ngo礽 th祅h; <color=yellow>Bc th� hai:<color> s� d鬾g nh鱪g m秐h n祔  <color=yellow>h頿 th祅h b秓 v藅 phu th�<color>.",
					"<color=yellow>Ngo礽 th祅h<color> lu玭 c� L璾 tinh r琲 xu鑞g, n猲 ngi c� th� <color=yellow>s� d鬾g Khi猲 V﹏ Phi Tinh ph�<color> tra xem ch� n祇 c� m秐h L璾 tinh. <color=yellow>M秐h<color> t譵 頲 <color=yellow>� m鏸 b秐 <color> u kh竎 nhau, th玭g thng <color=green>b秐  ng c蕄 c祅g cao, c祅g t譵 頲 m秐h cao c蕄<color>.",
					"Nhi謒 v� phu th� c莕 c� <color=yellow>t� i phu th�<color>, kh玭g cho ngi kh竎 v祇. Sau khi t� i, ngi s� d鬾g Khi猲 V﹏ Phi Tinh ph� ph竧 nhi謒 v� phu th�, <color=yellow>hai v� ch錸g c� th� nh薾 m鏸 ngi n鯽 甶觤 t鋋  L璾 tinh<color>. <color=red>Nam nh薾 t鋋  X, n� nh薾 t鋋  Y<color>. <color=yellow>Ngi s� d鬾g Khi猲 V﹏ Phi Tinh ph�<color> th鵦 hi謓 m閠 <color=yellow>ng t竎 t譶h t�<color> t筰 t鋋  ch� nh, s� nh薾 頲 <color=yellow>m秐h L璾 tinh<color>. Ch� �, khi <color=yellow>nh薾 t鋋  m秐h, ph秈 t� i phu th� v� trong c飊g m閠 khu v鵦<color>, kh玭g cho ngi kh竎 v祇."
	)
end

--=========================================================================
function repair_marriage()
	AddRelayShareData("wojiubuxinhuichongming_yj",0,0,CALLBACK_FILE,"callback_main",0,"key","d",0);
end;

function callback_main()
	local selTab = {
				"Ta bi誸 r錳, ta mu鑞 s鯽/repair_marriage_confirm",
				"\nTa kh玭g c� v蕁  g�, kh玭g c莕 s鯽/end_dialog",
				}
	Say("<color=green>X秓 n�<color>: Ngi x竎 nh薾 mu鑞 s鯽 v蕁  k誸 h玭? N誹 ngi trong qu� tr譶h t筼 h玭 c g苝 頲 b� mai i tho筰 kh玭g hng 鴑g ho芻 do nguy猲 nh﹏ kh竎 d蒼 n b筺 kh玭g th� k誸 h玭, ngi c� th� th� s鯽 � ch� ta.<color=red>Ch� �: Sau khi s鯽 v蕁  ph秈 giao l筰 s輓h l� v� t s﹏<color>",getn(selTab),selTab);
end;

function repair_marriage_confirm()
	if GetMateName() ~= "" then
		Talk(1,"","<color=green>X秓 n�<color>: B筺 產ng trong tr筺g th竔 k誸 h玭, h穣 t譵 <color=yellow>Nguy謙 l穙 (Th髖 Y猲 205,162)<color>  ly h玭, sau  n s鯽 v蕁  k誸 h玭 c馻 b筺.");
		return 0;
	end;
	local selTab = {
				"X竎 nh薾 s鯽/repair_marriage_confirm_1",
				"\nв ta suy ngh� l筰/end_dialog",
				}
	Say("<color=green>X秓 n�<color>: B筺 th藅 s� mu鑞 s鯽 v蕁  k誸 h玭?",getn(selTab),selTab);
end;

function repair_marriage_confirm_1()
	local szTaskInfo = "";
	for i=2000,2010 do
		szTaskInfo = szTaskInfo.."("..i..":"..GetTask(i)..");"
		SetTask(i,0);
	end;
	for i=2013,2019 do
		szTaskInfo = szTaskInfo.."("..i..":"..GetTask(i)..");"
		SetTask(i,0);
	end;
	WriteLog("[S鯽]:"..GetName().."Thay i bi課 lng, th玭g tin bi課 lng nhi謒 v� k誸 h玭 trc khi thay i:"..szTaskInfo);
	Msg2Player("V蕁  k誸 h玭 c馻 b筺  s鯽 xong, h穣 th� l筰 xem");
	Say("<color=green>X秓 n�<color>: V蕁  k誸 h玭 c馻 b筺  s鯽 xong. Xin c竜 l鏸 v� g﹜ nh鱪g phi襫 ph鴆 v韎 b筺 trc y ng th阨 c秏 琻 s� 駈g h� c馻 b筺 i v韎 c玭g vi謈 c馻 t玦.",0);
end;
