--诸葛棋
--created by lizhi
--2005-8-24 19:09
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_江津村\\task_main.lua");
Include("\\script\\task\\world\\lizhi_长歌门\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function main()
	if GetTask(126) == 1 then	--赵延年通知
    	talk_one();
    	return
   	end;
   	
   	if GetTask(128) == 1 then		--夏侯琴通知
   		talk_five();
   		return
   	end;
   	
    local nStep = GetTask(TASK_JJC);
    if nStep == 1 then
        task_01_00();
        return
    elseif nStep == 8 then
        task_08_00();
        return
    elseif nStep == 9 then
        task_09_00();
        return
    elseif nStep == 13 then
        task_13_00();
        return
    elseif nStep == 14 then
        task_14_00();
        return
    elseif nStep == 15 or nStep == 16 then
        task_15_00();
        return
    elseif nStep == 22 then
        task_22_00();
        return
    elseif nStep == 23 then
        task_23_00();
        return
    elseif nStep == 32 then
        task_32_zgq();
        return
    elseif nStep >= 33 then
        task_33_00();
        return
    end;
   	
    local szTalk = {
        "Tung ho祅h b鑞 phng, r鑤 cu閏 c騨g ch� v� m閠 ch� 摟筄� m� ra! H莥!..."
    };
    TalkEx("", szTalk);
end;

function talk_one()
    local szMsg = {
        "V穘 b鑙 ph鬾g m謓h Tri謚 Di猲 Ni猲 ti襫 b鑙 th玭g b竜 ti襫 b鑙 c莕  ph遪g b鋘 d� t閏 v� s� .",
        "Haha!  t� <sex>, kh玭g bi誸 t礽 ch琲 c� c馻 h� th� n祇?"
    };
    
    GivePlayerAward("Level_20", "hard");
	GivePlayerExp(SkeyBJShuxin,"shitaijinji2")		--事态紧急2
    SetTask(126, 2);
    if GetTask(125) == 2 and GetTask(124) == 2 then
        SetTask(111, 111);
    end;
    TalkEx("", szMsg);
end;

function talk_five()

    local szMsg = {
        "H� H莡 C莔 nh� v穘 b鑙 n th玭g b竜 v� m秐h S琻 H� X� T綾 c� kh� n╪g r琲 v祇 tay Xi H醓 gi竜, xin ti襫 b鑙 xem qua th� n祔!",
        " t� anh h飊g!",
        "C遪 nhi襲 ngi c莕 ph秈 th玭g b竜 n鱝, v穘 b鑙 甶 y!"
    };
    local nStep = 0;
    nStep = GetTask(TASK_FIVE);
    if nStep >= 2 and nStep < 5 then
        RemoveTrigger(GetRunningTrigger());
        SetTask(TASK_FIVE, nStep + 1);
        SetTask(128,2);
        DelItem(2,0,41,1);
        TalkEx("", szMsg);
        return
    end;
end;
