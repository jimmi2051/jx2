--任务  
--地点：汴京 任务：天门阵任务，结点1
--策划：樊万松  2004.02.28
szNpcName = "<color=green>Ti觰 nh�<color>: "

Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

function main()
	if GetWorldPos() == 200 then
		if GetTaskTrans() == 1 then		
			trans_talk_03()
			return
		end
	end	
	UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 0 and  GetLevel() >= 15  )  then
		Talk(1,"say1401_1","G莕 y sao nghi襲 ngi qua l筰 v藋?")
	elseif ( UWorld1401  == 5 ) then
		Talk(1,"","Ngi nh譶 ta l祄 g�?  h醝 <color=red>Nh﹏ s� giang h�<color> b猲 kia 甶!")
	elseif ( GetLevel() < 15  )  then
		Talk(1,"","Nh譶 ngi l� bi誸 m韎 ch藀 ch鱪g bc ch﹏ v祇 giang h�, luy謓 th猰 m閠 th阨 gian ta s� n鉯 ngi nghe m閠 <color=red>b� m藅 ng tr阨<color>!")
	else
		Talk(1,"","Nh譶 ngi l� bi誸 甶 t譵 kho b竨 � Nh筺 M玭 quan, c遪 mu鑞 gi蕌 ta �? дn b鎛 ti謒 ta s� n鉯 ngi nghe tin t鴆 v� kho b竨.")
	end
end;

function  say1401_1()
	Say("V� kh竎h quan n祔 qu� nhi猲 tinh m総, kh玭g gi蕌 g� y l� b� m藅 l韓 nh璶g ph秈 t鑞 <color=red>15 Kim<color>!",2,"Лa 15 Kim cho h緉/yes1401_1","Ti觰 nh� g� k� v藋!/no1401_1")
end;

function  yes1401_1()
	if ( GetCash() >= 150000  )  then
	    Talk(2,"","B� m藅 l韓 v藋 m� c� 15 Kim th玦 sao!","Kh竎h quan! S� ti襫  kh玭g oan u鎛g ch髏 n祇. Nghe n鉯 <color=yellow>m秐h S琻 H� X� T綾<color> t nhi猲 l筰 xu蕋 hi謓, c� th� ti觰 nh﹏ kh玭g r�, ng礽 th� h醝 <color=red>Nh﹏ s� giang h�<color> xem!")
			Pay(150000)
	    SetTask(1401,5)
	    ModifyReputation(4,0)
			--AddNote("主线任务--天门阵任务，开始！")
			Msg2Player("Nhi謒 v� ch� tuy課 - Thi猲 M玭 tr薾")
	elseif ( GetCash() < 150000  ) then
			Talk(1,"","Tr阨! Xem b� d筺g ngi m閠 xu d輓h t骾 c騨g kh玭g c� �?")						
	end
end;

function  no1401_1()
		Talk(2,"","Chuy謓 nh� v藋 sao ng 15 Kim!","U鎛g qu� b� m藅 l韓 n鉯 ai nghe b﹜ gi�?")
end;
