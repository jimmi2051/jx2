--08新年圣诞礼品包脚本
--by vivi
--2007/12/07

function OnUse()
	Say("<color=green>t骾 l� v藅 gi竛g sinh<color>: k輈h ho箃 t骾  s� nh薾 頲 1 c﹜ th玭g tuy謙 p, b筺 x竎 nh薾?",
		2,
		"уng �/huo_chrims_tree",
		"Kh玭g c莕/nothing")
end

function huo_chrims_tree()
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if DelItem(2,1,1192,1) == 1 then
		AddItem(2,0,574,1);
	end
end

function nothing()

end

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
			return 0
		else 
			return 1
		end
end	