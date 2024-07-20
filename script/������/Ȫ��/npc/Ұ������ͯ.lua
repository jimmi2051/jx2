--function main()
--	Talk(1,"","<color=green>幼童<color>：我肚子好饿……")
--end;

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho箃 ng trung thu : ".."Ti觰 ng"		--此处分为2段只是为了不增加新的翻译
g_szInfoHead = "<color=green>a b�<color>: "

function main()
	if is_mooncake_viet_open() == 0 then
		return
	end
	local selTab = {
				"Ta s� 搇� x讛 cho mu閕, mu閕 i cho ta 1 c﹜ N課 V祅g nh�!/bug_candle",
				"Ta s� quay l筰 sau.!/no",
				}
	Say(g_szInfoHead.."Ho箃 ng \"Truy t譵 l錸g n may m緉\" di詎 ra t� 05-09-2008 n 24:00 ng祔 05-10-2008. L錸g n s� xu蕋 hi謓 T� 11:00 n 14:00 v� t� 21:00 n 24:00 v祇 c竎 ng祔 Th� 6, Th� 7 v� Ch� nh藅 h籲g tu莕. Trong th阨 gian n祔, ngi ch琲 n NPC Ti觰 уng  nh薾 揘課 v祅g�. � tr筺g th竔 chi課 u, ngi ch琲 mang N課 V祅g n c竎 b秐   th緋 s竛g L錸g n May M緉, s� c� c� h閕 nh薾 頲 ph莕 thng 甶觤 kinh nghi謒 v� c竎 v藅 ph萴 c� gi� tr�.",getn(selTab),selTab);
end

function bug_candle()
	if GetCash() < 1000 then
		Say(g_szInfoHead.."Mu閕 kh玭g i u v� s� huynh (t� t�) ch璦 l� x� cho mu閕.",1,"! Ta qu猲 m蕋./no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
		return
	end
	if pay_ex(1000) == 1 then
		add_item_ex("N課 v祅g",2,1,30029,1)
	else
		Say(g_szInfoHead.."Mu閕 kh玭g i u v� s� huynh (t� t�) ch璦 l� x� cho mu閕.",1,"! Ta qu猲 m蕋./no")
		return
	end
end

function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName);
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName);
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function pay_ex(nNum)
	local nRetCode = 0;
	nRetCode = Pay(nNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Pay("..nNum..") Failed, return value = "..nRetCode);
		return 0
	end
end

function no()
end

