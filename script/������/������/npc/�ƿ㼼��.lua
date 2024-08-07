-- =========================================
-- File : XXX区，XX，制裤技能.lua
-- Name : 制裤技能
-- ID   : 1, 9
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
		NpcChat(GetTargetNpc(),"ng qu猲 l� tr� linh kh� m� trang b� c� th� dung n筽 l� c� h筺!");
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
    	Say(strTitle.."Mu鑞 h鋍 may h� y �? L骳 n祔 ta ch璦 d箉 頲", 0)
    	return
    end;
	
	local strtab = {
		"H鋍 k� n╪g may h� y/learn_shoes_skill",
		"H鋍 c竎h ph鑙 ch� m韎/learn_new_recipe",
		"H鋍 ph鑙 ch� trang b� Linh у/learnLtEquip",
		"Qu猲 k� n╪g may h� y/forget_life_skill",
--		"Nh鱪g 甶襲 li猲 quan v� trang b� B竧 Qu竔/bagua",
		"T譵 hi觰 v藅 ph� gia/dating"	
		}
	if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
		tinsert(strtab,"ti誴 t鬰 nhi謒 v� h鋍 t藀 Linh Th筩h B竧 Qu竔/task_new3");
	end
	if GetLifeSkillMaxLevel(1, 9) == 79 then
		tinsert(strtab, "Mu鑞 h鋍k� n╪g cao c蕄 h琻/update_max_skill_level");
	end 
	tinsert(strtab,"R阨 kh醝/exit_dialog");  		
	Say(strTitle.."Ta b譶h sinh r蕋 th輈h ch� t筼 h� gi竝, c� c莕 ta gi髉 g� kh玭g?",
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


-- == 遗忘制裤技能 ===========================
function forget_life_skill()
	if (GetLifeSkillLevel(1, 9) > 0) then
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
		Say(strTitle.."Ngi v蒼 ch璦 h鋍 k� n╪g may h� y �? Ta s� gi髉 ngi", 0)
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
	
	if (GetLifeSkillLevel(1, 9) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 9)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(RECIPE_SEX, 0)
				Msg2Player("K� n╪g may h� y ngi  qu猲 r錳")				
			end
		else
			Say(strTitle.."Ngi kh玭g mang theo  ti襫! L蕐 ti襫 r錳 h穣 n nh�!", 0)
		end
	end
end;

-- == 学习制裤技能 ===========================
function learn_shoes_skill()
	if (GetLevel() < 10) then
		Say(strTitle.."B筺 kh玭g  <color=yellow>c蕄 10<color> ch�?th� h鋍 k� n╪g s鑞g.", 0)
		return
	end  
	
	if (GetLifeSkillsNum(1) >= 2) then
		Say(strTitle.."B籲g h鱱  h鋍 k� n╪g s秐 xu蕋, mu鑞 h鋍 k� n╪g m韎 c莕 ph秈 b� k� n╪g c�.", 0)
    	return
	end

	Say(strTitle.."<color=yellow>K� n╪g may h� y<color> s� l� k� n╪g s秐 xu蕋, ngi c� mu鑞 h鋍 kh玭g?",
    	2,
    	"Ta mu鑞 h鋍/learn_as_main",
    	"в ta suy ngh� l筰/exit_dialog")
end;
-- == 选择男裤还是女裤 ====
function learn_as_main()
	if (2 > GetLifeSkillsNum(1)) then
		Say(strTitle.."K� n╪g may h� y g錷: <color=yellow>h� y nam<color> v� <color=yellow>h� y n�<color>, ngi mu鑞 h鋍 lo筰 n祇?",
			3,
			"May h� y nam/choose_man",
			"May h� y n�/choose_women",
			"в ta suy ngh�./exit_dialog")
	end
end;
-- == 选择男衣下装织造 ====
function choose_man()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 9, 1, 79, 1)) then
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: k� n╪g may h� y")
      		
      		AddRecipe(323)
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Lang b� y")
			AddRecipe(324)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Trang ph鬰 Nh� �")
			AddRecipe(325)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H� b� y")
			AddRecipe(326)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Khinh Gi竝 y")
			AddRecipe(341)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M穘g Ng璾 y")
			AddRecipe(342)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim T� y")
			AddRecipe(343)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H祇 D騨g Trang")
			AddRecipe(344)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim L� Trang")
			
			SetTask(LEV_LEARNRECIPE, 10)
			SetTask(RECIPE_SEX, 1)
		end
	else
		Say(strTitle.."B筺  h鋍 k� n╪g s鑞g, kh玭g th� h鋍 th猰 k� n╪g kh竎.", 0)
	end
end;
-- == 选择女衣下装织造 ====
function choose_women()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 9, 1, 79, 1)) then
      		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: k� n╪g may h� y")
    		
    		AddRecipe(359)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 Nhung T� Trang")
			AddRecipe(360)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B輈h V﹏ T� Trang")
			AddRecipe(361)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� Luy謓 T� Trang")
			AddRecipe(362)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H醓 Ho祅 T� Trang")
			AddRecipe(377)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phong Tr莕 T� Trang")
			AddRecipe(378)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Linh V薾 T� Trang")
			AddRecipe(379)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi H錸g T� Trang")
			AddRecipe(380)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phong V� T� Trang")
			
		    SetTask(LEV_LEARNRECIPE, 10)
		    SetTask(RECIPE_SEX, 2)
		end
	else
		Say(strTitle.."B筺  h鋍 k� n╪g s鑞g, kh玭g th� h鋍 th猰 k� n╪g kh竎.", 0)
	end
end;



-- == 学习新的配方 ===========================
function learn_new_recipe()
	local nLevel = GetLifeSkillLevel(1, 9)
	
	if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
		Say(strTitle.."K� n╪g may h� y g錷: <color=yellow>h� y nam<color> v� <color=yellow>h� y n�<color>, ngi mu鑞 h鋍 lo筰 n祇?",
			3,
			"May h� y nam/recipe_man",
			"May h� y n�/recipe_women",
			"в ta suy ngh�./exit_dialog")
		return
	end
	
	-- 男装配方升级
	if (1 == GetTask(RECIPE_SEX)) then
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(327)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: D� H祅h Trang")
			AddRecipe(328)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H醓 Tng Trang")
			AddRecipe(345)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Du Hi謕 Trang")
			AddRecipe(346)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H� B� K譶h Trang")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(329)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: X輈h Lang Trang")
			AddRecipe(330)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Trang ph鬰 Nh� �")
			AddRecipe(347)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C萴 Lan y")
			AddRecipe(348)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh Sng Trang")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(331)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Long B� y")
			AddRecipe(332)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Huy詎 秐h y")
			AddRecipe(349)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Phong Trang")
			AddRecipe(350)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B� 萵 Trang")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(333)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Lang y")
			AddRecipe(334)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi Ng� y")
			AddRecipe(351)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 S竎h y")
			AddRecipe(352)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 L玦 y")
			SetTask(LEV_LEARNRECIPE, 50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(335)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh V﹏ y")
			AddRecipe(336)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B輈h L﹏ y")
			AddRecipe(353)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Nhu Cng y")
			AddRecipe(354)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Cu錸g Vi猰 y")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(337)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: S竧 Ki誴 Trang")
			AddRecipe(338)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: � T籱 y")
			AddRecipe(355)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Huy誸 H� y")
			AddRecipe(356)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Cng y")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		    Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!", 0)
		end
		
	-- 女装配方升级
	else
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(363)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Luy謓 Gi竝 T� y")
			AddRecipe(364)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: S� Man T� y")
			AddRecipe(381)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H穖 Tr薾 T� y")
			AddRecipe(382)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B輈h H� T� y")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(365)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C萴 Anh T� y")
			AddRecipe(366)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V﹏ H� T� y")
			AddRecipe(383)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 T籱 T� y")
			AddRecipe(384)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kh雐 La T� y")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(367)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: To祅 Kim Gi竝 y")
			AddRecipe(368)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H錸g V﹏ T� y")
			AddRecipe(385)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� Th莕 T� y")
			AddRecipe(386)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Linh Lung T� y")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(369)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: L玦 Th莕 y")
			AddRecipe(370)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 M� y")
			AddRecipe(387)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B竎h Chi課 y")
			AddRecipe(388)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th莕 N� y")
			SetTask(LEV_LEARNRECIPE, 50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(371)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ph� Tr薾 y")
			AddRecipe(372)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ph蕋 V﹏ y")
			AddRecipe(389)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� Linh y")
			AddRecipe(390)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T秐 Hoa y")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(373)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H� Khi誹 y")
			AddRecipe(374)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th竔 Thanh y")
			AddRecipe(391)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H錸g Ng鋍 y")
			AddRecipe(392)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Xu蕋 V﹏ y")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		    Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!",0)
		end
	end
end;

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 9)
	if nLevel >= 79 then
    	AddRecipe(1139)
    	AddRecipe(1140)
    	AddRecipe(1141)
    	AddRecipe(1142)
    	Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Linh у Trang (S竧 thng)"))
    	AddRecipe(1143)
    	AddRecipe(1144)
    	AddRecipe(1145)
    	AddRecipe(1146)
    	Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Linh у Trang  (Ngo筰 c玭g)"))
    	AddRecipe(1147)
    	AddRecipe(1148)
    	AddRecipe(1149)
    	AddRecipe(1150)
    	Msg2Player(format("Х h鋍 ph鑙 ch� m韎: %s", "Linh у Trang (N閕 k輈h)"))
	else
    	Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!",0)
	end
end

-- == 选择并且补习男裤制造技能 ====
function recipe_man()
	AddRecipe(323)
    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Lang b� y")
	AddRecipe(324)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Trang ph鬰 Nh� �")
	AddRecipe(325)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H� b� y")
	AddRecipe(326)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Khinh Gi竝 y")
	AddRecipe(341)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: M穘g Ng璾 y")
	AddRecipe(342)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim T� y")
	AddRecipe(343)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H祇 D騨g Trang")
	AddRecipe(344)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim L� Trang")
			
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 1)
end;
-- == 选择并且补习女裤制造技能 ====
function recipe_women()
	AddRecipe(359)
    Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 Nhung T� Trang")
	AddRecipe(360)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B輈h V﹏ T� Trang")
	AddRecipe(361)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� Luy謓 T� Trang")
	AddRecipe(362)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H醓 Ho祅 T� Trang")
	AddRecipe(377)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phong Tr莕 T� Trang")
	AddRecipe(378)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Linh V薾 T� Trang")
	AddRecipe(379)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phi H錸g T� Trang")
	AddRecipe(380)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Phong V� T� Trang")
		
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 2)
end;

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=green>T� Quy猲 C� Nng<color>: <color=red>Trang b� b竧 qu竔<color> l� s� trng c馻 ta + M筩 th� v� l穙 L璾 � Tng Dng, nh璶g t鑤 nh蕋 n猲 h醝 qua C玭g D� Th� gia trc, c遪 n誹 mu鑞 bi誸 chi ti誸 v� trang b� <color=yellow>kh秏 n筸 Linh th筩h<color> th� g苝 ta l� ng ngi r錳!",
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
	if GetLifeSkillLevel(1, 9) < 79 then
		Talk(1,"",format("Hi謓 t筰 c蕄 k� n╪g s秐 xu蕋 ch璦 t c蕄 %d, kh玭g th� m� r閚g c蕄 gi韎 h筺 k� n╪g", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng﹏ lng kh玭g  %d v祅g", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 9, 99);
	Msg2Player("Ch骳 m鮪g c蕄 gi韎 h筺 k� n╪g s秐 xu蕋  t c蕄 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end