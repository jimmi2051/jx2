--
-- Author: Zheng Jinke
-- Date: 2015-12-24 10:28:35
-- �绪ʹ��NPC�ű���ͨ����NPC�����绪�̵�
--
Include("\\script\\function\\ornament\\ornament.lua")

function main()
	--�޶���������
	if tonumber(date("%Y%m%d")) < 20160206 then
		Talk(1, "", format("T�nh n�ng �i�m Phong Hoa s� m� v�o %s", "06/02/2016"))
		return 0 
	end
	
	local Title = "<color=green>��i S� Phong Hoa<color>: T�i c�a h�ng c�a ta, c�c ��i hi�p c� th� d�ng �i�m Phong Hoa �� ��i ngo�i trang tuy�t ��p nh� � mu�n."
	local tbSay = {}
	tinsert(tbSay,"C�a H�ng Phong Hoa/fenghua_shop")
	tinsert(tbSay,"Xem �i�m Phong Hoa/fenghua_check")
	tinsert(tbSay,"Gi�i thi�u �i�m Phong Hoa/fenghua_introduction")
	tinsert(tbSay,"Ta ch� ��n xem th�/nothing")
	Say(Title,getn(tbSay),tbSay)
end

function fenghua_shop(  )
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3071, "C�a H�ng Phong Hoa"))
end

function fenghua_check(  )
	local point = ornament_get_score()
	Talk(1,"",format("�i�m Phong Hoa: <color=red>%d<color>",point))
end

function fenghua_introduction(  )
	Talk(1,"","�i�m Phong Hoa l� �i�m t�ch l�y v�nh vi�n, sinh ra trong c�c ho�t ��ng, chuy�n d�ng �� ��i ngo�i trang trong C�a H�ng Phong Hoa.")
end



function nothing()
	-- body
end
function on_server_start( )
	--������ֲ��Ƿ�����
--	local script_path="\\script\\function\\ornament\\npc_fenghuashizhe.lua"
--	local npcidx = nil
--	npcidx = CreateNpc("�󿼹����ܹ�","�绪��ʹ",300,1758,3530)
--	SetNpcScript(npcidx,script_path)
--	npcidx = CreateNpc("�󿼹����ܹ�","�绪��ʹ",200,1403,2856)
--	SetNpcScript(npcidx,script_path)
--	npcidx = CreateNpc("�󿼹����ܹ�","�绪��ʹ",100,1435,2971)
--	SetNpcScript(npcidx,script_path)
end