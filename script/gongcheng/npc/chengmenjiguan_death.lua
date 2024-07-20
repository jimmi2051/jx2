--create date:07-04-13
--author:yanjun
--describe:城门机关死亡脚本
Include("\\script\\gongcheng\\gongcheng_function.lua");

function OnDeath(nNpcIdx)
	local nJiGuanID = GCZ_GetChengMenJiGuanIndex(nNpcIdx);
	--SetNpcLifeTime(nNpcIdx,0);
	if nJiGuanID == 0 then
		WriteLog("[c玭g th祅h C玭g th祅h chi課 b� l鏸]: chengmenjiguan_death.lua trong script GCZ_GetChengMenJiGuanIndex h祄 s� tr� v� tr� s� b� l鏸");
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GCZ_GetEnemyCamp();
	GCZ_PlaySound(nPlayerCamp,tWavFileName[3][1]);
	GCZ_PlaySound(nEnemyCamp,tWavFileName[3][2]);
	SetMissionV(MV_DESTROY_EAST_DOOR+nJiGuanID-1,1);
	SetMissionV(MV_EAST_JIGUAN_INDEX+nJiGuanID-1,0);
	if nJiGuanID == 1 then
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_B2,GONG_ID,TRUE);
		Msg2MSAll(MISSION_ID,"Th祅h m玭 ph輆 Йng nguy c蕄, 甶觤 t藀 k誸 ngo礽 th祅h  m�");
	elseif nJiGuanID == 2 then
		Msg2MSAll(MISSION_ID,"Trung khu th祅h m玭 nguy c蕄");
	elseif nJiGuanID == 3 then
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_B1,GONG_ID,TRUE);
		Msg2MSAll(MISSION_ID,"Th祅h m玭 ph輆 T﹜ nguy c蕄, T﹜ th祅h m玭甶觤 t藀 k誸 ngo礽 th祅h  m�");
	end;
	Msg2MSAll(MISSION_ID,GetName().."  ph� h駓 "..tChengMenJiGuanPos[nJiGuanID][3])
	if GCZ_CheckAllDoor() == 1 then
		Msg2MSAll(MISSION_ID,"th祅h m玭  ho祅 to祅 l﹎ nguy, C玭g th祅h i ph竜 c遪 c竎h ");
		GCZ_ComeToGongmeng();
	end;
end;
