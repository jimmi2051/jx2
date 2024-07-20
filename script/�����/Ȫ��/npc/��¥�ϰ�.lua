
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 酒楼老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

--越南副活动
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\大理\\lv58\\task_main.lua");
Include("\\script\\online\\dragon_boat_07\\dragon_boat_08_head.lua")

--201207海边宴席活动
Include("\\script\\online_activites\\201206\\haibianyanxi.lua")
--201208孟兰节日
Include("\\script\\online_activites\\201207\\sushipan.lua")
--201209妇女节活动
Include("\\script\\online_activites\\201209\\send_gif.lua")

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if CanAcceptTask(TASK_LOVESTORY2,3) == 1 then
		Talk(1,"selbuy","Xin h醝 n琲 y c� b竛 H飊g Ho祅g T鰑 kh玭g?")
		return 
	end
	if (nState==12) then
		task_012_00();
		return
	end;
	
	if GetTask(TASK_DL_LV55_ID) == 7 and GetItemCount(2,0,376) < 1 then
		--跟泉州酒楼老板买鹅黄豆生
		buy_gift_talk(3);
		return
	end;
	local sal_num = 97
	if dragon_boat_08_time_chk() ~= 1 then
		sal_num = 98
	end
	
	local tSel = {};
	
	--201207海边宴席活动
	if gf_CheckEventDateEx(VET_201206_ACITIVITY_ID) ~= 0 then
		for i=1,getn(VET_201206_Say_Tb) do
			tinsert(tSel,VET_201206_Say_Tb[i]);
		end
	end
	
	--201208孟兰节日
	if gf_CheckEventDateEx(VET_201207_ACITIVITY_ID) ~= 0 then
		for i=1,getn(VET_201207_Say_Tb) do
			tinsert(tSel,VET_201207_Say_Tb[i]);
		end
	end
	
	--201209妇女节活动
	if gf_CheckEventDateEx(VET_201209_ACITIVITY_ID) ~= 0 then
		for i=1,getn(VET_201209_Say_Tb) do
			tinsert(tSel,VET_201209_Say_Tb[i]);
		end
	end
	
	--副活动
	if gf_CheckEventDateEx(75) ~= 0 then
		local tSayDialog = aah_GetSayDialog();
		if tSayDialog then
			for i=1, getn(tSayDialog) do
				tinsert(tSel, tSayDialog[i]);
			end
		end
	end
	-- Event nh� th竛g 3
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20130326 and nDate <= 20130331 then
		tinsert(tSel,"Quy猲 g鉷 1 Long Huy誸 Ho祅/#vng_quyengop(1)");
		tinsert(tSel,"Quy猲 g鉷 1 K� L﹏ Ho祅/#vng_quyengop(2)");
		tinsert(tSel,"Quy猲 g鉷 1 Ph鬾g Huy誸 Ho祅/#vng_quyengop(3)");
		tinsert(tSel,"Quy猲 g鉷 1 Chi課 Th莕 Ho祅/#vng_quyengop(4)");
	end
	--tinsert(tSel, "我买些粽子材料/#Sale("..sal_num..")")
	tinsert(tSel,	"Ta ch� 甶 ngang th玦/end_dialog");
	Say("<color=green>Ch� T鰑 l莡<color>: Ru v� th鴆 ╪ � ch� ta r蕋 ngon, c遪 c� nguy猲 li謚 l祄 b竛h 輙 n鱝, kh竎h quan c� mu鑞 gh� qua kh玭g?",
		getn(tSel), tSel)
end
function selbuy()
	local selTab = {
		"Mua 1 b譶h/buy",
		"K誸 th骳 i tho筰./nothing"
		}
	Say("Ch� t鰑 l莡: N琲 n祔 ru g� c騨g c�! H飊g Ho祅g m� t鰑 20 lng m閠 b譶h!",2,selTab)
end

function buy()
	if CanAcceptTask(TASK_LOVESTORY2,3) == 1 then
		if Pay(2000) == 1 then
			if AddItem(2,0,359,1) == 1 then
				Say("Ch� t鰑 l莡:  t� kh竎h quan chi誹 c�! R秐h r鏸 h穣 quay l筰 nh�!",0)
				local OldPlayerIndex = PlayerIndex
				for i=1,2 do
					PlayerIndex = GetTeamMember(i)
					SetTask(TASK_LOVESTORY2,4)
					TaskTip("Mang H飊g Ho祅g T鰑 v� g苝 H鴄 Ti猲!")
				end
				PlayerIndex = OldPlayerIndex
			end
		else
			Say("Ch� t鰑 l莡: Ai da! Ti襫 kh玭g c� m� i u鑞g ru ngon �!",0)
		end
	else
		Say("Ngi kh玭g gi髉 n鎖 ta u! C莕 ph秈 c� s鴆 m筺h c馻 t譶h y猽 m韎 c� th� gi髉 頲 ta!",0)
	end
end

function vng_quyengop(nType)
	local tHorse = {
				[1] = {"Long Huy誸 ho祅", 1002},
				[2] = {"K� L﹏ ho祅", 1003},
				[3] = {"Ph鬾g Huy誸 ho祅", 1004},
				[4] = {"Chi課 Th莕 ho祅", 1005},
			}
	local tNhonNhip_Award = {
					{1, 888, "Thi猲 Th筩h Tinh Th筩h", {2,1,1009,2}},
					{1, 10, "Chuy觧 Sinh Кn", {2,1,30345,1}, 30 * 24 * 3600},
					{1, 50, "Чi мnh H錸", {2,1,1113,1}, 30 * 24 * 3600},
					{1, 1212, "Ma o Th筩h 1", {2,1,30428,3}, 15 * 24 * 3600},
					{1, 1212, "Ma o Th筩h 2", {2,1,30429,3}, 15 * 24 * 3600},					
					{1, 1500, "Ma o Th筩h 3", {2,1,30430,3}, 15 * 24 * 3600},
					{1, 1000, "Cng h鉧 quy觧 12", {2,1,30424,1}, 15 * 24 * 3600},
					{1, 1000, "Cng h鉧 quy觧 13", {2,1,30425,1}, 15 * 24 * 3600},
					{1, 1515, "Cng h鉧 quy觧 14", {2,1,30426,1}, 15 * 24 * 3600},
					{1, 1613, "Cng h鉧 quy觧 15", {2,1,30427,1}, 15 * 24 * 3600},
			}	
	if gf_GetTaskByte(TSK_LUCKY_DAOHUU,nType) >= 1 then
		Talk(1,"","Чi hi謕  i thng lo筰 n祔 r錳. H穣 ch鋘 i thng lo筰 kh竎 ho芻 quay l筰 v祇 ng祔 mai !!!");
		return 0;
	end	
	if GetItemCount(2,1,tHorse[nType][2]) < 1 then
		Talk(1,"","Чi hi謕 kh玭g mang theo "..tHorse[nType][1].."  i thng");
		return 0;
	end
	if gf_Judge_Room_Weight(14,600," ") ~= 1 then
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , vui l遪g s緋 x誴 l筰.")
		return 0;
	end
	if DelItem(2,1,tHorse[nType][2],1) == 1 then
		gf_SetTaskByte(TSK_LUCKY_DAOHUU,nType,gf_GetTaskByte(TSK_LUCKY_DAOHUU,nType) + 1)
		gf_AddItemEx2({2,1,30230,500},"фi thng lo筰 "..tHorse[nType][1],"THANG 3 NHON NHIP BK","Nh薾 th祅h c玭g xu v藅 ph萴")
		ModifyExp(200000000)
		if GetTask(701) >= 0 then
			SetTask(701,GetTask(701) + 1000)
		else
			SetTask(701,GetTask(701) - 1000)
		end		
		gf_AddItemEx2({2,1,30390,30},"фi thng lo筰 "..tHorse[nType][1],"THANG 3 NHON NHIP BK","Nh薾 th祅h c玭g m秐h thi猲 cang")
		for i = 1, 3 do
			gf_EventGiveRandAward(tNhonNhip_Award,10000,1, "THANG 3 NHON NHIP BK", "nh薾 3 ph莕 thng ng蓇 nhi猲")
		end
		gf_WriteLogEx("THANG 3 NHON NHIP", "nh薾 thng th祅h c玭gi", 1, "Nh薾 thng lo筰 "..tHorse[nType][1])		
	end
end

function nothing()

end

