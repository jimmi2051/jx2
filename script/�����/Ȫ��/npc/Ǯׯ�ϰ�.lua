
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII Ǯׯ�ϰ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\maintask.lua");
Include("\\script\\lib\\globalfunctions.lua");

szNpcName = "<color=yellow>Ch� Ti�n Trang: <color>"
function main()
	local tbSay = {}
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20150211 and nDate <= 20150228 then
		tinsert(tbSay,"Ta mu�n ��i ti�n l� (1 Thi�n Ki�u L�nh ��i ���c 20 ti�n l�)/DoiTien")	
	end
	tinsert(tbSay,"R�i Kh�i/nothing")
	Say(szNpcName.."C�c h� t�i ��y c� vi�c chi?",getn(tbSay),tbSay)
	return
end

function DoiTien()
	AskClientForNumber("DoiTien_01",1,100,"Ng��i mu�n ��i bao nhi�u?");
end

function DoiTien_01(nMoney)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"",szNpcName.."Ng��i c�n s�ng m�i c� th� ��i ti�n!")
		return
	end	

	if gf_Judge_Room_Weight(1,100,1) ~= 1 then
		return
	end
	
	if GetItemCount(2,97,236) < nMoney then
		Talk(1,"",szNpcName.."Trong ng��i kh�ng c� �� s� l��ng Thi�n Ki�u L�nh!")
		return
	end
	
	if DelItem(2,97,236,nMoney) == 1 then
		gf_AddItemEx2({2, 1, 30778, nMoney * 20}, "Ti�n L�", "��iTi�nL�", "Nh�n", 0, 1);	
	end
end