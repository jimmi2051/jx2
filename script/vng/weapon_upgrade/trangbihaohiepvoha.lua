Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\weapon_upgrade\\chiencuong_head.lua");




LIB_Award.szLogTitle = "TRANG BI HAO HIEP VO HA"
LIB_Award.szLogAction = "nh�n"

tbRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [25] = 1, [26] = 1, [27] = 1, [29] = 1, [30] = 1,}

tbHaoHiepVoHaNguyenLieu = {
	[1] = {item={{gdp={2,95,204,20}, name="Thi�n Cang L�nh"}, {gdp={2,1,30370,20}, name="Thi�n M�n Kim L�nh"}, {gdp={2,1,31122,10}, name="Linh Kh� R�c R�"}, {gdp={2,1,1006,4}, name="C�u Thi�n V� C�c ��n"}, {gdp={0,102,31126,1}, name="H�o Hi�p Gi�i"}}},
	[2] = {item={{gdp={2,95,204,20}, name="Thi�n Cang L�nh"}, {gdp={2,1,30370,20}, name="Thi�n M�n Kim L�nh"}, {gdp={2,1,31122,10}, name="Linh Kh� R�c R�"}, {gdp={2,1,1006,4}, name="C�u Thi�n V� C�c ��n"}, {gdp={0,102,31127,1}, name="H�o Hi�p B�i"}}},
	[3] = {item={{gdp={2,95,204,20}, name="Thi�n Cang L�nh"}, {gdp={2,1,30370,20}, name="Thi�n M�n Kim L�nh"}, {gdp={2,1,31122,20}, name="Linh Kh� R�c R�"}, {gdp={2,1,1006,4}, name="C�u Thi�n V� C�c ��n"}, {gdp={0,102,30037,1}, name="Thi�n ��a Gi�i"}}},
	[4] = {item={{gdp={2,95,204,20}, name="Thi�n Cang L�nh"}, {gdp={2,1,30370,20}, name="Thi�n M�n Kim L�nh"}, {gdp={2,1,31122,20}, name="Linh Kh� R�c R�"}, {gdp={2,1,1006,4}, name="C�u Thi�n V� C�c ��n"}, {gdp={0,102,30038,1}, name="Nh�t Nguy�t Gi�i"}}},
}

function TrangBiHaoHiepVoHa_Form()
	local nDate = tonumber(date("%Y%m%d"))
	local szTitle = "C�c h� mu�n ��i Trang b� n�o ? :\n"
	local tbSay = {}
	tinsert(tbSay, "��i H�o Hi�p V� H� L�nh (trang s�c)/LenhbaiHaoHiepVoHa")
	tinsert(tbSay, "��i trang b� V� C�c - Minh Tinh/TrangBiVoCucMinhTinh")

	tinsert(tbSay, "Ta ch�a mu�n n�ng c�p/gf_DoNothing")
	Say(szTitle, getn(tbSay), tbSay)
end

function TrangBiVoCucMinhTinh()
	local szTitle = "��i Nh�n V� ho�c C�c Minh Tinh c�n:\n- : 20 Thi�n Cang L�nh + 20 Thi�n M�n Kim L�nh + 20 Linh Kh� R�c R� + 4 C�u Thi�n V� C�c ��n  + 1 Thi�n ��a Gi�i ho�c 1 Nh�t Nguy�t Gi�i\n"
	local tbSay = {
		"X�c nh�n ��i V� C�c/#XacNhanDoiHHVH(3)",
		"X�c nh�n ��i Minh Tinh/#XacNhanDoiHHVH(4)",
		"Ta ��n xem th�i/gf_DoNothing",
	}
	Say(szTitle, getn(tbSay), tbSay)
end

function LenhbaiHaoHiepVoHa()
	local szTitle = "��i H�o Hi�p V� h� l�nh b�i (Trang s�c) c�n:\n- : 20 Thi�n Cang L�nh + 20 Thi�n M�n Kim L�nh + 10 Linh Kh� R�c R�  + 4 C�u Thi�n V� C�c ��n + 1 H�o Hi�p gi�i ho�c 1 H�o Hi�p B�i\n"
	local tbSay = {
		"S� d�ng H�o Hi�p Gi�i/#XacNhanDoiHHVH(1)",
		"S� d�ng H�o Hi�p B�i/#XacNhanDoiHHVH(2)",
		"Ta ��n xem th�i/gf_DoNothing",
	}
	Say(szTitle, getn(tbSay), tbSay)
end

function XacNhanDoiHHVH(nOption)
	local nRoute = GetPlayerRoute()
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C�c h� ch�a gia nh�p h� ph�i, kh�ng th� ��i H�o Hi�p V� H� L�nh B�i.")
		return 0
	end
	if tbHaoHiepVoHaNguyenLieu[nOption] == nil then
		print("NGUYEN LIEU KHONG DUNG")
		return 0
	end
	if gf_Judge_Room_Weight(1, 100) == 0 then
		Talk(1,"", "S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 0
	end
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbHaoHiepVoHaNguyenLieu[nOption])
	if nCheck ~= 1 then
		--Talk(1,"", "C�c h� �� �em �� v�t ph�m y�u c�u ch�a ?")
		return 0
	end
	LIB_Award:PayMaterial(tbHaoHiepVoHaNguyenLieu[nOption])
	if nOption == 1 then
		gf_AddItemEx2({2,1,30974, 1}, "H�o Hi�p V� H� L�nh B�i(trang s�c) ", EVENT_LOG_TITLE , "nh�n")
	elseif nOption == 2 then
		gf_AddItemEx2({2,1,30974, 1}, "H�o Hi�p V� H� L�nh B�i(trang s�c) ", EVENT_LOG_TITLE , "nh�n")
	elseif nOption == 3 then
		gf_AddItemEx2({0,102,31130, 1, 4, -1, -1, -1, -1, -1, -1}, "Nh�n V� C�c ", EVENT_LOG_TITLE , "nh�n")
	elseif nOption == 4 then
		gf_AddItemEx2({0,102,31131, 1, 4, -1, -1, -1, -1, -1, -1}, "Minh Tinh Chi Gi�i ", EVENT_LOG_TITLE , "nh�n")
	end
end
