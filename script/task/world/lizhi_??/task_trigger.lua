--襄阳任务触发器处理函数
--created by lizhi
--2005-8-19 11:35
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\task\\world\\g_random_head.lua");

function LaoHu_Killed()
    if g_probability(35, 100) then
        AddItem(2,0,55,1);
    end;
    
    if GetItemCount(2,0,55) >= 10 then
        SetTask(TASK_XYTY, 6);
    end;
end;

function LieHu_Killed()
    if GetTask(TASK_XYTY) == 10 or GetTask(TASK_XYTY) == 11 then
        if g_probability(10, 70) then
            if GetItemCount(2,0,56) < 1 then 
                AddItem(2,0,56,1);
                SetTask(TASK_XYTY, 11);
                Talk(1,"","Tr猲 ngi Li謕 h� Linh B秓 s琻 c� c� c馻 ti猽 c鬰, c� l� ti猽 s�  b� gi誸 ph秈 v� b萴 b竜 l筰 v韎 C玭g T玭 Th� ti襫 b鑙!");
            end;
        end;
    elseif GetTask(TASK_XYTY) == 12 or GetTask(TASK_XYTY) == 13 then
        if g_probability(35, 100) then
            AddItem(2,0,57,1);
        end;
        
        if GetItemCount(2,0,57) >= 20 then
            SetTask(TASK_XYTY, 13);
        end;
    end;
end;

function Mxsz_Killed()
    if GetTask(TASK_XYTY) == 15 or GetTask(TASK_XYTY) == 16 then
        if g_probability(70, 1000) then
            RemoveTrigger(GetRunningTrigger());
            SetTask(TASK_XYTY, 16);
            local szMsg = {
                "Mau n鉯! M藅 kh萿 v祇 M� Tuy謙 s琻 trang l� g�?",
                "収筰 hi謕 tha m筺g, l祬{M閩 ai tr莔 tr莔, {Tuy誸} d� h玭 h玭, {S琻} l閏 tr飊g tr飊g, {Trang} x� th﹎ th﹎."
            };
            TalkEx("", szMsg);
        end;
    elseif GetTask(TASK_XYTY) == 17 or GetTask(TASK_XYTY) == 18 then
        if GetItemCount(2,0,58) < 1 then
            if g_probability(80, 1000) then
                AddItem(2,0,58,1);
                SetTask(TASK_XYTY, 18);
            end;
        end;
    end;
end;

function Db_Killed()
    RemoveTrigger(GetRunningTrigger());
    SetTask(TASK_XY_TEMP, 1);
    if GetTask(TASK_XY_TEMP1) == 1 then
        Talk(1,"","чi qu﹏ ti猲 phong  b� ti猽 di謙 g莕 h誸, Li猽 qu﹏ t筸 th阨 kh玭g d竚 ti課 qu﹏ ti課 nh Tng Dng, v� b萴 b竜 v韎 C玭g T玭 Th� ti襫 b鑙 trc!");
        SetTask(TASK_XYTY, 28);
        SetTask(TASK_XY_TEMP, 0);
        Msg2Player("V� b萴 b竜 C玭g T玭 Th�");
        TaskTip("V� b萴 b竜 C玭g T玭 Th�");
    end;
end;

function Qb_Killed()
    RemoveTrigger(GetRunningTrigger());
    SetTask(TASK_XY_TEMP1, 1);
    if GetTask(TASK_XY_TEMP) == 1 then
        Talk(1,"","чi qu﹏ ti猲 phong  b� ti猽 di謙 g莕 h誸, Li猽 qu﹏ t筸 th阨 kh玭g d竚 ti課 qu﹏ ti課 nh Tng Dng, v� b萴 b竜 v韎 C玭g T玭 Th� ti襫 b鑙 trc!");
        SetTask(TASK_XYTY, 28);
        SetTask(TASK_XY_TEMP, 0);
        Msg2Player("V� b萴 b竜 C玭g T玭 Th�");
        TaskTip("V� b萴 b竜 C玭g T玭 Th�");
    end;
end;

function Jmg_Killed()
    if g_probability(50, 1000) then
        AddItem(2,0,61,1);
        SetTask(TASK_XYTY, 30);
        Msg2Player("V� b萴 b竜 C玭g T玭 Th�");
        TaskTip("V� b萴 b竜 C玭g T玭 Th�");
    end;
end;

--function Jl_Killed()
--    AddItem(2,0,62,3);
--    RemoveTrigger(GetRunningTrigger());
--    SetTask(TASK_XYTY, 32);
--    Msg2Player("回报公孙书");
--end;

function Sd_Killed()
    if GetTask(TASK_XYTY) == 33 or GetTask(TASK_XYTY) == 34 then
        if g_probability(25, 100) then
            AddItem(2,0,63,1);
        end;
        if GetItemCount(2,0,63) >= 10 then
            SetTask(TASK_XYTY, 34);
            Msg2Player("V� b萴 b竜 C玭g T玭 Th�");
            TaskTip("V� b萴 b竜 C玭g T玭 Th�");
        end;
    elseif GetTask(TASK_XYTY) == 41 or GetTask(TASK_XYTY) == 42 then
        if g_probability(20, 100) then
            AddItem(2,0,66,1);
        end;
        if GetItemCount(2,0,66) >= 5 then
            SetTask(TASK_XYTY,42);
            Msg2Player("V� b萴 b竜 C玭g T玭 Th�");
            TaskTip("V� b萴 b竜 C玭g T玭 Th�");
        end;
    end;
end;

function Njx_Killed()
    if g_probability(25, 100) then
        AddItem(2,0,65,1);
    end;
    
    if GetItemCount(2,0,65) >= 10 then
        SetTask(TASK_XYTY, 40);
        Msg2Player("Thu th藀  m� h錸 hng");
        TaskTip("Thu th藀  m� h錸 hng");
    end;
end;

function Dyx_Killed()
    AddItem(2,0,67,1);
    SetTask(TASK_XYTY, 44);
    RemoveTrigger(GetRunningTrigger());
    Msg2Player("V� b萴 b竜 C玭g T玭 Th�");
    TaskTip("V� b萴 b竜 C玭g T玭 Th�");
end;

function Ldb_Killed()
    RemoveTrigger(GetRunningTrigger());
    
    SetTask(TASK_XY_TEMP, 1);
    if GetTask(TASK_XY_TEMP1) == 1 and GetTask(TASK_XY_TEMP2) == 1 then
        SetTask(TASK_XYTY, 49);
        SetTask(TASK_XY_TEMP, 0);
        SetTask(TASK_XY_TEMP1, 0);
        SetTask(TASK_XY_TEMP2, 0);
    end;
end;

function Lqb_Killed()
    RemoveTrigger(GetRunningTrigger());
    
    SetTask(TASK_XY_TEMP1, 1);
    if GetTask(TASK_XY_TEMP) == 1 and GetTask(TASK_XY_TEMP2) == 1 then
        SetTask(TASK_XYTY, 49);
        SetTask(TASK_XY_TEMP, 0);
        SetTask(TASK_XY_TEMP1, 0);
        SetTask(TASK_XY_TEMP2, 0);
    end;
end;

function Ljb_Killed()
    RemoveTrigger(GetRunningTrigger());
    
    SetTask(TASK_XY_TEMP2, 1);
    if GetTask(TASK_XY_TEMP1) == 1 and GetTask(TASK_XY_TEMP) == 1 then
        SetTask(TASK_XYTY, 49);
        SetTask(TASK_XY_TEMP, 0);
        SetTask(TASK_XY_TEMP1, 0);
        SetTask(TASK_XY_TEMP2, 0);
    end;
end;

function Xs_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,68,1);
    end;
    
    if GetItemCount(2,0,68) >= 10 then
        SetTask(TASK_XYTY, 52);
    end;
end;

--function Zs_Killed()
--    if GetItemCount(2,0,210) >= 1 then
--        DelItem(2,0,210,1);
--        Msg2Player("对西夏咒师尸体使用破咒水");
--        local nStep = GetTask(TASK_XY_TWO_ONE);
--        SetTask(TASK_XY_TWO_ONE, nStep + 1);
--    else
--        Talk(1,"","<color=green>玩家<color>：糟糕，没有<color=yellow>破咒水<color>了，还是先撤退回武当让紫鹤真人做几份再来破阵");
--        SetTask(TASK_XY_TWO, 4);
--    end;
--    
--    if GetTask(TASK_XY_TWO_ONE) == 3 then
--        SetTask(TASK_XY_TWO, 5);
--        RemoveTrigger(GetRunningTrigger());
--        AddItem(2,0,72,1);
--        if GetTask(TASK_XY_ONE) == 5 and GetTask(TASK_XY_TWO) == 5 then  --如果襄阳支线任务都完成了，则见公孙书
--            SetTask(TASK_XYTY, 56);
--            Msg2Player("回报公孙书");
--            TaskTip("回报公孙书");
--        end;
--    end;
--end;

--326,1496,2945
--function Leave_Game()
--    if GetTask(TASK_XYTY) == 24 then
--        SetTask(TASK_XYTY, 23);
--        SetNpcLifeTime(GetTask(TASK_XY_TEMP), 0);
--        local npcIndex = CreateNpc("九头金凤", "九头金凤", 326, 1496, 2945);
--        SetNpcScript(npcIndex, "\\script\\中原二区\\暮雪山庄\\npc\\九头金凤.lua");
--        SetDeathScript("");
--        SetTask(TASK_XY_TEMP, 0);
--        RemoveTrigger(GetRunningTrigger());
--        RemoveTrigger(GetTrigger(LEAVE_RECT_XY));
--    end;
--end;

--function Leave_Map()
--    if GetTask(TASK_XYTY) == 24 then
--        SetTask(TASK_XYTY, 23);
--        SetNpcLifeTime(GetTask(TASK_XY_TEMP), 0);
--        local npcIndex = CreateNpc("九头金凤", "九头金凤", 326, 1496, 2945);
--        SetNpcScript(npcIndex, "\\script\\中原二区\\暮雪山庄\\npc\\九头金凤.lua");
--        SetDeathScript("");
--        SetTask(TASK_XY_TEMP, 0);
--        RemoveTrigger(GetTrigger(LEAVE_GAME_XY));
--        RemoveTrigger(GetRunningTrigger());
--    end;
--end;