--�����빦��
--design by liubo5
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\invite_code\\ic_define.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\misc\\taskmanager.lua")

IC_TASK_GROUP = TaskManager:Create(IC_TASK_GROUP[1], IC_TASK_GROUP[2]);
IC_TASK_GROUP.InviteCode16H = 1; --��¼�Լ���������
IC_TASK_GROUP.InviteCode16L	= 2; --��¼�Լ���������
IC_TASK_GROUP.Icd16H = 3; --��¼�Ѽ������ļ�����
IC_TASK_GROUP.Icd16L = 4; --��¼�Ѽ������ļ�����
IC_TASK_GROUP.FinishInvite = 5; --��¼����ѱ�����
IC_TASK_GROUP.RecordAward = 6; --��λ��¼��������Щ�콱
IC_TASK_GROUP.Recrod2Award = 7; --��λ��¼����������Щ�������콱
IC_TASK_GROUP.IBCost = 8;	--��ȡ������֮�����������Ѽ���
IC_TASK_GROUP.tagData = 9; --����콱���
IC_TASK_GROUP.TempData = 10; --�����ʱ����

IC_NPC_NAME = "<color=green> ��i S� ho�t ��ng: <color>";
IC_NPC_TITLE = "H�y nhanh ch�ng m�i b�n b� ��n c�ng ch�i tr� ch�i n�o! B�n b� c�ng nhi�u th� s� c� th�m nhi�u ni�m vui!";

IC_NPC_DIALOG = {
	"Gi�i thi�u ho�t ��ng/ic_Introduce",
	"Nh�n m� m�i/ic_GetInviteCode",
	"K�ch ho�t m� m�i/ic_ActInviteCode",
	"Xem �i�m t�ch l�y/ic_QueryScore",
	"Nh�n l�y ph�n th��ng./ic_GetAward",
}

function ic_Introduce()
	local strTitle = 	"Trong th�i gian ho�t ��ng, t�t c� ng��i ch�i tr�n c�p 90 c� th� t�m npc ��i s� ho�t ��ng nh�n m� m�i, ng��i ch�i c� th� t�ng m� m�i cho b�n b�, ng��i ch�i ti�p nh�n m� m�i c� th� t�m ��i s� ho�t ��ng k�ch ho�t m� m�i.";
	strTitle = strTitle.."Ng��i ���c m�i khi k�ch ho�t th� th�ng c� th� c�ng hi�n 1 �i�m t�ch v� nh�n th��ng, khi ��t c�p 90 chuy�n sinh 5 c� th� c�ng hi�n 1 �i�m t�ch v� nh�n th��ng, ti�u ph� trong Ng� C�c ��t 2000 xu c� th� c�ng hi�n 3 �i�m t�ch v� nh�n th��ng, ti�u ph� t�i Ng� C�c ��t 5000 xu c� th� c�ng hi�n 3 �i�m t�ch v� nh�n th��ng.";
	strTitle = strTitle.."Ng��i ch�i t�ng m� m�i nh�n ���c �i�m t�ch l�y do ng��i ti�p nh�n c�ng hi�n, khi �i�m t�ch l�y ��t ��n c�c m�c s� nh�n ���c gi�i th��ng kh�c nhau.";
	strTitle = strTitle.."Trong th�i gian ho�t ��ng m�i ng��i ch� ���c nh�n m�t m� m�i v� ch� ���c ti�p nh�n ng��i kh�c m�i m�t l�n, c� th� t�ng m� m�i cho v� s� ng��i ch�i.";
	local tbSay = {};
	tbSay.msg = IC_NPC_NAME..strTitle;
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function ic_GetInviteCode()
	if ic_CheckCondition() ~= 1 then
		return 0;
	end
	local szInviteCode = _ic_GetInviteCode();
	DebugOutput("szInviteCode =", szInviteCode, tonumber(szInviteCode));
	if tonumber(szInviteCode) ~= 0 then
		Say(IC_NPC_NAME..format("B�n �� nh�n m� m�i, s� m� m�i l� <color=gold>%q<color>", szInviteCode), 0);
	else
		szInviteCode = _ic_generate_code();
		--����Ҫд���ݿ��ٻص�
		--ic_GetInviteCode_CB
		if ic_CheckClickTime() ~= 1 then
			return 0;
		end
		DebugOutput("call InviteCode()", szInviteCode)
		InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_REG, szInviteCode, 0, "ic_GetInviteCode_CB");
	end
end

function ic_GetInviteCode_CB(nRet, nScore)
	DebugOutput("ic_GetInviteCode_CB()", nRet, nScore);
	if 1 == nRet then
		local szInviteCode = _ic_generate_code();
		DebugOutput("call _ic_generate_code()", szInviteCode)
		_ic_SetInviteCode(szInviteCode);
		Say(IC_NPC_NAME..format("M� m�i m� b�n nh�n ���c l� <color=green>%q<color>", szInviteCode), 0);
	else
		Talk(1,"","Nh�n m� m�i th�t b�i!");	
		WriteLog(format("[InviteCode] Accoute=%s RoleName=%s Route=%d Register[%s] Failed!", GetAccount(), GetName(), GetPlayerRoute(), _ic_generate_code()));
	end
end

function ic_ActInviteCode()
	if ic_CheckCondition() ~= 1 then
		return 0;
	end
--	local szInviteCode = _ic_GetInviteCode();
--	if szInviteCode ~= _ic_generate_code() then
--		Say(IC_NPC_NAME.."���Լ���û����ȡ�κ������룡", 0)
--		return 0;
--	end
	AskClientForString("ic_ActInviteCode_Acfs", "M� m�i", 10, 10, "H�y nh�p m� m�i");
end

function ic_ActInviteCode_Acfs(szInviteCode)
	--�Ϸ��Լ��
	if _ic_CheckInviteCode(szInviteCode) ~= 1 then
		Say(IC_NPC_NAME.."K�ch ho�t m� m�i th�t b�i!", 0);	
		return 0;
	end
	--���ܼ����Լ���������
	local selfCode = _ic_GetInviteCode();
	if selfCode == szInviteCode then
		Say(IC_NPC_NAME..format("<color=red>%q<color> l� m� m�i c�a b�n, ch� ���c k�ch ho�t m� m�i c�a ng��i kh�c m�i c� th� nh�n ph�n th��ng m�i v� t�ch l�y c�ng hi�n!", selfCode), 0);
		return 0;
	end
	--�ж��Ƿ��Ѽ���
	local nType = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.FinishInvite);
	if 0 ~= nType then
		Say(IC_NPC_NAME.."B�n �� ���c m�i qua r�i, h�y nhanh ch�ng ho�n th�nh �i�u ki�n nhi�m v� �� nh�n ph�n th��ng!", 0);
		return 0;
	end
	--ic_ActInviteCode_CB
	if ic_CheckClickTime() ~= 1 then
		return 0;
	end
	DebugOutput("ic_ActInviteCode_Acfs()", szInviteCode);
	_ic_SetActInviteCode(szInviteCode); --��¼�������ļ����룬������Ϊ�Ѽ����־
	InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_QRY, szInviteCode, 0, "ic_ActInviteCode_CB");
end

function ic_ActInviteCode_CB(nRet, nScore)
	DebugOutput("ic_ActInviteCode_CB()", nRet, nScore)
	if 1 == nRet then
		--��¼�ѱ������
		IC_TASK_GROUP:SetTask(IC_TASK_GROUP.FinishInvite, 1);
		Say(IC_NPC_NAME.."B�n �� k�ch ho�t th�nh c�ng m� m�i, h�y nhanh ch�ng ho�n th�nh �i�u ki�n �� nh�n ph�n th��ng d�nh cho ng��i ���c m�i!", 0);
	else
		Say(IC_NPC_NAME.."K�ch ho�t m� m�i th�t b�i!", 0);	
	end
end

function ic_QueryScore()
	if ic_CheckCondition() ~= 1 then
		return 0;
	end
	local szInviteCode = _ic_GetInviteCode();
	if szInviteCode ~= _ic_generate_code() then
		Say(IC_NPC_NAME.."B�n v�n ch�a nh�n m� m�i n�o!", 0)
		return 0;
	end
	--�������ݿ�
	--ic_QueryScore_CB
	if ic_CheckClickTime() ~= 1 then
		return 0;
	end
	InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_QRY, szInviteCode, 0, "ic_QueryScore_CB");
end

function ic_QueryScore_CB(nRet, nScore)
	--��Ŀǰ���õ��ܻ���ֵΪxx	
	if 1 == nRet and nScore >= 0 then
		Say(IC_NPC_NAME..format("M� m�i c�a b�n l� <color=gold>%q<color>, t�ng �i�m t�ch l�y hi�n t�i l� <color=gold>%d<color>", _ic_GetInviteCode(), nScore), 0);
	else
		Say(IC_NPC_NAME.."Xem �i�m t�ch l�y xu�t hi�n l�i, h�y li�n h� ph�ng ch�m s�c kh�ch h�ng", 0);		
		WriteLog(format("[InviteCode] Accoute=%s RoleName=%s Route=%d InviteCode=%s InviteCodeOther=%s nRet=%d nScore=%d", 
		GetAccount(), GetName(), GetPlayerRoute(), _ic_GetInviteCode(), _ic_GetActInviteCode(), nRet, nScore));
	end
end

function ic_GetAward()
	if ic_CheckCondition() ~= 1 then
		return 0;
	end
	local tSay = {
		"\nPh�n th��ng cho ng��i m�i/ic_GetYaoqingAward",
		"\nPh�n th��ng cho ng��i ���c m�i/ic_GetShouyaoAward",		
		"\n r�t lui/nothing",
	}
	Say(IC_NPC_NAME.."B�n mu�n nh�n ph�n th��ng g�?", getn(tSay), tSay);
end

function ic_GetYaoqingAward()
	local szInviteCode = _ic_GetInviteCode();
	DebugOutput(szInviteCode, _ic_generate_code());
	if szInviteCode ~= _ic_generate_code() then
		Say(IC_NPC_NAME.."B�n v�n ch�a nh�n m� m�i, kh�ng th� nh�n ph�n th��ng �i�m t�ch l�y!", 0);
		return 0;
	end
	if ic_CheckClickTime() ~= 1 then
		return 0;
	end
	InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_QRY, szInviteCode, 0, "ic_GetYaoqingAward_CB")
end

function ic_GetYaoqingAward_CB(nRet, nScore)
	if 1 ~= nRet then
		Say(IC_NPC_NAME.."Xem �i�m t�ch l�y th�t b�i, t�m th�i kh�ng th� nh�n ph�n th��ng!", 0);
		return 0;
	end
	if nScore < 0 then
		Say(IC_NPC_NAME.."�i�m t�ch l�y kh�c th��ng, kh�ng th� nh�n ph�n th��ng.!", 0);
		return 0;
	end
	local tSay = {}
	for k, v in IC_YAOQING_AWARD do
		if v[1] == "yinjuan" or v[1] == "jinjuan" then
			tinsert(tSay, format("%s*%d (�� t�ch l�y %d �i�m)/#ic_GetYaoqingAward_do(%d, %d)", v[3], v[4], v[2], k, nScore));
		elseif v[1] == "item" then
			tinsert(tSay, format("%s*%d (�� t�ch l�y %d �i�m)/#ic_GetYaoqingAward_do(%d, %d)", v[3], v[4][4], v[2], k, nScore));
		elseif v[1] == "func" then
			tinsert(tSay, format("%s(�� t�ch l�y %d �i�m t�ch l�y)/#ic_GetYaoqingAward_do(%d, %d)", v[3], v[2], k, nScore));
		end	
	end
	tinsert(tSay, "\n r�t lui/nothing");
	Say(IC_NPC_NAME..format("T�ng �i�m t�ch l�y hi�n t�i l� <color=gold>%q<color>, h�y ��i ph�n th��ng theo �i�m t�ch l�y!", nScore), getn(tSay), tSay);
end

function ic_GetYaoqingAward_do(index, nScore)
	if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.RecordAward, index) > 0 then
		Say(IC_NPC_NAME.."Ph�n th��ng n�y �� nh�n r�i", 0);
		return 0;
	end
	local tCell = IC_YAOQING_AWARD[index];
	if not tCell then  return 0; end
	if nScore < tCell[2] then
		Say(IC_NPC_NAME..format("T�ng �i�m t�ch l�y hi�n t�i l� <color=gold>%q<color>, kh�ng �� <color=gold>%q<color>, t�m th�i kh�ng th� nh�n ph�n th��ng n�y!", nScore, tCell[2]), 0);
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10," ") ~= 1 then
		return 0;
	end
	--��¼�콱
	IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.RecordAward, index, 1);
	--�콱
	if tCell[1] == "yinjuan" then
		ModifyYinJuan(tCell[4], 1);
	elseif tCell[1] == "jinjuan" then
		ModifyJinJuan(tCell[4], 1);
	elseif tCell[1] == "func" then
		tCell[4]();
	elseif tCell[1] == "item" then
		gf_AddItemEx2(tCell[4], GetItemName(tCell[4][1], tCell[4][2], tCell[4][3]), "Ho�t ��ng m� m�i", "Ph�n th��ng �i�m t�ch l�y", (tCell[5] or 0), 1);
	end
end

function ic_GetShouyaoAward()
	local tSay = {
		format("100,000,000 exp(k�ch ho�t th� th�ng)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE1),
		format("C�o n�m �u�i(30 ng�y)(��t chuy�n sinh 5 c�p 90)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE2),
		format("U�n Linh C�p 5 (Ng�u nhi�n) (��t chuy�n sinh 6 Lv90)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE3),
		format("To�n b� Linh Ba Vi B� (nh�n code m�i xong ti�u ph� � Ng�  Nhai ��t 2000xu)/#ic_GetShouyaoAward_do(%d) ", IC_FINISH_INVITE_TYPE4),
		format("Thi�n M�n Kim L�nh (Sau khi nh�n m� m�i v�o Ng� C�c ti�u ph� ��t 5000xu)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE5),
		format("Gi�i th��ng ri�ng/ic_GetShouyaoExtAward"),
		
	};
	tinsert(tSay, "\n r�t lui/nothing");
	Say(IC_NPC_NAME.."K�ch ho�t m� m�i m�i nh�n ���c ph�n th��ng t��ng �ng!", getn(tSay), tSay);
end

function ic_GetShouyaoExtAward()
	local tSay = {
		format("2,000,000 exp(ho�n th�nh 3 nhi�m v� t�y �)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE6),
		format("10,000,000 exp(ho�n th�nh 4 nhi�m v� t�y �)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE7),
		format("20,000,000 exp(ho�n th�nh 5 nhi�m v� t�y �)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE8),
	};
	tinsert(tSay, "\n r�t lui/nothing");
	Say(IC_NPC_NAME.."K�ch ho�t m� m�i m�i nh�n ���c ph�n th��ng t��ng �ng!", getn(tSay), tSay);
end

function ic_GetShouyaoAward_do(nType)
	local nValue = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.FinishInvite);
	if 1 ~= nValue then
		Say(IC_NPC_NAME.."B�n v�n ch�a ho�n th�nh l�i m�i c�a h�o h�u ho�c ng��i kh�c, kh�ng th� nh�n ph�n th��ng.", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	local szInviteCode = _ic_GetActInviteCode();
	if _ic_CheckInviteCode(szInviteCode) ~= 1 then
		Say(IC_NPC_NAME.."M� m�i c�a b�n k�ch ho�t b� b�t th��ng, kh�ng th� nh�n ph�n th��ng!", 0);
		return 0;
	end
	if _ic_CheckAwardCondition(nType) ~= 1 then
		return 0;
	end
	DebugOutput("GetTaskBit(Recrod2Award, nType) =", IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType), nType)
	if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType) ~= 0 then
		Say(IC_NPC_NAME.."B�n �� nh�n ph�n th��ng n�y r�i, kh�ng th� nh�n l�i!", 0);
		return 0;
	end
	if nType > IC_FINISH_INVITE_TYPE1 and nType ~= IC_FINISH_INVITE_TYPE6 and IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType-1) ~= 1 then
		Say(IC_NPC_NAME.."V�n ch�a nh�n ph�n th��ng c�a nhi�m v� tr��c ��, kh�ng th� nh�n ph�n th��ng hi�n t�i!", 0);
		return 0;
	end
	
	--�ѹ��׹����ֵ�û���콱
	local nOldType = IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.tagData, nType);
	if 0 ~= nOldType then
		ic_GetShouyaoAward_finish(nType);
		return 0;
	end
	if ic_CheckClickTime() ~= 1 then
		return 0;
	end
	--���׻���
	IC_TASK_GROUP:SetTask(IC_TASK_GROUP.TempData, nType);
	local nPoint = _get_award_point(nType)
	if nPoint > 0 then
		InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_MDY, szInviteCode, nPoint, "ic_GetShouyaoAward_CB");
	else
		ic_GetShouyaoAward_finish(nType);
	end
end

function _get_award_point(nType)
	local tAward = {1,1,3,3,4,}
	local nRet = tAward[nType] or 0
	return nRet
end

function ic_GetShouyaoAward_CB(nRet, nScore)
	if nRet ~= 1 then
		Say(IC_NPC_NAME.."L�i ch�a x�c ��nh, c�ng hi�n �i�m t�ch l�y cho ng��i m�i th�t b�i", 0);
		return 0;
	end
	local nType = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.TempData);
	if nType < IC_FINISH_INVITE_TYPE1 or nType > IC_FINISH_INVITE_TYPE8 then
		return 0;
	end
	IC_TASK_GROUP:SetTask(IC_TASK_GROUP.TempData, 0);
	IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.tagData, nType, 1);
	ic_GetShouyaoAward_finish(nType);
end

function ic_GetShouyaoAward_finish(nType)
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	if IC_FINISH_INVITE_TYPE1 == nType then
		gf_Modify("Exp", 100000000)
		IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1);
	elseif IC_FINISH_INVITE_TYPE2 == nType then
		gf_AddItemEx2({0,105,161,1,4,-1,-1,-1,-1,-1,-1}, "C�o n�m �u�i", "Ho�t ��ng m� m�i", "Ph�n th��ng �i�m t�ch l�y", 30*24*3600, 1);
		IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1);		
	elseif IC_FINISH_INVITE_TYPE3 == nType then
		giveYunLing5()
		IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1)
	elseif IC_FINISH_INVITE_TYPE4 == nType then
		local tCell = {"L�ng Ba Vi B� to�n t�p", {0,112,158,1,}, 0}
		gf_AddItemEx2(tCell[2], tCell[1], "Ho�t ��ng m� m�i", "Ph�n th��ng �i�m t�ch l�y", (tCell[3] or 0), 1);
		IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1);
	elseif IC_FINISH_INVITE_TYPE5 == nType then
		local tCell = {"Thi�n M�n Kim L�nh", {2,1,30370,1,}, 0}
		gf_AddItemEx2(tCell[2], tCell[1], "Ho�t ��ng m� m�i", "Ph�n th��ng �i�m t�ch l�y", (tCell[3] or 0), 1);
		IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1);
	elseif nType >= IC_FINISH_INVITE_TYPE6 and nType <= IC_FINISH_INVITE_TYPE8 then
		local tAward = { 2000000, 10000000, 20000000 }
		local nIdx = nType - IC_FINISH_INVITE_TYPE6 + 1
		gf_Modify("Exp", tAward[nIdx])
		IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1);
	end 
end

function ic_GetYaoYangJiezi(index, nType)
	local tCell = IC_YAOYANG_JIEZI_1[index];
	if not tCell then return 0; end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	gf_AddItemEx2(tCell[2], tCell[1], "Ho�t ��ng m� m�i", "Trang s�c Di�u D��ng ", 0, 1);
	IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1);
end

--��Ƿ���
function ic_IsOpen()
	return gf_CheckDuration(IC_START_TIME, IC_END_TIME);	
end

--��������
function ic_CheckCondition()
	if GetLevel() < 90 then
		Talk(1,"",format("Ng��i ch�i <color=red>c�p %d<color> tr� l�n m�i ���c tham gia", 90));
		return 0;
	end
	return 1;
end

--���ʱ��
function ic_CheckClickTime()
	if not G_IC_CLICK_TIME then
		G_IC_CLICK_TIME = {}
	end
	local szName = GetName();
	local nCurTime = GetTime();
	if not G_IC_CLICK_TIME[szName] then
		G_IC_CLICK_TIME[szName] = nCurTime;
		return 1;
	end
	local nPastTime = nCurTime - G_IC_CLICK_TIME[szName];
	if nPastTime < IC_CLICK_TIME then
		Msg2Player(format("Thao t�c qu� nhi�u, %ds sau h�y th� l�i", IC_CLICK_TIME - nPastTime));
		return 0;
	end
	G_IC_CLICK_TIME[szName] = nCurTime;
	return 1;
end

--����������
--Ҫ��ȫ����ÿ����������벻һ��
--�����ܹ�����
--����10λ�̶��������ַ���
function _ic_generate_code()
	local szAccount = GetAccount();
	local szName = GetName();
	local szCode = tostring(abs(String2Hash(szAccount..szName..IC_INVITE_CODE_SALT)));
	if strlen(szCode) < 10 then
		szCode = format("%010d", tonumber(szCode))
	else
		szCode = strsub(szCode, 1, 10)
	end
	return szCode;
end

--��鼤����Ϸ���
function _ic_CheckInviteCode(szInviteCode)
	if strlen(szInviteCode) ~= 10 then
		return 0;
	end
	if tonumber(szInviteCode) == 0 then
		return 0;
	end
	for i = 1, strlen(szInviteCode) do
		local char = strsub(szInviteCode, i, i);
		local nNum = tonumber(char);
		if not nNum or (nNum < 0 or nNum > 9) then
			return 0;
		end
	end
	return 1;
end

--�����Լ��������ַ���
function _ic_SetInviteCode(szCode)
	if type(szCode) ~= "string" or strlen(szCode) ~= 10 then
		WriteLog("[InviteCode] ERROR: _ic_SetInviteCode strlen(szCode) ~= 10");
		return
	end
	local nH16 = tonumber(strsub(szCode, 1, 5));
	local nL16 = tonumber(strsub(szCode, 6, 10));
	IC_TASK_GROUP:SetTask(IC_TASK_GROUP.InviteCode16H, nH16);
	IC_TASK_GROUP:SetTask(IC_TASK_GROUP.InviteCode16L, nL16);
end

--��ȡ�Լ��������ַ���
function _ic_GetInviteCode()
	local nH16 = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.InviteCode16H);
	local nL16 = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.InviteCode16L);
	local strH16 = format("%05d", nH16);
	local strL16 = format("%05d", nL16);
	if strlen(strH16) ~= 5 or strlen(strL16) ~= 5 then
		WriteLog(format("[InviteCode] Accoute=%s RoleName=%s Route=%d strH16=%s strL16=%s", GetAccount(), GetName(), GetPlayerRoute(), strH16, strL16));
		return 0;
	end
	return strH16..strL16;
end

--�����Ѽ����������ַ���
function _ic_SetActInviteCode(szCode)
	if type(szCode) ~= "string" or strlen(szCode) ~= 10 then
		WriteLog("[InviteCode] ERROR: _ic_SetActInviteCode strlen(szCode) ~= 10");
		return
	end
	local nH16 = tonumber(strsub(szCode, 1, 5));
	local nL16 = tonumber(strsub(szCode, 6, 10));
	IC_TASK_GROUP:SetTask(IC_TASK_GROUP.Icd16H, nH16);
	IC_TASK_GROUP:SetTask(IC_TASK_GROUP.Icd16L, nL16);
end

--��ȡ�Ѽ����������ַ���
function _ic_GetActInviteCode()
	local nH16 = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.Icd16H);
	local nL16 = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.Icd16L);
	local Icd16H = format("%05d", nH16);
	local Icd16L = format("%05d", nL16);
	if strlen(Icd16H) ~= 5 or strlen(Icd16L) ~= 5 then
		WriteLog(format("[InviteCode] Accoute=%s RoleName=%s Route=%d Icd16H=%s Icd16L=%s", GetAccount(), GetName(), GetPlayerRoute(), Icd16H, Icd16L));
		return 0;
	end
	return Icd16H..Icd16L;
end

--����������콱����
function _ic_CheckAwardCondition(nType)
	if IC_FINISH_INVITE_TYPE1 == nType then
		if IsActivatedVipCard() ~= 1 then
			Say(IC_NPC_NAME..format("B�n v�n ch�a th�a �i�u ki�n nh�n: <color=red>%s<color>", "K�ch ho�t Th� vip"), 0);
			return 0;
		else
			return 1;
		end
		
	elseif IC_FINISH_INVITE_TYPE2 == nType then
		local nTransLevel = gf_GetPlayerRebornCount() * 100 + GetLevel()
		if nTransLevel < 590 then
			Say(IC_NPC_NAME..format("B�n v�n ch�a th�a �i�u ki�n nh�n: <color=red>%s<color>", "Chuy�n sinh 5 c�p 90"), 0);
			return 0;
		else
			return 1;
		end
	elseif IC_FINISH_INVITE_TYPE3 == nType then
		local nTransLevel = gf_GetPlayerRebornCount() * 100 + GetLevel()
		if nTransLevel < 690 then
			Say(IC_NPC_NAME..format("B�n v�n ch�a th�a �i�u ki�n nh�n: <color=red>%s<color>", "6 chuy�n 90 c�p"), 0);
			return 0;
		else
			return 1;
		end
	elseif IC_FINISH_INVITE_TYPE4 == nType then
		if IC_TASK_GROUP:GetTask(IC_TASK_GROUP.IBCost) < 2000 then
			Say(IC_NPC_NAME..format("B�n v�n ch�a th�a �i�u ki�n nh�n: <color=red>%s<color>", "Ng�c c�c ti�u ph� 2000 xu"), 0);
			return 0;
		else
			return 1;
		end
	elseif IC_FINISH_INVITE_TYPE5 == nType then
		if IC_TASK_GROUP:GetTask(IC_TASK_GROUP.IBCost) < 5000 then
			Say(IC_NPC_NAME..format("B�n v�n ch�a th�a �i�u ki�n nh�n: <color=red>%s<color>", "Ng� C�c ti�u hao 5000 XU"), 0);
			return 0;
		else
			return 1;
		end
	elseif nType >= IC_FINISH_INVITE_TYPE6 and nType <= IC_FINISH_INVITE_TYPE8  then
		local nNeedCnt = nType - IC_FINISH_INVITE_TYPE6 + 3
		local nFinish = _ic_getFinisCount()
		if nFinish < nNeedCnt then
			local szCondition = format("Ho�n th�nh %d nhi�m v� t�y �", nNeedCnt)
			Say(IC_NPC_NAME..format("B�n v�n ch�a th�a �i�u ki�n nh�n: <color=red>%s<color>", szCondition), 0);
			return 0
		else
			return 1
		end
	end 
	WriteLog(format("[InviteCode] ERROR INVITE_AWARD type:%d", nType))
	return 0;
end

function _ic_getFinisCount()
	local nRet = 0
	for i = 1, IC_FINISH_INVITE_TYPE5 do
		if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, i) ~= 0 then
			nRet = nRet + 1
		end
	end
	return nRet
end

--�������Ѷ���ӿ�
function _ic_IbCcost(nValue)
	if ic_IsOpen() ~= 1 then
		return 0;
	end
	local szCode = _ic_GetActInviteCode();
	local nType = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.FinishInvite);
	if tonumber(nValue) <= 0 or nType == 0 or tonumber(szCode) <= 0 then
		return 0;
	end
	IC_TASK_GROUP:SetTask(IC_TASK_GROUP.IBCost, IC_TASK_GROUP:GetTask(IC_TASK_GROUP.IBCost) + tonumber(nValue));
	Msg2Player(format("Trong ho�t ��ng m� m�i, ti�u ph� tr�n Ng� C�c c�a b�n �� t�ng %d", tonumber(nValue)));
end
