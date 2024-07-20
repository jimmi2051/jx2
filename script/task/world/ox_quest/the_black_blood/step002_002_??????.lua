-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 4, 106, 72

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("a b� ng thng", "green")..":"
quest_title = cf_ox_SetColor("M竨 甧n", "yellow").."\n"
quest_detail = cf_ox_SetColor("Gi誸 30 Th� x竚.", "gray").."\n\n"
quest_description_1 = quest_giver.."Ti觰 t� n祔 h玬 qua b総 v� m閠 con Th� x竚, t� t� c馻 n�  b� th� c緉. H玬 nay v蒼 c遪 ng l筰 v礽 v誸 m竨 甧n. Phi襫 b籲g h鱱 ra ngo礽 th玭 gi誸 m閠 s� Th� x竚 甧m v� tr� thng."
quest_confirm = ""
quest_cancel = ""

function wq_ox_tbb_002_002()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(0, 101, 72)
	SetTask(122, 3)

	-- 以下是任务奖励部分
	ModifyExp(200)							-- 经验奖励
	
	-- 以下是文字显示部分
	TaskTip("Gi誸 30 Th� x竚.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end