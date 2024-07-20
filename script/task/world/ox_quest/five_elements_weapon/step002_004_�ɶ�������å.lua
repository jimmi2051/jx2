-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- ID : 0, 1, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("L璾 Manh", "green")..":"
quest_title = cf_ox_SetColor("Th╩ d�", "yellow").."\n"
quest_detail = cf_ox_SetColor("Quay l筰 B� u � Th祅h Й h錳 b竜.", "gray").."\n\n"
quest_description_1 = quest_giver.."Xin tha m筺g匓総 c鉩 ti觰 th� h玬  c騨g ch� l� l祄 theo m謓h l謓h c馻 Bang ch� v� L穙 i, lo筰 nh穒 nh衟 nh� ta ch� bi誸 l祄 theo. � \n h玬 n ch� Ch﹗ gia ta ta c遪 ph竧 hi謓卆..產u qu竻c鴘..."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_002_004()
	if (random(1,100) <= 10) then				-- 杀死流氓后有 10% 的几率完成任务

		-- 以下是触发控制部分
		RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
		CreateTrigger(4, 6, 51)					-- 创建下一个触发器
		SetTask(101, 8)
	
		-- 以下是任务奖励部分
		ModifyExp(100)							-- 给予玩家经验奖励
	
		-- 以下是文字显示部分
		TaskTip("Quay l筰 B� u � Th祅h Й h錳 b竜.")
		Say(quest_title..quest_detail..quest_description_1, 0)

	else
		Msg2Player("B筺 kh玭g nh薾 頲 tin t鴆 n祇")
	end
end