-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北剧情关卡门票 龙门宴请柬 Script
-- By StarryNight
-- 2007/12/19 PM 04:18

-- 幸福，其实就是那些不经意间被遗忘的片段。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")

function OnUse()

local nFinishNum = 0;
	if GetTask(Mission_week_seq_TaskID) ==Zgc_pub_week_seq() then
		nFinishNum = GetTask(Mission_login_times_TaskID)
	end
local nPlayNum = 10-nFinishNum;
local strTalk = {
"{.Th玭g tin v藅 ph萴}: L� Nguy猲 Kh竛h ch th﹏ n Long M玭 Tr蕁, i ti謈 chi猽 i nh鱪g ai c� hi襪 kh輈h v韎 Nh蕋 Ph萴 Л阯g. N誹 b� Thi誸 chu l謓h truy s竧, 甧m {Thi謕 m阨 Long M玭} c� th� tham gia khi猽 chi課 L� Nguy猲 Kh竛h t筰 {y課 ti謈 Long M玭}.\n{.мa 甶觤 s� d鬾g}: Ti觰 Nh�, {M鏸 th� 6, th� 7 t� 16:00 - 16:10} n {qu竛 tr� Long M玭 Tr蕁} a thi謕 ra l� c� th� tham d�.\n{.襲 ki謓 s� d鬾g}: Ho祅 th祅h nhi謒 v� T﹜ b綾-Ho祅g Sa L筩 M筩.\n",
	}
	
	TalkEx("",strTalk);
	
end