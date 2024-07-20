Include("\\script\\isolate\\functions\\tong_title\\daily_task.lua")

function main()
	npc_talk_main()
end

function npc_talk_main()
	local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), "C� th� gi�p g� ���c b�n ?")
    local tbSay = {}
    
    tinsert(tbSay, format("%s/desc", "Gi�i thi�u t�nh n�ng"))
    tinsert(tbSay, format("%s/npc_talk_finish_rand_task", "Nhi�m v� h�ng ng�y"))
    tinsert(tbSay, format("%s/open_equip_shop", "C�a h�ng Bang h�i."))
    tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
    
    Say(szTitle, getn(tbSay), tbSay)
end

function desc()
	local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), "Thi�n �m Gi�o lui gi� � T�y V�c, trung nguy�n kh�p n�i ���c ngh� ng�i ng�n h�n. L�c n�y V� L�m Minh hy v�ng c�c bang h�i l�n c� th� nhanh ch�ng l�p bang, b�i d��ng hi�p s� c��ng m�nh, chu�n b� t�t c�ng vi�c ch�ng l�i Thi�n �m Gi�o quay tr� l�i, v� v�y V� L�m Minh �y th�c t�i ��n gi�p �� m�i ng��i, t�i s� c�ng b� m�t s� nhi�m v� cho c�c v�, sau khi ho�n th�nh c� th� nh�n ���c �� c�ng hi�n bang h�i, n�u hi�p s� c� k�ch ho�t th� th�ng th� c�n c� th� nh�n ���c ph�n th��ng g�p b�i. �� c�ng hi�n c� th� d�ng � trong bang h�i �� nh�n ���c danh hi�u bang h�i v� cung c�p ti�u hao danh hi�u bang h�i, c�ng c� th� ho�n ��i m�t s� �� v�t � ��y. Hy v�ng c� th� gi�p ���c m�i ng��i.")
    local tbSay = {}
    tinsert(tbSay, format("%s/npc_talk_main", "tr� l�i"))
    tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
    
    Say(szTitle, getn(tbSay), tbSay)
end

function open_equip_shop()
	if GetTongName() == "" then
		Talk(1, "", "M�i gia nh�p bang h�i tr��c")
		return 0
	end
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3068, "C�a h�ng Bang h�i."))
end