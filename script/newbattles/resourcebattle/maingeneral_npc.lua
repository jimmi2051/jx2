--filename:maingeneral_npc.lua
--create date:2006-06-05
--describe:粮草争夺战场中双方主将脚本
Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");

sSongGeneral = "H� l謓h ";
sLiaoGeneral = "Ti誹 Lan Чt";
-- Bit quy nh t鎛g t蕁 c玭g c馻 Th秓 c鑓
SONG_BIT = 2
LIAO_BIT = 6

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"Ch箉 th玦! L鯽 k衞 n n琲 r錳!");
	end;
	local selTab = {			
			"B鑙 c秐h/knowbackground",
			"Quy t綾 chi課 trng/knowbattlerule",
			"Nguy猲 So竔 ph竧 l謓h t鎛g t蕁 c玭g/battle_charge",
			"K誸 th骳 i tho筰/nothing",
			}
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Say("<color=green>"..sNpcName.."<color>: Lng th秓 c祅g nhi襲 c祅g c� l頸 trong chi課 u, nh璶g ph秈 c萵 th薾 v韎 th� d﹏, h� kh玭g d� g� i ph�.",getn(selTab),selTab);
end;

function knowbackground()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: Nh筺 M玭 Quan-Th秓 c鑓 chi課 ch鴄 nhi襲 lng th秓. Theo d� th竚 h錳 b竜, phe Li猽 c� kh� n╪g cho l輓h n cp b蕋 k� l骳 n祇, v� v藋 khi v祇 chi課 trng c莕 ph秈 tranh th� th阨 gian!");
	else
		sNpcName = sLiaoGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: Nh筺 M玭 Quan-Th秓 c鑓 chi課 ch鴄 nhi襲 lng th秓. Theo d� th竚 h錳 b竜, phe T鑞g c� kh� n╪g cho l輓h n cp b蕋 k� l骳 n祇, v� v藋 khi v祇 chi課 trng c莕 ph秈 tranh th� th阨 gian!");
	end;
end;

function knowbattlerule()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: <enter>1: Th阨 gian chi課 u 30 ph髏 <enter>2: Phe n祇 t輈h l騳 lng th秓 nhi襲 h琻 s� th緉g<enter>3: 觤 t輈h l騳 cao nh蕋<color=yellow>"..POINT_LIMITED.."<color><enter>4: Gi韎 h筺 pk<enter>5: Nh薾 頲 ph莕 thng c馻 Ho祅g  + 甶觤 t輈h l騳 <color=yellow>"..EMPEROR_AWARD_POINT.."<color> 甶觤  甶觤 t輈h l騳, kinh nghi謒 <color=yellow>"..floor(EMPEROR_AWARD_EXP/10000).."<color>v筺<enter>6: Л頲 b莡 l祄 ng玦 sao chi課 trng+甶觤 t輈h l騳 <color=yellow>"..BATTLE_STAR_AWARD_POINT.."<color> 甶觤  甶觤 t輈h l騳, kinh nghi謒 <color=yellow>"..floor(BATTLE_STAR_AWARD_EXP/10000).."<color> v筺");
end;

function wantaward()

end;