--文件说明
--成都脚本
--created by lizhi
--2005-8-12 14:41

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua")

function task_one_00()
    local szTalk = {
        "T竔 h� thu lai phong c秐h d�, H祅h dng nh筺 kh� v� l璾 齾",
        "Th� hay l緈! Ph筸 ti猲 sinh v╪ chng xu蕋 ch髇g, h藆 sinh kh﹎ ph鬰.",
        "<sex> qu� khen! Kh玭g bi誸 <sex> t譵 Ph筸 m� c� chuy謓 g�?",
        "T筰 h� trong l骳 甶襲 tra Thanh Minh Thng H�  ph竧 hi謓 T� H祅g mn danh v薾 chuy觧 Hoa Th筩h Cng th鵦 ch蕋 v薾 chuy觧 m秐h S琻 H� X� T綾 v祇 cung. Цm ngi Lng s琻 b祔 m璾 cp Hoa Th筩h Cng v� S琻 H� X� T綾. S� vi謈 tr鋘g i D� T萿 nh� ta h醝 � ki課 Ph筸 ti猲 sinh.",
        "Chuy謓 n祔 kh玭g n gi秐! Hi謓 Ph筸 m� c� ch髏 chuy謓 mu鑞 nh� <sex> gi髉 !",
        "Gi髉 頲 ti襫 b鑙 l� vinh d� c馻 v穘 b鑙 y.",
        "Ph筸 m� c� nh� Л阯g K� gi髉 l祄 Lang C鑤 t鰑, kh玭g bi誸 xong ch璦? Phi襫 <sex> n  xem th�! V� mang ru v� y!",
        "Xin Ph筸 ti猲 sinh i tin vui c馻 ta!"
    };
    TalkEx("task_one_01", szTalk);
end;

function task_one_01()
    DelItem(2,0,49,1);
    GivePlayerAward("Level_10", "easy");    --奖励
	GivePlayerExp(SkeyCDFanzhongyan,"baifangfanzhongyan")	--拜访范仲淹
    SetTask(TASK_CD_ONE, 1);
    SetTask(TASK_CD_TWO, 101);
    Msg2Player("дn Л阯g M玭 t譵 Л阯g K� mang Lang C鑤 t鰑 v�!");
    TaskTip("дn Л阯g M玭 t譵 Л阯g K� mang Lang C鑤 t鰑 v�!");
end;

function task_one_01_00()
    local szTalk = {
        "<sex>, ta nghe n鉯 Lang C鑤 t鰑 c馻 Л阯g M玭 danh ch蕁 thi猲 h�, kh玭g bi誸 khi n祇 m韎 thng th鴆 頲."
    };
    TalkEx("", szTalk);
end;

function task_two_01()
    local szTalk = {
        "<sex> n c� chuy謓 g� kh玭g?",
        "Ph筸 ti猲 sinh b秓 ta n l蕐 Lang C鑤 t鰑.",
        "Do d筼 n祔 Л阯g ph� b薾 nhi襲 vi謈 qu猲 m蕋 chuy謓 Lang C鑤 t鰑, kh玭g bi誸 <sex> c� th� gi髉 ta t譵 {10 Th� Lang c鑤}, {10 Thanh Lang c鑤} kh玭g?",
        "Кn gi秐 th玦,  ta t譵 v�!"
    };
    TalkEx("task_two_01_01", szTalk);
end;

function task_two_01_01()
    SetTask(TASK_CD_TWO, 102);
    
    CreateTrigger(0, 513, KILL_CD_TL); --杀小土狼
    CreateTrigger(0, 514, KILL_CD_QL); --杀小青狼
    Msg2Player("Thu th藀 10 Th� Lang c鑤 v� 10 Thanh Lang c鑤");
    TaskTip("Thu th藀 10 Th� Lang c鑤 v� 10 Thanh Lang c鑤");
end;

function task_two_02()
    local szTalk = {
        "Nh璶g mu鑞 l祄 Lang C鑤 t鰑 c莕 {8 a T� Tinh Hoa}, {B竎h Nh藅 Ti詎} � g莕 Л阯g M玭 c� lo筰 hoa n祔. <sex> gi髉 ta nh�!"
    };
    local szNot = {
        "<sex> ch璦 t譵  {Th� lang c鑤} v� {Thanh lang c鑤} �?"
    };
    if GetItemCount(2,0,74) >= 10 and GetItemCount(2,0,75) >= 10 then
        TalkEx("task_two_02_01", szTalk);
    else
        TalkEx("task_two_02_02", szNot);
    end;
end;

function task_two_02_02()
    if GetTrigger(KILL_CD_TL) == 0 then
        CreateTrigger(0, 513, KILL_CD_TL); --杀小土狼
    end;
    if GetTrigger(KILL_CD_QL) == 0 then
        CreateTrigger(0, 514, KILL_CD_QL); --杀小青狼
    end;
end;

function task_two_02_01()

    GivePlayerAward("Level_14", "easy");    --奖励
	GivePlayerExp(SkeyCDFanzhongyan,"nenglishilian")	--能力试炼
    RemoveTrigger(GetTrigger(KILL_CD_TL));
    RemoveTrigger(GetTrigger(KILL_CD_QL));

    DelItem(2,0,74,10);
    DelItem(2,0,75,10);
    SetTask(TASK_CD_TWO, 103);
    CreateTrigger(0,515,KILL_CD_BRJ);   --杀百日箭
    
    Msg2Player("Thu th藀 8 a T� Tinh hoa");
    TaskTip("Thu th藀 8 a T� Tinh hoa");
end;

function task_two_03()
    local szSay = {
        "B竎h Nh藅 Ti詎 tuy l頸 h筰 nh璶g kh玭g nh l筰 <sex> u.",
        "Л琻g nhi猲! Ta  mang T� Tinh hoa v�./task_two_03_yes",
        "厖/task_two_03_no"
    };
    SelectSay(szSay);
end;

function task_two_03_no()
    if GetTrigger(KILL_CD_BRJ) == 0 then
        CreateTrigger(0,515,KILL_CD_BRJ);   --杀百日箭
    end;
end;

function task_two_03_yes()
    local szTalk = {
        "V� c玭g c馻 <sex> qu� nhi猲 cao cng. Lang C鑤 t鰑 y. Phi襫 <sex> mang cho Ph筸 ti猲 sinh."
    };
    local szNot = {
        "<sex> ch璦 t譵  {T� Tinh hoa} �?"
    };
    
    if GetItemCount(2,0,76) >= 8 then
        TalkEx("task_two_03_01", szTalk);
    else
        TalkEx("task_two_03_no", szNot);
    end;
end;

function task_two_03_01()
    RemoveTrigger(GetTrigger(KILL_CD_BRJ));
    DelItem(2,0,76,8);
    AddItem(2,0,77,1);  --狼骨酒
    SetTask(TASK_CD_TWO, 104);
    SetTask(TASK_CD_THREE, 1);
    Msg2Player("Mang Lang C鑤 t鰑 v� cho Ph筸 Tr鋘g Y猰");
    TaskTip("Mang Lang C鑤 t鰑 v� cho Ph筸 Tr鋘g Y猰");
end;

function task_three_01()
    local szTalk = {
        "<sex> v� r錳 �? C� mang Lang C鑤 t鰑 kh玭g?",
        "Lang C鑤 t鰑 y, ti襫 b鑙 xem ng kh玭g?",
        "Ru ngon! Ru ngon! <sex> gi髉 Ph筸 m� m閠 l莕 n鱝 頲 kh玭g? Th竔 th� Th祅h Й mu鑞 t譵 Ph筸 m�, phi襫 <sex> n  m閠 chuy課."
    };
    TalkEx("task_three_00_01", szTalk);
end;

function task_three_00_01()
    GivePlayerAward("Level_14", "hard", "head", "Level_14");    --奖励
	GivePlayerExp(SkeyCDFanzhongyan,"zhengyishilian1")	--正义试炼1
    DelItem(2,0,77,1);
    SetTask(TASK_CD_THREE, 2);
    SetTask(TASK_CD_ONE, 2);   --消掉拜访范仲淹任务面板
    
    Msg2Player("Th╩ th竔 th� Th祅h Й");
    TaskTip("Th╩ th竔 th� Th祅h Й");
end;

function task_three_02()
    local szTalk = {
        "Th竔 th� t譵 ta kh玭g bi誸 c� chuy謓 g� kh玭g?",
        "в ta� h� n  xem sao"
    };
    TalkEx("", szTalk);
end;

function task_three_02_01()
    local szTalk = {
        "L� ai v藋?",
        "T筰 h� ph鬾g m謓h Ph筸 ti猲 sinh n t譵 th竔 th�, kh玭g bi誸 ngi 產ng phi襫 mu閚 chuy謓 g�?",
        "Haha! V� h藆 b鑙 n祔 c� mu鑞 ra s鴆 gi髉 tri襲 nh kh玭g?",
        "Hi謓 t nc 產ng lo筺 trong gi芻 ngo礽, ngi h鋍 v� nh� t筰 h� y sao c� th� ng l祄 ng�.",
        "Ch� c莕 <sex> gi髉 ta l祄 m閠 chuy謓, b鎛 quan b秓 m ti襫  c馻 ngi kh玭g t錳 u.",
        "Kh玭g bi誸 i nh﹏ mu鑞 n鉯 chuy謓 g�?",
        "L穙 gi� Ph筸 Tr鋘g Y猰 kh玭g n� m苩 b鎛 quan, m� c遪 l╪g m� n鱝, ta mu鑞 <sex> h駓 ho筰 danh ti課g c馻 h緉.",
        "Chuy謓 n祔 t筰 h� kh玭g gi髉 頲.",
        "<sex> xin ch薽 bc! V� v韎 ta, c玭g danh b鎛g l閏, vinh hoa ph� qu� c� i hng kh玭g h誸.",
        "T筰 h�  quy誸, xin c竜 t�!"
    };
    TalkEx("task_three_02_02", szTalk);
end;

function task_three_02_02()
    SetTask(TASK_CD_THREE, 3);
end;

function task_three_03()
    local szTalk = {
        "<sex> v� r錳 �? Kh玭g bi誸 th竔 th� t譵 ta c� chuy謓 g�?",
        "Th竔 th� mu鑞 mua chu閏 ta h穖 h筰 Ph筸 ti猲 sinh, tuy t筰 h� khc t� nh璶g thi誸 ngh� 玭g ta s� kh玭g b� qua chuy謓 n祔 u.",
        "<sex> t輓h kh� th糿g th緉, n誹 玭g ta c� c竎h th� ta r阨 kh醝 y l﹗ r錳. <sex> ng qu� lo l緉g!",
        "Kh玭g l� Ph筸 ti猲 sinh bi誸 頲 �  c馻 玭g ta?",
        "B秐  S琻 H� X� T綾 li猲 qua t韎 v薾 m謓h qu鑓 gia. Ph筸 m� c莕 ph秈 ki觤 tra n╪g l鵦 <sex>, 甶 t譵 Lang C鑤 t鰑  th� l遪g ki猲 nh蒼 <sex>, t譵 th竔 th� mu鑞 hi觰 ph萴 ch蕋 c馻 <sex>. <sex> qu� nhi猲 ngi l� ngi ngay th糿g kh玭g m祅g danh l頸, th藅 ng kh﹎ ph鬰!",
        "Kh玭g d竚! Kh玭g d竚! V藋 bc ti誴 theo s� l祄 g�?",
        "C竔 Bang tai m総 nhi襲, l穙 c� vi誸 b鴆 th� nh�  t� C竔 Bang d� la tin t鴆! Xin gi髉 ta mang t輓 v藅 n祔 n C竔 Bang t譵 H錸g Th蕋."
    };
    TalkEx("task_three_03_02", szTalk);
end;

function task_three_03_02()

    GivePlayerAward("Level_16", "hell");    --奖励
    GivePlayerExp(SkeyCDFanzhongyan,"zhengyishilian2")	--正义试炼2
    AddItem(2,0,78,1);
    --RemoveTrigger(GetTrigger(153));
    SetTask(TASK_CD_FOUR, 1);
    SetTask(TASK_CD_THREE, 4);
    Msg2Player("дn C竔 Bang d� la tin t鴆");
    TaskTip("дn C竔 Bang d� la tin t鴆");
end;

function task_three_03_01()
    local szTalk = {
        "<sex> i � n gi髉 b鎛 quan r錳 �?",
        "Ch� ngang qua th玦! C竜 t�!"
    };
    TalkEx("", szTalk);
end;

function task_three_04()
    local szTalk = {
        "C竔 Bang tai m総 nhi襲, kh玭g ch鮪g  c� tin t鴆.",
        "T筰 h� n C竔 Bang ngay!"
    };
    TalkEx("", szTalk);
end;

function task_four_01()

    GivePlayerAward("Level_18", "easy");    --奖励
	GivePlayerExp(SkeyCDFanzhongyan,"gaibangzhixing1")	--丐帮之行1
    DelItem(2,0,78,1);
    SetTask(TASK_CD_FOUR, 2);
    Msg2Player("T譵  t� C竔 Bang");
    TaskTip("T譵  t� C竔 Bang");
end;

function task_four_02()
    SetTask(TASK_CD_FOUR, 3);
    CreateTrigger(0, 516, KILL_CD_XT); --杀小偷
    CreateTrigger(0, 517, KILL_CD_FZ); --少飞贼
    Msg2Player("Gi髉  t� C竔 Bang t譵 h祅h l�");
    TaskTip("Gi髉  t� C竔 Bang t譵 h祅h l�");
end;

function task_four_03()
    if GetTrigger(KILL_CD_XT) == 0 then
        CreateTrigger(0, 516, KILL_CD_XT); --杀小偷
    end;
    if GetTrigger(KILL_CD_FZ) == 0 then
        CreateTrigger(0, 517, KILL_CD_FZ); --杀飞贼
    end;
end;

function task_four_04()

    GivePlayerAward("Level_18", "easy");    --奖励
	GivePlayerExp(SkeyCDFanzhongyan,"gaibangzhixing2")	--丐帮之行2
    DelItem(2,0,79,1);
    SetTask(TASK_CD_FOUR, 5);
end;

function task_four_05()
    local szBack1 = {
        "Hi謓 Th祅h Й 產ng n竜 lo筺. Phi襫 <sex> mang th� n祔 v� cho Ph筸 ti猲 sinh. C� c莕 ta a <sex> v� Th祅h Й kh玭g?",
        "Ta  s絥 s祅g. Phi襫 H錸g i ca!/task_four_yes",
        "Ta c莕 chu萵 b�, s� quay l筰 sau!/task_exit"
    };
    SelectSay(szBack1);
end;

function task_four_yes()
    --RemoveTrigger(GetTrigger(154));
    
    SetTask(TASK_CD_FOUR, 7);
    
    --传送到成都
	SetFightState(0);
	i=random(1,3);
--	if i==1 then
--		NewWorld(300, 1896 ,3655)
	if i==2 then
		NewWorld(300, 1677 ,3671);
	elseif i==3 then
		NewWorld(300, 1681 ,3464);
	else 
		NewWorld(300, 1911 ,3442);
	end;
end;

function task_four_0607()
    local szTalk = {
        "<sex> v蕋 v� qu�! C� tin t鴆 g� t� C竔 Bang kh玭g?",
        "C� th� c馻 H錸g Th蕋 i ca, m阨 ti猲 sinh xem qua.",
        "Th� ra c遪 b� m藅 b猲 trong.",
        "Ti猲 sinh sao m chi猽 v藋?",
        "Ngi bi誸 T﹜ H� Nh蕋 Ph萴 阯g kh玭g?",
        "T筰 h� m韎 bc ch﹏ v祇 ch鑞 giang h�, xin ti猲 sinh ch� gi竜.",
        "с l� m閠 t� ch鴆 gi竛 甶謕 c馻 nc T﹜ H�, h� ph� tr竎h ph輆 t﹜ ph� ho筰 v� ng╪ c秐 ngi kh竎. T﹜ H� m藅 b竜 cho Lng S琻 bi誸 ﹎ m璾 Hoa Th筩h Cng b猲 trong ch鴄 b秐  S琻 H� X� T綾.",
        "N鉯 nh� v藋 gi鱝 ch髇g c� m鑙 quan h� m藅 thi誸?",
        "Lng S琻 tuy l� S琻 t芻 nh璶g th� l躰h T鑞g Giang ch輓h tr鵦, c� l遪g y猽 nc kh玭g th� n祇 c蕌 k誸 v韎 m ngi T﹜ H�. S� vi謈 h� tr鋘g! Xin mang t輓 v藅 n祔 n Giang T﹏ Th玭 t譵 Gia C竧 K�.",
        "T筰 h� l藀 t鴆 l猲 阯g ngay!"
    };
    TalkEx("task_four_0607_01", szTalk);
end;

function task_four_0607_01()
    GivePlayerAward("Level_18", "hell");    --奖励
	GivePlayerExp(SkeyCDFanzhongyan,"gaibangzhixing3")	--丐帮之行3
    SetTask(TASK_CD_FOUR, 8);
    SetTask(TASK_JJC, 1);
    AddItem(2,0,78,1);
    DelItem(2,0,80,1);
    Msg2Player("дn Giang T﹏ Th玭 t譵 Gia C竧 K�");
    TaskTip("дn Giang T﹏ Th玭 t譵 Gia C竧 K�");
end;

function task_four_08()
    local szTalk = {
        "Giang h� s緋 c� cu閏 m m竨 n鱝."
    };
    TalkEx("", szTalk);
end;

function task_exit()

end;
