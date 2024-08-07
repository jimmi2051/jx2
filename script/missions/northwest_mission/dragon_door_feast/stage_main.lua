--脚本名称：西北区关卡第七关
--脚本功能：西北区关卡第七关主脚本，包含NPC对话、流程、奖励等等
--功能策划人：陈公子
--功能开发人：村长
--功能测试人：洋葱
--功能开发时间：2007-12-19
--代码修改记录：
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\missions\\northwest_mission\\dragon_door_feast\\mission_head.lua")
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\lib\\lingshi_head.lua");

--boss血量对应函数
Tb_boss_life_step = {0.9,0.7,0.5,0.3,0.1}
feast_npc_script_way = "\\script\\missions\\northwest_mission\\\dragon_door_feast\\stage_main.lua"
--小怪数量
feast_devil_num = 50
Tb_feast_npc_info = {
	{"L� Nguy猲 Kh竛h","L� Nguy猲 Kh竛h",1651,3149,feast_npc_script_way},
	{"Nh蕋 Ph萴 Л阯g T﹏ B�","Nh蕋 Ph萴 Л阯g T﹏ B�",1633,3178,feast_npc_script_way,feast_devil_num},
	{"Nh蕋 Ph萴 Л阯g Th輈h Kh竎h","Nh蕋 Ph萴 Л阯g Th輈h Kh竎h",1633,3178,feast_npc_script_way,feast_devil_num},
	{"Nh蕋 Ph萴 Л阯g Phi H�","Nh蕋 Ph萴 Л阯g Phi H�",1633,3178,feast_npc_script_way,feast_devil_num},
	{"Nh蕋 Ph萴 Л阯g H� D鵦","Nh蕋 Ph萴 Л阯g H� D鵦",1633,3178,feast_npc_script_way,feast_devil_num},
	{"Nh蕋 Ph萴 Л阯g V� V�","Nh蕋 Ph萴 Л阯g V� V�",1633,3178,feast_npc_script_way,feast_devil_num},
	{"M﹎ c�","Y課 ti謈",1634,3180,feast_npc_script_way,120},
}
--npc瞬间移动位置
Tb_npc_newpos = {
	{1657,3153},{1600,3153},{1601,3213},{1665,3212},
	{1682,3187},{1632,3134},{1632,3180},{1615,3170},
	{1654,3199},{1577,3191},{1633,3237},
}
Tb_npc_newpos_dialog = {
	"Nghe danh trung nguy猲 K� M玭 Thu蒼 Gi竝 uy猲 b竎 tinh th玭g. Nay r蕋 may m緉 頲 ti誴 chi猽 Ngh辌h K� M玭 n祔!",
	"Xem khinh c玭g c馻 v� l﹎ trung nguy猲 c� b� k辮 chi猽 K� Qu� B� Ph箃 c馻 Ngh辌h K� M玭 hay kh玭g?!",
	"C竎 v� th﹏ th� b蕋 ph祄, c� th� ti誴 chi猽 Ngh辌h K� M玭 Chi Thu藅 c馻 ta!",
}
--npc对话
Tb_boss_step_dialog = {
	--开始
	{	"<color=green>L� Nguy猲 Kh竛h<color>: Hoan ngh猲h c竎 v� quang l﹎, h玬 nay c竎 h� c� � m阨 kh竎h, bu鎖 y課 ti謈 n祔 nh籱 th総 ch苩 m鑙 th﹎ t譶h, m鋓 ﹏ o竛 xin h穣 b� qua cho.",
		"<color=green>L� Nguy猲 Kh竛h<color>: T莕 l╪g v� Dc Nh﹏ ng binh bi課, <color=green>Th竎 B箃 ho籲g<color> ph秐 b閕,  khi課 cho c竎 h� tr� th祅h nh﹏ v藅 u n穙 di Thi誸 Chu L謓h c馻 b鎛 阯g, h玬 nay g苝 m苩 qu� nhi猲 danh b蕋 h� truy襫.",
		"<color=green>L� Nguy猲 Kh竛h<color>: C竎 h� c� th� ti猽 di猽 t� t筰 di Thi誸 Chu L謓h, t筰 h� sau khi nghe danh v閕 v祅g n trung nguy猲, hy v鋘g kh玭g b� c玭g l莕 n祔. Gi�  c� th� di謓 ki課 anh h飊g, chi猽 i s� s礽, mong 頲 lng th�!",
		"<color=green>L� Nguy猲 Kh竛h<color>: Th� h� c馻 b鎛 阯g u l� nh鱪g t猲 b蕋 t礽 mong c竎 h� ng ci,  l﹗ s� l� vi謈, l莕 n祔 t筰 h� s� ch th﹏ gi秈 quy誸, kh玭g c莕 ph秈 gi秈 th輈h nhi襲, kh玭g ng筰 ch�?",
	},
	--新辈
	{	
		{"<color=green>L� Nguy猲 Kh竛h<color>: N誹 kh玭g th緉g n鎖 nh鱪g t猲 nh秈 nh衟 c馻 b鎛 阯g, th� xem nh� kh玭g c莕 chu萵 b� l莕 y課 ti謈 n祔."
		},
		{	"<color=green>L� Nguy猲 Kh竛h<color>: Th﹏ th� b蕋 ph祄, c� th� i ph� 頲 m蕐 t猲 th� h� b蕋 t礽 c馻 t筰 h�, qu� nhi猲 th藅 x鴑g ng!"
		},
		{	"<color=green>L� Nguy猲 Kh竛h<color>: Ch� c� m蕐 t猲 th� h� b蕋 t礽 m� c騨g kh玭g i ph� 頲, sao c� th� d� bu鎖 ti謈 n祔?",
			"<color=green>L� Nguy猲 Kh竛h<color>: Xem ra c竎 h� v蒼 ch璦 ph秈 l� i th� c馻 t筰 h�, th藅 ch糿g th� v� t� n祇."
		}
	},
	--刺客
	{	
		{"<color=green>L� Nguy猲 Kh竛h<color>: Ngay c� th輈h kh竎h c馻 b鎛 阯g m� kh玭g th緉g n鎖, xem ra kh玭g c莕 chu萵 b� cho b鱝 ti謈 n祔."
		},
		{	"<color=green>L� Nguy猲 Kh竛h<color>: Th﹏ th� b蕋 ph祄, t筰 h� r蕋 k輓h ph鬰 nh鱪g ngi d騨g v�."
		},
		{	"<color=green>L� Nguy猲 Kh竛h<color>: D鵤 v祇 th﹏ th� nh� th�, m� mu鑞 n竜 lo筺 b鎛 阯g sao,  t筰 h� xem th� v薾 may trung nguy猲 n u.",
			"<color=green>L� Nguy猲 Kh竛h<color>: Ch� l� m蕐 t猲 th輈h kh竎h, m� ngi c騨g  l髇g t髇g, t筰 h� th藅 kh玭g hi觰 b鎛 阯g b筰 � ch� n祇."
		}
	},
	--飞护
	{	
		{"<color=green>L� Nguy猲 Kh竛h<color>: M芻 d� Phi H� c馻 b鎛 阯g th鵦 l鵦 phi ph祄, nh璶g nh鱪g ngi mu鑞 tham d� y課 ti謈 th� ph秈 th緉g n�, th緉g n� m韎 c� th� b祅 n vi謈 d� ti謈."
		},
		{	"<color=green>L� Nguy猲 Kh竛h<color>: B鎛 阯g nhi襲 l莕 th蕋 b筰 � trung nguy猲, t筰 h� nh� kh玭g l莔 l� do cao th� trung nguy猲 c秐 tr�, qu� nhi猲 kh玭g ngo礽 d� 畂竛, th蕋 s竎h th蕋 s竎h."
		},
		{	"<color=green>L� Nguy猲 Kh竛h<color>: L莕 n祔 trung nguy猲 h祅h ng, t輓h to竛 k� lng chu o, kh玭g ng� b� ngi ph� ho筰, L� m� th蕋 b筰 r錳.",
			"<color=green>L� Nguy猲 Kh竛h<color>: C� ngh� r籲g nh鱪g ngi n y u l� cao th� v� l﹎ trung nguy猲, n祇 ng� ch� c� v礽 ngi ch l筰 phi h�, v� l﹎ trung nguy猲 qu� th藅 h� danh kh玭g 輙."
		}
	},
	--虎翼
	{	
		{"<color=green>L� Nguy猲 Kh竛h<color>: M芻 d� H� D鵦 c馻 b鎛 阯g th鵦 l鵦 phi ph祄, nh璶g nh鱪g ngi mu鑞 tham d� y課 ti謈 th� ph秈 th緉g 頲 n�, th緉g n� m韎 c� th� b祅 n vi謈 d� ti謈."
		},
		{	"<color=green>L� Nguy猲 Kh竛h<color>: V� l﹎ trung nguy猲 qu� l� i th� c馻 b鎛 阯g, l莕 sau h� n, ta quy誸 to祅 l鵦 i ph�,  tr� th� cho c竎 vong h錸  m蕋."
		},
		{	"<color=green>L� Nguy猲 Kh竛h<color>: Ngi nh薾 thi謕 c馻 L� m�, nh蕋 nh kh玭g ph秈 l� ngi t莔 thng, sao gi� v蒼 ch璦 n ? V� l﹎ trung nguy猲 ch� c� th� th玦 sao.",
			"<color=green>L� Nguy猲 Kh竛h<color>: V� l﹎ trung nguy猲 v蒼 ch璦 n , xem ra c莕 ph秈 g雐 thi謕, m阨 cao th� n d� ti謈, ch誸 di tay c馻 t筰 h� l� m閠 s� vinh h筺h."
		}
	},
	--羽林卫
	{	
		{"<color=green>L� Nguy猲 Kh竛h<color>: V� v� m韎 l� tinh anh c馻 b鎛 阯g, ch� c莕 th緉g 頲 ch髇g, t筰 h� nh蕋 nh s� chu萵 b� y課 ti謈 th辬h so筺 v� qu� h藆 h躰h t� T﹜ H�."
	},
		{	"<color=green>L� Nguy猲 Kh竛h<color>: K�  ho筩h c馻 b鎛 阯g m芻 d� b� ngi ph� h醤g, nh璶g v薾 m謓h Чi T鑞g kh玭g ph秈 n籱 trong tay ngi."
		},
		{	"<color=green>L� Nguy猲 Kh竛h<color>: C竎 ngi d竚 n Long M玭 y課, xem ra c騨g  gi竎 ng� 頲, s� ch玭 th﹏ � n琲 n祔, n猲 l蕐 l祄 vinh h筺h.",
			"<color=green>L� Nguy猲 Kh竛h<color>: B鎛 阯g  l蕐 l筰 kh� ph竎h, l蕐 l筰 nh鱪g g� thu閏 v� m譶h."
		}
	},
	--被干掉了
	{	
		"<color=green>L� Nguy猲 Kh竛h<color>: V� l﹎ trung nguy猲 qu� nhi猲 kh玭g l祄 L� m� th蕋 v鋘g, c� th� nh m閠 tr薾 th藅 s秐g kho竔, th藅 kh玭g u鎛g ph�.",
		"<color=green>L� Nguy猲 Kh竛h<color>: V� l﹎ trung nguy猲 qu� nhi猲 l� i th� c馻 L� m�, b鎛 阯g l蕐 l筰 kh� ph竎h, qu� kh玭g l祄 t筰 h� th蕋 v鋘g. M閠 ng祔 g莕 y s� b祔 ti謈 chi猽 i, r蕋 hoan ngh猲h."
	},
	--时间结束
	{
		"<color=green>L� Nguy猲 Kh竛h<color>: H玬 nay qu� nhi猲 頲 di謓 ki課 s� uy猲 b竎 tinh th玭g c馻 v� c玭g trung nguy猲, hy v鋘g l莕 sau l筰 頲 th� s鴆 c飊g c竎 v� anh h飊g!",
	}
}
--npc喊话
Tb_boss_step_chat = {
	--开始
	{	
			"Hoan ngh猲h c竎 v� quang l﹎! Y課 ti謈 s� s礽, chi猽 i kh玭g chu o, mong 頲 lng th�!",
			"Trung nguy猲 c� c� H筺g V� B� Vng b祔 H錸g M玭 Y課, c竎 v� c騨g c� kh� kh竔 d� ti謈 c馻 L璾 Thi猲 T�, tuy謙 di謚 tuy謙 di謚!",
			"Trung nguy猲 nh﹏ t礽 v� s�, ch糿g tr竎h kh緋 n琲 c鯽 秈 tr飊g tr飊g!",
	},
	--新备
	{	{	"Y課 ti謈 sao c� th� thi誹 ru, c竎 h� xem th� l莕 n祔 xem c竎 v� c� x鴑g ng  d� y課 ti謈 hay kh玭g! ",
			"Ngi u! B祔 ti謈, chi猽 i c竎 v� kh竎h qu�.",
		},
		{	"Y課 ti謈  頲 b祔, d騨g kh� c馻 c竎 v� th藅 khi課 t筰 h� k輓h ph鬰, nay long h� tng ph飊g sao c� th� thi誹 ru 頲?"},
		{	"C竎 v� t礽 ngh� k衜 c鈏, sao c� th� d� ti謈?"},
	},
	--刺客
	{	{	"C飊g Th竎 B箃 T� M� giao chi課, th藅 s秐g kho竔, mau mang ru cho ta!",
			"Ngi u! B祔 ti謈, chi猽 i c竎 v� kh竎h qu�."
		},
		{	"V� l﹎ trung nguy猲 danh b蕋 h� truy襫, cao th� v� s�, y課 ti謈 h玬 nay th藅 kh玭g l祄 t筰 h� th蕋 v鋘g!"},
		{	"Ch� l� v礽 t猲 th輈h kh竎h, khi課 m鋓 ngi m蕋 h鴑g, t筰 h� th藅 l蕐 l祄 ti誧!"},
	},
	--飞护
	{	{	"T筰 h� ph秈 ch鴑g t� th鵦 l鵦 c馻 m譶h, ti誴 chi猽!",
			"Ngi u! B祔 ru!"
		},
		{	"B鎛 阯g l莕 n祔 ch辵 thua trung nguy猲, qu� th藅 th鵦 l鵦 kh玭g !"},
		{	"Xem ra b鎛 阯g th秏 b筰, l� do ngi c馻 b鎛 阯g b蕋 t礽!"},
	},
	--虎翼
	{	{	"M� t鰑, th輈h h頿 khi ch玭 theo ngi!",
			"Bay u! M阨 ru, ng tr竎h ta kh玭g nng tay"
		},
		{"V� l﹎ trung nguy猲 qu� l� m閠 i th�, th藅 di詍 ph骳!"},
		{"Ngay c� H� D鵦 c騨g kh玭g qua n鎖, V� L﹎ Trung Nguy猲 ch� c� th� th玦 sao!"},
	},
	--羽林卫
	{	{	" o竛 gi鱝 b鎛 阯g v� trung nguy猲, h穣  L� m� ta ra tay gi秈 quy誸!",
			"Ngi u! B祔 ru, ti詎 c竎 v� cao th� l猲 阯g!"
		},
		{"Trung nguy猲 s韒 mu閚 g� c騨g thu閏 v� T﹜ H�, v� l﹎ kh� tr竛h n筺 tri襲 nh!"},
		{"Kh玭g c莕 gi穣 ch誸 n鱝, m筺g ngi  頲 nh s絥 r錳!"},
	},
	--被干掉了
	{	"t trung nguy猲 n祔, L� m� ch� l� kh竎h, c� ch髏 輙 qu� m鋘, mong c竎 v� nh薾 cho!",
		"L� v藅 kh玭g 頲 chu o c竎 v� h穣 nh薾 cho! "
	},
	--时间结束
	{
		"H玬 nay qu� th藅  nh譶 th蕐 r� s� th﹎ th髖 uy猲 b竎 c馻 v� c玭g trung nguy猲, hy v鋘g l莕 sau s� c� d辮 l穘h gi竜!"
	}

}
--npc+buff
Tb_boss_life_buff = {
	{},
	{	
		{"state_move_speed_percent_add",50,64800,0,19801260},
	},
	{
		{"state_magic_parmor_per_add",50,64800,0,19801261},
		{"state_physical_parmor_per_add",50,64800,0,19801262},
	},
	{
		{"state_knockback_when_lose_hp",810,64800,0,19801263},
		{"state_paralysis_when_lose_hp",232,64800,0,19801264},
		{"state_p_attack_percent_add",30,64800,0,19801265},
		{"state_m_attack_percent_add",30,64800,0,19801266},
	},
	{
		{"state_interrupt_rate_add",10,64800,0,19801267},
		{"state_paralysis_attack",10,64800,0,19801268},
		{"state_sleep_attack",10,64800,0,19801269},
		{"state_attack_burst_dec_attack",650,64800,0,19801270},
		{"state_slow_attack",650,64800,0,19801271},
		{"state_shadow_burst", 2565,64800,0,19801272},
	},
	{
		{"state_knockback_attack",10,64800,0,19801273},
		{"state_knockdown_attack",10,64800,0,19801274},
		{"state_fetter_attack",10,64800,0,19801275},
		{"state_confusion_attack",10,64800,0,19801276},
		{"state_vertigo_attack",10,64800,0,19801277},
		{"state_shadow_run",2565,64800,0,19801278},
	}
}
--宴席奖励
feast_exp_prize_max ={
	{1000000,1000000,1000000,1500000,2500000,6000000},
	{2000000,500000,500000,800000,1000000,2000000},
	}
feast_exp_chg_prize_max = 	{500000,800000,800000,1000000,1500000,3000000}
Tb_add_mertiral = {
	{2,1,3330,"Nh蕋 Thi觤 Y猽 Ho祅g"},
	{2,1,3331,"Tam Di謚 Long Hi"},
	{2,1,3332,"ч Nguy謙 Th莕 Sa"},
	{2,1,3333,"Ph莕 Quang Th莕 Sa"},
	{2,1,3334,"Tr秏 Tinh Th莕 Sa"},
	{2,1,3204," Ng� Th竔 Lung T髖"},
	{2,1,3205,"Th蕋 Huy襫 T� V╪"},
}
Tb_feast_mis_prirze = {
	{		--收费奖励
		--经验基数-健康转经验基数-灵石奖励（等级下限、等级上限、数量）-武器特效奖励（分类1（{ID,名称}，{概率1、概率2}{数量1、数量2}））
		{100000,120000,			{1,4,2},	{},									{}						},
		{250000,250000,			{1,4,2},	{},									{}						},
		{250000,250000,			{2,5,2},	{{50,100},{1,2},{1,1}},	{}						},
		{500000,300000,			{2,5,2},	{{50,100},{1,2},{2,2}},	{{50},{1},{3}}	},
		{750000,500000,			{3,6,2},	{{50,100},{1,2},{6,6}},	{{50},{1},{3}}	},
		{12500000,62500000,	{5,6,2},	{{10},{1},{7}},				{{100},{1},{3}}	},
	},
	{		--免费奖励
		--经验基数-灵石奖励（等级下限、等级上限、数量）-武器特效奖励（分类1（{ID,名称}，{概率1、概率2}{数量1、数量2}））
		{50000,0,						{1,4,2},	{},							{}					},
		{150000,0,						{1,4,2},	{},							{}					},
		{150000,0,						{2,5,2},	{{50},{1},{1}},		{{25},{1},{3}	}},
		{250000,0,						{2,5,2},	{{10},{1},{2}},		{{25},{1},{3}	}},
		{500000,0,						{3,6,2},	{{5},{1},{6}},			{{25},{1},{3}	}},
		{5000000,0,					{5,6,2},	{{3},{1},{7}},			{{25},{1},{3}	}},
	},
}
--*******************关卡主逻辑*********************
feast_boss_life_chk_start_sec = 3060
feast_boss_life_chk_end_sec = 60
Tb_feast_time_fun = {
	[feast_boss_life_chk_start_sec] = "chg_boss_2_fight()",
	[feast_boss_life_chk_end_sec] = "feast_fail()",
	[feast_boss_life_chk_end_sec - 1] = "feast_crt()",
	[0] = "feast_end()"
}
for i = 3600,3180,-1 do
	if mod(i,60) == 0 then
		Tb_feast_time_fun[i] = "feast_broadcast()"
	end
end
for i = 3179,3061,-1 do
	if mod(i,20) == 0 then
		Tb_feast_time_fun[i] = "feast_broadcast()"
	end
end
function OnTimer()
	--主逻辑
	local time_loop_num = GetMissionV(MS_TIMMER_LOOP_ID) 
	SetMissionV(MS_TIMMER_LOOP_ID,(time_loop_num - 1))
	--系统函数处理
	if Tb_feast_time_fun[time_loop_num] ~= nil then
		dostring(Tb_feast_time_fun[time_loop_num])
	end
	--血量检测时间
	local mis_step = GetMissionV(Ms_feast_step)		--boss血量低于10%以后不需要检测血量
	if mis_step < 6 and time_loop_num < feast_boss_life_chk_start_sec and time_loop_num > feast_boss_life_chk_end_sec  then
		feast_boss_life_chk()
	end
	--boss瞬间移动触发
	if time_loop_num < 3000 and time_loop_num > 60 and mod(time_loop_num,60) == 0 and GetMissionV(Ms_feast_deputy_step) == 0 then
		boss_now_pos()
	end
	--宴会各个阶段执行
	local denputy_loop_num =GetMissionV(MS_feast_timmer_deputy_loop_ID)
	if denputy_loop_num >= 0 then
		local denputy_step_id = GetMissionV(Ms_feast_deputy_step)
		if denputy_loop_num == 0 then
			if denputy_step_id == 1 then
				devil_kill_all_fail()
			else
				chg_boss_2_fight()
			end
		else
			SetMissionV(MS_feast_timmer_deputy_loop_ID,(denputy_loop_num-1))
		end
	end
end
--第二步循环，开始K npc
function chg_boss_2_fight()
	--等级处理
	local mis_step = GetMissionV(Ms_feast_step)
	if mis_step == 1 then
		local player_num = GetMissionV(MS_PLAYER_NUM)
		if player_num <= 0 then
			CloseMission(FEAST_MS_ID)
			local map_id =  SubWorldIdx2ID(SubWorld)
			WriteLog("[Y課 ti謈 Long M玭]c鯽 秈: 	"..map_id.."	C鯽 秈 	")
			return
		end
		Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Th阨 gian k誸 th骳 d� y課 c遪\",3000,0,1)")
	end
	--小怪清理
	feast_devil_clear()
	--boss转换
	local boss_index = GetMissionV(MS_feast_boss_index)
	ChangeNpcToFight(boss_index)
	feast_boss_chat(boss_index)
	--NpcChat(boss_index,Tb_boss_step_chat[mis_step][1][random(1,getn(Tb_boss_step_chat[mis_step][1]))])
	--boss+buff
	if Tb_boss_life_buff[mis_step] ~= nil then
		local buff_num = getn(Tb_boss_life_buff[mis_step])
		if  buff_num~= 0 then
			for i = 1,buff_num do
				CastState2Npc(boss_index,Tb_boss_life_buff[mis_step][i][1],Tb_boss_life_buff[mis_step][i][2],Tb_boss_life_buff[mis_step][i][3],Tb_boss_life_buff[mis_step][i][4],Tb_boss_life_buff[mis_step][i][5])
			end
		end
	end
	--系统处理
	SetMissionV(Ms_feast_forstep_time,GetTime())
	SetMissionV(Ms_feast_deputy_step,0)
	SetMissionV(MS_feast_timmer_deputy_loop_ID,-1)
end
--血量检测
function feast_boss_life_chk()
	local mis_step = GetMissionV(Ms_feast_step)
	local boss_index = GetMissionV(MS_feast_boss_index)
	local boss_life_max,boss_life_num = GetUnitCurStates(boss_index,1)
	if (boss_life_num/boss_life_max) < Tb_boss_life_step[mis_step] then
		chg_boss_2_dialog()
	end
end
--第三步，npc开始对话
function chg_boss_2_dialog()
	--时间记录
	SetMissionV(Ms_feast_waste_sec_num,(GetTime()-GetMissionV(Ms_feast_forstep_time)))
	--关卡等级提升
	local mis_step = (GetMissionV(Ms_feast_step) + 1)
	SetMissionV(Ms_feast_step,mis_step)
	SetMissionV(Ms_feast_deputy_step,1)
	--npc转换
	local boss_index = GetMissionV(MS_feast_boss_index)
	feast_boss_chat(boss_index)
	ChangeNpcToFight(boss_index,0,6)
	AddUnitStates(boss_index,7,0)
	--李元庆被杀死之前都要刷小怪
	if mis_step < 7 then	
		local map_id =  SubWorldIdx2ID(SubWorld)
		local devil_num,devil_index = CreateNpc(Tb_feast_npc_info[mis_step][1],Tb_feast_npc_info[mis_step][2],map_id,Tb_feast_npc_info[mis_step][3],Tb_feast_npc_info[mis_step][4],-1,Tb_feast_npc_info[mis_step][6],1,300)
		for i = 0,getn(devil_index) do
			SetNpcScript(devil_index[i],Tb_feast_npc_info[mis_step][5])
		end
		--小怪数量清0
		SetMissionV(Ms_feast_devil_kill_num,0)
		--小触发器执行
		SetMissionV(MS_feast_timmer_deputy_loop_ID,feast_devil_kill_loop_num)
		--时间记录
		SetMissionV(Ms_feast_forstep_time,GetTime())
		Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Th阨 gian nh b筰 h� v� c遪\","..feast_devil_kill_loop_num..",0,2)")
	end
end
--第四-1步：创建宴席，领取奖励
function devil_kill_all_suc()
	local boss_index = GetMissionV(MS_feast_boss_index)
	feast_boss_chat(boss_index)
	player_revive()
	--关卡等级处理
	SetMissionV(Ms_feast_deputy_step,2)
	--宴席创建
	feast_crt()
	--领取奖励时间30s
	SetMissionV(MS_feast_timmer_deputy_loop_ID,feast_prize_get_num)		--设置为-1则不计数
	SetMissionV(Ms_feast_forstep_time,GetTime())
end
--第四-2步：小怪未被杀完
function devil_kill_all_fail()
	local boss_index = GetMissionV(MS_feast_boss_index)
	feast_boss_chat(boss_index)
	player_revive()
	--关卡等级处理
	SetMissionV(Ms_feast_deputy_step,3)
	--暂停时间30s
	SetMissionV(MS_feast_timmer_deputy_loop_ID,feast_prize_get_num)		--设置为-1则不计数
	--下一阶段计数器
	SetMissionV(Ms_feast_forstep_time,GetTime())
	Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Th阨 gian ti誴 t鬰 t� v� c遪\","..feast_prize_get_num..",0,2)")
	feast_devil_clear()
end
--第五步：关卡失败
function feast_fail()
	local boss_index = GetMissionV(MS_feast_boss_index)
	SetNpcLifeTime(boss_index,0)
	--小怪清除
	feast_devil_clear()
	--转为对话npc
	--设置关卡步骤
	local log_mission_step = GetMissionV(Ms_feast_step)
	SetMissionV(Ms_feast_step,8)
	SetMissionV(MS_feast_timmer_deputy_loop_ID,-1)
	--设置关卡状态为等待结束
	SetMissionV(MS_TIMMER_LOOP_ID,58)
	Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Th阨 gian h誸 y課 ti謈 c遪\",60,0,1)")
	player_revive()
	local map_id =  SubWorldIdx2ID(SubWorld)
	WriteLog("[Y課 ti謈 Long M玭]c鯽 秈: 	"..map_id.."	C鯽 秈 1 產ng 頲 ng	"..log_mission_step.."	S� ngi	"..GetMissionV(MS_PLAYER_NUM).."")
end
--关卡结束
function feast_end()
	CloseMission(FEAST_MS_ID)
end
--复活玩家
function player_revive()
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(FEAST_MS_ID,0,nMapID)
	for i = 1, getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 1 then
			RevivePlayer(0)
		end
	end 
end
--boss瞬移
function boss_now_pos()
	local boss_index = GetMissionV(MS_feast_boss_index)
	local rand_seq = random(1,getn(Tb_npc_newpos))
	NpcChat(boss_index,Tb_npc_newpos_dialog[random(1,getn(Tb_npc_newpos_dialog))])
	SetNpcPos(boss_index,Tb_npc_newpos[rand_seq][1],Tb_npc_newpos[rand_seq][2])
	NpcChat(boss_index,Tb_npc_newpos_dialog[random(1,getn(Tb_npc_newpos_dialog))])
end
--*******************系统函数区***********************
--NPC对话信息
Tb_feast_npc_dialog = {
	{"L� Nguy猲 Kh竛h","feast_boss_dialog"},
	{"Y課 ti謈 Long M玭","feast_banquet_dialog"},
}
--对话主函数
function main()
	local npc_index = GetTargetNpc()
	local npc_name = GetTargetNpcName()
	if tonumber(date("%w")) == 5 and npc_name == "Y課 ti謈 Long M玭" then
		Talk(1,"","Y課 ti謈 ch� 頲 chi猽 i v祇 ng祔 th� 7!")
		return
	end
	for i = 1,getn(Tb_feast_npc_dialog) do
		if npc_name == Tb_feast_npc_dialog[i][1] then
			dostring(Tb_feast_npc_dialog[i][2].."("..npc_index..")")
		end
	end	
end
--李元庆对话
function feast_boss_dialog(npc_index)
	local stage_step = GetMissionV(Ms_feast_step)
	local npc_dialog = {}
	--第一步和第七步都只有一次对话
	if stage_step == 1 or stage_step == 7 or stage_step == 8 then
		npc_dialog = Tb_boss_step_dialog[stage_step]
	else
		local stage_deputy_step = GetMissionV(Ms_feast_deputy_step)
		npc_dialog = Tb_boss_step_dialog[stage_step][stage_deputy_step]
	end
	--对话开始
	if random(1,5) == 3 then
		feast_boss_chat(npc_index)
	end
	Talk(1,"",npc_dialog[random(1,getn(npc_dialog))])
end
--NPC喊话
function feast_boss_chat(npc_index)
	local stage_step = GetMissionV(Ms_feast_step)
	local npc_chat = {}
	--第一步和第七步都只有一次对话
	if stage_step == 0 then
		return
	end
	if stage_step == 1 or stage_step == 7 or stage_step == 8 then
		npc_chat = Tb_boss_step_chat[stage_step]
	else
		local stage_deputy_step = GetMissionV(Ms_feast_deputy_step)
		npc_chat = Tb_boss_step_chat[stage_step][stage_deputy_step]
	end
	NpcChat(npc_index,npc_chat[random(1,getn(npc_chat))])
end
--宴席对话
function feast_banquet_dialog(feast_index)
	Say("<color=green>L� Nguy猲 Kh竛h<color>: Trung nguy猲 qu� nhi猲 cao th� v� s�, tr薾 n祔 th藅 s秐g kho竔! Ru T﹜ H� n錸g n祅 ng﹜ ng蕋, r蕋 th輈h h頿 c竎 v� h祇 ki謙, m阨 d飊g! C遪 m閠 s� th� c馻 T﹜ H�, c竎 v� h穣 nh薾 l蕐!",
	3,
	"Thng th鴆 ru th辴/feast_restore",
	"Nh薾 l蕐 ph莕 thng./feast_get_prize",
	"R阨 kh醝 y課 ti謈/end_dialog"
	)
end
function feast_get_prize()
	local stage_step = (GetMissionV(Ms_feast_step) -1 )
	local prize_step = GetTask(TaskID_feast_prize_step) 
	if prize_step >= min(6,stage_step) then
		Talk(1,"","<color=green>Nh綾 nh�<color>: M鏸 ph莕 thng ch� nh薾 1 l莕!")
		return
	else
		stage_step = min(6,stage_step)
		SetTask(TaskID_feast_prize_step,stage_step)
		--奖励发放
		--经验
		local prize_T = 60/GetMissionV(Ms_feast_waste_sec_num)
		local exp_num = floor(min(feast_exp_prize_max[Sever_diff][stage_step],(Tb_feast_mis_prirze[Sever_diff][stage_step][1] * prize_T)))
		ModifyExp(exp_num)
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..exp_num.." 甶觤 kinh nghi謒!")
			--健康经验
		if Sever_diff == 1 then
			local exp_chg_num = min(GetGoldenExp(),floor((Tb_feast_mis_prirze[Sever_diff][stage_step][2] * prize_T)),feast_exp_chg_prize_max[stage_step])
			if exp_chg_num ~= 0 then
				ModifyGoldenExp(-exp_chg_num)
				ModifyExp(exp_chg_num)
				Msg2Player("Ch骳 m鮪g b筺  i "..exp_chg_num.." 甶觤 s鴆 kh醗 th祅h kinh nghi謒!")
			else
				Msg2Player("觤 s鴆 kh醗 c馻 b筺 l� 0, kh玭g th� i th祅h kinh nghi謒!")
			end
		end
		--灵石
		for i = 1,Tb_feast_mis_prirze[Sever_diff][stage_step][3][3] do
				local linshi_level = random(Tb_feast_mis_prirze[Sever_diff][stage_step][3][1],Tb_feast_mis_prirze[Sever_diff][stage_step][3][2])
				lspf_AddLingShiInBottle(linshi_level,1)
				Msg2Player("B筺 nh薾 頲 1 vi猲 c蕄 "..linshi_level.." Linh th筩h,  cho v祇 T� Linh nh!")
		end
			--特效材料1
		local ran_num = 0
		for i = 4,5 do
			ran_num = random(1,100)
			if getn(Tb_feast_mis_prirze[Sever_diff][stage_step][i]) ~= 0 then
				for j = 1,getn(Tb_feast_mis_prirze[Sever_diff][stage_step][i][1]) do
					if ran_num <= Tb_feast_mis_prirze[Sever_diff][stage_step][i][1][j] then
						local mertiral_seq = Tb_feast_mis_prirze[Sever_diff][stage_step][i][3][j]
						local mertiral_num = Tb_feast_mis_prirze[Sever_diff][stage_step][i][2][j]
						local add_flag = AddItem(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3],mertiral_num)
						if add_flag == 1 then
							Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..mertiral_num.."c竔"..Tb_add_mertiral[mertiral_seq][4].."!")
						else
						WriteLog("C鯽 秈 v飊g T﹜ B綾: 秈 7, ngi ch琲 ["..GetName().."]t╪g th猰 "..mertiral_num.."c竔"..Tb_add_mertiral[mertiral_seq][4].." th蕋 b筰, k� hi謚:"..add_flag)
						end
					end
				end
			end
		end
		--个人信息
		Msg2Player("B筺 ph竧 hi謓 c� m閠 s� v藅 k� l� trong y課 ti謈 ph竧 s竛g l蕄 l竛h, c� th� l� b秓 v藅 T﹜ H� do L� Nguy猲 Kh竛h mang n!")
	end
end
--玩家全回
function feast_restore()
	RestoreAll()
	Msg2Player("Kh玭g bi誸 lo筰 ru T﹜ H� n祔 頲 n蕌 nh� th� n祇, n誱 v祇 mi謓g  th蕐 m飅 v� m , d� v� ng﹜ ng蕋, b筺 l藀 t鴆 c秏 th蕐 u 鉩 s竛g su鑤 d� ch辵, th� l鵦 h錳 ph鬰 r蕋 nhanh!")
end
--创建酒席
function feast_crt()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local big_feast_index = CreateNpc("Long M玭 i y課 ti謈","Y課 ti謈 Long M玭",map_id,Tb_feast_npc_info[7][3],Tb_feast_npc_info[7][4])
	SetNpcScript(big_feast_index,Tb_feast_npc_info[7][5])
	SetNpcLifeTime(big_feast_index,30)
	local feast_num,feast_index = CreateNpc("y課 ti謈 Long M玭","Y課 ti謈 Long M玭",map_id,Tb_feast_npc_info[7][3],Tb_feast_npc_info[7][4],-1,20,2,Tb_feast_npc_info[7][6])
	for i = 0,getn(feast_index) do
		SetNpcScript(feast_index[i],Tb_feast_npc_info[7][5])
		SetNpcLifeTime(feast_index[i],30)
	end
	--计时器停止
	Zgc_pub_mission_fun(FEAST_MS_ID,"StopTimeGuage(2)")
	--下一阶段计数器
	Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Th阨 gian nh薾 thng c遪\","..feast_prize_get_num..",0,2)")
end
--npc死亡信息
Tb_feast_npc_death = {
	{"L� Nguy猲 Kh竛h","boss_death()"},
	{"Nh蕋 Ph萴 Л阯g T﹏ B�","devil_death(npc_index)"},
	{"Nh蕋 Ph萴 Л阯g Th輈h Kh竎h","devil_death(npc_index)"},
	{"Nh蕋 Ph萴 Л阯g Phi H�","devil_death(npc_index)"},
	{"Nh蕋 Ph萴 Л阯g H� D鵦","devil_death(npc_index)"},
	{"Nh蕋 Ph萴 Л阯g V� V�","devil_death(npc_index)"},
}
--死亡主函数
function OnDeath(npc_index)
	for i = 1,getn(Tb_feast_npc_death) do
		if GetNpcName(npc_index) == Tb_feast_npc_death[i][1] then
			dostring(Tb_feast_npc_death[i][2])
			break
		end
	end
end
--李元庆死亡
function boss_death()
	--时间计算
	SetMissionV(Ms_feast_waste_sec_num,(GetTime()-GetMissionV(Ms_feast_forstep_time)))
	--转为对话NPC
	local boss_index = GetMissionV(MS_feast_boss_index)
	SetNpcLifeTime(boss_index,0)
	local map_id =  SubWorldIdx2ID(SubWorld)
	boss_index = CreateNpc(Tb_feast_npc_info[1][1],Tb_feast_npc_info[1][2],map_id,Tb_feast_npc_info[1][3],Tb_feast_npc_info[1][4])
	SetNpcScript(boss_index,Tb_feast_npc_info[1][5])
	ChangeNpcToFight(boss_index,0,6)
	AddUnitStates(boss_index,7,0)
	SetMissionV(MS_feast_boss_index,boss_index)
	--奖励领取
	local mis_step = (GetMissionV(Ms_feast_step) + 1)
	SetMissionV(Ms_feast_step,mis_step)
	--击杀奖励(称号)
	if PlayerIndex ~= 0 and PlayerIndex ~= nil then
		AddTitle(60,8)
		SetCurTitle(60,8)
		SetTitleTime(60,8,(GetTime() +( 7 * 86400)))
		Zgc_pub_mission_fun(FEAST_MS_ID,"Msg2Player(\""..GetName().."  t筰 y課 ti謈 Long M玭, d飊g m閠 chi猽 hi觤 h鉩 nh b筰 Nh蕋 Ph萴 Л阯g L� Nguy猲 Kh竛h, c竎 anh h飊g tung ho祅h T﹜ V鵦 c騨g c飊g L� Nguy猲 Kh竛h  s鴆, qu� th鵦 h祇 kh� b鮪g b鮪g!\")")
		AddGlobalNews(GetName().."  t筰 y課 ti謈 Long M玭, d飊g m閠 chi猽 hi觤 h鉩 nh b筰 Nh蕋 Ph萴 Л阯g L� Nguy猲 Kh竛h, t 頲 danh hi謚 'Tung Ho祅h T﹜ H�', anh h飊g c竎 ph竔 c騨g c飊g L� Nguy猲 Kh竛h  s鴆, qu� th鵦 h祇 kh� b鮪g b鮪g!")
	end
	feast_devil_clear()
	SetMissionV(Ms_feast_step,8)
	SetMissionV(MS_feast_timmer_deputy_loop_ID,-1)
	--设置关卡状态为等待结束
	local log_time_loop_num = GetMissionV(MS_TIMMER_LOOP_ID)
	SetMissionV(MS_TIMMER_LOOP_ID,59)
	Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Th阨 gian h誸 y課 ti謈 c遪\",60,0,1)")
	if tonumber(date("%w")) == 5 then
		local player = mf_GetMSPlayerIndex(FEAST_MS_ID,0,map_id)
		for i = 1, getn(player) do
			PlayerIndex = player[i]
			if IsPlayerDeath() == 0 then
				ModifyExp(10000000)
				Msg2Player("Nh薾 頲 10000000 甶觤 kinh nghi謒.")
				WriteLog("[Y課 ti謈 Long M玭]c鯽 秈: 	"..map_id.."	C鯽 秈 	".."nh薾 10000000 甶觤 kinh nghi謒")
			end
		end
	end
	player_revive()
	Zgc_pub_mission_fun(FEAST_MS_ID,"Task_finish()")
	--log记录
	local map_id =  SubWorldIdx2ID(SubWorld)
	WriteLog("[Y課 ti謈 Long M玭]c鯽 秈: 	"..map_id.."	Th阨 gian qua 秈 c鯽 秈 2	"..Zgc_pub_time_sec_change((3060 - log_time_loop_num),1).."	S� ngi	"..GetMissionV(MS_PLAYER_NUM).."")
end
--任务完成
function Task_finish()
	--任务进度
	if GetTask(Tb_stage7_sign_task_info[1]) == Tb_stage7_sign_task_info[2] then
		SetTask(Tb_stage7_sign_task_info[1],(Tb_stage7_sign_task_info[2]+1))
		Msg2Player("Cu鑙 c飊g  nh b筰 Nh蕋 Ph萴 Л阯g L� Nguy猲 Kh竛h, mau quay v� h錳 b竜 Kh蕌 Chu萵 � Bi謓 Kinh.")
		TaskTip("Cu鑙 c飊g  nh b筰 Nh蕋 Ph萴 Л阯g L� Nguy猲 Kh竛h, mau quay v� h錳 b竜 Kh蕌 Chu萵 � Bi謓 Kinh.")
	end
end
--小怪死亡
function devil_death(npc_index)
	local devil_killed_num = GetMissionV(Ms_feast_devil_kill_num)
	if devil_killed_num == (feast_devil_num - 1) then
		devil_kill_all_suc()
	else
		SetMissionV(Ms_feast_devil_kill_num,(devil_killed_num+1))
	end
	SetNpcLifeTime(npc_index,5)
end
--********************公共函数区********************
--小怪清理函数
function feast_devil_clear()
	--清理小怪
	local mission_step = GetMissionV(Ms_feast_step)
	local map_id = SubWorldIdx2ID(SubWorld)
	local npc_total_index = GetMapNpcIdx(map_id)
	local npc_num = getn(npc_total_index)
	if npc_num < 1 then
		return
	else
		for i = 1,npc_num do
			if GetNpcName(npc_total_index[i]) ~= Tb_feast_npc_info[1][2] and GetNpcName(npc_total_index[i]) ~= Tb_feast_npc_info[7][2] then
				SetNpcLifeTime(npc_total_index[i],0)
			end
		end
	end
end
--系统广播函数
function feast_broadcast()
	local start_remian_sec_num = (GetMissionV(MS_TIMMER_LOOP_ID)-3060)
	AddGlobalNews("Y課 ti謈 Long M玭 s� b総 u: M阨 ngi ch琲 n Long M玭 tr蕁 t譵 Npc Ti觰 Nh� ng k� qua 秈. Th阨 gian k誸 th骳 ng k� c遪 "..Zgc_pub_time_sec_change((start_remian_sec_num-1),0).."K誸 th骳!")
end
