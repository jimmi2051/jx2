----------------[话说代码应该是一种艺术]----------------
--------------------------------------------------------
--脚本名称:龙光真人NPC主对话脚本                       |
--脚本功能:龙光真人NPC功能入口                         |
--功能开发人:刘宇斌                                    |
--功能开发时间：2009-12-28                             |
--主要修改记录：                                       |
--------------------------------------------------------
Include("\\script\\online_activites\\reborn\\effect\\head.lua")
Include("\\script\\online_activites\\reborn\\effect\\npc\\npc_add_effect_weapon.lua")
Include("\\script\\online_activites\\reborn\\effect\\npc\\npc_add_effect_cloth.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\nhiemvudonghanh.lua")

-----------------------------------------npc脚本入口-----------------------------------------
function main()
	local tbSays = {}
	if CFG_NhiemVuDongHanh == 1 then
		tinsert(tbSays, "Nhi謒 v� ng h祅h/NhiemVuDongHanh_Menu")
	end
	tinsert(tbSays, VIE_201005_REBORN_STR_NpcDialog[0][2].."/weapon_effect")          --武器蕴灵相关
	--tinsert(tbSays, VIE_201005_REBORN_STR_NpcDialog[0][3].."/cloth_effect")           --外装蕴灵相关
	tinsert(tbSays, VIE_201005_REBORN_STR_NpcDialog[0][4].."/gf_DoNothing")            --空函数

    Say(VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[0][1], getn(tbSays), tbSays);
end