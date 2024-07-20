Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nItem)
	if gf_CheckVeitPetTaskFinish() ~= 1 then
		Say(format("%s ch�a ho�n th�nh nhi�m v� ph�c sinh ��ng h�nh, t�m th�i kh�ng th� m�!", gf_GetPlayerSexName()), 0);
		return 0;
	end
	if GetPetCount() >= 5 then
		Msg2Player("S� l��ng b�n ��ng h�nh hi�n t�i v��t qu� 5");
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		AddPet(34);
		Msg2Player(format("Ng��i nh�n ���c [%s] b�n ��ng h�nh", "B�ng N�"));
	end
end