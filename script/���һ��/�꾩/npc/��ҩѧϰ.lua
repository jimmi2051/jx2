-- =========================================
-- File : 中原一区，汴京，采药学习.lua
-- Name : 林药师
-- ID   : 0, 4
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************定义常量及预处理***************************************
ID_LEARNLIFESKILL	= 1925		-- 配方学习任务变量
LEVELTASKID49		= 516		-- 回龙转凤羹
TASK49_BEGGING		= 1933		-- 49级晋级任务开始标示
FORGETMAIN_NUM		= 1940		-- 遗忘主技能次数
FORGETOHTER_NUM		= 1941		-- 遗忘主技能次数

strName = "";
strTitle = "";

--*****************************************MAIN函数*****************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu� 5 gi� ch琲, h穣 ngh� ng琲  gi� g譶 s鴆 kh醗!")
	 	return
	 end
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
	
	-----------------------------------------新手任务-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 15) then
        Say(strTitle.."дn <color=yellow>C蕄 10<color> c� th� n <color=yellow>Th祅h Й<color> g苝 <color=yellow>Du Phng i phu<color> t譵 hi觰 <color=yellow>k� n╪g s鑞g<color>!", 0)
        TaskTip("дn c蕄 10 c� th� n Th祅h Й t譵 Du Phng i phu.")       
        return 
    end
    
	--提示玩家76级武器配方任务
	local nGene,nSKIllId = GetMainLifeSkill()
	local nMainLevel = GetLifeSkillLevel(nGene, nSKIllId)
	if (nGene == 1 and nSKIllId <=8 and nMainLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSKIllId);
		return
	end	

---------------------------------------------主对话-------------------------------------------
    Say(strTitle.."N╩ nay chi課 lo筺 li猲 mi猲, giang h� hi觤 竎. Bi誸 ch髏 y thu藅 c� th� t� lo cho m譶h v� gi髉  ngi kh竎! Th藅 l� nh蕋 c� lng ti謓!",
		6,
		"H鋍 k� n╪g h竔 thu鑓./luaLearnLifeSkill",
		"дn Nam H遝 c鑓 (s� c蕄)/GotoWorld_Confirm1",
		"дn H祄 U c鑓 (trung c蕄)/GotoWorld_Confirm2",
		"дn Hi猲 Vi猲 c鑓 (cao c蕄)/GotoWorld_Confirm3",
		--"遗忘采药技能/forget_life_skill",
		"Ta mu鑞 t譵 hi觰 tin t鴆 v� h竔 thu鑓./Info",
		"R阨 kh醝/Main_Exit");
end;

-- 遗忘生活技能
function forget_life_skill()
	if (GetLifeSkillLevel(0, 4) > 0) then
		local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- 辅技能
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."Зy l� l莕 th� "..(nForgetTimes + 1)..", ngi h駓 k� n╪g thu th藀, ta ph秈 thu"..nShouldPay.." lng, ngi suy ngh� k� ch璦?",
			2,
			"Ta  quy誸 nh r錳!/forget_now",
			"Khoan ! Ch� ta suy ngh� l筰!/SayHello")
	else
		Say(strTitle.."Ngi ch璦 h鋍 k� n╪g h竔 thu鑓, ta kh玭g th� gi髉 ngi!", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- 辅技能
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	if (GetLifeSkillLevel(0, 4) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 4)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(LEVELTASKID49, 0)
				Msg2Player("Ngi  h駓 k� n╪g h竔 thu鑓.")				
			end
		else
			Say(strTitle.."Ngi kh玭g mang theo  ti襫! L蕐 ti襫 r錳 h穣 n nh�!", 0)
		end
	end
end;



--**********************************************技能学习部分***************************************
-- 学习生活技能
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."H鮩� Th﹏ th� c馻 ngi c遪 k衜 l緈. H穣 ra ngo礽 th祅h tu luy謓 n c蕄 10 h穣 n t譵 ta!", 0)
		return
	end

	-- 判断是否已经学会了采集技能 - 采药
	if (GetLifeSkillLevel(0, 4) > 0) then
        Say (strTitle.."B筺 tr�! Ngi  h鋍 頲 t蕋 c� k� n╪g h竔 thu鑓!", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."B筺  h鋍 2 K� n╪g thu th藀, kh玭g th� h鋍 th猰 n鱝!",0)
		return
	end
	
	Say(strTitle.."<color=yellow>H竔 thu鑓<color> s� l� k� n╪g thu th藀 m韎 c馻 ngi! Ngi c� mu鑞 h鋍 kh玭g?",
    	2,
    	"Ta mu鑞 h鋍/LearnYes",
    	"в ta suy ngh� l筰/LearnNo")
end;
--学习技能
function LearnYes()
	if (GetLifeSkillLevel(0, 4) > 0) then
		Say (strTitle.."Ngi  h鋍 頲 t蕋 c� k� n╪g h竔 thu鑓!", 0)
	else
		if (LearnLifeSkill(0, 4, 1, 79, 0)) then
			AddItem(0, 200, 16, 1, 1)
        	Msg2Player("B筺 h鋍 頲 k� n╪g thu th藀: H竔 thu鑓 v� nh薾 頲 cu鑓 thu鑓.")
    	end
	end
end;
--取消学习技能
function LearnNo()
    Say (strTitle.."Ngh� k� r錳 h穣 n!", 0)
end;



-- 确认去相应挂机地点=====================================================================
function GotoWorld_Confirm1()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>Nam H遝 C鑓<color> h竔 thu鑓 �? N琲  c� <color=yellow>Ba u<color>, <color=yellow>T祅g H錸g Hoa<color>, <color=yellow>C竧 C竛h<color> v� <color=yellow>Ho祅g li猲<color>. Nh� mang theo <color=yellow>Th莕 N玭g Кn<color>!",
		2,
		"Ta mu鑞 甶/#GotoWorld(714, 1511, 3004)",
		"Kh玭g 甶 u/Main_Exit");
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>H祄 U C鑓<color> h竔 thu鑓 �? N琲  c� <color=yellow>X竎 ve<color>, <color=yellow>襫 th蕋<color> v� <color=yellow>Xuy猲 s琻 gi竝<color>. Nh� mang theo <color=yellow>Th莕 N玭g Кn<color>!",
		2,
		"Ta mu鑞 甶/#GotoWorld(719, 1708, 3396)",
		"Kh玭g 甶 u/Main_Exit");
end;
function GotoWorld_Confirm3()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>Hi猲 Vi猲 C鑓<color> h竔 thu鑓 �? N琲  c� <color=yellow>X� hng<color>, <color=yellow>M藅 g蕌<color> v� <color=yellow>Nh﹏ s﹎<color>. Nh� mang theo <color=yellow>Th莕 N玭g Кn<color>!",	2,
		"Ta mu鑞 甶/#GotoWorld(724, 1721, 3386)",
		"Kh玭g 甶 u/Main_Exit");
end;
-- 去相应的挂机地点
function GotoWorld(MapID, x, y)
		CleanInteractive()
		LeaveTeam()
		SetFightState(0)
				
		NewWorld(MapID,x,y)
end;


-- 介绍相关信息
function Info()
	Say(strTitle.."<color=yellow>H竔 thu鑓<color> l� m閠 trong <color=yellow>6<color> k� n╪g thu th藀. H鋍 頲 k� n╪g n祔 m韎 t譵 頲 nguy猲 li謚 <color=yellow>ch� thu鑓<color>. Ngi c� th� n <color=yellow>ti謒 t筽 h鉧<color> mua c玭g c� h竔 thu鑓 <color=yellow>s� c蕄<color> sau  ra ngo礽 h竔 thu鑓. N誹 mu鑞 n U C鑓 n猲 gh� <color=yellow>Ng� c竎<color> mua <color=yellow>Th莕 N玭g Кn<color> mang theo.", 0);
end;

-- 什么也不做的空函数
function Main_Exit()
end;

