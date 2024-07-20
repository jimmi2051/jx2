Include("\\script\\online_activites\\201506\\main_head.lua")

function OnUse(nItemIndex)
	if gf_CheckEventDateEx(VET_201506_ID) ~= 1 then
		Talk(1,"","V�t ph�m �� h�t h�n!");
		return 0;
	end
	if VET_201506_Item1UseTime()<VET_201506_GetItem1MaxUseTime() then
		Talk(1,"",format("S� d�ng �� %d %s v� %d %s m�i ���c d�ng!", 2000, "B�o �� S� C�p", 2000, "B� M�t T�ng B�o ��"));
		return 0
	end
	if VET_201506_Item2UseTime()<VET_201506_GetItem2MaxUseTime() then
		Talk(1,"",format("S� d�ng �� %d %s v� %d %s m�i ���c d�ng!", 2000, "B�o �� S� C�p", 2000, "B� M�t T�ng B�o ��"));
		return 0
	end
	
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	if tbActivity then
		tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
	end
end