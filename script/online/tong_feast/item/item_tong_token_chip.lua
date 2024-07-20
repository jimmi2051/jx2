Include("\\script\\online\\tong_feast\\tf_define.lua")

function OnUse(nItem)
	--local tSay = {
	--	"合成帮派令牌/ComposeTongToken",
	--	"我只是看看而已/nothing"	
	--}
	--Say("使用100个帮派令牌碎片可合成一个帮派令牌，您要合成帮派令牌吗？", getn(tSay), tSay);
end

function ComposeTongToken()
	local nCount = floor(GetItemCount(TF_ITEM_TONG_TOKEN_CHIP[1], TF_ITEM_TONG_TOKEN_CHIP[2], TF_ITEM_TONG_TOKEN_CHIP[3]) / 100);
	AskClientForNumber("ComposeTongToken_CB", 0, nCount,"Nh藀 v祇 s� lng:","")
end

function ComposeTongToken_CB(nNum)
	if nNum <= 0 then
		return 0; 
	end
	if GetFreeItemRoom() * 999 < nNum then
		Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
		return 0;
	end
	if DelItem(TF_ITEM_TONG_TOKEN_CHIP[1], TF_ITEM_TONG_TOKEN_CHIP[2], TF_ITEM_TONG_TOKEN_CHIP[3], nNum * 100) == 1 then
		AddItem(TF_ITEM_TONG_TOKEN[1], TF_ITEM_TONG_TOKEN[2], TF_ITEM_TONG_TOKEN[3], nNum);
		Msg2Player(format("Ngi h頿 th祅h %d L謓h B礽 Bang H閕", nNum));
	end
end
