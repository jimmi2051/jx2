-- 机关人， 开启批量制造功能

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	Say("B筺 mu鑞 d飊g c� quan nh﹏? N� c� th� gi髉 b筺 m� m閠 s� ch鴆 n╪g trong 1 gi�.", 2, "ng/#yes_use("..nItemIndex..")", "Sai/no_say")
end

function yes_use(nItemIndex)
	if GetTask(2509) > 0 then
		Say("B筺  d飊g m閠 c� quan nh﹏.", 0)
	else
		if DelItem(2,1,1011,1) == 1 then
			SetTask(2509, 3600 * 18)
			Msg2Player("B筺  d飊g 1 c� quan nh﹏ ")
		end
	end
end