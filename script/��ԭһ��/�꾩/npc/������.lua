
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 新手问答功能实体处理文件_路人百晓生
-- Edited by peres
-- 2005/04/14 PM 13:59

-- 看见的  熄灭了
-- 消失的  记住了
-- 我站在  海脚天涯
-- 听见    土壤萌芽
-- 等待    昙花再开
-- 把芬芳  留给年华
-- 彼岸    没有灯塔
-- 我依然  张望着
-- 天黑    刷白了头发
-- 紧握着  我火把
-- 他来    我对自己说
-- 我不害怕
-- 我很爱他

-- lyrics : 彼岸花

-- ======================================================

Include("\\script\\task\\question\\question_head.lua");
Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\world\\lizhi_长歌门\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\lv40\\task_main.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");

-- 入口处理函数
function main()

local Talk_Main_Sign = {};--构建任务标记;1为长歌门任务；2为西南任务；3为西北任务
local SelectList = {};
local nStep = GetTask(TASK_TWO);
local strSay = {"Ta ch輓h l� k� t骳 tr� 產 m璾 B竎h Hi觰 Sinh! Ngi t譵 ta c� g� kh玭g?"}

	SelectList = {
	
	[1] = {
					{
				 		"V穘 b鑙 c� nghe chuy謓 c馻 Trng Ca M玭, mu鑞 頲 ti襫 b鑙 ch� gi竜./task_002_00"
				 	},
				 	{
				 		"Mu鑞 th豱h gi竜 chuy謓 v� v� l﹎ truy襫 thuy誸!/wl_story",
--				 		"我想和您比试一下有关武林的学识。/ConfirmQuestion"
				 	}
				},
	[2] = {
					{
						"V穘 b鑙 c� nghe chuy謓 c馻 T﹜ nam Чi L�, mu鑞 頲 ti襫 b鑙 ch� gi竜./task_100_00",
					},
					
					{
						"V穘 b鑙 c� nghe chuy謓 c馻 T﹜ nam Чi L�, mu鑞 頲 ti襫 b鑙 ch� gi竜./task_100_01"
					},
				},
	[3] = {
					{
						"V穘 b鑙 頲 Kh蕌 Chu萵 駓 th竎, mu鑞 頲 ti襫 b鑙 ch� gi竜 v� ng t躰h m蕐 ng祔 nay c馻 Nh蕋 ph萴 阯g � ph輆 t﹜ bi猲 gi韎 T﹜ H�./task_001_02_0",
					},
					{
						"V穘 b鑙 頲 Kh蕌 Chu萵 駓 th竎, mu鑞 頲 ti襫 b鑙 ch� gi竜 v� ng t躰h m蕐 ng祔 nay c馻 Nh蕋 ph萴 阯g � ph輆 t﹜ bi猲 gi韎 T﹜ H�./task_001_02_1"
					},
					{
						"V穘 b鑙 mu鑞 頲 ti襫 b鑙 ch� gi竜 l祄 c竎h n祇  b総 S竧 Th� Oa Oa/task_005_03_0"
					},
					{
						"V穘 b鑙 mu鑞 頲 ti襫 b鑙 ch� gi竜 l祄 c竎h n祇  b総 S竧 Th� Oa Oa/task_005_03_1"
					},
				}
		}

	--构建任务对话处理
	
	--长歌门任务处理
	
	--task_002_00
	if nStep == 1 then
		Talk_Main_Sign[1] = 1;
	--szSay
	elseif nStep == 2 then
		Talk_Main_Sign[1] = 2;
	else
		Talk_Main_Sign[1] = 0;
	end
	
	--大理任务处理
	--task_100_00
	if GetTask(TASK_DL_LV35_ID) == 3 and GetLevel() >= 35 then
		Talk_Main_Sign[2] = 1;
	--task_100_01
	elseif GetTask(TASK_DL_LV40_ID) == 1 then
		Talk_Main_Sign[2] = 2;
	else
		Talk_Main_Sign[2] = 0;
	end
	
	--西北任务处理
	if GetTask(TASK_XB_ID) == 1 then
		Talk_Main_Sign[3] = 1;
	elseif GetTask(TASK_XB_ID) == 2 then
		Talk_Main_Sign[3] = 2;
	elseif GetTask(TASK_XB_ID) == 18 then
		Talk_Main_Sign[3] = 3;
	elseif GetTask(TASK_XB_ID) == 19 then
		Talk_Main_Sign[3] = 4;
	else
		Talk_Main_Sign[3] = 0;
	end
	
	for i=1,getn(Talk_Main_Sign) do
		if Talk_Main_Sign[i] ~= 0 then
			for t=1,getn(SelectList[i][Talk_Main_Sign[i]]) do
				tinsert(strSay,SelectList[i][Talk_Main_Sign[i]][t]); 
			end
		end
	end
	
	tinsert(strSay,"C� g� u/MainExit");
	
	if Talk_Main_Sign[1] ~= 0 or Talk_Main_Sign[2] ~= 0 or Talk_Main_Sign[3] ~= 0 then
		SelectSay(strSay);
		return
	end
	
--长歌门任务的处理
    
--    local nStep = 0;
--    local szTalk = {
--        "百晓生：你又回来了？这次是什么风把你吹过来的？",  
--        "玩家：晚辈碰到一些有关{长歌门}的事情，特来向您讨教。",
--        "百晓生：连你也知道长歌门的事情了？赵延年这人还真是多嘴。如此看来你也与长歌门有缘，也罢，我便指点你一二。不过我这些年在江湖中辗转颠簸，有不少珍藏的书籍已经失落在各地了，有些细节一时说不清楚，你可不要抱怨啊。"
--    };
--    local szSay = {
--        "百晓生：我就是人称“足智多谋”的百晓生，你找我有什么事情么？",
--        "我想向您讨教有关武林传说的故事。/wl_story",
--        "我想和您比试一下有关武林的学识。/ConfirmQuestion"
--    };
--
--    nStep = GetTask(TASK_TWO);
--    
--    if nStep == 1 then
--			--西南区40级任务入口(条件:1完成武陵山任务;2等级大于35级)
--    	if GetTask(TASK_DL_LV35_ID) == 3 and GetLevel() >= 35 then
--				local strSelect = {
--        	"百晓生：你又回来了？这次是什么风把你吹过来的？",
--        	"晚辈碰到一些有关{长歌门}的事情，特来向您讨教。/task_002_00",
--        	"晚辈碰到一些有关{西南大理}的事情，特来向您讨教。/task_100_00"
--    		};
--    		SelectSay(strSelect);
--    		return
--    	end
--    	if GetTask(TASK_DL_LV40_ID) == 1 then
--    		local strSelect = {
--        	"百晓生：你又回来了？这次是什么风把你吹过来的？",
--        	"晚辈碰到一些有关{长歌门}的事情，特来向您讨教。/task_002_00",
--        	"晚辈碰到一些有关{西南大理}的事情，特来向您讨教。/task_100_01"
--    		};
--    		SelectSay(strSelect);
--    		return
--    	end
--      TalkEx("task_002_00", szTalk);
--      return
--    elseif nStep == 2 then
--    	--西南区40级任务入口(条件:1完成武陵山任务;2等级大于35级)
--    	if GetTask(TASK_DL_LV35_ID) == 3 and GetLevel() >= 35 then
--				szSay = {
--        	"百晓生：我就是人称“足智多谋”的百晓生，你找我有什么事情么？",
--        	"我想向您讨教有关武林传说的故事。/wl_story",
--        	"我想和您比试一下有关武林的学识。/ConfirmQuestion",
--        	"晚辈碰到一些有关{西南大理}的事情，特来向您讨教。/task_100_00"
--   			 	};
--   			SelectSay(szSay);
--      	return
--   		end;
--   		if GetTask(TASK_DL_LV40_ID) == 1 then
--    		szSay = {
--        	"百晓生：我就是人称“足智多谋”的百晓生，你找我有什么事情么？",
--        	"我想向您讨教有关武林传说的故事。/wl_story",
--        	"我想和您比试一下有关武林的学识。/ConfirmQuestion",
--        	"晚辈碰到一些有关{西南大理}的事情，特来向您讨教。/task_100_01"
--    			};
--    		SelectSay(szSay);
--      	return
--    	end
--    	SelectSay(szSay);
--      return
--    end
--    
--    if GetTask(TASK_DL_LV35_ID) == 3 and GetLevel() >= 35 then
--    	strTalk = {
--      	"百晓生：我就是人称“足智多谋”的百晓生，你找我有什么事情么？",
--      	"玩家:晚辈碰到一些有关{西南大理}的事情，特来向您讨教。"
--   		 	};
--    	TalkEx("task_100_00",strTalk);
--    	return
--    end
--    	
--    if GetTask(TASK_DL_LV40_ID) == 1 then
--    	strTalk = {
--      	"百晓生：你去找{赵延年}问问吧，他就在{汴京}。"
--   		 	};
--    	TalkEx("task_100_01",strTalk);
--    	return
--    end
    
-- 教育任务的处理
local nState = TE_GetTeachState();

if (nState==18) then
	task_018_00();
	return
end;

	Say("Th鵦 l鵦 c馻 T祅g Ki誱 s琻 trang sao gi蕌 頲 ta!",0);

end;

-- 从表格文件中读取每个任务的权重形成一个数组
CreateRateArry();

-- 说明TASK_TWO的任务状态，20000表示step2，后面的4位分别代表是否完成了4个想了解的内容
-- 完成一个了解的内容，后面4位中的对应位就置为1

function task_002_00()
    local szSay = {
        "Ta ch輓h l� k� t骳 tr� 產 m璾 B竎h Hi觰 Sinh! Ngi t譵 ta c� g� kh玭g?",
        "T筰 h� mu鑞 th豱h gi竜 ki課 th鴆 v� l﹎!/wl_story",
--        "我想和您比试一下有关武林的学识。/ConfirmQuestion"
    };
    SetTask(TASK_TWO, 2);
    SelectSay(szSay);
end;

--加入西南任务后的改动
function task_002_10()
    local szSay = {
        "Ngi c騨g bi誸 chuy謓 Trng Ca M玭 sao? G� Tri謚 Di猲 Ni猲 qu� th藅 nhi襲 chuy謓 nh璶g xem nh� ngi c� duy猲 v韎 chuy謓 Trng Ca M玭. M蕐 n╩ nay ta l╪ l閚 ch鑞 giang h�, bi誸 頲 nhi襲 th� t辌h qu� hi誱 th蕋 l筩 � kh緋 n琲 nh璶g ta kh玭g bi誸 ch輓h x竎 � n琲 n祇. Xin ng o竛 h薾 ta!",
        "T筰 h� mu鑞 th豱h gi竜 ki課 th鴆 v� l﹎!/wl_story",
--        "我想和您比试一下有关武林的学识。/ConfirmQuestion"
    };
    SetTask(TASK_TWO, 2);
    SelectSay(szSay);
end;

function wl_story()
    local szSay = {
        "Th阨 v� l﹎ lo筺 th�, anh h飊g xu蕋 hi謓! Ngi mu鑞 hi觰 chuy謓 chi?",
        "Mu鑞 bi誸 v� lai l辌h Trng Ca m玭./say1",
        "Mu鑞 bi誸 v� k誸 c蕌 t� ch鴆 c馻 Trng Ca m玭./say2",
        "Mu鑞 hi觰 chuy謓 c馻 Thi猲  gi竜 Li猽 Qu鑓./say3",
        "Mu鑞 hi觰 chuy謓 c馻 Xi H醓 gi竜 Чi L�./say4",
        "Mu鑞 hi觰 chuy謓 T﹜ H� Nh蕋 Ph萴 Л阯g./say5"
    };
    SelectSay(szSay);
end;

function say1()
    local szTalk = {
        "Sau khi Th竔 T� i trc b譶h nh giang s琻 B玦 T鰑 Th輈h Binh Quy襫, c竎 tng l躰h Th筩h Th� T輓, Cao Ho礽 c, Trng L謓h Phong, Tri謚 Ng筺 Huy u c竜 l穙 h錳 hng. Tri謚 Ng筺 Huy i nh﹏ kh玭g cam c秐h c� n,  li猲 l筩 v礽 b籲g h鱱 giang h�, thng c飊g nhau ng﹎ th� i xng ho芻 t� th� v� c玭g.",
        "Sau n祔 c竎 b籲g h鱱 c飊g k誸 ngh躠, th祅h l藀 n猲 m閠 m玭 ph竔. Khi 蕐, ngi trong ph竔 h莡 h誸 u l� c竎 s� phu nho nh�, l蕐 s竛g t竎 thi ca l祄 th� vui n猲 m鋓 ngi u t� x璶g l� Trng Ca M玭. Tuy Trng Ca M玭 th﹏ t筰 giang h� nh璶g trc sau r蕋 quan t﹎ Qu鑓 k� d﹏ sinh, h祅h hi謕 trng ngh躠 kh緋 n琲 theo t玭 ch� lu玭 t筼 ph骳 cho thi猲 h� b� t竛h.",
        "Ra l� v藋!  t� ti襫 b鑙 ch� gi竜!"
    };
    TalkEx("", szTalk);
end;

function say2()
    local szNotFinished = {
        "Trng Ca M玭 h莡 h誸 l� nh鱪g v╪ nh﹏ m芻 kh竎h n鎖 danh. Ch� ng ti誧 l莕 trc khi ta � Lng S琻, quy觧 s竎h ghi ch衟 v� c﹗ chuy謓 c馻 h�  b� th蕋 l筩 g莕 D� Tr� L﹎. H穣 gi髉 ta t譵 Trng M玭 s竎h, ta s� k� th猰 cho nghe!",
	    "Trng M玭 S竎h g錷 9 trang. Thu th藀 , ta s� n鉯 r� cho ngi bi誸!"
    };
    local szFinished = {
        "Trng Ca M玭 h莡 h誸 l� nh鱪g v╪ nh﹏ m芻 kh竎h dung r駃 kh緋 n琲, n鎖 ti課g tr猲 giang h� v� Ng� hi謕 Nh﹏ Ngh躠 L� Tr� T輓 v� T� h鱱 C莔 K� Thi H鋋.",
        "T輓h c竎h ki猲 cng Chuy猲 l祄 vi謈 ngh躠 nh﹏. H祅 Th� M筺h, lu玭 ti猲 phong ra tay h祅h hi謕 trng ngh躠. X� th﹏ v� ngh躠. C秐h V﹏ Phi lu玭 coi tr鋘g ngh躠 kh�, v韎 b籲g h鱱 lu玭 v鱪g d� s綾 son. L� Thng v穘g lai. T﹏ Thanh Nhi詍 l� n閕 gia quy襫 cao nh﹏, mn l鵦 nh l鵦 l� tuy謙 k� n鎖 danh c馻 ngi n祔.",
        "T骳 tr� 產 m璾, t輓h t譶h 甶襪 m, ngo筰 tr� ki課 th鴆 r閚g c騨g kh玭g c� g� n鎖 b藅. H� b髏 th祅h v╪. Lng Thng Ng鋍 l� s� trng, c玭g phu xu蕋 th莕 nh藀 h鉧, c� th� s竛h ngang v韎 C秐h V﹏ Phi, nh璶g ti誧 thay � l筰 l� m閠 ngh躠 o cp c馻 ngi gi祏 chia cho ngi ngh蘯.",
        "T� h鱱 C莔 K� Thi H鋋.  Dng H鋋 l� b薱 th莥 v� m祏 s綾. H� H莡 C莔 x璶g l�  nh蕋 danh c莔 � Dng Ch﹗. Gia C竧 K�  nh蕋 danh c� 產ng tr� t筰 Nam Th祅h Й ph�. C玭g T玭 Th� � Tng Dng gi醝 c� v� th� ph竝 l蒼 nh b筩 .",
        "Ra l� v藋!  t� ti襫 b鑙 ch� gi竜!"
    }
    local nStep = GetTask(TASK_TWO_ONE);
    if nStep == 0 or nStep == 1 then
        -- 长歌门人物谱
        if GetItemCount(2,0,51) >= 9 then
            DelItem(2,0,51,9);
            SetTask(TASK_TWO_ONE, 2);
            GivePlayerAward("Level_20", "hard");
            TalkEx("", szFinished);
            RemoveTrigger(GetTrigger(92));
            if GetTask(TASK_TWO_TWO) == 2 and GetTask(TASK_TWO_THREE) == 2 and GetTask(TASK_TWO_FOUR) == 2 then
                GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
            end;
        else
            TalkEx("", szNotFinished);
            SetTask(TASK_TWO_ONE, 1);
            Msg2Player("дn D� Tr� L﹎ t譵 Trng M玭 S竎h th蕋 l筩.");
            TaskTip("дn D� Tr� L﹎ t譵 Trng M玭 S竎h th蕋 l筩.");
            CreateTrigger(0, 502, 92);  --屠杀野猪林
        end;
    elseif nStep == 2 then
        TalkEx("", szFinished);
    end;
end;

function say3()
    local szNotFinished = {
	    "Thi猲  gi竜 ngu錸 g鑓 � Li猽 Cng. Ta  t鮪g l猲 phng B綾 d� la t譶h h譶h c馻 ch髇g v� ghi ch衟 l筰 Thi猲  gi竜 t筽 th�. N祇 ng� tr猲 阯g quay v� Trung Nguy猲 b� ngi c馻 Linh B秓 s琻 cp m蕋. H穣 thay ta n  l蕐 v�, ta s� k� r� cho ngi chuy謓 v� Thi猲  gi竜!",
	    "Thi猲  gi竜 t筽 th� g錷 9 trang. Thu th藀 , ta s� k� r� cho ngi!"
    };
    local szFinished = {
    	"Thi猲  gi竜 c� ngu錸 g鑓 t� m閠 t玭 gi竜 th莕 b� � Li猽 Cng, gi竜 ngh躠 l� tin tng v祇 v筺 v藅 u c� linh h錸, thng d飊g nghi th鴆 ca v�  t� b竔 tr阨 t. Thi猲  gi竜 nhi襲 v� l﹎ cao th� n猲 m蕐 n╩ nay c� th� l鵦 ng祔 c祅g m筺h � Li猽 Qu鑓, nhi襲 qu� t閏 � Li猽 Qu鑓 l� t輓  c馻 Thi猲  gi竜.",
    	"Th鑞g so竔 t鑙 cao c馻 Thi猲  gi竜, di c� T� H鱱 h� ph竝 gi髉 gi竜 ch� thi h祅h quy誸 s竎h. Trong gi竜 c� tam 阯g Phong- H醓- L玦 m tr竎h c竎 vi謈 d� th竚 t譶h b竜, nghi猲 c鴘 v� ngh� v� thng ph箃 c竎 gi竜 . Nh藅 Nguy謙 Tinh Ch蕁 t� n d飊g t� l� tr阨 t v筺 v藅. Ngi tr鵦 ti誴 th鑞g l躰h m蕐 v筺 bang ch髇g l� H錸g H綾 Lam Ho祅g B筩h Ng� K� Ch�.",
        "Ra l� v藋!  t� ti襫 b鑙 ch� gi竜!"
    }
    local nStep = GetTask(TASK_TWO_TWO);
    if nStep == 0 or nStep == 1 then
        --天阴教杂书
        if GetItemCount(2,0,52) >= 9 then
            DelItem(2,0,52,9);
            SetTask(TASK_TWO_TWO, 2);
            GivePlayerAward("Level_20", "hard");
            TalkEx("", szFinished);
            RemoveTrigger(GetTrigger(93));
            if GetTask(TASK_TWO_ONE) == 2 and GetTask(TASK_TWO_THREE) == 2 and GetTask(TASK_TWO_FOUR) == 2 then
                GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
            end;
        else
            TalkEx("", szNotFinished);
            SetTask(TASK_TWO_TWO, 1);
            Msg2Player("дn Linh B秓 s琻 畂箃 v� Thi猲  gi竜 t筽 th�!");
            TaskTip("дn Linh B秓 s琻 畂箃 v� Thi猲  gi竜 t筽 th�!");
            CreateTrigger(0, 503, 93);  --屠杀灵宝山
        end;
    elseif nStep == 2 then
        TalkEx("", szFinished);
    end;
end;

function say4()
    local szNotFinished = {
    	"Xi H醓 gi竜 kh雐 ngu錸 t� ph輆 Nam Чi L�, c� t藀 t鬰 l� thng. Gi竜 ngh躠 Xi H醓 gi竜 c騨g r蕋 k� l�. Ta  n � M玭g B� � Nam Cng d� la tin t鴆 c馻 Xi H醓 gi竜, ghi ch衟 trong Xi H醓 gi竜 d﹏ t鬰 nh璶g ngi � M玭g B� s� ti誸 l� ra ngo礽 s� g﹜ b蕋 l頸 cho h�, kh玭g cho ph衟 ta mang s竎h ra kh醝 Nam Cng. H穣 gi髉 ta l蕐 n� v�, ta s� n鉯 r� chuy謓 Xi H醓 gi竜 cho ngi bi誸!",
    	"Xi H醓 gi竜 d﹏ t鬰 g錷 9 trang. Thu th藀 , ta s� n鉯 r� cho ngi bi誸!"
    };
    local szFinished = {
    	"Xi H醓 gi竜 kh雐 ngu錸 t� ph輆 Nam Чi L�, c� t藀 t鬰 l� thng. Gi竜 ngh躠 Xi H醓 gi竜 c騨g r蕋 k� l�. Xi V璾 l� v� th莕 頲 t玭 k輓h nh蕋 c馻 Xi H醓 gi竜. V� th�, Xi H醓 gi竜 c� th﹎ th� s﹗ s綾 v韎 con ch竨 Hu鷑h д ta.",
    	"Xi H醓 gi竜 gi竜 ch� t� x璶g l� Xi V璾 ch� t�, l� l穘h t� tinh th莕 tuy謙 i c馻 Xi H醓 gi竜. Di gi竜 ch� c� Ch骳 Dung t� s� v� C閚g C玭g t� s� m tr竎h t� b竔 H醓 Th莕 v� Th駓 Th莕, c莡 Th駓 H醓 tng t�. Ngo礽 ra c遪 c� Ng� H祅h ph竝 s�, n緈 v� ng� h祅h tng sinh tng kh綾, v筺 v藅 頲 sinh s玦 n秠 n�. Hi謓 � Чi L� c� nhi襲 ho箃 ng c馻 Xi H醓 gi竜 gi竜 , dng nh� ng莔 l藅  ngai v� Ti襫 Vng T� Чi L�.",
        "Ra l� v藋!  t� ti襫 b鑙 ch� gi竜!"
    };
    local nStep = GetTask(TASK_TWO_THREE);
    if nStep == 0 or nStep == 1 then
        --蚩火教民俗
        if GetItemCount(2,0,53) >= 9 then
            DelItem(2,0,53,9);
            SetTask(TASK_TWO_THREE, 2);
            GivePlayerAward("Level_20", "hard");
            TalkEx("", szFinished);
            RemoveTrigger(GetTrigger(94));
            if GetTask(TASK_TWO_ONE) == 2 and GetTask(TASK_TWO_TWO) == 2 and GetTask(TASK_TWO_FOUR) == 2 then
                GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
            end;
        else
            TalkEx("", szNotFinished);
            SetTask(TASK_TWO_THREE, 1);
            Msg2Player("дn � M玭g B� 畂箃 v� s竎h Xi H醓 gi竜 d﹏ t鬰!");
            TaskTip("дn � M玭g B� 畂箃 v� s竎h Xi H醓 gi竜 d﹏ t鬰!");
            CreateTrigger(0, 504, 94);  --屠杀乌盟部
        end;
    elseif nStep == 2 then
        TalkEx("", szFinished);
    end;
end;

function say5()
    local szNotFinished = {
	    "Nh蕋 Ph萴 Л阯g l� t� ch鴆 th莕 b� � T﹜ H�. Trong m玭 ph竔 c� nhi襲 cao th�. Khi ta tr� t筰 M� Tuy誸 s琻 trang t鮪g c飊g trang ch� b祅 v� chuy謓 c馻 Nh蕋 Ph萴 Л阯g v�  ghi ch衟 l筰 trong Nh蕋 Ph萴 Л阯g b� s�. N祇 ng� M� Tuy誸 s琻 trang c蕌 k誸 v韎 ngi T﹜ H�, thu gi� th� t辌h c馻 ta trong s琻 trang. H穣 gi髉 ta l蕐 th� t辌h v�, ta s� k� r� chuy謓 Nh蕋 Ph萴 Л阯g cho ngi bi誸!",
	    "Nh蕋 Ph萴 Л阯g b� s� g錷 9 trang. Thu th藀 , ta s� n鉯 r� cho ngi nghe!"
    };
    local szFinished = {
        "Nh蕋 Ph萴 Л阯g do T﹜ h� chinh Йng Чi tng qu﹏ X輈h Li猲 Thi誸 Th� s竛g l藀. в t╪g cng qu﹏ l鵦 cho T﹜ H�, X輈h Li猲 Thi誸 Th�  chi猽 m� nhi襲 v� l﹎ d� s� gia nh藀 Nh蕋 Ph萴 Л阯g, kh玭g ph﹏ bi謙 xu蕋 th﹏ ch� xem v� ngh� m筺h y誹, n猲  thu ph鬰 頲 l遪g ngi. Nh璶g c騨g v� th�, Nh蕋 Ph萴 Л阯g  thu nh薾 nhi襲 nh﹏ s� v� l﹎ v� ngh� cao cng nh璶g nh﹏ ph萴 b蕋 h秓. T� , v� l﹎ ch輓h o lu玭 xem thng Nh蕋 Ph萴 Л阯g!",
        "X輈h Li猲 Thi誸 Th� l� 阯g ch� c馻 Nh蕋 Ph萴 Л阯g. Th祅h vi猲 h莡 h誸 l� qu﹏ i c馻 T﹜ H�. Nh蕋 Ph萴 Л阯g hi謓 c� 4 v� 頲 x璶g l� T� Чi Thi猲 Vng, v� c玭g cao cng nh璶g ra tay 竎 c. Ngo礽 ra c遪 c� Th藀 Чi Kim Cang, m鏸 ngi th鑞g so竔 m閠 i qu﹏, g﹜ uy hi誴 nhi襲 cho bi猲 ph遪g c馻 Чi T鑞g. B籲g h鱱 h祅h hi謕 giang h�, g苝 b鋘 ngi n祔 nh蕋 m鵦 ph秈 c萵 th薾!",
        "Ra l� v藋!  t� ti襫 b鑙 ch� gi竜!"
    };
    local nStep = GetTask(TASK_TWO_FOUR);
    if nStep == 0 or nStep == 1 then
        --一品堂逸事
        if GetItemCount(2,0,54) >= 9 then
            DelItem(2,0,54,9);
            SetTask(TASK_TWO_FOUR, 2);
            GivePlayerAward("Level_20", "hard");
            TalkEx("", szFinished);
            RemoveTrigger(GetTrigger(95));
            if GetTask(TASK_TWO_ONE) == 2 and GetTask(TASK_TWO_TWO) == 2 and GetTask(TASK_TWO_THREE) == 2 then
                GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
            end;
        else
            TalkEx("", szNotFinished);
            SetTask(TASK_TWO_FOUR, 1);
            Msg2Player("дn M� Tuy誸 s琻 trang 畂箃 v� Nh蕋 Ph萴 Л阯g b� s�!");
            TaskTip("дn M� Tuy誸 s琻 trang 畂箃 v� Nh蕋 Ph萴 Л阯g b� s�!");
            CreateTrigger(0, 505, 95);  --屠杀暮雪山庄
        end;
    elseif nStep == 2 then
        TalkEx("", szFinished);
    end;
end;


-- 确定接受任务，开始回答问题
function ConfirmQuestion()
	do
		Talk(1,"",QA_TitleText.."V� "..GetPlayerSex().."C� th�  v韎 h鋍 th鴆 uy猲 b竎 c馻 l穙 phu, qu� nhi猲 h藆 sinh kh� 髖!");
		return 0;
	end;
	
	if GetStamina()<=QA_MINSTAMINA + 1 then
		Say(QA_TitleText.."V� "..GetPlayerSex().."tr玭g c� v� m謙 m醝? Chi b籲g ngh� ng琲 <color=yellow>b� sung ch髏 th� l鵦<color> r錳 n!",0);
		return
	end;

	SetTask(QA_STATE, 1); -- 任务状态为已经开始回答任务
--	SetTask(QA_RANDOMSEED, tonumber(date("%y%m%d%H%M%S"))); -- 记录随机种子
	CreateQuestion();
	return
end;

-- 当一个问题回答得正确时
function AnswerRight()


	if GetTask(QA_FINISHNUM)+ 1 >= 10 then
		SetTask(QA_RIGHTSTATE, GetTask(QA_RIGHTSTATE) + 1); -- 连续回答正确的次数加 1
		FinishQuestion();
	else
		SetTask(QA_FINISHNUM, GetTask(QA_FINISHNUM) + 1); -- 连续回答的次数加 1
		SetTask(QA_RIGHTSTATE, GetTask(QA_RIGHTSTATE) + 1); -- 连续回答正确的次数加 1
		AnswerNext(1);
	end;
	
end;

-- 当一个问题回答得错误时
function AnswerError()

	if GetTask(QA_FINISHNUM)+ 1 >= 10 then
		FinishQuestion();
	else
		SetTask(QA_FINISHNUM, GetTask(QA_FINISHNUM) + 1); -- 连续回答的次数加 1
		AnswerNext(2);
	end;
	
end;


-- 选择进行下一步的过程，并且告诉玩家回答正确或者错误
function AnswerNext(nCheck)
	
	if nCheck==1 then
		Talk(1, "CreateQuestion", QA_TitleText.."Hay l緈! Ngi  tr� l阨 ng! H穣 tr� l阨 c﹗ h醝 ti誴 theo!");
	elseif nCheck==2 then
		Talk(1, "CreateQuestion", QA_TitleText.."Ha ha!匰ai r錳! H穣 c� g緉g h鋍 h醝 th猰! Nh璶g kh玭g sao! H穣 nghe c﹗ h醝 ti誴 theo!");
	end;
end;


-- 全部正确回答完 10 个问题时的处理函数
function FinishQuestion()

local nPay, nTimes = GiveAward(); -- 派发奖励
	
	if nPay ~= 0 then
		Say(QA_TitleText.."Ngi  p ng "..nTimes.."  c﹗ h醝 c馻 ta, y l� ph莕 thng  "..nPay.." ti襫 ng c馻 ngi. Hy v鋘g sau n祔 ngi c� th� hi觰 bi誸 th猰 v� th� gi韎 xung quanh!",0);
	else
		Say(QA_TitleText.."Ngi ch璦 p ng c﹗ h醝 n祇 c馻 ta! H穣 c� g緉g trau d錳 ki課 th鴆!",0);
	end;
	
	SetTask(QA_FINISHNUM, 0); -- 将连续回答的次数清空
	SetTask(QA_RIGHTSTATE, 0); -- 将正确回答问题的次数清空
	SetTask(QA_STATE, 0); -- 任务状态为还没开始回答任务
end;

-- 给玩家发予奖励
function GiveAward()

local nTimes = GetTask(QA_RIGHTSTATE);
local nPay = 0;

	PayStamina(QA_PAYSTAMINA); -- 扣除玩家的体力值

	if nTimes>=10 then -- 如果 10 个全部回答正确的话则发全额奖励
		nPay = 130;
		Earn(nPay);
		return nPay, nTimes;
	else
		nPay = nTimes * 10; -- 每回答正确一个问题给 10 块钱
		Earn(nPay);
		return nPay, nTimes;
	end;
	
end;

-- 检测玩家体力值是否足够
function CheckStamina()

	
end;

-- 什么也不处理的退出函数
function MainExit()

end;

--领取西南区40级任务1
function task_100_00()

local strTalk = {
	"Ngi mu鑞 bi誸 g� v� Чi L�?",
	"V穘 b鑙 mu鑞 h醝 {L鬰 i gia t閏}.",
	"ng l� Чi L� c� 6 t閏 l韓 頲 g鋓 {L鬰 i gia t閏} g錷 Tr辬h gia, Dng gia, Tri謚 gia, фng gia, Cao gia v� 祅 gia.",
	"{祅 gia}!?",
	"ng! 祅 gia l� ho祅g t閏 c馻 Чi L�. H琻 n鱝 kh玭g nh� c竎 gia t閏 kh竎 祅 gia kh玭g th� tr� v鱪g 頲.",
	"Cho h醝 {L鬰 i gia t閏} h譶h th祅h nh� th� n祇? C� quan h� ra sao?"
	}
	TalkEx("task_100_10",strTalk);
	return
end

--领取西南区40级任务2
function task_100_10()

local strTalk = {	
	"Чi L� ban u c� t猲 Nam Chi誹 Qu鑓 l� thu閏 a nh� Л阯g. Cu鑙 nh� Л阯g Nam Chi誹 Qu鑓 suy y誹. Gian th莕 Tr辬h M穒 T� nh﹏ c� h閕 畂箃 ng玦 vua th祅h l藀 Чi Trng H遖 Qu鑓, v� sau b� c竎 qu� t閏 nh� Tri謚 Thi謓 Ch竛h, Dng Can Trinh v� 祅 T� B譶h thay phi猲 o ch輓h, trong th阨 gian ng緉 thay i nhi襲 qu鑓 hi謚. Cu鑙 c飊g 祅 T� B譶h th祅h l藀 nc Чi L�, 鎛 nh c竎 th� l鵦 kh竎 h譶h th祅h 4 v鋘g t閏 l韓 g錷: Tr辬h, Tri謚, Dng, 祅.",
	"C遪 {Cao gia} v� {фng gia} th� sao?",
	}
	TalkEx("task_100_11",strTalk);
	return
end

function task_100_11()

local strTalk = {
	"{Cao gia} v� {фng gia} u l� gia t閏 m韎 k� t� khi Чi L� th祅h l藀. Hi謓 th� l鵦 c馻 фng gia m筺h h琻, qu鑓 s� 琻g tri襲 l� фng Gi� La thu閏 gia t閏 h� фng. Hai th� l鵦 lu玭 ng蕀 ng莔 tranh gi祅h l蒼 nhau.",
	"Th� ra l� v藋!",
	"N鉯 L鬰 i gia t閏 nh璶g th鵦 t� Чi L� ch� c遪 5 gia t閏 th玦!"
	}
	TalkEx("task_100_20",strTalk);
	return
end

--领取西南区40级任务3
function task_100_20()

local strTalk = {	
	"Sao l� v藋?",
	"Trc khi Чi L� th祅h l藀, c竎 th� l鵦 lu玭 tranh gi祅h ch衜 gi誸 l蒼 nhau, trong  gia t閏 Tr辬h th� b� di謙 vong trc. V� v藋, tr猲 th鵦 t� Tr辬h gia kh玭g c遪 t錸 t筰.",
	"Hi謓 {Xi H醓 gi竜} 產ng g﹜ r鑙 � {Чi L齷, nghe n鉯 li猲 quan n vi謈 ho祅g  m韎 l猲 ng玦. Kh玭g bi誸 ti襫 b鑙 c� nghe tin ch璦?",
	"Цm ngi Xi H醓 gi竜 c� nghe qua nh璶g hi謓 Чi L� thay i vng tri襲 n猲 ta c騨g kh玭g r�. Ngi th� n Bi謓 Kinh h醝 Tri謚 Di猲 Ni猲 xem!",
	" t� ti襫 b鑙!",
}
	TalkEx("",strTalk);
	CreateTrigger(4,200,Talk_DL_ZHAOYANNIAN);--赵延年西南区任务对话触发器
	Msg2Player("дn Bi謓 Kinh h醝 Tri謚 Di猲 Ni猲 v� vi謈 ho祅g  m韎 l猲 ng玦");
	TaskTip("дn Bi謓 Kinh h醝 Tri謚 Di猲 Ni猲 v� vi謈 ho祅g  m韎 l猲 ng玦");
	SetTask(TASK_DL_LV35_ID,4);--删除武陵山面板信息
	SetTask(TASK_DL_LV40_ID,1);
	GivePlayerAward("Level_40","xn_step_1");
	GivePlayerExp(SkeyDali,"baixiaosheng")
	return
end

--西南区40级任务,未与赵延年对话
function task_100_01()

local strTalk = {
	"Tri謚 Di猲 Ni猲 n緈 r� t譶h h譶h ho祅g t閏 c竎 nc, ngi 甶 h醝 h緉 th� xem, h緉 � Bi謓 Kinh.",
	" t� ti襫 b鑙!",
	}
	
	TalkEx("",strTalk);
	
	if GetTrigger(Talk_DL_ZHAOYANNIAN) == 0 then
		CreateTrigger(4,200,Talk_DL_ZHAOYANNIAN);--赵延年西南区任务对话触发器
		Msg2Player("дn Bi謓 Kinh h醝 Tri謚 Di猲 Ni猲 v� vi謈 ho祅g  m韎 l猲 ng玦");
		TaskTip("дn Bi謓 Kinh h醝 Tri謚 Di猲 Ni猲 v� vi謈 ho祅g  m韎 l猲 ng玦");
	end;
	return
end