--精力丸
--叠加数目99，可以交易，使用后精力回复100点，IB售价 100Xu
function OnUse(nItem)
	Say("Ngi quy誸 nh s� d鬾g Tinh L鵦 Ho祅 kh玭g?", 2, format("уng �/#ensure(%d)", nItem), "Kh玭g c莕 u/do_nothing");
end

function ensure(nItem)
	local nCurrent, nMax = ModifyEnergy(0,1);
	if nCurrent < 0 or nMax < 0 or nCurrent == nMax then
		Msg2Player("S� d鬾g Tinh L鵦 Ho祅 th蕋 b筰");
		return 0;
	end
	if 1 == DelItemByIndex(tonumber(nItem), 1) then
		ModifyEnergy(100, 1);
	end
end

function do_nothing()
--do nothing
end