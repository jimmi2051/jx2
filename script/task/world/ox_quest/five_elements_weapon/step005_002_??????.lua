-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 4, 13, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Ch� Ti謒 v� kh�", "green")..":"
quest_title = cf_ox_SetColor("Thu閏 t輓h v� kh�", "yellow").."\n"
quest_detail = cf_ox_SetColor("T譵 20 Tinh Thi誸, 10 Tr飊g M閏, 1 Kim Cang H� Nha v� cho th� r蘮 Bi謓 Kinh.", "gray").."\n\n"
quest_description_1 = quest_giver.."N誹 t譵  c竎 nguy猲 li謚 ta s� gi髉 ngi ch� t筼 v� kh� Ph鬰 Ma. \n Thi誹 L﹎ T� {H鎪 c� th� t譵 頲 Kim Cang H� Nha, ngo筰 Th祅h Й {Heo r鮪g} c� th� t譵 頲 Tinh Thi誸, Nga My s琻 {Ong v祅g} c� th� t譵 頲 Tr飊g M閏."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_005_002()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(0, 4, 52)
	CreateTrigger(4, 14, 51)					-- 创建下一个触发器
	SetTask(101, 16)
	
	-- 以下是任务奖励部分
	ModifyExp(200)							-- 给予玩家经验奖励
		
	-- 以下是文字显示部分
	TaskTip("T譵 20 Tinh Thi誸, 10 Tr飊g M閏, 1 Kim Cang H� Nha v� cho th� r蘮 Bi謓 Kinh.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end