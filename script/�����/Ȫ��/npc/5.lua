--任务
--地点：雁门关  任务：天门阵任务结点4
--策划：樊万松  2004.03.


function main()
UWorld1401 = GetTask(1401)
if ( UWorld1401 == 25 )  then
	Talk(7,"","Nh﹏ huynh y tng m筼 阯g 阯g, 総 h糿 l祄 th鑞g l躰h � y, xin h醝 c� bi誸 <color=yellow>B秐  S琻 H� X� T綾<color> � u kh玭g?","Qu� khen, qu� khen! Ta y ch� l� i trng th玦. <color=yellow>B秐  S琻 H� X� T綾<color> ch� c� Чi nh﹏ tng qu﹏ m韎 bi誸 頲.","V藋 phi襫 i nh﹏ b萴 b竜 m閠 ti課g, t筰 h� c� vi謈 g蕄 c莕 thng lng v韎 Tng qu﹏.","Qu﹏ doanh kh玭g th� t飝 ti謓 ra v祇, ngi i � y nh�!","C� c竎h n祇  v祇 qu﹏ doanh g苝 tng qu﹏ kh玭g?","Ngi n <color=red>Bi謓 Kinh ph�<color> t譵 <color=red>Binh b� Th� Lang<color> b竜 danh, nh璶g c騨g kh玭g ch綾 l緈."," t�  ch� gi竜.")

    SetTask(1401,30)
    ----AddItem(0,0,0)
--    Earn(10000)
    ModifyExp(10000)
    AddNote("дn Bi謓 Kinh b竜 danh.")
    Msg2Player("дn Bi謓 Kinh b竜 danh.")

elseif ( UWorld1401  == 30  ) then
	Talk(1,"","Ngi n <color=red>Bi謓 Kinh ph�<color> t譵 <color=red>Binh b� Th� Lang<color> b竜 danh, nh璶g c騨g kh玭g ch綾 l緈.")	
	
elseif ( UWorld1401  > 30  ) then
	Talk(1,"","Ch鴆 cao quy襫 tr鋘g, qu猲 m蕋 ngi huynh  n祔 r錳.")
else
	Talk(1,"","Xu⺶, ng n鉯 v藋 ch�!")
end
end;
