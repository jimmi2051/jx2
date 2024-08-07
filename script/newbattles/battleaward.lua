Include("\\script\\vng\\trangbikimxa.lua");
--Create date:2007-3-2
--Author:yanjun
--Describe:战场奖励模块
--note:此脚本不宜乱被Include
SONG_ID = 1;
LIAO_ID = 2;

if IB_VERSION == 1 then
	g_szNeedItemName = "N� Oa Tinh Th筩h";
	g_nItemID = 504;
else
	g_szNeedItemName = "N� Oa Tinh Th筩h";
	g_nItemID = 504;
end;

tEquipInfo = 
{
	[1] = 	{	--都统装			
		[SONG_ID] = {--装备信息,需要军衔,消耗积分,消耗金子,消耗物品信息
					{{"T鑞g Й th鑞g chi課 kh玦",0,103,2231},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},
					{{"T鑞g Й th鑞g chi課 b祇",0,100,2231},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},
					{{"T鑞g Й th鑞g chi課 ph鬰",0,101,2231},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},
					},
		[LIAO_ID] = {
					{{"Li猽 Й th鑞g chi課 kh玦",0,103,2235},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},
					{{"Li猽 Й th鑞g chi課 b祇",0,100,2235},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},
					{{"Li猽 Й th鑞g chi課 ph鬰",0,101,2235},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},					
					}
			},
	[2] = 	{	--先锋装			
		[SONG_ID] = {--装备信息,需要军衔,消耗积分,消耗金子,消耗物品
					{{"T鑞g ti猲 phong hi謚 k�",0,102,2261},4,30000,1300,{g_szNeedItemName,2,1,g_nItemID,4}},
					{{"T鑞g ti猲 phong hi謚 ph�",0,102,2265},4,30000,1300,{g_szNeedItemName,2,1,g_nItemID,4}},
					},
		[LIAO_ID] = {
					{{"Li猽 ti猲 phong hi謚 k�",0,102,2271},4,30000,1300,{g_szNeedItemName,2,1,g_nItemID,4}},
					{{"Li猽 ti猲 phong hi謚 ph�",0,102,2275},4,30000,1300,{g_szNeedItemName,2,1,g_nItemID,4}},
					}
			},
	[3] = 	{	--将军装			
		[SONG_ID] = {--装备信息,需要军衔,消耗积分,消耗金子,消耗物品
					{{"T鑞g tng qu﹏ u kh玦",0,103,2241},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"T鑞g tng qu﹏ chi課 b祇",0,100,2241},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"T鑞g tng qu﹏ chi課 ph鬰",0,101,2241},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"T鑞g tng qu﹏ l謓h b礽",0,102,2281},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"T鑞g tng qu﹏ c� l謓h",0,102,2285},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"T鑞g l謓h ph�",0,102,2521},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					},
		[LIAO_ID] = {
					{{"Li猽 tng qu﹏ u kh玦",0,103,2245},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Li猽 tng qu﹏ chi課 b祇",0,100,2245},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Li猽 tng qu﹏ chi課 ph鬰",0,101,2245},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Li猽 tng qu﹏ l謓h b礽",0,102,2291},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Li猽 tng qu﹏ c� l謓h",0,102,2295},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Li猽 l謓h ph�",0,102,2531},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					}
			},
	[4] = 	{	--元帅装
		[SONG_ID] = {
					{{"T鑞g nguy猲 so竔 u kh玦",0,103,2251},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"T鑞g nguy猲 so竔 chi課 b祇",0,100,2251},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"T鑞g nguy猲 so竔 chi課 ph鬰",0,101,2251},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"T鑞g nguy猲 so竔 h� ph�",0,102,2301},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"T鑞g nguy猲 so竔 l謓h k�",0,102,2305},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"T鑞g so竔 ph�",0,102,2501},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"T鑞g so竔 k�",0,102,2505},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					},
		[LIAO_ID] = {
					{{"Li猽 nguy猲 so竔 u kh玦",0,103,2255},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Li猽 nguy猲 so竔 chi課 b祇",0,100,2255},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Li猽 nguy猲 so竔 chi課 ph鬰",0,101,2255},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Li猽 nguy猲 so竔 h� ph�",0,102,2311},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Li猽 nguy猲 so竔 l謓h k�",0,102,2315},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Li猽 so竔 ph�",0,102,2511},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Li猽 so竔 k�",0,102,2515},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					}	
			}
}
--战场奖励主入口
function BTA_Main()
	CalcBattleRank();
	local nCurRank = BT_GetData(PT_CURRANK);
	local selTab = {
			"Ta mu鑞 i trang b� Й th鑞g/#BTA_WantEquip(1)",
			"Ta mu鑞 i trang b� Ti猲 phong/#BTA_WantEquip(2)",
			"Ta mu鑞 i trang b� Tng qu﹏/#BTA_WantEquip(3)",
			"Ta mu鑞 i trang b� Nguy猲 so竔/#BTA_WantEquip(4)",
			"Ta mu鑞 bi誸 quy t綾 i ph莕 thng/BTA_KnowRule",
			"Ta s� quay l筰 sau!/nothing",
			}
	if abs(nCurRank) <= 2 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Qu﹏ h祄 c馻 ngi c遪 th蕄, kh玭g th� i ph莕 thng.");
		return 0;
	end;
	for i=1,6-abs(nCurRank) do	--这个是用来去掉一些选项的，看起来比较怪，看不懂就算了
		tremove(selTab,abs(nCurRank)-1);	
	end;
	tinsert(selTab, 1, "Ta mu鑞 i trang b� Kim X� - Nguy猲 So竔/DoiTrangBiKimXa_NguyenSoai_Menu")
--	tinsert(selTab, 1, "Ta mu鑞 i trang b� Kim X� - Tng Qu﹏/DoiTrangBiKimXa_TuongQuan_Menu")
	if (g_nNpcCamp == SONG_ID and nCurRank <= 0) or (g_nNpcCamp == LIAO_ID and nCurRank >= 0) then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ngi kh玭g  甶襲 ki謓 i trang b� phe <color=yellow>"..tCampNameZ[g_nNpcCamp].."<color> . Xin x竎 nh薾 l筰 qu﹏ h祄 c� ph秈 l� phe <color=yellow>"..tCampNameZ[g_nNpcCamp].."<color>.a");
		return 0;
	end;
	Say("<color=green>"..g_sNpcName.."<color>: Ngi c莕 i ph莕 thng g�?",getn(selTab),selTab);
end;
--战场奖励兑换规则说明
function BTA_KnowRule()
	Talk(1,"BTA_KnowRule2","<color=green>"..g_sNpcName.."<color>: <enter> фi <color=yellow>Trang b� Й th鑞g<color> qu﹏ h祄 ph秈 t� <color=yellow>T鑞g Й Th鑞g<color> tr� l猲. M鏸 trang b� c莕 <color=yellow>500 v祅g<color>, <color=yellow>15000 甶觤 t輈h l騳<color> v� <color=yellow>"..g_szNeedItemName.."<color><enter>фi <color=yellow>Trang b� Ti猲 phong<color> qu﹏ h祄 ph秈 t� <color=yellow>T鑞g Ti猲 Phong<color> tr� l猲. M鏸 trang b� c莕 <color=yellow>1300 v祅g<color>, <color=yellow>30000 甶觤 t輈h l騳<color>; v� <color=yellow>"..g_szNeedItemName.."<color> 40!");
end;

function BTA_KnowRule2()
	Talk(1,"BTA_Main","<color=green>"..g_sNpcName.."<color>: <enter>фi <color=yellow>Trang b� Tng qu﹏<color> qu﹏ h祄 ph秈 t� <color=yellow>T鑞g Tng Qu﹏<color> tr� l猲. M鏸 trang b� c莕 <color=yellow>2500 v祅g<color>, <color=yellow>60000 甶觤 t輈h l騳<color> v� <color=yellow>"..g_szNeedItemName.."<color> 10!<enter> фi <color=yellow>Trang b� Nguy猲 so竔 <color> qu﹏ h祄 ph秈 t� <color=yellow>T鑞g Nguy猲 So竔<color> tr� l猲. M鏸 trang b� c莕 <color=yellow>4000 v祅g<color>, <color=yellow>100000 甶觤 t輈h l騳<color> v� <color=yellow>"..g_szNeedItemName.."<color> 20!");
end;

function BTA_WantEquip(nType)
	local selTab = {};
	for i=1,getn(tEquipInfo[nType][1]) do
		tinsert(selTab,format(tEquipInfo[nType][g_nNpcCamp][i][1][1].."/#BTA_AffirmEquip(%d,%d)",nType,i));
	end;
	tinsert(selTab,"Ta mu鑞 xem trang b� kh竎/BTA_Main");
	tinsert(selTab,"Ta s� quay l筰 sau!/nothing");
	Say("<color=green>"..g_sNpcName.."<color>: Ngi c莕 i trang b� n祇",getn(selTab),selTab);
end;

function BTA_AffirmEquip(nType,nEquipIndex)
	local tEquip = tEquipInfo[nType][g_nNpcCamp][nEquipIndex][1];
	local selTab = {
				format("уng � i /#BTA_AffirmEquipFinal(%d,%d)",nType,nEquipIndex),
				"в ta suy ngh� l筰/nothing",
				}
	Say("<color=green>"..g_sNpcName.."<color>: Ngi ng � i <color=yellow>"..tEquip[1].."<color> ch�?",getn(selTab),selTab);
end;

function BTA_AffirmEquipFinal(nType,nEquipIndex)
	if BTA_CheckCondition(nType,nEquipIndex) == 1 then
		local tEquip = tEquipInfo[nType][g_nNpcCamp][nEquipIndex][1];
		local nBody = GetBody();
		local nRetCode = AddItem(tEquip[2],tEquip[3],tEquip[4]-1+nBody,1,1,-1,-1,-1,-1,-1,-1);
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 1 trang b�:"..tEquip[1]);
			WriteLog("[ph莕 thng chi課 tr薾]:"..GetName().."nh薾 頲 trang b� chi課 trng:"..tEquip[1]);
		else
			WriteLog("[ph莕 thng b� l鏸]:"..GetName().."nh薾 頲 trang b� ("..tEquip[1]..") l鏸, nRetCode:"..nRetCode);
		end;
	end;
end;
--检查是否满足兑换战场装备的所有要求
function BTA_CheckCondition(nType,nEquipIndex)
	if gf_JudgeRoomWeight(2,200) == 1 then
		local t = tEquipInfo[nType][g_nNpcCamp][nEquipIndex];
		local nNeedRank = t[2];
		local nNeedPoint = t[3];
		local nNeedMoney = t[4];
		local nNeedItemCount = t[5][5];
		local nCurRank = abs(BT_GetData(PT_CURRANK));	--因为入口处保证了相应军衔领取相应装备，所以这里不用判断宋辽阵营了
		local nCurPoint = BT_GetData(PT_TOTALPOINT);
		local nCurMoney = GetCash();
		local szItemName,nItemID1,nItemID2,nItemID3 = t[5][1],t[5][2],t[5][3],t[5][4];
		local nCurItemCount = GetItemCount(nItemID1,nItemID2,nItemID3);
		local szEquipName = t[1][1];
		if nCurRank < nNeedRank then
			Talk(1,"BTA_Main","<color=green>"..g_sNpcName.."<color>: Qu﹏ h祄 c馻 b筺 c遪 th蕄 kh玭g th� i <color=yellow>"..szEquipName.."<color>.");
			return 0;
		end;
		if nCurPoint < nNeedPoint then
			Talk(1,"BTA_Main","<color=green>"..g_sNpcName.."<color>: 觤 t輈h l騳 c馻 b筺 c遪 th蕄 qu�, kh玭g th� i <color=yellow>"..szEquipName.."<color>. B筺 c莕 c� th猰 <color=red>"..nNeedPoint.."<color> 甶觤 t輈h l騳");
			return 0;
		end;
		if nCurMoney < nNeedMoney*10000 then
			Talk(1,"BTA_Main","<color=green>"..g_sNpcName.."<color>: Ti襫 v祅g kh玭g , kh玭g th� i <color=yellow>"..szEquipName.."<color>. B筺 c莕 c� th猰 <color=red>"..nNeedMoney.."<color> v祅g");
			return 0;
		end;
		if nCurItemCount < nNeedItemCount then
			Talk(1,"BTA_Main","<color=green>"..g_sNpcName.."<color>: B筺 c莕 <color=yellow>"..nNeedItemCount.."<color> <color=yellow>"..szItemName.."<color> m韎 c� th� i<color=yellow>"..szEquipName.."<color>.");
			return 0;
		end;
		BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedPoint);	--扣积分
		Pay(nNeedMoney*10000);	--扣金子
		DelItem(nItemID1,nItemID2,nItemID3,nNeedItemCount);	--扣物品
		return 1;
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Kho秐g tr鑞g trong h祅h trang kh玭g !");
		return 0;
	end;
end;
