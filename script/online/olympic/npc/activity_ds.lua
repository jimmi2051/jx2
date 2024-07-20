--奥运活动大使
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\settings\\static_script\\global\\regular_clear_task.lua")
Include("\\script\\lib\\talktmp.lua")

tbSay_201207 = {
	"Gi韎 thi謚 ho箃 ng/introduce_201207",
	format("Gh衟 %s/combining_flame_201207", WuCai_ShenHuoZhong[5]),
	format("竛 s� nh薾 %s/guess_flame_201207", Flame_Table[4][5]),
	format("дn H醓 V鵦 C鰑 Ch﹗ thu th藀 %s/goto_caji_map_201207", HuoZhongName),
	format("дn Thi猲 S� B� C秐h thu th藀 %s/goto_tianshimijing", HuoZhongName),
	"R髏 thng H筺h V薾/oly_lucky_star_201207",
}

sTitle_201207 = format("Ch祇 m鮪g phi猲 b秐 m韎, %s, nh薾 qu� t鑤. Nh﹏ v藅 v蕄 80  gia nh藀 l璾 ph竔 v� h鋍 h誸 to祅 b� k� n╪g c蕄 55 c� th� tham gia.", "Ni襪 vui H醓 Уn M颽 H�");

Activity_Ds_Name = "<color=green>Чi S� ho箃 ng: <color>";

sTitle_201207_1 = format("Tuy襫 Ch﹗ (165/192), Th祅h Й (180/179), Чi L� (231/222), Tng Dng (178/175), Ph鬾g Tng (221/195), Bi謓 Kinh (183/173) m鏸 th祅h c� 1 c竔%s", HuoTanNpcName);

function introduce_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	local tbSay = {
		format("%s ch駈g lo筰 v� ngu錸 g鑓/source_201207", HuoZhongName),
		format("S� l莕 d飊g 5 lo筰 %s th緋 l鯽 v� ph莕 thng/danse_award_201207", HuoZhongName),
		format("S� l莕 d飊g %s th緋 l鯽 v� ph莕 thng/wucai_award_201207", WuCai_ShenHuoZhong[5]),
		"R髏 thng H筺h V薾 Tinh m鏸 ng祔/lucky_star_201207",
		"H籲g ng祔 th緋 l鯽 g鋓 BOSS/lucky_call_boss",
		"\n r髏 lui/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1,getn(tbSay),tbSay);
end

function source_201207()
	local tbBody = format("  \n%s: BOSS trong 秈 Lng S琻, V筺 Ki誱 Tr騨g sinh ra;  \n%s: Th竔 H� Huy詎 C秐h, T礽 Nguy猲 Chi課 sinh ra;  \n%s: мa Huy襫 Cung, Th竔 Nh蕋 Th竝, Th� Luy謓 T� Linh sinh ra;  \n%s: Qu� M玭 H錳 L╪g thu th藀 U Minh Hoa (Qu竔 t� vong c� x竎 su蕋 r琲 ra), v� qu竔 trong Thi猲 S� B� C秐h r琲 ra;  \n%s: 竛 s� sinh ra;  \n%s: T譵 S� Gi� Ho箃 чng  gh衟 ho芻 trong Qu� M玭 H錳 L╪g ti猽 di謙 qu竔 nh� k輈h ho箃 Minh H醓 Qu� Linh c� x竎 su蕋 nh薾 頲\n",
		Flame_Table[5][5], Flame_Table[3][5], Flame_Table[1][5], Flame_Table[2][5], Flame_Table[4][5], WuCai_ShenHuoZhong[5]);
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name..tbBody;
	tbSay.sel = {
		{"\n r髏 lui","nothing"},
	};
	temp_Talk(tbSay);
end

function danse_award_201207()
	local tbBody = format("S� l莕: %s c馻 m鏸 th祅h th� 頲 th緋 s竛g 3 l莕/ng祔. Ph莕 thng:\n   T輈h l騳 s� l莕 th緋 l鯽 +1;\n   T輈h l騳 s� l莕 th緋 l鯽 c馻 server +1;\n   exp <color=green>%d<color>;\n   H閜 Qu� Th辬h H�;\n   1 o c� ng蓇 nhi猲.", HuoZhongName, OLY_EXP_2);
	local tbSay = {
		"S� l莕 th緋 s竛g c閚g d錸 c� l頸 輈h g� kh玭g?/fire_used_201207",
		"\n tr� v� t莕g trc/introduce_201207",
		"Ra kh醝/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function wucai_award_201207()
	local tbBody = " "..format("Gi秈 thng: \n   s� l莕 th緋 s竛g t輈h l騳+1; \n   s� l莕 th緋 s竛g t輈h l騳 trong ng祔 server+3; \n   exp <color=green>%d<color>v,v.", OLY_EXP_3);
	local tbSay = {
		"S� l莕 th緋 s竛g c閚g d錸 c� l頸 輈h g� kh玭g?/fire_used_201207",
		"\n tr� v� t莕g trc/introduce_201207",
		"Ra kh醝/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function fire_used_201207()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name.."Чt n s� l莕 th緋 s竛g t輈h l騳 kh竎 nhau khi nh薾 thng s� nh薾 頲 ph莕 thng phong ph�! ch� �: sau khi nh薾 thng cao nh蕋, s� l莕 th緋 s竛g t輈h l騳 s� reset 0, c� th� b総 u t輈h l騳 l筰.";
	tbSay.sel = {
		{"\n r髏 lui","nothing"},
	};
	temp_Talk(tbSay);
end

function combining_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	local tbSay = {
		format("S� d鬾g %s (Ng� C竎 c� b竛) gh衟 th祅h/combining_1_201207", WuCai_Shenshi[5]),
		--format("用单色%s和金合成/combining_2_201207", HuoZhongName),
		"\n r髏 lui/nothing",
	}
	Say(Activity_Ds_Name..format("B筺 mu鑞 gh衟 %s b籲g c竎h n祇?", WuCai_ShenHuoZhong[5]),getn(tbSay),tbSay);
end

function combining_1_201207()
	local tbSay = {
		format("S� d鬾g %d c竔 %s+%d c竔 %s gh衟 th祅h/#begin_combining_1(1)",Compose_ShengHuo_Num_1, Flame_Table[1][5], Compose_ShenShi_Num_1, WuCai_Shenshi[5]),
		format("S� d鬾g %d c竔 %s+%d c竔 %s gh衟 th祅h/#begin_combining_1(2)",Compose_ShengHuo_Num_1, Flame_Table[2][5], Compose_ShenShi_Num_1, WuCai_Shenshi[5]),
		format("S� d鬾g %d c竔 %s+%d c竔 %s gh衟 th祅h/#begin_combining_1(3)",Compose_ShengHuo_Num_1, Flame_Table[3][5], Compose_ShenShi_Num_1, WuCai_Shenshi[5]),
		format("S� d鬾g %d c竔 %s+%d c竔 %s gh衟 th祅h/#begin_combining_1(4)",Compose_ShengHuo_Num_1, Flame_Table[4][5], Compose_ShenShi_Num_1, WuCai_Shenshi[5]),
		format("S� d鬾g %d c竔 %s+%d c竔 %s gh衟 th祅h/#begin_combining_1(5)",Compose_ShengHuo_Num_1, Flame_Table[5][5], Compose_ShenShi_Num_1, WuCai_Shenshi[5]),
		"\n tr� v� t莕g trc/combining_flame_201207",
		"Ra kh醝/nothing",
	}
	Say(Activity_Ds_Name..format("5 %s b蕋 k� + 1 %s (Ng� C竎 c� b竛) = 1 %s", HuoZhongName, WuCai_Shenshi[5], WuCai_ShenHuoZhong[5]),getn(tbSay),tbSay);
end

function combining_2_201207()
	local tbSay = {
		format("D飊g %d c竔 %s + %d v祅g  gh衟/#begin_combining_2(1)",Compose_ShengHuo_Num_2, Flame_Table[1][5], Compose_Coin_Num_2),
		format("D飊g %d c竔 %s + %d v祅g  gh衟/#begin_combining_2(2)",Compose_ShengHuo_Num_2, Flame_Table[2][5], Compose_Coin_Num_2),
		format("D飊g %d c竔 %s + %d v祅g  gh衟/#begin_combining_2(3)",Compose_ShengHuo_Num_2, Flame_Table[3][5], Compose_Coin_Num_2),
		format("D飊g %d c竔 %s + %d v祅g  gh衟/#begin_combining_2(4)",Compose_ShengHuo_Num_2, Flame_Table[4][5], Compose_Coin_Num_2),
		format("D飊g %d c竔 %s + %d v祅g  gh衟/#begin_combining_2(5)",Compose_ShengHuo_Num_2, Flame_Table[5][5], Compose_Coin_Num_2),
		"\n tr� v� t莕g trc/combining_flame_201207",
		"Ra kh醝/nothing",
	}
	Say(Activity_Ds_Name..format("9 %s b蕋 k� + 30 v祅g = 1 %s", HuoZhongName, WuCai_ShenHuoZhong[5]),getn(tbSay),tbSay);
end

function guess_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	local tbBody = "T筰 h� ra 1 ch� s� (t� 1-100)  c竎 h� 畂竛 5 l莕, s� l莕 畂竛 tr髇g c祅g 輙 th� ph莕 thng c祅g l韓. S� l莕 tham gia tr� ch琲 m鏸 ng祔 l� t飝 �, nh璶g ch� 頲 nh薾 thng 3 l莕.";
	local tbSay = {
		"H穣 b総 u 甶 /oly_begin_guess",
		"Nh薾 ph莕 thng l莕 trc/oly_get_last_guess_award",
		"\n r髏 lui/nothing",
	}
	Say(Activity_Ds_Name..tbBody,getn(tbSay),tbSay);
end

function lucky_star_201207()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name.."S� l莕 th緋 s竛g t 6 l莕/ng祔, s� c� th� tham gia ho箃 ng R髏 Th╩ May M緉:\n   C竎h th鴆: Nh藀 1 con s� trong kho秐g 1-9999;\n   Quy tr譶h nh薾 thng: 21:00 h籲g ng祔 m� thng, t� 21:00-21:30 ngi ch琲 tr髇g thng ph秈 n ch� c馻 ta  ng k� tr髇g thng, 10 ngi ch琲 u ti猲 ng k� c� th� chia u ph莕 thng. Sau 21:30 c� th� nh薾 thng, n 22:00 th� k誸 th骳 nh薾 thng, qu� gi� s� kh玭g th� nh薾.\n   Ph莕 thng: M鏸 ng祔 50 Thi猲 Ki猽 L謓h, trong ng祔 kh玭g ai tr髇g thng (nh薾 thng), th� ph莕 thng s� t輈h l騳 cho n khi c� ngi tr髇g thng ho芻 ho箃 ng k誸 th骳.\n   Ch� �: Con s� may m緉 ch� c� hi謚 l鵦 trong ng祔.";
	tbSay.sel = {
		{"\n r髏 lui","nothing"},
	};
	temp_Talk(tbSay);
end

function lucky_call_boss()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name..format("Trong ng祔, khi s� l莕 th緋 l鯽 c馻 server t 5000 l莕, v祇 l骳 20:00 s� xu蕋 hi謓 Ph� Th駓 B╪g Gi� � T﹜ Th祅h Й, sau khi ti猽 di謙 s� nh薾 頲 nhi襲 ph莕 thng. D飊g %s thng  th緋 l鯽, s� l莕 th緋 l鯽 c馻 server +1, n誹 d飊g %s th緋 l鯽, th� s� l莕 th緋 l鯽 c馻 server +3.", HuoZhongName, WuCai_ShenHuoZhong[5]);
	tbSay.sel = {
		{"\n r髏 lui","nothing"},
	};
	temp_Talk(tbSay);
end

function oly_lucky_star_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	CheckAndDoRegularClear(EM_REGULAR_CLEAR_TYPE_DAILY);
	local tbBody = "S� l莕 th緋 s竛g t 6 l莕/ng祔, s� c� th� tham gia ho箃 ng R髏 Th╩ May M緉.\n    Ph莕 thng t輈h l騳 hi謓 t筰 l�: <color=green>%d Thi猲 Ki猽 L謓h<color>;\n    Con s� may m緉 h玬 nay l�: <color=green>%s<color>;\n    Con s� may m緉 c馻 b筺 l�: <color=green>%d<color>;\n    Ph莕 thng: M鏸 ng祔 50 Thi猲 Ki猽 L謓h, trong ng祔 kh玭g ai tr髇g thng (nh薾 thng), th� ph莕 thng s� t輈h l騳 cho n khi c� ngi tr髇g thng ho芻 ho箃 ng k誸 th骳.";
	local tbSay = oly_CreateDlgTable();
	local nTglNum,strNum,nMyluckNum = oly_GetBaseInfo();	
	tinsert(tbSay,"Ra kh醝/nothing");
	Say(Activity_Ds_Name..format(tbBody,nTglNum,strNum,nMyluckNum),getn(tbSay),tbSay);
end

function input_luck_num_201207()
	if gf_GetMyTaskByte(VET_OLY_TASK1,2,3) == 0 then
		AskClientForNumber("input_luck_num_cb_201207",1,OLY_MAX_LUCK_NUM,"Nh藀 ch� s� may m緉 c馻 c竎 h�");
	end
end

function input_luck_num_cb_201207(nNum)
	local nDayTime = oly_GetDayCurrTime(); --当天时间
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		gf_SetMyTaskByte(VET_OLY_TASK1,2,3,nNum,TASK_ACCESS_CODE_OLYMPIC);
		Msg2Player(format("Ch� s� may m緉 c馻 c竎 h� l� %d",nNum));
	else
		Msg2Player("B﹜ gi� kh玭g th� nh藀 ch� s� may m緉 , h穣 quay l筰 v祇 ng祔 mai.");
	end
end

function goto_caji_map_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	local tbSay = {
		"уng �/sure_201207",
		"Ra kh醝/nothing",
	}
	Say(Activity_Ds_Name..format("Quy誸 nh n b秐  thu th藀  t譵 %s?", Flame_Table[2][5]),getn(tbSay),tbSay);
end

function sure_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	if oly_Is_LevelSkill()	~= 1 then
		return 0;
	end
	NewWorld(328,1628,3981);
	SetFightState(1);
end

function goto_tianshimijing()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	local tbSay = {
		"уng �/sure_goto_tianshimijing",
		"Ra kh醝/nothing",
	}
	Say(Activity_Ds_Name..format("Quy誸 nh n b秐  thu th藀  t譵 %s?", Flame_Table[2][5]),getn(tbSay),tbSay);
end

function sure_goto_tianshimijing()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	if oly_Is_LevelSkill()	~= 1 then
		return 0;
	end
	NewWorld(329, 1734, 3428);
	SetFightState(1);
end

--登记
function register_mylucknum_201207()
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_Rigister");
end

--领奖
function get_lucknum_award_201207()
	if gf_GetTaskByte(VET_OLY_TASK1,4) == 0 then
		Talk(1,"","C竎 h� ch璦 ng k� kh玭g th� nh薾 ph莕 thng");
	end
	--领奖
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckPersonNum");
end