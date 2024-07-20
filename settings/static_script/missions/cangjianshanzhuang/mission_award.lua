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
	n_other_group_rate = 10000,--�����������ĸ���
	n_equip_group_rate = 0,--�����װ����ĸ���
	n_daibi_group_rate = 0,--�����������ĸ���
	t_daibi_group =
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg, {nNeedRoom, nNeedWeight}}
        --{{"��ϼ�ؼ�",{0,107,65,1, 4}, 720, bGblMsg}, 150},
        --t_item_para = {{function, {nCount, nBind, nExpireDays, bGblMsg, {nNeedRoom, nNeedWeight}}}, rate}
        --{{MissionAward_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
--        { {"����ʯ", {2,1,30368,1}, nil,nil, {1, 100}}, 1000},
--        { {"����ʯ", {2,1,30368,2}, nil,nil, {1, 100}}, 1000},
--        { {"����ʯ", {2,1,30368,3}, nil,nil, {1, 100}}, 1000},
--        { {"����ʯ", {2,1,30368,4}, nil,nil, {1, 100}}, 1000},
--        { {"����ʯ", {2,1,30368,5}, nil,nil, {1, 100}}, 1000},
--        { {"����ʯ", {2,1,30368,6}, nil,nil, {1, 100}}, 1000},
--        { {"����ʯ", {2,1,30368,7}, nil,nil, {1, 100}}, 1000},
--        { {"����ʯ", {2,1,30368,8}, nil,nil, {1, 100}}, 1000},
--        { {"����ʯ", {2,1,30368,9}, nil,nil, {1, 100}}, 800},
--        { {"����ʯ", {2,1,30368,10}, nil,nil, {1, 100}}, 500},
--        { {"����ʯ", {2,1,30368,15}, nil,nil, {1, 100}}, 300},
--        { {"����ʯ", {2,1,30368,20}, nil,nil, {1, 100}}, 200},
--        { {"����ʯ", {2,1,30368,30}, nil,nil, {1, 100}}, 100},
--        { {"����ʯ", {2,1,30368,40}, nil,nil, {1, 100}}, 100},
	},
	--------------------------------------------
	t_other_group = --������
	{
        { {"C�y B�t Nh� nh�", {2,0,504,1,4}, 7,nil, {1, 100}}, 600},
        { {"C�y B�t Nh�", {2,0,398,1,4}, 7,nil, {1, 100}}, 600},
        { {"C�y T� Linh", {2,1,30269,1,4}, 7,nil, {1, 100}}, 600},
        --{ {"������", {2,1,30313,1,4}, 7,nil, {1, 100}}, 600},
        { {"Tu Ch�n Y�u Quy�t", {2,0,554,1,4}, 7,nil, {1, 100}}, 600},
        { {"Thi�n L� Truy�n �m Ph� Ch�", {2,1,3508,1,4}, nil,nil, {1, 100}}, 300},
        { {"T� Linh Quy Nguy�n ��n", {2,1,30352,1,4}, 7,nil, {1, 100}}, 500},
        { {"B�i Nguy�n ��n", {2,1,30351,1,4}, 7,nil, {1, 100}}, 600},
        { {"B�ng Tinh Th�ch", {2,1,30554,1,4}, nil,nil, {1, 100}}, 500},
        { {"B�ch C�u Ho�n", {2,1,270,1,4}, 7,nil, {1, 100}}, 500},
        { {"T�y T�m Th�ch Kho�ng", {2,1,30536,1}, nil,nil, {1, 100}}, 300},
        { {"Luy�n L� Thi�t Kho�ng", {2,1,30537,1}, nil,nil, {1, 100}}, 300},
        { {"T�i ti�n", {2,1,30367,1,4}, nil,nil, {1, 100}}, 500},
        { {"Thi�t Tinh c�p 1", {2,1,30533,1,4}, nil,nil, {1, 100}}, 500},
        { {"Thi�t Tinh c�p 2", {2,1,30534,1,4}, nil,nil, {1, 100}}, 550},
        { {"Thi�t Tinh c�p 3", {2,1,30535,1,4}, nil,nil, {1, 100}}, 947},
        { {"Gi�y V�i Th�", {0,154,1,1}, nil,nil, {1, 100}}, 600},
        { {"Tinh Tr� B� H�i", {0,154,2,1}, nil,nil, {1, 100}}, 600},
        { {"B� Ch� Cao ��ng Ngoa", {0,154,3,1}, nil,nil, {1, 100}}, 600},
        { {"Chi�n H�i Kim Ch� ng� h�nh", {0,154,4,1}, nil,nil, {1, 100}}, 50},
        { {"Chi�n H�i M�c Ch� ng� h�nh", {0,154,5,1}, nil,nil, {1, 100}}, 50},
        { {"Chi�n H�i Th�y Ch� ng� h�nh", {0,154,6,1}, nil,nil, {1, 100}}, 50},
        { {"Chi�n H�i H�a Ch� ng� h�nh", {0,154,7,1}, nil,nil, {1, 100}}, 50},
        { {"Chi�n H�i Th� Ch� ng� h�nh", {0,154,8,1}, nil,nil, {1, 100}}, 50},
        { {"Chi�n H�i �m Ch� ng� h�nh", {0,154,9,1}, nil,nil, {1, 100}}, 50},
        { {"Tr��ng H�i Du Hi�p", {0,154,26,1}, nil,1, {1, 100}}, 1},
        { {"Chi�n H�i Thi�t Huy�t", {0,154,27,1}, nil,1, {1, 100}}, 1},
        { {"��o H�i V�n Du", {0,154,28,1}, nil,1, {1, 100}}, 1},
	},
};
_t_free_award_stage =
{
--	[1] =
--		{
--			n_equip_group_rate = 1000,--�����װ����ĸ���
--			n_daibi_group_rate = 3000,--�����������ĸ���
--        	t_equip_group = --װ����
--        	{
--        		----tPara = {nCount, nBind, nExpireDays, bGblMsg}
--        		{{MA_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
--        	},
--		},
--	[2] =
--		{
--			n_equip_group_rate = 1000,--�����װ����ĸ���
--			n_daibi_group_rate = 4000,--�����������ĸ���
--        	t_equip_group = --װ����
--        	{
--        		{{MA_GiveFactionEquip4, {1, nil, nil, 0, {1, 300}}}, 9000},
--        		{{MA_GiveLevel1WenShi, {1, nil, nil, 0, {1, 100}}}, 1000},
--        	},
--		},
--	[3] =
--		{
--			n_equip_group_rate = 1000,--�����װ����ĸ���
--			n_daibi_group_rate = 5000,--�����������ĸ���
--        	t_equip_group = --װ����
--        	{
--        		{{MA_GiveFactionEquip4, {1, nil, nil, 0, {1, 300}}}, 6000},
--        		{{MA_GiveLevel1WenShi, {1, nil, nil, 0, {1, 100}}}, 1000},
--        		{{MA_GiveFactionEquip5, {1, nil, nil, 0, {1, 300}}}, 3000},
--        	},
--		},
--	[4] =
--		{
--			n_equip_group_rate = 1000,--�����װ����ĸ���
--			n_daibi_group_rate = 5000,--�����������ĸ���
--        	t_equip_group = --װ����
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
	t_cost = --����
	{
		--{"��ϼ�ؼ�",{0,107,65,1, 4}},
		{"Thi�n Ki�u L�nh",{2, 97, 236,1},_stat_when_ib_consume},
		
	},
	t_ib_award =--ib����
	{
        { {"C�y B�t Nh� nh�", {2,0,504,1}, 7,nil, {1, 100}}, 600},
        { {"C�y B�t Nh�", {2,0,398,1}, 7,nil, {1, 100}}, 600},
        { {"C�y T� Linh", {2,1,30269,1}, 7,nil, {1, 100}}, 600},
        { {"B�ch C�u Ho�n", {2,1,270,1}, 7,nil, {1, 100}}, 600},
        { {"��i B�ch C�u ho�n", {2,1,1007,1}, 7,nil, {1, 100}}, 600},
        { {"B�ch C�u Ti�n ��n", {2,1,1008,1}, 7,nil, {1, 100}}, 600},
        { {"��i Nh�n s�m", {2,0,553,1}, 7,nil, {1, 100}}, 500},
        { {"Hu�n ch��ng anh h�ng", {2,1,30499,1,4}, nil,nil, {1, 100}}, 1506},
        { {"Hu�n ch��ng anh h�ng", {2,1,30499,2,4}, nil,nil, {1, 100}}, 500},
        { {"Hu�n ch��ng anh h�ng", {2,1,30499,4,4}, nil,nil, {1, 100}}, 100},
        { {"Hu�n ch��ng anh h�ng", {2,1,30499,10,4}, nil,nil, {1, 100}}, 123},
        { {"L�i H� Tinh Ph�ch", {2,1,30614,1}, nil,1, {1, 100}}, 300},
        { {"L�i H� Tinh Ph�ch", {2,1,30614,2}, nil,1, {1, 100}}, 200},
        { {"L�i H� Tinh Ph�ch", {2,1,30614,4}, nil,1, {1, 100}}, 50},
        { {"Gi�y V�i Th�", {0,154,1,1}, nil,nil, {1, 100}}, 400},
        { {"Tinh Tr� B� H�i", {0,154,2,1}, nil,nil, {1, 100}}, 400},
        { {"B� Ch� Cao ��ng Ngoa", {0,154,3,1}, nil,nil, {1, 100}}, 306},
        { {"Chi�n H�i Kim Ch� ng� h�nh", {0,154,4,1}, nil,nil, {1, 100}}, 100},
        { {"Chi�n H�i M�c Ch� ng� h�nh", {0,154,5,1}, nil,nil, {1, 100}}, 100},
        { {"Chi�n H�i Th�y Ch� ng� h�nh", {0,154,6,1}, nil,nil, {1, 100}}, 100},
        { {"Chi�n H�i H�a Ch� ng� h�nh", {0,154,7,1}, nil,nil, {1, 100}}, 100},
        { {"Chi�n H�i Th� Ch� ng� h�nh", {0,154,8,1}, nil,nil, {1, 100}}, 100},
        { {"Chi�n H�i �m Ch� ng� h�nh", {0,154,9,1}, nil,nil, {1, 100}}, 100},
        { {"M�nh Thi�n M�n", {2,1,30410,2}}, 500},
				{ {"M�nh Thi�n M�n", {2,1,30410,4}}, 200},
				{ {"M�nh Thi�n M�n", {2,1,30410,20}}, 50},
				{ {"Thi�n M�n Kim L�nh", {2,1,30370,1},msg}, 10},
        { {"Tr��ng H�i Du Hi�p", {0,154,26,1}, nil,1, {1, 100}}, 30},
        { {"Chi�n H�i Thi�t Huy�t", {0,154,27,1}, nil,1, {1, 100}}, 30},
        { {"��o H�i V�n Du", {0,154,28,1}, nil,1, {1, 100}}, 30},
        { {"Ho�ng Kim ��i H�ng Bao (tr�ng)", {2,1,538,1},nil,{15*24*3600}}, 500},
				{ {"B�ch Kim ��i H�ng Bao (kh�ng)", {2,1,30228,1},nil,{15*24*3600}}, 65},
	},
}

t_award = 
{
	--------------------------------------------
	t_free_award = 
	{
		sz_award_title = "Khu l�t b�i mi�n ph� V�n Ki�m Tr�ng",
		--����û�еõ�װ��ʱ�س�װ��
		t_equip_round = {},
		n_max_daibi_perday = 30,--һ������ö��ٴ���
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
		sz_award_title = "Ph�n th��ng c� ��nh �i V�n Ki�m Tr�ng",
		t_stage = _t_fix_award_stage,
	},
	--------------------------------------------
	t_ib_award = 
	{
		sz_award_title = "Khu l�t b�i thu ph� V�n Ki�m Tr�ng",
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
