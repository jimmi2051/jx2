-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- ID : 4, 5, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("B� u", "green")..":"
quest_title = cf_ox_SetColor("B総 c鉩", "yellow").."\n"
quest_detail = cf_ox_SetColor(" t譵 b鋘 L璾 manh ngo礽 th祅h th╩ d� tin t鴆.", "gray").."\n\n"
quest_description_1 = quest_giver.."B鋘 ch髇g c莕 ch輓h l� mi課g ng鋍 n祔, xem ra c騨g ng gi� , c� l� ta nh� quan ph� gi� h� th� t鑤 h琻. Hi謓 gi� b鋘 l璾 manh b猲 ngo礽 Th祅h Й 產ng n竜 lo筺. Ch髇g ta h穣 甶 b総 v礽 t猲 甧m v� l蕐 kh萿 cung  t譵 ra manh m鑙."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_002_003()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(0, 1, 51)					-- 创建下一个触发器
	SetTask(101, 7)
	
	-- 以下是任务奖励部分
	DelItem(2, 0, 9, 1)						-- 删除玩家任务道具 八卦印·乾
	ModifyExp(100)							-- 给予玩家经验奖励
	
	-- 以下是文字显示部分
	TaskTip(" t譵 b鋘 L璾 manh ngo礽 th祅h th╩ d� tin t鴆.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end