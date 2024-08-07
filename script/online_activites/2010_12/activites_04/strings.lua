--=============================================
--create by xiongyizhi 2010.11.2
--describe:越南版2010年12月活动1 字符串文件
--=============================================

VET_201012_04_STR_LOG_TITLE = "Hoat dong trong cay giang sinh thang 12 nam 2010";--本次活动日志标题

VET_201012_04_TB_LOG_ACTION_LIST = {
    [1] = "фi ph莕 thng Qu� T� Linh",
    [2] = "Tr錸g c﹜ T� Linh",
    [3] = "Tr錸g c﹜ T� Linh nh薾 頲 ph莕 thng",
    [4] = "Tr閙 c﹜ T� Linh nh薾 頲 ph莕 thng",
    [5] = "C﹜ T� Linh b� tr閙 nh薾 頲 ph莕 thng",
    [6] = "Mua o c� C﹜ T� Linh"
};

VET_201012_04_NPC_TB = {
    [1] = {"Nguy謙 L穙", "B竎h Th秓 Ti猲"},
    [2] = {"C﹜ T� Linh 1", "C﹜ T� Linh"}; --TODO 替换成相应模型
};

VET_201012_04_NPC_TALK_TITLE = "<color=yellow>B竎h Th秓 Ti猲<color>: ".."C竎 h� c莕 g�?";

VET_201012_04_NPC_TALK_STRINGS = {
    [1] = "фi c竎 lo筰 Tr竔 C﹜ T� Linh nh薾 thng/ExChange_4_soul_award",
    [2] = "Mua c竎 lo筰 o c� tr錸g v� thu th藀 c﹜ T� Linh/buy_item_for_plant_4_soul",
    [3] = "K誸 th骳 i tho筰/gf_DoNothing",
    [4] = "Giao n閜 %s i ph莕 thng",
    [5] = "K誸 th骳 i tho筰",
    [6] = "S� lng Qu� T� Linh kh玭g ",
    [7] = "C﹜ n祔  b� tr閙 qua r錳, h穣  l筰 cho ch� nh﹏ th玦",
    [8] = "C竎 h� c莕 g�",
    [9] = "%s  c莕  %s",
    [10] = "Hi謓 trong giai 畂筺 %s, c竎h giai 畂筺 k� ti誴 c遪 %d gi﹜",
    [11] = "Nguy猲 li謚 ch╩ s鉩 kh玭g ",
    [12] = "C﹜  trng th祅h, c竎 h� mu鑞 thu th藀 kh玭g?",
    [13] = "Thu th藀 c﹜",
    [14] = "мa 甶觤 tr錸g c﹜: T﹜ Th祅h Й, T﹜ Bi謓 Kinh, B綾 Tuy襫 Ch﹗",
    [15] = "Nh﹏ v藅 c莕 t tr猲 c蕄 73",	-- gia nh藀 m玭 ph竔, , danh v鋘g = 3000, 甶觤 s� m玭 = 4000
    [16] = "C遪 %d gi﹜ n鱝 m韎 c� th� thu th藀",
    [17] = " tr錸g ",
    [18] = "Ch� 頲 thu ho筩h theo giai 畂筺",
    [19] = "S� lng c﹜ b筺 tr錸 h玬 nay  t gi韎 h筺, h穣 tr錸g ti誴 v祇 ng祔 mai",
    [20] = "S� lng tr竔 c﹜ c竎 h� giao n閜 h玬 nay  t gi韎 h筺, h穣 quay l筰 v祇 ng祔 mai",
    [21] = "H穣 x竎 nh l筰 kh玭g gian h祅h trang",
    [22] = "Mua C﹜ T� Linh (15 xu)",
    [23] = "Mua B譶h Ti猲 L� (ti c﹜ T� Linh) (20 b筩)",
    [24] = "Mua B譶h Ph﹏ B鉵 (b鉵 ph﹏ c﹜ T� Linh) (20 b筩)",
    [25] = "Mua Thu鑓 Tr� S﹗ (20 b筩)",
    [26] = "C竎 h� c莕 mua bao nhi猽?",
    [27] = "Kh玭g  ti襫",
    [28] = "C﹜ T� Linh",
    [29] = "Ho箃 ng n祔 ch� hng n nh鱪g ngi ch琲  tham gia m玭 ph竔 th玦, t筰 h� ph秈 gia nh藀 m閠 m玭 ph竔 b蕋 k� r錳 tham gia ho箃 ng nh�!",
};

VET_201012_04_TB_ITEM = {
    [1] = {"Thanh Long Qu�", {2, 1, 30270}},
    [2] = {"H醓 Ph鬾g Hoa", {2, 1, 30271}},
    [3] = {"B筩h H� Di謕", {2, 1, 30272}},
    [4] = {"Huy襫 V� C╪", {2, 1, 30273}},
};

VET_201012_04_TB_AWARD = {
    [1] = {{15, 0, 0, 0}, 1500000},  --第一个表表示需要15个第一种水果（青龙果），对应奖励经验数为1500000
    [2] = {{0, 15, 0, 0}, 1500000},
    [3] = {{0, 0, 15, 0}, 1500000},
    [4] = {{0, 0, 0, 15}, 1500000},
    [5] = {{15, 15, 15, 15}, 6000000}, --需要4种水果各15个
};

--对应每个成长阶段的条件，
--以成长（1）为例，
--{"阶段名称", "模板名", {消耗子表}, 阶段持续时间}
--
--{消耗子表},每个元素第一位是消耗物品ID{G, D, P}，后一位是数量，可以填多个消耗品，可以填不同数量,为空则不消耗
--由于消耗的材料和对应描述动作不同，映射表在VET_201012_04_TREE_ITEM_TO_ACTION
function is_2015_12_act_time()
	local today = tonumber(date("%Y%m%d"))
	if today >= 20151220 and today <= 20160105 then
		return 1
	end
	return 0
end
if is_2015_12_act_time()== 1 then
VET_201012_04_TB_TREE_GROW = {
    [1] = {"C﹜ gi鑞g", "C﹜ Gi竛g sinh 3d",nil, 60},
    [2] = {"Ph竧 tri觧 (1)", "C﹜ Gi竛g sinh 3d", {
                                  {{2, 1, 30274}, 1}, 
                                  {{2, 1, 30275}, 1},
                                 }, 60},
    [3] = {"Ph竧 tri觧 (2)", "C﹜ Gi竛g sinh 3c", {
                                    {{2, 1, 30275}, 1}, 
                                    {{2, 1, 30276}, 1},
                                   }, 60},
    [4] = {"Ph竧 tri觧 (3)", "C﹜ Gi竛g sinh 3c", {
                                    {{2, 1, 30274}, 1}, 
                                    {{2, 1, 30276}, 1},
                                   }, 60},
    [5] = {"Ph竧 tri觧 (4)", "C﹜ Gi竛g sinh 3c", {
                                    {{2, 1, 30274}, 1}, 
                                    {{2, 1, 30275}, 1},
                                   }, 60},
    [6] = {"Ph竧 tri觧 (5)", "C﹜ Gi竛g sinh 3c", {
                                    {{2, 1, 30276}, 1}, 
                                    {{2, 1, 30275}, 1},
                                   }, 60},
    [7] = {"Thu ho筩h", "C﹜ Gi竛g sinh 3a", nil, 60},
};
else
VET_201012_04_TB_TREE_GROW = {
    [1] = {"C﹜ gi鑞g", "C﹜ T� Linh 1",nil, 60},
    [2] = {"Ph竧 tri觧 (1)", "C﹜ T� Linh 1", {
                                  {{2, 1, 30274}, 1}, 
                                  {{2, 1, 30275}, 1},
                                 }, 60},
    [3] = {"Ph竧 tri觧 (2)", "C﹜ T� Linh 2_1", {
                                    {{2, 1, 30275}, 1}, 
                                    {{2, 1, 30276}, 1},
                                   }, 60},
    [4] = {"Ph竧 tri觧 (3)", "C﹜ T� Linh 2_2", {
                                    {{2, 1, 30274}, 1}, 
                                    {{2, 1, 30276}, 1},
                                   }, 60},
    [5] = {"Ph竧 tri觧 (4)", "C﹜ T� Linh 3_1", {
                                    {{2, 1, 30274}, 1}, 
                                    {{2, 1, 30275}, 1},
                                   }, 60},
    [6] = {"Ph竧 tri觧 (5)", "C﹜ T� Linh 3_2", {
                                    {{2, 1, 30276}, 1}, 
                                    {{2, 1, 30275}, 1},
                                   }, 60},
    [7] = {"Thu ho筩h", "C﹜ T� Linh 4", nil, 60},
};
end

--只是把消耗的道具和相应的动作名称对应一下,由ITEM表扩展，结合上表
VET_201012_04_TREE_ITEM_TO_ACTION = {
    [1] = {"B譶h ti猲 l�", {2, 1, 30274}, "Ti nc"},
    [2] = {"Binh ph﹏ b鉵", {2, 1, 30275}, "B鉵 ph﹏"},
    [3] = {"Thu鑓 tr� s﹗", {2, 1, 30276}, "Tr� s﹗"},
};

