--脚本名称：碎片使用脚本
--脚本功能：碎片使用抵用脚本
--策划人：铁羊
--代码开发人：村长
--代码开发时间：2007-04-26
--代码修改记录：
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
--============================公共变量定义区=======================
goods_id_tasktempID = 167
Tb_frag = {}
Tb_frag[568] = "Gi竝 M閏 dng"
Tb_frag[569] = "蕋 M閏 ﹎"
Tb_frag[570] = "B輓h h醓 dng"
Tb_frag[571] = "nh H醓 ﹎"
--============================脚本逻辑区==============================
function OnUse(goods_index)
	--判断是否结婚
	if GetMateName() == nil or GetMateName() == "" then
		Talk(1,"","<color=green>Ch� �<color>: Ch璦 k誸 h玭 ch璦 th� s� d鬾g v藅 ph萴 n祔!")
		return
	end
	--对话
	local goods_ID = GetItemParticular(goods_index)
	SetTaskTemp(goods_id_tasktempID,goods_ID)
	Say("<color=green>G頸 �<color>: <color=yellow>"..Tb_frag[goods_ID].."<color> c� th� dung h遖 nguy猲 t� kh竎 trong <color=yellow>Khi猲 V﹏ Phi Tinh Ph�<color> th祅h <color=yellow>V藅 ph萴 Phu th�<color>, c騨g c� th� t� chuy觧 h鉧 th祅h <color=yellow>Uy猲 Μng K誸<color>. <color=yellow>Uy猲 Μng K誸<color> l� <color=yellow>v藅 c莕 thi誸<color>  s� d鬾g k� n╪g <color=yellow>H玭 Nh﹏<color>. B筺 mu鑞 cho v祇 <color=yellow>Khi猲 V﹏ Phi Tinh Ph�<color> hay chuy觧 h鉧 th祅h <color=yellow>Uy猲 Μng K誸<color>?",
	3,
	"Cho v祇 Khi猲 V﹏ Phi Tinh Ph�/#put_in_num("..goods_ID..")",
	"Chuy觧 h鉧 th祅h Uy猲 Μng K誸/frag_change_dtm",
	"в ta suy ngh� l筰/end_dialog"
	)
end
--**************************批量处理****************************
function put_in_num(goods_ID)
	local goods_num = GetItemCount(2,1,goods_ID)
	if goods_num == 0 then
		return
	end
	AskClientForNumber("put_in",1,goods_num,"Xin nh藀 s� lng cho v祇")
end
--**************************元素放入****************************
function put_in(goods_num)
	--如果输入0则直接返回
	if goods_num == 0 then
		return
	end
	local goods_ID = GetTaskTemp(goods_id_tasktempID)
	SetTaskTemp(goods_id_tasktempID,0)
	if GetItemCount(2,1,goods_ID) < goods_num then
		Talk(1,"","<color=green>G頸 �<color>: Xin x竎 nh薾 b筺 mang <color=yellow><color> <color=yellow>"..Tb_frag[goods_ID].."<color>!")
		return
	end
	if DelItem(2,1,goods_ID,goods_num) ~= 1 then
		Talk(1,"","<color=green>G頸 �<color>: Xin x竎 nh薾 b筺 mang <color=yellow><color> <color=yellow>"..Tb_frag[goods_ID].."<color>!")
		return
	end
	SetTask((goods_ID+653),(GetTask(goods_ID+653)+goods_num))
	Talk(1,"","<color=green>G頸 �<color>: <color=yellow>"..goods_num.."<color> <color=yellow>"..Tb_frag[goods_ID].." <color>  th祅h c玭g cho v祇 <color=yellow>Khi猲 V﹏ Phi Tinh Ph�<color>, mu鑞 dung h遖 <color=yellow>V藅 ph萴 Phu th�<color> ch鋘 chu閠 ph秈 ngay <color=yellow>Khi猲 V﹏ Phi Tinh Ph�<color>.!")
end
--*************************交换鸳鸯结对话***********************
function frag_change_dtm()
	local goods_name = Tb_frag[GetTaskTemp(goods_id_tasktempID)]
	Say("<color=green>G頸 �<color>: <color=yellow>Uy猲 Μng K誸<color> tng tr璶g cho t譶h c秏 v� ch錸g, <color=yellow>k� n╪g Phu th�<color> c莕 ph秈 c� <color=yellow>Uy猲 Μng K誸<color> m韎 ho箃 ng 頲. M鏸 m閠 <color=yellow>"..goods_name.." <color> u c� th� chuy觧 h鉧 th祅h 1 <color=yellow>Uy猲 Μng K誸<color>. B筺 mu鑞 d飊g <color=yellow>"..goods_name.."<color>chuy觧 h鉧 th祅h <color=yellow>Uy猲 Μng K誸<color>?",
	2,
	"Ta x竎 nh薾/change_num_put_in",
	"в ta suy ngh� l筰/end_dialog"
	)
end
--************************鸳鸯结转换数量输入********************
function change_num_put_in()
	local goos_id = GetTaskTemp(goods_id_tasktempID)
	AskClientForNumber("frag_change",1,GetItemCount(2,1,goos_id),"Xin nh藀 s� lng chuy觧 i")
end
--***********************交换鸳鸯结确认*************************
function frag_change(goods_num)
	local goods_id = GetTaskTemp(goods_id_tasktempID)
	SetTaskTemp(goods_id_tasktempID,0)
	--空间和负重判断
	if Zgc_pub_goods_add_chk(goods_num,goods_num) ~= 1 then
		return
	end
	--携带检测
	if GetItemCount(2,1,goods_id) < goods_num then
		Talk(1,"","<color=green>G頸 �<color>: Xin x竎 nh薾 b筺 mang  "..Tb_frag[goods_ID].."!")
		return
	end
	--物品删除检测
	if DelItem(2,1,goods_id,goods_num) ~= 1 then
		Talk(1,"","<color=green>G頸 �<color>: Xin x竎 nh薾 b筺 mang  "..Tb_frag[goods_ID].."!")
		return
	end
	--增加鸳鸯结
	if AddItem(2,1,572,goods_num) == 1 then
		Msg2Player("Ch骳 m鮪g b筺  chuy觧 i"..goods_num.." 'Uy猲 Μng K誸'!")
	end
end
