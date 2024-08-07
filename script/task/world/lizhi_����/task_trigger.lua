--江津村任务触发器

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\g_random_head.lua");

function LaoHu_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,55,1);
    end;
end;

function Fs_Killed()
    if GetItemCount(2,0,84) >= 1 then   --有锁妖锺
        AddItem(2,0,85,1);
    else
        Msg2Player("Kh玭g c� T醓 Y猽 Chung kh玭g th� thu th藀 Oan h錸");
        TaskTip("Kh玭g c� T醓 Y猽 Chung kh玭g th� thu th藀 Oan h錸");
    end;
end;

function Xs_Killed()
    if GetItemCount(2,0,84) >= 1 then   --有锁妖锺
        AddItem(2,0,86,1);
    else
        Msg2Player("Kh玭g c� T醓 Y猽 Chung kh玭g th� thu th藀 Oan h錸");
        TaskTip("Kh玭g c� T醓 Y猽 Chung kh玭g th� thu th藀 Oan h錸");
    end;
end;

function Wjh_Killed()
    if g_probability(40, 100) then
        AddItem(2,0,87,1);
    end;
end;

function Hy_Killed()
    if g_probability(10, 100) then
        AddItem(2,0,88,1);
    end;
end;

function IsComplete()
    local flag = 0;
    for i=89,93 do
        if GetItemCount(2,0,i) == 0 then
            flag = 1;
            break
        end;
    end;
    return flag
end;

function Sn_Killed()
    if GetTask(TASK_JJC) == 15 then
        if g_probability(20, 100) then
            AddItem(2,0,89,1);
            Talk(1,"","Th� n祔 giao n Trng Ca M玭 kho秐g 4 trang, m閠 s� trang r琲 v祇 tay ngi Mi猽.");
            CreateTrigger(0,552,KILL_JJC_ZR);
            CreateTrigger(0,553,KILL_JJC_YS);
            SetTask(TASK_JJC, 16);
        end;
    elseif GetTask(TASK_JJC) == 16 then
        if g_probability(10, 100) then
            if GetItemCount(2,0,90) == 0 then
                AddItem(2,0,90,1);
            end;
            if GetItemCount(2,0,89) == 0 then
                AddItem(2,0,89,1);
            end;
            if IsComplete() == 0 then
                Talk(3,"","Th� n祔 xem ra do T鑞g Giang vi誸","[襲 tra th﹏ th� Tr莕 Phi Dng...]","Kh玭g 頲! Ta ph秈 <color=yellow>甶 Lng S琻 t譵 T鑞g Giang<color> h醝 cho ra l�!");
                SetTask(TASK_JJC, 17);
                RemoveTrigger(GetRunningTrigger());
                RemoveTrigger(GetTrigger(KILL_JJC_ZR));
                RemoveTrigger(GetTrigger(KILL_JJC_YS));
            end;
        end;
    end;    
end;

function Zr_Killed()
    local flag = 0;
    if GetItemCount(2,0,91) == 0 and GetItemCount(2,0,92) == 0 then
        flag = 1;
    end;
    if g_probability(10, 100) then
        if GetItemCount(2,0,91) == 0 then
            AddItem(2,0,91,1);
            if flag == 1 then
                return
            end;
        end;
        if GetItemCount(2,0,92) == 0 then
            AddItem(2,0,92,1);
            if flag == 1 then
                return
            end;
        end;
        if IsComplete() == 0 then
            Talk(3,"","Th� n祔 xem ra do T鑞g Giang vi誸","[襲 tra th﹏ th� Tr莕 Phi Dng...]","Kh玭g 頲! Ta ph秈 <color=yellow>甶 Lng S琻 t譵 T鑞g Giang<color> h醝 cho ra l�!");
            SetTask(TASK_JJC, 17);
            RemoveTrigger(GetRunningTrigger());
            RemoveTrigger(GetTrigger(KILL_JJC_SN));
            RemoveTrigger(GetTrigger(KILL_JJC_YS));
        end;
    end;
end;

function Ys_Killed()
    if g_probability(10, 100) then
        if GetItemCount(2,0,93) == 0 then
            AddItem(2,0,93,1);
        end;
        if IsComplete() == 0 then
            Talk(3,"","Th� n祔 xem ra do T鑞g Giang vi誸","[襲 tra th﹏ th� Tr莕 Phi Dng...]","Kh玭g 頲! Ta ph秈 <color=yellow>甶 Lng S琻 t譵 T鑞g Giang<color> h醝 cho ra l�!");
            SetTask(TASK_JJC, 17);
            RemoveTrigger(GetRunningTrigger());
            RemoveTrigger(GetTrigger(KILL_JJC_SN));
            RemoveTrigger(GetTrigger(KILL_JJC_ZR));
        end;
    end;
end;

function Tr_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,94,1);
    end;
end;

function Jk_Killed()
    RemoveTrigger(GetRunningTrigger());
    SetTask(TASK_JJC_JK, 2);
    if GetTask(TASK_JJC_JK) == 2 and GetTask(TASK_JJC_DJ) == 2 then
        SetTask(TASK_JJC, 27);
        SetTask(TASK_JJC_JK, 0);
        SetTask(TASK_JJC_DJ, 0);
    end;
end;

function Dj_Killed()
    RemoveTrigger(GetRunningTrigger());
    SetTask(TASK_JJC_DJ, 2);
    if GetTask(TASK_JJC_JK) == 2 and GetTask(TASK_JJC_DJ) == 2 then
        SetTask(TASK_JJC, 27);
        SetTask(TASK_JJC_JK, 0);
        SetTask(TASK_JJC_DJ, 0);
    end;
end;
