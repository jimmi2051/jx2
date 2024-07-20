--趴趴客栈外装包
--策划：刘天，媛媛
--脚本：墨仙
--创建日期：2008年8月20日

tb_prize = {
	[1] = {3,0,108,510,"Cc 甶誱 u (nam ti猽 chu萵)",0,109,510,"Cc 甶誱 y (nam ti猽 chu萵)",0,110,510,"Cc 甶誱 trang (nam ti猽 chu萵)"},
	[2] = {3,0,108,511,"Cc 甶誱 u (nam kh玦 ng�)",0,109,511,"Cc 甶誱 y (nam kh玦 ng�)",0,110,511,"Cc 甶誱 trang (nam kh玦 ng�)"},
	[3] = {3,0,108,513,"Cc 甶誱 u (n� g頸 c秏)",0,109,513,"Cc 甶誱 y (n� g頸 c秏)",0,110,513,"Cc 甶誱 trang (n� g頸 c秏)"},
	[4] = {3,0,108,512,"Cc 甶誱 u (ki襲 n�)",0,109,512,"Cc 甶誱 y (ki襲 n�)",0,110,512,"Cc 甶誱 trang (ki襲 n�)"}	
	
}

function OnUse(nIdx)
	local nTemp,nBody;
	local nItemIndex = tonumber(nIdx)
	local nTime = GetItemExpireTime(nItemIndex)
	
	nBody = GetBody();
	if Zgc_pub_goods_add_chk(3,50) == 0 then
		return
	end;
	if DelItem(2,1,3383,1) ~= 1 then
		Talk(1,"","X竎 nh薾 tr猲 ngi b筺 c� B竧 B竧 trang bao!");
		return
	end;
	for nTemp = 1,tb_prize[nBody][1] do
		local nRet, nItemIdx =AddItem(tb_prize[nBody][(nTemp - 1) * 4 + 2],tb_prize[nBody][(nTemp - 1) * 4 + 3],tb_prize[nBody][(nTemp - 1) * 4 + 4],1);
		if nRet > 0 then
			SetItemExpireTime(nItemIdx,nTime)
		end
		Msg2Player("B筺 nh薾 頲 "..GetItemName(tb_prize[nBody][(nTemp - 1) * 4 + 2],tb_prize[nBody][(nTemp - 1) * 4 + 3],tb_prize[nBody][(nTemp - 1) * 4 + 4]));
	end
end;

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"end_dialog","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"end_dialog","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
			return 0
		else 
			return 1
		end
end