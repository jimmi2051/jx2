--任务
--地点：汴京 任务：天门关任务结点2
--策划：樊万松  2004.03.
szNpcName = "<color=green>Nh﹏ s� giang h�<color>: "

Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

function main()
	if GetWorldPos() == 200 then
		if GetTaskTrans() == 3 then		
				trans_talk_05()	
				return
		elseif GetTaskTrans() == 4 then
			trans_talk_05_02()
			return
		end
	end
	UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 5  )  then
		Talk(1,"say1401_2","G莕 y, Bi謓 Kinh c� nhi襲 Nh﹏ s� giang h� qua l筰, d竚 h醝 c� chuy謓 g� s緋 x秠 ra?")

	elseif ( UWorld1401  == 10 and GetItemCount(2,1,19) >= 5 ) then
			
		if  DelItem(2,1,19,5) == 1 then
						    Talk(3,"","Nghe n鉯 <color=yellow>B秐  S琻 H� X� T綾<color> truy襫 thuy誸  xu蕋 hi謓 � <color=red>Nh筺 M玭 quan<color>. Thi猲 h� u  n n琲 n祔!","D竚 h醝 t蕀 <color=yellow>B秐  S琻 H� X� T綾<color> r鑤 cu閏 l� b秓 v藅 g�?","Ta kh玭g r�! Nh璶g bang ch� c馻 ta 総 s� bi誸 chuy謓 n祔! H穣 n t鰑 l莡 t譵 <color=red>T祇 Чi L鵦<color> Kim Ng璾 bang bang ch� h醝 th╩ c� s�!")
						    SetTask(1401,15)
						    ----AddItem(0,0,0)
						    Earn(800)
						    ModifyExp(1000)
						    ModifyReputation(10,0)
						    --AddNote("得知“山河社稷图”的消息，但是需要进一步调查")
						    TaskTip("Bi誸 頲 tin t鴆 B秐  S琻 H� X� T綾 nh璶g c莕 ph秈 甶襲 tra k� lng!")
		else
							 Talk(1,"","Chuy觧 giao v藅 ph萴 kh玭g th祅h c玭g")
		end

	elseif ( UWorld1401  == 10 and GetItemCount(2,1,19) < 5 ) then
				Talk(1,"","дn di n骾 <color=red>Thi誹 L﹎ t�<color> gi誸 <color=red>H� d�<color>. Ta c莕 <color=red>5 c竔 畊玦 h�<color>  ng﹎ ru!")
	elseif ( UWorld1401  == 15  ) then
				Talk(1,"","дn t鰑 l莡 t譵 <color=red>T祇 Чi L鵦<color> Kim Ng璾 bang bang ch� h醝 th╩!")
	else
				Talk(1,"","Sao ng祔 n祇 c騨g c� nhi襲 ngi n t譵 ta th� n祔!? Phi襫 ch誸 甶 頲!")
	end
end;

function  say1401_2()
		Say("Л頲! Ta s� cho ngi bi誸! Nh璶g吀i da! Ta l筰 th蘭 nh蕀 H� V� T鰑 n鱝 r錳! H穣 gi髉 ta l蕐 v� <color=red>5 c竔 畊玦 h�<color>  ng﹎ ru!",2,"уng �/yes1401_2","Kh玭g gi髉/no1401_2")
end;

function  yes1401_2()
		Talk(2,"","Ch髏 vi謈 m鋘 h穣  t筰 h� ra tay! Ch糿g phi襫 i ca ph秈 ch th﹏ ng th�!","Ra T﹜ m玭 Bi謓 Kinh ph� l� <color=red>Thi誹 L﹎ t�<color>. C� nhi襲 <color=red>H� d�<color>. H穣 c萵 th薾!")
		SetTask(1401,10)
		--AddNote("去帮“江湖人士”收集5根虎尾，才能进一步打听到消息。")
		TaskTip("Gi髉 Nh﹏ s� giang h� thu th藀 5 c竔 畊玦 h�  bi誸 th猰 tin t鴆!")
end;

function  no1401_2()
	Talk(1,"","Ta c� ch髏 chuy謓! Xin i ca h穣 nh� ngi kh竎!")
end;
