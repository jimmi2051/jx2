--任务
--地点：汴京 任务：天门关任务结点7
--策划：樊万松  2004.03.

function main()
UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 45  )  then
		Talk(5,"","Ngi l� ai? Sao t� ti謓 v祇 y?","L穙 b� sai t筰 h� n y nh緉 v韎 l穙 tng qu﹏ m閠 c﹗  l�: Ti觰 nh﹏ 琻g o, Thi誸 m筩 tr譶h cng","Phu nh﹏ th藅 l� chu o. Х x玭g pha chi課 tr薾 ta nh蕋 nh ph秈 chi課 th緉g m韎 tr� v�!","H穣 n g莕 qu﹏ doanh <color=red>Nh筺 M玭 quan<color> tr鮪g tr� v礽 t猲 <color=red>Ki猽 binh<color> 畂箃 v� <color=red>20 t蕀 M藆 M閏 B礽<color>!","T筰 h� s� 甶 ngay!")
		SetTask(1401,50)
	elseif ( UWorld1401  == 50 and GetItemCount(2,1,64) >= 20 ) then
				if  DelItem(2,1,64,20) == 1 then
						    ----AddItem(0,0,0)
						    --Earn(10000)
						    ModifyExp(10000)							    
								AddNote("Nhi謒 v� tr鮪g tr� Ki猽 binh ho祅 th祅h.")
						    Msg2Player("Nhi謒 v� tr鮪g tr� Ki猽 binh ho祅 th祅h.")
		    
								Talk(6,"","Qu� l� kh玭g t�! C� ch髏 <color=red>ph莕 thng<color> xin nh薾 cho!","B籲g h鱱 m韎 n y b鋘 n猲 ch髇g ch璦 nh薾 ra! Phi襫 gi髉 ta n Li猽 qu鑓 th╩ d� m閠 chuy課!","Nh璶g ta l� ngi H竛 l祄 sao ti誴 c薾 頲 v韎 ngi Khi誸 n?","Nghe n鉯 <color=red>Bi謓 Kinh ph�<color> c� m閠 ngi H竛 t猲 l� <color=red>H祅 Tr� Nhng<color> k誸 h玭 c飊g v韎 m閠 thi誹 n� ngi Khi誸 n.","дn t譵 <color=red>H祅 Tr� Nhng<color>, n鉯 ngi l� th玭g gia c馻 玭g 蕐, ch綾 ch緉 s� 頲 h藆 i. Tranh th� thu th藀 tin t鴆!","Л頲! T筰 h� s� n <color=red>Bi謓 Kinh ph� <color> t譵 <color=red>H祅 Tr� Nhng l穙 nh﹏<color>.")
								SetTask(1401,55)
			else
							 Talk(1,"","Chuy觧 giao v藅 ph萴 kh玭g th祅h c玭g")
			end
		elseif ( UWorld1401  == 50 and GetItemCount(2,1,19) < 20 ) then
						Talk(1,"","H穣 n g莕 qu﹏ doanh <color=red>Nh筺 M玭 quan<color> tr鮪g tr� v礽 t猲 <color=red>Ki猽 binh<color> 畂箃 v� <color=red>20 t蕀 M藆 M閏 B礽<color>!")
		elseif ( UWorld1401  == 55  ) then
						Talk(1,"","Mau n <color=red>Bi謓 Kinh ph�<color> t譵 <color=red>H祅 Tr� Nhng<color> l穙 nh﹏.")
--以下是杨四郎任务---------------------------------------------
		elseif ( UWorld1401  == 105 ) then
						Talk(5,"","B萴 b竜 tng qu﹏! T筰 h� v鮝 頲 tin Khi誸 n  chu萵 b� 10 v筺 tinh binh, b祔 Thi猲 M玭 tr薾 s緋 t蕁 c玭g Nh筺 M玭 quan!","C� th藅 kh玭g? Ngi nghe t� u v藋?","T筰 h� v鮝 t� ch� <color=red>Dng Di猲 Huy<color> tr� v�.","C莡 tr阨 ph� h� cho Nhi t�! Ngi mau quay l筰 b竜 cho <color=red>Di猲 Huy<color>  thi誹 gia y猲 t﹎! M鋓 vi謈  c� ta lo li謚, n誹 c� th阨 gian th� v� th╩ ph� m蓇!","T筰 h� s� l藀 t鴆 n <color=red>B� L筩 Vng K�<color> b竜 cho <color=red>Dng i nh﹏ <color>!")
							----AddItem(0,0,0)
						  --Earn(10000)
						  ModifyExp(10000)
							SetTask(1401,110)	    
							AddNote("Quay l筰 B� L筩 Vng K� h錳 b竜 ph� m� M鬰 Ngh躠")
							Msg2Player("Quay l筰 B� L筩 Vng K� h錳 b竜 ph� m� M鬰 Ngh躠")
		elseif ( UWorld1401  == 110 ) then
							Talk(1,"","Phi襫 b籲g h鱱 h錳 b竜 l筰 cho nhi t� <color=red>Dng Di猲 Huy<color>.")
							
--以下是雁门关任务的大结局---------------------------------------
		elseif ( UWorld1401  == 130 ) then
				Talk(3,"","B萴 b竜 Tng qu﹏, t筰 h� v鮝 t� ch� <color=red>Ti猽 Thi猲 H鵸<color> bi誸 頲 <color=yellow>B秐  S琻 H� X� T綾<color> hi謓 � Thi猲 M玭 tr薾. V� quy誸 畂箃 頲 n�, Khi誸 n  chu萵 b� 10 v筺 tinh binh.","<color=yellow>B秐  S琻 H� X� T綾<color> l筰 xu蕋 hi謓 r錳, nghi謕 chng y! Nh� ngi mau n <color=red>Thi猲 M玭 tr薾<color> 畂箃 t蕀 <color=yellow>B秐  S琻 H� X� T綾<color> !","T筰 h� v祇 <color=red>Thi猲 M玭 tr薾<color> nh蕋 nh s� 畂箃 頲 t蕀 <color=yellow>B秐 у S琻 H� X� T綾<color>")
		    SetTask(1401,135)
		    ----AddItem(0,0,0)
		    --Earn(10000)
		    ModifyExp(10000)
		    AddNote("V韎 danh ngh躠 tng l躰h qu﹏ T鑞g v祇 Thi猲 M玭 tr薾 畂箃 t蕀 B秐  S琻 H� X� T綾. (sau n祔 c� th� i l筰)")
		    Msg2Player("V韎 danh ngh躠 tng l躰h qu﹏ T鑞g v祇 Thi猲 M玭 tr薾 畂箃 t蕀 B秐  S琻 H� X� T綾. (sau n祔 c� th� i l筰)")
		
		elseif ( UWorld1401  == 125 or UWorld1401  == 135 ) then
				Talk(1,"","Sao r錳? C� tin t鴆 g� c馻 qu﹏ Li猽 kh玭g?")
		
		else
								Talk(1,"","Ch� So竔 Trng kh玭g 頲 t飝 ti謓!")
	end
end;
