--脚本名：2007清明节活动杀怪调用脚本
--脚本功能：2007年清明节活动杀怪完成后的相关操作
--策划人：阿松
--代码编写人：村长
--代码编写时间：2007-03-20
--代码修改记录：
tomb_sweep_2007_task_reel_step = 858				--当前任务步骤（杀怪）
function monster_killed()
	SetTask(tomb_sweep_2007_task_reel_step,1)
	TaskTip("Nh綾 nh�: B筺  ho祅 th祅h nhi謒 v� c� th� t譵 th� l╪g nh﹏ nh薾 thng!")
	for i = 900,903 do
		local trigger_ID = GetTrigger(i)
		if trigger_ID ~= 0  then
			RemoveTrigger(trigger_ID)
		end
	end
end
