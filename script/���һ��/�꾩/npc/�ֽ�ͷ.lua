--汴京新手主动任务
--樊万松 2004.01.26

function main (sel)
  UWorld1505 = GetTask(1505)
  if(GetLevel() > 4 and  UWorld1505 == 0) then
	 		Say("V� c玭g ta tuy cao nh璶g v蒼 ch璦 t譵 頲 cao , ti觰 huynh  gi髉 ta m閠 chuy謓 頲 kh玭g?",2,"Л頲!/yes1505","Ta b薾 r錳!/no1505")
 	elseif (GetLevel() > 4 and  UWorld1505 == 5) then
 			Talk(1,"","T莕 鴆 產ng � Bi謓 Kinh ph�, phi襫 ti觰 huynh !")
 	elseif (GetLevel() > 4 and  UWorld1505 == 10) then
 			Talk(1,"","Ta nghe n鉯 T莕 Khi猰 產ng � ph� ng Bi謓 Kinh, phi襫 ti觰 huynh !")
 	elseif (GetLevel() > 4 and  UWorld1505 == 15) then
 			Talk(1,"","цi tho筰 v韎 T莕 Khi猰 ch璦? Xem ra  t� ta c� hy v鋘g r錳!")
 	elseif (GetLevel() > 4 and  UWorld1505 == 20) then
 			Talk(1,"","Ti觰 huynh  gi髉 gi秈 khoay sau n祔 ta nh蕋 nh b竜 p!")
 	else
 			Talk(1,"","礽! V� c玭g ta tuy cao nh璶g n gi� v蒼 ch璦 c� m閠  , sao y?")
 	end
end;
 	
 	function yes1505()
 		Talk(1,"","Kh� kh╪ l緈 m韎 t譵 頲 m閠 ngi t� ch蕋 t鑤, h緉 t猲 T莕 鴆 nh璶g kh玭g ch辵 b竔 ta l祄 s� ph�, gi� sao y?")
 		Talk(1,"","Ng礽 y猲 t﹎  t筰 h� 甶 khuy猲 h緉!")
 		SetTask(1505,5)
 	end
 	
 	function no1505()
 		Talk(1,"","N誹 ti觰 huynh  b薾 th� ta nh� ngi kh竎 v藋!")
 	end
 			
  
