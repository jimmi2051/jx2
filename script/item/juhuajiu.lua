--重阳节菊花酒
--by vivi
--2007/10/16

Include("\\script\\lib\\globalfunctions.lua");

--任务变量
TASK_JHJ_NUM = 2317; --使用次数，最多5次
IB_VERSION = 1;

function OnUse()
	if GetTask(TASK_JHJ_NUM) == 5 then
		Talk(1,"","Xin l鏸, b筺  s� d鬾g 5 l莕 v藅 ph萴, kh玭g th� s� d鬾g 頲 n鱝. ");
		return
	end
	local szExp = "";
	local nLevel = GetLevel();
	if IB_VERSION == 1 then
		szExp = "Nh薾 頲 <color=yellow>"..floor(3000000*(nLevel^3)/(80^3)).." kinh nghi謒 <color>. ";
	else
		szExp = "Chuy觧 <color=yellow>"..floor(5000000*(nLevel^3)/(80^3)).." 甶觤 <color>. ";
	end;	
	Say("D飊g ru hoa c骳, b筺 c� th� "..szExp.."S� d鬾g ch�?",
		2,
		"уng �/give_exp",
		"H駓 b�/nothing")
end

function give_exp()
	if DelItem(2,0,549,1) == 1 then
		local nLevel = GetLevel();
		local nExp = 0;
		local nGoldenExp = 0;
		if IB_VERSION == 1 then
			nExp = floor(3000000*(nLevel^3)/(80^3));
			ModifyExp(nExp);
			Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒");
		else
			nGoldenExp = floor(5000000*(nLevel^3)/(80^3));
			nExp = gf_GoldenExp2Exp(nGoldenExp);
		end;
		WriteLog("[Ho箃 ng m鮪g ti誸 Tr飊g Dng]:"..GetName().."nh薾 頲 1 l莕 thng:"..nExp.." 甶觤 kinh nghi謒");
		SetTask(TASK_JHJ_NUM,GetTask(TASK_JHJ_NUM)+1);
	end
end