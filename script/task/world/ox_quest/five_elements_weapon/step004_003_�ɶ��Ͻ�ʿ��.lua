-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 4, 10, 53

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Binh s�", "green")..":"
quest_title = cf_ox_SetColor("Qu竔  kh竛g", "yellow").."\n"
quest_detail = cf_ox_SetColor("Gi誸 1 H� Thi", "gray").."\n\n"
quest_description_1 = quest_giver.."Цm qu竔 n祔 kh玭g kh玭g ng鮪g l閚g h祅h, s鴆 l鵦 ch髇g ta l筰 c� h筺. Kh玭g bi誸 Ngic� d竚 kh� tr� ch髇g kh玭g?"
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_004_003()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(0, 5, 53)					-- 创建下一个触发器·杀腐尸
	
	-- 以下是任务奖励部分
		
	-- 以下是文字显示部分
	TaskTip("Gi誸 1 H� Thi")
	Say(quest_title..quest_detail..quest_description_1, 0)
end