
Include("\\script\\task\\faction\\faction_main_tm.lua"); -- 唐门师门任务的脚本头文件
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_扬州\\task_two_main.lua");

function main()
    local nStep = GetTask(TASK_YZ_TWO);
    if nStep == 1 then
        task_01_00();
        return
    elseif nStep == 2 then
        task_02_00();
        return
    elseif nStep == 4 then
        task_04_00();
        return
    end;

local nTaskValue = FN_GetTaskState(FN_TM)

	if (nTaskValue==2) then
		task_005();
		return
	elseif (nTaskValue==3) then
		task_006();
		return
	elseif (nTaskValue<8) then
		Say("Ngi n C� quan ph遪g h醝 Л阯g V﹏ xem s� H鉧 C鑤 T竛 n祔 d飊g th� n祇 m韎 c� hi謚 qu�.",0);
		return
	else
	
		local i=random(1,3)
		if i == 1 then
			Say("Ch� c莕 l� c dc nh蕋 nh c� thu鑓 gi秈. Ch� s� c t輓h qu� cao kh玭g k辮 kh綾 ch� th玦.",0)
		elseif	i == 2 then
			Say("C竎h h� c c馻 Ng� чc r蕋 c bi謙, n誹 kh玭g ph秈 m玭 quy nghi猰 ng苩 ta  b総 v礽 t猲  t� Ng� чc v�  tra h醝.",0)
		else
			Say("Kh玭g ph秈 l�  t� Л阯g M玭 ng h遪g ta cho thu鑓 gi秈 c.")
		end
	end
	
end;

