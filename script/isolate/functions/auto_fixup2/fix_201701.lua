--�޸�ˢ�������ɱ�������İ׾��� ������ ������
Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\misc\\taskmanager.lua")
t_Fix_201701 = {
	nTimeLine = 20170119,
	--tMap = {},
	t_Black_list = {
    --	{"account", "role"},
--        {"minisakano1", "oo0LinhMiu0oo"},
--        {"ngockutekute5", "iNMKzQueenBeezz"},
--        {"ngaxinh20109x", "ThoBuffZziiiBh"},
--        {"loveyoumylove619", "oIoDevillDeath"},
--        {"huynhminhthuan2015", "oBackleBo"},
--        {"hoangut2", "iiovzZZombie"},
--        {"duybv1979", "TAHzHaNoiBuon"},
--        {"khanhhoi187", "iozNhoVeEmHT3"},
--        {"mrminhnguyen1210", "oStTieuTuDaTinh0"},
--        {"hoaphuong58", "ThoXinhziiioZ"},
--        {"minhnguyen121083", "Ki?mMaT1T��n2010"},
--        {"ngudocdetulk", "MuaRoiLangTham"},
--        {"quakhuvaanh0001", "iozLeeLeeioz"},
--        {"vcoinlk2012", "jxGhost"},
--        {"nhoccobac1989", "GreenyRose"},
--        {"mrminhnguyen007", "ostLinDaNguyenzx"},
--        {"nuanhhung1210", "ioZBuffThueffBH"},
--        {"servervanlong", "zTNzNhanTaiViet"},
--        {"0947781411", "LzLayVoNguoiTa"},
--        {"heotimheo2013", "IzLayChongNhoBan"},
--        {"tadocchuyendung", "iDocNayYHocBoTay"},
--        {"hanhanloveoxvn", "TAHzYangBee"},
--        {"huynhminhthuann2015", "02Backle02"},
--        {"nguyenthianhthu1995", "IzAudiR8zI"},
--        {"ngocvan123588", "aaaa12"},
--        {"lapsonlavippc", "UCHvItachi"},
--        {"lamnhathuy19942012", "TheKingPk"},
--        {"bomaylao006", "cuichuicuibap"},
--        {"thitxongkhoi1002", "zKungFuPanda"},
--        {"longhotranhhungbsdn1234", "NhutCaNa"},
--        {"tlq2901", "CuuAnThit"},
--        {"anhtrungkaka434", "zzzAnhTrungzzz"},
--        {"luongbenhdi05", "1TienHaSongDieu2"},
--        {"xusothantien261993", "SPzGauSieuNhanII"},
--        {"likapkthuphucyeuma", "CkChieuVkDuc"},
--        {"loveyoumylove2016", "oIoS?tTh?M��aQu1t"},
--        {"nhokyumi95", "zS2zKhanhLinho0o"},
--        {"duynht", "iZLamborghiniZi"},
--        {"nguyenthianhmi1986", "zS2AnhNg0k"},
--        {"anh_hung2030", "iiizNoBiTaz"},
--        {"xadixidaradi2109", "DuLongKh?ch"},
--        {"loveover1002", "iiiSiauM��aC��t"},
--        {"tranduytanbkv", "phongthanhduong"},
--        {"ngamidanpro91", "iIRvS2GcIi"},
--        {"bictim", "haviet05"},
--        {"nguyenthanhtu62", "PhiMonAnh"},
--        {"doremonbame", "VanTieuDoatMenh"},
--        {"bunpoquakhu", "S2V��Kh��cS2"},
--        {"haosacdaisutxbt1", "T31110T3"},
--        {"wakeup229", "ALiSuSu"},
--        {"iloveyouxxxyyy", "oTheSilent0fLove"},
--        {"lamtieuphuong199882", "s2MrKeniiAmSoHot"},
--        {"caothanhthuy1990kg", "accposttl2"},
--        {"hohuynhhieu221267", "DGCCodon"},
--        {"ngamy19892016", "MinionNgaMy"},
--        {"volam112233166", "zzFBxGoodCity"},
--        {"nguyenhuunguyen6898", "ZT3ZzTi��uSiauChu"},
--        {"volamquan0030", "Ngh��oV��Game"},
--        {"thoreal97", "ThoReal"},
--        {"dandutday1607", "HoangLamQuanchua"},
--        {"doideoyeu113", "st0oKimHaNao0"},
--        {"tuyetvahoa", "iiBichPhuong"},
--        {"mayantaodi_1", "vinh01"},
--        {"marcjac0bs1991", "JAVzThichToaSang"},
--        {"nghiavanduy", "zJameMoss"},
--        {"anhchangkho3999", "zTAEzNoBiTaS2"},
--        {"bunkorea90", "zNYzPinkSkyo0o"},
--        {"doncbvn2", "DKzTieuSieuChuoi"},
--        {"npcemhdacxtmlx", "izPeMap"},
--        {"canstopnt", "PexyPonggon"},
--        {"taisaozayem2012", "zzLHHzSauTatCa"},
--        {"designhb", "Jx2Trung1102"},
--        {"anahondass", "TaYUnha"},
--        {"truongvanbe1981", "iissBabyGirl1102"},
--        {"laysay987", "LoLzCh��Ti��uzLoL"},
--        {"tannernguyen2710", "zzDieuNhi"},
--        {"hoanghaitrung0804", "IPeNgheoKuT3"},
--        {"leminhtri2961996", "s2iiiSadMemories"},
--        {"whatalife000702", "iiZzLamTieuDiep"},
--        {"nguyenthikimquyen147", "malanhthien"},
--        {"nhaunhan", "SpoGoodSpeed"},
--        {"titanquest229", "ALiSuShi"},
--        {"nhatphienbangtam147", "nhatphienbangtam"},
--        {"ducoshirma", "JameNico215"},
--        {"volam2432371", "TenEmLagi"},
--        {"tunglatuoitho06", "0ooChangameoo0"},
--        {"duyprovt195", "MrNguy?nDuy"},
--        {"hieuhuyen3101", "oS2oKimThanLong"},
--        {"honghoatientu2007", "ThoTrangZiiizBH"},
--        {"duongmonnguyetung", "SakerFreedom01"},
--        {"nguyendinhphuctk3000", "PC2TongThiennKy"},
--        {"huhu339", "zKzBurberry"},
--        {"conlonnguyetung", "SakerFreedom1"},
--        {"gaoblue01", "NMKxFiora"},
--        {"boyzjn9x9x9x", "oIKh?ngKhaiIo"},
--        {"toanphuong023", "PHzMaiYeu"},
--        {"duytuan0935569355", "0oBanChanViet0o"},
--        {"khocchoniemdau", "BHzXvipXz"},
--        {"lordofthekjng1", "zLordOfTheKings"},
--        {"lamkg1980", "BuBuMapZiiizBH"},
--        {"duongprons555", "NsFxduongkillerx"},
--        {"mayantaodi_11", "o0ongud0co0o"},
--        {"nguyenhuunguyen6890", "T3zYeuSinhLyoo"},
--        {"nguyenhuyenanh34", "iiizXuKaz"},
--        {"toandieuls5", "S?i��?n�쨦c"},
--        {"letrung191993", "Ng��nKu��?mM��iM?t"},
--        {"duongmonnguyetung1", "SakerFreedom001"},
--        {"hoanghaitrungw", "S2zzThatTinhBuon"},
--        {"nguyendinhphuctk2000", "Pc2DongYiYiYi"},
--        {"nguyendinhphuctk1000", "Pc2TongThienGiag"},
--        {"trungquan0026", "SoLoBacTrungNam"},
--        {"thienhadenhat12345pt", "ZzthienlanzZZ"},
--        {"vittappk", "izVitNhi"},
--        {"volam112233165", "JxHQ1Moons"},
--        {"hangho1995", "zzNHPzSauTatCa"},
--        {"lekietlevan", "SrTieuLongNhi"},
--        {"tklenh01", "ioizZzKieuNhi"},
--        {"ngamydan19892016", "MinionLaEm"},
--        {"superman01091992", "xxHaiLamTuongVi"},
--        {"hoangdo007", "GCzChiPheo"},
--        {"huungoc1970km", "Jx2SatThuKiem"},
--        {"gara0t0nguyen", "zIztieuthuyetty"},
--        {"hungpronmd", "iZzBHoziLanNhi"},
--        {"toandieuls91", "C?mX��cD?ngTr��o"},
--        {"lizziecarol", "zS2zHyugaHinata1"},
--        {"06huyen161195", "NgocOanhTeamNmk"},
--        {"denhieu2013", "zDNzEmXinCanTeam"},
--        {"huetrang11556", "ioizZzHueNhi"},
--        {"mayantaodi_1994", "cunbayby"},
--        {"zztinhtangzz", "��aT��nhC?N-?ng"},
	},

T_CK_TASK_LIST = {
	--{enable, name,{condition,desc},{exp,score,exaward_func,ext_rate},{task_index,task_bit_get,task_bit_finish|func_check_finish,task_bit_award}}
	--��ս���� ������������
	[1101] = {0, "V�n ti�u", {"Ho�n th�nh 1 l�n nhi�m v� v�n ti�u", "��n b�n �� th� l�c ch� NPC Ti�u ��u Tr�n Vi�n Ti�u C�c �� nh�n nhi�m v� v�n ti�u"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 1, 2, 3}},
	[1102] = {0, "C��p ti�u", {"Ho�n th�nh 1 l�n nhi�m v� c��p ti�u", "��n b�n �� th� l�c ch� NPC Ti�u ��u Tr�n Vi�n Ti�u C�c �� nh�n nhi�m v� �o�t ti�u"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 4, 5, 6}},
	[1103] = {0, "Thu th�p Ng�c Ph�ch", {"Thu th�p 1 Ng�c Ph�ch", "��n Th�i H� C� Th� c�a th� l�c tr�ng 1 h�t gi�ng, thu th�p 1 Ng�c Ph�ch"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 7, 8, 9}},
	[1104] = {0, "Tr�m Ng�c Ph�ch", {"��n th� l�c kh�c tr�m 1 Ng�c Ph�ch", "V�o b�n �� th� l�c kh�c �� tr�m 1 Ng�c Ph�ch"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 10, 11, 12}},
	[1105] = {0, "T�y V�c Truy�n ��o", {"Tham gia t�nh n�ng T�y V�c Truy�n ��o, nh�p v�o 3 th�nh v�t �� nh�n th��ng", "V�o b�n �� th� l�c tham gia t�nh n�ng T�y V�c Truy�n ��o, nh�p v�o 3 th�nh v�t �� nh�n th��ng"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 13, 14, 15}},
	[1106] = {0, "BOSS Th� L�c", {"Nh�n b�o v� BOSS c�a th� l�c v� ti�u di�t BOSS c�a th� l�c phe ��ch �� nh�n ���c ph�n th��ng", "Bu�i t�i s� xu�t hi�n BOSS c�a th� l�c phe ta ho�c phe ��ch, b�o v� BOSS c�a phe ta v� ti�u di�t BOSS c�a phe ��ch s� nh�n ���c ph�n th��ng"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 16, 17, 18}},
	[1107] = {0, "Th� S�n Ti�n Th��ng", {"Ho�n th�nh 1 l�n nhi�m v� Th� S�n Ti�n Th��ng", "Ho�n th�nh 1 l�n nhi�m v� Th� S�n Ti�n Th��ng"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 19, 20, 21}},
	[1108] = {0, "Nhi�m v� ��o Kho B�u", {"Ho�n th�nh 1 l�n nhi�m v� ��o Kho B�u", "V�o th� l�c nh�n 1 T�ng B�o ��, ho�n th�nh 1 l�n nhi�m v� ��o Kho B�u"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 22, 23, 24}},
	
	--��ս���� ��������
--	[1201] = {},
--	[1202] = {},
--	[1203] = {},
--	[1204] = {},
--	
--	--��ս���� PvP����
--	[1301] = {},
--	[1302] = {},
--	[1303] =  {0, "��������pk", {"�������������1λ�ж����", "ɱ���ж�������1����ң�֤�����������"}, {8000000, 24}, {8, 25, 26, 27}},
--	[1304] = {},
--	[1305] = {},
--	[1306] = {},
--	[1307] = {},
	
	--��ս�پ� �������
	[2101] = {0, "Gia nh�p bang h�i", {"Gia nh�p m�t bang h�i b�t k�, tr� th�nh m�t th�nh vi�n trong bang", "Gia nh�p bang h�i, c�ng v�i th�nh vi�n kh�c c� g�ng �� gi�p bang h�i ng�y c�ng l�n m�nh"}, {3000000, 100}, {9, 0, _ck_check_tong, 1}},
	[2102] = {0, "T�i chi�n Th�n Th�", {"N�p 300 �i�m t�ch l�y t� quang (Sau khi giao nhi�m v� th� hai b�n s� b� tr� 300 �i�m t�ch l�y t� quang)", "Ch� c� ng��i m�i c� th� thu�n ph�c T� Quang Th�n Th�!"}, {5000000, 100, _ck_del_300_ziguangjifen}, {9, 0, _ck_check_300_ziguangjifen, 2}},
	[2103] = {0, "N�p �i�m c�ng hi�n bang h�i", {"Tham gia t�nh n�ng Bang H�i Vinh Danh, giao n�p 10 �i�m c�ng hi�n bang h�i", "Tham gia t�nh n�ng Bang H�i Vinh Danh, giao n�p 10 �i�m c�ng hi�n bang h�i"}, {8000000, 100}, {9, 0, 3, 4}},
	[2104] = {0, "Nh�n ph�n th��ng Bang H�i Vinh Danh", {"Nh�n ph�n th��ng Bang H�i Vinh Danh", "Tham gia t�nh n�ng Bang H�i Vinh Danh v� nh�n ph�n th��ng"}, {10000000, 300}, {9, 0, 5, 6}},
	
	[2201] = {0, "Th� Th�ng", {"K�ch ho�t 1 th� th�ng", "K�ch ho�t th� th�ng, ch�i tr� ch�i nh� nh�ng h�n"}, {5000000, 1200}, {10, 0, _ck_check_yueka, 1}},
	[2202] = {0, "Gia nh�p th� l�c", {"Gia nh�p 1 th� l�c trong ba phe", "Gia nh�p 1 th� l�c trong ba phe"}, {5000000, 300}, {10, 0, _ck_check_shili, 2}},
	[2203] = {0, "V�n ti�u", {"Ho�n th�nh 1 l�n v�n ti�u", "V�o th� l�c nh�n nhi�m v� v�n ti�u, ho�n th�nh 1 l�n v�n ti�u"}, {5000000, 600}, {10, 0, 3, 4}},
	[2204] = {0, "C��p ti�u", {"Ho�n th�nh 1 l�n c��p ti�u", "V�o th� l�c nh�n nhi�m v� c��p ti�u, ho�n th�nh 1 l�n c��p ti�u"}, {5000000, 600}, {10, 0, 5, 6}},
	[2205] = {0, "Tr�ng c�y", {"Ho�n th�nh 1 l�n nhi�m v� tr�ng c�y", "V�o th� l�c ch� C�y Th�i H� ho�n th�nh 1 l�n nhi�m v� tr�ng c�y"}, {5000000, 600}, {10, 0, 7, 8}},
	[2206] = {0, "��o r��ng", {"Ho�n th�nh 1 l�n nhi�m v� ��o r��ng", "Ho�n th�nh 1 l�n nhi�m v� ��o r��ng"}, {5000000, 600}, {10, 0, 9, 10}},
	[2207] = {0, "Th� S�n Ti�n Th��ng", {"Ho�n th�nh 1 l�n nhi�m v� Th� S�n Ti�n Th��ng", "Ho�n th�nh 1 l�n nhi�m v� Th� S�n Ti�n Th��ng"}, {5000000, 600}, {10, 0, 11, 12}},
	[2208] = {0, "T�y V�c Truy�n ��o", {"D�ng 1 ��o c� b�t k� sau ��y: Kim L�ng T�u, T�ng Ki�m B� Truy�n T�m Kinh, B�ch Hi�u Sinh B� Ph�p", "Tham gia t�nh n�ng T�y V�c Truy�n ��o, s� d�ng 1 ��o c� b�t k� sau ��y: Kim L�ng T�u, T�ng Ki�m B� Truy�n T�m Kinh, B�ch Hi�u Sinh B� Ph�p"}, {5000000, 600}, {10, 0, 13, 14}},
},
T_CK_TASK_GROUP_LIST = {
	--name, {type,desc}, {sub_list_group}
	[1] = {
		"Tr�m Tr�n Tr�m Th�ng", {1, "H�ng ng�y nh�n ng�u nhi�n, nh�n ���c nhi�u EXP v� �� n�ng ��ng!"},
		{
			--name, random_count, {task_index_list}
			[1] = {"Nhi�m v� Th� L�c Ba Phe", 4, {1101,1102,1103,1104,1105,1106,1107,1108}}, --��ս����-������������
		},
	},
	[2] = {
		"T�c Chi�n T�c Th�ng", {2, "Trong th�i gian ho�t ��ng ch� ho�n th�nh 1 l�n, nh�n ���c nhi�u EXP v� �� n�ng ��ng!"},
		{
			[1] = {"Nhi�m v� bang h�i", 0, {2101,2102,2103,2104}}, --��ս�پ�-�������
			[2] = {"Nhi�m v� h��ng d�n", 0, {2201,2202,2203,2204,2205,2206,2207,2208}}, --��ս�پ�-ָ������
		},
	},
},
}
function t_Fix_201701:ck_get_task_cfg(nTaskIndex)
	local t = self.T_CK_TASK_LIST[nTaskIndex]
	if not t then
		error(format("CDKey: not find task %d", nTaskIndex))
	end
	return t
end
function t_Fix_201701:ck_get_task_bitset(nTaskIndex)
	local t = self:ck_get_task_cfg(nTaskIndex)
	return t[5]
end

function t_Fix_201701:ck_task_daily_clear()--ÿ������
	--��ս���������������
	local CK_TASK_GROUP = TaskManager:Create(9, 18);
	local t = self.T_CK_TASK_GROUP_LIST[1][3]
	for _,t1 in t do
		for _,task_index in t1[3] do
			local tBitSet = self:ck_get_task_bitset(task_index)
			local nGroupTaskIndex = tBitSet[1]
			local nBitGet = tBitSet[2]
			local nBitFinish = tBitSet[3]
			local nBitAward = tBitSet[4]
			CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitGet, 0)
			CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitFinish, 0)
			CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitAward, 0)
		end
	end
end
function t_Fix_201701:fix_up(nLastLoginDate)
	--if nLastLoginDate <= self.nTimeLine then
		local szAccount = GetAccount()
		local szRole = GetName()
		local CK_TASK_GROUP = TaskManager:Create(9, 18);
		--if self:is_in_black_list(szAccount, szRole)==1 then
    		local szLog = format("t_Fix_201701:fix_up [%s|%s LastLogin=%d] nTask1=%d nTask2=%d nTask3=%d nTask4=%d nTask5=%d nScore=%d nAward=%d exp=%d", szAccount, szRole, nLastLoginDate
    			, CK_TASK_GROUP:GetTaskBit(1, 1), CK_TASK_GROUP:GetTaskBit(2, 1)
    			, CK_TASK_GROUP:GetTaskBit(3, 1), CK_TASK_GROUP:GetTaskBit(4, 1)
    			, CK_TASK_GROUP:GetTaskBit(5, 1), CK_TASK_GROUP:GetTaskBit(6, 1)
    			, CK_TASK_GROUP:GetTaskBit(7, 1), GetExp()
    		)
    		WriteLog(szLog)
    		--clear_item(2,1,270)--�׾���
    		--clear_item(2,1,1064)--������
    		--clear_item(2,1,1097)--������
    		--SetTask(2501, 0)--�׾���ʱ��
    		--for i=1,2 do
    		--	local n = EatLiushen(1, -2000000000)--������ʱ��
    		---	if 0==n then break end
    		--end
    		--for i=1,2 do
    		--	local n = EatSanqin(1, -2000000000)--������ʱ��
    		--	if 0==n then break end
    		--end
    		--for i=1,100 do
    		--	local n = GetExp()
    		--	local nDel = -2000000000
    		--	if n < 2000000000 then
    		--		nDel = -1 * n
    		--	end
    		--	ModifyExp(nDel)
    		--	n = GetExp()
    		--	if n <= 0 then break end
    		--end
			CK_TASK_GROUP:SetTaskBit(1, 3, 0);
			for i = 12, 31 do
				CK_TASK_GROUP:SetTaskBit(1, i, 0);
			end
			CK_TASK_GROUP:SetTask(2, 0);
			for i = 1, 16 do
				CK_TASK_GROUP:SetTaskBit(3, i, 0);
			end
			--ɾ����ս����������
			for i = 234, 238 do
				DirectDeleteTask(i)
			end
			self:ck_task_daily_clear()
			RemoveTitle(68, 3);
    		local szMsg = format("Hi�n t�i ch�c n�ng Minh Gi�o l�nh �� t�m ��ng! T�t c� nhi�m v� v� danh hi�u s� b� x�a b�!B�n trang s� ti�n h�nh s�a l�i n�y!")
    		Msg2Player(szMsg)
    		Talk(1,"",szMsg)
    	--end
	--end
	if nLastLoginDate <= self.nTimeLine then
		local szAccount = GetAccount()
		local szRole = GetName()
		local CK_TASK_GROUP = TaskManager:Create(9, 18);
		--if self:is_in_black_list(szAccount, szRole)==1 then
    		local szLog = format("t_Fix_201701:fix_up [%s|%s LastLogin=%d] nTask1=%d nTask2=%d nTask3=%d nTask4=%d nTask5=%d nScore=%d nAward=%d exp=%d", szAccount, szRole, nLastLoginDate
    			, CK_TASK_GROUP:GetTaskBit(1, 1), CK_TASK_GROUP:GetTaskBit(2, 1)
    			, CK_TASK_GROUP:GetTaskBit(3, 1), CK_TASK_GROUP:GetTaskBit(4, 1)
    			, CK_TASK_GROUP:GetTaskBit(5, 1), CK_TASK_GROUP:GetTaskBit(6, 1)
    			, CK_TASK_GROUP:GetTaskBit(7, 1), GetExp()
    		)
    		WriteLog(szLog)
    		--clear_item(2,1,270)--�׾���
    		--clear_item(2,1,1064)--������
    		--clear_item(2,1,1097)--������
    		--SetTask(2501, 0)--�׾���ʱ��
    		--for i=1,2 do
    		--	local n = EatLiushen(1, -2000000000)--������ʱ��
    		---	if 0==n then break end
    		--end
    		--for i=1,2 do
    		--	local n = EatSanqin(1, -2000000000)--������ʱ��
    		--	if 0==n then break end
    		--end
    		--for i=1,100 do
    		--	local n = GetExp()
    		--	local nDel = -2000000000
    		--	if n < 2000000000 then
    		--		nDel = -1 * n
    		--	end
    		--	ModifyExp(nDel)
    		--	n = GetExp()
    		--	if n <= 0 then break end
    		--end
			CK_TASK_GROUP:SetTaskBit(1, 3, 0);
			for i = 12, 31 do
				CK_TASK_GROUP:SetTaskBit(1, i, 0);
			end
			CK_TASK_GROUP:SetTask(2, 0);
			for i = 1, 16 do
				CK_TASK_GROUP:SetTaskBit(3, i, 0);
			end
			--ɾ����ս����������
			for i = 234, 238 do
				DirectDeleteTask(i)
			end
			self:ck_task_daily_clear()
			RemoveTitle(68, 3);
    		local szMsg = format("Hi�n t�i ch�c n�ng Minh Gi�o l�nh �� t�m ��ng! T�t c� nhi�m v� v� danh hi�u s� b� x�a b�!B�n trang s� ti�n h�nh s�a l�i n�y!")
    		Msg2Player(szMsg)
    		Talk(1,"",szMsg)
    	--end
	end
end
function t_Fix_201701:is_in_black_list(szAccount, szRole)
	for i,v in self.t_Black_list do
		if v[1]==szAccount and v[2]==szRole then
			return 1
		end
	end
	return 0
end

function clear_item(g,d,p)
	local nCnt = BigGetItemCount(g,d,p)
	if nCnt > 0 then
		BigDelItem(g,d,p,nCnt)
	end
end
