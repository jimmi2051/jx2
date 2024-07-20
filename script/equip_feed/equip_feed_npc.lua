Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

EFN_SZ_NPC_NAME="Ng� H�nh T�n Gi�"
function equip_feed_OnServerStart()
		local npcIndex1 = CreateNpc("C�n L�n T�n Ch��ng M�n", EFN_SZ_NPC_NAME, 300,1921,3576)
		SetNpcScript(npcIndex1, "\\script\\equip_feed\\equip_feed_npc.lua")
	    local npcIndexGbdz = CreateNpc("�n m�y", "chuotmedia", 200,1185,2835);
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\z��������.lua");
			    local npcIndexGbdz = CreateNpc("�n m�y", "chuotmedia", 200,1211,2859);
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\z��������.lua");
		local npcIndexGbdz = CreateNpc("�n m�y", "vodanh10", 200,1176,2831); 
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\c��������.lua");
		local npcIndexGbdz = CreateNpc("C�n L�n T�n Ph� Ch��ng M�n", "Th��ng Th��ng Eopi", 200,1180,2824); 
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\thuong.lua");
		--thanhdo
	    local npcIndexGbdz = CreateNpc("�n m�y", "chuotmedia", 300,1640,3555);
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\z��������.lua");
		local npcIndexGbdz = CreateNpc("�n m�y", "vodanh10", 300,1647,3548); 
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\c��������.lua");
		local npcIndexGbdz = CreateNpc("C�n L�n T�n Ph� Ch��ng M�n", "Th��ng Th��ng Eopi", 300,1637,3548); 
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\thuong.lua");
		--tuyenchau
	    local npcIndexGbdz = CreateNpc("�n m�y", "chuotmedia", 100,1441,2806);
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\z��������.lua");
		local npcIndexGbdz = CreateNpc("�n m�y", "vodanh10", 100,1454,2811); 
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\c��������.lua");
		local npcIndexGbdz = CreateNpc("C�n L�n T�n Ph� Ch��ng M�n", "Th��ng Th��ng Eopi", 100,1450,2802); 
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\thuong.lua");
		--tuongduong
	    local npcIndexGbdz = CreateNpc("�n m�y", "chuotmedia", 350,1418,2937);
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\z��������.lua");
	    local npcIndexGbdz = CreateNpc("�n m�y", "chuotmedia", 350,1409,2977);
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\z��������.lua");
		local npcIndexGbdz = CreateNpc("�n m�y", "vodanh10", 350,1440,2932); 
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\c��������.lua");
		local npcIndexGbdz = CreateNpc("�n m�y", "vodanh10", 350,1410,3003); 
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\c��������.lua");
		local npcIndexGbdz = CreateNpc("C�n L�n T�n Ph� Ch��ng M�n", "Th��ng Th��ng Eopi", 350,1415,2944); 
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\thuong.lua");
		--bienkinh
	    local npcIndexGbdz = CreateNpc("�n m�y", "chuotmedia", 200,1372,2882);
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\z��������.lua");
	    local npcIndexGbdz = CreateNpc("�n m�y", "chuotmedia", 200,1363,2862);
		SetNpcScript(npcIndexGbdz, "\\script\\����\\���ԭһ\\npc\\z��������.lua");
end

function main(bTag)
	--return equip_feed_NpcTalkMain(bTag)
end

function equip_feed_NpcTalkMain(bTag)
	
	local szTitle = format("%s:%s", EFN_SZ_NPC_NAME, "Thi�n ��a khai, ng� h�nh sinh, t�y theo phong �n c� ��i m� kh�a d��ng th�nh trang b� cu�i c�ng t�i xu�t th� gian.")
	local tbSay = {}
	
	--�
	local tID = {121}
	for i = 1, getn(tID) do
		if g_akct_ShowDialog(121, bTag) then
			return
		end
	end

	tinsert(tbSay, "Gi�i thi�u d��ng th�nh trang b�/_equip_feed_desc")
	tinsert(tbSay, "Nu�i d��ng trang b� d��ng th�nh/_equip_feed_weiyang")
	tinsert(tbSay, "Tr�ng luy�n trang b� d��ng th�nh/_equip_feed_chongzhu")
	tinsert(tbSay, "Tinh luy�n trang b� d��ng th�nh/_equip_feed_jinglian")
	tinsert(tbSay, format("%s/_equip_feed_reset_advance", "T�y luy�n trang b� d��ng th�nh"))
	tinsert(tbSay, "Ra kh�i/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_desc()
	local szTitle = format("%s:%s", EFN_SZ_NPC_NAME, "Hi�n t�i d��ng th�nh trang b� xu�t th� c� Huy Ch��ng, �o Cho�ng v� gi�y. Khi ng��i nh�n ���c trang b� th� ��ng c�p trang b� t��ng ��i th�p, nh�ng c� th� th�ng qua nu�i d��ng Thi�t Tinh ho�c nh�ng th� kh�c �� n�ng c�p trang b�.")
	szTitle = format("%s\n%s", szTitle, "T�y theo n�ng c�p ��ng c�p d��ng th�nh trang b�, thu�c t�nh d��ng th�nh c�a trang b� s� d�n d�n ph�t tri�n, m� kh�a thu�c t�nh sau khi ��t ��n tr� s� t��ng �ng c�ng s� m� kh�a.")
	local tbSay = {}

	tinsert(tbSay, "Quay l�i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra kh�i/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_chongzhu()
	local szTitle = format("%s:%s", EFN_SZ_NPC_NAME, "Thu�c t�nh ph�t tri�n c�a trang b� d��ng th�nh c� th� th�ng qua T�y T�m Th�ch ti�n h�nh tr�ng luy�n, sau khi tr�ng luy�n ��ng c�p c�a trang b� kh�ng thay ��i, thu�c t�nh ph�t tri�n s� thay ��i.")
	szTitle = format("%s\n%s", szTitle, "D��ng th�nh trang b� c�p sao c�ng cao, c�n c�p �� c�a T�y T�m Th�ch c�ng cao.")
	local tbSay = {}

	tinsert(tbSay, "Tr�ng luy�n trang b�/_equip_feed_do_chongzhu")
	tinsert(tbSay, "Quay l�i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra kh�i/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_jinglian()
	local szTitle = format("%s:%s", EFN_SZ_NPC_NAME, "M� kh�a thu�c t�nh c�a trang b� d��ng th�nh c� th� th�ng qua Luy�n L� Thi�t ti�n h�nh tinh luy�n, sau khi tinh luy�n ��ng c�p c�a trang b� kh�ng thay ��i, thu�c t�nh m� kh�a s� thay ��i.")
	szTitle = format("%s\n%s", szTitle, "D��ng th�nh trang b� c�p sao c�ng cao, c�n c�p �� c�a Luy�n L� Thi�t c�ng cao.")
	local tbSay = {}

	tinsert(tbSay, "Tinh luy�n trang b�/_equip_feed_do_jinglian")
	tinsert(tbSay, "Quay l�i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra kh�i/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_reset_advance()
	local szTitle = format("%s:%s", EFN_SZ_NPC_NAME, "T�y luy�n trang b� c� th� kh�a ��nh m�t d�ng tr��ng th�nh hay gi�i kh�a thu�c t�nh, t�y luy�n d�ng tr��ng th�nh v� thu�c t�nh gi�i kh�a kh�c")
	local tbSay = {}

	tinsert(tbSay, format("%s/_equip_feed_do_reset_advance", "T�y luy�n trang b�"))
	tinsert(tbSay, "Quay l�i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra kh�i/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_weiyang()
	local szTitle = format("%s:%s", EFN_SZ_NPC_NAME, "D��ng th�nh trang b� c� th� th�ng qua vi�c th�m v�o d��ng th�nh trang b� kh�ng d�ng ��n ho�c Thi�t Tinh �� n�ng c�p.")
	szTitle = format("%s\n%s", szTitle, "D��ng th�nh trang b� c�p sao c�ng cao, th� kinh nghi�m c�n �� n�ng c�p c�ng nhi�u")
	local tbSay = {}

	tinsert(tbSay, "Nu�i d��ng trang b�/_equip_feed_do_weiyang")
	tinsert(tbSay, "Quay l�i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra kh�i/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end


function _equip_feed_do_chongzhu()
	--SendScript2Client("Open([[EquipEvolution]], 2);");
	Talk(1, "", "T�nh n�ng t�m ��ng, ��i hi�p h�y quay l�i sau nha !!!!")
	do return end
end

function _equip_feed_do_jinglian()
	SendScript2Client("Open([[EquipEvolution]], 3);");
	--Talk(1, "", "T�nh n�ng t�m ��ng, ��i hi�p h�y quay l�i sau nha !!!!")
	--do return end
end

function _equip_feed_do_reset_advance()
	SendScript2Client("Open([[EquipEvolution]], 4);");
	--Talk(1, "", "T�nh n�ng t�m ��ng, ��i hi�p h�y quay l�i sau nha !!!!")
	--do return end
end


function _equip_feed_do_weiyang()
	SendScript2Client("Open([[CommonEnhanceItem]], 101);");
	--Talk(1, "", "T�nh n�ng t�m ��ng, ��i hi�p h�y quay l�i sau nha !!!!")
	--do return end
end

function nothing()
end