--filename:druggist_npc.lua
--create date:2006-12-19
--describe:主战场中战场药品军需官脚本
Include("\\settings\\static_script\\kf_newbattles\\mainbattle\\mainbattle_head.lua");
g_NpcName = "Qu﹏ nhu quan";
function main()
	local nNpcIndex = GetTargetNpc();
	local selTab = {
				"Nh薾 mi詎 ph� dc ph萴 chi課 trng/get_free_medicine",
				"фi 甶觤 t輈h l騳 l蕐 dc ph萴 chi課 trng/buy_medicine",
				"K誸 th骳 i tho筰/nothing",
				}
	local nPlayerCamp = BT_GetCamp();
	local nResourceCamp = GetGlbValue(GLB_RESOURCE);
	local szSaySth = "";
	if nPlayerCamp ~= nResourceCamp then
		tremove(selTab,1);	--失败方不能领取免费药
		tremove(selTab,1);	--失败方不能用积分换专用药
		if random(1,100) == 1 then
			NpcChat(nNpcIndex,"Hi謓 ch璦 c� dc ph萴, xin quay l筰 sau!");
		end;
		szSaySth = "Hi謓 ch璦 c� dc ph萴, xin quay l筰 sau!";
	else
		if random(1,100) == 1 then
			NpcChat(nNpcIndex,"Mu鑞 mua dc ph萴 c� n ch� ta xem th�.");
		end;
		szSaySth = "Ch� ta cung c蕄 m閠 s� thu鑓 mi詎 ph�, m阨 xem qua!";
	end;
	Say("<color=green>"..g_NpcName.."<color>: "..szSaySth,getn(selTab),selTab);
end;

function get_free_medicine()
	if BT_GetData(PTNC_GOT_MEDICINE) == 1 then
		Talk(1,"main","<color=green>"..g_NpcName.."<color>: Dc ph萴 kh玭g nhi襲, m鏸 ngi ch� 頲 nh薾 m閠 l莕.");
		return 0;
	end;
	if gf_Judge_Room_Weight(3,300) == 1 then
		give_medicine();
	else
		Talk(1,"","<color=green>"..g_NpcName.."<color>: Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!");
	end;
end;

function give_medicine()
	BT_SetData(PTNC_GOT_MEDICINE,1);
	AddItem(tBattleItem[9][2],tBattleItem[9][3],tBattleItem[9][4],30);
	AddItem(tBattleItem[10][2],tBattleItem[10][3],tBattleItem[10][4],30);
	AddItem(tBattleItem[11][2],tBattleItem[11][3],tBattleItem[11][4],30);
	Msg2Player("B筺 nh薾 頲 m閠 輙 thu鑓 chuy猲 d鬾g");
end;

function buy_medicine()

end;