--IB��Ʒ��С��������Ƭ
--��������������ʹ�ñ���Ʒѡ�񲢶һ���Ӧ��ʦ���ؼ�
--�����д�ˣ��Թ�
--�����дʱ�䣺2007��1��23��
--�߻��ˣ�����
Include("\\script\\online\\zgc_public_fun.lua")
goods_num = 10
dabaoyuntiesuipian_id = 30788
--**********************************��Ʒʹ��������************************************
function OnUse(goods_index)
	Say("B�n mu�n d�ng H�p M�nh Thi�n Th�ch (Nh�) �� ��i M�nh Thi�n Th�ch"..goods_num.."?",
	2,
	"��i/use_determine",
	"�� suy ngh�/end_dialog")
end
function use_determine()
	if GetItemCount(2,1,dabaoyuntiesuipian_id) == 0 then
		Talk(1,"end_dialog","H�y ki�m tra trong t�i c� <color=red>H�p M�nh Thi�n Th�ch (Nh�)<color> kh�ng!")
		return
	end
	if Zgc_pub_goods_add_chk(5,500) ~= 1 then
		return
	end
	if DelItem(2,1,dabaoyuntiesuipian_id,1) ~= 1 then
		Talk(1,"end_dialog","H�y ki�m tra trong t�i c� <color=red>H�p M�nh Thi�n Th�ch (Nh�)<color> kh�ng!")
		return
	end
	local add_flag = AddItem(2,2,7,goods_num,5)
	if add_flag == 1 then
		Msg2Player("Ch�c m�ng b�n �� d�ng H�p M�nh Thi�n Th�ch (Nh�) �� ��i"..goods_num.." m�nh Thi�n Th�ch!")
	else
		WriteLog(GetName().."use xiaoheyuntieshuipian fail :"..add_flag)
	end
end
