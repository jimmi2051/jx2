Include("\\script\\online\\元旦活动\\yuandan_head.lua")
function OnDeath(Launcher)
	SetDeathPunish(1)	--确保有死亡惩罚（死了之后肯定回城，即肯定触发离开地图的脚本）
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		KillFollower()
		SetTaskTemp(TASK_FLAG_FOLLOW,0)
		RemoveTitle(3,3)
		local npcFlag = CreateNpc("Ti猽 s�-i tho筰","Ti猽 k�",GetWorldPos())
		SetNpcScript(npcFlag,"\\script\\online\\元旦活动\\旗子.lua")
		SetDeathScript("")	
	end
end

