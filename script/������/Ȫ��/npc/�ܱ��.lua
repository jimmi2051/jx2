--  文件说明
--  对应NPC名称：周斌举
--  created by lizhi
--  2005-8-4 15:14

Include("\\script\\task\\world\\lizhi_泉州\\14级\\task_main.lua");

function main()
    
    local nLevel = 0;
    local nStep = 0;
    local szTalk = {
        "Chu B﹏ C�: Giai kh玭g tr� l藀, t骳 甶觰 quy phi c蕄. H� x� th� quy tr譶h? Trng nh li猲 畂秐 nh."
    };

    nStep = GetTask(TASK_LEV_14_ID);
    if (nStep == 1) then
        task_001_02();
    elseif (nStep == 2) then
        task_002_01();
    elseif (nStep == 3) then
        task_003_01();
    else
        TalkEx("", szTalk);
    end;

end;