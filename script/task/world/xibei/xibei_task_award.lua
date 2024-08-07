--西北主线任务装备奖励脚本
--by vivi
--08/14/2007

--前期奖励调用相关函数：传入参数为策划文档中对应编号
--帽子、裤子、衣服：give_zb_award(nId)
--首饰：give_ss_award(nId)
--武器：give_wp_award(nId)
--最终兑换奖励（不用传入参数）：final_award()

--任务变量
TASK_GET_AWARD = 2037; --记录领取奖励成功与否的标志，1表示成功，0表示失败

--前期装备奖励table 裤子 衣服 帽子
tZbAward = {
	[26]={[1]={"Ch� Tr莕 Trang",0,101,2600},
				[2]={"Ch� Tr莕 Trang",0,101,2601},
				[3]={"Ch� Tr莕 Trang",0,101,2602},
				[4]={"Ch� Tr莕 Trang",0,101,2603}},
	[34]={[1]={"Th鮝 秐h Y",0,100,2604},
				[2]={"Th鮝 秐h Y",0,100,2605},
				[3]={"Th鮝 秐h Y",0,100,2606},
				[4]={"Th鮝 秐h Y",0,100,2607}},
	[44]={[1]={"Khinh V﹏ Th骳",0,103,2608},
				[2]={"Khinh V﹏ Th骳",0,103,2609},
				[3]={"Khinh V﹏ Th骳",0,103,2610},
				[4]={"Khinh V﹏ Th骳",0,103,2611}}  
	}	

--前期首饰奖励
tSsAward = {
	[59]={"Щng Giao B輈h",0,102,2612},
	[64]={"Kh雐 Phng Ng鋍",0,102,2613}
}

--装备编号，对应上面两个表，后两个为武器编号
tZbId = {26,34,44,59,64,11,49}

--前期武器奖励 对应奖励编号为11	
tWqAwardOne = {
	[2]={"Ph� Phong o",0,3,2510},
	[3]={"Ph莕 Phong Trng",0,8,2510},
	[4]={"T藅 Phong Th�",0,0,2510},
	[6]={"萵 Phong Ch﹎",0,1,2510},
	[8]={"H錳 Phong Ki誱",0,2,2510},
	[9]={"U萵 Phong C莔",0,10,2510},
	[11]={"Li謙 Phong Th�",0,0,2511},
	[12]={"Ph竛 Phong C玭",0,5,2510},
	[14]={"L璾 Phong Ki誱",0,2,2511},
	[15]={"Ti謙 Phong B髏",0,9,2510},
	[17]={"穘 Phong Thng",0,6,2510},
	[18]={"T藀 Phong Cung",0,4,2510},
	[20]={"Minh Phong Nh蒼",0,7,2510},
	[21]={"D鵦 Phong Tr秓",0,11,2510}
	}

--小白random用	
tRanAwardOne = {
	[1]={"Ph� Phong o",0,3,2510},
	[2]={"Ph莕 Phong Trng",0,8,2510},
	[3]={"T藅 Phong Th�",0,0,2510},
	[4]={"萵 Phong Ch﹎",0,1,2510},
	[5]={"H錳 Phong Ki誱",0,2,2510},
	[6]={"U萵 Phong C莔",0,10,2510},
	[7]={"Li謙 Phong Th�",0,0,2511},
	[8]={"Ph竛 Phong C玭",0,5,2510},
	[9]={"L璾 Phong Ki誱",0,2,2511},
	[10]={"Ti謙 Phong B髏",0,9,2510},
	[11]={"穘 Phong Thng",0,6,2510},
	[12]={"T藀 Phong Cung",0,4,2510},
	[13]={"Minh Phong Nh蒼",0,7,2510},
	[14]={"D鵦 Phong Tr秓",0,11,2510}
	}

--前期武器奖励 对应奖励编号为49	
tWqAwardTwo = {
	[2]={"Щng Tinh o",0,3,2520},
	[3]={"Lam Tinh Trng",0,8,2520},
	[4]={"Ch蕁 Tinh Th�",0,0,2520},
	[6]={"H蕄 Tinh Ch﹎",0,1,2520},
	[8]={"T� Tinh Ki誱",0,2,2520},
	[9]={"Th竔 Tinh C莔",0,10,2520},
	[11]={"Ti誹 Tinh Th�",0,0,2521},
	[12]={"Bi課 Tinh C玭",0,5,2520},
	[14]={"Phi Tinh Ki誱",0,2,2521},
	[15]={"Chuy觧 Tinh B髏",0,9,2520},
	[17]={"мnh Tinh Thng",0,6,2520},
	[18]={"Tng Tinh Cung",0,4,2520},
	[20]={"Ma Tinh Nh蒼",0,7,2520},
	[21]={"H鑙 Tinh Tr秓",0,11,2520}}

--小白random用
tRanAwardTwo = {
	[1]={"Щng Tinh o",0,3,2520},
	[2]={"Lam Tinh Trng",0,8,2520},
	[3]={"Ch蕁 Tinh Th�",0,0,2520},
	[4]={"H蕄 Tinh Ch﹎",0,1,2520},
	[5]={"T� Tinh Ki誱",0,2,2520},
	[6]={"Th竔 Tinh C莔",0,10,2520},
	[7]={"Ti誹 Tinh Th�",0,0,2521},
	[8]={"Bi課 Tinh C玭",0,5,2520},
	[9]={"Phi Tinh Ki誱",0,2,2521},
	[10]={"Chuy觧 Tinh B髏",0,9,2520},
	[11]={"мnh Tinh Thng",0,6,2520},
	[12]={"Tng Tinh Cung",0,4,2520},
	[13]={"Ma Tinh Nh蒼",0,7,2520},
	[14]={"H鑙 Tinh Tr秓",0,11,2520}}

--最终装备奖励，帽子，裤子，衣服
tFinalZb = {
	[2]={[1]={"Tuy謙 V﹏",0,103,2615},
			 [2]={"Tuy謙 V﹏",0,103,2616},
			 [3]={"Tuy謙 V﹏",0,103,2617},
			 [4]={"Tuy謙 V﹏",0,103,2618}},
	[3]={[1]={"Ph� Dao",0,101,2619},
			 [2]={"Ph� Dao",0,101,2620},
			 [3]={"Ph� Dao",0,101,2621},
			 [4]={"Ph� Dao",0,101,2622}},
	[4]={[1]={"Ng� Phong",0,100,2623},
			 [2]={"Ng� Phong",0,100,2624},
			 [3]={"Ng� Phong",0,100,2625},
			 [4]={"Ng� Phong",0,100,2626}}	
	}
	
--帽子裤子属性一，属性名 属性等级 魔法id
tMzAttriOne = {
	[2]={"Ph竧 huy t鑓  15%",2,276},
	[3]={"Sinh m謓h t鑙 產 12%",4,253}
	}

--衣服属性一
tYfAttriOne = {
	{"Ngo筰 ph遪g gi秏 7%, ngo筰 c玭g t╪g 14%",3,294},
	{"N閕 ph遪g gi秏 7%, n閕 c玭g t╪g 14%",3,442},
	{"S竧 thng +80",6,331}
	}

--装备属性二（帽子裤子衣服）
tAttriTwo = {
	{"S鴆 m筺h 25 甶觤",5,246},
	{"Linh ho箃 25 甶觤",5,248},
	{"Th﹏ ph竝 25 甶觤",5,247},
	{"N閕 c玭g 25 甶觤",5,249},
	{"G﹏ c鑤 25 甶觤",5,245}
	}	
	
--最终首饰奖励
tFinalSs = {"Hoan L╪g B秓 Ng鋍",0,102,2614}

--首饰属性 属性一名 等级 id 属性二名 等级 id
tSsAttri = {
	{"S鴆 m筺h 30 甶觤",6,246,"T蕋 c� thu閏 t輓h t╪g 15 甶觤",3,329},
	{"Linh ho箃 30 甶觤",6,248,"T蕋 c� thu閏 t輓h t╪g 15 甶觤",3,329},
	{"Th﹏ ph竝 30 甶觤",6,247,"T蕋 c� thu閏 t輓h t╪g 15 甶觤",3,329},
	{"N閕 c玭g 30 甶觤",6,249,"T蕋 c� thu閏 t輓h t╪g 15 甶觤",3,329},
	{"G﹏ c鑤 30 甶觤",6,245,"T蕋 c� thu閏 t輓h t╪g 15 甶觤",3,329}
	}
	
--最终武器奖励
tFinalWp = {
	[2]={"Ho祅 秐h o",0,3,2530},
	[3]={"Lu﹏ 秐h Trng",0,8,2530},
	[4]={"Huy襫 秐h Th�",0,0,2530},
	[6]={"Du 秐h Ch﹎",0,1,2530},
	[8]={"Linh 秐h Ki誱",0,2,2530},
	[9]={"B輈h 秐h C莔",0,10,2530},
	[11]={"B玭 秐h Th�",0,0,2531},
	[12]={"Ph� 秐h C玭",0,5,2530},
	[14]={"D藅 秐h Ki誱",0,2,2531},
	[15]={"Phong 秐h B髏",0,9,2530},
	[17]={"Ng� 秐h Thng",0,6,2530},
	[18]={"H錸g 秐h Cung",0,4,2530},
	[20]={"U 秐h Nh蒼",0,7,2530},
	[21]={"Th鵦 秐h Tr秓",0,11,2530}
	}


--最终武器random
tFinalRand = {
	[1]={"Ho祅 秐h o",0,3,2530},
	[2]={"Lu﹏ 秐h Trng",0,8,2530},
	[3]={"Huy襫 秐h Th�",0,0,2530},
	[4]={"Du 秐h Ch﹎",0,1,2530},
	[5]={"Linh 秐h Ki誱",0,2,2530},
	[6]={"B輈h 秐h C莔",0,10,2530},
	[7]={"B玭 秐h Th�",0,0,2531},
	[8]={"Ph� 秐h C玭",0,5,2530},
	[9]={"D藅 秐h Ki誱",0,2,2531},
	[10]={"Phong 秐h B髏",0,9,2530},
	[11]={"Ng� 秐h Thng",0,6,2530},
	[12]={"H錸g 秐h Cung",0,4,2530},
	[13]={"U 秐h Nh蒼",0,7,2530},
	[14]={"Th鵦 秐h Tr秓",0,11,2530}
	}

--武器属性一
tWpAttriOne = {
	{"Ngo筰 c玭g 8%",4,85},
	{"N閕 c玭g 8%",4,86},
	{"S竧 thng+100",2,268}
	}

--武器属性二
tWpAttriTwo = {
	{"S鴆 m筺h 25 甶觤",5,246},
	{"Linh ho箃 25 甶觤",5,248},
	{"Th﹏ ph竝 25 甶觤",5,247},
	{"N閕 c玭g 25 甶觤",5,249},
	{"G﹏ c鑤 25 甶觤",5,245}
	}
	
--武器属性三
tWpAttriThree = {"T蕋 c� thu閏 t輓h t╪g 5 甶觤",1,329}	
	
--前期奖励装备 帽子、裤子、衣服
function give_zb_award(nId)
	if Zgc_pub_goods_add_chk(1,60) ~= 1 then   --空间负重检测
		return
	end	
	local sBody = GetBody();
	local add_flog = AddItem(tZbAward[nId][sBody][2],tZbAward[nId][sBody][3],tZbAward[nId][sBody][4],1,1,-1,-1,-1,-1,-1,-1);
	if add_flog == 1 then
		Msg2Player("Ch骳 m鮪g b筺  nh薾 頲 1 "..tZbAward[nId][sBody][1]);
		SetTask(TASK_GET_AWARD,1);
	else
		WriteLog("Nhi謒 v� T﹜ B綾: Ngi ch琲"..GetName().."Thu trang b� th蕋 b筰, k� hi謚 th蕋 b筰:"..add_flog);
	end	
end	

--前期奖励装备 首饰
function give_ss_award(nId)
	if Zgc_pub_goods_add_chk(1,60) ~= 1 then   --空间负重检测
		return
	end
	local add_flog = AddItem(tSsAward[nId][2],tSsAward[nId][3],tSsAward[nId][4],1,1,-1,-1,-1,-1,-1,-1);
	if add_flog == 1 then
		Msg2Player("Ch骳 m鮪g b筺  nh薾 頲 1 "..tSsAward[nId][1]);
		SetTask(TASK_GET_AWARD,1);
	else
		WriteLog("Nhi謒 v� T﹜ B綾: Ngi ch琲"..GetName().."Thu trang s鴆 th蕋 b筰, k� hi謚 th蕋 b筰:"..add_flog);
	end
end

--前期奖励装备 武器
function give_wp_award(nId)
	local nRoute = GetPlayerRoute();
	if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
		Say("<color=green>Kh蕌 Chu萵<color>: Do b筺 ch璦 ch鋘 阯g tu luy謓 v� c玭g, n猲 t苙g b筺 m閠 m鉵 v� kh� ng蓇 nhi猲, ng � ch�?",
			2,
			"уng �/#confirm_wp_award("..nId..")",
			"Sau khi ta b竔 s� s� n l穘h thng/nothing")
	else
		confirm_wp_award(nId);
	end
end

function confirm_wp_award(nId)
	if Zgc_pub_goods_add_chk(1,60) ~= 1 then   --空间负重检测
		return
	end	
	local nRoute = GetPlayerRoute()
	local tAward = {};
	local tRand = {};
	if nId == tZbId[6] then
		tAward = tWqAwardOne;
		tRand = tRanAwardOne;
	elseif nId == tZbId[7] then
		tAward = tWqAwardTwo;
		tRand = tRanAwardTwo;
	end
	if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
		local n = random(1,getn(tRand));
		local add_flog = AddItem(tRand[n][2],tRand[n][3],tRand[n][4],1,1,-1,-1,-1,-1,-1,-1);
		if add_flog == 1 then
		 Msg2Player("Ch骳 m鮪g b筺  nh薾 頲 1 "..tRand[n][1]);
		 SetTask(TASK_GET_AWARD,1);
		else
		 WriteLog("Nhi謒 v� T﹜ B綾: Ngi ch琲"..GetName().."Thu v� kh� th蕋 b筰, k� hi謚 th蕋 b筰: "..add_flog);
		end
	else
		local add_flog = AddItem(tAward[nRoute][2],tAward[nRoute][3],tAward[nRoute][4],1,1,-1,-1,-1,-1,-1,-1);
		if add_flog == 1 then
			Msg2Player("Ch骳 m鮪g b筺  nh薾 頲 1 "..tAward[nRoute][1]);
			SetTask(TASK_GET_AWARD,1);
		else
			WriteLog("Nhi謒 v� T﹜ B綾: Ngi ch琲"..GetName().."Thu v� kh� th蕋 b筰, k� hi謚 th蕋 b筰: "..add_flog);
		end
	end 
end

--最终奖励兑换函数
function final_award()
	local strtab = {
		"Trang s鴆/#confirm_choose(1)",
		"M穙/#confirm_choose(2)",
		"Qu莕 /#confirm_choose(3)",
		"Y ph鬰/#confirm_choose(4)",
		"V� kh�/#confirm_choose(5)",
		"Sau n祔 i l筰/nothing"
		}
	Say("<color=green>Kh蕌 Chu萵<color>: H穣 ch鋘 lo筰 h譶h trang b� b筺 mu鑞 i?",
		getn(strtab),
		strtab)	
end

function confirm_choose(nId)
	local tZb = {"Trang s鴆","M穙","Qu莕 ","Y ph鬰","V� kh�"};
	local nRoute = GetPlayerRoute();
	if nId == 5 then
		if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
			Say("<color=green>Kh蕌 Chu萵<color>: Do b筺 ch璦 ch鋘 阯g tu luy謓 v� c玭g, n猲 t苙g b筺 m閠 m鉵 v� kh� ng蓇 nhi猲, ng � ch�?",
				2,
				"уng �/#give_final_award("..nId..")",
				"Ta ch鋘 nh莔 r錳, ch鋘 l筰/final_award");
		end
	end		
	Say("<color=green>Kh蕌 Chu萵<color>: B筺 ch鋘 trang b� mu鑞 i l� "..tZb[nId]..". фi ch�?",
		2,
		"уng �/#give_final_award("..nId..")",
		"Ta ch鋘 nh莔 r錳, ch鋘 l筰/final_award");
end

function give_final_award(nId)
	local sBody = GetBody();
	local nRoute = GetPlayerRoute();
	--获取初期奖励的武器id，初始为有路线奖励的武器id
	local nWpOneGenre = 0;
	local nWpOneDetail = 0;
	local nWpOneParticular = 0;
	local nWpTwoGenre = 0;
	local nWpTwoDetail = 0;
	local nWpTwoParticular = 0;
	local nPosOne = 0; --记录下面i的位置
	local nPosTwo = 0; --记录下面j的位置
	if nRoute ~= 0 and nRoute ~= 1 and nRoute ~= 5 and nRoute ~= 7 and nRoute ~= 10 and nRoute ~= 13 and nRoute ~= 16 and nRoute ~= 19 then
		nWpOneGenre = tWqAwardOne[nRoute][2];
		nWpOneDetail = tWqAwardOne[nRoute][3];
		nWpOneParticular = tWqAwardOne[nRoute][4];
		nWpTwoGenre = tWqAwardTwo[nRoute][2];
		nWpTwoDetail = tWqAwardTwo[nRoute][3];
		nWpTwoParticular = tWqAwardTwo[nRoute][4];	
	end
	--如果没有路线，遍历获取奖励的随机武器
	if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
		for i=1,14 do
			if GetItemCount(tRanAwardOne[i][2],tRanAwardOne[i][3],tRanAwardOne[i][4]) == 1 then
				nWpOneGenre = tRanAwardOne[i][2];
				nWpOneDetail = tRanAwardOne[i][3];
				nWpOneParticular = tRanAwardOne[i][4];
				nPosOne = i;
				break
			end
		end
		for j=1,14 do
			if GetItemCount(tRanAwardTwo[j][2],tRanAwardTwo[j][3],tRanAwardTwo[j][4]) == 1 then
				nWpTwoGenre = tRanAwardTwo[j][2];
				nWpTwoDetail = tRanAwardTwo[j][3];
				nWpTwoParticular = tRanAwardTwo[j][4];
				nPosTwo = j;
				break
			end
		end
	end
	local sDia = "";			
	--不在身上而在箱子里或摆摊界面上，则提示
	if GetItemCount(nWpOneGenre,nWpOneDetail,nWpOneParticular) == 0 and BigGetItemCount(nWpOneGenre,nWpOneDetail,nWpOneParticular) == 1 then 
		if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then 
			sDia = sDia..tRanAwardOne[nPosOne][1].."\n";
		else
			sDia = sDia..tWqAwardOne[nRoute][1].."\n";
		end
	end
	if GetItemCount(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular) == 0 and BigGetItemCount(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular) == 1 then
		if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
			sDia = sDia..tRanAwardTwo[nPosTwo][1].."\n";
		else
			sDia = sDia..tWqAwardTwo[nRoute][1].."\n";
		end
	end
	if GetItemCount(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4]) == 1 then
		sDia = sDia..tZbAward[tZbId[1]][sBody][1].."\n";
	end
	if GetItemCount(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4]) == 1	then
		sDia = sDia..tZbAward[tZbId[2]][sBody][1].."\n";
	end
	if GetItemCount(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4]) == 1 then
		sDia = sDia..tZbAward[tZbId[3]][sBody][1].."\n";
	end
	if GetItemCount(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4])	== 0 and BigGetItemCount(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4])	== 1 then
		sDia = sDia..tSsAward[tZbId[4]][1].."\n";
	end
	if GetItemCount(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4])	== 0 and BigGetItemCount(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4])	== 1 then
		sDia = sDia..tSsAward[tZbId[5]][1];
	end
	
	if (GetItemCount(nWpOneGenre,nWpOneDetail,nWpOneParticular) == 0 and BigGetItemCount(nWpOneGenre,nWpOneDetail,nWpOneParticular) == 1) or (GetItemCount(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular) == 0 and BigGetItemCount(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular) == 1) or
	(GetItemCount(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4]) == 1) or (GetItemCount(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4]) == 1) or
	(GetItemCount(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4]) == 1) or (GetItemCount(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4])	== 0 and BigGetItemCount(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4])	== 1) or
	(GetItemCount(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4])	== 0 and BigGetItemCount(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4])	== 1) then
		Talk(1,"","<color=green>Kh蕌 Chu萵<color>: B筺 c遪 c竎 trang b� sau t trong rng ch鴄  ho芻 giao di謓 b祔 b竛, h穣  n� v祇 trong h祅h trang.<color=yellow>"..sDia.."<color>");
	else
		if nId == 1 then --首饰
			local strtab = {};
			for i=1,getn(tSsAttri) do
				tinsert(strtab,tSsAttri[i][1].."/#confirm_shoushi("..nId..","..i..")");
			end
				tinsert(strtab,"Hay l� th玦, t筸 th阨 kh玭g i/nothing");
			Say("<color=green>Kh蕌 Chu萵<color>: H穣 ch鋘 thu閏 t輓h d遪g 1 c馻 trang s鴆 hi謓 t筰",
					getn(strtab),
					strtab);
		elseif nId == 2 then --帽子
			local strtab = {};
			for i=1,getn(tAttriTwo) do
				tinsert(strtab,tAttriTwo[i][1].."/#confirm_maozi("..nId..","..i..")");
			end
				tinsert(strtab,"Hay l� th玦, t筸 th阨 kh玭g i/nothing");
			Say("<color=green>Kh蕌 Chu萵<color>: Thu閏 t輓h d遪g 1 xu蕋 hi謓 tr猲 n鉵<color=yellow>: "..tMzAttriOne[2][1].."<color>. Xin ch鋘 thu閏 t輓h th� hai c馻 n鉵",
				getn(strtab),
				strtab);
		elseif nId == 3 then --裤子
			local strtab = {};
			for i=1,getn(tAttriTwo) do
				tinsert(strtab,tAttriTwo[i][1].."/#confirm_kuzi("..nId..","..i..")");
			end
				tinsert(strtab,"Hay l� th玦, t筸 th阨 kh玭g i/nothing");
			Say("<color=green>Kh蕌 Chu萵<color>: Thu閏 t輓h d遪g 1 xu蕋 hi謓 tr猲 qu莕<color=yellow>: "..tMzAttriOne[3][1].."<color>. Xin ch鋘 thu閏 t輓h th� hai c馻 h� y",
				getn(strtab),
				strtab);		
		elseif nId == 4 then --衣服
			local strtab = {};
			for i=1,getn(tYfAttriOne) do
				tinsert(strtab,tYfAttriOne[i][1].."/#confirm_yifu("..nId..","..i..")");
			end
				tinsert(strtab,"Hay l� th玦, t筸 th阨 kh玭g i/nothing");
			Say("<color=green>Kh蕌 Chu萵<color>: H穣 ch鋘 thu閏 t輓h d遪g 1 xu蕋 hi謓 tr猲 竜",
				getn(strtab),
				strtab);
		elseif nId == 5 then --武器
			local strtab = {};
			for i=1,getn(tWpAttriOne) do
				tinsert(strtab,tWpAttriOne[i][1].."/#confirm_wuqi("..nId..","..i..")");
			end
				tinsert(strtab,"Hay l� th玦, t筸 th阨 kh玭g i/nothing");
			Say("<color=green>Kh蕌 Chu萵<color>: H穣 ch鋘 thu閏 t輓h d遪g 1 xu蕋 hi謓 tr猲 竜",
				getn(strtab),
				strtab);			
		end	
	end	
end

function confirm_shoushi(nId,nOne)
	Say("<color=green>Kh蕌 Chu萵<color>: B筺 ch鋘 thu閏 t輓h d遪g 1 xu蕋 hi謓 tr猲 trang s鴆<color=yellow>: "..tSsAttri[nOne][1].."<color>, thu閏 t輓h c� nh th� hai l�: <color=yellow>"..tSsAttri[nOne][4].."<color>, x竎 nh ch璦?",
		2,
		"уng �/#confirm_final("..nId..","..nOne..")",
		"Ch鋘 sai r錳, ta mu鑞 ch鋘 l筰/give_final_award("..nId..")"
		)	
end

function confirm_maozi(nId,nOne)
	Say("<color=green>Kh蕌 Chu萵<color>: B筺 ch鋘 thu閏 t輓h d遪g 2 xu蕋 hi謓 tr猲 n鉵<color=yellow>: "..tAttriTwo[nOne][1].."<color>, x竎 nh ch璦?",
		2,
		"уng �/#confirm_final("..nId..","..nOne..")",
		"Ch鋘 sai r錳, ta mu鑞 ch鋘 l筰/give_final_award("..nId..")"
		)
end

function confirm_kuzi(nId,nOne)
	Say("<color=green>Kh蕌 Chu萵<color>: B筺 ch鋘 thu閏 t輓h d遪g 2 xu蕋 hi謓 tr猲 qu莕<color=yellow>: "..tAttriTwo[nOne][1].."<color>, x竎 nh ch璦?",
		2,
		"уng �/#confirm_final("..nId..","..nOne..")",
		"Ch鋘 sai r錳, ta mu鑞 ch鋘 l筰/give_final_award("..nId..")"
		)
end


function confirm_yifu(nId,nOne)
	Say("<color=green>Kh蕌 Chu萵<color>: B筺 ch鋘 thu閏 t輓h d遪g 1 xu蕋 hi謓 tr猲 竜<color=yellow>: "..tYfAttriOne[nOne][1].."<color>, x竎 nh ch璦?",
		2,
		"уng �/#choose_yifu_two("..nId..","..nOne..")",
		"Ch鋘 sai r錳, ta mu鑞 ch鋘 l筰/give_final_award("..nId..")"
		);
end

function choose_yifu_two(nId,nOne)
	local strtab = {};
	for i=1,getn(tAttriTwo) do
		tinsert(strtab,tAttriTwo[i][1].."/#confirm_yifu_two("..nId..","..nOne..","..i..")");
	end
		tinsert(strtab,"Hay l� th玦, t筸 th阨 kh玭g i/nothing");
	Say("<color=green>Kh蕌 Chu萵<color>: H穣 ch鋘 thu閏 t輓h d遪g 2 xu蕋 hi謓 tr猲 竜",
		getn(strtab),
		strtab);	
end

function confirm_yifu_two(nId,nOne,nTwo)
	Say("<color=green>Kh蕌 Chu萵<color>: B筺 ch鋘 thu閏 t輓h d遪g 2 xu蕋 hi謓 tr猲 竜<color=yellow>: "..tAttriTwo[nTwo][1].."<color>, x竎 nh ch璦?",
		2,
		"уng �/#confirm_final("..nId..","..nOne..","..nTwo..")",
		"Ch鋘 sai r錳, ta mu鑞 ch鋘 l筰/choose_yifu_two("..nId..","..nOne..")"
		);	
end

function confirm_wuqi(nId,nOne)
	Say("<color=green>Kh蕌 Chu萵<color>: B筺 ch鋘 thu閏 t輓h d遪g 1 xu蕋 hi謓 tr猲 v� kh�<color=yellow>: "..tWpAttriOne[nOne][1].."<color>, x竎 nh ch璦?",
		2,
		"уng �/#choose_wuqi_two("..nId..","..nOne..")",
		"Ch鋘 sai r錳, ta mu鑞 ch鋘 l筰/give_final_award("..nId..")"
		);	
end

function choose_wuqi_two(nId,nOne)
	local strtab = {};
	for i=1,getn(tWpAttriTwo) do
		tinsert(strtab,tWpAttriTwo[i][1].."/#confirm_wuqi_two("..nId..","..nOne..","..i..")");
	end
		tinsert(strtab,"Hay l� th玦, t筸 th阨 kh玭g i/nothing");
	Say("<color=green>Kh蕌 Chu萵<color>: H穣 ch鋘 thu閏 t輓h d遪g 2 xu蕋 hi謓 tr猲 v� kh�",
		getn(strtab),
		strtab);	
end

function confirm_wuqi_two(nId,nOne,nTwo)
	Say("<color=green>Kh蕌 Chu萵<color>: B筺 ch鋘 thu閏 t輓h d遪g 2 xu蕋 hi謓 tr猲 v� kh�<color=yellow>: "..tWpAttriTwo[nTwo][1].."<color>, thu閏 t輓h c� nh th� ba l�: <color=yellow>"..tWpAttriThree[1].."<color>, x竎 nh ch璦?",
		2,
		"уng �/#confirm_final("..nId..","..nOne..","..nTwo..")",
		"Ch鋘 sai r錳, ta mu鑞 ch鋘 l筰/choose_wuqi_two("..nId..","..nOne..")"
		);	
end

function confirm_final(nId,nOne,nTwo)
	if Zgc_pub_goods_add_chk(1,60) ~= 1 then   --空间负重检测
		return
	end	
	local sBody = GetBody();
	local nRoute = GetPlayerRoute();
	--获取初期奖励的武器id，初始为有路线奖励的武器id
	local nWpOneGenre = 0;
	local nWpOneDetail = 0;
	local nWpOneParticular = 0;
	local nWpTwoGenre = 0;
	local nWpTwoDetail = 0;
	local nWpTwoParticular = 0;
	if nRoute ~= 0 and nRoute ~= 1 and nRoute ~= 5 and nRoute ~= 7 and nRoute ~= 10 and nRoute ~= 13 and nRoute ~= 16 and nRoute ~= 19 then
		nWpOneGenre = tWqAwardOne[nRoute][2];
		nWpOneDetail = tWqAwardOne[nRoute][3];
		nWpOneParticular = tWqAwardOne[nRoute][4];
		nWpTwoGenre = tWqAwardTwo[nRoute][2];
		nWpTwoDetail = tWqAwardTwo[nRoute][3];
		nWpTwoParticular = tWqAwardTwo[nRoute][4];	
	end
	--如果没有路线，遍历获取奖励的随机武器
	if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
		for i=1,14 do
			if GetItemCount(tRanAwardOne[i][2],tRanAwardOne[i][3],tRanAwardOne[i][4]) == 1 then
				nWpOneGenre = tRanAwardOne[i][2];
				nWpOneDetail = tRanAwardOne[i][3];
				nWpOneParticular = tRanAwardOne[i][4];
				break
			end
		end
		for j=1,14 do
			if GetItemCount(tRanAwardTwo[j][2],tRanAwardTwo[j][3],tRanAwardTwo[j][4]) == 1 then
				nWpTwoGenre = tRanAwardTwo[j][2];
				nWpTwoDetail = tRanAwardTwo[j][3];
				nWpTwoParticular = tRanAwardTwo[j][4];
				break
			end
		end
	end	
	if GetItemCount(nWpOneGenre,nWpOneDetail,nWpOneParticular) == 1 then
		DelItem(nWpOneGenre,nWpOneDetail,nWpOneParticular,1);
	end
	if GetItemCount(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular) == 1 then
		DelItem(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular,1);
	end
	if GetItemCount(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4]) == 1 then
		DelItem(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4],1);
	end
	if GetItemCount(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4]) == 1 then
		DelItem(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4],1);
	end
	if GetItemCount(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4]) == 1 then
		DelItem(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4],1);
	end
	if GetItemCount(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4]) == 1 then
		DelItem(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4],1);
	end
	if GetItemCount(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4]) == 1 then
		DelItem(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4],1);
	end			
		local add_flog = 0;
		local sName = "";
		if nId == 1 then --首饰
			add_flog = AddItem(tFinalSs[2],tFinalSs[3],tFinalSs[4],1,1,tSsAttri[nOne][2],tSsAttri[nOne][3],tSsAttri[nOne][5],tSsAttri[nOne][6]);
			sName = tFinalSs[1];
		elseif nId == 2 then --帽子
			add_flog = AddItem(tFinalZb[2][sBody][2],tFinalZb[2][sBody][3],tFinalZb[2][sBody][4],1,1,tMzAttriOne[2][2],tMzAttriOne[2][3],tAttriTwo[nOne][2],tAttriTwo[nOne][3]);
			sName = tFinalZb[2][sBody][1];
		elseif nId == 3 then --裤子
			add_flog = AddItem(tFinalZb[3][sBody][2],tFinalZb[3][sBody][3],tFinalZb[3][sBody][4],1,1,tMzAttriOne[3][2],tMzAttriOne[3][3],tAttriTwo[nOne][2],tAttriTwo[nOne][3]);
			sName = tFinalZb[3][sBody][1];
		elseif nId == 4 then --衣服
			add_flog = AddItem(tFinalZb[4][sBody][2],tFinalZb[4][sBody][3],tFinalZb[4][sBody][4],1,1,tYfAttriOne[nOne][2],tYfAttriOne[nOne][3],tAttriTwo[nTwo][2],tAttriTwo[nTwo][3]);
			sName = tFinalZb[4][sBody][1];
		elseif nId == 5 then --武器
			if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
				local n = random(1,getn(tFinalRand));
				add_flog = AddItem(tFinalRand[n][2],tFinalRand[n][3],tFinalRand[n][4],1,1,tWpAttriOne[nOne][2],tWpAttriOne[nOne][3],tWpAttriTwo[nTwo][2],tWpAttriTwo[nTwo][3],tWpAttriThree[2],tWpAttriThree[3]);
				sName = tFinalRand[n][1];
			else
				add_flog = AddItem(tFinalWp[nRoute][2],tFinalWp[nRoute][3],tFinalWp[nRoute][4],1,1,tWpAttriOne[nOne][2],tWpAttriOne[nOne][3],tWpAttriTwo[nTwo][2],tWpAttriTwo[nTwo][3],tWpAttriThree[2],tWpAttriThree[3]);
				sName = tFinalWp[nRoute][1];
			end 
		end
		if add_flog == 1 then
			Msg2Player("Ch骳 m鮪g b筺,  i th祅h c玭g"..sName);
			SetTask(TASK_GET_AWARD,1);
		else
			WriteLog("Nhi謒 v� T﹜ B綾: Ngi ch琲"..GetName().."Thu trang b� sau c飊g th蕋 b筰, log: "..add_flog);
		end 
end

function nothing()

end

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
			return 0
		else 
			return 1
		end
end