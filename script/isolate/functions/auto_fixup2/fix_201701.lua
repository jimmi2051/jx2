--修复刷荣誉帮派宝箱产出的白驹丸 六神丸 三清丸
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
--        {"minhnguyen121083", "Ki?mMaT1Tèn2010"},
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
--        {"loveyoumylove2016", "oIoS?tTh?MóaQu1t"},
--        {"nhokyumi95", "zS2zKhanhLinho0o"},
--        {"duynht", "iZLamborghiniZi"},
--        {"nguyenthianhmi1986", "zS2AnhNg0k"},
--        {"anh_hung2030", "iiizNoBiTaz"},
--        {"xadixidaradi2109", "DuLongKh?ch"},
--        {"loveover1002", "iiiSiauMóaCét"},
--        {"tranduytanbkv", "phongthanhduong"},
--        {"ngamidanpro91", "iIRvS2GcIi"},
--        {"bictim", "haviet05"},
--        {"nguyenthanhtu62", "PhiMonAnh"},
--        {"doremonbame", "VanTieuDoatMenh"},
--        {"bunpoquakhu", "S2VòKhócS2"},
--        {"haosacdaisutxbt1", "T31110T3"},
--        {"wakeup229", "ALiSuSu"},
--        {"iloveyouxxxyyy", "oTheSilent0fLove"},
--        {"lamtieuphuong199882", "s2MrKeniiAmSoHot"},
--        {"caothanhthuy1990kg", "accposttl2"},
--        {"hohuynhhieu221267", "DGCCodon"},
--        {"ngamy19892016", "MinionNgaMy"},
--        {"volam112233166", "zzFBxGoodCity"},
--        {"nguyenhuunguyen6898", "ZT3ZzTióuSiauChu"},
--        {"volamquan0030", "NghìoV×Game"},
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
--        {"laysay987", "LoLzChóTióuzLoL"},
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
--        {"toandieuls5", "S?i§?n§éc"},
--        {"letrung191993", "NgμnKu§?mMáiM?t"},
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
--        {"toandieuls91", "C?mXócD?ngTrμo"},
--        {"lizziecarol", "zS2zHyugaHinata1"},
--        {"06huyen161195", "NgocOanhTeamNmk"},
--        {"denhieu2013", "zDNzEmXinCanTeam"},
--        {"huetrang11556", "ioizZzHueNhi"},
--        {"mayantaodi_1994", "cunbayby"},
--        {"zztinhtangzz", "§aT×nhC?N-?ng"},
	},

T_CK_TASK_LIST = {
	--{enable, name,{condition,desc},{exp,score,exaward_func,ext_rate},{task_index,task_bit_get,task_bit_finish|func_check_finish,task_bit_award}}
	--百战不殆 三方势力任务
	[1101] = {0, "V薾 ti猽", {"Ho祅 th祅h 1 l莕 nhi謒 v� v薾 ti猽", "дn b秐  th� l鵦 ch� NPC Ti猽 u Tr蕁 Vi詎 Ti猽 C鬰  nh薾 nhi謒 v� v薾 ti猽"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 1, 2, 3}},
	[1102] = {0, "Cp ti猽", {"Ho祅 th祅h 1 l莕 nhi謒 v� cp ti猽", "дn b秐  th� l鵦 ch� NPC Ti猽 u Tr蕁 Vi詎 Ti猽 C鬰  nh薾 nhi謒 v� 畂箃 ti猽"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 4, 5, 6}},
	[1103] = {0, "Thu th藀 Ng鋍 Ph竎h", {"Thu th藀 1 Ng鋍 Ph竎h", "дn Th竔 H� C� Th� c馻 th� l鵦 tr錸g 1 h箃 gi鑞g, thu th藀 1 Ng鋍 Ph竎h"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 7, 8, 9}},
	[1104] = {0, "Tr閙 Ng鋍 Ph竎h", {"дn th� l鵦 kh竎 tr閙 1 Ng鋍 Ph竎h", "V祇 b秐  th� l鵦 kh竎  tr閙 1 Ng鋍 Ph竎h"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 10, 11, 12}},
	[1105] = {0, "T﹜ V鵦 Truy襫 Чo", {"Tham gia t輓h n╪g T﹜ V鵦 Truy襫 Чo, nh蕄 v祇 3 th竛h v藅  nh薾 thng", "V祇 b秐  th� l鵦 tham gia t輓h n╪g T﹜ V鵦 Truy襫 Чo, nh蕄 v祇 3 th竛h v藅  nh薾 thng"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 13, 14, 15}},
	[1106] = {0, "BOSS Th� L鵦", {"Nh薾 b秓 v� BOSS c馻 th� l鵦 v� ti猽 di謙 BOSS c馻 th� l鵦 phe ch  nh薾 頲 ph莕 thng", "Bu鎖 t鑙 s� xu蕋 hi謓 BOSS c馻 th� l鵦 phe ta ho芻 phe ch, b秓 v� BOSS c馻 phe ta v� ti猽 di謙 BOSS c馻 phe ch s� nh薾 頲 ph莕 thng"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 16, 17, 18}},
	[1107] = {0, "Th� S╪ Ti襫 Thng", {"Ho祅 th祅h 1 l莕 nhi謒 v� Th� S╪ Ti襫 Thng", "Ho祅 th祅h 1 l莕 nhi謒 v� Th� S╪ Ti襫 Thng"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 19, 20, 21}},
	[1108] = {0, "Nhi謒 v� Уo Kho B竨", {"Ho祅 th祅h 1 l莕 nhi謒 v� Уo Kho B竨", "V祇 th� l鵦 nh薾 1 T祅g B秓 у, ho祅 th祅h 1 l莕 nhi謒 v� Уo Kho B竨"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 22, 23, 24}},
	
	--百战不殆 副本任务
--	[1201] = {},
--	[1202] = {},
--	[1203] = {},
--	[1204] = {},
--	
--	--百战不殆 PvP任务
--	[1301] = {},
--	[1302] = {},
--	[1303] =  {0, "三方势力pk", {"打败其他势力的1位敌对玩家", "杀死敌对势力的1名玩家，证明你的能力！"}, {8000000, 24}, {8, 25, 26, 27}},
--	[1304] = {},
--	[1305] = {},
--	[1306] = {},
--	[1307] = {},
	
	--速战速决 帮会任务
	[2101] = {0, "Gia nh藀 bang h閕", {"Gia nh藀 m閠 bang h閕 b蕋 k�, tr� th祅h m閠 th祅h vi猲 trong bang", "Gia nh藀 bang h閕, c飊g v韎 th祅h vi猲 kh竎 c� g緉g  gi髉 bang h閕 ng祔 c祅g l韓 m筺h"}, {3000000, 100}, {9, 0, _ck_check_tong, 1}},
	[2102] = {0, "T竔 chi課 Th莕 Th�", {"N閜 300 甶觤 t輈h l騳 t� quang (Sau khi giao nhi謒 v� th� hai b猲 s� b� tr� 300 甶觤 t輈h l騳 t� quang)", "Ch� c� ngi m韎 c� th� thu莕 ph鬰 T� Quang Th莕 Th�!"}, {5000000, 100, _ck_del_300_ziguangjifen}, {9, 0, _ck_check_300_ziguangjifen, 2}},
	[2103] = {0, "N閜 甶觤 c鑞g hi課 bang h閕", {"Tham gia t輓h n╪g Bang H閕 Vinh Danh, giao n閜 10 甶觤 c鑞g hi課 bang h閕", "Tham gia t輓h n╪g Bang H閕 Vinh Danh, giao n閜 10 甶觤 c鑞g hi課 bang h閕"}, {8000000, 100}, {9, 0, 3, 4}},
	[2104] = {0, "Nh薾 ph莕 thng Bang H閕 Vinh Danh", {"Nh薾 ph莕 thng Bang H閕 Vinh Danh", "Tham gia t輓h n╪g Bang H閕 Vinh Danh v� nh薾 ph莕 thng"}, {10000000, 300}, {9, 0, 5, 6}},
	
	[2201] = {0, "Th� Th竛g", {"K輈h ho箃 1 th� th竛g", "K輈h ho箃 th� th竛g, ch琲 tr� ch琲 nh� nh祅g h琻"}, {5000000, 1200}, {10, 0, _ck_check_yueka, 1}},
	[2202] = {0, "Gia nh藀 th� l鵦", {"Gia nh藀 1 th� l鵦 trong ba phe", "Gia nh藀 1 th� l鵦 trong ba phe"}, {5000000, 300}, {10, 0, _ck_check_shili, 2}},
	[2203] = {0, "V薾 ti猽", {"Ho祅 th祅h 1 l莕 v薾 ti猽", "V祇 th� l鵦 nh薾 nhi謒 v� v薾 ti猽, ho祅 th祅h 1 l莕 v薾 ti猽"}, {5000000, 600}, {10, 0, 3, 4}},
	[2204] = {0, "Cp ti猽", {"Ho祅 th祅h 1 l莕 cp ti猽", "V祇 th� l鵦 nh薾 nhi謒 v� cp ti猽, ho祅 th祅h 1 l莕 cp ti猽"}, {5000000, 600}, {10, 0, 5, 6}},
	[2205] = {0, "Tr錸g c﹜", {"Ho祅 th祅h 1 l莕 nhi謒 v� tr錸g c﹜", "V祇 th� l鵦 ch� C﹜ Th竔 H� ho祅 th祅h 1 l莕 nhi謒 v� tr錸g c﹜"}, {5000000, 600}, {10, 0, 7, 8}},
	[2206] = {0, "Уo rng", {"Ho祅 th祅h 1 l莕 nhi謒 v� o rng", "Ho祅 th祅h 1 l莕 nhi謒 v� o rng"}, {5000000, 600}, {10, 0, 9, 10}},
	[2207] = {0, "Th� S╪ Ti襫 Thng", {"Ho祅 th祅h 1 l莕 nhi謒 v� Th� S╪ Ti襫 Thng", "Ho祅 th祅h 1 l莕 nhi謒 v� Th� S╪ Ti襫 Thng"}, {5000000, 600}, {10, 0, 11, 12}},
	[2208] = {0, "T﹜ V鵦 Truy襫 Чo", {"D飊g 1 o c� b蕋 k� sau y: Kim L╪g T鰑, T祅g Ki誱 B� Truy襫 T﹎ Kinh, B竎h Hi觰 Sinh B� Ph竝", "Tham gia t輓h n╪g T﹜ V鵦 Truy襫 Чo, s� d鬾g 1 o c� b蕋 k� sau y: Kim L╪g T鰑, T祅g Ki誱 B� Truy襫 T﹎ Kinh, B竎h Hi觰 Sinh B� Ph竝"}, {5000000, 600}, {10, 0, 13, 14}},
},
T_CK_TASK_GROUP_LIST = {
	--name, {type,desc}, {sub_list_group}
	[1] = {
		"Tr╩ Tr薾 Tr╩ Th緉g", {1, "H籲g ng祔 nh薾 ng蓇 nhi猲, nh薾 頲 nhi襲 EXP v�  n╪g ng!"},
		{
			--name, random_count, {task_index_list}
			[1] = {"Nhi謒 v� Th� L鵦 Ba Phe", 4, {1101,1102,1103,1104,1105,1106,1107,1108}}, --百战不殆-三方势力任务
		},
	},
	[2] = {
		"T鑓 Chi課 T鑓 Th緉g", {2, "Trong th阨 gian ho箃 ng ch� ho祅 th祅h 1 l莕, nh薾 頲 nhi襲 EXP v�  n╪g ng!"},
		{
			[1] = {"Nhi謒 v� bang h閕", 0, {2101,2102,2103,2104}}, --速战速决-帮会任务
			[2] = {"Nhi謒 v� hng d蒼", 0, {2201,2202,2203,2204,2205,2206,2207,2208}}, --速战速决-指引任务
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

function t_Fix_201701:ck_task_daily_clear()--每日清理
	--百战不殆任务变量清理
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
    		--clear_item(2,1,270)--白驹丸
    		--clear_item(2,1,1064)--六神丸
    		--clear_item(2,1,1097)--三清丸
    		--SetTask(2501, 0)--白驹丸时间
    		--for i=1,2 do
    		--	local n = EatLiushen(1, -2000000000)--六神丸时间
    		---	if 0==n then break end
    		--end
    		--for i=1,2 do
    		--	local n = EatSanqin(1, -2000000000)--三清丸时间
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
			--删除百战不殆的任务
			for i = 234, 238 do
				DirectDeleteTask(i)
			end
			self:ck_task_daily_clear()
			RemoveTitle(68, 3);
    		local szMsg = format("Hi謓 t筰 ch鴆 n╪g Minh Gi竜 l謓h  t筸 ng! T蕋 c� nhi謒 v� v� danh hi謚 s� b� x鉧 b�!B鎛 trang s� ti課 h祅h s鯽 l鏸 n祔!")
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
    		--clear_item(2,1,270)--白驹丸
    		--clear_item(2,1,1064)--六神丸
    		--clear_item(2,1,1097)--三清丸
    		--SetTask(2501, 0)--白驹丸时间
    		--for i=1,2 do
    		--	local n = EatLiushen(1, -2000000000)--六神丸时间
    		---	if 0==n then break end
    		--end
    		--for i=1,2 do
    		--	local n = EatSanqin(1, -2000000000)--三清丸时间
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
			--删除百战不殆的任务
			for i = 234, 238 do
				DirectDeleteTask(i)
			end
			self:ck_task_daily_clear()
			RemoveTitle(68, 3);
    		local szMsg = format("Hi謓 t筰 ch鴆 n╪g Minh Gi竜 l謓h  t筸 ng! T蕋 c� nhi謒 v� v� danh hi謚 s� b� x鉧 b�!B鎛 trang s� ti課 h祅h s鯽 l鏸 n祔!")
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
