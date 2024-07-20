--filename:maingeneral_npc.lua
--create date:2006-05-30
--describe:村落争夺战场中双方主将脚本
Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\villagebattle_head.lua");

sSongGeneral = "Phan Nh﹏ M�";
sLiaoGeneral = "Gia Lu藅 Sa";

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"Ch箉 th玦! L鯽 k衞 n n琲 r錳!");
	end;
	local selTab = {
			"B鑙 c秐h/knowbackground",
			"Quy t綾 chi課 trng/knowbattlerule",
			"K誸 th骳 i tho筰/nothing",
			}
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Say("<color=green>"..sNpcName.."<color>: � Th玭 trang chi課 ch� y誹 t譵 th� l躰h th� d﹏, tr竛h g﹜ thng vong!",getn(selTab),selTab);
end;

function knowbackground()
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: Bi誸 ngi bi誸 ta, tr╩ tr薾 tr╩ th緉g, ta ch� y誹 t譵 th� l躰h th� d﹏, nh� h� gi髉 ");
	else
		sNpcName = sLiaoGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: Bi誸 ngi bi誸 ta, tr╩ tr薾 tr╩ th緉g, ta ch� y誹 t譵 th� l躰h th� d﹏, nh� h� gi髉 ");
	end;
end;

function knowbattlerule()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: <enter>1: Phe n祇 t譵 頲 Th� l躰h Th� d﹏ trc s� gi祅h chi課 th緉g<enter>2: Th阨 gian: 30 ph髏. N誹 2 b猲 u kh玭g t譵 頲 Th� d﹏ s� d鵤 theo bc  t輓h, b猲 n祇 c� s� bc ho祅 th祅h nhi襲 h琻 s� gi祅h th緉g l頸 <enter>3: N誹 s� bc nh� nhau xem nh� h遖<enter>4: Kh玭g gi韎 h筺 pk nh璶g khi ti猽 di謙 tng s� i phng s� kh玭g nh薾 頲 甶觤 t輈h l騳<enter>5: 觤 t輈h l騳 cao nh蕋 <color=yellow>"..POINT_LIMITED.."<color><enter>6: Nh薾 頲 ph莕 thng c馻 Ho祅g  + 甶觤 t輈h l騳<color=yellow>"..EMPEROR_AWARD_POINT.."<color> 甶觤  甶觤 t輈h l騳, kinh nghi謒 <color=yellow>"..floor(EMPEROR_AWARD_EXP/10000).."<color>v筺<enter>7: Л頲 b莡 l祄 ng玦 sao chi課 trng+甶觤 t輈h l騳<color=yellow>"..BATTLE_STAR_AWARD_POINT.."<color> 甶觤  甶觤 t輈h l騳, kinh nghi謒 <color=yellow>"..floor(BATTLE_STAR_AWARD_EXP/10000).."<color> v筺");
end;

function wantaward()

end;
