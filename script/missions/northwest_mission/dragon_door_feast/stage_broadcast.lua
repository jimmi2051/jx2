--脚本名称：龙门宴时间调用脚本
--脚本功能：服务器消息，关卡开启
--功能策划人：陈公子
--功能开发人：村长
--功能测试人：洋葱
--代码开发时间：2007-12-23
--代码修改记录：
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\missions\\northwest_mission\\dragon_door_feast\\mission_head.lua")

Tb_boss_info = 	{"L� Nguy猲 Kh竛h","L� Nguy猲 Kh竛h",1651,3149,"\\script\\missions\\northwest_mission\\\dragon_door_feast\\stage_main.lua"}

function main()
	if Zgc_pub_week_day() ~= 6 and Zgc_pub_week_day() ~= 5 then
		return
	end
	if SubWorldID2Idx(507) == -1 then
		return
	end
	--开启关卡：
	for i = 1,getn(Tb_stage7_map_list) do
		local mis_state = mf_GetMissionV(FEAST_MS_ID,MS_STATE_ID,Tb_stage7_map_list[i])
		if mis_state == nil or  mis_state == 0 then
			if mf_OpenMission(FEAST_MS_ID,Tb_stage7_map_list[i])	== 1 then									--开启关卡
				--boss处理
				local boss_index = CreateNpc(Tb_boss_info[1],Tb_boss_info[2],Tb_stage7_map_list[i],Tb_boss_info[3],Tb_boss_info[4])
				SetNpcScript(boss_index,Tb_boss_info[5])
				AddUnitStates(boss_index,7,0)
				ChangeNpcToFight(boss_index,0,6)
				--系统处理
				mf_SetMissionV(FEAST_MS_ID,MS_STATE_ID,1,Tb_stage7_map_list[i])
				mf_SetMissionV(FEAST_MS_ID,MS_feast_boss_index,boss_index,Tb_stage7_map_list[i])
				mf_SetMissionV(FEAST_MS_ID,MS_PLAYER_NUM,0,Tb_stage7_map_list[i])
				mf_SetMissionV(FEAST_MS_ID,Ms_feast_step,1,Tb_stage7_map_list[i])
			end
		end
	end
	AddGlobalNews("(Thi猲 l� truy襫 ﹎) L� Nguy猲 Kh竛h: T筰 h� c� m� m閠 bu鎖 ti謈 t筰 qu竛 tr� Long M玭 tr蕁 chi猽 i v� l﹎ h祇 ki謙 Чi T鑞g, r蕋 mong c竎 v� i hi謕 c莔 'Thi謕 Long M玭 Y課' n tham d�.")
end
