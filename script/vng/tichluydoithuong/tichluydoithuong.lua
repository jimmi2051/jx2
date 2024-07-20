Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\vng\\lib\\vnglib_function.lua")

tbVuKhiHH = {
	[2] = {item={{gdp={0,3,30724,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p �ao"}}},
	[3] = {item={{gdp={0,8,30725,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p Tr��ng"}}},
	[4] = {item={{gdp={0,0,30726,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p Th�"}}},
	[6] = {item={{gdp={0,1,30727,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p Ch�m"}}},
	[8] = {item={{gdp={0,2,30728,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p Ki�m"}}},
	[9] = {item={{gdp={0,10,30729,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p C�m"}}},
	[11] = {item={{gdp={0,0,30730,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p Th�"}}},
	[12] = {item={{gdp={0,5,30731,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p C�n"}}},
	[14] = {item={{gdp={0,2,30732,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p Ki�m"}}},
	[15] = {item={{gdp={0,9,30733,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p B�t"}}},
	[17] = {item={{gdp={0,6,30734,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p Th��ng"}}},
	[18] = {item={{gdp={0,4,30735,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p Cung"}}},
	[20] = {item={{gdp={0,7,30736,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p �ao"}}},
	[21] = {item={{gdp={0,11,30737,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p Tr�o"}}},
	[23] = {item={{gdp={0,2,30738,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p Ki�m"}}},
	[25] = {item={{gdp={0,3,30739,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p �ao"}}},
	[26] = {item={{gdp={0,9,30740,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p B�t"}}},
	[27] = {item={{gdp={0,11,30741,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p Tr�o"}}},
	[29] = {item={{gdp={0,13,30742,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p Phi�n"}}},
	[30] = {item={{gdp={0,12,30743,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Hi�p ��ch"}}},
}
TASK_TICH_LUY_DIEM_THUONG = 2430 -- byte 1 diem tich luy
EVENT_LOG_TITLE = "Doi Diem Tich Luy"
function DoiThuongTichLuy()
	
	local nTichLuyDiem = GetTask(TASK_TICH_LUY_DIEM_THUONG);
	if nTichLuyDiem < 0 then
		WriteLog("[DoiThuongTichLuy]\t"..GetAccount().."\t"..GetName().."\tb� �m"..nTichLuyDiem.."  �i�m t�ch l�y.C�n ki�m tra l�i")		
		SetTask(TASK_TICH_LUY_DIEM_THUONG,0);
	end
	local nLevel = GetLevel();
	if nLevel < 73 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","Nh�n v�t c�p <color=green>73<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia");
		return 0;
	end
	
	local szName = "Ch� Ti�n Trang"
	local szHeader = "<color=green>"..szName.." :<color>Ho�t ��ng n�p v�t ph�m l�y �i�m t�ch l�y :"
	local tbSayDialog = {};
	local nSaySize = 0;
	tinsert(tbSayDialog, "Ta mu�n n�p v�t ph�m Ho�ng Kim ��i Ng�n Phi�u/#nop_vatpham(1)")
	tinsert(tbSayDialog, "Ta mu�n n�p v�t ph�m Bao Ti�u Dao Ng�c/#nop_vatpham(2)")
	tinsert(tbSayDialog, "Ta mu�n n�p v�t ph�m Chi�n Th�n Ho�n/#nop_vatpham(3)")
	tinsert(tbSayDialog, "Ta mu�n n�p v�t ph�m C�u Thi�n V� C�c ��n/#nop_vatpham(4)")
	tinsert(tbSayDialog, "Ta mu�n n�p v�t ph�m Linh Kh� R�c R�/#nop_vatpham(5)")
	tinsert(tbSayDialog, "Ki�m tra s� �i�m t�ch l�y/checkDiemTichLuy")
	tinsert(tbSayDialog, "Ta mu�n ��i ph�n th��ng �i�m t�ch l�y/DoiThuongDiem")
	tinsert(tbSayDialog, "Ta ch� gh� ngang/do_nothing")
	
	Say(szHeader, getn(tbSayDialog), tbSayDialog)	
end


function checkDiemTichLuy()
	local nDiem = GetTask(TASK_TICH_LUY_DIEM_THUONG);
	if nDiem == nil then
		nDiem = 0;
	end
	Talk(1,"","C�c h� hi�n c� <color=green> "..nDiem.."<color> �i�m t�ch l�y")
	return 0;
end

function nop_vatpham(nType)
	if nType == 1 then
		JX2VN_DoiEvent_Form1()
	elseif nType == 2 then
		JX2VN_DoiEvent_Form2()
	elseif nType == 3 then
		JX2VN_DoiEvent_Form3()
	elseif nType ==  4 then
		JX2VN_DoiEvent_Form4()
	elseif nType == 5 then
		JX2VN_DoiEvent_Form5()
	else
		Talk(1,"","C� s� c� x�y ra! Vui l�ng ki�m tra l�i!");
		return 0;
	end
end

function JX2VN_DoiEvent_Form1()
	AskClientForNumber("JX2VN_DoiEvent_Kieu1", 1, 20, "S� l��ng (1-20)")
end

function JX2VN_DoiEvent_Form2()
	AskClientForNumber("JX2VN_DoiEvent_Kieu2", 1, 20, "S� l��ng (1-20)")
end

function JX2VN_DoiEvent_Form3()
	AskClientForNumber("JX2VN_DoiEvent_Kieu3", 1, 20, "S� l��ng (1-20)")
end

function JX2VN_DoiEvent_Form4()
	AskClientForNumber("JX2VN_DoiEvent_Kieu4", 1, 20, "S� l��ng (1-20)")
end

function JX2VN_DoiEvent_Form5()
	AskClientForNumber("JX2VN_DoiEvent_Kieu5", 1, 20, "S� l��ng (1-20)")
end


function JX2VN_DoiEvent_Kieu1(nCount)
	if GetItemCount(2,1,30490) < (1 * nCount )  then
		Talk(1, "", "B�n kh�ng �� s� l��ng Ho�ng Kim ��i Ng�n Phi�u.");
		return 0;
	end
	
	if DelItem(2,1,30490 , 1 * nCount) == 1 then
		local nDiem = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		local nAllPoint = 30 * nCount;
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nDiem + nAllPoint) --gf_SetTaskByte(TASK_TICH_LUY_DIEM_THUONG, 1, nDiem + nAllPoint)	
		Msg2Player("B�n �� t�ch l�y th�m ���c  "..nAllPoint.." �i�m")
		Talk(1,"","B�n �� t�ch l�y th�m ���c <color=green> "..nAllPoint.."<color> �i�m")
	end
end

function JX2VN_DoiEvent_Kieu2(nCount)
	if GetItemCount(2,1,30605) < (1 * nCount )  then
		Talk(1, "", "B�n kh�ng �� s� l��ng Bao Ti�u Dao Ng�c.");
		return 0;
	end
	
	if DelItem(2,1,30605 , 1 * nCount) == 1 then
		local nDiem = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		local nAllPoint = 30 * nCount;
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nDiem + nAllPoint)
		Msg2Player("B�n �� t�ch l�y th�m ���c  "..nAllPoint.." �i�m")
		Talk(1,"","B�n �� t�ch l�y th�m ���c <color=green> "..nAllPoint.."<color> �i�m")
	end
end

function JX2VN_DoiEvent_Kieu3(nCount)
	if GetItemCount(2,1,1005) < (1 * nCount )  then
		Talk(1, "", "B�n kh�ng �� s� l��ng Chi�n Th�n Ho�n.");
		return 0;
	end
	
	if DelItem(2,1,1005 , 1 * nCount) == 1 then
		local nDiem = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		local nAllPoint = 30 * nCount;
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nDiem + nAllPoint)
		Msg2Player("B�n �� t�ch l�y th�m ���c  "..nAllPoint.." �i�m")
		Talk(1,"","B�n �� t�ch l�y th�m ���c <color=green> "..nAllPoint.."<color> �i�m")
	end
end

function JX2VN_DoiEvent_Kieu4(nCount)
	if GetItemCount(2,1,1006) < (1 * nCount )  then
		Talk(1, "", "B�n kh�ng �� s� l��ng C�u Thi�n V� C�c ��n.");
		return 0;
	end
	
	if DelItem(2,1,1006 , 1 * nCount) == 1 then
		local nDiem = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		local nAllPoint = 90 * nCount;
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nDiem + nAllPoint)
		Msg2Player("B�n �� t�ch l�y th�m ���c  "..nAllPoint.." �i�m")
		Talk(1,"","B�n �� t�ch l�y th�m ���c <color=green> "..nAllPoint.."<color> �i�m")
	end
end

function JX2VN_DoiEvent_Kieu5(nCount)
	if GetItemCount(2,1,31122) < (1 * nCount )  then
		Talk(1, "", "B�n kh�ng �� s� l��ng Linh Kh� R�c R�.");
		return 0;
	end
	
	if DelItem(2,1,31122 , 1 * nCount) == 1 then
		local nDiem = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		local nAllPoint = 3000 * nCount;
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nDiem + nAllPoint)
		Msg2Player("B�n �� t�ch l�y th�m ���c  "..nAllPoint.." �i�m")
		Talk(1,"","B�n �� t�ch l�y th�m ���c <color=green> "..nAllPoint.."<color> �i�m")
	end
end


function DoiThuongDiem()
	local szName = "Ch� Ti�n Trang"
	local szHeader = "<color=green>"..szName.." :<color>Ho�t ��ng n�p v�t ph�m l�y �i�m t�ch l�y :"
	local tbSayDialog = {};
	local nSaySize = 0;
	tinsert(tbSayDialog, "Ta mu�n ��i th��ng th� c��i /tichluy_doithuong_thucuoi")
	tinsert(tbSayDialog, "Ta mu�n ��i th��ng Ph�n th��ng m�i c�p nh�t/tichluy_doithuong_phanthuongmoi")
	tinsert(tbSayDialog, "Ta mu�n ��i 15 Th�i Nh�t L�nh (Ti�u t�n 150 �i�m)/#tichluy_doiphanthuong(1)")
	tinsert(tbSayDialog, "Ta mu�n ��i 50 H�o Hi�p L�nh (Ti�u t�n 250 �i�m)/#tichluy_doiphanthuong(2)")
	tinsert(tbSayDialog, "Ta mu�n ��i 50 Linh Thi�t (Ti�u t�n 500 �i�m)/#tichluy_doiphanthuong(3)")
	tinsert(tbSayDialog, "Ta mu�n ��i 1 Ph�i Ph��ng V� Kh� H�o Hi�p th��ng (Ti�u t�n 750 �i�m)/#tichluy_doiphanthuong(4)")
	tinsert(tbSayDialog, "Ta mu�n ��i 1 Ph�i Ph��ng H�o Hi�p V� h� (Ti�u t�n 1000 �i�m)/#tichluy_doiphanthuong(5)")
	tinsert(tbSayDialog, "Ta mu�n ��i 1 b� Kim x� c�p 4 (Ti�u t�n 3600 �i�m)/#tichluy_doiphanthuong(6)")
	tinsert(tbSayDialog, "Ta mu�n ��i 1 ��a Long Gi�p (Ti�u t�n 1220 �i�m)/#tichluy_doiphanthuong(7)")
	tinsert(tbSayDialog, "Ta mu�n ��i 1 Ma Lang Gi�p (Ti�u t�n 1220 �i�m)/#tichluy_doiphanthuong(8)")
	tinsert(tbSayDialog, "Ta mu�n ��i 1 Vi�m Linh B� (Ti�u t�n 1220 �i�m)/#tichluy_doiphanthuong(9)")
	tinsert(tbSayDialog, "Ta mu�n ��i 1 Huy�n Vi�m C��ng (Ti�u t�n 1220 �i�m)/#tichluy_doiphanthuong(10)")
	tinsert(tbSayDialog, "Ta mu�n ��i 100 Linh Ng�c (Ti�u t�n 5000 �i�m)/#tichluy_doiphanthuong(11)")
	tinsert(tbSayDialog, "Ta mu�n ��i 1 Ph�c Sinh ��n 100/100 (Ti�u t�n 6000 �i�m)/#tichluy_doiphanthuong(12)")
	tinsert(tbSayDialog, "Ta mu�n ��i M�t T�ch Si�u C�p 20% (Ti�u t�n 6000 �i�m)/#tichluy_doiphanthuong(13)")
	tinsert(tbSayDialog, "Ta mu�n ��i b� trang b� Thi�n H� V� Song (Ti�u t�n 700.000 �i�m)/tichluy_doitrangbicuoi")
	if gf_GetTaskByte(2162, 4) == 1 and gf_GetTaskByte(2162, 3) == 0 then
		tinsert(tbSayDialog, "Ta mu�n nh�n ph�n th��ng m� r�ng THVS/PhanThuongExt")
	end
	tinsert(tbSayDialog, "Ta ch� gh� ngang/do_nothing")
	
	Say(szHeader, getn(tbSayDialog), tbSayDialog)	
end

function tichluy_doithuong_phanthuongmoi()
	local szName = "Ch� Ti�n Trang"
	local szHeader = "<color=green>"..szName.." :<color>Ho�t ��ng n�p v�t ph�m l�y �i�m t�ch l�y :"
	local tbSayDialog = {};
	local nSaySize = 0;
	tinsert(tbSayDialog, "Ta mu�n ��i C�p nh�n h� tr� m�t t�ch 7% (Ti�u t�n 5000 �i�m)/#tichluy_doiphanthuong_new(1)")
	tinsert(tbSayDialog, "Ta mu�n ��i B� trang s�c B�ch H�i (Ti�u t�n 6000 �i�m)/#tichluy_doiphanthuong_new(2)")
	tinsert(tbSayDialog, "Ta mu�n ��i B� trang s�c V� T��ng (Ti�u t�n 6000 �i�m)/#tichluy_doiphanthuong_new(3)")
	tinsert(tbSayDialog, "Ta mu�n ��i B� trang s�c Phong H�a (Ti�u t�n 6000 �i�m)/#tichluy_doiphanthuong_new(4)")
	tinsert(tbSayDialog, "Ta mu�n ��i H�a Ph�ng Linh (Ti�u t�n 6000 �i�m)/#tichluy_doiphanthuong_new(5)")
	tinsert(tbSayDialog, "Ta mu�n ��i Thi�n Cang L�nh (Ti�u t�n 400 �i�m)/#tichluy_doiphanthuong_new(6)")
	tinsert(tbSayDialog, "Ta mu�n ��i Thi�n M�n Kim L�nh (Ti�u t�n 200 �i�m)/#tichluy_doiphanthuong_new(7)")
	tinsert(tbSayDialog, "Ta mu�n ��i Trang s�c H�o Hi�p th��ng(Ti�u t�n 6000 �i�m)/#tichluy_doiphanthuong_new(8)")
	tinsert(tbSayDialog, "Ta mu�n ��i V� Kh� H�o Hi�p th��ng (Ti�u t�n 9000 �i�m)/#tichluy_doiphanthuong_new(9)")
	tinsert(tbSayDialog, "Ta ch� gh� ngang/do_nothing")
	Say(szHeader, getn(tbSayDialog), tbSayDialog)	
end

function tichluy_doiphanthuong_new(nType)
	local szName = "Ch� Ti�n Trang"
	if nType == 1 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 5000  then
			Talk(1, "", "B�n kh�ng �� 5000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(2,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 2 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 5000)
		gf_AddItemEx2({0,102,8844, 1, 4, -1, -1, -1, -1, -1, -1}, "Huy Ho�ng Qu�t Kh�i ", EVENT_LOG_TITLE , "nh�n")
		gf_AddItemEx2({0,102,8845, 1, 4, -1, -1, -1, -1, -1, -1}, "Vinh D� Qu�t Kh�i ", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n C�p nh�n h� tr� m�t t�ch 7% th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 5000  �i�m")
	elseif nType == 2 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B�n kh�ng �� 6000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(3,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 3 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({0,120,120, 1, 4}, "B�ch H�i Lam Phong", EVENT_LOG_TITLE , "nh�n", 30*24*3600)
		gf_AddItemEx2({0,121,84, 1, 4}, "B�ch H�i Lam Phong-Ch�n", EVENT_LOG_TITLE , "nh�n", 30*24*3600)
		gf_AddItemEx2({0,119,96, 1, 4}, "B�ch H�i Lam Phong-Vai", EVENT_LOG_TITLE , "nh�n", 30*24*3600)
		Msg2Player("C�c h� �� nh�n B� trang s�c B�ch H�i th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 6000  �i�m")
	elseif nType == 3 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B�n kh�ng �� 6000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(3,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 3 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({0,120,121, 1, 4}, "V� T��ng Kim Lu�n", EVENT_LOG_TITLE , "nh�n", 30*24*3600)
		gf_AddItemEx2({0,121,85, 1, 4}, "V� T��ng Kim Lu�n-Ch�n", EVENT_LOG_TITLE , "nh�n", 30*24*3600)
		gf_AddItemEx2({0,119,97, 1, 4}, "V� T��ng Kim Lu�n-Vai", EVENT_LOG_TITLE , "nh�n", 30*24*3600)
		Msg2Player("C�c h� �� nh�n B� trang s�c V� T��ng th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 6000  �i�m")
	elseif nType == 4 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B�n kh�ng �� 6000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(3,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 3 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({0,120,122, 1, 4}, "Phong H�a Li�n Th�nh", EVENT_LOG_TITLE , "nh�n", 30*24*3600)
		gf_AddItemEx2({0,121,86, 1, 4}, "V�t ch�n Phong H�a Li�n Th�nh", EVENT_LOG_TITLE , "nh�n", 30*24*3600)
		gf_AddItemEx2({0,119,98, 1, 4}, "Phong H�a Li�n Th�nh-Vai", EVENT_LOG_TITLE , "nh�n", 30*24*3600)
		Msg2Player("C�c h� �� nh�n B� trang s�c Phong H�a th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 6000  �i�m")
	elseif nType == 5 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B�n kh�ng �� 6000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({2,1,30769, 1, 4}, "H�a Ph�ng Linh", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n H�a Ph�ng Linh  th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 6000  �i�m")
	elseif nType == 6 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 400  then
			Talk(1, "", "B�n kh�ng �� 400 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 400)
		gf_AddItemEx2({2,95,204, 1, 1}, "Thi�n Cang L�nh", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n Thi�n Cang L�nh th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 400  �i�m")
	elseif nType == 7 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 200  then
			Talk(1, "", "B�n kh�ng �� 200 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 200)
		gf_AddItemEx2({2,1,30370, 1, 1}, "Thi�n M�n Kim L�nh", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n Thi�n M�n Kim L�nh th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 200  �i�m")
	elseif nType == 8 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B�n kh�ng �� 6000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({0,102,random(31126,31127), 1, 1, -1, -1, -1, -1, -1, -1}, "Trang s�c h�o hi�p th��ng", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n Trang s�c h�o hi�p th��ng th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 6000  �i�m")
	elseif nType == 9 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 9000  then
			Talk(1, "", "B�n kh�ng �� 9000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 9000)
		LIB_Award:AwardByRoute(tbVuKhiHH)
		Msg2Player("C�c h� �� nh�n V� Kh� H�o Hi�p Th��ng th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 9000  �i�m")
	else
		Talk(1, "", "C� l�i xu�t hi�n! vui l�ng ch�n ��ng d�ng ch�n!.");
		return 0;
	end
end


function tichluy_doithuong_thucuoi()
	local szName = "Ch� Ti�n Trang"
	local szHeader = "<color=green>"..szName.." :<color>Ho�t ��ng n�p v�t ph�m l�y �i�m t�ch l�y :"
	local tbSayDialog = {};
	local nSaySize = 0;
	tinsert(tbSayDialog, "Ta mu�n ��i Ho�ng H� B�o B�o (Ti�u t�n 10000 �i�m)/#tichluy_doiphanthuong_thucuoi(1)")
	tinsert(tbSayDialog, "Ta mu�n ��i B�o �en B�o B�o (Ti�u t�n 10000 �i�m)/#tichluy_doiphanthuong_thucuoi(2)")
	tinsert(tbSayDialog, "Ta mu�n ��i B�o V�ng B�o B�o (Ti�u t�n 10000 �i�m)/#tichluy_doiphanthuong_thucuoi(3)")
	tinsert(tbSayDialog, "Ta mu�n ��i B�o Tr�ng B�o B�o (Ti�u t�n 10000 �i�m)/#tichluy_doiphanthuong_thucuoi(4)")
	tinsert(tbSayDialog, "Ta mu�n ��i B�ch Li�n Hoa (Ti�u t�n 6000 �i�m)/#tichluy_doiphanthuong_thucuoi(5)")
	tinsert(tbSayDialog, "Ta mu�n ��i H�ng Li�n Hoa (Ti�u t�n 6000 �i�m)/#tichluy_doiphanthuong_thucuoi(6)")
	tinsert(tbSayDialog, "Ta mu�n ��i T� Li�n Hoa (Ti�u t�n 6000 �i�m)/#tichluy_doiphanthuong_thucuoi(7)")
	tinsert(tbSayDialog, "Ta ch� gh� ngang/do_nothing")
	Say(szHeader, getn(tbSayDialog), tbSayDialog)	
end

function tichluy_doiphanthuong_thucuoi(nType)
	local szName = "Ch� Ti�n Trang"
	if nType == 1 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 10000  then
			Talk(1, "", "B�n kh�ng �� 10000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 10000)
		gf_AddItemEx2({0,105,30026, 1, 4, -1, -1, -1, -1, -1, -1}, "Ho�ng H� B�o B�o", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n Ho�ng H� B�o B�o th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 10000  �i�m")
	elseif nType == 2 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 10000  then
			Talk(1, "", "B�n kh�ng �� 10000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 10000)
		gf_AddItemEx2({0,105,30029, 1, 4, -1, -1, -1, -1, -1, -1}, "B�o �en B�o B�o", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n B�o �en B�o B�o th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 10000  �i�m")
	elseif nType == 3 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 10000  then
			Talk(1, "", "B�n kh�ng �� 10000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 10000)
		gf_AddItemEx2({0,105,30030, 1, 4, -1, -1, -1, -1, -1, -1}, "B�o V�ng B�o B�o", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n B�o V�ng B�o B�o th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 10000  �i�m")
	elseif nType == 4 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 10000  then
			Talk(1, "", "B�n kh�ng �� 10000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 10000)
		gf_AddItemEx2({0,105,30028, 1, 4, -1, -1, -1, -1, -1, -1}, "B�o Tr�ng B�o B�o", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n B�o Tr�ng B�o B�o th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 10000  �i�m")
	elseif nType == 5 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B�n kh�ng �� 6000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({0,105,30057, 1, 4, -1, -1, -1, -1, -1, -1}, "B�ch Li�n Hoa", EVENT_LOG_TITLE , "nh�n", 30*24*3600)
		Msg2Player("C�c h� �� nh�n B�ch Li�n Hoa (30 ng�y)  th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 6000  �i�m")
	elseif nType == 6 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B�n kh�ng �� 6000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({0,105,30058, 1, 4, -1, -1, -1, -1, -1, -1}, "H�ng Li�n Hoa", EVENT_LOG_TITLE , "nh�n", 30*24*3600)
		Msg2Player("C�c h� �� nh�n H�ng Li�n Hoa  (30 ng�y) th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 6000  �i�m")
	elseif nType == 7 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B�n kh�ng �� 6000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({0,105,30059, 1, 4, -1, -1, -1, -1, -1, -1}, "T� Li�n Hoa", EVENT_LOG_TITLE , "nh�n", 30*24*3600)
		Msg2Player("C�c h� �� nh�n T� Li�n Hoa (30 ng�y) th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 6000  �i�m")
	else
		Talk(1, "", "C� l�i xu�t hi�n! vui l�ng ch�n ��ng d�ng ch�n!.");
		return 0;
	end
end

function tichluy_doiphanthuong(nType)
	local szName = "Ch� Ti�n Trang"
	if nType == 1 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 150  then
			Talk(1, "", "B�n kh�ng �� 150 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 150)
		gf_AddItemEx2({2,1,30687, 15}, "Th�i Nh�t L�nh", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n 15 x Th�i Nh�t L�nh th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 150  �i�m")
	elseif nType == 2 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 250  then
			Talk(1, "", "B�n kh�ng �� 250 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,100) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 100 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 250)
		gf_AddItemEx2({2,95,2084,50,4}, " H�o Hi�p L�nh (Kh�a)", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n 50 x H�o Hi�p L�nh (Kh�a) th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 250  �i�m")
	elseif nType == 3 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 500  then
			Talk(1, "", "B�n kh�ng �� 500 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,100) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 100 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 500)
		gf_AddItemEx2({2,1,30681,50}, " Linh Thi�t", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n 50 x Linh Thi�t th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 500 �i�m")
	elseif nType == 4 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 750  then
			Talk(1, "", "B�n kh�ng �� 750 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,5) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 5 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 750)
		gf_AddItemEx2({2,1,30802,1}, " Ph�i Ph��ng V� Kh� H�o Hi�p", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n Ph�i Ph��ng V� Kh� H�o Hi�p th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 750 �i�m")
	elseif nType == 5 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 1000  then
			Talk(1, "", "B�n kh�ng �� 1000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,5) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 5 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local szName = "Ch� Ti�n Trang"
		local szHeader = "<color=green>"..szName.." :<color> C�c h� h�y ch�n 1 trong 3 Ph�i Ph��ng :"
		local tbSayDialog = {};
		local nSaySize = 0;
		tinsert(tbSayDialog, "Ta mu�n ��i Ph�i ph��ng V� H�(N�n)/#doi_haohiepvoha(1)")
		tinsert(tbSayDialog, "Ta mu�n ��i Ph�i ph��ng V� H�(�o)/#doi_haohiepvoha(2)")
		tinsert(tbSayDialog, "Ta mu�n ��i Ph�i ph��ng V� H�(qu�n)/#doi_haohiepvoha(3)")
		tinsert(tbSayDialog, "Ta ch� gh� ngang/do_nothing")
		Say(szHeader, getn(tbSayDialog), tbSayDialog)	
	elseif nType == 6 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 3600  then
			Talk(1, "", "B�n kh�ng �� 3600 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(3,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 3 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local szName = "Ch� Ti�n Trang"
		local szHeader = "<color=green>"..szName.." :<color>C�c h� h�y l�a ch�n 1 trong 3 b� trang b� Kim X� :"
		local tbSayDialog = {};
		local nSaySize = 0;
		tinsert(tbSayDialog,"Ta mu�n nh�n trang b� Kim X� V�n Du/#receive_KimXa_cap4(1)")
		tinsert(tbSayDialog,"Ta mu�n nh�n trang b� Kim X� Thi�t Huy�t/#receive_KimXa_cap4(2)")
		tinsert(tbSayDialog,"Ta mu�n nh�n trang b� Kim X� Du Hi�p/#receive_KimXa_cap4(3)")
		tinsert(tbSayDialog, "Ta ch� gh� ngang/do_nothing")
		Say(szHeader, getn(tbSayDialog), tbSayDialog)	
	elseif nType == 7 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 1220  then
			Talk(1, "", "B�n kh�ng �� 1220 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,10) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 10 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 1220)
		gf_AddItemEx2({2,1,30678,1}, " ��a Long Gi�p", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n 1 x ��a Long Gi�p th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 1220  �i�m")
	elseif nType == 8 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 1220  then
			Talk(1, "", "B�n kh�ng �� 1220 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,10) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 10 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 1220)
		gf_AddItemEx2({2,1,30677,1}, " Ma Lang Gi�p", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n 1 x Ma Lang Gi�p th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 1220  �i�m")
	elseif nType == 9 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 1220  then
			Talk(1, "", "B�n kh�ng �� 1220 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,10) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 10 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 1220)
		gf_AddItemEx2({2,1,30676,1}, " Vi�m Linh B�", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n 1 x Vi�m Linh B� th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 1220  �i�m")
	elseif nType == 10 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 1220  then
			Talk(1, "", "B�n kh�ng �� 1220 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,10) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 10 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 1220)
		gf_AddItemEx2({2,1,30675,1}, " Huy�n Vi�m C��ng", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n 1 x Huy�n Vi�m C��ng th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 1220  �i�m")
	elseif nType == 11 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 5000  then
			Talk(1, "", "B�n kh�ng �� 5000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 50 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 5000)
		gf_AddItemEx2({2,1,30682,100}, " Linh Ng�c", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n 100 x Linh Ng�c th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 5000  �i�m")
	elseif nType == 12 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B�n kh�ng �� 6000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,20) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 20 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({2,1,30814,1}, " Ph�c Sinh ��n", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n 1 x Ph�c Sinh ��n 100/100 th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 6000  �i�m")
	elseif nType == 13 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B�n kh�ng �� 6000 �i�m �� ��i v�t ph�m n�y.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,20) == 0 then
			Talk(1,"",szName.."C�c h� c�n 1 � h�nh trang, 20 s�c l�c �� nh�n ph�n th��ng n�y!");
			return 0
		end
		
		local szName = "Ch� Ti�n Trang"
		local szHeader = "<color=green>"..szName.." :<color> C�c h� h�y ch�n l�a h� ph�i mu�n nh�n m�t t�ch :"
		local tbSayDialog = {};
		local nSaySize = 0;
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch Thi�u L�m T�c gia/#TraoMatTichSieuCap20(2)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch Thi�u L�m V� t�ng/#TraoMatTichSieuCap20(4)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch Thi�u L�m thi�n t�ng/#TraoMatTichSieuCap20(3)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch ���ng M�n/#TraoMatTichSieuCap20(6)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch Nga My ph�t gia/#TraoMatTichSieuCap20(8)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch Nga My t�c gia/#TraoMatTichSieuCap20(9)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch C�i Bang T�nh y/#TraoMatTichSieuCap20(11)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch C�i Bang � y/#TraoMatTichSieuCap20(12)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch V� �ang ��o gia/#TraoMatTichSieuCap20(14)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch V� �ang t�c gia/#TraoMatTichSieuCap20(15)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch D��ng M�n th��ng K�/#TraoMatTichSieuCap20(17)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch D��ng M�n cung K�/#TraoMatTichSieuCap20(18)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch Hi�p ��c/#TraoMatTichSieuCap20(20)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch T� ��c/#TraoMatTichSieuCap20(21)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch C�n L�n Thi�n S�/#TraoMatTichSieuCap20(23)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch Minh Gi�o Th�nh Chi�n/#TraoMatTichSieuCap20(25)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch Minh Gi�o Tr�n Binh/#TraoMatTichSieuCap20(26)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch Minh Gi�o Huy�t Nh�n/#TraoMatTichSieuCap20(27)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch Th�y Y�n V� N�/#TraoMatTichSieuCap20(29)")
		tinsert(tbSayDialog, "Ta mu�n ��i m�t t�ch Th�y Y�n Linh N�/#TraoMatTichSieuCap20(30)")
		tinsert(tbSayDialog, "Ta ch� gh� ngang/do_nothing")
		Say(szHeader, getn(tbSayDialog), tbSayDialog)	
	else
		Talk(1, "", "C� l�i xu�t hi�n! vui l�ng ch�n ��ng d�ng ch�n!.");
		return 0;
	end
end

function TraoMatTichSieuCap20(nRoute)

	local tbMatTich = {
		[2] = {0,107,204, 2,"Kim Cang B�t Nh� Ch�n Quy�n"},
		[4] = {0,107,205, 1,"Ti�m Long T�c Di�t Ch�n Quy�n"},
		[3] = {0,107,206, 1,"V� Tr�n B� �� Ch�n Quy�n"},
		[6] = {0,107,207, 2,"Thi�n La Li�n Ch�u Ch�n Quy�n"},
		[8] = {0,107,208, 1,"Nh� � Kim ��nh Ch�n Quy�n"},
		[9] = {0,107,209, 1,"B�ch H�i Tuy�t �m Ch�n Quy�n"},
		[11] = {0,107,210, 2,"H�n ��n Tr�n Nh�c Ch�n Quy�n"},
		[12] = {0,107,211, 2,"Qu� Thi�n Du Long Ch�n Quy�n"},
		[14] = {0,107,212, 1,"Huy�n �nh M� T�ng Ch�n Quy�n"},
		[15] = {0,107,213, 2,"Qu�n T� ��i Phong Ch�n Quy�n"},
		[17] = {0,107,214, 2,"Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
		[18] = {0,107,215, 2,"Xuy�n V�n L�c H�ng Ch�n Quy�n"},
		[20] = {0,107,216, 2,"Huy�n Minh Phong Ma Ch�n Quy�n"},
		[21] = {0,107,217, 1,"Linh C� Huy�n T� Ch�n Quy�n"},
		[23] = {0,107,218,1,"C�u Thi�n Phong L�i Ch�n Quy�n"},
		[25] = {0,107,219,2,"H�i Phong Tr�m Nh�t Ch�n Quy�n"},
		[26] = {0,107,220,2,"Ph� K� H�nh Tr�n Ch�n Quy�n"},
		[27] = {0,107,221,1,"Ng�ng Huy�t Phong H�n Ch�n Quy�n"},
		[29] = {0,107,222,2,"H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[30] = {0,107,223,2,"Phong Hoa Thi�n Di�p Ch�n Quy�n"},
	}
	local tbRate = {
		[1] = {[1] = 2, nRate = 5},
		[2] = {[1] = 4, nRate = 5},
		[3] = {[1] = 3, nRate = 5},
		[4] = {[1] = 6, nRate = 5},
		[5] = {[1] = 8, nRate = 5},
		[6] = {[1] = 9, nRate = 5},
		[7] = {[1] = 11, nRate = 5},
		[8] = {[1] = 12, nRate = 5},
		[9] = {[1] = 14, nRate = 5},
		[10] = {[1] = 15, nRate = 5},
		[11] = {[1] = 17, nRate = 5},
		[12] = {[1] = 18, nRate = 5},
		[13] = {[1] = 20, nRate = 5},
		[14] = {[1] = 21, nRate = 5},
		[15] = {[1] = 23, nRate = 5},
		[16] = {[1] = 25, nRate = 5},
		[17] = {[1] = 26, nRate = 5},
		[18] = {[1] = 27, nRate = 5},
		[19] = {[1] = 29, nRate = 5},
		[20] = {[1] = 30, nRate = 5},
	}
	if nRoute == nil then
		nIndex = LIB_Award:GetValueByRate(tbRate)
	else
		nIndex = nRoute
	end
	local _, nItemID = AddItem(tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1)
	if tbMatTich[nIndex][4] == 1 then
		SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
	else
		SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
	end
	local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
	SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
	Msg2Player("B�n �� ti�u hao 6000  �i�m")
end

tbKimXaVanDu = {
	item = {
		{gdp={0,153,28,1,4,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng V�n Du"},
		{gdp={0,152,28,1,4,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng V�n Du"},
		{gdp={0,154,28,1,4,-1,-1,-1,-1,-1,-1,-1}, name="��o H�i V�n Du"},
	}
}
	
tbKimXaThietHuyet = {
	item = {
		{gdp={0,153,27,1,4,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng Thi�t Huy�t"},
		{gdp={0,152,27,1,4,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng Thi�t Huy�t"},
		{gdp={0,154,27,1,4,-1,-1,-1,-1,-1,-1,-1}, name="��o H�i Thi�t Huy�t"},
	}
}
	
tbKimXaDuHiep = {
	item = {
		{gdp={0,153,26,1,4,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng Du Hi�p"},
		{gdp={0,152,26,1,4,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng Du Hi�p"},
		{gdp={0,154,26,1,4,-1,-1,-1,-1,-1,-1,-1}, name="��o H�i Du Hi�p"},
	}
}

function receive_KimXa_cap4(nChoice)
	
	if nChoice  == 1 then
		LIB_Award:Award(tbKimXaVanDu)
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� V�n Du")
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 3600)
	elseif nChoice == 2 then
		LIB_Award:Award(tbKimXaThietHuyet)
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� Thi�t Huy�t")
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 3600)
	elseif nChoice == 3 then
		LIB_Award:Award(tbKimXaDuHiep)
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� Du Hi�p")
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 3600)
	end	
	Msg2Player("B�n �� ti�u hao 3600 �i�m")
end

function doi_haohiepvoha(nType)
	local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
	if nType == 1 then
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 1000)
		gf_AddItemEx2({2,1,30941,1}, " Ph�i ph��ng V� H�(N�n)", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n Ph�i ph��ng V� H�(N�n) th�nh c�ng!")
	elseif nType == 2 then
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 1000)
		gf_AddItemEx2({2,1,30942,1}, " Ph�i ph��ng V� H�(�o)", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n Ph�i ph��ng V� H�(�o) th�nh c�ng!")
	elseif nType == 3 then
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 1000)
		gf_AddItemEx2({2,1,30943,1}, " Ph�i ph��ng V� H�(Qu�n)", EVENT_LOG_TITLE , "nh�n")
		Msg2Player("C�c h� �� nh�n Ph�i ph��ng V� H�(Qu�n) th�nh c�ng!")
	else
		Talk(1, "", "C� l�i xu�t hi�n! vui l�ng ch�n ��ng d�ng ch�n!.");
		return 0;
	end
	Msg2Player("B�n �� ti�u hao 1000 �i�m")
end

tbThienHaVoSong = {
	[1] = {item={{gdp={0,100,30207,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Gi�p"},
					{gdp={0,101,30207,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Trang"},
					{gdp={0,103,30207,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Kh�i"},
				}},
	[2] = {item={{gdp={0,100,30208,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Gi�p"},
					{gdp={0,101,30208,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Trang"},
					{gdp={0,103,30208,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Kh�i"},
				}},
	[3] = {item={{gdp={0,100,30209,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Gi�p"},
					{gdp={0,101,30209,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Trang"},
					{gdp={0,103,30209,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Kh�i"},
				}},
	[4] = {item={{gdp={0,100,30210,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Gi�p"},
					{gdp={0,101,30210,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Trang"},
					{gdp={0,103,30210,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Kh�i"},
				}},
}

function tichluy_doitrangbicuoi()
	local szName = "Ch� Ti�n Trang"
	local szNpcName = "Ch� Ti�n Trang : "
	if gf_GetTaskByte(2162, 4) == 1 then
		Talk(1, "",szName.."C�c h� �� nh�n ph�n th��ng n�y r�i!Kh�ng th� ti�p t�c nh�n!");
		return 0;
	end
	
	local strNpcName = "Chu Tien Trang : "
	
	if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 700000  then
		Talk(1, "", "B�n kh�ng �� 700.000 �i�m �� ��i v�t ph�m n�y.");
		return 0;
	end
	
	if gf_JudgeRoomWeight(3,100) == 0 then
		Talk(1,"",szName.."C�c h� c�n 3 � h�nh trang, 100 s�c l�c �� nh�n ph�n th��ng n�y!");
		return 0
	end
	
	LIB_txtData:Init("doithuongtichluy.txt")
	LIB_txtData:LoadData()
	local nNationRank = LIB_txtData.tbTextData[tonumber(1)]
	if nNationRank >= 3 then
		Talk(1, "", strNpcName.."Ph�n th��ng 3 cao th� ��u ti�n nh�n thi�n h� v� song �� c� ch� nh�n!");
		return	
	end
	
	if LIB_txtData:AddValue(tonumber(1),1,3) == 1 then
		local nBody = GetBody()
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 700000)
		gf_SetTaskByte(2162, 4, 1)
		Msg2Player("C�c h� �� nh�n 1 b� trang b� Thi�n H� V� Song th�nh c�ng!")
		Msg2Player("B�n �� ti�u hao 700.000  �i�m")
		LIB_Award.szLogTitle = "NHAN PHAN THUONG CUOI - THIEN HA VO SONG"
		LIB_Award.szLogAction = "th�nh c�ng"
		LIB_Award:Award(tbThienHaVoSong[nBody])
		Talk(1,"",szNpcName.."Nh�n ph�n th��ng cu�i, ng��i qu� l� Thi�n h� v� song.")
	end
end

tbKimXaHC = {
	item = {
		{gdp={0,153,29,1,4,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng Hi�p C�t"},
		{gdp={0,152,29,1,4,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng Hi�p C�t"},
		{gdp={0,154,29,1,4,-1,-1,-1,-1,-1,-1,-1}, name="��o H�i Hi�p C�t"},
	}
}
	
tbKimXaQP = {
	item = {
		{gdp={0,153,30,1,4,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng Qu� Ph�"},
		{gdp={0,152,30,1,4,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng Qu� Ph�"},
		{gdp={0,154,30,1,4,-1,-1,-1,-1,-1,-1,-1}, name="��o H�i Qu� Ph�"},
	}
}
	
tbKimXaDV = {
	item = {
		{gdp={0,153,31,1,4,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng ��ng V�n"},
		{gdp={0,152,31,1,4,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng ��ng V�n"},
		{gdp={0,154,31,1,4,-1,-1,-1,-1,-1,-1,-1}, name="��o H�i ��ng V�n"},
	}
}

function NhanPhanThuongKX5()
	local szName = "Ch� Ti�n Trang"
	local szHeader = "<color=green>"..szName.." :<color>C�c h� h�y l�a ch�n 1 trong 3 b� trang b� Kim X� c�p 5 :"
	local tbSayDialog = {};
	local nSaySize = 0;
	tinsert(tbSayDialog,"Ta mu�n nh�n trang b� Kim X� Hi�p C�t/#receive_KimXa_cap5(1)")
	tinsert(tbSayDialog,"Ta mu�n nh�n trang b� Kim X� Qu� Ph�/#receive_KimXa_cap5(2)")
	tinsert(tbSayDialog,"Ta mu�n nh�n trang b� Kim X� ��ng V�n/#receive_KimXa_cap5(3)")
	tinsert(tbSayDialog, "Ta ch� gh� ngang/do_nothing")
	Say(szHeader, getn(tbSayDialog), tbSayDialog)	
end

function receive_KimXa_cap5(nChoice)
	if nChoice  == 1 then
		LIB_Award:Award(tbKimXaHC)
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� Hi�p C�t")
	elseif nChoice == 2 then
		LIB_Award:Award(tbKimXaQP)
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� Qu� Ph�")
	elseif nChoice == 3 then
		LIB_Award:Award(tbKimXaDV)
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� ��ng V�n")
	end	
	for i=1,3 do 
		TraoMatTichSieuCap20()
	end
	gf_AddItemEx2({2,1,30230,10000}, " Xu", EVENT_LOG_TITLE , "nh�n")
	gf_AddItemEx2({2,95,204,30}, " Thi�n Cang L�nh", EVENT_LOG_TITLE , "nh�n")
	gf_AddItemEx2({2,1,30370,30}, " Thi�n M�n Kim L�nh", EVENT_LOG_TITLE , "nh�n")
	gf_AddItemEx2({0,102,30037,1,4,-1,-1,-1,-1,-1,-1,-1}, " Thi�n ��a Gi�i Ch�", EVENT_LOG_TITLE , "nh�n")
	gf_AddItemEx2({0,102,30038,1,4,-1,-1,-1,-1,-1,-1,-1}, " Nh�t Nguy�t Gi�i Ch�", EVENT_LOG_TITLE , "nh�n")
	gf_SetTaskByte(2162, 3, 1)
end

function PhanThuongExt()
	local szName = "Ch� Ti�n Trang :"
	if gf_GetTaskByte(2162, 4) == 0 then
		Talk(1, "",szName.."C�c h� kh�ng ph�i l� Thi�n H� V� Song! kh�ng th� nh�n ph�n th��ng n�y");
		return 0;
	end
	
	if gf_GetTaskByte(2162, 4) == 1 and gf_GetTaskByte(2162, 3) == 1 then
		Talk(1, "",szName.."C�c h� �� nh�n ph�n th��ng n�y r�i!Kh�ng th� ti�p t�c nh�n!");
		return 0;
	end
	
	if gf_JudgeRoomWeight(25,200) == 0 then
		Talk(1,"",szName.."C�c h� c�n 25 � h�nh trang, 200 s�c l�c �� nh�n ph�n th��ng n�y!");
		return 0
	end
	
	NhanPhanThuongKX5()
end
