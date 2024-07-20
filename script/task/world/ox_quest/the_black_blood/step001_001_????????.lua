-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 4, 101, 71

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Ch� ti謒 nh�", "green")..":"
quest_title = cf_ox_SetColor("Thanh Kh� L鬰 Minh", "yellow").."\n"
quest_detail = cf_ox_SetColor("Mang b譶h n祔 n d遪g su鑙 ph輆 t﹜ b綾  l蕐 nc.", "gray").."\n\n"
quest_description_1 = quest_giver.."Tr� c馻 ta � y c鵦 k� ngon, u鑞g v祇 c� th� gi秈 c, t╪g cng sinh l鵦 l筰 ho祅 to祅 mi詎 ph�. \n Ch� c莕 ngi n su鑙 Thanh Kh� � t﹜ b綾 甧m v� cho ta b譶h nc, ta s� t苙g ngi m閠 b譶h tr� ngon."
quest_confirm = ""
quest_cancel = ""

function wq_ox_tbb_001_001()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	SetTask(121, 2)
	--CreateTrigger(0, 102, 71)

	-- 以下是任务奖励部分
	AddItem(2, 0, 15, 1)					-- 获得任务道具 小瓶子
	
	-- 以下是文字显示部分
	TaskTip("Mang b譶h n祔 n d遪g su鑙 ph輆 t﹜ b綾  l蕐 nc.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end