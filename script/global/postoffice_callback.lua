-- 邮件系统的回调

function OnQueryMail(nMailCount, nMaxMailCount, nNewMailCount)
	if nNewMailCount > 0 then
		Msg2Player("B筺 c� th� m韎, xin n Ch� b璾 c鬰  nh薾!")
	end
end

function OnNewMail()
	Msg2Player("B筺 c� th� m韎, xin n Ch� b璾 c鬰  nh薾!")
end
