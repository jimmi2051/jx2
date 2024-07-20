-- 修真要诀
-- 增加修为点数1000点
-- lizhi 2006-11-2 11:53

nInsPopur = 1000

function OnUse()
	-- 判断增加后修为是否到达上限
	nCount = GetItemCount(2,0,554)
	AskClientForNumber("TuChan_use", 0, nCount,"(0-999)")
end

function yes_say()
	if DelItem(2, 0, 554, 1) == 1 then
		ModifyPopur(nInsPopur)
		Msg2Player("B筺  d飊g Tu Ch﹏ y誹 quy誸, t╪g"..nInsPopur.." 甶觤 tu luy謓")
	end
end


function TuChan_use(nCount)
	if nCount == 0 then
		return 0
	end
	
	local nPopurLimit = GetPopurLimit()
	local nPopur = GetPopur()
	if (nPopur + (nInsPopur*nCount)) > nPopurLimit then
		Talk(1,"","S� 甶觤 c閚g vt qu� gi韎 h筺, kh玭g th� s� d鬾g <color=green>Tu Ch﹏ y誹 quy誸<color>!")
		return 0
	end
	
	if DelItem(2, 0, 554, nCount) == 1 then
		ModifyPopur(nInsPopur*nCount)
		Msg2Player("B筺  d飊g "..nCount.." Tu Ch﹏ y誹 quy誸, t╪g "..(nInsPopur*nCount).." 甶觤 tu luy謓.")
	else
		Talk(1,"","S� lng <color=green>Tu Ch﹏ y誹 quy誸<color> trong h祅h trang kh玭g .")
		return 0
	end
end


function no_say()

end