
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��˿����Ƥ��ͼ����ű�
-- Edited by ������
-- 2005/08/26 

-- 2005/9/14���Ϸ��޸� ��ɣ

-- ======================================================
function main()
	local selTab = {
				"Gi�i thi�u khu v�c b�n ��/jieshao",
				"R�i kh�i khu v�c thu th�p/leave",
				"��n T� Tang S�n (cao c�p)/#NewWorld(722,1748,3420)",
				"��n C�n Ng� S�n (trung c�p)/#NewWorld(717,1736,2906)",
				"K�t th�c ��i tho�i/no",
				}
	Say("Mu�n k�o t� hay thu�c da, ch� c�n d�ng Th�n N�ng ��n ��n khu v�c t��ng �ng sau �� d�ng c�c k� n�ng l� ���c.",getn(selTab),selTab)
end;

function leave()
	local selTab = {
				"Th�nh ��/#NewWorld(300, 1681 ,3464)",
				"Bi�n Kinh/#NewWorld(200, 1249 ,2732)",
				"Tuy�n Ch�u/#NewWorld(100,1377,3051)",
				"Th�nh �� ��i Kho�ng C�ng (��o kho�ng)/#NewWorld(300,1836,3430)",
				"Tuy�n Ch�u M�c Qu�n ��o tr��ng (T�p linh)/#NewWorld(100,1393,2969)",
				"Tuy�n Ch�u L�m D��c S� (H�i thu�c)/#NewWorld(100,1555,2961)",
				"Tuy�n Ch�u L� Phong Thu (Canh t�c)/#NewWorld(100,1603,2968)",
				"Bi�n Kinh L�u Nh�t Ph� (��n g�)/#NewWorld(200,1220,2909)",
				"Kh�ng �i ��u c�!/no",
				}
	Say("Hay l�m! S�n ���c nhi�u tr�n c�m d� th� th�, nh�t ��nh s� b�n ���c r�t nhi�u ti�n!",getn(selTab),selTab)
end;


function jieshao()
	Say("Kh�ng Tang s�n l� khu v�c k�o t� v� thu�c da s� c�p, b�n tr�i tr�n c� nhi�u <color=yellow>Th� V� v� Lang B� c�p 1<color>, b�n ph�i l� <color=yellow>T� t�m v� H� B� c�p 2<color>. B�n tr�i d��i c� nhi�u <color=yellow>T� ng� s�c v� Da r�n c�p 3<color>, c�n b�n ph�i l� <color=yellow>T� Lang Chu v� H� B� c�p 4<color>.",0)
end;


function no()
end;


