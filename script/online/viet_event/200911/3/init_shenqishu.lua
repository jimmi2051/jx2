--=============================================
--create by baiyun 2009.10.19
--describe:越南版11月秋活动神奇树初始化脚本
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
--刷新走军灯笼的坐标
t_shenqishu_sets = {
	[0] = {"Thi誹 L﹎", {204, 1526, 3269}},--星期日
	[1] = {"Nga My", {303, 1554, 3235}},--星期一
	[2] = {"Л阯g M玭", {305, 1530, 2921}},--星期二
	[3] = {"C竔 Bang", {209, 1515, 3265}},--星期三
	[4] = {"V� ng", {312, 1707, 3477}},--星期四
	[5] = {"Ng� чc", {407, 1555, 3286}},--星期五
	[6] = {"Dng M玭", {219, 1655, 3301}},--星期六
};
function main()
	do return end
end

function create_npcs(nDay)
	if tonumber(date("%H")) == 0 or tonumber(date("%H")) == 1 or tonumber(date("%H")) == 22 or tonumber(date("%H")) == 23 then
		return
	end
	local nNpcIndex = 0;
	local nNpcLifeTime = 30 * 60;
	nNpcIndex = CreateNpc("c﹜  M藅 Hoa Qu� l韓", "C﹜ th莕 k�", gf_UnPack(t_shenqishu_sets[nDay][2]));
	SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\3\\npc_shenqishu.lua");
	AddGlobalNews("C� ngi ph竧 hi謓 c﹜ th莕 k� xu蕋 hi謓 t筰 ["..t_shenqishu_sets[nDay][1].."]");
	
	local nMapId, nMapX, nMapY = GetNpcWorldPos(nNpcIndex);
	SetGlbValue(1014, nNpcIndex);
	SetGlbValue(1015, nMapId);
	SetGlbValue(1016, nMapX);
	SetGlbValue(1017, nMapY);
	
	SubWorld = SubWorldID2Idx(nMapId);
	OpenMission(48, nMapId);
end