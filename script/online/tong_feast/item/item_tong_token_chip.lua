Include("\\script\\online\\tong_feast\\tf_define.lua")

function OnUse(nItem)
	--local tSay = {
	--	"�ϳɰ�������/ComposeTongToken",
	--	"��ֻ�ǿ�������/nothing"	
	--}
	--Say("ʹ��100������������Ƭ�ɺϳ�һ���������ƣ���Ҫ�ϳɰ���������", getn(tSay), tSay);
end

function ComposeTongToken()
	local nCount = floor(GetItemCount(TF_ITEM_TONG_TOKEN_CHIP[1], TF_ITEM_TONG_TOKEN_CHIP[2], TF_ITEM_TONG_TOKEN_CHIP[3]) / 100);
	AskClientForNumber("ComposeTongToken_CB", 0, nCount,"Nh�p v�o s� l��ng:","")
end

function ComposeTongToken_CB(nNum)
	if nNum <= 0 then
		return 0; 
	end
	if GetFreeItemRoom() * 999 < nNum then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	if DelItem(TF_ITEM_TONG_TOKEN_CHIP[1], TF_ITEM_TONG_TOKEN_CHIP[2], TF_ITEM_TONG_TOKEN_CHIP[3], nNum * 100) == 1 then
		AddItem(TF_ITEM_TONG_TOKEN[1], TF_ITEM_TONG_TOKEN[2], TF_ITEM_TONG_TOKEN[3], nNum);
		Msg2Player(format("Ng��i h�p th�nh %d L�nh B�i Bang H�i", nNum));
	end
end
