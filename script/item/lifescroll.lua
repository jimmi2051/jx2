-- =========================================================
-- File: 生活手札的脚本
-- Name: lifescroll.lua
-- ID:   2, 19, 1
-- Desc: 将已经学习了的生活技能记录在生活手札上面，或者使用以后学会生活手札上面的生活技能
-- Creator: Tony(Jizheng)
-- Date: Aug 28th, 2006
-- =========================================================

strTabMainSkill = {"K� ngh� gia truy襫", "Ch� t筼 binh kh� d礽", "Ch� t筼 binh kh� ng緉", "Ch� t筼 k� m玭 binh kh�", 
				   "L祄 h� gi竝", "Ch� thu鑓", "N蕌 nng", "Ch� ph�", "H� trang", "u qu竛"}
							 
strTabSubSkill = {"цn c﹜", "L祄 da", "Canh t竎",	"H竔 thu鑓", "Уo kho竛g", "K衞 t�", "T藀 linh"}


-- 使用物品的时候，默认的入口函数
function OnUse(nIdx)
	local nScrollIndex = tonumber(nIdx)		-- 被使用的生活手札的Index
	local nLifeSkillType, nLifeSkillID, nLifeSkillLevel, nLifeSkillExp = GetLifeScrollInfo(nScrollIndex)
	
	-- 如果已经存了生活技能的卷轴
	if (nLifeSkillID > 0) then
		local strSayPrefix = "B筺 ph秈 s� d鬾g s� tay s鑞g, h鋍 k� n╪g <color=yellow>"
		local strSaySuffix = "<color>, k� n╪g t: <color=yellow>"..nLifeSkillLevel.."<color>, 甶觤 kinh nghi謒 hi謓 t筰 l�: <color=yellow>"..nLifeSkillExp.."<color>. X竎 nh ch�?"
		local strSay
		if (nLifeSkillType == 0) then
			strSay = strSayPrefix..strTabSubSkill[nLifeSkillID]..strSaySuffix
		else
			strSay = strSayPrefix..strTabMainSkill[nLifeSkillID]..strSaySuffix
		end
		
		Say(strSay,
			2,
			"H鋍 k� n╪g/#learn_skill("..nScrollIndex..")",
			"Suy ngh� l筰/exit_dialog")
		
	-- 如果是个空的卷轴
	else
		EnterCatchLifeSkill(nScrollIndex)	-- 通知界面进入取下生活技能的状态
	end
end;

-- 将生活技能取下来以后，默认的回调函数
function OnCatchLifeSkill()
	local nLifeSkillType, nLifeSkillID = QueryCatchLifeSkill()
	-- 如果有需要取下的生活技能
	if (nLifeSkillID > 0) then
		if (nLifeSkillType == 1 and nLifeSkillID == 1) then
			Say("<color=yellow>K� n╪g giang h�<color> kh玭g th� h鋍 t飝 ti謓!", 0)
		end
		
		if (nLifeSkillType == 0) then
			Say("B筺 x竎 nh薾 mu鑞 h鋍 k� n╪g thu th藀: <color=yellow>"..strTabSubSkill[nLifeSkillID].."<color> v� s� d鬾g s� tay s鑞g kh玭g?",
				2,
				"X竎 nh薾/catch_life_skill",
				"T筸 th阨 kh玭g mu鑞 h鋍/exit_dialog")
		else
			Say("B筺 x竎 nh薾 mu鑞 h鋍 k� n╪g s秐 xu蕋: <color=yellow>"..strTabMainSkill[nLifeSkillID].."<color> v� s� d鬾g s� tay s鑞g kh玭g?",
				2,
				"X竎 nh薾/catch_life_skill",
				"T筸 th阨 kh玭g mu鑞 h鋍/exit_dialog")
		end
	end
end;

-- 正式将生活技能存入卷轴中
function catch_life_skill()
	local nLifeSkillType, nLifeSkillID = QueryCatchLifeSkill()
	if (MakeALifeScroll() == 1) then
		if (nLifeSkillType == 1 and (nLifeSkillID == 5 or nLifeSkillID == 9 or nLifeSkillID == 10)) then	-- 护甲制造补偿图纸
			pay_back_blueprints()
		end
		if (nLifeSkillType == 1 and (nLifeSkillID == 2 or nLifeSkillID == 3 or nLifeSkillID == 4)) then		-- 武器补偿
			pay_back_weaponprints()
		end
		clean_task_values(nLifeSkillType, nLifeSkillID)
		AbandonLifeSkill(nLifeSkillType, nLifeSkillID)
		if (nLifeSkillType == 0) then
			Say("B筺  h鋍 頲 k� n╪g thu th藀: <color=yellow>"..strTabSubSkill[nLifeSkillID].."<color> v� s� d鬾g 頲 s� tay s鑞g.", 0)
		else
			Say("B筺  h鋍 頲 k� n╪g s秐 xu蕋: <color=yellow>"..strTabMainSkill[nLifeSkillID].."<color> v� s� d鬾g 頲 s� tay s鑞g.", 0)
		end
	end
end;


-- 什么都不做的空函数
function exit_dialog()
end;

-- 确认要学习生活技能
function learn_skill(nScrollIndex)
	local nScrollItemIdx = tonumber(nScrollIndex)
	local nLifeSkillType, nLifeSkillID, nLifeSkillLevel, nLifeSkillExp = GetLifeScrollInfo(nScrollItemIdx)

	-- 检查是否新手
	if (GetLevel() < 10 or GetTask(1925) ~= 15) then
		Say("B筺 c莕 ph秈 t n c蕄 10 v� ho祅 th祅h nhi謒 v� t﹏ th� m韎 c� th� h鋍 k� n╪g s鑞g!", 0)
		return
	end

	-- 检查是否学过了	
	if (nLifeSkillType ~= 0) then		-- 是辅技能，检查有没有学过一样的技能
	--	if (GetLifeSkillLevel(nLifeSkillType, nLifeSkillID) > 0) then
	--		Say("你已经学会了这个采集技能，要重新学习，必须遗忘或者取下当前生活技能：<color=yellow>"..strTabSubSkill[nLifeSkillID].."<color>！", 0)
	--		return
	--	end
	--else								-- 是主技能，检查有没有学过任何一个主技能
		if (GetLifeSkillsNum(1) >= 2) then
			Say("B筺  h鋍 k� n╪g s秐 xu蕋! Mu鑞 h鋍 k� n╪g s秐 xu蕋 m韎, ph秈 x鉧 甶 ho芻 h鋍 l筰 k� n╪g s秐 xu蕋 v鑞 c�!", 0)
			return
		end
	end
	
	-- 如果成功删除了指定卷轴
	if (DelItemByIndex(nScrollItemIdx, 1) == 1) then
		if (nLifeSkillLevel <= 79) then
			LearnLifeSkill(nLifeSkillType, nLifeSkillID, nLifeSkillLevel, 79, nLifeSkillType)
		else
			LearnLifeSkill(nLifeSkillType, nLifeSkillID, nLifeSkillLevel, 99, nLifeSkillType)
		end
		AddLifeSkillExp(nLifeSkillType, nLifeSkillID, nLifeSkillExp)
		
		if (nLifeSkillType == 0) then
			Say("B筺  h鋍 th祅h c玭g k� n╪g s鑞g: <color=yellow>"..strTabSubSkill[nLifeSkillID].."<color>. Xin ch骳 m鮪g!", 0)
		else
			Say("B筺  h鋍 th祅h c玭g k� n╪g s鑞g: <color=yellow>"..strTabMainSkill[nLifeSkillID].."<color>. Xin ch骳 m鮪g!", 0)
		end
	end
end;


-- 清除相关的任务变量
function clean_task_values(nLifeSkillType, nLifeSkillID)
	if (nLifeSkillType == 1) then
		-- 配方当前学到的等级 LEV_LEARNRECIPE
		SetTask(1926, 0)	
		
		-- 制衣技能的性别选择 RECIPE_SEX
		if (nLifeSkillID == 5 or nLifeSkillID == 9 or nLifeSkillID == 10) then
			SetTask(1935, 0)	
		end	
	end
end;

-- 武器制造补偿图纸
function pay_back_weaponprints()
	if (HaveLearnRecipe(955) > 0 or HaveLearnRecipe(956) > 0) then	-- 伏魔金刚之战意刀谱
		AddItem(2, 1, 1071, 1)
		Msg2Player("B筺 nh薾 頲 1 Chi課 � 產o ph�!")
	end
	if (HaveLearnRecipe(957) > 0 or HaveLearnRecipe(958) > 0) then	-- 伏魔金刚之战意棍谱
		AddItem(2, 1, 1072, 1)
		Msg2Player("B筺 nh薾 頲 1 Chi課 � c玭 ph�!")
	end
	if (HaveLearnRecipe(959) > 0 or HaveLearnRecipe(960) > 0) then	-- 传经法师之禅静杖谱
		AddItem(2, 1, 1073, 1)
		Msg2Player("B筺 nh薾 頲 1 Thi襫 T辬h trng ph�!")
	end
	if (HaveLearnRecipe(961) > 0 or HaveLearnRecipe(962) > 0) then	-- 护法罗汉之斗气手谱
		AddItem(2, 1, 1074, 1)
		Msg2Player("B筺 nh薾 頲 1 u Kh� th� ph�!")
	end
	if (HaveLearnRecipe(963) > 0 or HaveLearnRecipe(964) > 0 or
		HaveLearnRecipe(965) > 0 or HaveLearnRecipe(966) > 0) then	-- 秘毒刺客之隐秘针谱
		AddItem(2, 1, 1075, 1)
		Msg2Player("B筺 nh薾 頲 1 B� чc ch﹎ ph�!")
	end
	
	if (HaveLearnRecipe(967) > 0 or HaveLearnRecipe(968) > 0) then	-- 紫竹使之法云剑谱
		AddItem(2, 1, 1076, 1)
		Msg2Player("B筺 nh薾 頲 1 Ph竝 V﹏ ki誱 ph�!")
	end
	if (HaveLearnRecipe(969) > 0 or HaveLearnRecipe(970) > 0) then	-- 海月使之法音琴谱
		AddItem(2, 1, 1077, 1)
		Msg2Player("B筺 nh薾 頲 1 Ph竝  c莔 ph�!")
	end
	if (HaveLearnRecipe(971) > 0 or HaveLearnRecipe(972) > 0 or
		HaveLearnRecipe(973) > 0 or HaveLearnRecipe(974) > 0) then	-- 四海侠之豪气手谱
		AddItem(2, 1, 1078, 1)
		Msg2Player("B筺 nh薾 頲 1 H祇 Kh� th� ph�!")
	end
	if (HaveLearnRecipe(975) > 0 or HaveLearnRecipe(976) > 0 or
		HaveLearnRecipe(977) > 0 or HaveLearnRecipe(978) > 0) then	-- 八袋弟子之聚义棒谱
		AddItem(2, 1, 1079, 1)
		Msg2Player("B筺 nh薾 頲 1 T� Ngh躠 b鎛g ph�!")
	end
	
	if (HaveLearnRecipe(979) > 0 or HaveLearnRecipe(980) > 0 or
		HaveLearnRecipe(981) > 0 or HaveLearnRecipe(982) > 0) then	-- 无我道人之四象法剑谱
		AddItem(2, 1, 1080, 1)
		Msg2Player("B筺 nh薾 頲 1 T� Tng ph竝 ki誱 ph�!")
	end
	if (HaveLearnRecipe(983) > 0 or HaveLearnRecipe(984) > 0 or
		HaveLearnRecipe(985) > 0 or HaveLearnRecipe(986) > 0) then	-- 闲云侠道之灵风刺谱
		AddItem(2, 1, 1081, 1)
		Msg2Player("B筺 nh薾 頲 1 Linh Phong th輈h ph�!")
	end
	
	if (HaveLearnRecipe(987) > 0 or HaveLearnRecipe(988) > 0 or
		HaveLearnRecipe(989) > 0 or HaveLearnRecipe(990) > 0) then	-- 奋武将军之透甲枪谱
		AddItem(2, 1, 1082, 1)
		Msg2Player("B筺 nh薾 頲 1 Th蕌 Gi竝 thng ph�!")
	end
	if (HaveLearnRecipe(991) > 0 or HaveLearnRecipe(992) > 0 or
		HaveLearnRecipe(993) > 0 or HaveLearnRecipe(994) > 0) then	-- 奋威将军之穿甲弓谱
		AddItem(2, 1, 1083, 1)
		Msg2Player("B筺 nh薾 頲 1 Xuy猲 Gi竝 cung ph�!")
	end
	
	if (HaveLearnRecipe(995) > 0 or HaveLearnRecipe(996) > 0 or
		HaveLearnRecipe(997) > 0 or HaveLearnRecipe(998) > 0) then	-- 黑无常之猛毒刀谱
		AddItem(2, 1, 1084, 1)
		Msg2Player("B筺 nh薾 頲 1 M穘h чc 產o ph�!")
	end
	if (HaveLearnRecipe(999) > 0 or HaveLearnRecipe(1000) > 0 or
		HaveLearnRecipe(1001) > 0 or HaveLearnRecipe(1002) > 0) then	-- 白无常之诡毒爪谱
		AddItem(2, 1, 1085, 1)
		Msg2Player("B筺 nh薾 頲 1 Ng魕 чc tr秓 ph�!")
	end
	
	if (HaveLearnRecipe(1019) > 0) then
		AddItem(2, 1, 3017, 1)
		Msg2Player("B筺 nh薾 頲 B筺 nh薾 頲 1 Ng鋍 Tr� у Ph�!")
	end
	if (HaveLearnRecipe(1020) > 0) then
		AddItem(2, 1, 3018, 1)
		Msg2Player("B筺 nh薾 頲 1 Th莕 Ch﹎ у Ph�!")
	end
	if (HaveLearnRecipe(1029) > 0) then
		AddItem(2, 1, 3027, 1)
		Msg2Player("B筺 nh薾 頲 1 M鬰 Ki猲 Li猲 Trng у Ph�!")
	end
	if (HaveLearnRecipe(1030) > 0) then
		AddItem(2, 1, 3028, 1)
		Msg2Player("B筺 nh薾 頲 1 Dc S� Trng у Ph�!")
	end
	if (HaveLearnRecipe(1031) > 0) then
		AddItem(2, 1, 3029, 1)
		Msg2Player("B筺 nh薾 頲 1 C鰑 Long To祅 K輈h у Ph�!")
	end
	if (HaveLearnRecipe(1032) > 0) then
		AddItem(2, 1, 3030, 1)
		Msg2Player("B筺 nh薾 頲 1 Thng N� у Ph�!")
	end
	
	if (HaveLearnRecipe(1015) > 0) then
		AddItem(2, 1, 3013, 1)
		Msg2Player("B筺 nh薾 頲 1 Th莕 Quy у Ph�!")
	end
	if (HaveLearnRecipe(1016) > 0) then
		AddItem(2, 1, 3014, 1)
		Msg2Player("B筺 nh薾 頲 1  Dng 蕁 у Ph�!")
	end
	if (HaveLearnRecipe(1017) > 0) then
		AddItem(2, 1, 3015, 1)
		Msg2Player("B筺 nh薾 頲 1 H鋋 秐h у Ph�!")
	end
	if (HaveLearnRecipe(1018) > 0) then
		AddItem(2, 1, 3016, 1)
		Msg2Player("B筺 nh薾 頲 1 Nha C鰑 у Ph�!")
	end
	if (HaveLearnRecipe(1023) > 0) then
		AddItem(2, 1, 3021, 1)
		Msg2Player("B筺 nh薾 頲 1 L藆 C秐h у Ph�!")
	end
	if (HaveLearnRecipe(1024) > 0) then
		AddItem(2, 1, 3022, 1)
		Msg2Player("B筺 nh薾 頲 1 Ngh辌h L﹏ у Ph�!")
	end
	if (HaveLearnRecipe(1037) > 0) then
		AddItem(2, 1, 3035, 1)
		Msg2Player("B筺 nh薾 頲 1 B輈h Th駓 у Ph�!")
	end
	if (HaveLearnRecipe(1038) > 0) then
		AddItem(2, 1, 3036, 1)
		Msg2Player("B筺 nh薾 頲 1 Thi猲 T玭 у Ph�!")
	end
	
	if (HaveLearnRecipe(1021) > 0) then
		AddItem(2, 1, 3019, 1)
		Msg2Player("B筺 nh薾 頲 1 Khoa Ph� у Ph�!")
	end
	if (HaveLearnRecipe(1022) > 0) then
		AddItem(2, 1, 3020, 1)
		Msg2Player("B筺 nh薾 頲 1 M閠 V� у Ph�!")
	end
	if (HaveLearnRecipe(1025) > 0) then
		AddItem(2, 1, 3023, 1)
		Msg2Player("B筺 nh薾 頲 1 Чi Th竛h D�  у Ph�!")
	end
	if (HaveLearnRecipe(1026) > 0) then
		AddItem(2, 1, 3024, 1)
		Msg2Player("B筺 nh薾 頲 1 Kh� M閏 Long Ng﹎ у Ph�!")
	end
	if (HaveLearnRecipe(1027) > 0) then
		AddItem(2, 1, 3025, 1)
		Msg2Player("B筺 nh薾 頲 1 Toan D� у Ph�!")
	end
	if (HaveLearnRecipe(1028) > 0) then
		AddItem(2, 1, 3026, 1)
		Msg2Player("B筺 nh薾 頲 1 Th竔 H� у Ph�!")
	end
	if (HaveLearnRecipe(1033) > 0) then
		AddItem(2, 1, 3031, 1)
		Msg2Player("B筺 nh薾 頲 1 Vi猲 б у Ph�!")
	end
	if (HaveLearnRecipe(1034) > 0) then
		AddItem(2, 1, 3032, 1)
		Msg2Player("B筺 nh薾 頲 1 B蕋 X� Chi X� у Ph�!")
	end
	if (HaveLearnRecipe(1035) > 0) then
		AddItem(2, 1, 3033, 1)
		Msg2Player("B筺 nh薾 頲 1 V� Ng﹏ у Ph�!")
	end
	if (HaveLearnRecipe(1036) > 0) then
		AddItem(2, 1, 3034, 1)
		Msg2Player("B筺 nh薾 頲 1 Thanh Long у Ph�!")
	end
end;

-- 护甲制造补偿图纸
function pay_back_blueprints()
	if (HaveLearnRecipe(809) > 0 or HaveLearnRecipe(810) > 0) then	-- 行者服
		AddItem(2, 1, 425, 1)
		Msg2Player("B筺 nh薾 頲 1 H祅h Gi� Ph鬰 Ph�!")
	end
	
	if (HaveLearnRecipe(811) > 0 or HaveLearnRecipe(812) > 0) then	-- 混元服
		AddItem(2, 1, 426, 1)
		Msg2Player("B筺 nh薾 頲 1 H鏽 Nguy猲 Ph鬰 Ph�!")
	end
	
	if (HaveLearnRecipe(813) > 0 or HaveLearnRecipe(814) > 0) then	-- 伏魔金刚之战意铠甲
		AddItem(2, 1, 427, 1)
		Msg2Player("B筺 nh薾 頲 1 Chi課 � Kh秈 Gi竝 Ph�!")
	end
	
	if (HaveLearnRecipe(815) > 0 or HaveLearnRecipe(816) > 0) then	-- 苦行袍
		AddItem(2, 1, 428, 1)
		Msg2Player("B筺 nh薾 頲 1 Kh� H祅h B祇 Ph�!")
	end
	
	if (HaveLearnRecipe(817) > 0 or HaveLearnRecipe(818) > 0) then	-- 禅修袍
		AddItem(2, 1, 429, 1)
		Msg2Player("B筺 nh薾 頲 1 Thi襫 Tu B祇 Ph�!")
	end
	
	if (HaveLearnRecipe(819) > 0 or HaveLearnRecipe(820) > 0) then	-- 传经法师之禅静袍沙弥服谱
		AddItem(2, 1, 430, 1)
		Msg2Player("B筺 nh薾 頲 1 Thi襫 T辬h B祇 Ph�!")
	end

	if (HaveLearnRecipe(821) > 0 or HaveLearnRecipe(822) > 0) then	-- 沙弥服
		AddItem(2, 1, 431, 1)
		Msg2Player("B筺 nh薾 頲 1 Sa Di Ph鬰 Ph�!")
	end
	
	if (HaveLearnRecipe(823) > 0 or HaveLearnRecipe(824) > 0) then	-- 斗僧服
		AddItem(2, 1, 432, 1)
		Msg2Player("B筺 nh薾 頲 1 u T╪g Ph鬰 Ph�!!")
	end
	
	if (HaveLearnRecipe(825) > 0 or HaveLearnRecipe(826) > 0) then	-- 护法罗汉之斗气战衣
		AddItem(2, 1, 433, 1)
		Msg2Player("B筺 nh薾 頲 1 u Kh� Chi課 Y Ph�!")
	end
	
	if (HaveLearnRecipe(827) > 0 or HaveLearnRecipe(828) > 0 or
		HaveLearnRecipe(829) > 0 or HaveLearnRecipe(830) > 0) then	-- 庄客服
		AddItem(2, 1, 434, 1)
		Msg2Player("B筺 nh薾 頲 1 Trang Kh竎h Ph鬰 Ph�!")
	end
	
	if (HaveLearnRecipe(831) > 0 or HaveLearnRecipe(832) > 0 or
		HaveLearnRecipe(833) > 0 or HaveLearnRecipe(834) > 0) then	-- 护卫服
		AddItem(2, 1, 435, 1)
		Msg2Player("B筺 nh薾 頲 1 H� V� Ph鬰 Ph�!")
	end
	
	if (HaveLearnRecipe(835) > 0 or HaveLearnRecipe(836) > 0 or
		HaveLearnRecipe(837) > 0 or HaveLearnRecipe(838) > 0) then	-- 秘毒刺客之隐秘服
		AddItem(2, 1, 436, 1)
		Msg2Player("B筺 nh薾 頲 1 B� чc ph鬰 ph�")
	end
	
	if (HaveLearnRecipe(839) > 0 or HaveLearnRecipe(840) > 0) then	-- 清心素衣
		AddItem(2, 1, 437, 1)
		Msg2Player("B筺 nh薾 頲 1 Thanh T﹎ T� Y Ph�!")
	end
	
	if (HaveLearnRecipe(841) > 0 or HaveLearnRecipe(842) > 0) then	-- 彩羽素衣
		AddItem(2, 1, 438, 1)
		Msg2Player("B筺 nh薾 頲 1 Th竔 V� T� Y Ph�!")
	end
	
	if (HaveLearnRecipe(843) > 0 or HaveLearnRecipe(844) > 0) then	-- 紫竹使之法云衣
		AddItem(2, 1, 439, 1)
		Msg2Player("B筺 nh薾 頲 1 Ph竝 V﹏ Y Ph�!")
	end
	
	if (HaveLearnRecipe(845) > 0 or HaveLearnRecipe(846) > 0) then	-- 思曲素衣
		AddItem(2, 1, 440, 1)
		Msg2Player("B筺 nh薾 頲 1 T� Kh骳 T� Y Ph�!")
	end
	
	if (HaveLearnRecipe(847) > 0 or HaveLearnRecipe(848) > 0) then	-- 梵音素衣
		AddItem(2, 1, 441, 1)
		Msg2Player("B筺 nh薾 頲 1 Ph筺  T� Y Ph�!")
	end
	
	if (HaveLearnRecipe(849) > 0 or HaveLearnRecipe(850) > 0) then	-- 海月使之法音衣
		AddItem(2, 1, 442, 1)
		Msg2Player("B筺 nh薾 頲 1 Ph竝  Y Ph�!")
	end
	
	if (HaveLearnRecipe(851) > 0 or HaveLearnRecipe(852) > 0 or
		HaveLearnRecipe(853) > 0 or HaveLearnRecipe(854) > 0) then	-- 执钵裳
		AddItem(2, 1, 443, 1)
		Msg2Player("B筺 nh薾 頲 1 Ch蕄 B竧 Thng Ph�!")
	end
	
	if (HaveLearnRecipe(855) > 0 or HaveLearnRecipe(856) > 0 or
		HaveLearnRecipe(857) > 0 or HaveLearnRecipe(858) > 0) then	-- 除奸裳
		AddItem(2, 1, 444, 1)
		Msg2Player("B筺 nh薾 頲 1 Tr� Gian Thng Ph�!")
	end
	
	if (HaveLearnRecipe(859) > 0 or HaveLearnRecipe(860) > 0 or
		HaveLearnRecipe(861) > 0 or HaveLearnRecipe(862) > 0) then	-- 四海侠之豪气服
		AddItem(2, 1, 445, 1)
		Msg2Player("B筺 nh薾 頲 1 H祇 Kh� Ph鬰 Ph�!")
	end
	
	if (HaveLearnRecipe(863) > 0 or HaveLearnRecipe(864) > 0 or
		HaveLearnRecipe(865) > 0 or HaveLearnRecipe(866) > 0) then	-- 叫花衣
		AddItem(2, 1, 446, 1)
		Msg2Player("B筺 nh薾 頲 1 Khi誹 Hoa Y Ph�!")
	end
	
	if (HaveLearnRecipe(867) > 0 or HaveLearnRecipe(868) > 0 or
		HaveLearnRecipe(869) > 0 or HaveLearnRecipe(870) > 0) then	-- 惩恶裳
		AddItem(2, 1, 447, 1)
		Msg2Player("B筺 nh薾 頲 1 Tr鮪g 竎 Thng Ph�!")
	end
	
	if (HaveLearnRecipe(871) > 0 or HaveLearnRecipe(872) > 0 or
		HaveLearnRecipe(873) > 0 or HaveLearnRecipe(874) > 0) then	-- 八袋弟子之聚义裳
		AddItem(2, 1, 448, 1)
		Msg2Player("B筺 nh薾 頲 1 T� Ngh躠 Thng Ph�!")
	end

	if (HaveLearnRecipe(875) > 0 or HaveLearnRecipe(876) > 0 or
		HaveLearnRecipe(877) > 0 or HaveLearnRecipe(878) > 0) then	-- 清修袍
		AddItem(2, 1, 449, 1)
		Msg2Player("B筺 nh薾 頲 1 Thanh Tu B祇 Ph�!")
	end
	
	if (HaveLearnRecipe(879) > 0 or HaveLearnRecipe(880) > 0 or
		HaveLearnRecipe(881) > 0 or HaveLearnRecipe(882) > 0) then	-- 入观法袍
		AddItem(2, 1, 450, 1)
		Msg2Player("B筺 nh薾 頲 1 Nh藀 Quan Ph竝 B祇 Ph�!")
	end
	
	if (HaveLearnRecipe(883) > 0 or HaveLearnRecipe(884) > 0 or
		HaveLearnRecipe(885) > 0 or HaveLearnRecipe(886) > 0) then	-- 无我道人之四象法袍
		AddItem(2, 1, 451, 1)
		Msg2Player("B筺 nh薾 頲 1 T� Tng Ph竝 B祇 Ph�!")
	end
	
	if (HaveLearnRecipe(887) > 0 or HaveLearnRecipe(888) > 0 or
		HaveLearnRecipe(889) > 0 or HaveLearnRecipe(890) > 0) then	-- 清风袍
		AddItem(2, 1, 452, 1)
		Msg2Player("B筺 nh薾 頲 1 Thanh Phong B祇 Ph�!")
	end
	
	if (HaveLearnRecipe(891) > 0 or HaveLearnRecipe(892) > 0 or
		HaveLearnRecipe(893) > 0 or HaveLearnRecipe(894) > 0) then	-- 少阳裳
		AddItem(2, 1, 453, 1)
		Msg2Player("B筺 nh薾 頲 1 Thi誹 Dng Thng Ph�!")
	end
	
	if (HaveLearnRecipe(895) > 0 or HaveLearnRecipe(896) > 0 or
		HaveLearnRecipe(897) > 0 or HaveLearnRecipe(898) > 0) then	-- 闲云侠道之灵风裳
		AddItem(2, 1, 454, 1)
		Msg2Player("B筺 nh薾 頲 1 Linh Phong Thng Ph�!")
	end
	
	if (HaveLearnRecipe(899) > 0 or HaveLearnRecipe(900) > 0 or
		HaveLearnRecipe(901) > 0 or HaveLearnRecipe(902) > 0) then	-- 轻骑甲
		AddItem(2, 1, 455, 1)
		Msg2Player("B筺 nh薾 頲 1 Khinh K� Gi竝 Ph�!")
	end
	
	if (HaveLearnRecipe(903) > 0 or HaveLearnRecipe(904) > 0 or
		HaveLearnRecipe(905) > 0 or HaveLearnRecipe(906) > 0) then	-- 校尉铁甲
		AddItem(2, 1, 456, 1)
		Msg2Player("B筺 nh薾 頲 1 Hi謚 髖 Thi誸 Gi竝 Ph�!")
	end
	
	if (HaveLearnRecipe(907) > 0 or HaveLearnRecipe(908) > 0 or
		HaveLearnRecipe(909) > 0 or HaveLearnRecipe(910) > 0) then	-- 奋武将军之精甲铠
		AddItem(2, 1, 457, 1)
		Msg2Player("B筺 nh薾 頲 1 Ph蕁 V� Tinh Gi竝 Kh秈 Ph�!")
	end
	
	if (HaveLearnRecipe(911) > 0 or HaveLearnRecipe(912) > 0 or
		HaveLearnRecipe(913) > 0 or HaveLearnRecipe(914) > 0) then	-- 弩手甲
		AddItem(2, 1, 458, 1)
		Msg2Player("B筺 nh薾 頲 1 N� Th� Gi竝 Ph�!")
	end
	
	if (HaveLearnRecipe(915) > 0 or HaveLearnRecipe(916) > 0 or
		HaveLearnRecipe(917) > 0 or HaveLearnRecipe(918) > 0) then	-- 都尉铁甲
		AddItem(2, 1, 459, 1)
		Msg2Player("B筺 nh薾 頲 1 Й 髖 Thi誸 Gi竝 Ph�!")
	end
	
	if (HaveLearnRecipe(919) > 0 or HaveLearnRecipe(920) > 0 or
		HaveLearnRecipe(921) > 0 or HaveLearnRecipe(922) > 0) then	-- 奋威将军之精甲铠
		AddItem(2, 1, 460, 1)
		Msg2Player("B筺 nh薾 頲 1 Ph蕁 Uy Tinh Gi竝 Kh秈 Ph�!")
	end
	
	if (HaveLearnRecipe(923) > 0 or HaveLearnRecipe(924) > 0 or
		HaveLearnRecipe(925) > 0 or HaveLearnRecipe(926) > 0) then	-- 夺魄衣
		AddItem(2, 1, 461, 1)
		Msg2Player("B筺 nh薾 頲 1 箃 Ph竎h Y Ph�!")
	end
	
	if (HaveLearnRecipe(927) > 0 or HaveLearnRecipe(928) > 0 or
		HaveLearnRecipe(929) > 0 or HaveLearnRecipe(930) > 0) then	-- 催命衣
		AddItem(2, 1, 462, 1)
		Msg2Player("B筺 nh薾 頲 1 Th玦 M謓h Y Ph�!")
	end
	
	if (HaveLearnRecipe(931) > 0 or HaveLearnRecipe(932) > 0 or
		HaveLearnRecipe(933) > 0 or HaveLearnRecipe(934) > 0) then	-- 黑无常之猛毒衣
		AddItem(2, 1, 463, 1)
		Msg2Player("B筺 nh薾 頲 1 M穘h чc Y Ph�!")
	end
	
	if (HaveLearnRecipe(935) > 0 or HaveLearnRecipe(936) > 0 or
		HaveLearnRecipe(937) > 0 or HaveLearnRecipe(938) > 0) then	-- 毒蚕衣
		AddItem(2, 1, 464, 1)
		Msg2Player("B筺 nh薾 頲 1 чc T祄 Y Ph�!")
	end
	
	if (HaveLearnRecipe(939) > 0 or HaveLearnRecipe(940) > 0 or
		HaveLearnRecipe(941) > 0 or HaveLearnRecipe(942) > 0) then	-- 蚀心衣
		AddItem(2, 1, 465, 1)
		Msg2Player("B筺 nh薾 頲 1 Th鵦 T﹎ Y Ph�!")
	end
	
	if (HaveLearnRecipe(943) > 0 or HaveLearnRecipe(944) > 0 or
		HaveLearnRecipe(945) > 0 or HaveLearnRecipe(946) > 0) then	-- 白无常之诡毒衣
		AddItem(2, 1, 466, 1)
		Msg2Player("B筺 nh薾 頲 1 Ng魕 чc Y Ph�!")
	end
	
	if (HaveLearnRecipe(1053) > 0 or HaveLearnRecipe(1054) > 0 or
		HaveLearnRecipe(1055) > 0 or HaveLearnRecipe(1056) > 0 or
		HaveLearnRecipe(1077) > 0 or HaveLearnRecipe(1078) > 0 or
		HaveLearnRecipe(1079) > 0 or HaveLearnRecipe(1080) > 0) then	-- 八级头冠配方
		AddItem(2, 1, 3044, 1)
		Msg2Player("B筺 nh薾 頲 1 m� Ph鑙 Phng c蕄 8!")
	end
	if (HaveLearnRecipe(1057) > 0 or HaveLearnRecipe(1058) > 0 or
		HaveLearnRecipe(1059) > 0 or HaveLearnRecipe(1060) > 0 or
		HaveLearnRecipe(1081) > 0 or HaveLearnRecipe(1082) > 0 or
		HaveLearnRecipe(1083) > 0 or HaveLearnRecipe(1084) > 0) then	-- 八级上衣配方
		AddItem(2, 1, 3045, 1)
		Msg2Player("B筺 nh薾 頲 1 thng y Ph鑙 Phng c蕄 8!")
	end
	if (HaveLearnRecipe(1061) > 0 or HaveLearnRecipe(1062) > 0 or
		HaveLearnRecipe(1063) > 0 or HaveLearnRecipe(1064) > 0 or
		HaveLearnRecipe(1085) > 0 or HaveLearnRecipe(1086) > 0 or
		HaveLearnRecipe(1087) > 0 or HaveLearnRecipe(1088) > 0) then	-- 八级下衣配方
		AddItem(2, 1, 3046, 1)
		Msg2Player("B筺 nh薾 頲 1 h� y Ph鑙 Phng c蕄 8!")
	end
	if (HaveLearnRecipe(1065) > 0 or HaveLearnRecipe(1066) > 0 or
		HaveLearnRecipe(1067) > 0 or HaveLearnRecipe(1068) > 0) then	-- 九级头冠配方
		AddItem(2, 1, 3047, 1)
		Msg2Player("B筺 nh薾 頲 1 m� Ph鑙 Phng c蕄 9!")
	end
	if (HaveLearnRecipe(1069) > 0 or HaveLearnRecipe(1070) > 0 or
		HaveLearnRecipe(1071) > 0 or HaveLearnRecipe(1072) > 0) then	-- 九级上衣配方
		AddItem(2, 1, 3048, 1)
		Msg2Player("B筺 nh薾 頲 1 thng y Ph鑙 Phng c蕄 9!")
	end
	if (HaveLearnRecipe(1073) > 0 or HaveLearnRecipe(1074) > 0 or
		HaveLearnRecipe(1075) > 0 or HaveLearnRecipe(1076) > 0) then	-- 九级下衣配方
		AddItem(2, 1, 3049, 1)
		Msg2Player("B筺 nh薾 頲 1 h� y Ph鑙 Phng c蕄 9!")
	end
end;

