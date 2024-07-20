Include("\\script\\function\\vip_card\\config.lua")

function OnUse(nItemIndex)
	return on_use_real(nItemIndex)
end

function on_use_real(nItemIndex, bConfirm)
	if IsActivatedVipCard(CUR_VIP_CARD_INDEX) ~= 1 then
		Talk(1,"",format("%s", "T�m ��ng ch�c n�ng th� VIP"))
		return 0
	end
	
	local szCardName = GetVipCardName(CUR_VIP_CARD_INDEX)
	local g,d,p,time = GetVipCardTime(CUR_VIP_CARD_INDEX)
	local nG, nD, nP = GetItemInfoByIndex(nItemIndex)
	local szMsg = ""
	local szTime = ""
	local name = GetItemName(nItemIndex)
	if 1==is_in_valid_date(0) then
		szTime = format(" %s:<color=yellow>%s<color>\n %s:<color=yellow>%s~%s<color>\n %s"
			, "Th� VIP hi�n t�i", szCardName, "H�n d�ng k�ch ho�t", show_date(CUR_VIP_CARD_START_DATE), show_date(CUR_VIP_CARD_END_DATE), "Sau khi d�ng C�m Nang ��i S� Ki�n k�ch ho�t s� nh�n ���c d�ch v� VIP 1 th�ng")
	end
	if nG==g and nD==d and nP==p and szTime ~= "" then
		szMsg = format("<color=green>%s:<color>\n%s.",name, szTime)
	else
		szMsg = format("<color=green>%s:<color>%s\n\n%s.",name, "Th� VIP kh�ng h�p l�", szTime)
	end
	Talk(1, "", szMsg)
	return 1
end