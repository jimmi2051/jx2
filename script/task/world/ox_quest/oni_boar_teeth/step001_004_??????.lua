-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 0, 52, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_obt_001_004()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(4, 53, 61)
	--SetTask(111, 5)

	-- 以下是任务奖励部分
	
	-- 以下是文字显示部分
	TaskTip("Nhi謒 v� di謙 Heo r鮪g ho祅 th祅h quay v� g苝 Th玭 D﹏")
end