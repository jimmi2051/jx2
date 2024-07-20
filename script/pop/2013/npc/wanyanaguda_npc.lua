--完颜阿骨打
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

--把一些数据上的东西丢到这里来 方便测试
g_tGTaskId = {1319, 1335};  --涉及到的任务id 查看gtask_main
g_szNpcName = "<color=green>Ho祅 Nhan A C鑤 Ф<color>: ";

function main()
	local nNpcIdx = GetTargetNpc();
	local szNpcName = GetNpcName(nNpcIdx);
	
	local nHasTask = 0;
	for i = 1,getn(g_tGTaskId) do
		if 1 == tGtTask:check_cur_task(g_tGTaskId[i])  then
			nHasTask = 1
			break;
		end
	end
	if nHasTask ~= 1 then
		Talk(1, "", szNpcName .. ": D筼 n祔 lo nh tr薾, kh玭g bi誸 h玬 nay tng qu﹏  gi竜 hu蕁 ch璦?");
		return 0;
	end
	
	--判断物品
	if GetItemCount(2,111,2) < 1 then
		Talk(1, "", szNpcName .. ": D筼 n祔 lo nh tr薾, kh玭g bi誸 h玬 nay tng qu﹏  gi竜 hu蕁 ch璦?");
		return 0;
	end
	if gf_Judge_Room_Weight(1,10, "") ~= 1 then return 0; end
	
	if DelItem(2,111,2,1) ~= 1 then return 0; end
	
	gf_AddItemEx({2,111,11,1}, "Th� g鰅 cho Ho祅 Nhan T玭g H祅");
	
	local szPlayerName = GetName();
	local szMsg = format("%s 揕i猽 ch� th蕋 c, trong ngo礽 li t﹎. Tri襲 H璶g S� ta i nghi謕 s緋 th祅h r錳.� Ha Ha, Qu� nhi猲 T玭g H祅 r蕋 hi觰 l遪g ta, ngi h穣 giao b鴆 th� n祔 cho h緉, h緉 s� hi觰 t﹎ � c馻 ta.", g_szNpcName);

	Talk(1, "", szMsg);
end

function OnDeath(nNpcIdx)
	--RemoveNpc(nNpcIdx);
end