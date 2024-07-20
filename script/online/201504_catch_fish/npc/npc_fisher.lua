--���
Include("\\script\\online\\201504_catch_fish\\head.lua")

function main()
	npc_talk_main()
end

function npc_talk_main()
	if check_player_condition()~= 1 then
		return
	end
	local szMsg = "Uy l�c c�a th� ph�o n�y c�ng kh� l�n, may l� ch�a kinh ��ng ai c�."
	if szBoss ~= "" then
		szMsg = format("Uy l�c c�a th� ph�o n�y qu� m�nh, h�nh nh� �� kinh ��ng %s d��i long cung", g_tCatchFish.szBoss)
	end
	local szTitle = format("Ng� Ph�: Trong Ng� D�n Th� Ph�o b� c�ng nhi�u lo�i ph�o t�t, t� l� nh�n ���c h�i s�n hi�m c� c�ng cao. %s", szMsg)
	local tbSay = {}
	tinsert(tbSay, format("%s/combin_bomb", "Gh�p Ph�o Nh�"))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function combin_bomb()
	local szTitle = format("%s\n%s", 
		"Ng� Ph�: Tr�n ng��i ng� qu�i � ��ng H�i H�i Binh c� �� ��nh L�a, nguy�n li�u d�ng �� gh�p Ph�o Nh�.",
		"1 Ph�o Nh� = 10 Ng�i Ph�o +10 �ng Ph�ng + 10 Thu�c N� + 10 �� ��nh L�a"
		)
	local tbSay = {}
	tinsert(tbSay, format("%s/do_combin_bomb", "��ng � gh�p"))
	tinsert(tbSay, format("%s/npc_talk_main", "Quay l�i "))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function do_combin_bomb()
	local szFunc = format("do_combin_bomb_sure")
	local nMax=get_max_combine_count()
	AskClientForNumber(szFunc, 1, nMax, "Gh�p bao nhi�u c�i?");
end

function get_max_combine_count()
	local t = g_tCatchFish.tCombine
	local tr = t.tRequite
	local r = 1000
	for i=1,getn(tr) do
		local tt = tr[i]
		local nTemp = floor(GetItemCount(tt[2],tt[3],tt[4])/tt[5])
		r = min(r,nTemp)
	end
	return r
end

function do_combin_bomb_sure(nNum)
	if nNum <= 0 then
		return
	end
	if gf_Judge_Room_Weight(1, 100, "")~=1 then
		return
	end
	local nMax=get_max_combine_count()
	if nMax < nNum then
		Talk(1,"","Nguy�n li�u th�nh c�ng")
		return
	end
	local t = g_tCatchFish.tCombine
	local tg=t.tItem
	local tr = t.tRequite
	for i=1,getn(tr) do
		local tt = tr[i]
		if DelItem(tt[2],tt[3],tt[4],tt[5]*nNum) ~= 1 then
			return
		end
	end
	AddItem(tg[2],tg[3],tg[4],nNum)
	Talk(1,"",format("Gh�p th�nh c�ng %d c�i %s",nNum, tg[1]))
end



