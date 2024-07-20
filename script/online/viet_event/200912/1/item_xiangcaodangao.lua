--=============================================
--create by baiyun 2009.11.18
--describe:越南版12月份活动 香草蛋糕脚本文件
--=============================================
Include("\\script\\online\\viet_event\\200912\\event_head.lua");

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20091218 or nDate > 20100124 then
		Say("V藅 ph萴 h誸 h筺 s� d鬾g!",0)
		return 0;
	end
	if gf_Judge_Room_Weight(2, 50, " ") == 0 then
		return 0;
	end
	local nHasCount = GetTask(VIET_0912_TASK_XIANGCAODANGAO_COUNT);
	if nHasCount >= VIET_0912_XIANGCAODANGAO_MAX_COUNT then
		Say("B筺  s� d鬾g v藅 ph萴 t s� kinh nghi謒 t鑙 產!",0)
		return 0;
	end    
	if DelItemByIndex(nItemIdx, 1) == 1 then
		SetTask(VIET_0912_TASK_XIANGCAODANGAO_COUNT, nHasCount + 1);
		--给物品奖励
		local szFullLogTitle = VIET_0912_STR_EVENT_LOG_TITLE
		if mod(GetTask(VIET_0912_TASK_XIANGCAODANGAO_COUNT),50) == 0 then
			gf_EventGiveRandAward(VIET_0912_XIANGCAODANGAO_AWARD_50, 100, 1, szFullLogTitle, "B竛h Kem Vani");
		else
			gf_EventGiveRandAward(VIET_0912_XIANGCAODANGAO_AWARD, 100, 7, szFullLogTitle, "B竛h Kem Vani");
		end
		--给经验        
		ModifyExp(150000);		  
	end
end
