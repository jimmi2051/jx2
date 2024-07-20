TASKVAL_SHENNONGDAN	= 2502		-- 该任务变量保存神农丹的剩余时间（分钟）
SHENNONGDAN_TIME	= 8 * 60	-- 一个神农丹的时间是8个小时（单位是分钟）

function OnUse()
	local val = GetTask(TASKVAL_SHENNONGDAN)
	local UseShennong = {
		"D飊g 1 Th莕 N玭g Кn c� th� nh薾 頲 <color=yellow>8 gi�<color> Th莕 N玭g Кn.",
		"Hi謓 Th莕 N玭g Кn c遪 d� <color=yellow>".. val .."<color> ph髏, b筺 mu鑞 d飊g Th莕 N玭g Кn kh玭g?",
		"S� d鬾g Th莕 N玭g n/ask_number",
		"в ta ngh� l筰/no"
	}
	Say(UseShennong[1]..UseShennong[2],2,UseShennong[3],UseShennong[4])
end

function ask_number()
	local nItemNum = GetItemCount(2,1,343);
	if nItemNum < 1 then
		Say("Hi謓 b筺 kh玭g c�  Th莕 N玭g Кn!",1,"уng �/OnUse");
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	AskClientForNumber("UseShennongdan",1,nItemNum,"Xin h醝 d飊g m蕐 c竔");
end
function UseShennongdan(nCount)
	if GetTask(TASKVAL_SHENNONGDAN) + SHENNONGDAN_TIME * nCount > 200000000 then--超过2亿上限
		Say("Vt qu� th阨 gian gi韎 h筺!",1,"уng �/no");
		return
	end
	if DelItem(2,1,343,nCount) == 1 then
		local value = GetTask(TASKVAL_SHENNONGDAN) + SHENNONGDAN_TIME * nCount
		SetTask(TASKVAL_SHENNONGDAN, value)
		Say("Th阨 gian Th莕 N玭g n c馻 b筺 l� <color=yellow>" .. value .. "<color> ph髏 !", 0)
	else
		WriteLog("D飊g Th莕 N玭g Кn:"..GetName().."H駓 b� Th莕 N玭g Кn th蕋 b筰!");
		Say("Hi謓 b筺 kh玭g c�  Th莕 N玭g Кn!",1,"уng �/OnUse");
		return
	end
end
function no()
end
