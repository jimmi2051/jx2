-- file:rescue.lua
-- by:Xsjcs
-- CreateDate: 2005-4-22
--  GetWorldTempTask(0)  记录时间hour
--  GetWorldTempTask(1)  记录城市领取次数  (这个服务器)
--  GetTask(250)    记录当前人物1小时内是否有领过救济品
--  赈济新手：钦差大臣每1小时出现在三大城市，每次一共发100个救济品。每个20级以下的新手每次只能领取一个。每个大臣处领取没有限制。


function newplayer_help()
	if (GetLevel() >= 20) then 
		Say("Ta ph鬾g m謓h Ho祅g thng, ph竧 lng th鵦 v� ti襫 b筩 c鴘 t� n筺 d﹏! Ai t� c蕄 20 tr� l猲 u c� th� n nh薾",0)
	else 
		Say("Ta ch� 頲 ph衟 c鴘 t� cho nh鱪g t﹏ th� t c蕄 20 m� th玦! Ngi   t� c竎h, c� mu鑞 nh薾 kh玭g?",3,"Hay qu�! Ta 產ng kh鑞 kh� y! Ho祅g thng anh minh!/present","Xin ch� gi竜, l祄 sao  頲 nh薾 c鴘 t�?!/abouthelpgoods","Ta y m� ph秈 甶 nh薾 c鴘 t� �!?/no")
	end;
end;

function abouthelpgoods()
	Say("Ta ph鬾g m謓h Ho祅g thng, m鏸 ng祔 甶 ph竧 c鴘 t� cho c竎 t﹏ th� c蕄 20 � Th祅h Й, Bi謓 Kinh, Tuy襫 Ch﹗. C� c竎h m鏸 gi� ph竧 1 l莕. M鏸 ng祔 ch� c� 100 ph莕, ai nhanh ch﹏ th� 頲!",0)
end;



function present()

	local nNowTime = GetWorldTempTask(0)	--服务器全局变量
	local nQuantity = GetWorldTempTask(1) 	--服务器全局变量
	local Utask250 = GetTask(250)	
	local nHour = tonumber( date( "%m%d%H" ) )	--当前时间记录

	if ( nNowTime ~= nHour ) then
		SetWorldTempTask(0,nHour)	--开启时间记录
		SetWorldTempTask(1,0)		--可领取数量清零
		AddLocalNews("* * *Kh﹎ Sai i th莕 產ng ph竧 c鴘 t�, c竎 t﹏ th� t c蕄 20 h穣 nhanh ch﹏ n Th祅h Й, Bi謓 Kinh, Tuy襫 Ch﹗  nh薾!* * *")
	end
	nNowTime = GetWorldTempTask(0)
	nQuantity = GetWorldTempTask(1)
	if ( Utask250 ~= nNowTime and nQuantity < 100 ) then
		onTake()
		SetWorldTempTask(1,nQuantity+1)
		SetTask(250,nNowTime)
--		Msg2Player("AddItem 1,total = " ..nQuantity + 1)
	elseif ( Utask250 == nNowTime ) then
		Say("Ngi  nh薾 ph莕 c馻 m譶h r錳! H穣 nhng cho ngi kh竎 nh�!",0)
	else
		Say("! Ngi ngh蘯 � u m� nhi襲 th�! Ngi n ch薽 ch﹏ r錳! M閠 gi� sau h穣 quay l筰 nh�!",0)
	end		

end

function onTake()

  	i = random(1,54)
	if ( i == 1 ) then
		Earn(10)
		Msg2Player("B筺 nh薾 頲 10 уng xu c鴘 t�!")
	elseif ( i == 2 ) then
		Earn(50)
		Msg2Player("B筺 nh薾 頲 50 уng xu c鴘 t�!")
	elseif ( i == 3 ) then
		Earn(100)
		Msg2Player("B筺 nh薾 頲 1 lng b筩 c鴘 t�!")
	elseif ( i == 4 ) then
		Earn(200)
		Msg2Player("B筺 nh薾 頲 2 lng b筩 c鴘 t�!")
	elseif ( i == 5 ) then
		AddItem(1,2,1,2)
		Msg2Player("B筺 nh薾 頲 2 T祅g H錸g hoa")
	elseif ( i == 6 ) then
		AddItem(1,2,2,2)
		Msg2Player("B筺 nh薾 頲 2 C竧 c竛h")
	elseif ( i == 7 ) then
		AddItem(1,2,3,2)
		Msg2Player("B筺 nh薾 頲 2 Ho祅g li猲")
	elseif ( i == 8 ) then
		AddItem(1,2,8,2)
		Msg2Player("B筺 nh薾 頲 2 Ba u!")
	elseif ( i == 9 ) then
		AddItem(1,2,9,2)
		Msg2Player("B筺 nh薾 頲 2 X竎 ve")
	elseif ( i == 10 ) then
		AddItem(2,2,1,2)
		Msg2Player("B筺 nh薾 頲 2 Tinh thi誸")
	elseif ( i == 11 ) then
		AddItem(2,2,2,2)
		Msg2Player("B筺 nh薾 頲 2 B竎h luy謓 cang")
	elseif ( i == 12 ) then
		AddItem(1,2,1,2)
		Msg2Player("B筺 nh薾 頲 2 T祅g H錸g hoa")
	elseif ( i == 13 ) then
		AddItem(2,2,9,2)
		Msg2Player("B筺 nh薾 頲 2 Tr飊g M閏!")
	elseif ( i == 14 ) then
		AddItem(2,2,10,2)
		Msg2Player("B筺 nh薾 頲 2 Thi誸 Chng M閏")
	elseif ( i == 15 ) then
		AddItem(2,2,15,2)
		Msg2Player("B筺 nh薾 頲 2 Da s鉯")
	elseif ( i == 16 ) then
		AddItem(2,2,16,2)
		Msg2Player("B筺 nh薾 頲 2 Da h�")
	elseif ( i == 17 ) then
		AddItem(2,2,21,2)
		Msg2Player("B筺 nh薾 頲 2 H綾 c萴")
	elseif ( i == 18 ) then
		AddItem(2,2,22,2)
		Msg2Player("B筺 nh薾 頲 2 Ch鴆 c萴")
	elseif ( i == 19 ) then
		AddItem(1,3,1,2)
		Msg2Player("B筺 nh薾 頲 2 Th辴 th�")
	elseif ( i == 20 ) then
		AddItem(1,3,2,2)
		Msg2Player("B筺 nh薾 頲 2 Th辴 g�")
	elseif ( i == 21 ) then
		AddItem(1,3,9,2)
		Msg2Player("B筺 nh薾 頲 2 Quang Th玭g ma")
	elseif ( i == 22 ) then
		AddItem(1,3,10,2)
		Msg2Player("B筺 nh薾 頲 2 u Khuynh")
	elseif ( i == 23 ) then
		AddItem(1,0,1,2)
		Msg2Player("B筺 nh薾 頲 2 cu閚 b╪g")
	elseif ( i == 24 ) then
		AddItem(1,0,2,2)
		Msg2Player("B筺 nh薾 頲 2 Kim S竛g t竛")
	elseif ( i == 25 ) then
		AddItem(1,0,3,2)
		Msg2Player("B筺 nh薾 頲 2 Ch� Huy誸 t竛")
	elseif ( i == 26 ) then
		AddItem(1,0,7,2)
		Msg2Player("B筺 nh薾 頲 2 Ti觰 Ho祅 n")
	elseif ( i == 27 ) then
		AddItem(1,0,12,2)
		Msg2Player("B筺 nh薾 頲 2 Thanh T﹎ t竛")
	elseif ( i == 28 ) then
		AddItem(1,1,1,2)
		Msg2Player("B筺 nh薾 頲 2 B竛h ng�")
	elseif ( i == 29 ) then
		AddItem(1,1,2,2)
		Msg2Player("B筺 nh薾 頲 2 C琺 n緈")
	elseif ( i == 30 ) then
		AddItem(2,5,1,2)
		Msg2Player("B筺 nh薾 頲 2 Gi竚 nh ph�!")
	elseif ( i == 31 ) then
		AddItem(2,5,2,2)
		Msg2Player("B筺 nh薾 頲 2 Gi竚 nh ph�!")
	elseif ( i == 32 ) then
		AddItem(2,4,1,1)
		Msg2Player("B筺 nh薾 頲 1  H祇 Th筩h!")
	elseif ( i == 33 ) then
		AddItem(2,4,8,1)
		Msg2Player("B筺 nh薾 頲 1 Dng H祇 Th筩h!")
	elseif ( i == 34 ) then
		AddItem(1,5,1,2)
		Msg2Player("B筺 nh薾 頲 2 H錳 ph� Bi謓 Kinh")
	elseif ( i == 35 ) then
		AddItem(1,5,2,2)
		Msg2Player("B筺 nh薾 頲 2 H錳 ph� Th祅h Й")
	elseif ( i == 36 ) then
		AddItem(0,107,31,1)
		Msg2Player("B筺 nh薾 頲 1 Trng Quy襫 Ph�!")
	elseif ( i == 37 ) then
		AddItem(0,2,14,1)
		Msg2Player("B筺 nh薾 頲 1 Hi謕 Thi誹 Ki誱!")
	elseif ( i == 38 ) then
		AddItem(0,2,15,1)
		Msg2Player("B筺 nh薾 頲 1 T飊g V╪ Ki誱!")
	elseif ( i == 39 ) then
		AddItem(0,5,27,1)
		Msg2Player("B筺 nh薾 頲 1 Hi謕 Thi誹 C玭!")
	elseif ( i == 40 ) then
		AddItem(0,5,28,1)
		Msg2Player("B筺 nh薾 頲 1 T� Mi C玭!")
	elseif ( i == 41 ) then
		AddItem(0,1,40,1)
		Msg2Player("B筺 nh薾 頲 1 Hi謕 Thi誹 竚 kh�!")
	elseif ( i == 42 ) then
		AddItem(0,1,41,1)
		Msg2Player("B筺 nh薾 頲 1 Ng� Quang th筩h!")
	elseif ( i == 43 ) then
		AddItem(0,3,53,1)
		Msg2Player("B筺 nh薾 頲 1 Gi韎 o!")
	elseif ( i == 44 ) then
		AddItem(0,10,64,1)
		Msg2Player("B筺 nh薾 頲 1 Ng鋍 V薾 C莔")
	elseif ( i == 45 ) then
		AddItem(0,9,75,1)
		Msg2Player("B筺 nh薾 頲 1 Ph竛 Quan b髏")
	elseif ( i == 46 ) then
		AddItem(0,8,86,1)
		Msg2Player("B筺 nh薾 頲 1 T輈h trng")
	elseif ( i == 47 ) then
		AddItem(0,100,1,1)
		Msg2Player("B筺 nh薾 頲 1 Hi謕Thi誹 B� y!")
	elseif ( i == 48 ) then
		AddItem(0,100,2,1)
		Msg2Player("B筺 nh薾 頲 1 H綾 C萴 B� Y")
	elseif ( i == 49 ) then
		AddItem(0,100,19,1)
		Msg2Player("B筺 nh薾 頲 1 Hi謕Thi誹 Y!")
	elseif ( i == 50 ) then
		AddItem(0,100,20,1)
		Msg2Player("B筺 nh薾 頲 1 Thi誸 H� Uy觧")
	elseif ( i == 51 ) then
		AddItem(0,100,37,1)
		Msg2Player("B筺 nh薾 頲 1 Th竔 Thng")
	elseif ( i == 52 ) then
		AddItem(0,100,38,1)
		Msg2Player("B筺 nh薾 頲 1 T� L╪g Thng")
	elseif ( i == 53 ) then
		AddItem(0,100,55,1)
		Msg2Player("B筺 nh薾 頲 1 V� Thng")
	else 
		AddItem(0,100,56,1)
		Msg2Player("B筺 nh薾 頲 1 H錸g V﹏ Thng")
	end
end

function no()
	Say("Th蕐 ngi c� ch� kh� nh� v藋, b鎛 quan v� c飊g kh﹎ ph鬰!",0)
end
