-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理30,62任务过程处理文件
-- By StarryNight
-- 2006/01/13 PM 10:34

--乙酉年 戊子月 癸已日 
--宜: 祭祀 塑绘 开光 裁衣 冠笄 嫁娶 纳采 拆卸 修造 动土 竖柱 上梁 安床 移徙 入宅 安香 结网 捕捉 畋猎 伐木 进人口 放水 
--忌: 出行 安葬 修坟 开市 
--吉神宜趋: 五富 益後  
--凶神宜忌: 劫煞 小耗 复日 重日 元武  
--每日胎神占方: 占房床房内北 
--五行: 长流水 执执位 
--冲: 冲猪(丁亥)煞东 
--彭祖百忌: 癸不词讼理弱敌强 已不远行财物伏藏 

-- ======================================================

-- 引用剧情任务文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--与刘典对话领取黑猩猩任务
function task_000_00()

local strTalk = {
	"Чi L� C鵸 Ch�  b� H綾 Tinh Tinh cp 甶, c� th� gi髉 ta t譵 ch髇g v� kh玭g?",
	"{H綾 Tinh Tinh}  � u?",
	"Ch髇g � T﹜ Song B秐 N筽, ngi n  t譵 10 t蕀 Чi L� C鵸 Ch� nh�!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV75_ID,5);
	RemoveTrigger(GetTrigger(TALK_DL_BAIXIAOSHENG));--删掉百晓生对话触发器
	CreateTrigger(0,264,KILL_DL_JOCKO);
	TaskTip("дn T﹜ Song B秐 N筽 thu th藀 10 t蕀 Чi L� C鵸 Ch�");
	Msg2Player("дn T﹜ Song B秐 N筽 thu th藀 10 t蕀 Чi L� C鵸 Ch�");
	GivePlayerAward("Level_75","xn_step_1");
	GivePlayerExp(SkeyDali,"dalirizi")
	return
end	
	
--领取黑猩猩任务后1
function task_001_00()

local strTalk = {
	"H綾 Tinh Tinh � T﹜ Song B秐 N筽, ngi n  t譵 10 t蕀 Чi L� C鵸 Ch�.",
	}
	
	--判断大理旧志残片数目
	if GetItemCount(2,0,379) >= 10 then
		DelItem(2,0,379,10);
		strTalk = {
			"V� r錳 �, mau a ta xem n祇.",
			"�",
			"Ta  x竎 nh 頲 th﹏ th� c馻 Tr辬h Qu竛 Trinh.",
			"R鑤 cc l� ngi th� n祇?",
			"V祇 cu鑙 th阨 Л阯g, Tr辬h M穒 T� cp ng玦 l藀 n猲 Чi Trng H頿 Qu鑓. Mi m蕐 n╩ sau Tri謚 Thi謓 Ch輓h v� Dng Can Trinh cp ng玦. Dng Can Trinh c遪 gi誸 h筰 c� d遪g t閏 h� Tr辬h, nh鱪g ngi c遪 s鉻 l筰 r阨 kh醝 Чi L� sang l竛h n筺 � Чi T鑞g. Sau  祅 T� B譶h ki課 l藀 l筰 Чi L� cho g鋓 Tr辬h gia quay v� v� s誴 v祇 m閠 trong 6 i gia t閏 � Чi L�, nh璶g h� Tr辬h quy誸 kh玭g quay l筰. Tr辬h Qu竛 Chi l� m閠 trong nh鱪g h藆 nh﹏ c馻 d遪g t閏 h� Tr辬h.",
			}
		TalkEx("task_001_01",strTalk);	
		return
	end
	
	--补发黑猩猩死亡触发器
	if GetTrigger(KILL_DL_JOCKO) == 0 then
		TalkEx("",strTalk);
		CreateTrigger(0,264,KILL_DL_JOCKO);
		TaskTip("дn T﹜ Song B秐 N筽 thu th藀 10 t蕀 Чi L� C鵸 Ch�");
		Msg2Player("дn T﹜ Song B秐 N筽 thu th藀 10 t蕀 Чi L� C鵸 Ch�");
		return
	end
		
	TalkEx("",strTalk);
	return
end

--领取黑猩猩任务后2
function task_001_01()

local strTalk = {	
	"L祄 sao bi誸 c� ta l� {h藆 nh﹏ c馻 Tr辬h gia}?",
	"D遪g t閏 Tr辬h gia x璦 nay c� c竎h t t猲 ri猲g, Tr辬h Qu竛 Chi c騨g kh玭g n籱 ngo筰 l�.",
	"Vi謈 n祔 c騨g ch璦 ch綾 ch緉 l緈, ch糿g qua l� s� tr飊g h頿 th玦.",
	"C遪 n鱝, Tr辬h Gia t t猲 lu玭 c� ch� Chi y l� t 甶觤 ri猲g c馻 B筩h t閏 x璦 nay. Tr辬h Qu竛 Chi ch th鵦 thu閏 gia t閏 h� Tr辬h r錳.",
	"C竎h t t猲 n祔 t筰 h� c� nghe Tri謚 Di猲 Ni猲 nh綾 n. Nh璶g r鑤 cu閏 c� ta n {Чi L齷  l祄 g�?",
	"Ta c騨g kh玭g r�, ngi n猲 g苝 c� 蕐 h醝 xem sao.",
	"Л頲! T筰 h� s� 甶 ngay!",
	}
	TalkEx("",strTalk);
	RemoveTrigger(GetTrigger(KILL_DL_JOCKO));
	SetTask(TASK_DL_LV75_ID,6);
	Msg2Player("дn Чi L� h醝 v� th﹏ th� c馻 Tr辬h Qu竛 Chi");
	TaskTip("дn Чi L� h醝 v� th﹏ th� c馻 Tr辬h Qu竛 Chi");
	GivePlayerAward("Level_75","xn_step_2","legs","Level_57");
	GivePlayerExp(SkeyDali,"heixingxing")
end

function task_002_00()
	local strTalk = {
		"G苝 Tr辬h Qu竛 Chi h醝 v� th﹏ th� c馻 c� ta."
		}
	TalkEx("",strTalk);
end