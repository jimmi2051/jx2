
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 钱庄老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\maintask.lua");
Include("\\script\\lib\\globalfunctions.lua");

szNpcName = "<color=yellow>Ch� Ti襫 Trang: <color>"
function main()
	local tbSay = {}
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20150211 and nDate <= 20150228 then
		tinsert(tbSay,"Ta mu鑞 i ti襫 l� (1 Thi猲 Ki猽 L謓h i 頲 20 ti襫 l�)/DoiTien")	
	end
	tinsert(tbSay,"R阨 Kh醝/nothing")
	Say(szNpcName.."C竎 h� t韎 y c� vi謈 chi?",getn(tbSay),tbSay)
	return
end

function DoiTien()
	AskClientForNumber("DoiTien_01",1,100,"Ngi mu鑞 i bao nhi猽?");
end

function DoiTien_01(nMoney)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"",szNpcName.."Ngi c遪 s鑞g m韎 c� th� i ti襫!")
		return
	end	

	if gf_Judge_Room_Weight(1,100,1) ~= 1 then
		return
	end
	
	if GetItemCount(2,97,236) < nMoney then
		Talk(1,"",szNpcName.."Trong ngi kh玭g c�  s� lng Thi猲 Ki猽 L謓h!")
		return
	end
	
	if DelItem(2,97,236,nMoney) == 1 then
		gf_AddItemEx2({2, 1, 30778, nMoney * 20}, "Ti襫 L�", "фiTi襫L�", "Nh薾", 0, 1);	
	end
end