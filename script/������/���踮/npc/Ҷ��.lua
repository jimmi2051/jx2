-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 凤翔府NPC叶老Script
-- By StarryNight
-- 2007/06/13 AM 10:54

-- 理想与现实的平衡，不需要任何技巧，那都是放屁。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);

	---------------------------------- 西北任务05陈仓暗度----------------------------------
	
	--与叶老对话带包裹给叶子秋
	if nStep_XBTask == 20 then
		task_005_05_0();
		return
	end
	
	--未带包裹给叶子秋
	if nStep_XBTask == 21 then
		task_005_05_1();
		return
	end
	
	--已经带包裹给叶子秋
	if nStep_XBTask == 22 then
		task_005_07_0();
		return
	end
	
	--未完成劫囚与叶老对话
	if nStep_XBTask == 23 then
		task_005_07_1();
		return
	end
	
	---------------------------------- 西北区26分支2_3非常道人----------------------------------
	--未与欧阳画对话，补发触发器
	if nStep_XBTask_02 == 11 then
		task_025_04_2();
		return
	end
	
	--代叶子秋向叶老报平安
	if nStep_XBTask_02 == 12 then
		task_026_02_0();
		return
	end

	--未与叶子秋对话与叶老对话
	if nStep_XBTask_02 == 13 then
		task_026_02_1();
		return
	end
	
	--一般情况下的对话
	strTalk = {
		{"C玭 L玭 n骾 cao 阯g d鑓, th藅 kh� 甶!"},
		{"Thng nh﹏ n t� T﹜ V鵦 tuy v蕋 v� nh璶g m鏸 l莕 n u ch� y xe h祅g, v� t苙g ta 輙  ch琲 k� l�."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
