--2007年春节活动-麻将收集活动-物品使用函数
--代码开发人：赵贵春
--代码开发时间：2007-01-24
--代码修改记录：
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
--==========================公共变量定义区域=============================
	--筒起始ID为：590
	circle_start_id = 630
	--条起始ID为：599
	bamboo_start_id = 639
	--万起始ID为：608
	ten_kilo_start_id = 648
	--字起始ID为：617
	char_start_id = 657
	--特殊麻将ID：624
	special_mah_jong_id = 664
	--麻将包
	mah_jong_bag = {{665,8,"T骾 M筩 Chc (ti觰)"},{666,14,"T骾 M筩 Chc (i)"}} --ID，张数
	--麻将活动奖励包
	mah_jong_prize_bag = {{667,200,"Con b礽 甧m cc"},{668,200,"Con b礽 2 甧m cc"},{669,200,"Con b礽 3 甧m cc"},{670,200,"Con b礽 4 甧m cc"}}
	--所有麻将初始化
	mah_jong = {
			"Nh蕋 ng","Nh� ng","Tam ng","T� ng","Ng� ng","L鬰 ng","Th蕋 ng","B竧 ng","C鰑 ng",
			"M閠","Nh� 甶襲","Ba","B鑞","Ng� 甶襲","L鬰 甶襲","Th蕋 甶襲","B竧 甶襲","C鰑 甶襲",
			"Nh蕋 v筺","Nh� v筺","Tam v筺","T� v筺","Ng� v筺","L鬰 v筺","Th蕋 v筺","B竧 v筺","C鰑 v筺",
			"Йng phong","Nam phong","T﹜ phong","B綾 phong","H錸g trung","ph竧 t礽","B筩h ban"}
	--麻将和法定义
--==============================主逻辑区域===============================
function OnUse(goods_index)
	if Zgc_pub_action_level_chk() == 0 then
		return
	end
	if spring_2007_date_chk() ~= 1 then
		Talk(1,"end_dialog","V藅 ph萴 n祔 ch� c� th� s� d鬾g v祇 ho箃 ng n╩ m韎!")
		return
	end
	local goods_id = GetItemParticular(goods_index)
	--单个麻将换取奖励
	if goods_id >= circle_start_id and goods_id <= (circle_start_id + 33) then
		Say("Ngi c� mu鑞 i ph莕 thng kh玭g?",
		2,
		"Ta mu鑞 i ph莕 thng/#single_mahj_pri("..goods_id..")",
		"в ta suy ngh� l筰/end_dialog"
		)
		return
	--麻将包兑换奖励
	elseif goods_id == mah_jong_bag[1][1] or goods_id == mah_jong_bag[2][1] then
		local bag_diff = (goods_id + 1) - mah_jong_bag[1][1]
		Say("B筺 mu鑞 s� d鬾g: <color=green>".. mah_jong_bag[bag_diff][3].."<color> i <color=green>".. mah_jong_bag[bag_diff][2].."<color> M筩 chc �?",
		2,
		"фi/#mah_jong_bag_chg("..bag_diff..")",
		"в ta suy ngh� l筰/end_dialog")
	elseif goods_id >= mah_jong_prize_bag[1][1] and goods_id <= mah_jong_prize_bag[4][1] then  	--麻将奖励包换取奖励
		local prize_diff = (goods_id + 1) - mah_jong_prize_bag[1][1]
		Say("B筺 x竎 nh薾 d飊g: <color=green>"..mah_jong_prize_bag[prize_diff][3].."<color> i ph莕 thng �?",
			2,
			"Ta c莕 i ph莕 thng/#mah_jong_prize("..goods_id..")",
			"в ta suy ngh� l筰/end_dialog"
		)
	elseif goods_id == special_mah_jong_id then
		Say("B筺 c莕 i l� b礽 n祇?",
			5,
			"Ta mu鑞 i th祅h (уng)/#mah_jong_chg(1)",
			"Ta mu鑞 i th祅h (襲)/#mah_jong_chg(2)",
			"Ta mu鑞 i th祅h (V筺)/#mah_jong_chg(3)",
			"Ta mu鑞 i th祅h (Ch�)/#mah_jong_chg(4)",
			"в ta suy ngh� l筰/end_dialog"
		)
	end
	
end
--**************************单个麻将换取奖励************************
function single_mahj_pri(goods_id)
	local chg_num_remain = spring_2007_mahj_num_chk(3)
	if chg_num_remain == -1 then
		return
	end
	local mah_jong_diff = goods_id - circle_start_id + 1
	if GetItemCount(2,0,goods_id) == 0 then
		Talk(1,"end_dialog","Xin x竎 nh薾 trong t骾 h祅h lang c馻 b筺 c� <color=green>"..mah_jong[mah_jong_diff].."<color>T蕀 b礽 n祔!")
		return
	end
	if DelItem(2,0,goods_id,1) ~= 1 then
		Talk(1,"end_dialog","Xin x竎 nh薾 trong t骾 h祅h lang c馻 b筺 c� <color=green>"..mah_jong[mah_jong_diff].."<color>T蕀 b礽 n祔!")
		return
	else
		local num = GetLevel()
		num = (num * num) * 12
		ModifyExp(num)
		SetTask(997,(GetTask(997)+1))
		Msg2Player("Xin ch骳 m鮪g"..mah_jong[mah_jong_diff].."i "..num.." 甶觤 kinh nghi謒!")
		if chg_num_remain == 1 then
			Talk(1,"","<color=green>Nh綾 nh�<color>: H玬 nay y l� <color=red>l莕 cu鑙 c飊g<color> b筺 c� th� i ph莕 thng")
			return
		else
			Talk(1,"","<color=green>Nh綾 nh�<color>: B筺 c� th� s� d鬾g t蕀 b礽 n祔  i ph莕 thng<color=green>"..(chg_num_remain-1).."<color> l莕!")
			return
		end
	end
end
--***************************麻将包换麻将********************************
function mah_jong_bag_chg(bag_diff)
	if Zgc_pub_goods_add_chk(mah_jong_bag[bag_diff][2],mah_jong_bag[bag_diff][2]) ~= 1 then
		return
	else
		if GetItemCount(2,0,mah_jong_bag[bag_diff][1]) == 0 then
			Talk(1,"end_dialog","Xin x竎 nh薾 trong h祅h trang c馻 b筺 c�: <color=green>"..mah_jong_bag[bag_diff][3].."<color>!")
			return
		end
		if DelItem(2,0,mah_jong_bag[bag_diff][1],1) ~= 1 then
			Talk(1,"end_dialog","Xin x竎 nh薾 trong h祅h trang c馻 b筺 c�: <color=green>"..mah_jong_bag[bag_diff][3].."<color>!")
			return
		else
			local fail_num = 0
			for j = 1,mah_jong_bag[bag_diff][2] do
				local add_flag = AddItem(2,0,random(circle_start_id,(char_start_id+6)),1)
				if add_flag ~= 1 then
					fail_num = fail_num + 1
				end
			end
			if fail_num ~= 0 then
				WriteLog ("Ngi ch琲:"..GetName().."фi con b礽 th蕋 b筰"..fail_num.." con b礽 n祔!")
			end
		end
	end
end
--**************************特殊麻将换取对话*****************************
function mah_jong_chg(mah_jong_diff)
	local mah_jong_id = {{circle_start_id,9,1},{bamboo_start_id,9,10},{ten_kilo_start_id,9,19},{char_start_id,7,28}}
	local mah_jong_chg_dia = {}
	for i = 1, mah_jong_id[mah_jong_diff][2] do
		mah_jong_chg_dia[i]="Ta c莕 i ("..mah_jong[(mah_jong_id[mah_jong_diff][3]-1)+i]..")/#mah_jong_add("..(mah_jong_id[mah_jong_diff][1] - 1 + i)..")"
	end
	mah_jong_chg_dia[mah_jong_id[mah_jong_diff][2] + 1] = "в ta suy ngh� l筰/end_dialog"
	Say("Xin ch鋘 con b礽 c莕 i.",
		getn(mah_jong_chg_dia),
		mah_jong_chg_dia
	)	
end
--***************************特殊麻将换取****************************
function mah_jong_add(goods_id)
	if GetItemCount(2,0,special_mah_jong_id) == 0 then
		Talk(1,"end_dialog","Xin x竎 nh薾 trong h祅h trang c馻 b筺 c� con b礽 c bi謙!")
		return
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then			--负重判断
			return
		end
		if DelItem(2,0,special_mah_jong_id,1) ~= 1 then	--删除特殊麻将成功判断
			Talk(1,"end_dialog","Xin x竎 nh薾 trong h祅h trang c馻 b筺 c� con b礽 c bi謙!")
			return
		else
			local add_flag = AddItem(2,0,goods_id,1)
			if add_flag == 1 then
				Msg2Player("B筺 d飊g con b礽 c bi謙 i m閠 t蕀"..mah_jong[goods_id - circle_start_id +1].."!")
			else
				WriteLog ("Ngi ch琲:"..GetName().."D飊g con b礽 c bi謙 i"..mah_jong[goods_id - circle_start_id +1].."Th蕋 b筰!")
			end
		end
	end
end
--*************************麻将奖励包换取奖励************************
function mah_jong_prize(goods_id)
	local big_prize_diff = goods_id - mah_jong_prize_bag[1][1] + 1
	local bag_prize_inf = {
   --经验百分比--金钱----声望下限-上限-----武器下限-上限--负重要求--空间要求
		{3,	700000,300,	500,	4,	6,	500,	8},
		{2,	600000,100,	200,	4,	6,	500,	8},
		{1,	500000,50,	100,	1,	3,	300,	5},
		{1,1,1,1,1,1,50,5}
	}
	local weapon_nokaifeng_id = 375
	--物品判断
	if GetItemCount(2,0,goods_id) == 0 then	
		Talk(1,"","Xin x竎 nh薾 trong h祅h trang c馻 b筺 c�"..mah_jong_prize_bag[big_prize_diff][3].."!")
		return
	end
	--负重和空间判断
	if Zgc_pub_goods_add_chk(bag_prize_inf[big_prize_diff][8],bag_prize_inf[big_prize_diff][7]) ~= 1 then
		return
	end
	--删除物品成功判断
	if DelItem(2,0,goods_id,1) ~= 1 then
		Talk(1,"","Xin x竎 nh薾 trong h祅h trang c馻 b筺 c�"..mah_jong_prize_bag[big_prize_diff][3].."!")
		return	
	end
	--奖励添加（先添加轻负重、贵重物品）
	if big_prize_diff <= 3 then
		--加经验
		local add_num = floor(Zgc_pub_player_uplevel_num_rtn(1) * bag_prize_inf[big_prize_diff][1] /100)
		ModifyExp(add_num)
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..add_num.." 甶觤 kinh nghi謒!")
		--加钱
		Earn(bag_prize_inf[big_prize_diff][2])
		--加声望
		add_num = random(bag_prize_inf[big_prize_diff][3],bag_prize_inf[big_prize_diff][4])
		ModifyReputation(add_num,0)
		--加特殊装备
		add_num = random(1,100)
		if big_prize_diff == 1 then
			--一奖包
			if add_num <= 5 then				--璀璨之星
				 local add_flag = AddItem(10,2,44,1)
				 if add_flag == 1 then
					Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 Th玦 X竛 Tinh!")
					Msg2SubWorld("Ngi ch琲:"..GetName().."D飊g Con b礽 1甧m cc nh薾 頲 Th玦 X竛 Tinh!")
				 else
					WriteLog("Ho箃 ng thu th藀 con b礽: Ngi ch琲:"..GetName().."T╪g [Th玦 X竛 Tinh] th蕋 b筰, v� tr� th蕋 b筰:"..add_flag)
				 end
			elseif add_num <= 10 then		--无行秘籍
				local add_flag = AddItem(0,107,155,1)
				if add_flag == 1 then
					Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 ng� h祅h m藅 t辌h!")
					Msg2SubWorld("Ngi ch琲:"..GetName().."D飊g Con b礽 1 甧m cc nh薾 頲 M藅 t辌h ng� h祅h!")
				else
					WriteLog("Ho箃 ng thu th藀 con b礽: Ngi ch琲:"..GetName().."T╪g [M藅 t辌h ng� h祅h] th蕋 b筰, t鋋  th蕋 b筰:"..add_flag)
				end
			elseif add_num <= 15 then		--随机师门秘籍
				mah_jong_bag_prize_book()
			end
		elseif big_prize_diff == 2 then	--二奖包
			if add_num <= 5 then
				local add_flag = AddItem(0,107,155,1)
				if add_flag == 1 then
					Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 ng� h祅h m藅 t辌h!")
					Msg2SubWorld("Ngi ch琲:"..GetName().."D飊g Con b礽 2 甧m cc i 頲 M藅 t辌h ng� h祅h!")
				else
					WriteLog("Ho箃 ng thu th藀 con b礽: Ngi ch琲:"..GetName().."T╪g [M藅 t辌h ng� h祅h] th蕋 b筰, t鋋  th蕋 b筰:"..add_flag)
				end
			elseif add_num <= 13 then
				mah_jong_bag_prize_book(big_prize_diff)
			end
		elseif big_prize_diff == 3 then	--3奖包
			if add_num <= 10 then
				mah_jong_bag_prize_book(big_prize_diff)
			end
		end
		--未开锋武器增加
		local weapon_num = random(bag_prize_inf[big_prize_diff][5],bag_prize_inf[big_prize_diff][6])
		mah_jong_bag_prize_weapon(weapon_num)
	else
		--加经验
		local add_num = floor(Zgc_pub_player_uplevel_num_rtn(1)/100)
		ModifyExp(add_num)
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..add_num.." 甶觤 kinh nghi謒!")
		--加钱
		Earn(200000)
		--加材料
		for i = 66,69 do
			add_num = random(5,10)
			AddItem(2,2,i,add_num)
		end
		--加声望
		add_num = random(20,50)
		ModifyReputation(add_num,0)
	end
	spring2007_spring_goods_add()
end
--**********************师门秘籍增加**************************
function mah_jong_bag_prize_book(prize_diff)
	local book_name = {"Kim Cang Ph鬰 Ma kinh","Ti襪 Long M藅 t辌h","V� Tr莕 M藅 t辌h","Thi猲 La M藅 T辌h","Nh� � M藅 T辌h","B輈h H秈 Ph�","H鏽 чn M藅 t辌h",
						"Qu� Thi猲 M藅 t辌h","Huy襫 秐h M藅 t辌h","Qu﹏ T� M藅 t辌h","Tr蕁 Qu﹏ M藅 t辌h","Xuy猲 V﹏ M藅 t辌h","U Minh Qu� L鬰","Linh C� M藅 t辌h"}
	local book_seq = random(1,getn(book_name))
	local book_id = ((book_seq - 1) * 2) + 1
	local add_flag = AddItem(0,107,book_id,1)
	if add_flag == 1 then
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..book_name[book_seq].."!")
		Msg2SubWorld("Ngi ch琲:"..GetName().."S� d鬾g b礽 cc"..mah_jong_prize_bag[prize_diff][3].."Nh薾 頲 "..book_name[book_seq].."!")
	else
		WriteLog("Ho箃 ng thu th藀 con b礽: Ngi ch琲:"..GetName().."T╪g"..book_name[book_seq].." th蕋 b筰, k� hi謚:"..add_flag)
	end
	return
end
--**********************未开锋的武器增加**************************
function mah_jong_bag_prize_weapon(num)
	for i = 1,num do
		local weapon_id =random(375,(375+11))
		local add_flag = AddItem(2,1,weapon_id,1)
		if add_flag ~= 1 then
			WriteLog("Ho箃 ng thu th藀 con b礽: Ngi ch琲:"..GetName().."t╪g v� kh� ["..weapon_id.."] th蕋 b筰, v� tr� th蕋 b筰:"..add_flag)
		end
	end
	Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..num.."V� kh� ch璦 k輈h ho箃")
	return
end
