-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 翠烟门NPC彩凤儿Script
-- By StarryNight
-- 2006/03/22 PM 17:20

-- 直面自己的内心吧！

-- ======================================================
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
		if g_akct_GetTaskStep(bTag) then
			return
		end
	
		local t_dialog = {
			"<color=green>H� M蒼<color>: Th髖 Y猲 M玭 v鮝 v祇 Trung Nguy猲  thu h髏 r蕋 nhi襲 nh﹏ t礽 gia nh藀, v� c飊g n竜 nhi謙.",
			"<color=green>H� M蒼<color>: Th髖 Y猲 M玭 c秐h s綾 m� ngi, l� n琲 t鑤  h鋍 m骯, nu玦 Ti觰 猽.",
			}
		Talk(1,"",t_dialog[random(getn(t_dialog))])
end;		
