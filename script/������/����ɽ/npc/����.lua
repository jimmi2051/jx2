--在扬州任务唐宁
--created by lizhi
--2005-8-24 10:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_扬州\\task_main.lua");
Include("\\script\\task\\world\\lizhi_扬州\\task_two_main.lua");

function main()
    local nStep = GetTask(TASK_FIVE);
    if nStep == 27 then
        task_27_00();
        return
    elseif nStep == 28 then
        Talk(1,"","<color=green>Л阯g Ninh<color>: H穣 quay v� nh緉 v韎 <color=yellow>H� H莡 C莔<color> y猲 t﹎,  ta  nh薾 頲 r錳!");
        return
    end;
    
    nStep = GetTask(TASK_YZ_TWO);
    if nStep == 5 then
        two_05_00();
        return
    elseif nStep == 6 then
        local szTalk = {
            "Ta  n鉯 h誸 chuy謓 ta bi誸 cho ngi. Chuy謓 c馻 {H� H莡 C莔} h穣 ch th﹏ n h醝!",
            "H� c� nng  k� h誸 cho ta bi誸. R阨 kh醝 Xi H醓 gi竜, kh玭g s� h� l祄 h筰 c� nng sao?",
            "Ta 阯g 阯g mang h� Л阯g, ch髇g d竚 l祄 g� ta!",
            "V藋 ta y猲 t﹎! Л阯g c� nng, xin b秓 tr鋘g!"
        };
        TalkEx("", szTalk);
        return
    end;

     Talk(1,"","<color=green>Л阯g Ninh<color>: C� chuy謓 g� kh玭g?");
end;