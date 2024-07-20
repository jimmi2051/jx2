
Include("\\script\\task\\faction\\faction_main_wd.lua"); -- 门派任务头文件

function main()

local nTaskValue = FN_GetTaskState(FN_WD);

	if (nTaskValue==1) then
		task_003();
		return
	elseif (nTaskValue==2) then
		task_009();
		return
	elseif (nTaskValue==3) then
		Say("Kh� l緈! Gi� h穣 n g苝 Chng m玭.",0);
		return
	else
		Say("Mu鑞 t譵 hi觰 g� v� V� ng xin c� h醝.",0)
	end
	
end;

function start()
	Talk(1,"start2","L穙 T� m� u Чo gia, h藆 th� chia l祄 2 h� ph竔 Thi猲 S� v� Thu莕 Dng. Thi猲 S� luy謓 ph�, Thu莕 Dng luy謓 n. V� ng thu閏 h� Thu莕 Dng")
end;

function start2()
--  每个任务可以得到的奖励
	TaskExp		= 	 	 {10,0}
--	TaskReward	=	 	 {0,0}
--	TaskItem	=		{{0,2,1},
--						 {0,0,0}}
						 
--  拜山任务所用的变量 Task(107) 将用6个Bit来记录任务完成情况，每个Bit分别表示 少林/丐帮/武当/唐门/峨嵋/接到此任务
    if ( GetBit(GetTask(107), 1) == 1 ) and (GetBit(GetTask(107), 4) == 0) then
		SetTask(107, SetBit(GetTask(107), 4, 1))
		ModifyExp(TaskExp[1])
		if ( GetTask(107) == 63 ) then		--  十大门派任务完成后，这里可以做出处理
			SetTask(100, (GetTask(100) + 1))
			TaskTip("Quest Lv.8 Finished.")
		end
	end

	Say("Ngi c遪 mu鑞 h醝 g� kh玭g?",0)
end;

function zuzhi()
	Talk(1,"start2","V� ng ph竔 tr猲 c� Chng m玭,  t� i th� nh蕋 v�  t� i th� 2. Chng m玭 ph秈 do  t� xu蕋 gia m nhi謒.")
end;

function tiaojian()
	Talk(1,"start2","Mu鑞 gia nh藀 V� ng ph秈 kh玭g l祄 甶襲 竎, ch璦 gia nh藀 m玭 ph竔 kh竎 v� kh玭g 頲 ph秐 b閕 b鎛 m玭.")
end;

function rule()
	Talk(1,"start2","Ph祄 l�  t� V� ng kh玭g 頲 l祄 甶襲 竎, kh玭g k誸 giao t� ph竔. Чo gia  t� ph秈 tu﹏ th� thanh quy kh玭g 頲 ph筸 s綾 gi韎.")
end;


function task()
	Talk(1,"start2","е t� V� ng sau khi nh藀 m玭 c� th� t譵 Chng m玭 nh薾 nhi謒 v� m玭 ph竔, m鏸 ng祔 li猲 t鬰 ho祅 th祅h 20 nhi謒 v� c� th� nh薾 頲 2 gi� nh﹏ i kinh nghi謒.")
end;


function skill()
	Talk(1,"start2","V� c玭g V� ng chia l祄 2 h� Чo gia v� T鬰 gia. Чo gia  t� theo ki誱 do Du Ch蕁 Sinh o trng truy襫 th�. T鬰 gia  t� d飊g b髏 do Чi Ki誱 Ch﹗ truy襫 th�. N閕 dung c� th� ngi c� th� t譵 2 o trng h醝 r�.")
end;

function guanxi()
	Talk(1,"start2","е t� b鎛 ph竔 h祅h t萿 giang h� h穣 nh� C竔 Bang, Nga My l� h秓 bang c馻 V� ng. Thi誹 L﹎, Л阯g M玭, Th髖 Y猲, C玭 L玭, Thi猲 Ba Ph� c� m鑙 quan h� trung l藀 v韎 V� ng. Ng� чc, Minh gi竜 lu玭 i ngh辌h v韎 V� ng.")
end;

function no()
end;