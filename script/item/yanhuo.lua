--焰火的总调用函数
--created by lizhi
--2005-10-16 20:59

YANHUO_TABLE = {
	{"X輈h M筩 H醓 Di謒", 801, 10, 2, 1, 191},
	{"Tranh M筩 H醓 Di謒", 802, 10, 2, 1, 193},
	{"Lam M筩 H醓 Di謒", 805, 10, 2, 1, 192},
	{"Tranh S綾 Y猲 Hoa", 820, 3, 2, 1, 189},
	{"Lam S綾 Y猲 Hoa", 823, 3, 2, 1, 190},
	{""		   , 808, 5, 2, 1, 194},	--神秘烟花
	{""		   , 811, 5, 2, 1, 194},
	{""		   , 813, 10, 2, 1, 194},
	{""		   , 814, 10, 2, 1, 194},
	{""		   , 817, 10, 2, 1, 194},
	{""		   , 832, 3, 2, 1, 194},
	{""		   , 835, 3, 2, 1, 194},
	{""		   , 838, 1, 2, 1, 194},
	{""        , 841, 1, 2, 1, 194}
};

function use_yanhuo(szName)
	if szName == nil or szName == "" then
		print("S� d鬾g ph竜 hoa b竜 l鏸");
		return
	end
	
	if szName == "Th莕 b� Y猲 Hoa" then
		nCount = getn(YANHUO_TABLE);
		nIndex = random(1, nCount);
		nRetCode = DoFireworks(YANHUO_TABLE[nIndex][2], YANHUO_TABLE[nIndex][3]);
		if nRetCode == 1 then	--成功
			DelItem(2, 1, 194, 1);
		end;
		return
	end;
	
	local nRetCode = 0;
	for index, value in YANHUO_TABLE do
		if value[1] == szName then
			nRetCode = DoFireworks(value[2], value[3]);
			if nRetCode == 1 then	--成功
				DelItem(value[4], value[5], value[6], 1);
			end;
			break
		end;
	end;
end;