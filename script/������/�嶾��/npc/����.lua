-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 五毒教NPC熊立Script
-- By StarryNight
-- 2006/02/09 PM 17:17

-- 直面自己的内心吧！

-- ======================================================

function main()
	if GetSex()==1 then
		Say("B籲g h鱱 mu鑞 r阨 kh醝 y �?",2,"L祄 phi襫 huynh i!/outwudu","Kh玭g c莕 u!/no")
	else
		Say("Ti觰 c� nng mu鑞 r阨 kh醝 �?",2,"L祄 phi襫 huynh i!/outwudu","Kh玭g c莕 u!/no")
	end
end;

function outwudu()
	SetFightState(0)
	i=random(1,3)
		if i==1 then
			NewWorld(100, 1521 ,2870)
		elseif i==2 then
			NewWorld(100, 1386 ,2905)
		else 
			NewWorld(100, 1555 ,3080)
	end
end

function no()
end;
