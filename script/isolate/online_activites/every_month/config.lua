--会经常修改的配置项写这里

szMaterialItem  = "mooncake"  --which MaterialItem group of tActivityItems to use
tFinalPrizeSelection = {--最终奖励的选择
		[1] = {"exp2g_shengwang10k_shimen10k", "finish_pet_task", "exp1g_yuntielinshi",},
		[2] = {"exp2g_shengwang10k_shimen10k", "exp1g_zhenqi", "exp1g_dinghunyuntieshenshi",},
		[3] = {"ib_final1",},
}




--never modify below
-------------------------------------------------------------------------
_tActivityItems = { --all history used items define here, recycle used
	["firecracker"] = { --201604节日爆竹
		{"Ng遡 Ph竜",  {2, 200, 1} },
		{"鑞g Ph鉵g", {2, 200, 2} },
		{"Thu鑓 N�", {2, 200, 3} },
		{"Ph竜 Hoa Huy Ho祅g", {2, 200, 4} },
		{"Ph竜 Hoa R鵦 R�", {2, 200, 5} },
		{"Ph竜 Hoa Чi L�", {2, 200, 6} },
	},
	["soups"] = { --201605
		{"C竎 lo筰 u",  {2, 200, 7} },
		{"Л阯g Ph蘮", {2, 200, 8} },
		{"H箃 Sen", {2, 200, 9} },
		{"Ch� ba m祏", {2, 200, 10} },
		{"Ch� Th藀 C萴", {2, 200, 11} },
		{"Ch� Sen", {2, 200, 12} },
	},
	["toys"] = { --201606
		{"Di襲 Gi蕐",  {2, 200, 13} },
		{"Con Quay", {2, 200, 14} },
		{"Robot", {2, 200, 15} },
		{"H閜 у Ch琲 Nh�", {2, 200, 16} },
		{"H閜 у Ch琲 L韓", {2, 200, 17} },
		{"Th飊g у Ch琲", {2, 200, 18} },
	},
	["phoenix_flower"] = { --201607
		{"B髏 M鵦",  {2, 200, 19} },
		{"T藀 V�", {2, 200, 20} },
		{"Hoa Ph鬾g Ho祅g", {2, 200, 21} },
		{"K� Y誹", {2, 200, 22} },
		{"L璾 B髏", {2, 200, 23} },
		{"S� Tay K� Ni謒", {2, 200, 24} },
	},
	["tanabata"] = {--201608
		{"Nc M総 Ch鴆 N�",  {2, 200, 25} },
		{"сa Hoa Ng璾 Lang", {2, 200, 26} },
		{"C莡 � Thc", {2, 200, 27} },
		{"H閜 Qu� Ng璾 Lang", {2, 200, 28} },
		{"H閜 Qu� Ch鴆 N�", {2, 200, 29} },
		{"H閜 Qu� Uy猲 Μng", {2, 200, 30} },
	},
	["mooncake"] = {--201609
		{"B閠 m�",  {2, 200, 31} },
		{"Nh﹏ B竛h", {2, 200, 32} },
		{"Nh﹏ B竛h Th藀 C萴", {2, 200, 33} },
		{"B竛h trung thu", {2, 200, 34} },
		{"B竛h c bi謙", {2, 200, 35} },
		{"B竛h th藀 c萴", {2, 200, 36} },
	},
}
--tConfig会跟别的活动冲突，所以副活动会用到的一些配置项写在外面
--三个材料道具
tMainActivityMaterials ={
	_tActivityItems[szMaterialItem][1],
	_tActivityItems[szMaterialItem][2],
	_tActivityItems[szMaterialItem][3],
}
--三个最终产品道具
tMainActivityProducts ={
	_tActivityItems[szMaterialItem][4],
	_tActivityItems[szMaterialItem][5],
	_tActivityItems[szMaterialItem][6],
}
_tActivityItems = nil--这个表没用了

tConfig = { 
	tMaterials = tMainActivityMaterials,
	tProducts = tMainActivityProducts,
	tFinalPrizeSel = tFinalPrizeSelection,
}
