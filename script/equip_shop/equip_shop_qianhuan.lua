--脚本功能：
--代币商店入口对话

Include("\\script\\equip_shop\\equip_shop_head.lua")

function ShowQianHuanGroup(nKind)
	local sTitle,tbSay;
	if nKind == 1 then
		sTitle = "H穣 l鵤 ch鋘 phng th鴆 i";
		tbSay = {
			"Thi猲 Huy詎 c蕄 1 i U萵 Linh u kh鑙/#show_equip_shop(3013)",
			"Thi猲 Huy詎 c蕄 1 i U萵 Linh y/#show_equip_shop(3014)",
			"Thi猲 Huy詎 c蕄 1 i U萵 Linh h� y/#show_equip_shop(3015)",
			"Kh玭g c莕 u/do_nothing",
		};
		Say(sTitle,getn(tbSay),tbSay);
	end
	if nKind == 2 then
		sTitle = "H穣 l鵤 ch鋘 phng th鴆 i";
		tbSay = {
			"Thi猲 Huy詎 c蕄 2 i U萵 Linh u kh鑙/#show_equip_shop(3016)",
			"Thi猲 Huy詎 c蕄 2 i U萵 Linh y/#show_equip_shop(3017)",
			"Thi猲 Huy詎 c蕄 2 i U萵 Linh h� y/#show_equip_shop(3018)",
			"Kh玭g c莕 u/do_nothing",
		};
		Say(sTitle,getn(tbSay),tbSay);
	end
	if nKind == 3 then
		sTitle = "H穣 l鵤 ch鋘 phng th鴆 i";
		tbSay = {
			"Thi猲 Huy詎 c蕄 3 i U萵 Linh u kh鑙/#show_equip_shop(3019)",
			"Thi猲 Huy詎 c蕄 3 i U萵 Linh y/#show_equip_shop(3020)",
			"Thi猲 Huy詎 c蕄 3 i U萵 Linh h� y/#show_equip_shop(3021)",
			"Kh玭g c莕 u/do_nothing",
		};
		Say(sTitle,getn(tbSay),tbSay);
	end
end

function do_nothing()
--do nothing
end