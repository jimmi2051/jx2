--在掌惹师太处加入少林，接师门任务
Include("\\script\\task\\faction\\faction_main_em.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
Include("\\script\\task\\practice\\practice_main.lua"); --修炼的脚本
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");--76级武器生活技能任务脚本
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--召回老玩家活动
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>Nga My Gi竜 Ch�<color> : "
function main()

local nTaskValue = FN_GetTaskState(FN_EM);
local nSkillGenre,nSkillDetail = GetMainLifeSkill() 

	--76级武器配方学习任务
	if GetTask(1600) == 2 and GetBit(GetTask(TASK_76WEAPON_TALK),3) ~= 1 then
		weapon_76_talk(3,nSkillDetail)
		return
	end
	
	if (nTaskValue==0) then
		main_new();
		return		
	elseif (nTaskValue < 5) then
		Say("<color=yellow>Chu Thi謓 Nh﹏<color> � Th祅h Й ph� l� ngi c� l遪g h秓 t﹎, y 產ng c鴘 t� d﹏ ch髇g � <color=yellow>T輓 Tng T�<color>, ngi h穣 gi髉 y m閠 tay.",0);
		return
	elseif (nTaskValue == 5) then
		task_013();
		return
	elseif (nTaskValue >= 7) then
		fix_em();
		return
	else
		main_new();
	end
end;

-- 师门任务相关
function about_faction_task()
	Say("A Di У Ph藅!",
		3,
		"Ta mu鑞 c鑞g hi課 cho s� m玭 (nhi謒 v� s� m玭)/start_faction_tasklink",
		"Ta mu鑞 tra xem  c鑞g hi課./check_query_faction_contri",
		"Ta mu鑞 t譵 hi觰  c鑞g hi課 s� m玭./shimenshuoming")
--		"我要修复师门任务无法完成的问题/repair_faction_bug")
end;

-- 修复杀怪任务无法完成的bug
function repair_faction_bug()
	Say("<color=green>Ch﹏ Nh� S� Th竔<color>: B鎛 m玭 g莕 y c� nhi襲 vi謈 khi課 ngi c騨g b薾 r閚 theo. Xem nh� ngi c� th猰 c� h閕  ta luy謓 v藋! B﹜ gi� ta s� gi髉 ngi h駓 nhi謒 v� tr猲, nh璶g ph秈 tr� 5 甶觤 c鑞g hi課 s� m玭, ngi th蕐 th� n祇?", 
		2,
		"Л頲, ta ng �/confirm_repair_bug",
		"в ta ngh� c竎h kh竎/no")
end;

function confirm_repair_bug()
	RepairAllChainTask()
	Say("<color=green>Ch﹏ Nh� S� Th竔<color>: Xong r錳, ta  h駓 gi髉 ngi!", 0)
end;

function interemei()		--加入门派
	if (GetTask(1001)>0) or (GetTask(1002)>0) or (GetTask(1004)>0) or (GetTask(1005)>0) or (GetTask(1031)>0) or (GetTask(1032)>0) or (GetTask(1033)>0) then  --入门任务检测
		Say("Th� ch�  c� � nh ch鋘 m玭 ph竔 kh竎, tha l鏸 cho Nga My ph竔 kh玭g th� thu nh薾!",0)
	elseif GetSex()==1 then	--性别检测
		Say("Nga My l� n琲 thanh tu Ph藅 m玭, xin Th� ch� h穣 quay bc.",0)
	elseif GetLevel() < 10 then	--等级检测
		Say("Ъng c蕄 th� ch� kh玭g , t n <color=yellow>c蕄 10<color> h穣 quay l筰!",0)
	elseif GetPlayerFaction() == 3 then
		Say("Ngi  l�  t� Nga My, sao h�  th�?",0)
	elseif GetPlayerFaction() > 0 then	--门派检测
		Say("Th� ch�  c� m玭 ph竔, c� nh莔 l蒼 g� ch糿g?",0)
	else
		task_001();
		return
	end
end;


function skilllearn()
	if GetPlayerFaction() ~= 3 then
		Say("Ngi kh玭g ph秈  t� Nga My, sao l筰 mu鑞 h鋍 v� c玭g b鎛 ph竔? H鋍 l衝 v� c玭g l� i k� trong giang h�, c遪 kh玭g mau 甶!",0)
	elseif  GetPlayerRoute() == 7 then 
		Say("Nga My chia l祄: T鬰 gia v� Xu蕋 gia  t�. Xu蕋 gia  t� h鋍 ki誱, do <color=yellow>Tu� T﹎ S� Th竔<color> ph� tr竎h; T鬰 gia  t� h鋍 c莔, do <color=yellow>Hu�  S� Th竔<color> ph� tr竎h; ngi c� th� t譵 h�  b竔 s� h鋍 ngh� nh璶g ch� c� th� ch鋘 m閠 h� ph竔.",0)
		--end
	elseif  GetPlayerRoute() == 8 then
		Say("Ngi l�  t� xu蕋 gia, h鋍 v� c玭g n猲 t譵 <color=yellow>Tu� T﹎ S� Th竔<color> m韎 ph秈.",0)
	else
		Say("Ngi l�  t� t鬰 gia, h鋍 v� c玭g n猲 t譵 <color=yellow>Hu�  S� Th竔<color> m韎 ph秈.",0)
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 3 then
		Say("Th� ch� kh玭g ph秈  t� Nga My, kh玭g phi襫 Th� ch�.",0)
	else
		taskmain("Ch﹏ Nh� s� th竔", 3)
	end
end;				


function no()
end;

function practice()
    if GetPlayerFaction() ~= 3 then
       Talk(1,"","Ngi kh玭g ph秈  t� Nga My, kh玭g th� n y tu luy謓.");
    else
        if GetItemCount(2, 0, 207) >= 1 then  --师门令牌
            Say("Mu鑞 v祇 y tu luy謓?",2,"ng/practice_start","Sai/no");
        else
            Talk(1,"","Ngi kh玭g c� <color=yellow>L謓h b礽 s� m玭 Nga My<color>, kh玭g th� ti課 h祅h b� quan tu luy謓.");
        end;
    end;
end;

-- 峨嵋师门重复任务的入口
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 3) then
		Say("Ch� c�  t� Nga My m韎 c� th� nh薾 nhi謒 v� s� m玭.", 0);
	elseif (GetPlayerRoute() == 7) then 
		Say("H穣 n g苝 hai v� S� th竔 b竔 s� h鋍 ngh�, sau  quay l筰 t譵 ta!", 0);
	elseif (GetPlayerRoute() == 8) then
		task_main_entrance(TASK_ID_EMEI_FOJIA);		-- 佛家
	else
		task_main_entrance(TASK_ID_EMEI_SUJIA);		-- 俗家
	end
end;

function shimenshuoming()
		Say("<color=green>Thuy誸 minh  c鑞g hi課 s� m玭<color>: \n <color=yellow>ч c鑞g hi課 s� m玭<color>: Th玭g qua vi謈 ho祅 th祅h nhi謒 v� S� M玭 t n m閠 ng c蕄 nh蕋 nh, b筺 c� th� nh薾 頲 trang ph鬰 ho芻 v� kh� c馻 S� M玭. \n <color=yellow>Gi韎 h筺  c鑞g hi課 s� m玭<color>: Hi謓 nay  c鑞g hi課 S� M玭 kh玭g b� h筺 ch�, ch� c莕 ho祅 th祅h nhi謒 v� th� c� th� n﹏g cao  c鑞g hi課. \n <color=yellow>S� ki謓 V� L﹎<color>: L祄 xong nhi謒 v� c� nh s� nh薾 th猰 m閠 nhi謒 v� ng蓇 nhi猲, ho祅 th祅h s� nh薾 頲 50 甶觤 c鑞g hi課 S� m玭 v� c� kh� n╪g nh薾 頲 m藅 t辌h s� m玭.", 
			1,
			"Trang k�/shuoming2")		
end;

function shuoming2()
		Say("<color=green>Thuy誸 minh  c鑞g hi課 s� m玭<color>: \n <color=yellow>Gi韎 h筺 ng c蕄  c鑞g hi課 S� M玭<color>: Ъng c蕄 kh竎 nhau th� 甶觤 t輈h l騳  c鑞g hi課 c騨g kh玭g gi鑞g nhau. ч c鑞g hi課 S� M玭 c祅g cao c祅g n﹏g cao ng c蕄 c馻 m譶h, t� sau c蕄 75 th� kh玭g c遪 gi韎 h筺  c鑞g hi課 n鱝. \n <color=yellow>觤 kinh nghi謒 ng蓇 nhi猲<color>. L祄 nhi襲 nhi謒 v� s� m玭  c鑞g hi課 c祅g cao 甶觤 kinh nghi謒 c祅g nhi襲. 觤 c鑞g hi課 <3000 <color=yellow>觤 kinh nghi謒 tng i<color>, >3000 <color=yellow>甶觤 kinh nghi謒 c祅g nhi襲<color>.", 0);
end

function check_query_faction_contri()

	if (GetPlayerFaction() == 0) then	-- 没有加入门派
		Say("Mu鑞 l祄 nhi謒 v� s� m玭 trc ti猲 ph秈 gia nh藀 b鎛 gi竜. Sau  h穣 gia nh藀 trng ph竔, r錳 quay l筰 ch� ta nh薾 nhi謒 v�. Sau khi ho祅 th祅h nhi謒 v� s� m玭 s� nh薾 頲  c鑞g hi課 s� m玭, t輈h l騳  c鑞g hi課 nh蕋 nh c� th� mua v藅 ph萴 b� truy襫 b鎛 m玭.", 0)
		return
	end
	
	if (GetPlayerFaction() ~= 3) then	-- 不是本门弟子
		Say("Ngi kh玭g ph秈 l�  t� c馻 b鎛 gi竜, h穣 v� m玭 ph竔 c馻 ngi m� tra xem  c鑞g hi課 s� m玭 nh�. Giao di謓 F3 c騨g c� th� tra xem  c鑞g hi課 s� m玭.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>Ch﹏ Nh� S� Th竔<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--新的入口
function main_new()
	local selTab = {
				"Ngu錸 g鑓 Nga My ph竔/know_qiyuan",
				"V� c玭g Nga My ph竔/know_wugong",
				"襲 ki謓 nh藀 m玭/know_rumentiaojian",
				"Ta mu鑞 gia nh藀 Nga My/interemei",
				"Ta mu鑞 l祄 nhi謒 v� S� M玭/about_faction_task",
				"Li猲 quan tu luy謓./practice",
				"Ta s緋 th祅h th﹏ n猲 ph秈 xu蕋 s�/#faction_graduate(3)",
				"V蕁 an s� th竔/no",
				}
	if (GetPlayerRoute() == 8) or (GetPlayerRoute() == 9)  then
		tinsert(selTab, 1, "Nhi謒 v� Chuy觧 Sinh - C秈 L穙 Ho祅 уng/trans_talk_32");
	end
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "е t� xin k輓h d﹏g s� ph� tr� hoa c骳 v� b竛h b竎h hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 3)");
	end
--	tinsert(selTab,8,"武林争霸战相关/wulin_zhengba");				
	Say(g_szInfoHead.."Nga My s琻 c秐h tr� tuy謙 m�, xin m阨 ra ngo礽 ngo筺 c秐h!",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."Tuy謙 k� Nga My l� 甶謚 m骯 ki誱 c� t� th阨 Л阯g nh璶g 阯g ki誱 uy觧 chuy觧 kh玭g gi鑞g ki誱 ph竝 c馻 nam nh﹏, giang h� g鋓 l� Ng鋍 N� ki誱 ph竝 ho芻 Nga My ki誱. Sau  c�  t� n n骾 Nga My khai s琻 l藀 ph竔 n猲 h礽 ﹎ v韎 t猲 g鋓 t�  truy襫 cho n nay.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("Nga My chia ra hai 阯g Ph藅 gia, T鬰 gia. Ph藅 gia ch� tu Ph藅 ph竝 n閕 c玭g, h鋍 Nga My tr� thng  h錳 ph鬰 t﹎ ph竝, h� tr� l� ch輓h, s� ki誱  t╪g th鵦 l鵦 c馻 ng i, c� th� h鋍 v� c玭g tr蕁 ph竔 V筺 Tng Th莕 C玭g. T鬰 gia ch� tu n閕 kh�, h鋍 Nga My n  ch� ng� t﹎ ph竝 c馻 ch, l祄 cho ch nh﹏ t﹎ tr� b蕁 lo筺, d飊g ti課g n  l祄 gi秏 s鴆 chi課 u c馻 ch, ch� ng� h祅h ng c馻 ch髇g, c� th� h鋍 v� c玭g tr蕁 ph竔 Thi猲  Tr蕁 H錸 Kh骳."),g_szInfoHead..sf_ConvertColorString("Ph藅 gia th� nghi謕 s� ph� l� Tu� T﹎ s� th竔, T鬰 gia th� nghi謕 s� ph� l� Tu�  s� th竔."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Nga My ph竔 x璦 nay ch� thu nh薾 n�  t�, kh玭g l祄 vi謈 竎, ch璦 gia nh藀 m玭 ph竔 kh竎, kh玭g ph秈 l� ph秐  c馻 b秐 ph竔. е t� Nga My ph秈 d飊g Ph藅 t﹎  ph�  ch髇g sinh, h祅h t萿 giang h�  c鴘 nh﹏  th�, b秓 v� b竎h t輓h.");
end;