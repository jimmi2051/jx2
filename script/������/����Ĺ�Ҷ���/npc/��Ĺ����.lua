-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 皇陵墓二层NPC守墓将军Script
-- By StarryNight
-- 2007/08/03 PM 08:13

-- 身后，只剩一行脚印。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	
	if tGtTask:check_cur_task(260) == 1 then
		Talk(1,"","<sex> qu� nhi猲 l頸 h筰, ch� ti誧 r籲g Thi猲 Ma T� Tinh  b� мa Huy襫 Cung Ch� 畂箃 甶 r錳, ngi  n tr� m閠 bc.")
		return
	end

	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
	
	---------------------------------- 西北区15分支1_6古墓风云----------------------------------
	--领取任务但尚未打倒4个镇墓将军前提示
	if nStep_XBTask_01 == 26 then
		task_015_03_1();
		return
	end
	
	--已经打败镇墓将军但未打倒鬼将军
	if nStep_XBTask_01 == 27 then
		task_015_03_0();
		return
	end
	
	--已经完成任务 关卡开启接口
	if nStep_XBTask_01 == 28 then
		task_015_03_2();
		return
	end
	
	--一般情况下的对话
	local strTalk = {
		"Th� M� Tng Qu﹏:? ( thanh qu竔 d�) ...%##@!#!? ()!*&!@#",
		"Con ngi kh� hi觰�"
		}
	
	TalkEx("",strTalk);
	return
	
end;
