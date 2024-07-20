Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function main()
	QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.BoxIndex,GetTargetNpc());
	DoWait(105,106,QHT_DIJI_BOX_TIME);
end

function diji_suc_call_back()
	local npcIndex = QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.BoxIndex);
	--print("GetNpcName(npcIndex)",GetNpcName(npcIndex))
	if GetNpcName(npcIndex) ~= "Thi�n T�m B�o R��ng c�p th�p" then
		return 0;
	end
	local nCount = 3
	if IsActivatedVipCard() == 1 then
		nCount = 1
	end
	if GetItemCount(2, 1, 30435) < nCount then
		Talk(1,"",format("M� b�o r��ng c�n ti�u hao %d M�nh H� ph� v� %s, n�u v�ng kh�ng �� th� kh�ng th� m� ra.", nCount, "0 v�ng").."(K�ch ho�t th� th�ng s� ti�u hao M�nh H� Ph� �t h�n)");
		return 0;
	end
	if DelItem(2, 1, 30435, nCount) ~= 1 then
		return 0;
	end
	SetNpcLifeTime(npcIndex, 0);
	qht_award_one(npcIndex);
	AddRuntimeStat(22, 2, 0, 1);
end