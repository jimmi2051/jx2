--=============================================
--create by baiyun 2009.5.29
--describe:越南版7月份活动之五种树，种子包脚本
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
--所有活动给种子包奖励的统一头文件
Include("\\script\\online_activites\\award.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\function\\vip_card\\vc_head.lua")

function OnUse(nItemIdx)
	Talk(1, "", "T輓h n╪g t筸 ng nh� !!!!")
	do return end
	--local nMainType = GetItemGenre(item)--主类型
	--local nSecondType = GetItemDetail(item)--副类型
	--local nDetailType = GetItemParticular(item)--详细类型
	local nExpire = GetItemExpireTime(tonumber(nItemIdx));
	if gf_Judge_Room_Weight(7, 10, " ") == 0 then           --by：xiongyizhi 2010年圣诞活动添加新活动材料入口，增加一个空间判断
		return
	end
	local seedtab = {2, 1, 30086, 6};
	--if DelItem(nMainType, nSecondType, nDetailType, 1) == 1 then
	if DelItemByIndex(nItemIdx, 1) == 1 then
		Give_seedbag_Award()           --by：xiongyizhi 2010年圣诞活动添加新活动材料入口
		for i  = 1, 6 do
			local nIsSuccess, nItem=  AddItem(2, 1, 30086, 1);
			if nExpire > 0 then
				SetItemExpireTime(nItem, nExpire);
			end
		end
		-- Bang h閕 tinh anh 6 , ngu錸 ra hoa h錸g
		local nDate = tonumber(date("%y%m%d"))
        	if nDate >= 110930 and nDate <= 111023 then
        		gf_AddItemEx2({2, 0, 1164, 20, 1}, "Hoa H錸g Ph蕁", "Bang Hoi Tinh Anh 6", "m� T骾 H箃 Gi鑞g")
        	end
        	VietSeedBagAwards()
		--gf_AddItemEx(seedtab, "H箃 gi鑞g");
		--武林vip令
		_vc_OpenSeedBag();
		FireEvent("event_mission_task_award", "planttree", "openseedbag", 0)
	end
end