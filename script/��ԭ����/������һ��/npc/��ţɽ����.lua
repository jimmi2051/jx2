--npc山大王
--created by lizhi
--2005-8-24 15:25

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- 玩家未组队
        if GetTask(TASK_XYTY) == 58 then
            AddItem(2,0,73,1);  --良山密信
            SetTask(TASK_XYTY, 59);
            Msg2Player("V� b萴 b竜 C玭g T玭 Th�");
            TaskTip("V� b萴 b竜 C玭g T玭 Th�");
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_XYTY) == 58 and nDist >= 0 and nDist <= 50 then
                AddItem(2,0,73,1);  --良山密信
                SetTask(TASK_XYTY, 59);
                Msg2Player("V� b萴 b竜 C玭g T玭 Th�");
                TaskTip("V� b萴 b竜 C玭g T玭 Th�");
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
    end;
end;
