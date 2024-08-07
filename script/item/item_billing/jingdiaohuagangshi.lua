Include("\\script\\lib\\writelog.lua")
--***********************************变量定义区*****************************
--------------------------------------------帮会任务随机BOSS使用定义
Zgc_conf_task_boss = {			--第一等级BOSS
	"C玭 L玭 N�",
	"B飅 H祅g",
	"Li評 Ngh�",
	"H錸g Tuy課",
	"H� C秐h Th緉g",
	"Nhi誴 Чi Ch飝",
	"B� Phi Y猲",
}
Zgc_conf_task_box = {
	"Rng c馻 C玭 L玭 N�  l筰",
	"Rng c馻 B飅 H祅g  l筰",
	"Rng c馻 Li評 Ngh�  l筰",
	"Rng c馻 H錸g Tuy課  l筰",
	"Rng s総 c馻 H� C秐h Th緉g",
	"Rng s総 c馻 Nhi誴 Чi Ch飝",
	"B秓 rng c馻 B� Phi Y猲",
}
Zgc_cong_task_usemapid = {
	{302,"Thanh Th祅h s琻"},		
	{327,"� M玭g B�"},
	{401,"觤 Thng s琻"},
	{306,"Giang T﹏ Th玭"},
	{307,"Phong Й"},
	{405,"Ch﹏ n骾 V� L╪g"},
	{406,"V� L╪g s琻"},
	{326,"M� Tuy誸 s琻 trang"},
	{310,"Ki誱 M玭 quan"},
	{311,"Ph鬰 Ng璾 s琻"},
	{218,"Linh B秓 s琻"},
	{202,"H筺h Hoa th玭"},
	{151,"V﹏ M閚g Tr筩h"},			
	{106,"Long Tuy襫 Th玭"},
	{107,"V� Di s琻"},
	{103,"Йng H秈 H秈 T﹏ 1"},
	{104,"Йng H秈 H秈 T﹏ 2"},
	{102,"Уo Hoa o"},
	{207,"Nh� Long s琻"},
	{217,"D� Tr� l﹎"},
	{208,"Lng S琻 B筩"},
	{604,"Nh筺 M玭 quan"},
	{601,"Чi Th秓 Nguy猲 1"},
	{602,"Чi Th秓 Nguy猲 2"},
	{600,"B� l筩 Vng K�"},
}
TaskID_bfy_crt = 958
function OnUse(goods_index)
	SetItemUseLapse(goods_index,90)
	local mapID,X,Y = GetWorldPos()
	local chk_flag = 0
	for i = 1, getn(Zgc_cong_task_usemapid) do				--使用地图判断
		if Zgc_cong_task_usemapid[i][1] == mapID then
			chk_flag = 1
			break
		end
	end
	if chk_flag == 0 then
		Say("N琲 y quan binh canh gi� nghi猰 ng苩, m ngi B� Phi Y猲 to gan c竎h m蕐 c騨g kh玭g d竚 b衝 m穘g t韎, ngi th� n ch� kh竎 xem!",
			2,
			"Ta mu鑞 bi誸 h祅h tung c馻 B� Phi Y猲/Zgc_bfy_actmap_inq",
			"Ta bi誸 r錳/Zgc_end_dialog"
		)		
	else
		Say("B筺 mu鑞 d飊g hoa cng th筩h? N� c� th� gi髉 b筺 tri謚 g鋓 B� Phi Y猲 nhanh h琻",
		2,
		"S� d鬾g/#jdhgs_use()",
		"в ta suy ngh� l筰/end_dialog")
	end
end
function jdhgs_use()
	if GetItemCount(2,1,1023) < 1 then
		Talk(1,"end_dialog","Xin x竎 nh薾 tr猲 ngi c� Hoa cng th筩h v� Sinh Th莕 Cng!")
		return
	elseif GetItemCount(2,0,545) < 1 then
		Talk(1,"end_dialog","Mu鑞 g箃 ta �?")
		return
	end
	if DelItem(2,1,1023,1) ~= 1 or DelItem(2,0,545,1) ~=1 then
		Talk(1,"end_dialog","Xin x竎 nh薾 tr猲 ngi c� Hoa cng th筩h v� Sinh Th莕 Cng!")
		return
	else
			local strLogCaption = "Nhiem vu Bang hoi"
			local boss_step = random(1,100)
			local npc_index = 0
			local boss_seq = 0
			local mapID,X,Y = GetWorldPos()
			if boss_step == 37 or boss_step == 73 then
				boss_seq	= 7
				npc_index = CreateNpc(Zgc_conf_task_boss[7],Zgc_conf_task_boss[7],mapID,X,Y,-1,1,0,0)
				SendTongMessage(GetName().."S� d鬾g Sinh Th莕 Cang g鋓 ra B� Phi Y猲!")
				if IsTongMember() ~= 0 then
					AddGlobalNews(GetTongName().."C� tin b鋘 h� 產ng giao u v韎 B� Phi Y猲!")
				end
				WriteLogEx(strLogCaption, "g鋓 ra", "1", Zgc_conf_task_boss[boss_seq], "", GetTongName())
			elseif boss_step <= 85 then
				boss_seq = random(5,6)
				npc_index = CreateNpc(Zgc_conf_task_boss[boss_seq],Zgc_conf_task_boss[boss_seq],mapID,X,Y,-1,1,0,0)
				if IsTongMember() ~= 0 then
					SendTongMessage(GetName().."S� d鬾g Sinh Th莕 Cang g鋓 ra:"..Zgc_conf_task_boss[boss_seq].."!")
				end
			else
				boss_seq = random(1,4)
				npc_index = CreateNpc(Zgc_conf_task_boss[boss_seq],Zgc_conf_task_boss[boss_seq],mapID,X,Y,-1,1,0,0)
				if IsTongMember() ~= 0 then
					SendTongMessage(GetName().."S� d鬾g Sinh Th莕 Cang g鋓 ra:"..Zgc_conf_task_boss[boss_seq].."!")
				end
			end
			WriteLogEx(strLogCaption, "Tinh 猽 Hoa Cng", "1", Zgc_conf_task_boss[boss_seq], "", GetTongName())			
			SetNpcScript(npc_index,"\\script\\item\\conftaskbosscreate.lua")
	end

end
--********************************生辰纲可使用地图查询*****************************
function Zgc_bfy_actmap_inq()
	local dialog_string = "  "
	for i = 1, getn(Zgc_cong_task_usemapid)do
		dialog_string = dialog_string .. Zgc_cong_task_usemapid[i][2]
		if floor(i/5)-(i/5) == 0 then
			dialog_string = dialog_string .."\n  "
		else
			for j = 1,(16-strlen(Zgc_cong_task_usemapid[i][2])) do
				dialog_string = dialog_string .." "
			end
		end
	end
	Say("B� Phi Y猲 h祅h tung b蕋 nh, ngi bi誸 tung t輈h h緉 ta ch� c�: \n"..dialog_string,
		1,
		"Ta bi誸 r錳/Zgc_end_dialog"
	)
end
function end_dialog()
end
