--脚本名称：炸弹大雪球套包使用脚本
--脚本功能：使用炸弹大雪球套包，获得20个炸弹大雪球
--策划人：阿松
--代码编写人：村长
--代码编写时间：2007-01-31
--代码修改记录：
Include("\\script\\online\\zgc_public_fun.lua")
--================================公共变量定义区===========================
change_boom_big_snow_num = 20				--兑换的炸弹大雪球数量
--=================================脚本主逻辑区============================
--***********************物品使用主函数***********************
function OnUse(goods_index)
	Say("D飊g <color=green>t骾 n Чi Tuy誸 C莡<color> c� th� i"..change_boom_big_snow_num.." <color=green>n Чi Tuy誸 C莡<color>, ng � ch�?",
		2,
		"Ta c莕 v藅 ph萴 n祔/bag_use_determine",
		"в ta suy ngh� l筰/end_dialog"
		)
end
--***********************物品确认使用函数*********************
function bag_use_determine()
	if GetItemCount(2,0,672) == 0 then					--物品存在检测
		Talk(1,"","X竎 nh薾 trong h祅h trang c馻 b筺 c� <color=red>t骾 n Чi Tuy誸 C莡<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(1,50) ~= 1 then			--玩家包裹空间/负重检测
		return
	end
	if DelItem(2,0,672,1) ~= 1 then						--物品删除检测
		Talk(1,"","X竎 nh薾 trong h祅h trang c馻 b筺 c� <color=red>t骾 n Чi Tuy誸 C莡<color>!")
		return
	end
	local add_flag = AddItem(2,3,218,20)
	if add_flag == 1 then
		Msg2Player("B筺 i th祅h c玭g"..change_boom_big_snow_num.." Чi Tuy誸 C莡!")
	else
		WriteLog("Th玭 trng_Ho箃 ng t﹏ ni猲_ Ngi ch琲:"..GetNpcName().."S� d鬾g t骾 n Чi Tuy誸 C莡 i ph莕 thng th蕋 b筰,"..add_flag)
	end
end
