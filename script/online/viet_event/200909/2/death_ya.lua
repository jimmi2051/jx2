--=============================================
--create by baiyun 2009.11.22
--describe:越南版12月份圣诞节活动鸭死亡脚本
--=============================================
Include("\\script\\online\\viet_event\\200909\\event_head.lua")

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex, 30);
	if random(1,100) <= 25 then
		AddItem(2, 1, 30128, 1);
		WriteLogEx("Hoat dong thang 12","nh薾",1,"эi v辴");
	end
	
	local nMapID, nWx, nWy = GetNpcWorldPos(nNpcIndex)
	local nAddX = 0
	local nAddY = 0
	local nTargetNpc = 0
			
	for i = 1, 20 do
		nAddX = random(-70, 70)
		nAddY = random(-70, 70)		
		nTargetNpc = CreateNpc("M﹎ c�", "Th辴 Nng", nMapID, nWx + nAddX, nWy + nAddY)
		SetNpcLifeTime(nTargetNpc, 130)
		SetNpcScript(nTargetNpc, "\\script\\online\\viet_event\\200909\\2\\pangtuzi_baoguo.lua")
	end	
end
