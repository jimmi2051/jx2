--
-- Author: Zheng Jinke
-- Date: 2015-12-22 15:51:29
--

Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\stringtable.lua")
Include("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

---------------------------在线时长---------------------------


function do_online_time_activity()
	local titleSay = ""--format("<color=gold>一品御厨<color>:玩家每天可以来我这里，开启当天的累积在线计时。当玩家累积在线达到一定时间时，玩家可再来找我，领取奖励并开启下一轮累积在线计时。")
	local tbSay = {}
	local round = get_task("id_online_time_round")+1
	local t = tb_online_task[round]
	local tAward = tb_online_award[round]
	if not t then
		Talk(1,"","Х ho祅 th祅h nhi謒 v� t輈h l騳 online c馻 h玬 nay, ng祔 mai h穣 quay l筰.")
		return 0;
	end
	
	local curtime = get_task("id_online_time_count")
	local goal = t[1]
	local need = goal - curtime
	titleSay = format("Lt nhi謒 v� hi謓 t筰: %d/%d, ph莕 thng: %d %s, t輈h l騳 online %s", round, getn(tb_online_task), tAward[5], tAward[1]
		, _get_time_str(curtime))
	if need > 0 then
		local resStr = format("B筺 c莕 t輈h l騳 online th猰 %s m韎 頲 nh薾 thng",_get_time_str(need))
		titleSay = format("%s,%s", titleSay, resStr)
	else
		tinsert(tbSay,format("%s/#online_award(%d)","X竎 nh薾 nh薾 thng", round))
	end
		
	tinsert(tbSay,format("%s/nothing", "Ra kh醝"))
	Say(titleSay,getn(tbSay),tbSay)
end

function _get_time_str(nMin)
	local resStr = ""
	local hour = floor(nMin / 60)
	local minu = floor(mod(nMin,60))
	local resStr = format("%d gi� %d ph髏",hour,minu)
	return resStr
end

function active_online(  )  --激活在线时间，即将该id设置为1
	set_task("id_online_time_round",1)
end

function online_award( round )
	if gf_Judge_Room_Weight(1,100,"") ~= 1 then return end
	local tb_award = tb_online_award[round]
	AddItem(tb_award[2],tb_award[3],tb_award[4],tb_award[5],tb_award[6])
	set_task("id_online_time_round",round)
	local Str = format("Nh薾 thng online lt th� %d/%d th祅h c玭g", round, getn(tb_online_task))
	Msg2Player(1,"",Str)
end
---------------------------在线时长---------------------------