--filename:maingeneral_npc.lua
--create date:2006-05-30
--describe:炮台争夺战场中双方主将脚本
Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");

sSongGeneral = "Dng T竔 H璶g";
sLiaoGeneral = "Ti猽 Vi詎 S琻";
-- Bit quy nh t鎛g t蕁 c玭g c馻 Ph竜 i
SONG_BIT = 3
LIAO_BIT = 7

function main()
	local nNpcIndex = GetTargetNpc();
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIndex);
	if BT_GetDistance(nMapX,nMapY) >= 23 then
		return 0;
	end;
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
	Say("<color=green>"..sNpcName.."<color>: Ph竜 i l� c� 甶觤 quan tr鋘g m� ch髇g ta c莕 chi誱 l躰h",getn(selTab),selTab);
end;

function knowbackground()
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: Chi課 d辌h l莕 n祔 c莕 ph秈 chi誱 gi� ph竜 i, kh鑞g ch� c鯽 秈 Nh筺 M玭 Quan. C竎 chi課 binh! Ti課 l猲!!!");
	else
		sNpcName = sLiaoGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: Chi課 d辌h l莕 n祔 c莕 ph秈 chi誱 gi� ph竜 i, kh鑞g ch� c鯽 秈 Nh筺 M玭 Quan. C竎 chi課 binh! Ti課 l猲!!!");
	end;
end;

function knowbattlerule()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: <enter>1: Phe n祇 chi誱 l躰h ph竜 i Nh筺 M玭 Quan l﹗ nh蕋 s� chi課 th緉g<enter>2: Khu v鵦 chi課 u, kh玭g h筺 ch� pk<enter>3: 觤 t輈h l騳 t鑙 產 <color=yellow>"..POINT_LIMITED.."<color><enter>4: Nh薾 頲 <color=yellow>"..EMPEROR_AWARD_POINT.."<color> 甶觤  甶觤 t輈h l騳, kinh nghi謒 <color=yellow>"..floor(EMPEROR_AWARD_EXP/10000).."<color>v筺<enter>5: Л頲 b莡 l祄 Ng玦 sao chi課 trng+甶觤 t輈h l騳 <color=yellow>"..BATTLE_STAR_AWARD_POINT.."<color> 甶觤  甶觤 t輈h l騳, kinh nghi謒 <color=yellow>"..floor(BATTLE_STAR_AWARD_EXP/10000).."<color> v筺");
end;
