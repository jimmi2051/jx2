--兵马指挥使
--created by lizhi
--2005-9-10 11:38

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\WeekEnd\\task_main.lua");
Include("\\script\\task\\WeekEnd\\task_head.lua");
--201403活动
Include("\\script\\online_activites\\2014_03\\task_camp.lua")

function main()
	--活动
--	if WN_201403_CampTask_DealTask() == 1 then
--		return
--	end
	-------
  local szTalk = {
      "Oa Kh蕌 t nhi猲 xua qu﹏ t蕁 c玭g Trung Nguy猲, ai n蕐 u c╩ ph蒼!"
  };
  local szSay = {
		"Oa Kh蕌 t nhi猲 xua qu﹏ t蕁 c玭g Trung Nguy猲, ai n蕐 u c╩ ph蒼!",
		"Nh薾 頲 b秓 v藅 Чi T鑞g/GetCallBossItem"
  };
	if CheckTime(6) == 0 and CheckTime(0) == 0 then	--只有星期六，星期天才能完成运送货物的任务
		TalkEx("", szTalk);
		return
	end;

  if GetTask(TASK_GQ_DELIVER) ~= 0 then
      receive_goods();
      return
  end;
  
  if GetTask(TASK_GQ_KILLWK_START) == 1 then
      local szSay = {
          " t� <sex> gi髉 chuy觧 v藅 ph萴! Nh璶g hi謓 Oa Kh蕌 xua qu﹏ ti課 v祇 H秈 T﹏, kh玭g bi誸 <sex>gi髉 畊鎖 l� gi芻 甶 頲 kh玭g?",
          "Qu鑓 gia l﹎ nguy sao c� th� ng nh譶/kill_enemy",
          "Ta 產ng b薾!/end_say"
      };
      SelectSay(szSay);
      return
  end;
	if QueryTimes() > 0 and (CheckTime(6) == 1 or CheckTime(5) == 1 or CheckTime(0) == 1)then
		SelectSay(szSay);
    else
    	TalkEx("", szTalk);
    end;
end;
