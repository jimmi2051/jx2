
-- 剑侠情缘 II 师门任务
-- 2005/03/14  PM 16:09
-- Edited by peres

Include("\\script\\task\\faction\\faction_head.lua");

-- 开始与玄慈对话
function task_001()

local strMain = {
	"Xin th� ch� t葃 tr莕 trc sau  quay l筰 t譵 b莕 t╪g.",
	"M鋓 vi謈 th� ch� c� th� h醝 Huy襫 Minh."
	}

TE_Talk(getn(strMain), "task_002", strMain);

TaskTip(" t譵 Huy襫 Minh h醝 chuy謓 nh藀 m玭!");

end

-- 对话结束，改变变量：1
function task_002()

	SetTask(1001,1);

end

-- 与玄明对话
function task_003()

local strMain = {
	"Trc t� c� con su鑙 nh�, m阨 Th� ch� n  t譵 <color=yellow>H醓 C玭g u (177.204)<color>  t葃 tr莕, sau  h穣 quay l筰 t譵 ta."
	}

TE_Talk(getn(strMain), "task_004", strMain);

TaskTip(" t譵 H醓 C玭g u (177.204)!");

end

-- 对话结束，改变变量：2
function task_004()

	SetTask(1001,2);

end


-- 与伙工头对话
function task_005()

local strMain = {
	"Xin Th� ch� b� th� 50 ng ti襫 nhang n r錳 h穣 t葃 tr莕 t辬h th﹏.",
	"Лa 50 ng/task_005_okay",
	"Ta kh玭g mang theo ti襫/task_005_no"
	}

Say(strMain[1],2,strMain[2],strMain[3]);

end


function task_005_okay()

	if (Pay(50) == 1) then
	
		-- 对话结束，改变变量：3
		SetTask(1001,3);
		
		Say("Th� ch� h穣 t辬h t﹎ trc ! H穣 甶 g苝 Th� t鋋 Huy襫 Minh  頲 hng d蒼!",0);
		RestoreStamina()
		
		TaskTip("H醓 C玭g u b秓 b筺 甶 t譵 Huy襫 Minh!");
		
	else
		Say("Th� ch� t譵  50 ng r錳 h穣 quay l筰!",0);
	end

end


function task_005_no()

	Say("Th� ch� t譵  50 ng r錳 h穣 quay l筰!",0);
	
end


-- 回见玄明的对话
function task_006()

local strMain = {
	"Ph祄  t� Thi誹 L﹎ ta, trc khi nh藀 t� ph秈 c髇g 1 ch衝 <color=yellow>ch竜 L筽 B竧<color>  t� l遪g th祅h k輓h.",
	"Th� ch� c� th� n <color=yellow>ch﹏ n骾<color> h醝 <color=yellow>Hng Kh竎h<color>, b鋘 h� th祅h t﹎ l� Ph藅 ch綾 c� th� ."
	}

TE_Talk(getn(strMain), "task_007", strMain);

TaskTip("H穣 xu鑞g ch﹏ n骾 t譵 Hng Kh竎h xin 1 ch衝 ch竜 L筽 B竧!");

end


-- 对话结束，改变变量：4
function task_007()

	SetTask(1001,4);
		
end


-- 与山下的香客对话
function task_008()

local strMain = {
	"Чi th骳! Ta mu鑞 gia nh藀 Thi誹 L﹎ nh璶g thi誹 m閠 ch衝 ch竜 L筽 B竧  c髇g Ph藅 t�, kh玭g bi誸 玭g c� th� cho ta xin 1 ch衝?",
	"Cho ngi? N鉯 d� nghe th�! Ch竜 L筽 B竧 c馻 ta ph秈 d飊g Xuy猲 B鑙, C竧 C竛h, Kim Li猲 Hoa, B蕋 T� Th秓 v� Thi猲 S琻 Tuy誸 Li猲 n蕌 trong b秠 b秠 b鑞 mi ch輓 ng祔! Cho ngi �! H�!",
	"V穘 b鑙 v� tri! Xin Чi th骳 ch� 甶觤 th猰!",
	" 3 ng祔 阯g, ta c騨g m謙 r錳, tr� phi ngi v薾 d鬾g <color=yellow>K� n╪g giang h�<color> l祄 <color=yellow>3 c竔 b竛h ng�<color>  i, n誹 kh玭g ta s� ╪ ch衝 ch竜 n祔!",
	"Kh玭g ph秈 Чi th骳 d飊g ch衝 ch竜 n祔  k輓h Ph藅 �? Hu鑞g chi t筰 h� c騨g ch糿g c� k� n╪g giang h�.",
	"K衜 qu�! K� n╪g giang h� l� b秐 n╪g v鑞 c� c馻 m鏸 ngi, ngi ch� c莕 nh蕁 <color=yellow><F5><color> m� giao di謓 k� n╪g v� c玭g, nh蕁 ch鋘 <color=yellow>S鑞g<color> s� hi觰.",
	"V穘 b鑙 s� th� l祄 b竛h ng�, i th骳 h穣 ch� l蕐!"
	}
	
TE_Talk(getn(strMain), "task_009", strMain);

end

-- 对话结束，改变变量：5
function task_009()
	TaskTip("Hng Kh竎h b秓 b筺 l祄 3 c竔 b竛h ng� i ch竜 L筽 B竧!");
	SetTask(1001,5);
end

-- 玩家有窝头来交任务时
function task_010()

local strMain = {
		"Чi th骳! Зy l� b竛h ng� c馻 ngi!",
		"Hay l緈! Ch衝 <color=yellow>Ch竜 L筽 B竧<color> n祔 xin d﹏g l猲 Ph藅 t� d飉!"
	}

	if (GetItemCount(1,1,1)>=3) then
		TE_Talk(getn(strMain), "task_011", strMain);		
	else
		Say("Ch璦 l祄 xong b竛h ng�? H穣 mau l猲 n誹 kh玭g ta s� ╪ ch衝 ch竜 n祔 �!",0);
		return
	end;

end;

-- 对话结束，改变变量：6
-- 删除窝头，增加腊八粥
function task_011()
	TaskTip("B筺  l蕐 頲 ch竜 L筽 B竧, c� th� quay v� t譵 Huy襫 Minh!");
	DelItem(1,1,1,3);
	AddItem(2,0,5,1);
	SetTask(1001,6);
end;


-- 回去与玄明的对话
function task_012()

local strMain = {
	"A Di У Ph藅!",
	"Th� ch� t葃 tr莕 xong, c� th� 甶 t譵 <color=yellow>Phng Trng Чi S�<color>  gia nh藀 Thi誹 L﹎!"
	}

TE_Talk(getn(strMain), "task_013", strMain);

TaskTip("Huy襫 Minh b秓 b筺 t譵 Phng Trng  gia nh藀 Thi誹 L﹎!");

end


-- 扣除腊八粥，改变变量：7
function task_013()

DelItem(2,0,5,1);
SetTask(1001,7);

end


-- 回去与玄慈的对话
function task_014()

local strMain = {
	"Mu鑞 gia nh藀 Ph藅 m玭 ta ph秈 h祅h thi謓 t輈h c, kh玭g 頲 lo筺 s竧 v� c�, th� ch� c� th� l祄 頲 kh玭g?",
	"уng �/task_015",
	"Kh玭g ng �/task_no"
	}

Say(strMain[1],2,strMain[2],strMain[3]);

end


function task_015()

local strMain = {
	"Gia nh藀 Ph藅 m玭 ph秈 t辬h t﹎ tu h祅h, th� ch� c� l祄 頲 kh玭g?",
	"уng �/task_016",
	"Kh玭g ng �/task_no"
	}

Say(strMain[1],2,strMain[2],strMain[3]);

end


function task_016()

local strMain = {
	"Gia nh藀 Ph藅 m玭 l鬰 c╪ thanh t辬h, kh玭g 頲 c� t� ni謒, d﹎ �! Th� ch� c� l祄 頲 kh玭g?",
	"уng �/task_017",
	"Kh玭g ng �/task_no"
	}

Say(strMain[1],2,strMain[2],strMain[3]);

end


function task_017()
	-- 对话结束，改变变量：8
	SetTask(1001,8);
	SetPlayerFaction(1)
	SetPlayerRoute(1)
	Say("A Di У Ph藅! Hoan ngh猲h Thi誹 hi謕 gia nh藀 Thi誹 L﹎.",0);
	i=GetBody()
	if i==1 then 
		AddItem(0,109,73,1)
		AddItem(0,108,73,1)
	else 
		AddItem(0,109,77,1)
		AddItem(0,108,77,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("江湖传言玩家"..GetName().."已于近日加入少林派！")
	TaskTip("B筺  gia nh藀 Thi誹 L﹎, c� th� b竔 s� h鋍 ngh�!")

	-- 清空其它门派任务的状态
	FN_SetTaskState(FN_WD, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	
end


-- 选择不的选项
function task_no()
	Say("Th� ch� c遪 vng v蕁 h錸g tr莕, b鎛 t� kh玭g th� thu nh薾! Xin Th� ch� v� 甶!",0);
end


function fix_sl()
FN_SetTaskState(FN_SL, 0);
Say("C� ch髏 v蕁  x秠 ra nh璶g  頲 gi秈 quy誸! Thi誹 hi謕 c� th� gia nh藀 m玭 ph竔 l筰.",0);
end;