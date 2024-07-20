
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 成都车夫脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

--Include("\\script\\task\\teach\\teach_main.lua");

function main()

--	local nState = TE_GetTeachState()
--	local nLevel = GetLevel()
	
--	if (nState==8) then
--	
--		task_008();
--		return
		
--	else
	if GetLevel() < 15 then
		Say("Ta s� a 甶 mi詎 ph� cho t﹏ th� di <color=yellow>c蕄 15<color>, xin h醝 kh竎h quan mu鑞 甶 u?",
		3,
		"Th祅h Й/chengdu",
		"Tuy襫 Ch﹗/quanzhou",
		"Kh玭g 甶 u c�/no")
	else
		local tbSay = {
			"Th祅h Й (3 lng)/chengdu",
    		"Tuy襫 Ch﹗ (3 lng)/quanzhou",
    		"Tng Dng (3 lng)/xiangyang",
    		"Dng Ch﹗ (3 lng)/yangzhou",
    		"Ph鬾g Tng (3 lng b筩)/fengxiang",
    		"Чi L� (3 lng)/dali",
			}
		local nMap = GetWorldPos()
		if nMap == 200 then
			tinsert(tbSay, "V� L﹎ Minh/wulinmeng")
		else
			tinsert(tbSay, "Bi謓 Kinh (3 lng b筩)/bianjing")
		end
		tinsert(tbSay, "Kh玭g 甶 u c�/no")
		Say("L� ph� ch� c� <color=yellow>3 lng<color> th玦, ngi mu鑞 甶 u?",
			getn(tbSay), tbSay)
		return
	end	
end

function wulinmeng()
	NewWorld(425,1746,3197)
end

function moneygo()
	if GetLevel() <15 then 
		return 1
	elseif GetCash() >=300 then
		PrePay(300)
		return 1
	else
		return 0
	end
end;



function bianjing()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti襫 th� h穣 ng錳 xe!")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
		i=random(1,4)
		if i==1 then
			NewWorld(200, 1501 ,2978)
		elseif i==2 then
			NewWorld(200, 1267,2970)
		else  
			NewWorld(200, 1249 ,2732)
		end
		SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
	end
end

function chengdu()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti襫 th� h穣 ng錳 xe!")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
		i=random(1,3)
--		if i==1 then
--			NewWorld(300, 1896 ,3655)
		if i==2 then
			NewWorld(300, 1677 ,3671)
		elseif i==3 then
			NewWorld(300, 1681 ,3464)
		else 
			NewWorld(300, 1911 ,3442)
		end
		SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
	end
end




function quanzhou()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti襫 th� h穣 ng錳 xe!")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
		i=random(1,3)
		if i==1 then
			NewWorld(100, 1521 ,2870)
		elseif i==2 then
			NewWorld(100, 1386 ,2905)
		else 
			NewWorld(100, 1555 ,3080)
		end
		SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
	end
end


function xiangyang()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti襫 th� h穣 ng錳 xe!")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
		i=random(1,4)
		if i==1 then
			NewWorld(350, 1518 ,3050)
		elseif i==2 then
			NewWorld(350, 1362 ,3053)
		elseif i==3 then
			NewWorld(350, 1332 ,2865)
		else 
			NewWorld(350, 1542 ,2865)
		end
		SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
	end
end

function yangzhou()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti襫 th� h穣 ng錳 xe!")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
		i=random(1,4)
		if i==1 then
			NewWorld(150, 1724 ,3075)
		elseif i==2 then
			NewWorld(150, 1630 ,3050)
		elseif i==3 then
			NewWorld(150, 1615 ,3175)			
		else 
			NewWorld(150, 1757 ,3179)
		end
		SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
	end
end


function fengxiang()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti襫 th� h穣 ng錳 xe!")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
		i=random(1,4)
		if i==1 then
			NewWorld(500, 1846 ,3043)
		elseif i==2 then
			NewWorld(500, 1800 ,3229)
		elseif i==3 then
			NewWorld(500, 1659 ,3090)
		else
			NewWorld(500, 1664 ,3226)
		end
		SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
	end
end;

function dali()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti襫 th� h穣 ng錳 xe!")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
		i=random(1,3)
		if i==1 then
			NewWorld(400, 1567 ,3117)
		elseif i==2 then
			NewWorld(400, 1434 ,3109)
		else
			NewWorld(400, 1579 ,2883)
		end
		SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
	end
end;

function no()
end;


