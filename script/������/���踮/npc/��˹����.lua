-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 凤翔府NPC波斯商人Script
-- By StarryNight
-- 2007/06/27 AM 10:16

-- 贩卖你的感情吧，但它一文不值。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- 西北任务分支1——09光明左使----------------------------------
	
	--询问有没有波斯葡萄酒卖
	if nStep_XBTask_01 == 2 then
		task_009_03_0();
		return
	end
	
	--还没取得葡萄酒and补发烟汉触发器
	if nStep_XBTask_01 == 3 then
		task_009_03_1();
		return
	end
	
	--一般情况下的对话
	strTalk = {
		{"Con 阯g v薾 chuy觧 t� l鬭 tuy t鑤 nh璶g qu� d礽� T� Ph鬾g Tng n An T鴆 ph秈 m蕋 hai mi m蕐 ng祔."},
		{"Ng玭 ng� trung nguy猲 kh� h鋍 qu�, ngi trung nguy猲 l筰 kh玭g ch辵 h鋍 ti課g c馻 ta, bi誸 th猰 m閠 s� ti課g c� g� kh玭g t鑤 ch�? Ta c騨g bi誸 n鉯 ng玭 ng� c馻 m閠 s� qu鑓 gia v藋."},
		{"Ngi ch� c� nghe t猲 Л阯g H� L� n鉯 b藋, T﹜ V鵦 l祄 g� c� phng ph竝 l祄 l筺h, ta ch� chuy猲 b竛 h祅g h鉧 T﹜ V鵦, Ru Ba T�."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
