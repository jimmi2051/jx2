-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 峨眉门派任务难民丙脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_main_em.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_江津村\\task_main.lua");

function main ()
    local nTaskValue = FN_GetTaskState(FN_EM);
    local nStep = GetTask(TASK_JJC_BING);
    
    if nTaskValue == 2 and nStep == 1 then
        local szSay = {
            "<sex>T譵 ti觰 nh﹏ c� vi謈 g�?",
            "Nhi謒 v� Nga My ph竔/em_question",
            "Nhi謒 v� Giang T﹏ th玭/jjc_question"
        };
        SelectSay(szSay);
        return
    end;
    
    if nTaskValue == 2 then
        em_question();
        return
    end;
    
    if nStep == 1 then
        jjc_question();
        return
    end;
    
  	UWorld1506 = GetTask(1506)
  	UWorld1515 = GetTask(1515)
  	if ( UWorld1506 >= 5   and  UWorld1515 == 0 )   then
  		Talk(3,"","Chu Thi謓 Nh﹏ m� kho ph竧 lng th鵦, sai ta n th玭g b竜 cho ngi bi誸."," t� B籲g h鱱  n b竜 tin, i ﹏ i c n祔 ta s� kh玭g qu猲!","Ch� l� chuy謓 nh�! ng n猲 kh竎h s竜. H穣 mau n , ta c遪 ph秈 b竜 tin cho ngi kh竎 n鱝!")
  		SetTask(1515,1)
  		UWorld1506=UWorld1506+1
  		SetTask(1506,UWorld1506)
  		if UWorld1506 == 9 then 
  			AddNote("Th玭g b竜 N筺 d﹏ xong, quay v� g苝 Chu Thi謓 Nh﹏!")
			TaskTip("Th玭g b竜 N筺 d﹏ xong, quay v� g苝 Chu Thi謓 Nh﹏!")
  		end	
  	elseif ( GetCash() >=50000  )  then
		Say("Cho t玦 v礽 ng mua m祅 th莡 ╪ 甶! Ti觰 d﹏ c遪 m� gi� v� v� con c莕 ph秈 lo, ngi n鉯 xem c遪 ai kh� h琻 ta n鱝?",2,"Th藅 l� t閕 nghi謕!/zaimin1000_yes","H穣 t譵 ngi kh竎 甶!/zaimin_no")
	elseif ( GetCash() >=4000 and GetCash() < 50000  )  then
		Say("Cho t玦 xin v礽 ng mua ch衝 ch竜 ╪ 甶! V� c馻 ti觰 d﹏  b� theo ngi kh竎, con th� b竛 cho 玭g ch� l祄 A Ho祅, ngi n鉯 xem c遪 ai kh� h琻 ta?",2,"Th藅 l� t閕 nghi謕!/zaimin500_yes","H穣 t譵 ngi kh竎 甶!/zaimin_no")
	elseif ( GetCash() >=1000 and GetCash() < 4000 )  then
		Say("Cho t玦 xin v礽 ng mua ch衝 ch竜 ╪ 甶! Ti觰 nh﹏  n bc 阯g c飊g r錳, ngi n鉯 xem c遪 ai kh� h琻 ta?",2,"Th藅 l� t閕 nghi謕!/zaimin100_yes","H穣 t譵 ngi kh竎 甶!/zaimin_no")
	elseif ( GetCash() >=50 and GetCash() < 1000 )  then
		Say("Cho ti觰 nh﹏ m蕐 ng mua ch竜 ╪ 甶! Ti觰 nh﹏ i n n鏸 ph秈 b竛 con ch�  i m祅 th莡 ╪. Ngi n鉯 xem c遪 ai kh� h琻 ta ch�?",2,"Th藅 l� t閕 nghi謕!/zaimin10_yes","H穣 t譵 ngi kh竎 甶!/zaimin_no")
	elseif ( GetCash() < 50 )  then
		Say("Ti襫 trong ngi c遪 輙 h琻 ╪ m祔 n鱝. Ngi n鉯 xem c遪 ai kh� h琻 ta n鱝?",2,"Cho d� c� c騨g kh玭g cho ngi! C� tay c� ch﹏ ch糿g l� kh玭g bi誸 t� ki誱 s鑞g sao!/zaimin_zdd","Ngi c飊g c秐h ng� ch� n猲 ch� ci/zaimin_zbd")
	end
end;

function jjc_question()
    local nStep = GetTask(TASK_JJC);
    if nStep == 4 then
        task_jjc_fq(3);
    end;
end;

function em_question()
    
    local nTaskValue = FN_GetTaskState(FN_EM);

	if (nTaskValue==2) then
	
		if (GetTask(EM_MANTALK_03)==0) then
			task_007();
			return
		else
			Say(" t� Чi hi謕!",0);
			return
		end;
		
	end
end;

function  zaimin1000_yes()
	Talk(1,"","B� T竧 chuy觧 th�! дn c鴘 ch髇g ta r錳!")
	Pay(1000)
	TaskTip("B筺 b� th� cho N筺 d﹏ 1000 ti襫 ng!")
end;

function  zaimin500_yes()
	Talk(1,"","Tr阨! Kh玭g ph秈 ta 產ng n籱 m� ch�?")
	Pay(500)
	TaskTip("B筺 b� th� cho N筺 d﹏ 500 ti襫 ng!")
end;

function  zaimin100_yes()
	Talk(1,"","Oa! ng l� ra 阯g g苝 qu� nh﹏!")
	Pay(100)
	TaskTip("B筺  a N筺 d﹏ 100 ti襫 ng!")
end;

function  zaimin10_yes()
	Talk(1,"","Xin h穣 gi髉  k� kh鑞 kh� n祔!")
	Pay(10)
	TaskTip("B筺 b� th� cho N筺 d﹏ 10 ti襫 ng")
end;

function  zaimin_no()
	Talk(1,"","L祄 琻 b� th� cho ti觰 nh﹏ v礽 ng b筩 l�.")
end;
function  zaimin_zdd()
	Talk(1,""," xin th藅 ra c騨g kh玭g t� l緈!")
end;

function  zaimin_zbd()
	Talk(1,"","Y猲 t﹎! Sau n祔 ta ph竧 t礽 m鏸 ng祔 s� a ngi 10 lng b筩.")
end;
