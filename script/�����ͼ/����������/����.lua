--少林议事厅净慈脚本
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>T辬h T�: <color>%s, A di  ph藅.",sName),2,"Ta mu鑞 r阨 kh醝 Thi誹 L﹎ Ngh� S� Л阯g/out_map","Kh玭g c莕 u/do_nothing");
end

function out_map()
	NewWorld(204,1682,3143);
	SetFightState(0);
end

function do_nothing()
end