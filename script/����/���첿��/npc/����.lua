--任务
--地点：汴京府  任务：天门阵任务结点13
--策划：樊万松  2004.03.
Include("\\script\\task\\world\\task_award.lua");


function main()
UWorld1401 = GetTask(1401) 
--以下是帮饶麟运送物资而产生的情节------------------------------------
if ( UWorld1401  == 90 ) then
		if ( GetItemCount(2,1,54) >= 20 and GetItemCount(2,1,75) >= 20 and GetItemCount(2,1,96) >=15 )  then
				if ( DelItem(2,1,54,20) == 1 and DelItem(2,1,75,20) == 1 and DelItem(2,1,96,15) == 1 ) then
					Talk(6,"","Xin h醝 i nh﹏ y c� ph秈 l� M鬰 Ngh躠?","L� ta y! C� vi謈 g� kh玭g?","T筰 h� v薾 chuy觧 lng th鵦 n.","<color=green>M閏 Ngh躠<color>: nh鱪g th� n祔 kh玭g ph秈 l� do Nhi猽 L﹏ ph� tr竎h mang l筰 hay sao?","Nhi猽 L﹏ l﹎ b謓h n猲 nh� t筰 h� chuy觧 thay!","<color=green>M閏 Ngh躠<color>: th玦 頲, ta nh薾 頲 r錳, ngi y猲 t﹎.")
					 SetTask(1401,95)
					 GivePlayerExp(SkeyTianmenzhen,"liaoguofuma")
					 ModifyReputation(20,0)
					 TaskTip("Х chuy觧 lng th鵦 n cho ph� m� M鬰 Ngh躠 nh璶g ch璦 l蕐 頲 tin t鴆.")
					 Msg2Player("Х chuy觧 lng th鵦 n cho ph� m� M鬰 Ngh躠 nh璶g ch璦 l蕐 頲 tin t鴆.")
				else
				 Talk(1,"","Chuy觧 giao v藅 ph萴 kh玭g th祅h c玭g")
				end
		else
				Talk(1,"","B籲g c竎h n祇 ngi l筰 x﹎ nh藀 頲 v祇 B� L筩 Vng K� ta?")
		end
elseif ( UWorld1401  == 95  ) then
		Talk(2,"say1401_13","T筰 h� c� chuy謓 n祔 mu鑞 b竜 cho i nh﹏.","Ngi n鉯 nhanh 甶.")	
--以下是直接贿赂守卫而引发的情节---------------------------
elseif ( UWorld1401  == 100  ) then
	Talk(2,"say1401_13","Xin h醝 i nh﹏ y c� ph秈 l� M鬰 Ngh躠?","Ngi l� ai?")
--以下是打听完穆义身世以后的情节---------------------------
elseif ( UWorld1401  == 105 ) then
		Talk(1,"","Ti觰 anh h飊g, ngi mau n <color=red>Nh筺 M玭 quan<color> b竜 cho ph� th﹏ ta l� <color=red>Dng Nghi謕<color> r籲g Khi誸 n  chu萵 b� 10 v筺 binh m� s緋 t蕁 c玭g Nh筺 M玭 quan, c遪 b祔 Thi猲 M玭 tr薾. Ta � y m鋓 vi謈 b譶h y猲 kh玭g ph秈 lo l緉g g� c�.")


--以下是帮助四郎探母的任务----------------------------------		
elseif ( UWorld1401  == 110 ) then
		Talk(4,"mytalk1","<color=green> <color>: ta  mang t譶h h譶h c馻 Khi誸 n b竜 v韎 Dng l穙 tng qu﹏ r錳.","V藋 th� t鑤 qu�, ph� th﹏ ta c� n鉯 g� n鱝 kh玭g?","Dng l穙 tng qu﹏ r蕋 vui, nh� t筰 h� nh緉 l筰 n誹 i nh﹏ c� r秐h th� v� th╩.","Ta r蕋 mu鑞 v� th╩ ph� th﹏, nh璶g b薾 r閚 th� n祔 sao 甶 頲 y?")
		SetTask(1401,115)			
			 GivePlayerExp(SkeyTianmenzhen,"wangqibuluo")
			 TaskTip("T譵 Li猽 Th玭g l謓h, qu﹏ ph鬰 T鑞g binh, gi髉 T� Lang v� th╩ ph� m蓇.")	
			 Msg2Player("T譵 Li猽 Th玭g l謓h, qu﹏ ph鬰 T鑞g binh, gi髉 T� Lang v� th╩ ph� m蓇.")	
elseif ( UWorld1401  == 115 and GetItemCount(2,0,3) >= 1  and GetItemCount(2,0,4) >= 1 ) then
		if  (DelItem(2,0,3,1) == 1 and DelItem(2,0,4,1) == 1 ) then
			Talk(2,"","L莕 n祔 ta v� th╩ ph� m蓇 ngi tranh th� th阨 gian n g苝 <color=red>Ti猽 Thi猲 H鵸<color> th╩ d� v� b秐 <color=yellow>B秐  S琻 H� X� T綾<color>, vi謈 n祔 r蕋 quan tr鋘g c� th� 秐h hng n c� nghi謕 c馻 c� Чi T鑞g v� v藋 n猲 th薾 tr鋘g.","<color=green> <color>: t鑤, c竎 h� h穣 b秓 tr鋘g! ta 甶 y.")

			 SetTask(1401,120)
			 GivePlayerExp(SkeyTianmenzhen,"chutao")
			 ModifyReputation(25,0)
			 --AddNote("去萧天佑帐下报到才能打探到进一步的消息。")
			 TaskTip("дn g苝 Thi猲 H鵸 c� th� t譵 ra ch髏 manh m鑙.")
			 Msg2Player("дn g苝 Thi猲 H鵸 c� th� t譵 ra ch髏 manh m鑙.")
			
		else
			 Talk(1,"","Chuy觧 giao v藅 ph萴 kh玭g th祅h c玭g")
		end
		
elseif (( GetItemCount(2,1,203) == 0  or  GetItemCount(2,1,204) == 0 )and UWorld1401  == 115 ) then
		Talk(1,"","<color=red>Li猽 Th玭g l謓h<color> c� th� t譵 � <color=red>Ngo筰 t閏 s竧 th�<color>, <color=red>qu﹏ ph鬰 T鑞g binh<color> c� th� n <color=red>Nh筺 M玭 quan<color> nh <color=red>T鑞g o binh<color>  l蕐!")

elseif ( UWorld1401  == 120 ) then
		Talk(1,"","Ngi n g苝 <color=red>Ti猽 Thi猲 H鵸<color> c� th� t譵 ra ch髏 manh m鑙.")
		

--以上是帮助四郎探母的任务---------------------------------------	

else
	Talk(1,"","Khi誸 n chu萵 b� 10 v筺 i qu﹏, 10 v筺 i qu﹏! Kh� l緈!")
end
end;


function  say1401_13()
	Talk(4,"mytalk2","<color=green> <color>: ta 頲 s� 駓 th竎 c馻 1 ngi b筺 n th╩ h醝 2 ngi. Xin h醝 c竎 h� c竎 bi誸 <color=red>Ti猽 Y課 Y課<color> v� <color=red>H祅 c Nhng<color> 2 ngi n祔 kh玭g?","Hai c竔 t猲 n祔 ngi c騨g d竚 t飝 ti謓 n鉯 ra sao? <color=red>Y課 Y課 l� t猲 c髆 c琺 c馻 琻g tri襲 Ti猽 Th竔 H藆. H祅 c Nhng l� t猲 g鑓 H竛 c馻 琻g tri襲 Чi th鮝 tng Gia Lu藅 Long V薾, l� n祇 ngi kh玭g bi誸?<color>","T筰 h� 頲 m閠 ngi th﹏ c馻 h� l� <color=red>H祅 Tr� Nhng<color> ph竔 n y.","<color=green>M閏 Ngh躠<color>: � , th� �. V� sau, chuy謓 c馻 Th竔 H藆 v� Th鮝 Tng ngi ng nh綾 n n鱝. C� chuy謓 g� ta lo l� 頲 r錳. Thi誹 hi謕 y l� ngi H竛?")
    SetTask(1401,105)
    GivePlayerExp(SkeyTianmenzhen,"zhenshishenfen")
    ModifyReputation(15,0)
    --AddNote("回雁门关向杨业禀报四郎杨延辉的生讯，以及契丹的行动。")
    TaskTip("Quay v� Nh筺 M玭 quan b竜 tin t鴆 c馻 T� Lang Dng Di猲 Huy v� h祅h ng c馻 Khi誸 n.")
    Msg2Player("Quay v� Nh筺 M玭 quan b竜 tin t鴆 c馻 T� Lang Dng Di猲 Huy v� h祅h ng c馻 Khi誸 n.")
	
end;

function mytalk1()
		Talk(3,"","T筰 h� c� � n祔, hay l� i nh﹏ thay trang ph鬰 thng d﹏, nh� v藋 甶 阯g s� ti謓 h琻.","H秓 k�! Nh璶g c莕 ph秈 c� <color=red>L謓h b礽<color> v� thay i trang ph鬰 c馻 <color=red>qu﹏ T鑞g<color> gi� l祄 ngi Khi誸 n m韎 頲 qua 秈.","Qu� d�! <color=red>Li猽 Th玭g l謓h<color> c� th� nh <color=red>S竧 th� ngo筰 t閏<color> quanh y  l蕐, <color=red>T鑞g ph鬰<color> c� th� n <color=red>Nh筺 M玭 quan<color> nh <color=red>T鑞g o binh<color>  l蕐!")


end;


function mytalk2()
	Talk(4,"","Ti觰 nh﹏ ch th鵦 l� ngi H竛.","<color=green>M閏 Ngh躠<color>: Tr猲 阯g n y c竎 h� c� nghe 頲 tin t鴆 c馻 <color=red>Dng Gia Qu﹏<color>? Kh玭g gi蕌 gi c竎 h�, ta v鑞 l� <color=red>Dng Gia T� Lang, t猲 Dng Di猲 Huy<color>, tr猲 chi課 trng th蕋 l筩 v韎 tng ph�, nh蒼 nh鬰 thu sinh, i t猲 th祅h M閏 Ngh躠, ngh躠 l� v韎 m閏 v� d� 2 ch� gh衟 l筰 th祅h Dng.","K� th鵦 th� t筰 h� ch輓h l� thu閏 h� c馻 Dng Nghi謕 l穙 tng, l莕 n祔 n y  th╩ d�.","Ti觰 anh h飊g, ngi mau n <color=red>Nh筺 M玭 quan<color> b竜 cho ph� th﹏ ta l� <color=red>Dng Nghi謕<color> r籲g Khi誸 n  chu萵 b� 10 v筺 binh m� s緋 t蕁 c玭g Nh筺 M玭 quan, c遪 b祔 Thi猲 M玭 tr薾. Ta � y m鋓 vi謈 b譶h y猲 kh玭g ph秈 lo l緉g g� c�.")
end;

