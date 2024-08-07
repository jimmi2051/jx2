--File name:little_boss_npc.lua 
--Describe:三节连过，小BOSS（对话NPC）
--Create Date:2006-8-22
--Author:yanjun

Include("\\script\\online\\3festival\\3festival_head.lua")
function main()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex <= 0 then
		return 0;
	end;
	if GetUnitCurStates(nNpcIndex,0) == 1 then
		return 0;
	end;
	local sNpcName = GetNpcName(nNpcIndex);
	if GetLevel() < 30 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ъng c蕄 c馻 ngi qu� th蕄, ta kh玭g th� giao b秓 v藅 cho ngi. Xung quanh y c� r蕋 nhi襲 k� gian, h穣 甶 d箉 b秓 h�, khi t c蕄 <color=yellow>30<color> h穣 n t譵 ta.");
		return 0;
	end;
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIndex);
	if Get_Distance(nMapX,nMapY) >= 10 then
		Msg2Player("B筺 v�"..sNpcName.." c竎h nhau qu� xa");
		return 0;
	end;
	if GetTask(TASK_GOT_ITEM_TIME) ~= 0 and GetTime() - GetTask(TASK_GOT_ITEM_TIME) <= 60*60 then	--如果相隔两次得到物品的时间相差小于60分钟
		if random(1,50) == 11 then
			Talk(1,"","<color=green>"..sNpcName.."<color>: C� nhi猽  th玦 sao?");
		else
			Talk(1,"","<color=green>"..sNpcName.."<color>: Ngi  l蕐 1 b秓 v藅, m鏸 ti課g m閠 ngi ch� 頲 l蕐 1 b秓 v藅 m� th玦.");
		end;
		return 0;
	end;
	
	local nItemID = 0;
	for i=1,getn(tBossInfo) do
		if sNpcName == tBossInfo[i][4] then
			nItemID = i;
			break;
		end;
	end;
	if nItemID == 0 then
		WriteLog("[L鏸 Tam ti誸 li猲 th玭g]: Nh蕄 chu閠 v祇 Boss nh� kh玭g t譵 th蕐 th玭g tin v藅 ph萴");
		return 0;
	end;
	setunit_curstates(nNpcIndex,0,1);
	SetNpcLifeTime(nNpcIndex,0);
	SetTask(TASK_GOT_ITEM_TIME,GetTime());
	local nRand = random(1,1000);
	if nRand <= 920 then
		AddItem(tItemInfo[17][2],tItemInfo[17][3],tItemInfo[17][4],1);
		Msg2Player("B筺 nh薾 頲 1 "..tItemInfo[17][1]);
	elseif nRand <= 974 then
		AddItem(tItemInfo[22][2],tItemInfo[22][3],tItemInfo[22][4],1);
		Msg2Player("B筺 nh薾 頲 1 "..tItemInfo[22][1]);
		Msg2Global(GetName().."Tham gia ho箃 ng, nh薾 頲 1 quy觧 "..tItemInfo[22][1]);
	elseif nRand <= 999 then
		AddItem(tItemInfo[18][2],tItemInfo[18][3],tItemInfo[18][4],1);
		Msg2Player("B筺 nh薾 頲 1 "..tItemInfo[18][1]);
		Msg2Global(GetName().."Tham gia ho箃 ng, nh薾 頲 1 "..tItemInfo[18][1]);
		WriteLog("[08 Tam ti誸 li猲 th玭g]: Ngi ch琲"..GetName().."Tham gia ho箃 ng nh薾 頲 1 "..tItemInfo[18][1]);
	else
		AddItem(tItemInfo[23][2],tItemInfo[23][3],tItemInfo[23][4],1);
		Msg2Player("B筺 nh薾 頲 1 "..tItemInfo[23][1]);
		Msg2Global(GetName().."Tham gia ho箃 ng, nh薾 頲 1 quy觧 "..tItemInfo[23][1]);
		WriteLog("[08 Tam ti誸 li猲 th玭g]: Ngi ch琲"..GetName().."Tham gia ho箃 ng nh薾 頲 1 "..tItemInfo[23][1]);
	end;
	if random(1,100) == 11 then
		Say("<color=green>"..sNpcName.."<color>: "..tRandString[random(1,getn(tRandString))],0);
	end;
end;

function setunit_curstates(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		print("Thi誸 l藀 tr� s� NPC nh莔: V� tr�:"..att_seq.."Tr�:"..number)
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end

tRandString = {
			"S� qu�! Sau n祔 kh玭g d竚 n ph� n鱝!",
			"VLTK2 ch骳 b筺 n╩ m韎 vui v�!",
			"Qu鑓 Kh竛h vui v�!",
			"Trung Thu vui v�!",
			"S� qu�! Sau n祔 kh玭g d竚 n ph� n鱝!",
			"S� qu�! Sau n祔 kh玭g d竚 n ph� n鱝!",
			"S� qu�! Sau n祔 kh玭g d竚 n ph� n鱝!",
			"S� qu�! Sau n祔 kh玭g d竚 n ph� n鱝!",
			"S� qu�! Sau n祔 kh玭g d竚 n ph� n鱝!",
			"S� qu�! Sau n祔 kh玭g d竚 n ph� n鱝!",
			"S� qu�! Sau n祔 kh玭g d竚 n ph� n鱝!",
			"S� qu�! Sau n祔 kh玭g d竚 n ph� n鱝!",
			"S� qu�! Sau n祔 kh玭g d竚 n ph� n鱝!",
			"S� qu�! Sau n祔 kh玭g d竚 n ph� n鱝!",
			"S� qu�! Sau n祔 kh玭g d竚 n ph� n鱝!",
			"S� qu�! Sau n祔 kh玭g d竚 n ph� n鱝!",
			"S� qu�! Sau n祔 kh玭g d竚 n ph� n鱝!",
			"S� qu�! Sau n祔 kh玭g d竚 n ph� n鱝!",
			}