--军需官
--现在修改为打开储物箱

Include("\\script\\battles\\battleinfo.lua")

function main(sel)
	--Say("军需官：我是负责后营事务的军需官，你有什么需要吗？",3,"购买药品/salemedicine","雁门关之战的规则/bt_onbattleinfo","不用了，谢谢/cancel")
	Say("Ta ph� tr竎h qu﹏ nhu, ngi c莕 g�?", 3, "M� rng ch鴄 /OpenStoreBox","T譵 hi觰 quy t綾 Nh筺 M玭 chi課/bt_onbattleinfo","Kh玭g c莕 u! C竚 琻!/cancel");
end;

--function salemedicine(sel)
--	Sale(50)
--end

function OpenStoreBox()
	OpenBox();
end;

