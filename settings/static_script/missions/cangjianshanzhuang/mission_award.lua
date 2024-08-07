Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\mission_award_hard.lua")

Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\runtime_data_stat.lua")

tbNormalAward = 
{
	[1] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,2000000,1},
		},
	},
	[2] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,2500000,1},
		},
	},
	[3] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,3000000,1},
		},
	},
	[4] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,3500000,1},
		},
	},
}

_t_free_award_no_stage =
{
	n_other_group_rate = 10000,--随机到代币组的概率
	n_equip_group_rate = 0,--随机到装备组的概率
	n_daibi_group_rate = 0,--随机到代币组的概率
	t_daibi_group =
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg, {nNeedRoom, nNeedWeight}}
        --{{"紫霞秘籍",{0,107,65,1, 4}, 720, bGblMsg}, 150},
        --t_item_para = {{function, {nCount, nBind, nExpireDays, bGblMsg, {nNeedRoom, nNeedWeight}}}, rate}
        --{{MissionAward_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
--        { {"古灵石", {2,1,30368,1}, nil,nil, {1, 100}}, 1000},
--        { {"古灵石", {2,1,30368,2}, nil,nil, {1, 100}}, 1000},
--        { {"古灵石", {2,1,30368,3}, nil,nil, {1, 100}}, 1000},
--        { {"古灵石", {2,1,30368,4}, nil,nil, {1, 100}}, 1000},
--        { {"古灵石", {2,1,30368,5}, nil,nil, {1, 100}}, 1000},
--        { {"古灵石", {2,1,30368,6}, nil,nil, {1, 100}}, 1000},
--        { {"古灵石", {2,1,30368,7}, nil,nil, {1, 100}}, 1000},
--        { {"古灵石", {2,1,30368,8}, nil,nil, {1, 100}}, 1000},
--        { {"古灵石", {2,1,30368,9}, nil,nil, {1, 100}}, 800},
--        { {"古灵石", {2,1,30368,10}, nil,nil, {1, 100}}, 500},
--        { {"古灵石", {2,1,30368,15}, nil,nil, {1, 100}}, 300},
--        { {"古灵石", {2,1,30368,20}, nil,nil, {1, 100}}, 200},
--        { {"古灵石", {2,1,30368,30}, nil,nil, {1, 100}}, 100},
--        { {"古灵石", {2,1,30368,40}, nil,nil, {1, 100}}, 100},
	},
	--------------------------------------------
	t_other_group = --杂物组
	{
        { {"C﹜ B竧 Nh� nh�", {2,0,504,1,4}, 7,nil, {1, 100}}, 600},
        { {"C﹜ B竧 Nh�", {2,0,398,1,4}, 7,nil, {1, 100}}, 600},
        { {"C﹜ T� Linh", {2,1,30269,1,4}, 7,nil, {1, 100}}, 600},
        --{ {"传功丹", {2,1,30313,1,4}, 7,nil, {1, 100}}, 600},
        { {"Tu Ch﹏ Y誹 Quy誸", {2,0,554,1,4}, 7,nil, {1, 100}}, 600},
        { {"Thi猲 L� Truy襫  Ph� Ch�", {2,1,3508,1,4}, nil,nil, {1, 100}}, 300},
        { {"T� Linh Quy Nguy猲 Кn", {2,1,30352,1,4}, 7,nil, {1, 100}}, 500},
        { {"B錳 Nguy猲 Кn", {2,1,30351,1,4}, 7,nil, {1, 100}}, 600},
        { {"B╪g Tinh Th筩h", {2,1,30554,1,4}, nil,nil, {1, 100}}, 500},
        { {"B筩h C﹗ Ho祅", {2,1,270,1,4}, 7,nil, {1, 100}}, 500},
        { {"T葃 T﹎ Th筩h Kho竛g", {2,1,30536,1}, nil,nil, {1, 100}}, 300},
        { {"Luy謓 L� Thi誸 Kho竛g", {2,1,30537,1}, nil,nil, {1, 100}}, 300},
        { {"T骾 ti襫", {2,1,30367,1,4}, nil,nil, {1, 100}}, 500},
        { {"Thi誸 Tinh c蕄 1", {2,1,30533,1,4}, nil,nil, {1, 100}}, 500},
        { {"Thi誸 Tinh c蕄 2", {2,1,30534,1,4}, nil,nil, {1, 100}}, 550},
        { {"Thi誸 Tinh c蕄 3", {2,1,30535,1,4}, nil,nil, {1, 100}}, 947},
        { {"Gi祔 V秈 Th�", {0,154,1,1}, nil,nil, {1, 100}}, 600},
        { {"Tinh Tr� B� H礽", {0,154,2,1}, nil,nil, {1, 100}}, 600},
        { {"B� Ch� Cao уng Ngoa", {0,154,3,1}, nil,nil, {1, 100}}, 600},
        { {"Chi課 H礽 Kim Ch� ng� h祅h", {0,154,4,1}, nil,nil, {1, 100}}, 50},
        { {"Chi課 H礽 M閏 Ch� ng� h祅h", {0,154,5,1}, nil,nil, {1, 100}}, 50},
        { {"Chi課 H礽 Th駓 Ch� ng� h祅h", {0,154,6,1}, nil,nil, {1, 100}}, 50},
        { {"Chi課 H礽 H醓 Ch� ng� h祅h", {0,154,7,1}, nil,nil, {1, 100}}, 50},
        { {"Chi課 H礽 Th� Ch� ng� h祅h", {0,154,8,1}, nil,nil, {1, 100}}, 50},
        { {"Chi課 H礽  Ch� ng� h祅h", {0,154,9,1}, nil,nil, {1, 100}}, 50},
        { {"Trng H礽 Du Hi謕", {0,154,26,1}, nil,1, {1, 100}}, 1},
        { {"Chi課 H礽 Thi誸 Huy誸", {0,154,27,1}, nil,1, {1, 100}}, 1},
        { {"Чo H礽 V﹏ Du", {0,154,28,1}, nil,1, {1, 100}}, 1},
	},
};
_t_free_award_stage =
{
--	[1] =
--		{
--			n_equip_group_rate = 1000,--随机到装备组的概率
--			n_daibi_group_rate = 3000,--随机到代币组的概率
--        	t_equip_group = --装备组
--        	{
--        		----tPara = {nCount, nBind, nExpireDays, bGblMsg}
--        		{{MA_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
--        	},
--		},
--	[2] =
--		{
--			n_equip_group_rate = 1000,--随机到装备组的概率
--			n_daibi_group_rate = 4000,--随机到代币组的概率
--        	t_equip_group = --装备组
--        	{
--        		{{MA_GiveFactionEquip4, {1, nil, nil, 0, {1, 300}}}, 9000},
--        		{{MA_GiveLevel1WenShi, {1, nil, nil, 0, {1, 100}}}, 1000},
--        	},
--		},
--	[3] =
--		{
--			n_equip_group_rate = 1000,--随机到装备组的概率
--			n_daibi_group_rate = 5000,--随机到代币组的概率
--        	t_equip_group = --装备组
--        	{
--        		{{MA_GiveFactionEquip4, {1, nil, nil, 0, {1, 300}}}, 6000},
--        		{{MA_GiveLevel1WenShi, {1, nil, nil, 0, {1, 100}}}, 1000},
--        		{{MA_GiveFactionEquip5, {1, nil, nil, 0, {1, 300}}}, 3000},
--        	},
--		},
--	[4] =
--		{
--			n_equip_group_rate = 1000,--随机到装备组的概率
--			n_daibi_group_rate = 5000,--随机到代币组的概率
--        	t_equip_group = --装备组
--        	{
--        		{{MA_GiveFactionEquip5, {1, nil, nil, 0, {1, 300}}}, 6000},
--        		{{MA_GiveLevel1WenShi, {1, nil, nil, 0, {1, 100}}}, 2000},
--        		{{MA_GiveLevel2WenShi, {1, nil, nil, 0, {1, 100}}}, 500},
--        		{{MA_GiveTongTianEquip, {1, nil, nil, 0, {1, 300}}}, 1500},
--        	},
--		},
	[4] = {},
}

_t_fix_award_stage =
{
	[1] =
		{
        	{MA_GiveExp, {600000}},
		},
	[2] =
		{
			{MA_GiveExp, {700000}},
		},
	[3] =
		{
			{MA_GiveExp, {800000}},
		},
	[4] =
		{
			{MA_GiveExp, {900000}},
		},
}

_t_ib_award_no_stage =
{
	t_cost = --消耗
	{
		--{"紫霞秘籍",{0,107,65,1, 4}},
		{"Thi猲 Ki猽 L謓h",{2, 97, 236,1},_stat_when_ib_consume},
		
	},
	t_ib_award =--ib奖励
	{
        { {"C﹜ B竧 Nh� nh�", {2,0,504,1}, 7,nil, {1, 100}}, 600},
        { {"C﹜ B竧 Nh�", {2,0,398,1}, 7,nil, {1, 100}}, 600},
        { {"C﹜ T� Linh", {2,1,30269,1}, 7,nil, {1, 100}}, 600},
        { {"B筩h C﹗ Ho祅", {2,1,270,1}, 7,nil, {1, 100}}, 600},
        { {"Чi B筩h C﹗ ho祅", {2,1,1007,1}, 7,nil, {1, 100}}, 600},
        { {"B筩h C﹗ Ti猲 n", {2,1,1008,1}, 7,nil, {1, 100}}, 600},
        { {"Чi Nh﹏ s﹎", {2,0,553,1}, 7,nil, {1, 100}}, 500},
        { {"Hu﹏ chng anh h飊g", {2,1,30499,1,4}, nil,nil, {1, 100}}, 1506},
        { {"Hu﹏ chng anh h飊g", {2,1,30499,2,4}, nil,nil, {1, 100}}, 500},
        { {"Hu﹏ chng anh h飊g", {2,1,30499,4,4}, nil,nil, {1, 100}}, 100},
        { {"Hu﹏ chng anh h飊g", {2,1,30499,10,4}, nil,nil, {1, 100}}, 123},
        { {"L玦 H� Tinh Ph竎h", {2,1,30614,1}, nil,1, {1, 100}}, 300},
        { {"L玦 H� Tinh Ph竎h", {2,1,30614,2}, nil,1, {1, 100}}, 200},
        { {"L玦 H� Tinh Ph竎h", {2,1,30614,4}, nil,1, {1, 100}}, 50},
        { {"Gi祔 V秈 Th�", {0,154,1,1}, nil,nil, {1, 100}}, 400},
        { {"Tinh Tr� B� H礽", {0,154,2,1}, nil,nil, {1, 100}}, 400},
        { {"B� Ch� Cao уng Ngoa", {0,154,3,1}, nil,nil, {1, 100}}, 306},
        { {"Chi課 H礽 Kim Ch� ng� h祅h", {0,154,4,1}, nil,nil, {1, 100}}, 100},
        { {"Chi課 H礽 M閏 Ch� ng� h祅h", {0,154,5,1}, nil,nil, {1, 100}}, 100},
        { {"Chi課 H礽 Th駓 Ch� ng� h祅h", {0,154,6,1}, nil,nil, {1, 100}}, 100},
        { {"Chi課 H礽 H醓 Ch� ng� h祅h", {0,154,7,1}, nil,nil, {1, 100}}, 100},
        { {"Chi課 H礽 Th� Ch� ng� h祅h", {0,154,8,1}, nil,nil, {1, 100}}, 100},
        { {"Chi課 H礽  Ch� ng� h祅h", {0,154,9,1}, nil,nil, {1, 100}}, 100},
        { {"M秐h Thi猲 M玭", {2,1,30410,2}}, 500},
				{ {"M秐h Thi猲 M玭", {2,1,30410,4}}, 200},
				{ {"M秐h Thi猲 M玭", {2,1,30410,20}}, 50},
				{ {"Thi猲 M玭 Kim L謓h", {2,1,30370,1},msg}, 10},
        { {"Trng H礽 Du Hi謕", {0,154,26,1}, nil,1, {1, 100}}, 30},
        { {"Chi課 H礽 Thi誸 Huy誸", {0,154,27,1}, nil,1, {1, 100}}, 30},
        { {"Чo H礽 V﹏ Du", {0,154,28,1}, nil,1, {1, 100}}, 30},
        { {"Ho祅g Kim Чi H錸g Bao (tr鑞g)", {2,1,538,1},nil,{15*24*3600}}, 500},
				{ {"B筩h Kim Чi H錸g Bao (kh玭g)", {2,1,30228,1},nil,{15*24*3600}}, 65},
	},
}

t_award = 
{
	--------------------------------------------
	t_free_award = 
	{
		sz_award_title = "Khu l藅 b礽 mi詎 ph� V筺 Ki誱 Tr騨g",
		--几次没有得到装备时必出装备
		t_equip_round = {},
		n_max_daibi_perday = 30,--一天最多获得多少代币
		t_stage =
		{
--			[1] = inherit(_t_free_award_no_stage, _t_free_award_stage[1]),
--			[2] = inherit(_t_free_award_no_stage, _t_free_award_stage[2]),
--			[3] = inherit(_t_free_award_no_stage, _t_free_award_stage[3]),
			[4] = inherit(_t_free_award_no_stage, _t_free_award_stage[4]),
		},
	},
	
	t_fix_award = 
	{
		sz_award_title = "Ph莕 thng c� nh 秈 V筺 Ki誱 Tr騨g",
		t_stage = _t_fix_award_stage,
	},
	--------------------------------------------
	t_ib_award = 
	{
		sz_award_title = "Khu l藅 b礽 thu ph� V筺 Ki誱 Tr騨g",
		t_stage = 
		{
--			[1] = _t_ib_award_no_stage,
--			[2] = _t_ib_award_no_stage,
--			[3] = _t_ib_award_no_stage,
			[4] = _t_ib_award_no_stage,
		},
	},
}

_t_free_award_no_stage = nil
_t_free_award_stage = nil
_t_fix_award_stage = nil
_t_ib_award_no_stage = nil
