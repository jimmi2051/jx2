-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- ID : 4, 6, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("B� u", "green")..":"
quest_title = cf_ox_SetColor("Ti猽 tr�", "yellow").."\n"
quest_detail = cf_ox_SetColor("Gi誸 30 t猲 l璾 manh, 20 t猲 C玭  sau  v� Th祅h Й g苝 B� u.", "gray").."\n\n"
quest_description_1 = quest_giver.."Ngi ra ngo礽 th祅h gi竜 hu蕁 b鋘 l璾 manh , nh﹏ ti謓 t譵 th猰 manh m鑙."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_002_005()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(0, 2, 51)					-- 创建下一个触发器 杀掉流氓
	CreateTrigger(0, 3, 52)					-- 创建下一个触发器 杀掉无赖
	SetTask(101, 9)
	
	-- 以下是任务奖励部分
	ModifyExp(100)							-- 给予玩家经验奖励
	
	-- 以下是文字显示部分
	TaskTip("Gi誸 30 t猲 l璾 manh, 20 t猲 C玭  sau  v� Th祅h Й g苝 B� u.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end