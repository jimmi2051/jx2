--任务
--地点：汴京府  任务：天门阵任务结点11
--策划：樊万松  2004.03.
Include("\\script\\task\\world\\task_award.lua");

function main()
UWorld1401 = GetTask(1401) 
if ( UWorld1401 == 75 )  then
		Talk(9,"","Чi ca kh醗 kh玭g?","<color=green>Nhi猽 L﹏<color>:�","Xin h醝 i ca c� bi誸 <color=red>Ti猽 Y課 Y課<color> v� <color=red>H祅 c Nhng<color> � u kh玭g?","Ta bi誸, nh璶g <color=red>h� Ti猽 v� h� H祅  u thu閏 d遪g d鈏 qu� t閏<color> m閠 ngi H竛 nh� ngi sao c� th� quen bi誸 h�?","Ta 頲 s� 駓 th竎 c馻 m閠 ngi n v蕁 an h�.","Th� ra l� v藋! T猲 h� H祅  c� l� v鑞 c騨g l� ngi H竛. M蕐 h玬 trc nghe Чi Vng n鉯 l穘h a T鑞g Tri襲 s緋 thu閏 v� tay ch髇g ta r錳.","N鉯 v藋 l� c竎 ngi s緋 xu蕋 binh r錳 �? L� n祇 <color=yellow>t蕀 b秐  S琻 H� X� T綾<color> c竎 ngi  畂箃 頲 r錳?","Sao c� nh綾 n <color=yellow>B秐  S琻 H� X� T綾<color> ho礽 v藋? Ngi n <color=red>B� L筩 Vng K�<color> t譵 ph� m� <color=red>M鬰 Ngh躠<color> h醝 甶 nh�!"," t� i ca!")
    SetTask(1401,80)
    GivePlayerExp(SkeyTianmenzhen,"dacaoyuan")
    Earn(1000)
    ModifyReputation(15,0)
    --AddNote("自此向北去王旗部落找驸马穆义才有可能打听到萧燕燕与韩德让的下落。")
    TaskTip("дn B� L筩 Vng K� t譵 ph� m� M鬰 Ngh躠 h醝 th╩ tin t鴆 c馻 Ti猽 Y課 Y課 v� H祅 c Nhng.")
    
elseif ( UWorld1401  == 85 ) then
		Talk(3,"","Nhi猽 L﹏ i ca, v� binh c馻 B� L筩 Vng K� kh玭g cho v祇, l祄 c竎h n祇 y?","Ta 產ng ph� tr竎h v薾 chuy觧 lng th鵦 v祇 B� L筩 Vng K�, nh﹏ c� h閕 n祔 c� th� tr� tr閚  v祇. Ngi mau n <color=red>Kim Quang ng<color> v� <color=red>Long H� ng<color> l蕐  <color=red>10 G蕀 v祅g<color>, <color=red>10 M鬰 L玦 V╪ o<color>, <color=red>5 Ch� Nam Ng�<color> v� y!","T筰 h� s� 甶 ngay sau  ch th﹏ v薾 chuy觧 v祇 <color=red>B� L筩 Vng K�<color> giao t薾 tay cho ph� m� <color=red>M鬰 Ngh躠<color>, ngi y猲 t﹎!")
    SetTask(1401,90)
    GivePlayerExp(SkeyTianmenzhen,"huifu")
    Earn(1000)
    ModifyReputation(10,0)
    TaskTip("T譵 10 G蕀 v祅g, 10 M鬰 L玦 V╪ o, 5 Ch� Nam Ng�, giao cho M鬰 Ngh躠 � Vng K�.")

elseif ( UWorld1401  == 90 ) then
		if ( GetItemCount(2,1,54) < 10 or GetItemCount(2,1,75) < 10 or GetItemCount(2,1,96) < 5 )  then
				Talk(1,"","дn <color=red>Kim Quang ng<color> v� <color=red>Long H� ng<color> l蕐 <color=red>10 G蕀 v祅g<color>, <color=red>10 M鬰 L玦 V╪ o<color>, <color=red>5 Ch� Nam Ng�<color> n B� L筩 Vng K� giao cho <color=red>ph� m� M鬰 Ngh躠<color>")
		else
				Talk(1,"","Chu萵 b� v藅 ph萴 xong ch璦? Mau n <color=red>B� L筩 Vng K�<color> giao cho <color=red> ph� m� M鬰 Ngh躠<color>.")
		end
	
elseif ( UWorld1401  == 80  ) then
		Talk(1,"","Ngi n <color=red>B� L筩 Vng K�<color> h醝 xem may ra c� ch髏 manh m鑙.")	
elseif ( UWorld1401  > 90  ) then
	Talk(1,"","Sao r錳? T譵 頲 h� kh玭g?")
else
	Talk(1,"","B� L筩 Vng K� 產ng c莕 ta chuy觧 lng th鵦 n  g蕄!")
end
end;
