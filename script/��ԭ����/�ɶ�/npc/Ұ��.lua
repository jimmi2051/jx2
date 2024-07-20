
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 野叟脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\gmscript.lua")
--Include("\\script\\global\\skills_table.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--召回老玩家活动

TASK_JUE_NUM = 540   --08年盛世江山版本洗诀要次数 限制为五次

function main()
 --  if random(1,15) == 1 then
	-- 	NpcChat(GetTargetNpc(),"剑侠情缘网络版2新开放资料片－灵动山河，灵石镶嵌，八卦套装等你体验！");
	-- end;

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()

	if (nState==100) then
		
		task_000_00();
		return
		
	elseif (nState==6) then
	
		task_006_00();
		return
		
	elseif (nState==7) then
	
		if nLevel>=4 then
			task_007_00();
			return
		end;
		
	elseif (nState==10) then
	
		task_010_00();
		return

	elseif (nState==11) then
	
		if nLevel>=6 then
			task_011_00();
			return
		end;

	elseif (nState==14) then
	
		task_014_00();
		return

	elseif (nState==15) then
	
		Say("Х t譵 頲 b筺 h鱱 r錳 �?",
			4,
			"ng r錳/teach_team_001",
			"Ch璦 t譵 頲 ai th輈h h頿!/teach_team_004",
			"L祄 sao mang t韎 y/teach_team_002",
			"Ch璦 c�!/teach_team_003");
		return
		
	elseif (nState==16) then
		
		if nLevel>=8 then
			task_016_00();
			return
		end;
		
	elseif (nState==17) then
	
		task_017_00();
		return

	elseif (nState==19) then
	
		task_019_00();
		return
		
	elseif (nState==20) then
		
		if nLevel>=9 then
			task_020_00();
			return
		end;

	elseif (nState==24) then
		
		if nLevel>=10 then
			task_024_00();
			return
		end;
		
	elseif (nState>=1) and (nState<24) then -- 中间状态
		
		local i,j;
		local strMain = {
			[1] = "Sao ngi ch璦 甶 g苝 Ch� ti謒 v� kh�? Tr� l筰 y l祄 g�?",
			[2] = "Sao ngi ch璦 甶 g苝 Ch� ti謒 ph鬰 trang? Tr� l筰 y l祄 g�?",
			[3] = "Sao ngi ch璦 甶 g苝 Ch� Kim ho祅? Tr� l筰 y l祄 g�?",
			[4] = "Sao ngi ch璦 甶 g苝 Ch� dc 甶誱? Tr� l筰 y l祄 g�?",
			[5] = "Sao ngi ch璦 甶 g苝 Ch� T筽 h鉧? Tr� l筰 y l祄 g�?"
		}
		
		for i,j in strMain do
			if TE_GetTeachState()==i then
				Say(strMain[i],0);
				return
			end;
		end;
		
	elseif (nState>=1) then
		if (GetPlayerFaction() > 0) then
			if attr_point_readd_date_chk() ~= 1 then
				local strtab = {
					"Nh薾 ph莕 thng/callback_talk",
					"дn th╩ D� T萿/main_exit"
				};
				if callback_date_check() == 1 then
					tinsert(strtab,2,"Ta mu鑞 tr� thng/restore_all");
				end
				Say("<color=green>D� T萿<color>: Ta  d箉 cho ngi t蕋 c� nh鱪g g� ta bi誸 r錳, ngi c遪 n y l祄 g� v藋?",
					getn(strtab),
					strtab);
			else
				attr_point_readd_dia()
			end
			return
		else
			local strtab = {
				"T葃 甶觤 ti襪 n╪g./main_point",
--				"Tr� thng./main_restore",
				"Nh薾 ph莕 thng/callback_talk",
				--"我要将身上装备的秘笈所插入的诀要取出/remove_addendar",
				"дn th╩ D� T萿/main_exit"			
				};
			if callback_date_check() == 1 then
				tinsert(strtab,4,"Ta mu鑞 tr� thng/restore_all");
			end				
			Say("Ta c� th� gi髉 g� cho b籲g h鱱?",
				getn(strtab),
				strtab);
			return
		end;
	end;
	
	if (GetPlayerFaction() > 0) then
		if attr_point_readd_date_chk() ~= 1 then
			local strtab = {
				"Nh薾 ph莕 thng/callback_talk",
				"дn th╩ D� T萿/main_exit"
			};
			if callback_date_check() == 1 then
				tinsert(strtab,2,"Ta mu鑞 tr� thng/restore_all");
			end			
			Say("<color=green>D� T萿<color>: Ta  d箉 cho ngi t蕋 c� nh鱪g g� ta bi誸 r錳, ngi c遪 n y l祄 g� v藋?",
				getn(strtab),
				strtab);
		else
			attr_point_readd_dia()
		end
		return
	else
		local strtab = {
			"T葃 甶觤 ti襪 n╪g./main_point",
--			"Tr� thng./main_restore",
			"Nh薾 ph莕 thng/callback_talk",
			--"我要将身上装备的秘笈所插入的诀要取出/remove_addendar",
			"дn th╩ D� T萿/main_exit"			
			};
		if callback_date_check() == 1 then
			tinsert(strtab,4,"Ta mu鑞 tr� thng/restore_all");
		end				
		Say("Ta c� th� gi髉 g� cho b籲g h鱱?",
			getn(strtab),
			strtab);
	end;
end

--=========================================
--村长207-06-29增加免费洗点功能
--对话
function attr_point_readd_dia()
	Say("<color=green>D� T萿<color>: Ta  d箉 cho ngi t蕋 c� nh鱪g g� ta bi誸 r錳, ngi c遪 n y l祄 g� v藋?",
		2,
--		"我要将身上装备的秘笈所插入的诀要取出/remove_addendar",
		"Х m� k� n╪g m韎 r錳, ta mu鑞 t葃 甶觤 /attr_point_readd",
		"дn th╩ D� T萿/nothing"
		)

end
--洗点
function attr_point_readd()
	Say("<color=green>D� T萿<color>: Trc <color=yellow>23h ng祔 4/5/2008<color>, c� th� <color=yellow>n y<color>  <color=yellow>t葃 甶觤<color>, b筺 x竎 nh薾 mu鑞 <color=yellow>t葃 甶觤<color>?",
	2,
	"Ta mu鑞 t葃 甶觤/confirm_xidian",
	"Ta v蒼 ch璦 quy誸 nh/nothing"
	)
end
--时间检测
function attr_point_readd_date_chk()
	local date_now = tonumber(date("%Y%m%d%H"))
	if date_now >= 2008032710 and date_now <= 2008050423 then
		return 1
	else
		return 0
	end
end
--=========================================
function nothing()

end;

function remove_addendar()
	local nCount = GetTask(TASK_JUE_NUM);
	local selTab = {
			"Ta mu鑞 th竜 y誹 quy誸 g緉 tr猲 b� k輕/remove_addendar_confirm",
			"в ta ngh� l筰 /nothing",
			}
	Say("<color=green>D� T萿<color>: Trc <color=yellow>23h ng祔 10/4/2008, ngi c� th� n t譵 l穙 phu th竜 y誹 quy誸 g緉 tr猲 b� k輕, <color=yellow>l璾 �, m鏸 ngi ch� 頲 mi詎 ph� 5 l莕, ngi c遪 c� th� th竜 "..(5-nCount).." l莕. <color>Ngi c� mu鑞 <color=yellow>th竜 y誹 quy誸<color> kh玭g?",
	getn(selTab),
	selTab
	)
end;
--返回诀要数量、诀要字符串、诀要名字table、诀要IDtable
function get_addendar_info()
	local tbAddendarName = {"", "", "", ""}
	local tbAddendarID = {-1, -1, -1, -1}
	local nAddendarCount = 0
	for i = 0, 3 do
		tbAddendarName[i + 1], tbAddendarID[i + 1] = GetBookAddendarName(i)
		if (tbAddendarID[i + 1] ~= -1) then
			nAddendarCount = nAddendarCount + 1
		end
	end
	if nAddendarCount == 0 then
		return 0,"",tbAddendarName,tbAddendarID;
	end;
	local strPages = "";
	for i=1,4 do	--最多只有四张诀要
		if tbAddendarName[i] ~= "" then
			strPages = strPages..tbAddendarName[i]..", ";
		end;
	end;
	strPages = strsub(strPages,1,strlen(strPages)-2);
	return nAddendarCount,strPages,tbAddendarName,tbAddendarID;
end;

function remove_addendar_confirm()
	if GetTask(TASK_JUE_NUM) >= 5 then
		Talk(1,"","<color=green>D� T萿<color>: M鏸 ngi ch� 頲 mi詎 ph� 5 l莕, thi誹 hi謕  th竜 5 l莕 r錳.");
		return
	end
	if GetPlayerEquipIndex(11) == 0 then
		Talk(1,"","<color=green>D� T萿<color>: Thi誴 hi謕 h穣 trang b� b� k輕 trc , n誹 kh玭g l祄 sao l穙 phu bi誸  l� b� k輕 n祇 ch�.");
		return 0;
	end;
	local nAddendarCount,strPages = get_addendar_info();
	if nAddendarCount == 0 then
		Talk(1,"","<color=green>D� T萿<color>: L� n祇 thi誹 hi謕 產ng a v韎 l穙 phu sao, b� k輕 n祔 c� y誹 quy誸 g� ch�?");
		return 0;
	end;
	local selTab = {
				"Л頲/remove_addendar_confirm_final",
				"в ta suy ngh�/nothing",
				}
	Say("<color=green>D� T萿<color>: Л頲, thi誹 hi謕 nh譶 k� y, b� k輕 n祔 c� th� th竜 <color=yellow>"..strPages.."<color><color=yellow>"..nAddendarCount.."<color> y誹 quy誸, ngi mu鑞 nh薾 nh鱪g y誹 quy誸 n祔 ch�?",getn(selTab),selTab);
end;

function remove_addendar_confirm_final()
	if GetTask(TASK_JUE_NUM) >= 5 then
		Talk(1,"","<color=green>D� T萿<color>: M鏸 ngi ch� 頲 mi詎 ph� 5 l莕, thi誹 hi謕  th竜 5 l莕 r錳.");
		return
	end
	if gf_JudgeRoomWeight(4,10) == 0 then
		Talk(1,"","<color=green>D� T萿<color>: H穣 ki觤 tra l筰 xem, n誹 nh薾 y誹 quy誸 m� kh玭g d飊g 頲, h� ch糿g ph秈 l� tr� ci cho thi猲 h� sao?");
		return 0;
	end;
	if GetPlayerEquipIndex(11) == 0 then
		Talk(1,"","<color=green>D� T萿<color>: Thi誴 hi謕 h穣 trang b� b� k輕 trc , n誹 kh玭g l祄 sao l穙 phu bi誸  l� b� k輕 n祇 ch�.");
		return 0;
	end;
	if IsBookLocked() > 0 then
		Talk(1,"","<color=green>D� T萿<color>: B� k輕 c馻 ngi 產ng kho�, kh玭g th� th竜 y誹 quy誸!")
		return 0;
	end
	local nAddendarCount,strPages,tbAddendarName,tbAddendarID = get_addendar_info();
	if nAddendarCount == 0 then
		Talk(1,"","<color=green>D� T萿<color>: L� n祇 thi誹 hi謕 產ng a v韎 l穙 phu sao, b� k輕 n祔 c� y誹 quy誸 g� ch�?");
		return 0;
	end;
	local nCurCount = GetTask(TASK_JUE_NUM);
	SetTask(TASK_JUE_NUM,nCurCount+1);
	local strName,nID = "",0;
	local nRetCode = 0;
	for i=1,4 do
		strName,nID = GetBookAddendarName(0);
		if nID ~= -1 then
			RemoveAddendarFromBook(0);
			nRetCode = AddItem(2, 6, nID, 1);
			if nRetCode == 1 then
				Msg2Player("B筺  th竜 th祅h c玭g"..strName);
				WriteLog("[Nh薾 y誹 quy誸 D� T萿]"..GetName().."Х th竜"..strName);
			else
				WriteLog("[D� T萿 th竜 y誹 quy誸 b� l鏸]"..GetName().." th竜 "..strName.." b� l鏸, nRetCode:"..nRetCode);
			end;
		end;
	end;
	WriteLog("[Nh薾 y誹 quy誸 D� T萿]:"..GetName().."th�"..(nCurCount+1).." l莕 y誹 quy誸");
end;

-- 免费洗潜能点的函数
function test_free_clean_points()
	Say("Зy l� ti猲 n qu� hi誱, ta ch� c� th� cho ngi s� d鬾g 1 vi猲. Ngi x竎 nh薾 th藅 s� c莕 d飊g ch�?",
		2,
		"X竎 nh薾/confirm_free_clean_points",
		"Sau n祔 h穣 t輓h./exit_free_clean_points")
end;
-- 确认了要免费洗点，给他洗！
function confirm_free_clean_points()
	ResetProperty()
	SetTask(99, 27)
	Say("Ngi  t葃 頲 甶觤 ti襪 n╪g. L莕 sau ph秈 c萵 th薾 nh�!", 0)
end;
-- 暂时不要免费洗潜能点的函数
function exit_free_clean_points()
	Say("Л頲! Nh璶g l莕 sau ph秈 n s韒! Ch薽 tr� l� h誸 ti猲 n, ta kh玭g th� gi髉 ngi t葃 甶觤 ti襪 n╪g u!", 0)
end;
--======================================================


function teach_team_001()
local nMemCount = GetTeamSize()
	if (nMemCount == 0) or (nMemCount == 1) then
		task_015_check(2)
	else
		task_015_check(1)
	end
	return
end

function teach_team_002()
	task_015_check(3)
end

function teach_team_003()
	task_015_check(4)
end

function teach_team_004()	
	
	if GetTeamSize() == 1 then
		task_015_check(5)
	else
		task_015_check(6)
	end

end


-- 选择洗潜能点
function main_point()
	if GetPlayerFaction()>0 then
		Talk(1,"","Ngi  gia nh藀 m玭 ph竔, kh玭g th� t葃 甶觤 ti襪 n╪g n鱝!");
	elseif GetLevel() > 10 then
		Talk(1, "", "Ъng c蕄 hi謓 t筰 c馻 ngi  vt qu� 10, kh玭g th� t葃 甶觤 ti襪 n╪g.")
	else
		ResetProperty()
		Talk(1,"","Ngi  t葃 頲 甶觤 ti襪 n╪g. L莕 sau ph秈 c萵 th薾 nh�!");
	end
end

-- 选择回来看看
function main_exit()
	Talk(1,"","Ha ha! Ngi qu� th藅 c� l遪g!");
end

-- 免费回复生命
function main_restore()
	if GetPlayerFaction()>0 then
		Talk(1,"","Ngi  gia nh藀 m玭 ph竔, c� th� n dc 甶誱 mua dc th秓 tr� thng. Mua n dc c馻 ngi bi誸 k� n╪g luy謓 n, kh玭g th� gi髉 g� cho ngi!");
	else
		Restore()    --恢复玩家的生命
		RestoreNeili()   --恢复玩家的内力（全满）
		CureWound(2)    --治疗内外伤
		Talk(1,"","Ta  tr� thng cho ngi! Sau n祔 ph秈 c萵 th薾 nh�!");
		return
	end;
end;

function confirm_xidian()
	ResetProperty()
	Talk(1,"","<color=green>D� T萿<color>: Ta  t葃 甶觤 ti襪 n╪g gi髉 ngi r錳.");
end