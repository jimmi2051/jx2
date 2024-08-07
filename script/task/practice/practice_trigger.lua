--修炼触发器
--created by lizhi
--2005-9-10 16:26

Include("\\script\\task\\practice\\practice_head.lua"); --修炼的脚本
Include("\\script\\task\\practice\\practice_main.lua");

randomseed(GetGameTime());

function QT_GetData(row, datatype)        --取得固定row行datatype列的单元内容
	local tempdata = QT_FILE:getCell(row, QT_TYPE[datatype])
	if tonumber(tempdata) == nil then
		return tempdata
	else
		return tonumber(tempdata)
	end;
end;

function Ask_Question()
    local nRow = random(2, QT_ROWCOUNT);
    local AnswerTable = {};
    local AnswerIndex = {};
    
    local szQuestion = QT_GetData(nRow, "Question");
    AnswerTable[1] = QT_GetData(nRow, "CorrectAnswer").."/right_answer";
    AnswerTable[2] = QT_GetData(nRow, "Answer2").."/wrong_answer";
    AnswerTable[3] = QT_GetData(nRow, "Answer3").."/wrong_answer";
    AnswerTable[4] = QT_GetData(nRow, "Answer4").."/wrong_answer";
    
    local szSay = "Say("..format("%q",szQuestion)..",4,";
    --随机构造答案顺序
    for i=1, 4 do
        while 1 do
            local j = random(1, 100);
            if AnswerIndex[j] == nil then
                AnswerIndex[j] = AnswerTable[i];
                break
            end;
        end;
    end;
    local i = 0;
    for index, value in AnswerIndex do
        if i == 3 then
            szSay = szSay..format("%q", value)..","..ANSWER_TIME..")";
        else
            szSay = szSay..format("%q", value)..",";
        end;
        i = i + 1;
    end;
    dostring(szSay);
end;

function Leave_Game()
    practice_end();
    --玩家退出时，保存RV并在下次等入时用RV(城市重生点，非退出点)
	SetLogoutRV(1);
	--print("practice debug : Leave_Game");
end;

function Leave_Map()
    practice_end();
    --print("practice debug : Leave_map");
end;

function Question_OnTimer()
    if random(0, 2) == 1 then
        --提问
        Ask_Question();
        --暂时使用
        ContinueTimer(GetTrigger(TIME_ANSWER));
        SetTask(TASK_ANSWER, 0);
        --
        --print("practice debug : Qustion_OnTimer");
    end;
end;

function Practice_OnTimer()
    --修为增长变成普通速度
    SetPopBoost(NORMAL_SPEED);
    PauseTimer(GetTrigger(TIME_PRACTICE));  --暂停计时器
    Msg2Player("сng k誸 th骳, t鑓  tu luy謓 tr� l筰 b譶h thng")
    --print("practice debug : Practice_OnTimer");
end;

function Answer_OnTimer()
    SetTask(TASK_ANSWER, 1);
    PauseTimer(GetRunningTrigger());
    --print("practice debug : Answer_OnTimer");
end;

function right_answer()
    --给予奖励
    if GetTask(TASK_ANSWER) == 0 then   --如果在时间内回答
        Msg2Player("you are right");
        RemoveTrigger(GetTrigger(TIME_ANSWER));
        CreateTrigger(1, 302, TIME_ANSWER);
    end;
end;

function wrong_answer()
    --提示一下？没有惩罚
    RemoveTrigger(GetTrigger(TIME_ANSWER));
    CreateTrigger(1, 302, TIME_ANSWER);
end;