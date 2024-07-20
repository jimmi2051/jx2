-- 比武大会回调相关脚本

function OnArrive(szKey, nKey1, nKey2, nCount, szInExistKey, nInExistKey1, nInExistKey2)
	if szKey ~= "" then
		BuildBWRank(szKey, nKey1, nKey2, 1)
	else
		BuildBWRank(szInExistKey, nInExistKey1, nInExistKey2, 0)
	end
end

function OnArriveInfo(szKey, nKey1, nKey2, nCount, szInExistKey, nInExistKey1, nInExistKey2)
	if szKey ~= "" then
		BuildBWRankInfo(szKey, nKey1, nKey2, 1)
	else
		BuildBWRankInfo(szInExistKey, nInExistKey1, nInExistKey2, 0)
	end
end

function SyncZgPoint(nPoint)
	local nBodyPoint = GetTask(662)
	local nDiff = nPoint - nBodyPoint
	if nDiff > 0 then
		SetTask(662, nPoint, 21)
		Msg2Player("觤 t� c竎h i h閕 t� v� c馻 b筺  t╪g l猲 "..nDiff.." 甶觤, 甶觤 t� c竎h hi謓 t筰 l� "..nPoint.." Ph髏 ")
	end
	WriteLog("[Чi h閕 t� v鈃 event=C藀 nh藅 甶觤 t� c竎h name="..GetName().." "..nBodyPoint.." "..nPoint)
end