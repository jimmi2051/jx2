--任务
--地点：汴京 任务：天门关任务结点3
--策划：樊万松  2004.03.
Include("\\script\\task\\world\\task_award.lua");

function main()
UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 15  )  then
		Talk(1,"say1401_3","Huynh i tng m筼 uy nghi猰, 総 ph秈 l� Bang ch�. D竚 h醝 huynh i v� lai l辌h c馻 t蕀 <color=yellow>B秐  S琻 H� X� T綾<color>?")
	elseif ( UWorld1401  == 20 and GetItemCount(2,1,34) >= 5 )then
				if  DelItem(2,1,34,5) == 1 then
						    Talk(3,"","Ha ha収� n l骳 i ca n祔 n c鴘 c竎 huynh  ra kh醝 ch鑞 lao t�!!!","Чi ca ng n玭 n鉵g! H穣 n鉯 cho t筰 h� bi誸 <color=yellow>B秐  S琻 H� X� T綾<color> l� v藅 g�?","<color=yellow>B秐  S琻 H� X� T綾<color> trong truy襫 thuy誸 l� th莕 v藅 c� s鴆 m筺h th莕 ph鬰 thi猲 h�. K� l祄 quan c� 頲 s� 頲 l祄 ho祅g , ngi luy謓 v� c� 頲 c� th� th鑞g nh蕋 giang h�! Ch� Thi猲 T� m韎 c� 頲 th莕 v藅 n祔! Ch糿g hi觰 v� sao g莕 y truy襫 r籲g th莕 v藅 xu蕋 hi謓 � <color=red>Nh筺 M玭 quan<color>. Mu鑞 bi誸 r� h穣 n  xem th�!")
						    SetTask(1401,25)
						    GivePlayerExp(SkeyTianmenzhen,"xunwen")
						    Earn(1000)
						    ModifyReputation(15,0)
						    --AddNote("得知“山河社稷图”的作用，但是需要去“雁门关”做进一步调查")
						    TaskTip("Bi誸 頲 t竎 d鬾g c馻 B秐  S琻 H� X� T綾 nh璶g c莕 n Nh筺 M玭 quan 甶襲 tra th猰!")
				else
						 Talk(1,"","Chuy觧 giao v藅 ph萴 kh玭g th祅h c玭g")
				end
	elseif ( UWorld1401  == 20 and GetItemCount(2,1,34) < 5 ) then
				Talk(1,"","<color=red>H筺h Hoa th玭<color> c� nhi襲 <color=red>Quan s�<color> tham lam. H穣 畂箃 <color=red>5 b� quan ph鬰<color> c馻 ch髇g v�!")
	elseif ( UWorld1401  == 25 ) then
				Talk(1,"","H穣 n <color=red>Nh筺 M玭 quan<color> 甶襲 tra r� ng鋘 ngu錸!")
	else
				Talk(1,"","B鋘 quan ph� canh ph遪g thi猲 lao qu� nghi猰 ng苩! Th藅 l� ng gh衪!")
	end
end;

function  say1401_3()
		Say("Ta mu鑞 t nh藀 v祇 thi猲 lao, gi� c莕 <color=red>20 b� quan ph鬰<color> c馻 <color=red>Quan s�<color> � <color=red>H筺h Hoa th玭<color>. Ngi ng h醝 t筰 sao, ch� c莕 n鉯 c� gi髉 hay kh玭g?",2,"уng �/yes1401_3","Kh玭g gi髉/no1401_3")
end;

function  yes1401_3()
		Talk(2,"","Bang ch�  nh�, nh蕋 nh ph秈 gi髉!","T鑤 l緈! H穣 n  l蕐 quan ph鬰 v�!")
		SetTask(1401,20)
		--AddNote("去帮“曹大力”收集5套官服，才能进一步打听到消息。")
		TaskTip("Gi髉 T祇 Чi L鵦 thu th藀 5 b� quan ph鬰, c� th� d� th竚 th猰 ch髏 tin t鴆!")
end;

function  no1401_3()
	Talk(1,"","T筰 h� kh玭g mu鑞 c t閕 v韎 quan ph�! Xin nh� ngi kh竎!")
end;
