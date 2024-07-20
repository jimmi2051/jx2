Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

T_BoxScript = {
	"\\script\\missions\\dixuangong\\npc\\box_tong1.lua",
	"\\script\\missions\\dixuangong\\npc\\box_tong2.lua",
	nil,
	"\\script\\missions\\dixuangong\\npc\\box_tong4.lua",
	"\\script\\missions\\dixuangong\\npc\\box_tong5.lua",
	"\\script\\missions\\dixuangong\\npc\\box_tong6.lua",
	nil,
}

T_TONG_BOX_IDX = {}
function remove_tong_box()
	for i,v in T_TONG_BOX_IDX do
		if GetNpcName(i) == "Rng уng" then
			SetNpcLifeTime(i, 0);
		end
	end
	T_TONG_BOX_IDX = {}
end

function create_box_tong(nNpcIdx, nBoxId)
	if not T_BoxScript[nBoxId] then
		return
	end
	local m, x, y = GetNpcWorldPos(nNpcIdx);
	--天阴密箱1个
	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
	local npc = CreateNpc("tongbaoxiang", "Rng уng", m, x2, y2);
	if npc and npc > 0 then
		T_TONG_BOX_IDX[npc]  = 1
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_BoxScript[nBoxId]);
	else
		print("create tongbaoxiang fail")
	end
end
        
tClause1 = {
    --{{"小传功丹",{2,1,30312,1,4}},10*30},
    {{"M秐h Tu Ch﹏ Y誹 Quy誸",{2,1,30315,1,4}},20},
    {{"Thi誸 Tinh c蕄 1",{2,1,30533,1,4}},40},
    {{"Thi誸 Tinh c蕄 2",{2,1,30534,1,4}},40},
    {{"Thi誸 Tinh c蕄 3",{2,1,30535,1,4}},30},
}
tClause2 = {
    --{{"小传功丹",{2,1,30312,1,4}},10*10},
    {{"M秐h Tu Ch﹏ Y誹 Quy誸",{2,1,30315,1,4}},10},
    {{"Thi誸 Tinh c蕄 1",{2,1,30533,1,4}},40},
    {{"Thi誸 Tinh c蕄 2",{2,1,30534,1,4}},30},
    {{"Thi誸 Tinh c蕄 3",{2,1,30535,1,4}},10},
    {{"竜 Cho祅g T筼 B�",{0,152,1,1,4}},10},
}
tClause4 = {
    {{"T� Linh Quy Nguy猲 Кn",{2,1,30352,1,4}},5},
    {{"B錳 Nguy猲 Кn",{2,1,30351,1,4}},5},
    --{{"传功丹",{2,1,30313,1,4}},10*5},
    {{"M秐h Tu Ch﹏ Y誹 Quy誸",{2,1,30315,1,4}},5},
    {{"Thi誸 Tinh c蕄 1",{2,1,30533,1,4}},10},
    {{"Thi誸 Tinh c蕄 2",{2,1,30534,1,4}},10},
    {{"Thi誸 Tinh c蕄 3",{2,1,30535,1,4}},15},
    {{"竜 Cho祅g T筼 B�",{0,152,1,1,4}},15},
    {{"竜 Cho祅g C萴 筺",{0,152,2,1,4}},20},
    {{"竜 Cho祅g H醓 V﹏",{0,152,3,1,4}},15},
} 
tClause5 = {
    --{{"武林早报",{2,1,30314,1,4}},10*5},
    {{"Th竛h V藅 S� M玭",{2,1,30311,1,4}},5},
    --{{"传功丹",{2,1,30313,1,4}},10*5},
    {{"M秐h Tu Ch﹏ Y誹 Quy誸",{2,1,30315,1,4}},5},
    {{"Thi誸 Tinh c蕄 1",{2,1,30533,1,4}},10},
    {{"Thi誸 Tinh c蕄 2",{2,1,30534,1,4}},10},
    {{"Thi誸 Tinh c蕄 3",{2,1,30535,1,4}},20},
    {{"竜 Cho祅g T筼 B�",{0,152,1,1,4}},15},
    {{"竜 Cho祅g C萴 筺",{0,152,2,1,4}},20},
    {{"竜 Cho祅g H醓 V﹏",{0,152,3,1,4}},15},
}
tClause6 = {
    --{{"武林早报",{2,1,30314,1,4}},10*5},
    {{"Th竛h V藅 S� M玭",{2,1,30311,1,4}},5},
    --{{"传功丹",{2,1,30313,1,4}},10*5},
    {{"M秐h Tu Ch﹏ Y誹 Quy誸",{2,1,30315,1,4}},5},
    {{"Thi誸 Tinh c蕄 1",{2,1,30533,1,4}},10},
    {{"Thi誸 Tinh c蕄 2",{2,1,30534,1,4}},10},
    {{"Thi誸 Tinh c蕄 3",{2,1,30535,1,4}},20},
    {{"竜 Cho祅g T筼 B�",{0,152,1,1,4}},15},
    {{"竜 Cho祅g C萴 筺",{0,152,2,1,4}},20},
    {{"竜 Cho祅g H醓 V﹏",{0,152,3,1,4}},15},
}                              

tClause = {
	tClause1,
	tClause2,
	nil,--tClause3,
	tClause4,
	tClause5,
	tClause6,
	nil,--tClause7,
}

function on_open(nStage)
	local tItem = gf_RandRate(tClause[nStage], nil, 2)[1];
	gf_ThrowDice(tItem[2], nil, nil, nil, nil, GetTargetNpc());
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");
	gf_TeamOperateEX(vaf_award_api, "tDXGTongBox")
	FireEvent("event_mission_box_award", "dixuangong", "copper", nStage)
end

