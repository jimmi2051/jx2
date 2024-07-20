--脚本名称：步非烟的宝箱拾取脚本
--脚本功能：跟步非烟的宝箱Npc对话，然后进行拾取条件判断，给于宝箱
--策划人：侯盾
--代码开发人：村长
--代码开发时间：到金山的第二个DD
--代码修改记录：2007-08-13根据侯盾的要求修改了宝箱的拾取机制
Include("\\script\\online\\zgc_public_fun.lua")
Box_belong_ID = 0
Box_get_time = 1
Box_index_save_ID = 166
function main()
	local npc_index = GetTargetNpc()
	if npc_index == 0 then
		return
	end
	if GetPlayerRoute() == 0 then
		Msg2Player("Ch� bang ch�, ph� bang ch�, trng l穙, 阯g ch�, hng ch� gia nh藀 l璾 ph竔 m韎 c� th� nh苩 b秓 v藅 n祔!")
		return
	end
	if IsTongMember() > 5 or IsTongMember() == 0 then 															--判断是否入帮
		Msg2Player("Ch� bang ch�, ph� bang ch�, trng l穙, 阯g ch�, hng ch� gia nh藀 l璾 ph竔 m韎 c� th� nh苩 b秓 v藅 n祔!")
	else
		if GetFightState() == 0 then --非战斗状态不能捡
			Msg2Player("Ch� � tr筺g th竔 chi課 u m韎 c� th� nh苩 頲 b秓 v藅 n祔!")
			return
		end
		if GetUnitCurStates(npc_index,Box_belong_ID) == 0 or (GetTime() - GetUnitCurStates(npc_index,Box_get_time)) > 10 then
			SetTaskTemp(Box_index_save_ID,npc_index)
			SetUnitCurStates(npc_index,Box_belong_ID,1)
			SetUnitCurStates(npc_index,Box_get_time,GetTime())
			DoWait(9,10,10)
		else
			Talk(1,"","<color=green>a ra <color>: rng kho b竨 c莕 產ng b� ngi kh竎 s� d鬾g, vui l遪g quay l筰 trong ch鑓 l竧.")
			return
		end
	end	
end
