-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理50任务过程处理文件
-- By StarryNight
-- 2006/01/09 PM 15:24

--乙酉年 戊子月 戊子日 
--宜: 合帐 裁衣 教牛马 馀事勿取 
--忌: 入宅 动土 破土 嫁娶 作灶 造船 
--吉神宜趋: 官日 敬安 金匮  
--凶神宜忌: 月建 小时 土府 月厌 地火  
--五行: 霹雳火  建执位  
--彭祖百忌: 戊不受田田主不祥 子不问卜自惹祸殃 

-- ======================================================

-- 引用剧情任务文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--领取任务打倒苗岭土司收集10把土司佩刀
function task_000_00()
	
local strTalk = {
		"Xin h醝, ti襫 b鑙 c� ph秈 l� {Tr莕 L藀 Ho祅h}?",
		"Ch輓h l� ta. <sex> t譵 ta c� vi謈 g� kh玭g?",
		"Nghe n鉯 ti襫 b鑙 r蕋 tinh th玭g phng ng� � {Чi L齷, c� th� gi髉 t筰 h� d辌h b鴆 th� n祔 kh玭g?",
		"C� ph秈 Tr辬h Qu竛 Chi n鉯, phi襫 <sex> 甶襲 tra xem m鑙 quan h� gi鱝 Mi猽 L躰h v� Xi H醓 Gi竜?",
		"ng v藋.",
		"Ta c騨g 產ng c� chuy謓 n祔 mu鑞 nh� <sex>.",
		"Xin ti襫 b鑙 c� n鉯.",
		"B鋘 Th� Ty � Mi猽 L躰h ng祔 c祅g t竎 lo筺, ch髇g cp b鉩, 鴆 hi誴 th秓 d﹏. M蕐 huynh  c馻 ta c騨g b� ch髇g b鴆 ch誸. <sex> c� th� thay ta b竜 th� cho c竎 huynh  蕐 頲 kh玭g?",
		"T筰 h� s� gi髉 ti襫 b鑙 b竜 th�.",
		"H穣 n t莕g 2 Y課 T� ng gi誸 b鋘 Th� Ty 甧m 10 B閕 o v� y.",
		"Ti襫 b鑙 i tin vui c馻 t筰 h�.",
		}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV50_ID,2);
	CreateTrigger(0,257,KILL_DL_MLTS);
	GivePlayerExp(SkeyDali,"fanyixinjian")
	TaskTip("дn t莕g 2 Y課 T� ng gi誸 Mi猽 L躰h Th� Ty l蕐 10 B閕 o");
	Msg2Player("дn t莕g 2 Y課 T� ng gi誸 Mi猽 L躰h Th� Ty l蕐 10 B閕 o");
	return
end


--已经领取收集土司佩刀任务
function task_001_00()

local strTalk = {
	"дn t莕g 2 Y課 T� ng gi誸 Mi猽 L躰h Th� Ty 甧m v� 10 B閕 o.",
	}		

	if GetItemCount(2,0,368) >= 10 then		
		strTalk = {
			"<sex> l蕐 頲 B閕 o ch璦?",
			"T筰 h�  l蕐 頲 {B閕 o}! Ti襫 b鑙 xin xem qua!",
			"ng l� B閕 o, 產 t� <sex>.",
			"Ti襫 b鑙, v藋 c遪 b鴆 th瓍",
			"Зy l� th� T閏 trng Mi猽 L躰h g鰅 cho Xi H醓 gi竜, trong th� n鉯 r籲g th� l鵦 c馻 Xi H醓 gi竜 hi謓 gi� r蕋 m筺h,  g﹜ s� ch� � n gi韎 nh﹏ s� V� L﹎. Xi H醓 gi竜 nh蕋 c� nh蕋 ng n猲 th薾 tr鋘g. <sex> n猲 n {Mi猽 L躰h} t譵 {T閏 trng}.",
			" t� ti襫 b鑙!",
			}
		TalkEx("",strTalk);
		DelItem(2,0,368,10);
		RemoveTrigger(GetTrigger(KILL_DL_MLTS));
		SetTask(TASK_DL_LV50_ID,3);
		TaskTip("дn g苝 T閏 trng Mi猽 L躰h");
		Msg2Player("дn g苝 T閏 trng Mi猽 L躰h");
		GivePlayerAward("Level_50","xn_step_1");
		GivePlayerExp(SkeyDali,"baochou")
		return
	--补发土司死亡触发器
	elseif GetTrigger(KILL_DL_MLTS) == 0 then
		TalkEx("",strTalk);
		CreateTrigger(0,257,KILL_DL_MLTS);
		TaskTip("дn t莕g 2 Y課 T� ng gi誸 Mi猽 L躰h Th� Ty l蕐 10 B閕 o");
  	Msg2Player("дn t莕g 2 Y課 T� ng gi誸 Mi猽 L躰h Th� Ty l蕐 10 B閕 o");
  	return
  else
		TalkEx("",strTalk);
		return
	end
end

--已经完成土司佩刀任务还没与苗岭族长对话
function task_002_00()

local strTalk = {
	"<sex> c� n Mi猽 L躰h 総 s� t譵 th蕐 T閏 trng",
	}
	TalkEx("",strTalk);
	return
end