--File name:laojiu_item.lua
--Describe:祭拜品道具脚本
--Create Date:2006-3-24
--Author:yanjun
Include("\\script\\online\\qingming\\qingming_head.lua");

function OnUse()
	local MapID,MapX,MapY = GetWorldPos();
	if MapID ~= 818 and MapID ~= 819 and MapID ~= 820 then	--确保在那三张地图上
		Talk(1,"","V藅 ph萴 n祔 ch� s� d鬾g khi c髇g t� ti猲.");
		return FALSE;
	end;
	local selTab = {
				"Л頲! Ta mu鑞 s� d鬾g./use",
				"Th玦  sau n祔 h穣 d飊g./nothing",
				};
	Say("Ngi c� ng � d飊g ru ngon  b竔 t� kh玭g?",2,selTab);
end;

function use()
	local nDay = tonumber(date("%d"));
	if Get_Task_Byte(JIBAI_ITEM,3) ~= nDay then
		Set_Task_Byte(JIBAI_ITEM,3,0);
	end;
	if Get_Task_Byte(JIBAI_ITEM,3) == 0 then
		if DelItem(2,0,389,1) == 1 then
			Set_Task_Byte(JIBAI_ITEM,3,nDay);
			local nTotalLuck = Get_Task_Byte(JIBAI_ITEM,4);
			Set_Task_Byte(JIBAI_ITEM,4,nTotalLuck+5);
			if Get_Task_Byte(JIBAI_ITEM,4) > 10 then
				Set_Task_Byte(JIBAI_ITEM,4,10);
			end;			
			Msg2Player("Ngi b竔 t� b籲g ru ngon c� th� th蕐 h玬 nay ngi r蕋 th祅h t﹎");
			Write_Log("S� d鬾g v藅 ph萴","Х d飊g ru ngon b竔 t�.  ");
		end;
	else
		Talk(1,"","Ngi h玬 nay  b竔 t� b籲g ru ngon, kh玭g th� s� d鬾g v藅 ph萴 n祔 n鱝");
	end;
end;

function nothing()

end;