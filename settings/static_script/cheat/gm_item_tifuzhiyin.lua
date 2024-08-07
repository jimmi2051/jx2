--体服指引

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\function\\ornament\\ornament.lua")

g_szTitle = "<color=green>Hng d蒼:<color>"

function OnUse(nItem)
ornament_add_score(50000)
	local n,m,l = GetWorldPos();
	Msg2Player(n.."-"..m.."-"..l);
	local tSay = {}
	local nRoute = GetPlayerRoute();
	if nRoute <= 0 then
		tSay = {
			"Gia nh藀 m玭 ph竔/JoinRoute_UpdateLevel",
		}
	else
		tSay = {
			"N﹏g cao ng c蕄 chuy觧 sinh nh﹏ v藅/player_reborn",
			"Nh薾 v╪ s鴆/Get_Popur2",
			"Ti課 c蕄 m藅 t辌h/Get_Popur3",
			--"获取耀杨套装+10/Get_YaoYang_10",
			--"随机获得3级金蛇装备+10/Get_JinShe",
			--format("%s/Process_Equip_LingTu", "获取灵图+10"),
			format("%s/Process_Equip_HaoXia", "Nh薾 頲 H祇 Hi謕 +10"),
			format("%s/Process_SanJianTao", format("Nh藅 trang s鴆 甧o h玭g %s sao", 5)),
			"Nh薾 L璾 Ph竔 Ch﹏ Quy觧 v� Quy誸 Y誹/Get_Book",
			"Nh薾 1000 v祅g/Get_Money",
			"Nh薾 甶觤 ti課 c蕄 m藅 t辌h/Get_Popur",
			--"帮会操作/TongOperation",
			"Thao th竎 kinh m筩h/GetJingMai",
			--"补充精力/Get_Energy",
			--"生活技能/Life_Skill",
			"Nh薾 t礽 li謚 cng h鉧/Get_Enhance",
			"Nh薾  qu�/Get_Gem",
			--format("%s/Get_SkillApp", "领取技能石"),
			format("%s/Pet_OP", "Ph鬰 sinh th� c璶g"),
			--format("%s/getTiLi", "恢复体力"),
			format("%s/getEnery", "Ph鬰 h錳 tinh l鵦"),
			format("%s/getTianJiaoLing", "Nh薾 Thi猲 Ki猽 L謓h"),
			"Nh薾 danh v鋘g th� l鵦/GetPopValue",
			"Nh薾 甶觤 kinh nghi謒/GetExpForReborn",
			"Nh薾 h錳 ti猲 n/GetItemHuiXianDan",
			format("%s/get_tong_title", "Nh藅 danh hi謚 bang h閕"),
			--"复生3/PlayerReborn3",
			"Tham gia Th� L鵦 Ba Phe-Di詎 V� Chi課/Join3Battle",
		}
		if 3 == nRoute then
			tinsert(tSay, "Nh薾 Thi猲 Ph藅 Ch﹗ v� Ph� Ma Ch�/Give_ZhuzhuZhouzhou")
		end
		if 6 == nRoute then
			tinsert(tSay, "Nh薾 竚 Kh� v� C� Quan/Give_JiguanAnqi")
		end
		if 8 == nRoute then
			tinsert(tSay, "Nh薾 X� L頸 Kim Кn/Give_Dandan")
		end		
		if 17 == nRoute then
			tinsert(tSay, "Nh薾 Chi課 M�/Give_ZhanMa")
		end
		if 18 == nRoute then
			tinsert(tSay, "Nh薾 Chi課 M� v� T� Ti詎/Give_Jiancu")
		end
		if 20 == nRoute then
			tinsert(tSay, "Nh薾 Phong Thi Ph�/Give_Fengshifu")
		end
		if 21 == nRoute then
			tinsert(tSay, "Nh薾 C�/Give_GuGu")
		end
		if 30 == nRoute then
			tinsert(tSay, "Nh薾 猽/ling_nv_xiaodiao")
		end
	end
	tinsert(tSay, format("%s/get_something", "Nh薾 t礽 nguy猲"));
	tinsert(tSay, "Thanh l� t骾/ClearBagAllItem");
	tinsert(tSay, "T筰 h� ch� xem qua th玦/nothing");
	Say(g_szTitle.."Ngi c莕 gi髉  g�?", getn(tSay), tSay);
end

function Get_Popur3()
AddItem(2,114,117,50)
AddItem(2,114,118,1)
AddItem(2,114,120,1)
end

function Get_Popur2()
AddItem(2,1,31073,1)
AddItem(2,1,31074,1)
AddItem(2,1,31075,1)
AddItem(2,1,31076,1)
AddItem(2,1,31077,1)
end

function Get_Popur()
	if GetTask(3409) >= 5000 then
	Talk(1, "", "L辌h luy謓  t t鑙 產" )
	return
	end
	gf_Modify("Popur2", 5000)
end

function get_tong_title()
	if IsTitleExist(72, 10) == 0 then
		AddTitle(72, 10)
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
		local szMsg = format("Ch骳 m鮪g nh薾 danh hi謚 %s th祅h c玭g", "уng C鮱")
		Msg2Player(szMsg)
		Talk(1, "", szMsg)
	else
		Talk(1, "", "B筺  nh薾 danh hi謚 bang h閕 r錳!")
	end
end

function getTianJiaoLing()
	AddItem(2,97,236,100)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
function getTiLi()
	RestoreStamina()
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
function getEnery()
	local nCur, nMax = ModifyEnergy(0, 1);
	ModifyEnergy(nMax - nCur, 1);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
function Pet_OP()
	local tSay = {}
	if GetSkillLevel(30149) == 0 then
		tinsert(tSay, format("%s/activePet", "K輈h ho箃 ph鬰 sinh th� c璶g"))
	end
	tinsert(tSay, format("%s/getPetEgg", "Nh薾 Tr鴑g Th� C璶g"))
	tinsert(tSay, format("%s/getLingLi", "Nh薾 甶觤 linh l鵦"))
	tinsert(tSay, "T筰 h� ch� xem qua th玦/nothing");
	Say(g_szTitle.."Ngi c莕 gi髉  g�?", getn(tSay), tSay);
end

function activePet()
	local nId = 30149
	if GetSkillLevel(nId) == 0 then
		LearnSkill(nId)
		for i = 1,4 do
			LevelUpSkill(nId)
		end
		
		Msg2Player("Х h鋍 Gi竛g Linh Thu藅 c蕄 5");
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end

function Process_SanJianTao()
   if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
		return 0;
	end
	for i=29,31 do
        local pifeng,pIndex = AddItem(0,154,i,1,1,-1,-1,-1,-1,-1,-1,0,10)
        FeedItem(pIndex,1000000)
    	local huizhang,hIndex = AddItem(0,153,i,1,1,-1,-1,-1,-1,-1,-1,0,10)
    	FeedItem(hIndex,1000000)
    	local xie,xIndex = AddItem(0,152,i,1,1,-1,-1,-1,-1,-1,-1,0,10)
    	FeedItem(xIndex,1000000)
	end
	AddItem(0,155,10,1,1,-1,-1,-1,-1,-1,-1,0,0)
end

function getPetEgg()
	AddItem(2,1,30601,10)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function getLingLi()
	local nAdd = 10000
	local nTask = 1535
	local nCur = GetTask(nTask) / 100
	if nCur < 1000000 then
		nCur = nCur + nAdd
		SetTask(nTask, nCur*100)
		Msg2Player(format("Nh薾 th祅h c玭g %d linh l鵦", nAdd))
	end
end

function Process_Equip_LingTu()
    if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
				return 0;
		end
		for i=30221,30222 do 
			AddItem(0,102,i,1,1,-1,-1,-1,-1,-1,-1,1)
		end
		local nRoute	= GetPlayerRoute();
		local nBody 	= GetBody();
		if nRoute == 2 then
            AddItem(0,3,30207,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 3 then
            AddItem(0,8,30208,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 4 then
            AddItem(0,0,30209,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 6 then
            AddItem(0,1,30210,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 8 then
            AddItem(0,2,30211,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 9 then
            AddItem(0,10,30212,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 11 then
            AddItem(0,0,30213,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 12 then
            AddItem(0,5,30214,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 14 then
            AddItem(0,2,30215,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 15 then
            AddItem(0,9,30216,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 17 then
            AddItem(0,6,30217,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 18 then
            AddItem(0,4,30218,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 20 then
            AddItem(0,7,30219,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 21 then
            AddItem(0,11,30220,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 23 then
            AddItem(0,2,30221,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 29 then
            AddItem(0,13,30222,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nRoute == 30 then
            AddItem(0,12,30223,1,1,-1,-1,-1,-1,-1,-1,-1,10)		
		end 
		if nBody == 1 then
			AddItem(0,101,30235,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30239,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30243,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,100,30235,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,103,30235,1,1,-1,-1,-1,-1,-1,-1,-1,10)
		end
		if nBody == 2 then
			AddItem(0,101,30236,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30240,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30244,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,100,30236,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,103,30236,1,1,-1,-1,-1,-1,-1,-1,-1,10)
		end
		if nBody == 3 then
			AddItem(0,101,30237,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30241,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30245,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,100,30237,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,103,30237,1,1,-1,-1,-1,-1,-1,-1,-1,10)
		end
		if nBody == 4 then
			AddItem(0,101,30238,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30242,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,101,30246,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,100,30238,1,1,-1,-1,-1,-1,-1,-1,-1,10)
			AddItem(0,103,30238,1,1,-1,-1,-1,-1,-1,-1,-1,10)
		end
end

function Process_Equip_HaoXia()
  if 1 ~= gf_Judge_Room_Weight(4, 1, g_szTitle) then
		return 0;
	end
	local nRoute	= GetPlayerRoute();
	local nBody 	= GetBody();
	local tHaoXia = {
		[2]  = {"H祇 Hi謕 o", 0, 3, 30724},
    [3]  = {"H祇 Hi謕 Trng", 0, 8, 30725},
    [4]  = {"H祇 Hi謕 Th�", 0, 0, 30726},
    [6]  = {"H祇 Hi謕 Ch﹎", 0, 1, 30727},
    [8]  = {"H祇 Hi謕 Ki誱", 0, 2, 30728},
    [9]  = {"H祇 Hi謕 C莔", 0,10, 30729},
    [11] = {"H祇 Hi謕 Th�", 0, 0, 30730},
    [12] = {"H祇 Hi謕 C玭", 0, 5, 30731},
    [14] = {"H祇 Hi謕 Ki誱", 0, 2, 30732},
    [15] = {"H祇 Hi謕 B髏", 0, 9, 30733},
    [17] = {"H祇 Hi謕 Thng", 0, 6, 30734},
    [18] = {"H祇 Hi謕 Cung", 0, 4, 30735},
    [20] = {"H祇 Hi謕 o", 0, 7, 30736},
    [21] = {"H祇 Hi謕 Tr秓", 0,11, 30737},
    [23] = {"H祇 Hi謕 Ki誱", 0, 2, 30738},
    [25] = {"H祇 Hi謕 o", 0, 3, 30739},
    [26] = {"H祇 Hi謕 B髏", 0, 9, 30740},
    [27] = {"H祇 Hi謕 Tr秓", 0,11, 30741},
    [29] = {"H祇 Hi謕 Phi課", 0,13, 30742},
    [30] = {"H祇 Hi謕 мch", 0,12, 30743},
	}
	local t = tHaoXia[nRoute]
	if t then
		AddItem(t[2],t[3],t[4],1,1,-1,-1,-1,-1,-1,-1,-1,10)
	end
	AddItem(0,102,31126,1,1,-1,-1,-1,-1,-1,-1)
	AddItem(0,102,31127,1,1,-1,-1,-1,-1,-1,-1)
	AddItem(0,100,30568,1,1,-1,-1,-1,-1,-1,-1,-1,10)
	AddItem(0,101,30568,1,1,-1,-1,-1,-1,-1,-1,-1,10)
	AddItem(0,103,30568,1,1,-1,-1,-1,-1,-1,-1,-1,10)
end

function JoinRoute_UpdateLevel()
	if GetPlayerFaction() ~= 0 then
		Talk(1,"",format("Ngi  gia nh藀 m玭 ph竔 r錳, ta kh玭g th� gi髉 頲 g�."));
		return 0;
	end
	local tMenu = {
		"Thi誹 L﹎/join_sl",
		"V� ng/join_wd",
		"Nga My/join_em",
		"C竔 Bang/join_gb",
		"Л阯g M玭/join_tm",
		"Dng M玭/join_ym",
		"Ng� чc/join_wdu",
		"C玭 L玭/join_kl",
		"Th髖 Y猲/join_cy",
		format("%s/join_mj", "Minh gi竜"),
		"Ra kh醝/nothing",
	};
	Say("Ngi mu鑞 gia nh藀 l璾 ph竔 g�?", getn(tMenu), tMenu);
end

--------------------------------------------------选择门派开始--------------------------------------
function join_sl()
	if GetSex() == 2 then
		Say(g_szTitle.."Ph竔 Thi誹 L﹎ ch� thu nh薾  t� nam", 0);
		return
	end

	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."Ngi mu鑞 gia nh藀 l璾 ph竔 g�?",
		"Thi誹 L﹎ v� t玭g/#enter_mp(4)",
		"Thi誹 L﹎ thi襫 t玭g/#enter_mp(3)",
		"Thi誹 L﹎ t鬰 gia/#enter_mp(2)",
		"Ra kh醝/nothing",
	};

	SelectSay(szSay);
end;

function join_wd()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."Ngi mu鑞 gia nh藀 l璾 ph竔 g�?",
		"V� ng o gia/#enter_mp(14)",
		"V� ng t鬰 gia/#enter_mp(15)",
		"Ra kh醝/nothing",
	};

	SelectSay(szSay);
end;

function join_em()
	if GetSex() == 1 then
		Say(g_szTitle.."Nga My kh玭g nh薾  t� nam", 0);
		return
	end

	if GetPlayerFaction() ~= 0 then
		return
	end

	local szSay = {
		g_szTitle.."Ngi mu鑞 gia nh藀 l璾 ph竔 g�?",
		"Nga My ph藅 gia/#enter_mp(8)",
		"Nga My t鬰 gia/#enter_mp(9)",
		"Ra kh醝/nothing",
	};

	SelectSay(szSay);
end;

function join_gb()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."Ngi mu鑞 gia nh藀 l璾 ph竔 g�?",
		"C竔 Bang T躰h y/#enter_mp(11)",
		"C竔 Bang � Y/#enter_mp(12)",
		"Ra kh醝/nothing",
	};
	SelectSay(szSay);
end;

function join_tm()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."Ngi mu鑞 gia nh藀 l璾 ph竔 g�?",
		"Л阯g M玭/#enter_mp(6)",
		"Ra kh醝/nothing",
	};
	SelectSay(szSay);
end;

function join_ym()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."Ngi mu鑞 gia nh藀 l璾 ph竔 g�?",
		"Dng M玭 thng K�/#enter_mp(17)",
		"Dng M玭 Cung K�/#enter_mp(18)",
		"Ra kh醝/nothing",
	};
	SelectSay(szSay);
end;

function join_wdu()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."Ngi mu鑞 gia nh藀 l璾 ph竔 g�?",
		"Hi謕 чc/#enter_mp(20)",
		"T� чc/#enter_mp(21)",
		"Ra kh醝/nothing",
	};
	SelectSay(szSay);
end;

function join_kl()
	if GetSex()==2 then
		Talk(1,"","C玭 L玭 kh玭g thu nh薾  t� n�!");
		return 0
	end

	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."Ngi mu鑞 gia nh藀 l璾 ph竔 g�?",
		"C玭 L玭 Thi猲 S�/#enter_mp(23)",
		"Ra kh醝/nothing",
	};
	SelectSay(szSay);
end;

function join_cy()
	if GetSex()==1 then
		Talk(1,"","Th髖 Y猲 kh玭g thu nh薾  t� nam!");
		return 0
	end

	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."Ngi mu鑞 gia nh藀 l璾 ph竔 g�?",
		"Th髖 Y猲 V� Ti猲/#enter_mp(29)",
		"Th髖 Y猲 Linh N�/#enter_mp(30)",
		"Ra kh醝/nothing",
	};
	SelectSay(szSay);
end;

function join_mj()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."V� <sex> mu鑞 theo hng n祇 c馻 Minh Gi竜?",
		format("%s/#enter_mp(25)", "Minh Gi竜 Th竛h Chi課"),
		format("%s/#enter_mp(26)", "Minh Gi竜 Tr薾 Binh"),
		format("%s/#enter_mp(27)", "Minh Gi竜 Huy誸 Nh﹏"),
		"Ra kh醝/nothing",
	}
	SelectSay(szSay);
end;

-----------------------------------------入门派----------------------------------------
function enter_mp(nRoute)
	local nBegin = 0;
	local nEnd = 0;
	local nBody = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

	SetPlayerRoute(nRoute);						--设置流派

	if nRoute == 2 then						--少林俗家
		LearnSkill(3);
		LearnSkill(5);
		LearnSkill(32);
		nBegin = 21;
		nEnd = 31;
	elseif nRoute == 3 then					--少林禅僧
		LearnSkill(6);
		LearnSkill(57);
		nBegin = 45;
		nEnd = 56;
	elseif nRoute == 4 then					--少林武僧
		LearnSkill(2);
		LearnSkill(44);
		nBegin = 33;
		nEnd = 43;
	elseif nRoute == 14 then					--武当道家
		LearnSkill(4);
		LearnSkill(146);
		nBegin = 125;
		nEnd = 145;
	elseif nRoute == 15 then					--武当俗家
		LearnSkill(5);
		LearnSkill(159);
		nBegin = 147;
		nEnd = 158;
	elseif nRoute == 8 then					--峨嵋佛家
		LearnSkill(4);
		LearnSkill(89);
		nBegin = 75
		nEnd = 88;
	elseif nRoute == 9 then					--峨嵋俗家
		LearnSkill(10);
		LearnSkill(102);
		nBegin = 90
		nEnd = 101;
	elseif nRoute == 11 then					--丐帮净衣
		LearnSkill(2);
		LearnSkill(113);
		nBegin = 103
		nEnd = 112;
	elseif nRoute == 12 then					--丐帮污衣
		LearnSkill(5);
		LearnSkill(124);
		nBegin = 114
		nEnd = 123;
	elseif nRoute == 6 then					--唐门
		LearnSkill(7);
		LearnSkill(74);
		nBegin = 58
		nEnd = 73;
	elseif nRoute == 17 then					--杨门枪骑
		LearnSkill(11);
		LearnSkill(732);
		nBegin = 720;
		nEnd = 731;
	elseif nRoute == 18 then					--杨门弓骑
		LearnSkill(12);
		LearnSkill(745);
		nBegin = 733;
		nEnd = 744;
	elseif nRoute == 20 then					--五毒邪侠
		LearnSkill(13);
		LearnSkill(775);
		nBegin = 364;
		nEnd = 377;
	elseif nRoute == 21 then					--五毒蛊师
		LearnSkill(14);
		LearnSkill(774);
		nBegin = 347;
		nEnd = 363;
	elseif nRoute == 23 then					--昆仑天师
		LearnSkill(4);
		LearnSkill(1032);
		nBegin = 1017 ;
		nEnd = 1031;
	elseif nRoute == 25 then					--明教圣战
		LearnSkill(3);
		LearnSkill(1066);
		nBegin = 1053 ;
		nEnd = 1065;
	elseif nRoute == 26 then					--明教阵兵
		LearnSkill(8);
		LearnSkill(1096);
		nBegin = 1083 ;
		nEnd = 1095;
	elseif nRoute == 27 then					--明教血人
		LearnSkill(14);
		LearnSkill(1213);
		nBegin = 1131 ;
		nEnd = 1143;
	elseif nRoute == 29 then					--翠烟舞仙
		LearnSkill(15);
		LearnSkill(1196);
		nBegin = 1165 ;
		nEnd = 1176;
	elseif nRoute == 30 then					--翠烟灵女
		LearnSkill(16);
		LearnSkill(1230);
		nBegin = 1217 ;
		nEnd = 1229;
	else
		return
	end;

	LearnSkill(20);

	for i = nBegin, nEnd do
		LearnSkill(i);
		while LevelUpSkill(i) == 1 do
		end
	end;

	----------------------------设置数值------------
	SetTask(336, 20000);				--设置师门贡献度
	ModifyReputation(2000, 0);			--设置声望
	gf_SetTaskByte(1538, 1, 5) 			--5转
	PlayerReborn(3, random(4));			--7转
	SetLevel(90, 1);								--设置等级
	
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	Msg2Player("Thao t竎 th祅h c玭g, h穣 ng nh藀 l筰")
	Talk(1,"","Thao t竎 th祅h c玭g, h穣 ng nh藀 l筰! C秏 琻 Thng Eopi  share")	
	ExitGame();
end

function Get_YaoYang_10()
	if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
				return 0;
		end
		for i=3190,3194 do
				AddItem(0,102,i,1,1,-1,-1,-1,-1,-1,-1)
		end
		local nRoute	= GetPlayerRoute();
		local nBody 	= GetBody();
		local nLevel  = 10;
		if nRoute == 2 and nBody ==1 then 
				AddItem(0,100,3128,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3128,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3128,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,3,8992,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 2 and nBody ==2 then 
				AddItem(0,100,3129,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3129,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3129,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,3,8992,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 3 and nBody ==1 then 
				AddItem(0,100,3132,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3132,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3132,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,8,8994,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 3 and nBody ==2 then 
				AddItem(0,100,3133,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3133,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3133,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,8,8994,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 4 and nBody ==1 then 
				AddItem(0,100,3130,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3130,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3130,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,0,8993,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 4 and nBody ==2 then 
				AddItem(0,100,3131,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3131,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3131,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,0,8993,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 6 and nBody ==1 then 
				AddItem(0,100,3134,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3134,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3134,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,1,8995,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 6 and nBody ==2 then 
				AddItem(0,100,3135,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3135,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3135,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,1,8995,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 6 and nBody ==3 then 
				AddItem(0,100,3136,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3136,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3136,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,1,8995,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 6 and nBody ==4 then 
				AddItem(0,100,3137,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3137,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3137,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,1,8995,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 8 and nBody ==3 then 
				AddItem(0,100,3138,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3138,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3138,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,2,8996,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 8 and nBody ==4 then 
				AddItem(0,100,3139,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3139,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3139,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,2,8996,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end

		if nRoute == 9 and nBody ==3 then 
				AddItem(0,100,3140,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3140,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3140,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,10,8997,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 9 and nBody ==4 then 
				AddItem(0,100,3141,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3141,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3141,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,10,8997,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 11 and nBody ==1 then 
				AddItem(0,100,3142,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3142,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3142,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,0,8998,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 11 and nBody ==2 then 
				AddItem(0,100,3143,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3143,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3143,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,0,8998,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 11 and nBody ==3 then 
				AddItem(0,100,3144,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3144,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3144,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,0,8998,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 11 and nBody ==4 then 
				AddItem(0,100,3145,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3145,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3145,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,0,8998,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end

		if nRoute == 12 and nBody ==1 then 
				AddItem(0,100,3146,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3146,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3146,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,5,8999,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 12 and nBody ==2 then 
				AddItem(0,100,3147,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3147,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3147,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,5,8999,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 12 and nBody ==3 then 
				AddItem(0,100,3148,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3148,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3148,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,5,8999,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 12 and nBody ==4 then 
				AddItem(0,100,3149,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3149,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3149,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,5,8999,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 14 and nBody ==1 then 
				AddItem(0,100,3150,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3150,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3150,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,2,9000,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 14 and nBody ==2 then 
				AddItem(0,100,3151,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3151,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3151,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,2,9000,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 14 and nBody ==3 then 
				AddItem(0,100,3152,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3152,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3152,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,2,9000,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 14 and nBody ==4 then 
				AddItem(0,100,3153,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3153,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3153,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,2,9000,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 15 and nBody ==1 then 
				AddItem(0,100,3154,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3154,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3154,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,9,9001,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 15 and nBody ==2 then 
				AddItem(0,100,3155,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3155,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3155,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,9,9001,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 15 and nBody ==3 then 
				AddItem(0,100,3156,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3156,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3156,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,9,9001,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 15 and nBody ==4 then 
				AddItem(0,100,3157,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3157,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3157,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,9,9001,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 17 and nBody ==1 then 
				AddItem(0,100,3158,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3158,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3158,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,6,9002,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 17 and nBody ==2 then 
				AddItem(0,100,3159,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3159,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3159,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,6,9002,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 17 and nBody ==3 then 
				AddItem(0,100,3160,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3160,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3160,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,6,9002,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 17 and nBody ==4 then 
				AddItem(0,100,3161,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3161,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3161,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,6,9002,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end

		if nRoute == 18 and nBody ==1 then 
				AddItem(0,100,3162,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3162,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3162,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,4,9003,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 18 and nBody ==2 then 
				AddItem(0,100,3163,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3163,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3163,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,4,9003,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 18 and nBody ==3 then 
				AddItem(0,100,3164,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3164,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3164,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,4,9003,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 18 and nBody ==4 then 
				AddItem(0,100,3165,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3165,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3165,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,4,9003,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end

		if nRoute == 20 and nBody ==1 then 
				AddItem(0,100,3166,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3166,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3166,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,7,9004,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 20 and nBody ==2 then 
				AddItem(0,100,3167,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3167,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3167,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,7,9004,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 20 and nBody ==3 then 
				AddItem(0,100,3168,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3168,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3168,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,7,9004,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 20 and nBody ==4 then 
				AddItem(0,100,3169,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3169,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3169,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,7,9004,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 21 and nBody ==1 then 
				AddItem(0,100,3170,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3170,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3170,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,11,9005,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 21 and nBody ==2 then 
				AddItem(0,100,3171,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3171,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3171,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,11,9005,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 21 and nBody ==3 then 
				AddItem(0,100,3172,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3172,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3172,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,11,9005,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		if nRoute == 21 and nBody ==4 then 
				AddItem(0,100,3173,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,101,3173,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,103,3173,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
				AddItem(0,11,9005,1,1,-1,-1,-1,-1,-1,-1,1,nLevel)
		end
		
		if nRoute == 23 and nBody ==1 then 
				AddItem(0,100,3174,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,101,3174,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,103,3174,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,2,9006,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
		end
		if nRoute == 23 and nBody ==2 then 
				AddItem(0,100,3175,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,101,3175,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,103,3175,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,2,9006,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
		end
		
		if nRoute == 29 and nBody ==3 then 
				AddItem(0,100,3188,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,101,3188,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,103,3188,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,13,9010,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
		end
		if nRoute == 29 and nBody ==4 then 
				AddItem(0,100,3189,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,101,3189,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,103,3189,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,13,9010,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
		end
		if nRoute == 30 and nBody ==3 then 
				AddItem(0,100,3190,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,101,3190,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,103,3190,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,12,9011,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
		end
		if nRoute == 30 and nBody ==4 then 
				AddItem(0,100,3191,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,101,3191,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,103,3191,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				AddItem(0,12,9011,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
		end
end

function Get_JinShe()
		if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
				return 0;
		end
		local nRoute	= GetPlayerRoute();
		local nBody 	= GetBody();
		local nLevel  = 10;
		if nRoute == 2 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,186,164,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,186,164,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,186,164,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 3 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 4 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		
		if nRoute == 6 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,162,178,757,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,162,178,757,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,162,178,757,754,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 8 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		

		if nRoute == 9 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 11 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,183,181,757,770,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,183,181,757,770,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,183,181,757,770,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 12 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,163,178,758,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,163,178,758,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,163,178,758,754,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 14 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 15 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,164,178,760,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,164,178,760,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,164,178,760,754,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 17 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,183,181,757,770,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,183,181,757,770,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,183,181,757,770,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 18 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,162,178,757,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,162,178,757,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,162,178,757,754,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 20 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,163,179,758,755,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,163,179,758,755,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,163,179,758,755,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 21 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,180,760,756,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,180,760,756,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,180,760,756,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 23 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 29 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,162,178,757,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,162,178,757,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,162,178,757,754,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 30	then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,164,178,760,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,164,178,760,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,164,178,760,754,1004)
				FeedItem(xIndex,1000000)
		end
	
end

function Get_Book()
	local szSay = {
		g_szTitle.."Nh薾 L璾 Ph竔 Ch﹏ Quy觧 v� Quy誸 Y誹!",
		"Nh薾 Ch﹏ Quy觧/Get_Book_ZhenJuan",
		"Nh薾 Quy誸 Y誹/Get_Book_JueYao",
		"Th╪g c蕄 m藅 t辌h  trang b�/Get_Book_Update",
		"Ra kh醝/nothing",
	};
	SelectSay(szSay);
end

function Get_Book_ZhenJuan()
	if gf_Judge_Room_Weight(7, 1, g_szTitle) ~= 1 then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	
	if nRoute == 2 then
		AddItem(0, 107, 204,5)
		AddItem(0, 107, 204-38,5)
	end
	
		if nRoute == 3 then
		AddItem(0, 107, 206,5)
		AddItem(0, 107, 206-38,5)
	end
	
		if nRoute == 4 then
		AddItem(0, 107, 205,5)
		AddItem(0, 107, 205-38,5)
	end
	
		if nRoute == 6 then
		AddItem(0, 107, 207,5)
		AddItem(0, 107, 207-38,5)
	end
	
		if nRoute == 8 then
		AddItem(0, 107, 208,5)
		AddItem(0, 107, 208-38,5)
	end
	
		if nRoute == 9 then
		AddItem(0, 107, 209,5)
		AddItem(0, 107, 209-38,5)
	end
	
		if nRoute == 11 then
		AddItem(0, 107, 210,5)
		AddItem(0, 107, 210-38,5)
	end
	
		if nRoute == 12 then
		AddItem(0, 107, 211,5)
		AddItem(0, 107, 211-38,5)
	end
	
		if nRoute == 14 then
		AddItem(0, 107, 212,5)
		AddItem(0, 107, 212-38,5)
	end
	
		if nRoute == 15 then
		AddItem(0, 107, 213,5)
		AddItem(0, 107, 213-38,5)
	end
	
		if nRoute == 17 then
		AddItem(0, 107, 214,5)
		AddItem(0, 107, 214-38,5)
	end
	
		if nRoute == 18 then
		AddItem(0, 107, 215,5)
		AddItem(0, 107, 215-38,5)
	end
	
		if nRoute == 20 then
		AddItem(0, 107, 216,5)
		AddItem(0, 107, 216-38,5)
	end
	
			if nRoute == 21 then
		AddItem(0, 107, 217,5)
		AddItem(0, 107, 217-38,5)
	end
	
	if nRoute == 23 then--昆仑天师
		AddItem(0, 107, 218,5)
		AddItem(0, 107, 218-20,5)
	end
	
	if nRoute == 25 then--明教圣战
		AddItem(0, 107, 219,5)
		AddItem(0, 107, 219-20,5)
	end
	if nRoute == 26 then--明教阵兵
		AddItem(0, 107, 220,5)
		AddItem(0, 107, 220-20,5)
	end
	if nRoute == 27 then--明教血人
		AddItem(0, 107, 221,5)
		AddItem(0, 107, 221-20,5)
	end
	
	if nRoute == 29 then--舞仙
		AddItem(0, 107, 222,5)
	  AddItem(0, 107, 222-20,5)
	end
	
	if nRoute == 30 then--灵女
		AddItem(0, 107, 223,5)
		AddItem(0, 107, 223-20,5)
	end
	
	gf_AddItemEx({0, 112, 158,	1, 4}, "L╪g Ba Vi B� to祅 t藀");
end

function Get_Book_JueYao()
	local tJue ={
		[2]		={1,10},
		[3]		={21,31},
		[4]		={11,20},
		[6]		={32,46},
		[8]		={47,59},
		[9]		={60,70},
		[11]	={71,79},
		[12]	={80,88},
		[14]	={89,108},
		[15]	={109,119},
		[17]	={120,130},
		[18]	={131,141},
		[20]	={142,154},
		[21]	={155,168},
		[23]	={169,182},
		[25]	={183,194},
		[26]	={195,206},
		[27]	={207,218},
		[29]	={219,229},
		[30]	={230,240},
	};

	local nRoute = GetPlayerRoute()
	if 1 ~= gf_CheckPlayerRoute() then
		return 0;
	end

	if 1 ~= gf_Judge_Room_Weight((tJue[nRoute][2] - tJue[nRoute][1] + 1), 1, g_szTitle) then
		return 0;
	end

	for i = tJue[nRoute][1],tJue[nRoute][2] do
		gf_AddItemEx({2, 6, i, 1, 4}, "Quy誸 Y誹");
	end
end

function Get_Book_Update()
	for i=1,100 do LevelUpBook() end
	for i=1,100 do LevelUpBook(1) end
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function Get_Money()
	if GetCash() < 10000000 then
		Earn(10000000 - GetCash());
	end
end

function Give_ZhuzhuZhouzhou()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end

	AddItem(2, 3, 4, 99);
	AddItem(2, 3, 12, 99);	
end

function Give_JiguanAnqi()
	if gf_Judge_Room_Weight(11, 1) ~= 1 then
		return 0;
	end
  for i = 1,9 do
		AddItem(2, 11, i, 2000, 4);
	end
	AddItem(2, 3, 6, 999, 4);	
end

function Give_Dandan()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 3, 7, 999);
end

function Give_ZhanMa()
	if gf_Judge_Room_Weight(1, 10) ~= 1 then
		return 0;
	end
	AddItem(0,105,38,1,1,7,101,7,101,7,101);
end

function Give_Jiancu()
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		return 0;
	end
	AddItem(2, 15, 10, 2000);
	AddItem(0,105,38,1,1,7,101,7,101,7,101);
end

function Give_Fengshifu()
	if gf_Judge_Room_Weight(5, 1) ~= 1 then
		return 0;
	end

	AddItem(1, 6, 34,	30, 4);
	AddItem(1, 6, 46, 30, 4);
	AddItem(1, 6, 84,	30, 4);
	AddItem(1, 6, 153,30, 4);
	AddItem(1, 6, 154,30, 4);
end

function Give_GuGu()
	if gf_Judge_Room_Weight(32, 1) ~= 1 then
		return 0;
	end
  for i = 1,31 do
		AddItem(2, 17, i, 99, 4);
	end

	if 0 >= GetItemCount(2, 0, 1063) and 1 == gf_Judge_Room_Weight(1, 1) then
		AddItem(2, 0, 1063, 1);
	end
end

function ling_nv_xiaodiao()
	local szSay = {};
	szSay[getn(szSay) + 1] = "Nh薾 Ti觰 猽/Give_XiaoDiao";
	szSay[getn(szSay) + 1] = "Nu玦 Ti觰 猽/Give_XiaoDiaoFood";
	szSay[getn(szSay) + 1] = "Hu蕁 luy謓 Ti觰 猽/Feed_XiaoDiao";
	szSay[getn(szSay) + 1] = "Ra kh醝/nothing";
	Say(g_szTitle.."Ti觰 猽 thao t竎.", getn(szSay), szSay)
end


function Give_XiaoDiao()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 20, random(1, 5), 1, 4);
end

function Give_XiaoDiaoFood()
	if gf_Judge_Room_Weight(11, 1) ~= 1 then
		return 0;
	end

	for i = 6, 12 do
		if i == 11 then
			AddItem(2, 97, i, 1, 4);
		else
			AddItem(2, 97, i, 100, 4);
		end
	end
end

function Feed_XiaoDiao()
	local nPetItemIndex = GetPlayerEquipIndex(12);
	if (nPetItemIndex == nil or nPetItemIndex <=0) then
		Msg2Player("C竎 h� ch璦 c� th� c璶g, kh玭g th� ti課 h祅h hu蕁 luy謓!");
		return
	end;
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Msg2Player("C竎 h� ch璦 c� th� c璶g, kh玭g th� ti課 h祅h hu蕁 luy謓!");
		return
	end

	for i = 1, 84 do
		LevelUpPet(nPetItemIndex)
	end
end

function ClearBagAllItem(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."Ngi mu鑞 thanh l� t骾?", 2, "уng �/#ClearBagAllItem(1)", "Ra kh醝/nothing")
		return
	end
	ClearItemInPos();
	if GetItemCount(2,1,30644) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,1,30644,1)
	end
end

function TongOperation()
	local szSay = {
		g_szTitle.."Thao t竎 bang h閕",
		"Ta mu鑞 l藀 bang h閕/TongOperation_Create",
		"Ta mu鑞 th╪g c蕄 bang h閕/TongOperation_update",
		"Ra kh醝/nothing",
	};
	SelectSay(szSay);
end

function TongOperation_Create()
	if IsTongMember() ~= 0 then
		Talk(1,"","Ngi  c� bang h閕");
		return
	end
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,0,555) < 1 then
		AddItem(2,0,555,1)
	end
	if GetItemCount(2,0,125) < 1 then
  	AddItem(2,0,125,1)
  end
  if GetReputation() < 2000 then
  	ModifyReputation(2000 - GetReputation(), 0)
  end
  if GetCash() < 5000000 then
  	Earn(5000000 - GetCash())
  end
  CreateTongDialog()
end


function TongOperation_update()
	if GetTongLevel() < 3 then
		AddTongLevel();
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end

function GetJingMai()
	local szSay = {
		g_szTitle.."Thao th竎 kinh m筩h",
		"T葃 甶觤 kinh m筩h/GetJingMai_Reset",
		format("%s/getZhenqi", "Nh薾 ch﹏ kh�"),
		format("%s/#getJingMaiTongRen(1)", "Nh薾 Kinh M筩h уng Nh﹏"),
		format("%s/#getJingMaiTongRen(2)", "Nh薾 Kinh M筩h Ng﹏ Nh﹏"),
		--format("%s/#getJingMaiTongRen(3)", "领取经脉金人"),
		"Ra kh醝/nothing",
	};
	if MeridianGetLevel() < 5 then
		tinsert(szSay, 2, format("%s/GetJingMai_Update", "T╪g l猲 c筺h gi韎 V� Ho祅g"))
	end
	SelectSay(szSay);
end

function getZhenqi()
	AwardGenuineQi(180000);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
function getJingMaiTongRen(nType)
	AddItem(2, 1,30730+nType-1, 100)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function GetJingMai_Update()
	local nLevel = MeridianGetLevel()
	for i = nLevel + 1, 5 do
		MeridianUpdateLevel()
	end
	local nNum = 750000 - (MeridianGetDanTian() + MeridianGetQiHai());
	if nNum > 0 then
		AwardGenuineQi(nNum);
	end
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function GetJingMai_Reset(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."Thao th竎 kinh m筩h", 2,"уng �/#GetJingMai_Reset(1)", "H駓 b�/nothing")
		return 0;
	end
	MeridianRestore(-1);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function player_reborn()
	PlayerReborn(4, random(4));			--7转
	gf_SetTaskByte(1538, 1, 5) 			--5转
	SetLevel(99, 1);								--设置等级
	
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
	ExitGame();
end

function Get_Energy()
	local nCur, nMax = ModifyEnergy(0, 1);
	ModifyEnergy(nMax - nCur, 1);
end

function Life_Skill()
	local tSay = {
		"Mu鑞 t╪g c蕄 k� n╪g thu th藀/upgrade_gather_skill",
		"Mu鑞 t╪g c蕄 k� n╪g s秐 xu蕋/upgrade_compose_skill",
		"Nh薾 nguy猲 li謚 ch� trang b� Linh у/get_lingtu_equip_material",
		"T筰 h� ch� xem qua th玦/nothing",
	}
	Say(g_szTitle.."T╪g c蕄 k� n╪g s鑞g", getn(tSay), tSay);
end

function upgrade_gather_skill()
	local tGather = {1, 2, 5, 6};
	local tName = {"цn c﹜", "L祄 da", "Уo kho竛g", "K衞 t�"};
	local str = ""
	for k, v in tName do
		str = str.."<color=gold>"..v.."<color>,"
	end
	for k, v in tGather do
		local nCur = GetLifeSkillLevel(0, v)
		local nMax = GetLifeSkillMaxLevel(0, v);
		if nMax > nCur then
			local msg = g_szTitle..format("Hi謓 t筰 ch� c� th� th╪g c蕄 k� n╪g %s, <color=gold>%s<color> 產ng t c蕄 <color=green>%d<color>, mu鑞 th╪g c蕄 <color=gold>%s<color> n c蕄 <color=green>%d<color> kh玭g?",
				 str, tName[k], nCur, tName[k], nMax);
			Say(msg, 2, format("уng �/#upgrade_gather_skill_do(%d, %d)", v, nMax), "H駓 b�/nothing")
			return 0;
		end
	end
	Talk(1,"","Kh玭g c� k� n╪g s鑞g c� th� th╪g c蕄, h穣 甶 t譵 NPC  h鋍 v� th╪g c蕄 gi韎 h筺 k� n╪g n c蕄 99")
end

function upgrade_gather_skill_do(nSkill, nMax)
	for i = GetLifeSkillLevel(0, nSkill), nMax do
		AddLifeSkillExp(0, nSkill, 9999999);		
	end
	if 79 == nMax then
		Talk(1,"","Hi謓  ho祅 th祅h th╪g c蕄 k� n╪g, h穣 甶 t譵 NPC  t╪g c蕄 gi韎 h筺 n 99 n祇!")
	end
	Msg2Player(format("Th祅h c玭g t╪g c蕄 k� n╪g n c蕄 %d", nMax));
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

function upgrade_compose_skill()
	local tGather = {2, 3, 4, 5, 9, 10};
	local tName = {"Ch� t筼 binh kh� d礽", "Ch� t筼 binh kh� ng緉", "Ch� t筼 k� m玭 binh kh�", "L祄 h� gi竝", "H� trang", "u qu竛"};
	local str = ""
	for k, v in tName do
		str = str.."<color=gold>"..v.."<color>,"
	end
	for k, v in tGather do
		local nCur = GetLifeSkillLevel(1, v)
		local nMax = GetLifeSkillMaxLevel(1, v);
		if nMax > nCur then
			local msg = g_szTitle..format("Hi謓 t筰 ch� c� th� th╪g c蕄 k� n╪g %s, <color=gold>%s<color> 產ng t c蕄 <color=green>%d<color>, mu鑞 th╪g c蕄 <color=gold>%s<color> n c蕄 <color=green>%d<color> kh玭g?",
				 str, tName[k], nCur, tName[k], nMax);
			Say(msg, 2, format("уng �/#upgrade_compose_skill_do(%d, %d)", v, nMax), "H駓 b�/nothing")
			return 0;
		end
	end
	Talk(1,"","Kh玭g c� k� n╪g s鑞g c� th� th╪g c蕄, h穣 甶 t譵 NPC  h鋍 v� th╪g c蕄 gi韎 h筺 k� n╪g n c蕄 99")
end

function upgrade_compose_skill_do(nSkill, nMax)
	for i = GetLifeSkillLevel(1, nSkill), nMax do
		AddLifeSkillExp(1, nSkill, 9999999);		
	end
	if 79 == nMax then
		Talk(1,"","Hi謓  ho祅 th祅h th╪g c蕄 k� n╪g, h穣 甶 t譵 NPC  t╪g c蕄 gi韎 h筺 n 99 n祇!")
	end
	Msg2Player(format("Th祅h c玭g t╪g c蕄 k� n╪g n c蕄 %d", nMax));
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

function get_lingtu_equip_material()
	if gf_Judge_Room_Weight(18, 100) ~= 1 then
		Talk(1,"",format("T骾 kh玭g  %d � tr鑞g", 18));
		return 0;
	end
	AddItem(2, 1, 30670, 999);
	AddItem(2, 1, 30671, 999);
	AddItem(2, 1, 30672, 999);
	AddItem(2, 1, 30673, 999);
	AddItem(2, 1, 30674, 999);
	AddItem(2, 2, 38, 999);
	AddItem(2, 2, 12, 999);
	AddItem(2, 2, 39, 999);
	AddItem(2, 2, 13, 999);
	AddItem(2, 2, 49, 999);
	AddItem(2, 2, 56, 999);
	AddItem(2, 2, 50, 999);
	AddItem(2, 2, 100, 999);
	AddItem(2, 1, 30680, 999);
	AddItem(2, 1, 30681, 999);
	AddItem(2, 1, 30682, 999);
	AddItem(2, 1, 30683, 999);
	AddItem(2, 1, 30684, 999);
end

function Get_Enhance()
	local tSay = {
		"Nh薾 Th莕 Th筩h мnh H錸/Get_Enhance_1",
		"Nh薾 Tinh th筩h Thi猲 Th筩h/Get_Enhance_2",
		"T筰 h� ch� xem qua th玦/nothing",
	}
	Say(g_szTitle.."T╪g c蕄 k� n╪g s鑞g", getn(tSay), tSay);
end

function Get_Enhance_1()
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2, 1, 1068, 1}, "Thi猲 Th筩h linh th筩h", "Get_Enhance_1", "Nh薾 Th莕 Th筩h мnh H錸", 0, 1);
	gf_AddItemEx2({2, 1, 1067, 1}, "Thi猲 Th筩h linh th筩h", "Get_Enhance_1", "Nh薾 Th莕 Th筩h мnh H錸", 0, 1);
end

function Get_Enhance_2()
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	AddItem(2, 1, 1009, 100);
	WriteLogEx("Get_Enhance_2","Nh薾 Tinh th筩h Thi猲 Th筩h", 100, "Thi猲 Th筩h Tinh Th筩h");
end

function Get_Gem()
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end
	AddItem(2, 22, 101, 100);
	WriteLogEx("Get_Gem","Nh薾  qu�", 100, "Huy誸Tr輈hTh筩h Lv5");
	AddItem(2, 22, 201, 100);
	WriteLogEx("Get_Gem","Nh薾  qu�", 100, "Nguy謙B筩hTh筩h Lv5");
	AddItem(2, 22, 301, 100);
	WriteLogEx("Get_Gem","Nh薾  qu�", 100, "H� Ph竎h Th筩h C蕄 5");
	AddItem(2, 22, 401, 100);	
	WriteLogEx("Get_Gem","Nh薾  qu�", 100, "H綾 Di謚 Th筩h C蕄 5");
end

function Get_SkillApp()
	if gf_Judge_Room_Weight(10, 100, " ") ~= 1 then
		return 0;
	end
	for i=1,10 do
		AddItem(2, 23, i, 1);
		WriteLogEx("Get_SkillApp","Get_SkillApp", 1, i);
	end
end

function GetPopValue()
	local nShili = GetTask(3286) - 1;
	if nShili < 0 or nShili > 2 then
		Talk(1,"","Ngi ch璦 gia nh藀 th� l鵦,kh玭g th� nh薾 danh v鋘g th� l鵦");
		return 0;
	end
	AddPop(nShili, 1000);
	WriteLogEx("Get_Pop","Nh薾 danh v鋘g th� l鵦", 1000, "Danh v鋘g th� l鵦 1000");
end

function GetExpForReborn()
	gf_ModifyExp(2000000000);
	WriteLogEx("Get_Exp","Nh薾 甶謒 kinh nghi謒", 2000000000, "2 t� 甶觤 kinh nghi謒");
end

function GetItemHuiXianDan()
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2, 1, 30847, 150}, "H錳 Ti猲 Кn", "Get_Item", "Nh薾 h錳 ti猲 n", 0, 1);
end

function PlayerReborn3()
	if GetItemCount(2,1,30862) < 1 then
		Talk(1,"","Xin ho祅 th祅h nhi謒 v� ph鬰 sinh 3, sau khi nh薾 頲 Th� Ti課 C� Ph鬰 Sinh h穣 quay l筰!");
		return 0;
	end
	if gf_CheckLevel(7, 99) ~= 1 then
		Talk(1,"","Nh﹏ v藅 t n c蕄 99 chuy觧 sinh 7, kh玭g th� ho祅 th祅h ph鬰 sinh 3");
		return 0;
	end
	if DelItem(2, 1, 30862, 1) ~= 1 then
		return 0;
	end
	PlayerReborn(3, random(4));
end

Include("\\script\\isolate\\functions\\tong_title\\head.lua")
tThings = {
		{"L辌h luy謓", function() 
				gf_Modify('Popur2', 1000)
			end
		},
		{"ч c鑞g hi課 Bang h閕", function() 
				add_tong_gxd(100)
			end
		},
		{"V╪ S鴆-u (Kh綾 b秐)", function()
			AddItem(2,1,31068,10)
			end
		},
		{"V╪ S鴆-僶 (Kh綾 b秐)", function()
			AddItem(2,1,31069,10)
			end
		},
		{"V╪ S鴆-Qu莕 (Kh綾 b秐)", function()
			AddItem(2,1,31070,10)
			end
		},
		{"V╪ S鴆-Nh蒼 (Kh綾 b秐)", function()
			AddItem(2,1,31071,10)
			end
		},
		{"V╪ S鴆-B閕 (Kh綾 b秐)", function()
			AddItem(2,1,31072,10)
			end
		},
		{"L璾 Kim", function()
			AddItem(2,1,31096,10)
			end
		},
	}
function get_something(nType)
	if not nType then
  	local tSay = {}
  	for i=1,getn(tThings) do
  		local t = tThings[i]
  		tinsert(tSay, format("%s/#get_something(%d)", t[1], i));
  	end
  	tinsert(tSay, "T筰 h� ch� xem qua th玦/nothing");
  	Say(g_szTitle.."Ngi mu鑞 nh薾 g�?", getn(tSay), tSay)
  	return
  end
  local t = tThings[nType]
  if t then
  	t[2]()
  	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
  end
end

function Join3Battle()
	local nHour = tonumber(date("%H"))
	if nHour ~= 20 then
		Talk(1,"","Th� L鵦 Ba Phe-Di詎 V� Chi課 s� b総 u t� 20h, l骳  m阨 c竎 b筺 tham gia.");
		return 0;
	end
	if SubWorldID2Idx(7119) == -1 then
		Talk(1,""," b秐  th� l鵦 ba phe m韎 c� th� v祇 chi課 trng.");
		return 0;
	end
	local nProtect = GetGlbValue(2079);
	if nProtect == 0 then
		nProtect = random(1, 3);
		SetGlbValue(2079, nProtect);
		SendScript2VM("\\script\\missions\\yp\\ywz\\mission.lua", "StartYwzMission()")
		local tCamp2Name = {
			[1] = "Th� L鵦 Чi L�",
			[2] = "Th� L鵦 Th� Ph錸",
			[3] = "Th� L鵦 T﹜ H�",
		}
		local nCampNext1 = 2;
		local nCampNext2 = 3;
		if nProtect == 2 then
			nCampNext1 = 3;
			nCampNext2 = 1;
		elseif nProtect == 3 then
			nCampNext1 = 1;
			nCampNext2 = 2;
		end
		local msg = format("Th� L鵦 Ba Phe-Di詎 V� Chi課 s緋 b総 u, th� l鵦 phe th� l� %s, th� l鵦 phe c玭g l� %s, %s.", 
			tCamp2Name[nProtect], tCamp2Name[nCampNext1], tCamp2Name[nCampNext2]);
		Msg2Global(msg);
		AddGlobalNews(msg, 1);
	end
	local nSelfCamp = GetTask(3286);
	if nSelfCamp < 1 or nSelfCamp > 3 then
		Talk(1,"","Ch� c� nh﹏ v藅 gia nh藀 th� l鵦 m韎 頲 v祇 Chng Kh� S琻 C鑓.");
		return 0;
	end
	local nFightCamp = 2;
	if nSelfCamp == nProtect then
		nFightCamp = 1;
	end
	SetPlayerScript("\\script\\missions\\yp\\ywz\\mission.lua");
	SendScript2VM("\\script\\missions\\yp\\ywz\\mission.lua", format("JoinYwzMission(%d)", nFightCamp));
end