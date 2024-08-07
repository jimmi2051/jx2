-- =========================================
-- File : 中原二区，成都，游方医生.lua
-- Name : 游方医生
-- ID   : 1, 6
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************定义常量及预处理***************************************
ID_LEARNLIFESKILL		= 1925		-- 新手任务变量
LEV_LEARNRECIPE			= 1926		-- 配方学习任务变量
TASK49_BEGGING			= 1933		-- 晋级任务开始
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
    if (GetTask(ID_LEARNLIFESKILL) > 3 and GetTask(ID_LEARNLIFESKILL) < 15) then
		SetTask(ID_LEARNLIFESKILL, 0)
		TaskTip("  gi髉 b筺 s鯽 nhi謒 v� T﹏ Th�-k� n╪g s鑞g, xin h穣 b総 u l筰.")
		return
	end
    if (GetLevel() < 10) then
		Say(strTitle.."B筺 tr�! Mu鑞 h鋍 k� n╪g s鑞g? Ch� ngi t n c蕄 10 h穣 quay l筰 t譵 ta!", 0)
		return
    elseif (GetTask(ID_LEARNLIFESKILL) >= 0 and GetTask(ID_LEARNLIFESKILL) < 15 and GetLevel() >= 10) then
		Talk(2, "NewLifeSkills", 
			 strTitle.."дn r錳 �? Mu鑞 ra giang h� c莕 ph秈 h鋍 h醝 nhi襲. Ta s� ch� cho ngi nh鱪g k� n╪g c� b秐, trc ti猲 l� k� n╪g s秐 xu蕋 g錷: <color=yellow>Ch� t筼 binh kh� d礽, ch� t筼 binh kh� ng緉, ch� t筼 k� m玭 binh kh�, may h� gi竝, may trang ph鬰, may n鉵, n蕌 nng, luy謓 n v� ch� ph�<color>.",
			 strTitle.."Ch� t筼 v藅 ph萴 c莕 ph秈 c� k� n╪g v� nguy猲 li謚. Ch� t筼 3 lo筰 <color=yellow>Binh kh�<color> c莕 k誸 h頿 v韎 c竎 k� n╪g<color=yellow>цn c﹜<color> v� <color=yellow>Уo kho竛g<color>  cung c蕄 nguy猲 li謚. Ch� t筼 <color=yellow>H� gi竝, Trang ph鬰 v� N鉵<color> c莕 k誸 h頿 k� n╪g <color=yellow>Thu閏 da <color> v� <color=yellow>K衞 t�<color>. Mu鑞 <color=yellow>N蕌 nng<color> c莕 ph秈 bi誸 <color=yellow>Canh t竎<color>  l祄 ra nguy猲 li謚. Mu鑞 <color=yellow>Luy謓 n<color> c莕 k� n╪g <color=yellow>H竔 thu鑓<color>. <color=yellow>Ch� ph�<color> ph秈 bi誸 <color=yellow>T藀 Linh<color>  cung c蕄 nguy猲 li謚.")
		if (GetTask(ID_LEARNLIFESKILL) == 0) then
			SetTask(ID_LEARNLIFESKILL, 1)
			TaskTip("B筺 h穣 n Tuy襫 Ch﹗ t譵 L� Phong Thu")
		end
		return
    end
    
--------------------------------------------主对话-------------------------------------------
	Say(strTitle.."Ta ch輓h l� Du Phng i phu n鎖 danh thi猲 h�, tinh th玭g y thu藅, kh玭g bi誸 ta c� th� gi髉 g�?",
		4,
		"H鋍 k� n╪g Ch� dc/luaLearnLifeSkill",
		"H鋍 c竎h ph鑙 ch� ho芻 l祄 nhi謒 v� ph鑙 ch�/learn_all_recipe",
		"H駓 k� n╪g Ch� dc/forget_life_skill",
		"R阨 kh醝/SayHello")
end;


-- 所有配方相关的事情
function learn_all_recipe()
	Say(strTitle.."Ngi mu鑞 h鋍 c竎h ph鑙 ch� ho芻 l祄 nhi謒 v� ph鑙 ch�?",
		5,
		"H鋍 c竎h ph鑙 ch� m韎/luaLearnRecipe",
		"H鋍 c竎h ph鑙 ch� d祅h cho ho箃 ng cu鑙 tu莕/Weekend",
		"Xem nh薾 頲 nhi謒 v� v� kh� c蕄 76 kh玭g/get_76_task",
		"H鋍 c竎h ph鑙 ch� c蕄 76/relearn_76_recipe",
		"R阨 kh醝/SayHello")
end;


-- 接受76级配方任务
function get_76_task()
----------------------------------76级武器配方黑钨精石任务----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_heiwu = GetTask(TASK_MEDICINE_HEIWU)
		
	if nSkillGenre == 1 and nSkillDetail == 6 and nSkillLevel >= 79 then
		--尚未触发配方任务
		if nTaskState_heiwu == 0 then
			medicine_heiwu_001()
			return
		--上交药品
		elseif nTaskState_heiwu == 1 then
			medicine_heiwu_002()
			return
		--未与代矿工对话
		elseif nTaskState_heiwu == 2 then
			medicine_heiwu_004()
			return
		--学会黑钨精石配方
		elseif nTaskState_heiwu == 4 then
			medicine_heiwu_009()
			return
		end 
	end
		
	--提示玩家76级武器配方任务
	if nSkillGenre == 1 and nSkillDetail ~= 6 and nSkillLevel >= 79 and GetTask(1600) == 0 and GetTask(1602) == 0 and GetTask(1603) == 0 and GetTask(1604) == 0 and GetTask(1605) == 0 then 
		weapon_76_recipe_tip(nSkillDetail);
	end
	
	Say("B筺 ch璦  甶襲 ki謓 nh薾 nhi謒 v� ph鑙 ch� c蕄 76.", 0)
end;


-- 补学76级配方
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 6)
	if (nGene == 1 and nSkillID == 6) then
		if (GetTask(1602) == 5 and nLevel >= 79) then
			AddRecipe(805)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 � Tinh Th筩h")
		else
			Say("B筺 ch璦 ho祅 th祅h nhi謒 v� ph鑙 ch� c蕄 76 c馻 k� n╪g Ch� dc!", 0)
		end
	else
		Say("B筺 ch璦 h鋍 k� n╪g: <color=yellow>Ch� dc<color>!", 0)
	end
end;


-- 遗忘生活技能
function forget_life_skill()
	if (GetLifeSkillLevel(1, 6) > 0) then
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
		Say(strTitle.."Ngi ch璦 h鋍 k� n╪g Ch� dc! Ta kh玭g th� gi髉 ngi.", 0)
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
	
	if (GetLifeSkillLevel(1, 6) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 6)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(LEVELTASKID49, 0)
				SetTask(RESET_ERROR, 0)
				SetTask(1602, 0);						--清空79级武器配方任务
				Msg2Player("K� n╪g Ch� dc c馻 b筺  h駓.")				
			end
		else
			Say(strTitle.."Ngi kh玭g mang theo  ti襫! L蕐 ti襫 r錳 h穣 n nh�!", 0)
		end
	end
end;





 ------------------------------------------时间判定--------------------------------------------
 --返回星期几，0代表星期天
function GetWeekDay()
	return tonumber(date("%w"))
end;

--返回当前小时和分钟
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--19 - 23点59分
function CheckTime(day)
	--活动开关
	if WEEKEND_SWITCH == 0 then
		return 0
	end;
	if day ~= GetWeekDay() then
		return 0
	end;

	--换算19:00 - 24:00是什么区间
	local nBegin = 19 * 60;
	local nEnd = 24 * 60;
	
	local nHour, nMin = GetLocalTime();
	local nValue = nHour * 60 + nMin;
	if nValue >= nBegin and nValue <= nEnd then
		return 1
	else
		return 0
	end
end;


--**********************************************技能学习部分***************************************
--技能学习选择
function luaLearnLifeSkill()
	if (GetLevel() < 10) then
		Say (strTitle.."B筺 kh玭g  <color=yellow>c蕄 10<color> ch�?th� h鋍 k� n╪g s鑞g.",0)
		return
	end

    if (GetLifeSkillsNum(1) == 2) then
        Say(strTitle.."B籲g h鱱  h鋍 k� n╪g s秐 xu蕋, mu鑞 h鋍 k� n╪g m韎 c莕 ph秈 b� k� n╪g c�.", 0)
    	return
	end
    
	Say(strTitle.."<color=yellow>L祄 thu鑓<color> l� k� n╪g s鑞g m韎 c馻 b筺, b筺 x竎 nh薾 mu鑞 h鋍?",
    	2,
    	"Ta mu鑞 h鋍/LearnYes",
    	"в ta suy ngh� l筰/LearnNo")
end

--学习技能
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
    	if (LearnLifeSkill(1, 6, 1, 79, 1)) then
        	Msg2Player("B筺  h鋍 k� n╪g s鑞g: ch� thu鑓 v� nh薾 頲 m閠 輙 nguy猲 li謚 s� c蕄.")
        	AddItem(1,2,8,9)
        	AddItem(1,2,1,3)
	   		
	   		AddRecipe(3)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim S竛g t竛")
        	AddRecipe(8)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ti觰 Ho祅 n")
    	    SetTask(LEV_LEARNRECIPE,10)
		end
	else
		Say(strTitle.."B筺  h鋍 k� n╪g s鑞g, kh玭g th� h鋍 th猰 k� n╪g kh竎.", 0)
	end
end;
--取消学习技能
function LearnNo()
    Say(strTitle.."H穣 suy ngh� k� r錳 quay l筰 y nh�!", 0)
end

--**********************************************配方学习部分***************************************
--学习新的配方
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 6)
	if (nLevel >= 1) then
		if GetTask(LEV_LEARNRECIPE)>=20 and HaveLearnRecipe(234)==0 then
			AddRecipe(234)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B筩h Nh藅 n")
            AddRecipe(239)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 輈h Dng t竛")
            AddRecipe(244)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Gi秈 чc n")
		elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B筩h Nh藅 n")
            AddRecipe(239)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 輈h Dng t竛")
            AddRecipe(244)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Gi秈 чc n")
            AddRecipe(235)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: To祅 Sinh n")
            AddRecipe(245)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ch� Th駓 n")
        elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(234)==0 then
        	AddRecipe(234)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B筩h Nh藅 n")
            AddRecipe(239)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 輈h Dng t竛")
            AddRecipe(244)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Gi秈 чc n")
            AddRecipe(235)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: To祅 Sinh n")
            AddRecipe(245)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ch� Th駓 n")
            AddRecipe(240)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Kim t竛")
            AddRecipe(246)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B礽 V﹏ n")
		elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B筩h Nh藅 n")
            AddRecipe(239)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 輈h Dng t竛")
            AddRecipe(244)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Gi秈 чc n")
            AddRecipe(235)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: To祅 Sinh n")
            AddRecipe(245)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ch� Th駓 n")
            AddRecipe(240)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Kim t竛")
            AddRecipe(246)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B礽 V﹏ n")
            AddRecipe(236)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Chi猽 H錸 n")
            AddRecipe(241)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B� Thi猲 t竛")
        elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B筩h Nh藅 n")
            AddRecipe(239)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 輈h Dng t竛")
            AddRecipe(244)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Gi秈 чc n")
            AddRecipe(235)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: To祅 Sinh n")
            AddRecipe(245)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ch� Th駓 n")
            AddRecipe(240)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Kim t竛")
            AddRecipe(246)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B礽 V﹏ n")
            AddRecipe(236)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Chi猽 H錸 n")
            AddRecipe(241)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B� Thi猲 t竛")
            AddRecipe(237)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng� D辌h n")
            AddRecipe(247)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C祅 Nguy猲 Ch輓h Kh� n")
        elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B筩h Nh藅 n")
            AddRecipe(239)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 輈h Dng t竛")
            AddRecipe(244)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Gi秈 чc n")
            AddRecipe(235)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: To祅 Sinh n")
            AddRecipe(245)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ch� Th駓 n")
            AddRecipe(240)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Kim t竛")
            AddRecipe(246)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B礽 V﹏ n")
            AddRecipe(236)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Chi猽 H錸 n")
            AddRecipe(241)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B� Thi猲 t竛")
            AddRecipe(237)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng� D辌h n")
            AddRecipe(247)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C祅 Nguy猲 Ch輓h Kh� n")
            AddRecipe(242)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th蕋 Tr飊g Th蕋 Hoa t竛")
        elseif GetTask(LEV_LEARNRECIPE)==80 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B筩h Nh藅 n")
            AddRecipe(239)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 輈h Dng t竛")
            AddRecipe(244)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Gi秈 чc n")
            AddRecipe(235)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: To祅 Sinh n")
            AddRecipe(245)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ch� Th駓 n")
            AddRecipe(240)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Kim t竛")
            AddRecipe(246)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B礽 V﹏ n")
            AddRecipe(236)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Chi猽 H錸 n")
            AddRecipe(241)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B� Thi猲 t竛")
            AddRecipe(237)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng� D辌h n")
            AddRecipe(247)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C祅 Nguy猲 Ch輓h Kh� n")
            AddRecipe(242)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th蕋 Tr飊g Th蕋 Hoa t竛")
            AddRecipe(238)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B玭 Tinh Nguy謙 Кn")
            AddRecipe(243)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Чi Nh藅 Dng T竛")
            AddRecipe(248)
            Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Vng B� T﹎ n")    
		elseif nLevel>=1 and GetTask(LEV_LEARNRECIPE)==0 then
       		AddRecipe(3)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Kim S竛g t竛")
        	AddRecipe(8)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ti觰 Ho祅 n")
    	    SetTask(LEV_LEARNRECIPE,10)
        elseif nLevel>=10 and GetTask(LEV_LEARNRECIPE)==10 then
        	AddRecipe(4)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ch� Huy誸 t竛")
        	AddRecipe(13)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thanh T﹎ t竛")
        	AddRecipe(234)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B筩h Nh藅 n")
        	AddRecipe(239)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 輈h Dng t竛")
        	AddRecipe(244)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Gi秈 чc n")
        	SetTask(LEV_LEARNRECIPE,20)
    	elseif nLevel>=20 and GetTask(LEV_LEARNRECIPE)==20 then
        	AddRecipe(9)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ho祅 Dng n")
        	AddRecipe(14)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: 輈h Kh� t竛")
        	AddRecipe(235)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: To祅 Sinh n")
        	AddRecipe(245)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ch� Th駓 n")
        	SetTask(LEV_LEARNRECIPE,30)
    	elseif nLevel>=30 and GetTask(LEV_LEARNRECIPE)==30 then
        	AddRecipe(5)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B筩h V﹏ t竛")
        	AddRecipe(240)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Kim t竛")
        	AddRecipe(246)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B礽 V﹏ n")
        	SetTask(LEV_LEARNRECIPE,40)
    	elseif nLevel>=40 and GetTask(LEV_LEARNRECIPE)==40 then
        	AddRecipe(10)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Чi Ho祅 n")
        	AddRecipe(15)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng鋍 Linh t竛")
        	AddRecipe(236)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Chi猽 H錸 n")
        	AddRecipe(241)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B� Thi猲 t竛")
        	SetTask(LEV_LEARNRECIPE,50)
    	elseif nLevel>=50 and GetTask(LEV_LEARNRECIPE)==50 then
        	AddRecipe(6)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Hng C萴 T鬰")
        	AddRecipe(11)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Nh蕋 Nguy猲 Ph鬰 Th駓 n")
        	AddRecipe(237)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng� D辌h n")
        	AddRecipe(247)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: C祅 Nguy猲 Ch輓h Kh� n")
        	SetTask(LEV_LEARNRECIPE,60)
    	elseif nLevel>=60 and GetTask(LEV_LEARNRECIPE)==60 then
        	AddRecipe(16)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Ng� Hoa Ng鋍 L� Ho祅")
        	AddRecipe(7)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: H綾 Ng鋍 筺 T鬰 cao")
        	AddRecipe(12)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: V筺 V藅 Quy Nguy猲 n")
        	AddRecipe(242)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Th蕋 Tr飊g Th蕋 Hoa t竛")
        	SetTask(LEV_LEARNRECIPE,70)
      	elseif nLevel>=70 and GetTask(LEV_LEARNRECIPE)==70 then
	    	AddRecipe(17)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Sinh Sinh H鉧 T竛")
        	AddRecipe(238)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B玭 Tinh Nguy謙 Кn")
        	AddRecipe(243)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Чi Nh藅 Dng T竛")
        	AddRecipe(248)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Vng B� T﹎ n")
        	SetTask(LEV_LEARNRECIPE,80)
       	elseif GetTask(LEV_LEARNRECIPE)==80 and HaveLearnRecipe(238)==0 then
        	AddRecipe(238)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: B玭 Tinh Nguy謙 Кn")
        	AddRecipe(243)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Чi Nh藅 Dng T竛")
        	AddRecipe(248)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch�: Thi猲 Vng B� T﹎ n")
    	else
        	Say (strTitle..": ng qu� n玭 n鉵g, kinh nghi謒 giang h� ngi c遪 k衜 l緈, c� g緉g th猰 nh�!",0)
      	end
    end
end;


--对技能的说明信息
function Weekend()
    if (GetLifeSkillLevel(1,6) >= 1 and 
    	(CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1)) then
    	Talk(1,"",strTitle.."Ph輆 trc 產ng chi課 tranh, ta s� truy襫 cho v礽 c竎h ch� thu鑓  ngi l祄 thu鑓 gi髉 c竎 binh s� tr� thng!")
    	AddRecipe(232)
    	Msg2Player("B筺  h鋍 ph鑙 phng m韎--Qu﹏ D鬾g Y Dc!")
    else
    	Say(strTitle.."Ngi ch璦 h鋍 k� n╪g Ch� dc ho芻 th阨 gian ch璦 n, ta kh玭g th� truy襫 th� phng ph竝 ph鑙 ch� cho ngi.", 0)
    end
end

--取消函数
function SayHello()
end

function NewLifeSkills()
	Talk(2, "",
		 strTitle.."X璦 c� Can Tng M筩 T� x� th﹏ r蘮 ki誱. Ngi mu鑞 c th祅h m閠 m鉵 kh秈 gi竝 tuy謙 th� ho芻 th莕 binh, cho d� ngi c� ph鑙 phng c nh蕋 v� nh� ch� d鵤 v祇 nguy猲 li謚 ph� th玭g kh玭g th� l祄 ra trang b� t鑤. Trong qu� tr譶h l祄 ngi c莕 ph秈 cho v祇 m閠 s� <color=yellow>v藅 li謚<color> v韎 ch駈g lo筰 v� s� lng kh竎 nhau, nh� th� m韎 c� th� l祄 ra c鵦 ph萴. Ngi h穣 nh� t鑙 產 ch� c� th� th猰 v祇 <color=yellow>10 lo筰<color> v藅 li謚.",
		 "Л頲 r錳! L穙 y tin r籲g ngi  hi觰 bi誸 ch髏 輙 v� k� n╪g s秐 xu蕋, m鏸 ngi <color=yellow>ch� c� th� h鋍 m閠 k� n╪g s秐 xu蕋<color>. Gi� ngi h穣 n <color=yellow>Tuy襫 Ch﹗ t譵 L� Phong Thu<color>, nguy猲 nh﹏ th� n  kh綾 bi誸.")
	return
end;

