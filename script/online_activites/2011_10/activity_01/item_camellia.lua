--11月活动山茶礼花脚本
--by liubo

Include("\\script\\online_activites\\head\\activity_normal_head.lua")
function OnUse(nItemIndex)
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	if tbActivity then
		tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
	else
		Talk(1,"","V藅 ph萴  qu� h筺 s� d鬾g")
	end
end