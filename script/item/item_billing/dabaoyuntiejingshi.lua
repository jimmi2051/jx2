--IB物品：打包的陨铁精石
--功能描述：让其使用本物品选择并兑换对应的师门秘籍
--代码编写人：赵贵春
--代码编写时间：2007年1月23日
--策划人：刘天
Include("\\script\\online\\zgc_public_fun.lua")
goods_num = 100
dabaoyuntiejingshi_id = 1051
--**********************************物品使用主函数************************************
function OnUse(goods_index)
	Say("B筺 mu鑞 i Thi猲 Th筩h tinh th筩h ng g鉯 l蕐 Thi猲 Th筩h tinh th筩h?"..goods_num.."?",
	2,
	"фi/use_determine",
	"в suy ngh�/end_dialog")
end
function use_determine()
	if GetItemCount(2,1,dabaoyuntiejingshi_id) == 0 then
		Talk(1,"end_dialog","Xin x竎 nh薾 h祅h trang c� <color=red>Thi猲 Th筩h tinh th筩h ng g鉯<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(5,500) ~= 1 then
		return
	end
	if DelItem(2,1,dabaoyuntiejingshi_id,1) ~= 1 then
		Talk(1,"end_dialog","Xin x竎 nh薾 h祅h trang c� <color=red>Thi猲 Th筩h tinh th筩h ng g鉯<color>!")
		return
	end
	local add_flag = AddItem(2,1,1009,goods_num,5)
	if add_flag == 1 then
		Msg2Player("Ch骳 m鮪g b筺 d飊g Thi猲 Th筩h tinh th筩h ng g鉯 i"..goods_num.." Thi猲 Th筩h tinh th筩h!")
	else
		WriteLog(GetName()..":D飊g Thi猲 Th筩h tinh th筩h ng g鉯 i Thi猲 Th筩h tinh th筩h th蕋 b筰, k� hi謚:"..add_flag)
	end
end
