--在扬州任务雷胜的尸体
--created by lizhi
--2005-8-24 10:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_扬州\\task_main.lua");

function main()
    if GetTask(TASK_FIVE) >= 21 then
        PickUp();
    end;
end;

function PickUp()
    if GetItemCount(2,0,100) == 0 and GetTask(TASK_YZ_TWO) == 0 then
        AddItem(2,0,100,1); --飞瀑金针
    end;
    if GetItemCount(2,0,101) == 0 and GetTask(TASK_YZ_ONE) == 0 then
        AddItem(2,0,101,1); --与妻书
    end;
    local nStep = GetTask(TASK_FIVE);
    if nStep == 21 then
        SetTask(TASK_FIVE, 22);
        Msg2Player("H錳 b竜 H� H莡 C莔");
        TaskTip("H錳 b竜 H� H莡 C莔");
    elseif nStep == 23 then
        if GetItemCount(2,0,103) == 0 then
            AddItem(2,0,103,1);
            Msg2Player("H錳 b竜 H� H莡 C莔");
            TaskTip("B竜 H� H莡 C莔");
        end;
    end;
    
    
end;