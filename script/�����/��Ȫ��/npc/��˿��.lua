--在扬州任务夏侯莲
--created by lizhi
--2005-8-24 10:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_扬州\\task_main.lua");

function main()
    local nStep = GetTask(TASK_YZ_TWO);
    if nStep >= 6 then
        local szTalk = {
            "Qu� l� m� n b� c 竎!",
            "чc 竎 �? Kh玭g l祄 v藋 c� ai nh� n ta kh玭g?"
        };
        TalkEx("", szTalk);
        return
    end;
    
    nStep = GetTask(TASK_FIVE);
    if nStep == 15 then
        task_15_00();
        return
    elseif nStep == 16 then
        task_16_00();
        return
    elseif nStep == 17 then
        Talk(1,"","Ngi mau 甶 l蕐 <color=yellow>cao Thi猲 Thi襪 H鉧 чc<color> cho Tr莕 M蒼 i phu nghi謒 ch鴑g r錳 mang n cho <color=yellow>H� H莡 Li猲<color>!");
        return
    elseif nStep >= 20 and nStep < 22 then
        local szTalk = {
            "Sao c� nng l筰 c鴘 H� H莡 Li猲?",
            "Sau n祔 ngi kh綾 bi誸."
        };
        TalkEx("", szTalk);
        return
    elseif nStep >= 22 then
        local szTalk = {
            "C� ph秈 c� nng  gi誸 L玦 Th緉g!",
            "Kh玭g ph秈 ta, li評 y誹 o t� nh� ta sao c� th� gi誸 頲 ch�?",
            "V藋 c� nng mua nhi襲 binh kh�  l祄 g�?",
            "Ta c騨g c� � , nh璶g l筰 s� v祇 i lao. Ngi卬gi ng 甶 b竜 quan卼a s� l緈!"
        };
        TalkEx("", szTalk);
        return
    else
        if GetSex() == 1 then --male
            Talk(1,"","Tr竛h xa ta ra! Mu鑞 ch誸 �?");
        elseif GetSex() == 2 then --female
            Talk(1,"","Ti觰 mu閕 s綾 p tuy謙 tr莕! Th藅 khi課 ta nh� v� th阨 son tr�!");
        end;
    end;
end;