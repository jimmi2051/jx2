--=============================================
--create by baiyun 2009.8.26
--describe:越南版9月份中秋活动蚊子死亡脚本脚本
--=============================================
Include("\\script\\lib\\globalfunctions.lua");

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex, 30);
	local nRetCode, nIndex = AddItem(2, 1, 30110, 1);
	if nRetCode == 1 then
		SetItemExpireTime(nIndex, 30 * 24 * 3600);
		WriteLogEx("Hoat dong trung thu","Boss Con Mu鏸",1,"T骾 V╪ T�")
	end
	
	local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
	local nAddX = 0
	local nAddY = 0
	local nTargetNpc = 0
			
	for i = 1, 10 do
		nAddX = random(-30, 30)
		nAddY = random(-30, 30)		
		nTargetNpc = CreateNpc("T骾 cao th�", "V╪ T� Bao", nMapID, nWx + nAddX, nWy + nAddY)
		SetNpcLifeTime(nTargetNpc, 300)
		SetNpcScript(nTargetNpc, "\\script\\online\\viet_event\\200909\\3\\wenzi_baoguo.lua")
	end	
end