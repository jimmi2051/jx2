--文件说明
--长歌门任务触发器脚本
--created by lizhi
--2005-8-10 15:19

Include("\\script\\task\\world\\lizhi_长歌门\\task_head.lua");
Include("\\script\\task\\world\\g_random_head.lua");

function Yzl_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,51,1);  --长歌门人物谱
    end;
    if GetItemCount(2,0,51) >= 9 then
    	Msg2Player("Thu th藀 xong Trng M玭 s竎h");
    	TaskTip("Thu th藀 xong Trng M玭 s竎h");
   	end;
end;

function Lbs_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,52,1);  --天阴教杂书
    end;
    if GetItemCount(2,0,52) >= 9 then
    	Msg2Player("Thu th藀 xong Thi猲  gi竜 t筽 th�");
    	TaskTip("Thu th藀 xong Thi猲  gi竜 t筽 th�");
   	end;
end;

function Wmb_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,53,1);  --蚩火教民俗
    end;
    if GetItemCount(2,0,53) >= 9 then
    	Msg2Player("Thu th藀 xong phong t鬰 Xi H醓 gi竜");
    	TaskTip("Thu th藀 xong phong t鬰 Xi H醓 gi竜");
   	end;
end;

function Mxsz_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,54,1);  --一品堂逸事
    end;
    if GetItemCount(2,0,54) >= 9 then
    	Msg2Player("Thu th藀 xong vi謈 l祄 c馻 Nh蕋 Ph萴 阯g");
    	TaskTip("Thu th藀 xong vi謈 l祄 c馻 Nh蕋 Ph萴 阯g");
   	end;
end;

function Hl_Killed()
    RemoveTrigger(GetRunningTrigger());
    SetTask(TASK_FOUR, 3);
end;

--function Cgm_OnTimer()
--    RemoveTrigger(GetRunningTrigger());
--    SetTask(TASK_ONE, 110);
--end;

--function Leave_Game()
--    if GetTask(124) == 2 or GetTask(125) == 2 or GetTask(126) == 2 then
--        RemoveTrigger(GetRunningTrigger());
--        RemoveTrigger(GetTrigger(90));
--    end;
--end;