--梁山boss活动大使
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\script\\online\\liangshanboss\\lsb_daliy_task.lua")

Activity_Npc_Name = "<color=green>Чi S� ho箃 ng: <color>";

Item_table1 = {2,1,30384,"Lng S琻 M藅 B秓 Rng"};
Item_table2 = {2,1,30385,"Ch譨 kh鉧 v祅g Lng S琻"};
Coin_cost = 50;
Item_cost = 100;


tbSay_201206 = {
		"\n Gi韎 thi謚 ho箃 ng/introduce_201206",
		"\n Nhi謒 v� ng祔/daily_task_201206",
		"\n D飊g Lng S琻 M藅 B秓 Rng i ch譨 kh鉧 v祅g Lng S琻/exchange_201206",
		};
		
sTitle_201206 = "Hoan ngh猲h tham gia ho箃 ng ch祇 m鮪g Phi猲 B秐 m韎. Ph莕 thng l� Thi猲 Cang L謓h, trang b� Hi猲 Vi猲, c遪 c竎 ph莕 thng phong ph� kh竎 產ng ch� b筺, h穣 mau tham gia"


function introduce_201206()
	if LSB_IsActivityOpen() ~= 1 then
		Talk(1,"",Activity_Npc_Name.."Event  h誸 h筺");
		return 0;
	end
	local tbSay = {
	"\n Ho箃 ng 1: Khi猽 chi課 Boss Чi Ho祅g Kim/Activity1_201206",
	"\n Ho箃 ng 2: Tri謚 g鋓 Lng S琻 h祇 ki謙/Activity2_201206",
	"\n Ho箃 ng 3: M� Lng S琻 M藅 B秓 Rng/Activity3_201206",
	--"\n返回上一级/main",
	"\n T筰 h� ch� xem qua th玦/nothing",
	};
	Say(Activity_Npc_Name.."Phi猲 b秐 m韎 m�, T﹜ B綾 li襫 d藋 s鉵g, Lng S琻 h祇 ki謙 mang theo b秓 v藅 kh緋 n琲 th╩ d� tin t鴆. Ho箃 ng n祔 ch� d祅h cho ngi ch琲 c蕄 <color=red>80<color> tr� l猲  gia nh藀 h� ph竔. ",getn(tbSay),tbSay);
end

function Activity1_201206()
	local tbSay = {
	"\n Quay v� c蕄  trc /introduce_201206",
	"T筰 h� ch� xem qua th玦/nothing",
	};
	Say(Activity_Npc_Name.."M鏸 ng祔 12:30, 15:30, 19:30, 22:30 s� xu蕋 hi謓 Boss Чi Ho祅g Kim Lng S琻, nh b筰 s� nh薾 頲 Thi猲 Cang L謓h, trang b� Hi猲 Vi猲. ",getn(tbSay),tbSay);
end

function Activity2_201206()
	local tbSay = {
	"\n Quay v� c蕄  trc /introduce_201206",
	"T筰 h� ch� xem qua th玦/nothing",
	};
	Say(Activity_Npc_Name.."\n\t M鏸 ng祔 gi誸 qu竔 � xung quanh Phng Tng Ph� nh薾 頲 Lng S琻 t輓 v藅, thu th藀  9 c竔 c� th� tri謚 g鋓 Lng S琻 h祇 ki謙, m鏸 ng祔 5 l莕. \n\t C騨g c� th� mua Xuy猲 V﹏ Ti詎 � Ng� C竎  tri謚 g鋓 Lng S琻 h祇 ki謙--kh玭g h筺 ch� s� l莕 mua.\n D飊g c竎h th鴆 n祇 c騨g c� th� tri謚 g鋓 Ho祅g Kim Чi Boss, ngi g鋓 ra s� nh薾 頲 Thi猲 Cang L謓h.",getn(tbSay),tbSay);
end

function Activity3_201206()
	local tbSay = {
	"\n Quay v� c蕄  trc /introduce_201206",
	"T筰 h� ch� xem qua th玦/nothing",
	};
	Say(Activity_Npc_Name.."\n\t Tham gia ho箃 ng nh薾 頲 Lng S琻 M藅 B秓 Rng, d飊g ch譨 kh鉧 v祅g m� B秓 Rng  nh薾 ph莕 thng. \n\t M� 1 B秓 Rng nh薾 頲 1 m秐h Thi猲 Cang (d飊g  i Thi猲 Cang L謓h), ph莕 thng l韓 nh蕋 l� Thi猲 Cang L謓h, Чi мnh H錸 Thi猲 Th筩h Th莕 Th筩h.\n\t C� th� mua ch譨 kh鉧 v祅g Lng S琻 �  Ng� C竎, c騨g c� th� d飊g Lng S琻 M藅 B秓 Rng i v韎 t筰 h�. ",getn(tbSay),tbSay);
end

function daily_task_201206()
	if LSB_IsActivityOpen() ~= 1 then
		Talk(1,"",Activity_Npc_Name.."Event  h誸 h筺");
		return 0;
	end
	local tbSay = {
	"\n Nh苩 Чi B秓 Rng c馻 Boss Ho祅g Kim (%s)/task_1",
	"\n Tri謚 g鋓 5 l莕 Lng S琻 h祇 ki謙 (%s)/task_2",
	"\n M� 1 Lng S琻 M藅 B秓 Rng (%s)/task_3",
	--"\n返回上一级/main",
	"\n T筰 h� ch� xem qua th玦/nothing",
	};
	tbSay[1] = format(tbSay[1],return_status(89));
	tbSay[2] = format(tbSay[2],return_status(90));
	tbSay[3] = format(tbSay[3],return_status(91));
	Say(Activity_Npc_Name.."Ti誴 nh薾 nhi謒 v� ng祔  nh薾 th猰 ph莕 thng. ",getn(tbSay),tbSay);
end

function exchange_201206()
	if LSB_IsActivityOpen() ~= 1 then
		Talk(1,"",Activity_Npc_Name.."Event  h誸 h筺");
		return 0;
	end
	local tbSay = {
	"\n T筰 h� mu鑞 i/deal_exchange_201206",
	--"\n返回上一级/main",
	"\n T筰 h� ch� xem qua th玦/nothing",
	};
	Say(Activity_Npc_Name.."\n\t D飊g Lng S琻 M藅 B秓 Rng i ch譨 kh鉧 v祅g v韎 t筰 h�. \n\t 100 c竔 Lng M藅 B秓 Rng + 50 v祅g=1 ch譨 kh鉧 v祅g Lng S琻",getn(tbSay),tbSay);
end

function deal_exchange_201206()
	local nCount1 = floor(GetCash() / Coin_cost*10000);
	local nCount2 = floor(GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) / Item_cost);--梁山密宝箱数目
	AskClientForNumber("call_exchage_201206",0,min(nCount1,nCount2),"Nh藀 s� lng i","");
end

function call_exchage_201206(nNum)
	if gf_Judge_Room_Weight(1,nNum," ") ~= 1 then
    Talk(1,"",Activity_Npc_Name.."Kh玭g gian h祅h trang kh玭g ");
		return 0;
  end
  if GetCash() < nNum * Coin_cost * 10000 then
  	Talk(1,"",Activity_Npc_Name..format("V祅g trong h祅h trang kh玭g  %d",nNum * Coin_cost ));
  	return 0;
  end
  if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < nNum * Item_cost then
  	Talk(1,"",Activity_Npc_Name..format("S� lng %s trong h祅h trang kh玭g  %d c竔",Item_table1[4],nNum * Item_cost));
  	return 0;
  end
	if Pay(nNum * Coin_cost * 10000) == 1 and DelItem(Item_table1[1],Item_table1[2],Item_table1[3],nNum * Item_cost) == 1 then
		gf_AddItemEx2({Item_table2[1],Item_table2[2],Item_table2[3],nNum}, Item_table2[4], "Чi S� ho箃 ng", "фi Lng S琻 M藅 B秓 Rng", 0, 1)
	end
end