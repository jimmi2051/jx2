--�ᾭ���޸ĵ�������д����

szMaterialItem  = "mooncake"  --which MaterialItem group of tActivityItems to use
tFinalPrizeSelection = {--���ս�����ѡ��
		[1] = {"exp2g_shengwang10k_shimen10k", "finish_pet_task", "exp1g_yuntielinshi",},
		[2] = {"exp2g_shengwang10k_shimen10k", "exp1g_zhenqi", "exp1g_dinghunyuntieshenshi",},
		[3] = {"ib_final1",},
}




--never modify below
-------------------------------------------------------------------------
_tActivityItems = { --all history used items define here, recycle used
	["firecracker"] = { --201604���ձ���
		{"Ng�i Ph�o",  {2, 200, 1} },
		{"�ng Ph�ng", {2, 200, 2} },
		{"Thu�c N�", {2, 200, 3} },
		{"Ph�o Hoa Huy Ho�ng", {2, 200, 4} },
		{"Ph�o Hoa R�c R�", {2, 200, 5} },
		{"Ph�o Hoa ��i L�", {2, 200, 6} },
	},
	["soups"] = { --201605
		{"C�c lo�i ��u",  {2, 200, 7} },
		{"���ng Ph�n", {2, 200, 8} },
		{"H�t Sen", {2, 200, 9} },
		{"Ch� ba m�u", {2, 200, 10} },
		{"Ch� Th�p C�m", {2, 200, 11} },
		{"Ch� Sen", {2, 200, 12} },
	},
	["toys"] = { --201606
		{"Di�u Gi�y",  {2, 200, 13} },
		{"Con Quay", {2, 200, 14} },
		{"Robot", {2, 200, 15} },
		{"H�p �� Ch�i Nh�", {2, 200, 16} },
		{"H�p �� Ch�i L�n", {2, 200, 17} },
		{"Th�ng �� Ch�i", {2, 200, 18} },
	},
	["phoenix_flower"] = { --201607
		{"B�t M�c",  {2, 200, 19} },
		{"T�p V�", {2, 200, 20} },
		{"Hoa Ph�ng Ho�ng", {2, 200, 21} },
		{"K� Y�u", {2, 200, 22} },
		{"L�u B�t", {2, 200, 23} },
		{"S� Tay K� Ni�m", {2, 200, 24} },
	},
	["tanabata"] = {--201608
		{"N��c M�t Ch�c N�",  {2, 200, 25} },
		{"��a Hoa Ng�u Lang", {2, 200, 26} },
		{"C�u � Th��c", {2, 200, 27} },
		{"H�p Qu� Ng�u Lang", {2, 200, 28} },
		{"H�p Qu� Ch�c N�", {2, 200, 29} },
		{"H�p Qu� Uy�n ��ng", {2, 200, 30} },
	},
	["mooncake"] = {--201609
		{"B�t m�",  {2, 200, 31} },
		{"Nh�n B�nh", {2, 200, 32} },
		{"Nh�n B�nh Th�p C�m", {2, 200, 33} },
		{"B�nh trung thu", {2, 200, 34} },
		{"B�nh ��c bi�t", {2, 200, 35} },
		{"B�nh th�p c�m", {2, 200, 36} },
	},
}
--tConfig�����Ļ��ͻ�����Ը�����õ���һЩ������д������
--�������ϵ���
tMainActivityMaterials ={
	_tActivityItems[szMaterialItem][1],
	_tActivityItems[szMaterialItem][2],
	_tActivityItems[szMaterialItem][3],
}
--�������ղ�Ʒ����
tMainActivityProducts ={
	_tActivityItems[szMaterialItem][4],
	_tActivityItems[szMaterialItem][5],
	_tActivityItems[szMaterialItem][6],
}
_tActivityItems = nil--�����û����

tConfig = { 
	tMaterials = tMainActivityMaterials,
	tProducts = tMainActivityProducts,
	tFinalPrizeSel = tFinalPrizeSelection,
}
