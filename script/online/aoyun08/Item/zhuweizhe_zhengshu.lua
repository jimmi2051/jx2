--圣火传递活动助威者资格证书
--by vivi
--2008/05/30

Include("\\script\\online\\aoyun08\\aoyun_head.lua")

function OnUse()
	if GetTask(547) == 0 then
		Talk(1,"","<color=green>Ch鴑g nh薾 quy襫 c� v�<color>: Xin l鏸, b筺 kh玭g ph秈 ngi c� v�.");
		return
	end
	if GetTask(TASK_AOYUN_ZHUWEI_NUM) == 0 then
		local nRand = random(1,31);
		SetTask(TASK_AOYUN_ZHUWEI_NUM,nRand);
	end
	local nTask = GetTask(TASK_AOYUN_ZHUWEI_NUM);
	local nStrtab = {
		"T譵 hi觰 ph莕 thng ngi c� v�/zhuweizhe_award",
		"Лa ta n Уi 畊鑓 tng 鴑g (50 b筩)/goto_huojutai",
		"T譵 t鋋  Уi 畊鑓/huoju_zuobiao",
		"Tho竧/nothing"
		};
	if nTask == 1 then
		Say("<color=green>Ch鴑g nh薾 quy襫 c� v�<color>: Ch骳 m鮪g b筺 nh薾 頲 quy襫 c� v� t筰 <color=yellow>Th竛h H醓 Уi<color>, sau khi 畊鑓 頲 th緋, b筺 c� th� nh薾 ph莕 thng t筰 Th竛h H醓 Уi. (Nh蕁 ph輒 ph秈)",
			getn(nStrtab),
			nStrtab);
	elseif nTask == 31 then
		Say("<color=green>Ch鴑g nh薾 quy襫 c� v�<color>: Ch骳 m鮪g b筺 nh薾 頲 quy襫 c� v� t筰 <color=yellow>Уi 畊鑓 th辬h th�<color>, sau khi 畊鑓 頲 th緋, b筺 c� th� nh薾 ph莕 thng t筰 Уi 畊鑓 th辬h th�. (Nh蕁 ph輒 ph秈)",
			getn(nStrtab),
			nStrtab);
	else
		Say("<color=green>Ch鴑g nh薾 quy襫 c� v�<color>:  Ch骳 m鮪g b筺 nh薾 頲 quy襫 c� v� t筰 Уi 畊鑓 <color=yellow>"..(nTask-1).."<color>, sau khi 畊鑓 頲 th緋, b筺 c� th� nh薾 ph莕 thng t筰 Уi 畊鑓 "..(nTask-1)..".(Nh蕁 ph輒 ph秈)",
			getn(nStrtab),
			nStrtab);
	end
end

function zhuweizhe_award()
	Talk(1,"","<color=green>Ch鴑g nh薾 quy襫 c� v�<color>: Ph莕 thng ngi c� v� nh� sau:\nKhi ho箃 ng b総 u, Th竛h H醓 Уi ch� nh 頲 th緋 l猲, l� c� th� nh薾 1 'Loa c� v�' t筰 Уi 畊鑓, sau khi d飊g ph竧 ra l阨 ch骳 ph骳 c馻 m譶h c� th� nh薾 1 v藅 ph萴 thu閏 h� B錸g Lai, v� ph莕 thng kinh nghi謒 l藀 phng ng c蕄 x 8. N誹 c蕄 99 c� th� nh薾 1 vi猲 Linh th筩h ng蓇 nhi猲 c蕄 6-7.\nTrong th阨 gian ho箃 ng, t筰 Уi 畊鑓 ch� nh ch� 1 ph髏 c� th� nh薾 ph莕 thng kinh nghi謒 l藀 phng ng c蕄 x 6. N誹 c蕄 99 c� x竎 su蕋 20% nh薾 頲 1 vi猲 Linh th筩h ng蓇 nhi猲 c蕄 1-7.\nKhi ho箃 ng k誸 th骳 trong 2 ph髏 nh蕁 Уi 畊鑓 ch� nh l� c� th� nh薾 ph莕 thng kinh nghi謒 l藀 phng ng c蕄 x 5. N誹 c蕄 99 c� th� nh薾 頲 1 Linh th筩h ng蓇 nhi猲 c蕄 6.")
end

function huoju_zuobiao()
	Talk(1,"huoju_zuobiao2","Ph鬾g Tng: Th竛h H醓 Уi [228,191], Уi 畊鑓 1 [209,200], Уi 畊鑓 2 [207,193], Уi 畊鑓 3 [222,200]\nTng Dng: Уi 畊鑓 4 [192,1-79], Уi 畊鑓 5 [1-77,1-74], Уi 畊鑓 6 [168,1-79], Уi 畊鑓 7 [1-70,190], Уi 畊鑓 8 [189,190]\nTh祅h Й: Уi 畊鑓 9 [209,229], Уi 畊鑓 10 [213,21-7], Уi 畊鑓 11 [232,218], Уi 畊鑓 12 [220,221], Уi 畊鑓 13 [233,226]\nЧi L�: Уi 畊鑓 14 [191,182], Уi 畊鑓 15 [1-78,185], Уi 畊鑓 16 [181,193], Уi 畊鑓 1-7 [195,194]");
end

function huoju_zuobiao2()
	Talk(1,"OnUse","Tuy襫 Ch﹗: Уi 畊鑓 18 [169,180], Уi 畊鑓 19 [169,190], Уi 畊鑓 20 [189,190], Уi 畊鑓 21 [188,181]\nDng Ch﹗: Уi 畊鑓 22 [203,191], Уi 畊鑓 23 [203,198], Уi 畊鑓 24 [218,198], Уi 畊鑓 25 [21-7,192]\nBi謓 Kinh: Уi 畊鑓 26 [158,185], Уi 畊鑓 27 [183,184], Уi 畊鑓 28 [183,1-73], Уi 畊鑓 29 [162,1-72], Уi 畊鑓 th辬h th� [1-70,1-79]");
end