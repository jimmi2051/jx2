-- =========================================
-- File : 中原一区，汴京，云游道人.lua
-- Name : 云游道人
-- ID   : 1, 8
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

ID_LEARNLIFESKILL		= 1925		-- 新手任务变量
TASK49_BEGGING			= 1933		-- 49级晋级任务开始标示
LEV_LEARNRECIPE			= 1926		-- 配方学习任务变量
FORGETMAIN_NUM			= 1940		-- 遗忘主技能次数
FORGETOHTER_NUM			= 1941		-- 遗忘辅技能次数
strName = "";
strTitle = "";

--*****************************************MAIN函数*******************************************
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
	
	-------------------------------------------新手任务-----------------------------------------
	if (GetTask(ID_LEARNLIFESKILL) < 2) then
		Say(strTitle.."дn <color=yellow>C蕄 10<color> c� th� n <color=yellow>Th祅h Й<color> g苝 <color=yellow>Du Phng i phu<color> t譵 hi觰 <color=yellow>k� n╪g s鑞g<color>!", 0)
    	TaskTip("дn c蕄 10 c� th� n Th祅h Й t譵 Du Phng i phu.")        
		return    
    elseif (GetTask(ID_LEARNLIFESKILL) >= 2 and GetTask(ID_LEARNLIFESKILL) < 15) then
		Talk(3, 
			 "",
			 strTitle.."Ta s� gi秈 th輈h i n衪 v� k� n╪g thu th藀 cho b籲g h鱱 r�.",
			 strTitle.."K� n╪g thu th藀 g錷: <color=yellow>цn c﹜, Уo kho竛g, Canh t竎, Thu閏 da, T藀 linh, H竔 thu鑓 v� K衞 t�<color>. K� n╪g thu th藀 c莕 c� khu v鵦 v� c玭g c� tng 鴑g m韎 c� th� s� d鬾g. <color=yellow>цn c﹜ c莕 c� Thi誸 ph�; Уo kho竛g c莕 c� Cu鑓 chim; Canh t竎 c莕 c� Cu鑓; Thu閏 da c莕 Ch� b� 產o; T藀 linh c莕 Ph竝 kh�; H竔 thu鑓 c莕 Cu鑓 thu鑓; K衞 t� c莕 Con thoi<color>.",
			 strTitle.."Ch� � m鏸 c玭g c� u c�  b襫 nh蕋 nh. Gi� b籲g h鱱 c� th� v� <color=yellow>Bi謓 Kinh<color> gi秈 th輈h cho <color=yellow>L璾 Nh蕋 Ph�<color>.")
		if (GetTask(ID_LEARNLIFESKILL) == 2) then
			SetTask(ID_LEARNLIFESKILL, 3)
			TaskTip("T譵 L璾 Nh蕋 Ph� � Bi謓 Kinh")
		end
		return
    end
	
 ---------------------------------------------主对话-------------------------------------------
	Say(strTitle.."Ta l� V﹏ Du Чo Nh﹏, tinh th玭g k� thu藅 ngi c莕 ta gi髉 g� kh玭g? Nghe n鉯 c竎 o s� � Tuy襫 Ch﹗ ph竧 hi謓 m閠 lo筰 ph� th筩h m韎 t鑤 h琻 c馻 ta r蕋 nhi襲. Ngi th� n  xem.",
		4,
		"H鋍 k� n╪g luy謓 b颽/luaLearnLifeSkill",
		"H鋍 c竎h ph鑙 ch� ho芻 l祄 nhi謒 v� ph鑙 ch�/learn_all_recipe",
		"B� k� n╪g luy謓 b颽/forget_life_skill",
		"R阨 kh醝/SayHello")
end;

-- 所有配方相关的事情
function learn_all_recipe()
	Say(strTitle.."Ngi mu鑞 h鋍 c竎h ph鑙 ch� ho芻 l祄 nhi謒 v� ph鑙 ch�?",
		7,
		"H鋍 c竎h ph鑙 ch� m韎/luaLearnRecipe",
		"H鋍 c竎h ph鑙 ch� d祅h cho ho箃 ng cu鑙 tu莕/Weekend",
		"Phng ph竝 ph鑙 ch� m韎/luaResLearnRecipe",
		"Xem nh薾 頲 nhi謒 v� v� kh� c蕄 76 kh玭g/get_76_task",
		"H鋍 c竎h ph鑙 ch� c蕄 76/relearn_76_recipe",
		"H鋍 s鯽 ph鑙 ch�/Reset_Learn",
		"R阨 kh醝/SayHello")
end;

-- 接受76级配方任务
function get_76_task()
 ----------------------------------76级武器配方赤钨灵符任务----------------------------------
	local nSkillGenre,nSkillDetail = GetMainLifeSkill();
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre,nSkillDetail);
	local nTaskState_chiwu = GetTask(TASK_JUJU_CHIWU);
		
	if nSkillGenre == 1 and nSkillDetail == 8 and nSkillLevel >= 79 then
		--尚未触发配方任务
		if nTaskState_chiwu == 0 then
			juju_chiwu_001()
			return
		--尚送去驱魔灵符的对话
		elseif nTaskState_chiwu == 1 then
			juju_chiwu_002()
			return
		--送回黑钨石与菩提木并学会配方
		elseif nTaskState_chiwu == 2 then
			juju_chiwu_007()
			return			
		end 
	end
		
	--提示玩家76级武器配方任务
	if nSkillGenre == 1 and nSkillDetail ~= 8 and nSkillLevel >= 79 and GetTask(1600) == 0 and GetTask(1602) == 0 and GetTask(1603) == 0 and GetTask(1604) == 0 and GetTask(1605) == 0 then 
		weapon_76_recipe_tip(nSkillDetail);
	end
	
	Say("B筺 ch璦  甶襲 ki謓 nh薾 nhi謒 v� ph鑙 ch� c蕄 76.", 0)
end;


-- 补学76级配方
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 8)
	if (nGene == 1 and nSkillID == 8) then
		if (GetTask(1605) == 3 and nLevel >= 79) then
			AddRecipe(808)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: X輈h � Linh Ph�")
		else
			Say("B筺 ch璦 l祄 nhi謒 v� ph鑙 ch� c蕄 76", 0)
		end
	else
		Say("B筺 ch璦 h鋍 k� n╪g: <color=yellow>Luy謓 b颽<color>!", 0)
	end
end;

-- 遗忘生活技能
function forget_life_skill()
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 8) then
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
			"Khoan ! Ch� ta suy ngh� l筰!/SayHello")
	else
		Say(strTitle.."Ngi ch璦 h鋍 k� n╪g luy謓 b颽? Ta kh玭g th� gi髉 ngi!", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- 主技能
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 8) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 8)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(515, 0)
				SetTask(1601, 0);--清空79级武器配方任务
				SetTask(1605, 0);--清空79级武器配方任务
				Msg2Player("B筺  b� k� n╪g luy謓 b颽")				
			end
		else
			Say(strTitle.."Ngi kh玭g mang theo  ti襫! L蕐 ti襫 r錳 h穣 n nh�!", 0)
		end
	end
end;

----------------------------------------时间判定脚本----------------------------------------
--返回星期几，0代表星期天
function GetWeekDay()
	return tonumber(date("%w"))
end;
--返回当前小时和分钟
function GetLocalTime()
	nHour = date("%H")
	nMin = date("%M")
	return tonumber(nHour), tonumber(nMin)
end;
--19 - 23点59分
function CheckTime(day)
	if (WEEKEND_SWITCH == 0) then
		return 0
	end
	if (day ~= GetWeekDay()) then
		return 0
	end
	--换算19:00 - 24:00是什么区间
	local nBegin = 19 * 60
	local nEnd = 24 * 60
	local nHour, nMin = GetLocalTime()
	local nValue = nHour * 60 + nMin
	if (nValue >= nBegin and nValue <= nEnd) then
		return 1
	else
		return 0
	end
end;


----------------------------技能学习选择--------------------------
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
    	Say (strTitle.."B筺 kh玭g  <color=yellow>c蕄 10<color> ch�?th� h鋍 k� n╪g s鑞g.", 0)
    	return
	end
	
    if (GetLifeSkillsNum(1) == 2) then
		Say (strTitle.."B籲g h鱱  h鋍 k� n╪g s秐 xu蕋, mu鑞 h鋍 k� n╪g m韎 c莕 ph秈 b� k� n╪g c�.", 0)
    	return
    end
    
	Say(strTitle.."B籲g h鱱 mu鑞 h鋍 k� n╪g <color=yellow>luy謓 b颽<color>?",
    	2,
    	"Ta mu鑞 h鋍/LearnYes",
    	"в ta suy ngh� l筰/LearnNo")
end;
--学习技能
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
    	if LearnLifeSkill(1, 8, 1, 79, 1) then
        	AddItem(2, 1, 901, 30)
        	Msg2Player("H鋍 頲 k� n╪g s鑞g: Ch� ph� v� nh薾 頲 30 Bi謓 kinh th筩h.")
	    end
    
    		AddRecipe(36)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H錳 ph� Bi謓 Kinh")
    		AddRecipe(37)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H錳 ph� Th祅h Й")
    		AddRecipe(38)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H錳 ph� Tuy襫 Ch﹗")
    	SetTask(LEV_LEARNRECIPE, 10)
    	
	else
		Say(strTitle.."B筺  h鋍 k� n╪g s鑞g, kh玭g th� h鋍 th猰 k� n╪g kh竎.", 0)
	end
end;
--取消学习技能
function LearnNo()
    Say (strTitle.."H穣 suy ngh� k� r錳 quay l筰 y nh�!", 0)
end

--学习新的配方
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 8)
	if (GetLifeSkillLevel(1, 8) >= 1) then
		if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
    		AddRecipe(36)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H錳 ph� Bi謓 Kinh")
    		AddRecipe(37)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H錳 ph� Th祅h Й")
    		AddRecipe(38)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H錳 ph� Tuy襫 Ch﹗")
    		SetTask(LEV_LEARNRECIPE, 10)
    	elseif (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
	    	AddRecipe(29)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Gi竚 nh ph� (c蕄 1)")
    		AddRecipe(39)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H錳 ph� Tng Dng")    		
    		AddRecipe(226)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H錳 ph� Dng Ch﹗")
        	SetTask(LEV_LEARNRECIPE,20)
    	elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
        	AddRecipe(30)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Gi竚 nh ph� (c蕄 2)")
        	AddRecipe(41)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Чi L� H錳 ph�")
        	SetTask(LEV_LEARNRECIPE,30)
    	elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
        	AddRecipe(31)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Gi竚 nh ph� (c蕄 3)")
        	AddRecipe(947)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� ng H錳 ph�")
        	AddRecipe(948)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C竔 Bang H錳 ph�")
        	AddRecipe(949)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi誹 L﹎ H錳 ph�")
        	AddRecipe(950)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Nga My H錳 ph�")
        	AddRecipe(952)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Л阯g M玭 H錳 ph�")
        	AddRecipe(953)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng� чc H錳 ph�")
        	AddRecipe(954)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Dng M玭 H錳 ph�")          	 
        	SetTask(LEV_LEARNRECIPE,40)
    	elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
        	AddRecipe(32)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Gi竚 nh ph� (c蕄 3)")
        	SetTask(LEV_LEARNRECIPE,50)
    	elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
        	AddRecipe(33)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Gi竚 nh ph� (c蕄 5)")
        	SetTask(LEV_LEARNRECIPE,60)
    	elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
        	AddRecipe(34)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Gi竚 nh ph� (c蕄 6)")
        	AddRecipe(951)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T藀 linh ph�")
        	SetTask(LEV_LEARNRECIPE,70)
    	elseif (nLevel >= 70 and GetTask(LEV_LEARNRECIPE) == 70) then
        	AddRecipe(35)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Gi竚 nh ph� (c蕄 7)")
        	SetTask(LEV_LEARNRECIPE,80)
    	else
        	Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!", 0)
    	end
    end
end;

--对技能的说明信息
function Weekend()
    if (GetLifeSkillLevel(1, 8) >= 1 and 
    	(CheckTime(0) == 1 or CheckTime(5) == 1 or CheckTime(6) == 1)) then
    	Say(strTitle.."Tu莕 l� ho祅g kim  n, ta y c� phng ph竝 ph鑙 ch� c bi謙 l祄 頲 gi蕐 b颽 qu﹏ d鬾g r蕋 c� 輈h cho ti襫 tuy課!", 0)
    	AddRecipe(231)
    	Msg2Player("B筺 h鋍 頲 c竎h ph鑙 ch� m韎 - Gi蕐 b颽 qu﹏ d鬾g!")
    else
    	Say(strTitle.."Ngi ch璦 h鋍 luy謓 b颽 ho芻 ch璦 ng l骳 n猲 ta kh玭g th� truy襫 th�.", 0)
    end
end

--取消函数
function SayHello()
end

--修复配方
function Reset_Learn()
	if (GetLifeSkillLevel(1, 8) >= 1) then
		SetTask(LEV_LEARNRECIPE, 0)
		Talk(1, "", strTitle.."Ph鑙 ch� c馻 ngi  頲 tu s鯽, m鏸 10 c蕄 c� th� h鋍 c竎h ph鑙 ch� m韎.")
		return	
	else
		Talk(1, "", strTitle.."ng h遪g g箃 ta!")
	end
end

--补新的配方
function luaResLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 8)
	if (GetLifeSkillLevel(1, 8) >= 1) then
		if (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 40) then
        	AddRecipe(947)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� ng H錳 ph�")
        	AddRecipe(948)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C竔 Bang H錳 ph�")
        	AddRecipe(949)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi誹 L﹎ H錳 ph�")
        	AddRecipe(950)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Nga My H錳 ph�")
        	AddRecipe(952)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Л阯g M玭 H錳 ph�")
        	AddRecipe(953)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng� чc H錳 ph�")
        	AddRecipe(954)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Dng M玭 H錳 ph�") 
    	elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 50) then
        	AddRecipe(947)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� ng H錳 ph�")
        	AddRecipe(948)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C竔 Bang H錳 ph�")
        	AddRecipe(949)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi誹 L﹎ H錳 ph�")
        	AddRecipe(950)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Nga My H錳 ph�")
        	AddRecipe(952)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Л阯g M玭 H錳 ph�")
        	AddRecipe(953)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng� чc H錳 ph�")
        	AddRecipe(954)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Dng M玭 H錳 ph�") 
    	elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 60) then
        	AddRecipe(947)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� ng H錳 ph�")
        	AddRecipe(948)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C竔 Bang H錳 ph�")
        	AddRecipe(949)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi誹 L﹎ H錳 ph�")
        	AddRecipe(950)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Nga My H錳 ph�")
        	AddRecipe(952)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Л阯g M玭 H錳 ph�")
        	AddRecipe(953)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng� чc H錳 ph�")
        	AddRecipe(954)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Dng M玭 H錳 ph�") 
        	AddRecipe(951)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T藀 linh ph�")        	
    	elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 70) then
        	AddRecipe(947)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� ng H錳 ph�")
        	AddRecipe(948)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C竔 Bang H錳 ph�")
        	AddRecipe(949)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi誹 L﹎ H錳 ph�")
        	AddRecipe(950)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Nga My H錳 ph�")
        	AddRecipe(952)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Л阯g M玭 H錳 ph�")
        	AddRecipe(953)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng� чc H錳 ph�")
        	AddRecipe(954)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Dng M玭 H錳 ph�") 
        	AddRecipe(951)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T藀 linh ph�")
    	elseif (nLevel >= 70 and GetTask(LEV_LEARNRECIPE) == 80) then
        	AddRecipe(947)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V� ng H錳 ph�")
        	AddRecipe(948)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C竔 Bang H錳 ph�")
        	AddRecipe(949)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi誹 L﹎ H錳 ph�")
        	AddRecipe(950)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Nga My H錳 ph�")
        	AddRecipe(952)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Л阯g M玭 H錳 ph�")
        	AddRecipe(953)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng� чc H錳 ph�")
        	AddRecipe(954)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Dng M玭 H錳 ph�") 
        	AddRecipe(951)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: T藀 linh ph�")
    	else
        	Say(strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!", 0)
    	end
    end
end;

function Huan_Fushi()
	if GetItemCount(0,200,29)>0 then 
		Say("Ngi c� mu鑞 i Bi謓 Kinh Th筩h kh玭g?",
		2,
		"ng v藋, ta mu鑞 i /Bianjingzhuanhuan",
		"в ta suy ngh� l筰!/SayHello"
		)
	elseif GetItemCount(0,200,30)>0 then 
		Say("Ngi c� mu鑞 i Th祅h Й Th筩h kh玭g?",
		2,
		"ng v藋, ta mu鑞 i /Chengduzhuanhuan",
		"в ta suy ngh� l筰!/SayHello"
		)
	elseif GetItemCount(0,200,31)>0 then 
		Say("Ngi c� mu鑞 i Tuy襫 Ch﹗ Th筩h kh玭g?",
		2,
		"ng v藋, ta mu鑞 i /Quanzhouzhuanhuan",
		"в ta suy ngh� l筰!/SayHello"
		)
	elseif GetItemCount(0,200,32)>0 then 
		Say("Ngi c� mu鑞 i Tng Dng Th筩h kh玭g?",
		2,
		"ng v藋, ta mu鑞 i /Xiangyangzhuanhuan",
		"в ta suy ngh� l筰!/SayHello"
		)
	elseif GetItemCount(0,200,34)>0 then 
		Say("Ngi c� mu鑞 i Чi L� Th筩h kh玭g?",
		2,
		"ng v藋, ta mu鑞 i /Dalizhuanhuan",
		"в ta suy ngh� l筰!/SayHello"
		)
	elseif GetItemCount(0,200,35)>0 then 
		Say("Ngi c� mu鑞 i Dng Ch﹗ Th筩h kh玭g?",
		2,
		"ng v藋, ta mu鑞 i /Yangzhouzhuanhuan",
		"в ta suy ngh� l筰!/SayHello"
		)
	else Say("Ngi kh玭g mang theo t蕀 Ph� Th筩h c� �? Hay l� b� qu猲 ch� th� kh� r錳.",
		1,
		"в ta 甶 l蕐!/SayHello"
		)		
	end;
end;

function Bianjingzhuanhuan()
		DelItem(0,200,29,1)
		AddItem(2,1,901,20)
end;

function Chengduzhuanhuan()
		DelItem(0,200,30,1)
		AddItem(2,1,902,20)
end;

function Quanzhouzhuanhuan()
		DelItem(0,200,31,1)
		AddItem(2,1,903,20)
end;

function Xiangyangzhuanhuan()
		DelItem(0,200,32,1)
		AddItem(2,1,904,20)
end;

function Dalizhuanhuan()
		DelItem(0,200,34,1)
		AddItem(2,1,906,20)
end;

function Yangzhouzhuanhuan()
		DelItem(0,200,35,1)
		AddItem(2,1,907,20)
end;