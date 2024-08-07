-- =========================================
-- File : XXX区，XX，头冠织造.lua
-- Name : 头冠织造
-- ID   : 1, 10
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");
Include("\\script\\task\\lingshi_task.lua")

-- == 预定义的一些任务变量ID =======================
ID_LEARNLIFESKILL		= 1925		-- 新手任务变量
LEV_LEARNRECIPE			= 1926		-- 配方学习情况记录
RECIPE_SEX				= 1935		-- 配方学习男女选择
FORGETMAIN_NUM			= 1940		-- 遗忘主技能次数

-- == 全局使用的名字 =======================
strName = ""
strTitle = ""

-- == 默认入口函数 =========================
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu� 5 gi� ch琲, h穣 ngh� ng琲  gi� g譶 s鴆 kh醗!")
	 	return
	 end
	strName = GetTargetNpcName()
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Linh th筩h � v� tr� n祇 th� kh秏 tr猲 trang b� c� v� tr� tng 鴑g, kh玭g th� kh秏 l閚!");
	end;
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
	
	    if (GetTask(ID_LEARNLIFESKILL) < 3) then
        Say(strTitle.."дn <color=yellow>C蕄 10<color> c� th� n <color=yellow>Th祅h Й<color> g苝 <color=yellow>Du Phng i phu<color> t譵 hi觰 <color=yellow>k� n╪g s鑞g<color>!", 0)
        TaskTip("дn c蕄 10 c� th� n Th祅h Й t譵 Du Phng i phu.")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) < 15) then
    	Say(strTitle.."Mu鑞 h鋍 may n鉵 �? Gi� th� ch璦 th� h鋍 頲!", 0)
    	return
    end;
	
	local strtab = {
		"H鋍 may n鉵/learn_cap_skill",
		"H鋍 c竎h ph鑙 ch� m韎/learn_new_recipe",
		"H鋍 ph鑙 ch� trang b� Linh у/learnLtEquip",
		"Qu猲 c竎h may n鉵 r錳/forget_life_skill",
--		"Nh鱪g 甶襲 li猲 quan v� trang b� B竧 Qu竔/bagua",
		"T譵 hi觰 v藅 ph� gia/dating"
		}
	if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
--		tinsert(strtab,"ti誴 t鬰 nhi謒 v� h鋍 t藀 Linh Th筩h B竧 Qu竔/task_new3");
	end
	if GetLifeSkillMaxLevel(1, 10) == 79 then
		tinsert(strtab, "Mu鑞 h鋍k� n╪g cao c蕄 h琻/update_max_skill_level");
	end 
	tinsert(strtab,"R阨 kh醝/exit_dialog"); 			
	Say(strTitle.."Ngh� n祔 ta h鋍 t� nh� n猲 r蕋 tinh th玭g, c� c莕 ta gi髉 g� kh玭g?",
		getn(strtab),
		strtab)
end;


-- == 什么都不做的退出对话 ===================
function exit_dialog()
end;


-- == 打听关于添加物的信息 ===================
function dating()
	Say(strTitle.."Ngi t trang b� v祇 sau  th猰 nguy猲 li謚, s� c� m鉵  nh� �.", 0)
end;


-- == 遗忘头冠织造 ===========================
function forget_life_skill()
	if (GetLifeSkillLevel(1, 10) > 0) then
		local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- 主技能
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."Зy l� l莕 th� "..(nForgetTimes + 1).." l莕 b� k� n╪g s秐 xu蕋, m蕋 "..nShouldPay.." lng, ngi suy ngh� k� ch璦?",
			2,
			"Ta  quy誸 nh r錳!/forget_now",
			"Khoan ! Ch� ta suy ngh� l筰!/exit_dialog")
	else
		Say(strTitle.."Ngi ch璦 h鋍 may n鉵 �?", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- 辅技能
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	if (GetLifeSkillLevel(1, 10) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
			AbandonLifeSkill(1, 10)
			SetTask(LEV_LEARNRECIPE, 0)
			SetTask(RECIPE_SEX, 0)
			Msg2Player("Ngi  qu猲 c竎h may n鉵 r錳")				
		else
			Say(strTitle.."Ngi kh玭g mang theo  ti襫! L蕐 ti襫 r錳 h穣 n nh�!", 0)
		end
	end
end;

-- == 学习头冠织造 ===========================
function learn_cap_skill()
	if (GetLevel() < 10) then
		Say(strTitle.."B筺 kh玭g  <color=yellow>c蕄 10<color> ch�?th� h鋍 k� n╪g s鑞g.", 0)
		return
	end  
	
	if (GetLifeSkillsNum(1) >= 2) then
		Say(strTitle.."B籲g h鱱  h鋍 k� n╪g s秐 xu蕋, mu鑞 h鋍 k� n╪g m韎 c莕 ph秈 b� k� n╪g c�.", 0)
    	return
	end

	Say(strTitle.."<color=yellow>May n鉵<color> c騨g l� m閠 k� n╪g ch� t筼 m韎, c� mu鑞 h鋍 kh玭g?",
    	2,
    	"Ta mu鑞 h鋍/learn_as_main",
    	"в ta suy ngh� l筰/exit_dialog")
end;
-- == 选择男帽制造还是女帽制造 ====
function learn_as_main()
	if (2 > GetLifeSkillsNum(1)) then
		Say(strTitle.."May n鉵 c�<color=yellow>may n鉵 nam<color> v� <color=yellow>may n鉵 n�<color>, ngi mu鑞 h鋍 lo筰 n祇?",
			3,
			"May n鉵 nam/choose_man",
			"May n鉵 n�/choose_women",
			"в ta suy ngh�./exit_dialog")
	end
end;
-- == 选择男帽制造 ====
function choose_man()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 10, 1, 79, 1)) then
      Msg2Player("B筺 h鋍 頲 k� n╪g: May n鉵")
      		
      AddRecipe(251)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Anh H飊g C﹏")
			AddRecipe(252)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C萴 B� c﹏")
			AddRecipe(253)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M穘 Nguy謙 L筽")
			AddRecipe(254)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim Phong Qu竛")
			AddRecipe(269)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng璾 B� u C﹏")
			AddRecipe(270)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim 襲 c﹏")
			AddRecipe(271)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� Th緉g Sa M穙")
			AddRecipe(272)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ho祅g Tr� Th骳 C﹏")
			
			SetTask(LEV_LEARNRECIPE, 10)
			SetTask(RECIPE_SEX, 1)
		end
	else
		Say(strTitle.."B筺  h鋍 k� n╪g s鑞g, kh玭g th� h鋍 th猰 k� n╪g kh竎.", 0)
	end
end;
-- == 选择女帽制造 ====
function choose_women()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 10, 1, 79, 1)) then
      Msg2Player("B筺 h鋍 頲 k� n╪g: May n鉵")
    		
    	AddRecipe(287)
    	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ph遪g Phong L筽")
			AddRecipe(288)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T� Th駓 L筽")
			AddRecipe(289)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh уng K誸")
			AddRecipe(290)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: San H� tr﹎")
			AddRecipe(305)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tr莔 M閏 Th骳 Tr﹎")
			AddRecipe(306)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng﹏ Linh Tr﹎")
			AddRecipe(307)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Qu� Di謓 Th骳 c﹏")
			AddRecipe(308)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh Lam C﹏")
			
		  SetTask(LEV_LEARNRECIPE, 10)
		  SetTask(RECIPE_SEX, 2)
		end
	else
		Say(strTitle.."B筺  h鋍 k� n╪g s鑞g, kh玭g th� h鋍 th猰 k� n╪g kh竎.", 0)
	end
end;



-- == 学习新的配方 ===========================
function learn_new_recipe()
	local nLevel = GetLifeSkillLevel(1, 10)
	
	if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
		Say(strTitle.."May n鉵 c�<color=yellow>may n鉵 nam<color> v� <color=yellow>may n鉵 n�<color>, ngi mu鑞 h鋍 lo筰 n祇?",
			3,
			"May n鉵 nam/recipe_man",
			"May n鉵 n�/recipe_women",
			"в ta suy ngh�./exit_dialog")
		return
	end
	
	-- 男装配方升级
	if (1 == GetTask(RECIPE_SEX)) then
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(255)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M玭g Di謓 C﹏")
			AddRecipe(256)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Hoa Dng C﹏")
			AddRecipe(273)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 M閏 C﹏")
			AddRecipe(274)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Nhc Th駓 L筽")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(257)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi誸 Tuy課 L筽")
			AddRecipe(258)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: D藅 萵 Qu竛")
			AddRecipe(275)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Chu Tc Th骳 C﹏")
			AddRecipe(276)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H秈 Th莕 K誸")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(259)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H錸g L╪g C﹏")
			AddRecipe(260)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H祅g V﹏ Th骳 Цi")
			AddRecipe(277)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: мnh Qu鑓 T� C﹏")
			AddRecipe(278)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M藅 Nh蒼 Di謓 Tr竜")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(261)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh Sa Nh穘 Tr竜")
			AddRecipe(262)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: X輈h Tinh Nh穘 Tr竜")
			AddRecipe(279)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 S竎h Kim Kh玦")
			AddRecipe(280)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng� Qu� C﹏")
			SetTask(LEV_LEARNRECIPE, 50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(263)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi V﹏ L筽")
			AddRecipe(264)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tuy謙 B秓 Qu竛")
			AddRecipe(281)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tinh cang Chi課 Kh玦")
			AddRecipe(282)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: L玦 Tr� Di謓")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(265)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: S琻 Qu� Di謓")
			AddRecipe(266)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M藅 Th莕 Qu竛")
			AddRecipe(283)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Chung Qu� Di謓")
			AddRecipe(284)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: D� Th莕 C﹏")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		  Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!", 0)
		end
		
	-- 女装配方升级
	else
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(291)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B祅 Th筩h K誸")
			AddRecipe(292)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kh鎛g Tc Tr﹎")
			AddRecipe(309)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Lam 謕 Th骳 C﹏")
			AddRecipe(310)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B筩h H錸g Tr﹎")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(293)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Chu Tc Ph竧 K誸")
			AddRecipe(294)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Щng X� Tr﹎")
			AddRecipe(311)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 C� Th骳 Tr﹎")
			AddRecipe(312)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 La Thoa")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(295)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Minh 謕 K誸")
			AddRecipe(296)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim Ph鬾g Tr﹎")
			AddRecipe(313)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Phong Th骳 Tr﹎")
			AddRecipe(314)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V﹏ M閚g Thoa")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(297)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: мa Ki謙 Qu竛")
			AddRecipe(298)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 箃 H錸")
			AddRecipe(315)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi 觰")
			AddRecipe(316)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H錸g C鑓")
			SetTask(LEV_LEARNRECIPE, 50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(299)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Nh藅 Mi謓")
			AddRecipe(300)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 �")
			AddRecipe(317)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B秓 Tng")
			AddRecipe(318)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phong L玦")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(301)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tu La Ph�")
			AddRecipe(302)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Chu Tc")
			AddRecipe(319)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Vu H祄")
			AddRecipe(320)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tru阯g Sinh")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		    Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!",0)
		end
	end
end;

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 10)
	if nLevel >= 79 then
    	AddRecipe(1131)
    	AddRecipe(1132)
    	AddRecipe(1133)
    	AddRecipe(1134)
    	Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Linh у M穙"))
	else
    	Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!",0)
	end
end

-- == 选择并且补习男帽制造技能 ====
function recipe_man()
	AddRecipe(251)
    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Anh H飊g C﹏")
	AddRecipe(252)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C萴 B� c﹏")
	AddRecipe(253)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M穘 Nguy謙 L筽")
	AddRecipe(254)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim Phong Qu竛")
	AddRecipe(269)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng璾 B� u C﹏")
	AddRecipe(270)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim 襲 c﹏")
	AddRecipe(271)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� Th緉g Sa M穙")
	AddRecipe(272)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ho祅g Tr� Th骳 C﹏")
			
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 1)
end;
-- == 选择并且补习女帽制造技能 ====
function recipe_women()
    AddRecipe(287)
    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ph遪g Phong L筽")
	AddRecipe(288)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T� Th駓 L筽")
	AddRecipe(289)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh уng K誸")
	AddRecipe(290)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: San H� tr﹎")
	AddRecipe(305)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Tr莔 M閏 Th骳 Tr﹎")
	AddRecipe(306)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng﹏ Linh Tr﹎")
	AddRecipe(307)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Qu� Di謓 Th骳 c﹏")
	AddRecipe(308)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh Lam C﹏")
		
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 2)
end;

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=green>Minh S� Ph�<color>: <color=red>Trang b� b竧 qu竔<color> l� ta c飊g huynh  M筩 gia v� l穙 L璾 � Tng Dng,  to祅 l鵦 c飊g nhau nghi猲 c鴘 ra t﹎ huy誸. L祄 th� n祇 nh薾 頲 nh鱪g m鉵 c� linh th筩h ngi 甶 h醝 truy襫 nh﹏ s� r�, n誹 ngi mu鑞 t譵 hi觰 l祄 th� n祇 ch� t筼 頲 <color=yellow>trang b�<color> kh秏 linh th筩h, th� n ch� ta t譵 hi觰 nh�.",
	4,
	"L祄 sao ch� t筼 trang b� c� l� kh秏 n筸/kongzhuangbeizhizuo",
	"V藅 ph萴 th猰 v祇 c� t竎 d鬾g g�/tianjiawu",
	"L祄 sao trang b� 頲 ch� t筼 th祅h trang b� B竧 Qu竔/xiangqianzhuyi",
	"дn h醝 th╩ th玦 m�!/SayHello"
	)
end

function kongzhuangbeizhizuo()
	Talk(1,"",strTitle.."R蕋 n gi秐, qua nghi猲 c鴘 c馻 b鋘 ta, c秈 ti課 phng ph竝 ch� t筼 ta truy襫 th� cho c竎 ngi, b﹜ gi� ngi 產ng thu th藀 nguy猲 li謚 � khu v鵦 thu th藀, nh鱪g trang b� ch� t筼 ra c� m鴆 linh kh� t鑙 產 v� c� th� c� l� kh秏 n筸, nh璶g m� c騨g ch輓h v� v藋, nh鱪g trang b� c� thu閏 t輓h linh kh� kh玭g c遪 ch� t筼 頲 n鱝.")
end

function tianjiawu()
	Talk(1,"",strTitle.."V筺 v藅 tr猲 th� gian u c� gi� tr� ri猲g, gi� tr� t飝 v祇 linh kh� 輙 hay nhi襲, khi ch� t筼 trang b� t╪g v藅 ph萴 th猰 v祇, c� th� t╪g m鴆 linh kh� t鑙 產 v� t╪g s� l� kh秏 n筸 linh th筩h tr猲 trang b�. M鴆 linh kh� t鑙 產 c馻 trang b� quy誸 nh m鴆 linh kh�  kh秏 n筸 linh th筩h, v� s� l� quy誸 nh n� c� th� kh秏 bao nhi猽 linh th筩h, c� th� th祅h thu閏 t輓h b竧 qu竔 hay kh玭g, cho n猲 n誹 頲 th� c� g緉g th猰 v礽 v藅 c� gi� tr�.")
end

function xiangqianzhuyi()
	Talk(1,"",strTitle.."� tr猲  nh綾 n r錳, tr猲 trang b� c� m鴆 linh kh� t鑙 產 v� l� kh秏 n筸, 1 trang b� kh秏 <color=yellow>3 vi猲<color> linh th筩h, khi m鴆 linh kh� c馻 3 vi猲 linh th筩h b籲g v韎 m鴆 linh kh� t鑙 產 c馻 trang b�, s� h譶h th祅h trang b� thu閏 t輓h b竧 qu竔. Linh th筩h l� s� l� th� m鴆 linh kh� ﹎, Linh th筩h l� s� ch絥 th� m鴆 linh kh� dng, n誹 th� t� Linh Th筩h 頲 kh秏 kh玭g gi鑞g nhau, th� trang b� c� thu閏 t輓h b竧 qu竔 kh竎 nhau, tr猲 \'B竧 qu竔 B秓 觧\' d祅h cho h藆 du� c馻 C玭g D� Th� Gian c� ghi r蕋 r� l祄 th� n祇  ch� t筼 1 trang b� c� thu閏 t輓h b竧 qu竔 mong mu鑞, c� th阨 gian th� xem.")
end

function update_max_skill_level()
	Say(strTitle..format("M� r閚g c蕄 k� n╪g s秐 xu蕋 c莕 k� n╪g thu th藀 t c蕄 79 ng th阨 ti猽 hao %d V祅g", 1000), 
		2, "уng �/update_max_skill_level_ensure", "T筰 h� ch� xem qua th玦/SayHello")
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(1, 10) < 79 then
		Talk(1,"",format("Hi謓 t筰 c蕄 k� n╪g s秐 xu蕋 ch璦 t c蕄 %d, kh玭g th� m� r閚g c蕄 gi韎 h筺 k� n╪g", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng﹏ lng kh玭g  %d v祅g", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 10, 99);
	Msg2Player("Ch骳 m鮪g c蕄 gi韎 h筺 k� n╪g s秐 xu蕋  t c蕄 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end