Include("\\script\\equip_shop\\equip_shop_head.lua")

function main()
	local tShop = {
		[1] = {
			"Ti�m V� Kh� H�a Ph�ng-S� C�p/#show_equip_shop(3055)",
			"Ti�m Trang B� T��ng Qu�n H�a Ph�ng /#show_equip_shop(3056)",
			"Ti�m H�a Ph�ng Nguy�n So�i/#show_equip_shop(3058)",
			"Ti�m Trang S�c T��ng Qu�n H�a Ph�ng/#show_equip_shop(3060)",
			"Ti�m Trang S�c H�a Ph�ng Nguy�n So�i/#show_equip_shop(3062)",
			"Ta ch� gh� ch�i/nothing",
		},
		[2] = {
			"Ti�m V� Kh� H�a Ph�ng-S� C�p/#show_equip_shop(3055)",
			"Ti�m Trang B� T��ng Qu�n H�a Ph�ng /#show_equip_shop(3057)",
			"Ti�m H�a Ph�ng Nguy�n So�i/#show_equip_shop(3059)",
			"Ti�m Trang S�c T��ng Qu�n H�a Ph�ng/#show_equip_shop(3061)",
			"Ti�m Trang S�c H�a Ph�ng Nguy�n So�i/#show_equip_shop(3063)",
			"Ta ch� gh� ch�i/nothing",
		},
	}
	local nSex = GetSex();
	Say("<color=green>H�a Ph�ng T�: <color> Ta c� th� gi�p ���c g� cho ng��i kh�ng?",getn(tShop[nSex]),tShop[nSex])
end