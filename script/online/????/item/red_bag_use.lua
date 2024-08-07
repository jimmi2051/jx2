--脚本名称：新年活动红包使用脚本
--脚本功能：使用金猪小福袋、金猪小红包、金猪大红包换取相关的活动奖励
--策划人：阿松
--代码编写人：赵贵春
--代码编写时间：2007-01-31
--修改记录：
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
--=========================公共变量定义区========================
prize_list = {
	{627,"T骾 ti觰 ph骳 Kim Tr�",1180000,180000,18,120},
	{628,"Ti觰 H錸g Bao Kim Tr�",0.01,5,10,1},
	{629,"Чi H錸g Bao Kim Tr�",0.015,8,15,1,240,1,50}
}
--==========================脚本主逻辑区=========================
--**************************物品使用主函数********************
function OnUse(goods_index)
	local goods_id = GetItemParticular(goods_index)
	local goods_diff = 0
	for i = 1, getn(prize_list) do
		if prize_list[i][1] == goods_id then
			goods_diff = i
			break
		end
	end
	Say("D飊g <color=green>"..prize_list[goods_diff][2].."<color> c� th� i ph莕 thng tng 鴑g, ng � ch�?",
		2,
		"фi"..prize_list[goods_diff][2].."/#goods_use_det("..goods_diff..")",
		"в ta suy ngh� l筰/end_dialog")
end
--******************************奖励发放**********************
function goods_use_det(goods_diff)
	if GetItemCount(2,0,prize_list[goods_diff][1]) == 0 then		--物品检测
		Talk(1,"","Xin x竎 nh薾 trong t骾 h祅h lang c馻 b筺 c� <color=green>"..prize_list[goods_diff][2].."<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(3,100) ~= 1 then						--包裹负重/空间检测
		return
	end
	if DelItem(2,0,prize_list[goods_diff][1],1) ~= 1 then			--删除物品检测
		Talk(1,"","Xin x竎 nh薾 trong t骾 h祅h lang c馻 b筺 c� <color=green>"..prize_list[goods_diff][2].."<color>!")
		return		
	end
	if goods_diff == 1 then
		--健康经验转经验
		local player_level = GetLevel()
		local exp_num = player_level * player_level * player_level
		ModifyExp(exp_num)
		Msg2Player("Ch骳 m鮪g b筺 s� d鬾g"..prize_list[goods_diff][2].."Nh薾 頲 "..exp_num.." 甶觤 kinh nghi謒!")
		--增加声望
		ModifyReputation(prize_list[1][5],0)
		--增加白驹使用时间
		SetTask(2501,(GetTask(2501)+prize_list[1][6]))
		Msg2Player("B筺 nh薾 頲 2 gi� s� d鬾g B筩h c﹗!")
	else
		if goods_diff == 3 then
			--增加白驹使用时间
			SetTask(2501,(GetTask(2501)+prize_list[goods_diff][7]))
			Msg2Player("B筺 nh薾 頲 4 gi� s� d鬾g B筩h c﹗!")
			--秘籍增加
			local ran_num = random(1,100)
			if ran_num == 37 then
				local add_flag = AddItem(0,107,155,1)
				if add_flag == 1 then
					Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 ng� h祅h m藅 t辌h!")
					Msg2SubWorld("Ngi ch琲:"..GetName().."S� d鬾g "..prize_list[goods_diff][2].."Nh薾 頲 M藅 t辌h ng� h祅h!")
				else
					WriteLog("Ho箃 ng t﹏ ni猲 s� d鬾g Kim Tr� Чi H錸g Bao: Ngi ch琲:"..GetName().."T╪g [M藅 t辌h ng� h祅h] th蕋 b筰, t鋋  th蕋 b筰:"..add_flag)
				end
			elseif ran_num <= 50 then
				Faction_book_add(goods_diff)
			end
		elseif goods_diff == 2 then
			Earn(80000)
		end
		local exp_num = floor(Zgc_pub_player_uplevel_num_rtn(1) * prize_list[goods_diff][3])
		ModifyExp(exp_num)
		Msg2Player("Ch骳 m鮪g b筺 s� d鬾g"..prize_list[goods_diff][2].."Nh薾 頲 "..exp_num.." 甶觤 kinh nghi謒!")
		local iron_num = random(prize_list[goods_diff][4],prize_list[goods_diff][5])
		local add_flag = AddItem(2,2,8,iron_num)
		if add_flag == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..iron_num.." s総!")
		end
		local weapon_id =random(375,(375+11))
		add_flag = AddItem(2,1,weapon_id,prize_list[goods_diff][6])
		if add_flag == 1 then
			Msg2Player("B筺 nh薾 頲 m鉵 v� kh�!")
		end
		spring2007_spring_goods_add()
	end
end
--**********************师门秘籍增加**************************
function Faction_book_add(goods_diff)
	local book_name = {"Kim Cang Ph鬰 Ma kinh","Ti襪 Long M藅 t辌h","V� Tr莕 M藅 t辌h","Thi猲 La M藅 T辌h","Nh� � M藅 T辌h","B輈h H秈 Ph�","H鏽 чn M藅 t辌h",
						"Qu� Thi猲 M藅 t辌h","Huy襫 秐h M藅 t辌h","Qu﹏ T� M藅 t辌h","Tr蕁 Qu﹏ M藅 t辌h","Xuy猲 V﹏ M藅 t辌h","U Minh Qu� L鬰","Linh C� M藅 t辌h"}
	local book_seq = random(1,getn(book_name))
	local book_id = ((book_seq - 1) * 2) + 1
	local add_flag = AddItem(0,107,book_id,1)
	if add_flag == 1 then
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..book_name[book_seq].."!")
		Msg2SubWorld("Ngi ch琲:"..GetName().."S� d鬾g "..prize_list[goods_diff][2].."Nh薾 頲 "..book_name[book_seq].."!")
	else
		WriteLog("Ho箃 ng t﹏ ni猲 s� d鬾g Kim Tr� Чi H錸g Bao: Ngi ch琲:"..GetName().."T╪g"..book_name[book_seq].." th蕋 b筰, k� hi謚:"..add_flag)
	end
	return
end
