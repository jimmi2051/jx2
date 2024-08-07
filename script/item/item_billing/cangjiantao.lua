--脚本名称：IB服务器藏剑装备包换脚本
--脚本功能：使用藏剑装备包兑换对应的藏剑装备
--功能策划人：刘希
--代码编写人：赵贵春
--代码编写时间：2007-01-10
--代码修改记录：
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
--=============================公共变量定义区=============================
	cangjian_bag_name = {"B秓 rng T祅g Ki誱 u qu竛","B秓 rng T祅g Ki誱 y gi竝","B秓 rng T祅g Ki誱 hoa kh�","B秓 rng T祅g Ki誱 trang s鴆","B秓 rng T祅g Ki誱 v� kh�"}
	att_wt = {35,80,50,185,5}
	use_level_min = 70		--是否提醒使用的最低等级
function OnUse(idx)
	local id = tonumber(idx)
	--物品信息的获取和整理
	local bag_diff = GetItemParticular(id) - 1058
	--流派判断
	local player_Route = GetPlayerRoute()
	if player_route_chk(player_Route) == 0 then
		Talk(1,"","B筺 ch璦 gia nh藀 m玭 ph竔, kh玭g th� d飊g v藅 ph萴 n祔!")
		return
	elseif GetLevel() < use_level_min then
		Say("Ъng c蕄 b筺 kh玭g th� d飊g"..cangjian_bag_name[bag_diff]..", hay l� mu鑞 nh薾"..cangjian_bag_name[bag_diff].."?",
			2,
			"Ta mu鑞 s� d鬾g!/#use_cangjian_bag_det("..bag_diff..")",
			"в ta suy ngh� l筰/end_dialog"
			)
	else
		Say("B筺 ng � d飊g"..cangjian_bag_name[bag_diff].."  nh薾 trang b� 鴑g v韎 m玭 ph竔?",
			2,
			"Ta mu鑞 s� d鬾g!/#use_cangjian_bag_det("..bag_diff..")",
			"в ta suy ngh� l筰/end_dialog"
			)
	end
end
function use_cangjian_bag_det(bag_diff)
	--玩家负重和空间检测
	if Zgc_pub_goods_add_chk(1,att_wt[bag_diff]) ~= 1 then
		return
	end
	--准备信息定义
	local canjiantao={
		{},
		{--藏剑帽子名字-----------------藏剑衣服名字------------藏剑裤/鞋名字-----------藏剑玉佩名字---------藏剑武器-副类：帽子、衣服、裤/鞋、玉配-小类-武器副类-小类
		{"Kim Cang Dao Qu竛","Kim Cang Dao Thng","Kim Cang Dao Trang","Kim Cang Dao B閕","Kim Cang Dao o",103,100,101,102,3,271},
		{"Kim Cang Dao Qu竛","Kim Cang Dao Thng","Kim Cang Dao Trang","Kim Cang Dao B閕","Kim Cang Dao o",103,100,101,102,3,272}
		},
		{
		{"Nh� Lai Dao Qu竛","Nh� Lai Dao Thng","Nh� Lai Dao Trang","Nh� Lai Dao B閕","Nh� Lai Dao Trng",103,100,101,102,8,371},
		{"Nh� Lai Dao Qu竛","Nh� Lai Dao Thng","Nh� Lai Dao Trang","Nh� Lai Dao B閕","Nh� Lai Dao Trng",103,100,101,102,8,372}
		},
		{
		{"La H竛 Dao Qu竛","La H竛 Dao Thng","La H竛 Dao Trang","La H竛 Dao B閕","La H竛 Dao Th�",103,100,101,102,0,471},
		{"La H竛 Dao Qu竛","La H竛 Dao Thng","La H竛 Dao Trang","La H竛 Dao B閕","La H竛 Dao Th�",103,100,101,102,0,472}
		},
		{},
		{
		{"Hi謕 Kh竎h Dao Qu竛","Hi謕 Kh竎h Dao Thng","Hi謕 Kh竎h Dao Trang","Hi謕 Kh竎h Dao B閕","Hi謕 Kh竎h Dao Ch﹎",103,100,101,102,1,671},
		{"Hi謕 Kh竎h Dao Qu竛","Hi謕 Kh竎h Dao Thng","Hi謕 Kh竎h Dao Trang","Hi謕 Kh竎h Dao B閕","Hi謕 Kh竎h Dao Ch﹎",103,100,101,102,1,672},
		{"Hi謕 Kh竎h Dao Qu竛","Hi謕 Kh竎h Dao Thng","Hi謕 Kh竎h Dao Trang","Hi謕 Kh竎h Dao B閕","Hi謕 Kh竎h Dao Ch﹎",103,100,101,102,1,673},
		{"Hi謕 Kh竎h Dao Qu竛","Hi謕 Kh竎h Dao Thng","Hi謕 Kh竎h Dao Trang","Hi謕 Kh竎h Dao B閕","Hi謕 Kh竎h Dao Ch﹎",103,100,101,102,1,674}
		},
		{},
		{
		{},
		{},
		{"Quan  Dao Qu竛","Quan  Dao Thng","Quan  Dao Trang","Quan  Dao B閕","Quan  Dao Ki誱",103,100,101,102,2,873},
		{"Quan  Dao Qu竛","Quan  Dao Thng","Quan  Dao Trang","Quan  Dao B閕","Quan  Dao Ki誱",103,100,101,102,2,874},
		},
		{
		{},
		{},
		{"Ng鋍 N� Dao Qu竛","Ng鋍 N� Dao Thng","Ng鋍 N� Dao Trang","Ng鋍 N� Dao B閕","Ng鋍 N� Dao C莔",103,100,101,102,10,973},
		{"Ng鋍 N� Dao Qu竛","Ng鋍 N� Dao Thng","Ng鋍 N� Dao Trang","Ng鋍 N� Dao B閕","Ng鋍 N� Dao C莔",103,100,101,102,10,974}
		},
		{},
		{
		{"Gi竛g Long Dao Qu竛","Gi竛g Long Dao Thng","Gi竛g Long Dao Trang","Gi竛g Long Dao B閕","Gi竛g Long Dao Th�",103,100,101,102,0,1171},
		{"Gi竛g Long Dao Qu竛","Gi竛g Long Dao Thng","Gi竛g Long Dao Trang","Gi竛g Long Dao B閕","Gi竛g Long Dao Th�",103,100,101,102,0,1172},
		{"Gi竛g Long Dao Qu竛","Gi竛g Long Dao Thng","Gi竛g Long Dao Trang","Gi竛g Long Dao B閕","Gi竛g Long Dao Th�",103,100,101,102,0,1173},
		{"Gi竛g Long Dao Qu竛","Gi竛g Long Dao Thng","Gi竛g Long Dao Trang","Gi竛g Long Dao B閕","Gi竛g Long Dao Th�",103,100,101,102,0,1174}
		},
		{
		{"Phong Ma Dao Qu竛","Phong Ma Dao Thng","Phong Ma Dao Trang","Phong Ma Dao B閕","Phong Ma Dao C玭",103,100,101,102,5,1271},
		{"Phong Ma Dao Qu竛","Phong Ma Dao Thng","Phong Ma Dao Trang","Phong Ma Dao B閕","Phong Ma Dao C玭",103,100,101,102,5,1272},
		{"Phong Ma Dao Qu竛","Phong Ma Dao Thng","Phong Ma Dao Trang","Phong Ma Dao B閕","Phong Ma Dao C玭",103,100,101,102,5,1273},
		{"Phong Ma Dao Qu竛","Phong Ma Dao Thng","Phong Ma Dao Trang","Phong Ma Dao B閕","Phong Ma Dao C玭",103,100,101,102,5,1274}
		},
		{},
		{
		{"Ch﹏ V� Dao Qu竛","Ch﹏ V� Dao Thng","Ch﹏ V� Dao Trang","Ch﹏ V� Dao B閕","Ch﹏ V� Dao Ki誱",103,100,101,102,2,1471},
		{"Ch﹏ V� Dao Qu竛","Ch﹏ V� Dao Thng","Ch﹏ V� Dao Trang","Ch﹏ V� Dao B閕","Ch﹏ V� Dao Ki誱",103,100,101,102,2,1472},
		{"Ch﹏ V� Dao Qu竛","Ch﹏ V� Dao Thng","Ch﹏ V� Dao Trang","Ch﹏ V� Dao B閕","Ch﹏ V� Dao Ki誱",103,100,101,102,2,1473},
		{"Ch﹏ V� Dao Qu竛","Ch﹏ V� Dao Thng","Ch﹏ V� Dao Trang","Ch﹏ V� Dao B閕","Ch﹏ V� Dao Ki誱",103,100,101,102,2,1474}
		},
		{
		{"Nh蕋 Dng Dao Qu竛","Nh蕋 Dng Dao Thng","Nh蕋 Dng Dao Trang","Nh蕋 Dng Dao B閕","Nh蕋 Dng Dao B髏",103,100,101,102,9,1571},
		{"Nh蕋 Dng Dao Qu竛","Nh蕋 Dng Dao Thng","Nh蕋 Dng Dao Trang","Nh蕋 Dng Dao B閕","Nh蕋 Dng Dao B髏",103,100,101,102,9,1572},
		{"Nh蕋 Dng Dao Qu竛","Nh蕋 Dng Dao Thng","Nh蕋 Dng Dao Trang","Nh蕋 Dng Dao B閕","Nh蕋 Dng Dao B髏",103,100,101,102,9,1573},
		{"Nh蕋 Dng Dao Qu竛","Nh蕋 Dng Dao Thng","Nh蕋 Dng Dao Trang","Nh蕋 Dng Dao B閕","Nh蕋 Dng Dao B髏",103,100,101,102,9,1574}
		},
		{},
		{
		{"Xa K� Tng Qu﹏ Qu竛","Xa K� Tng Qu﹏ Thng","Xa K� Tng Qu﹏ Trang","Xa K� Tng Qu﹏ B閕","Xa K� Tng Qu﹏ Thng",103,100,101,102,6,1771},
		{"Xa K� Tng Qu﹏ Qu竛","Xa K� Tng Qu﹏ Thng","Xa K� Tng Qu﹏ Trang","Xa K� Tng Qu﹏ B閕","Xa K� Tng Qu﹏ Thng",103,100,101,102,6,1772},
		{"Xa K� Tng Qu﹏ Qu竛","Xa K� Tng Qu﹏ Thng","Xa K� Tng Qu﹏ Trang","Xa K� Tng Qu﹏ B閕","Xa K� Tng Qu﹏ Thng",103,100,101,102,6,1773},
		{"Xa K� Tng Qu﹏ Qu竛","Xa K� Tng Qu﹏ Thng","Xa K� Tng Qu﹏ Trang","Xa K� Tng Qu﹏ B閕","Xa K� Tng Qu﹏ Thng",103,100,101,102,6,1774}
		},
		{
		{"Dng An Qu竛","Dng An Thng","Dng An Trang","Dng An B閕","Dng An Cung",103,100,101,102,4,1871},
		{"Dng An Qu竛","Dng An Thng","Dng An Trang","Dng An B閕","Dng An Cung",103,100,101,102,4,1872},
		{"Dng An Qu竛","Dng An Thng","Dng An Trang","Dng An B閕","Dng An Cung",103,100,101,102,4,1873},
		{"Dng An Qu竛","Dng An Thng","Dng An Trang","Dng An B閕","Dng An Cung",103,100,101,102,4,1874}
		},
		{},
		{
		{"U Minh Thi猲 Qu﹏ Qu竛","U Minh Thi猲 Qu﹏ Thng","U Minh Thi猲 Qu﹏ Trang","U Minh Thi猲 Qu﹏ B閕","U Minh Thi猲 Qu﹏ o",103,100,101,102,7,2071},
		{"U Minh Thi猲 Qu﹏ Qu竛","U Minh Thi猲 Qu﹏ Thng","U Minh Thi猲 Qu﹏ Trang","U Minh Thi猲 Qu﹏ B閕","U Minh Thi猲 Qu﹏ o",103,100,101,102,7,2072},
		{"U Minh Thi猲 Qu﹏ Qu竛","U Minh Thi猲 Qu﹏ Thng","U Minh Thi猲 Qu﹏ Trang","U Minh Thi猲 Qu﹏ B閕","U Minh Thi猲 Qu﹏ o",103,100,101,102,7,2073},
		{"U Minh Thi猲 Qu﹏ Qu竛","U Minh Thi猲 Qu﹏ Thng","U Minh Thi猲 Qu﹏ Trang","U Minh Thi猲 Qu﹏ B閕","U Minh Thi猲 Qu﹏ o",103,100,101,102,7,2074}
		},
		{
		{"Mi猽 T﹎ Qu竛","Mi猽 T﹎ Thng","Mi猽 T﹎ Trang","Mi猽 T﹎ B閕","Mi猽 T﹎ Tr秓",103,100,101,102,11,2171},
		{"Mi猽 T﹎ Qu竛","Mi猽 T﹎ Thng","Mi猽 T﹎ Trang","Mi猽 T﹎ B閕","Mi猽 T﹎ Tr秓",103,100,101,102,11,2172},
		{"Mi猽 T﹎ Qu竛","Mi猽 T﹎ Thng","Mi猽 T﹎ Trang","Mi猽 T﹎ B閕","Mi猽 T﹎ Tr秓",103,100,101,102,11,2173},
		{"Mi猽 T﹎ Qu竛","Mi猽 T﹎ Thng","Mi猽 T﹎ Trang","Mi猽 T﹎ B閕","Mi猽 T﹎ Tr秓",103,100,101,102,11,2174}
		}
	}
	--玩家信息获取以及整理
	local player_Route = GetPlayerRoute()
	local player_body = GetBody()
	--包存在检测
	if GetItemCount(2,1,(1058+bag_diff)) == 0 then
		Talk(1,"","Xin x竎 nh薾 tr猲 ngi c� mang <color=green>"..cangjian_bag_name[bag_diff].."<color>!")
		return
	end
	--包使用成功检测
	if DelItem(2,1,(1058+bag_diff),1) == 0  then
		Talk(1,"","Xin x竎 nh薾 tr猲 ngi c� mang <color=green>"..cangjian_bag_name[bag_diff].."<color>!")
		return		
	end
	local add_flag = AddItem(0,canjiantao[player_Route][player_body][bag_diff+5],canjiantao[player_Route][player_body][11],1,1,-1,-1,-1,-1,-1,-1)
	if add_flag == 1 then
		Msg2Player("Ch骳 m鮪g b筺 s� d鬾g:"..cangjian_bag_name[bag_diff].."фi l蕐: "..canjiantao[player_Route][player_body][bag_diff].."!")
	else
		WriteLog("i T祅g Ki誱 bao: Ngi ch琲"..GetName().."s� d鬾g:"..cangjian_bag_name[bag_diff].."фi trang b� th蕋 b筰, k� hi謚:"..add_flag)
	end
end
--*******************************玩家流派检测********************************
function player_route_chk(player_Route)
	if player_Route == 0 or player_Route == 1 or player_Route == 5 or player_Route == 7 or player_Route == 10 
	or player_Route == 13 or player_Route == 16 or player_Route == 19 then
		return 0 
	else
		return 1
	end
end
