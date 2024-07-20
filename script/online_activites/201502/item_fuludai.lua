Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	if gf_CheckEventDateEx(147) ~= 1 then
		Talk(1,"","V�t ph�m �� h�t h�n!");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10," ") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	local tAward = {
		{1, 2900, "M�m Xu�n", {2, 1, 30773, 20}, 0},
		{1, 2500, "M�m Xu�n", {2, 1, 30773, 50}, 0},
		{1, 2280, "M�m Xu�n", {2, 1, 30773, 100}, 0},
		{1, 2250, "Ti�n L�", {2, 1, 30778, 1}, 0},
		{1, 50, "M�m Ng� Qu�", {2, 1, 30278, 1}, 0},
		{1, 20, "Bao l� x� may m�n", {2, 1, 30786, 1}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "N�m m�i m�ng xu�n", "T�i L�c ��u N�m")
end