-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 幸运礼包文件
-- Edited by Starry
-- 2005/11/09 PM 13:43

-- 诺不轻许，故我不负人；言不轻信，故人不负我！

-- ======================================================
function OnUse()
	
	Say("Trc khi m� qu�, vui l遪g x竎 nh薾  kho秐g tr鑞g v� s鴆 l鵦 c馻 h祅h trang, tr竛h r琲 r韙 v藅 ph萴 ra ngo礽!",
			2,
			"уng �/ConfirmUse",
			"L竧 sau s� m�/CancelUse");
	
end;

function ConfirmUse()

	local bIsExist = 0;
	bIsExist = DelItem(2,0,349,1,1);
	if bIsExist ~= 1 then
		return
	end

local nBodyType = GetBody()
local i = 0;
local j = 107+random(1,3);
local k = 188+random(1,6);
local n = 22+random(1,6);

		--俊俏男外装	
		if nBodyType == 1 then
			i=random(1,18);
			AddItem(0,j,i,1,1);
		end;

		--肌肉男外装	
		if nBodyType == 2 then
			i=random(19,36);
			AddItem(0,j,i,1,1);
		end;

		--肉麻女外装	
		if nBodyType == 3 then
			i=random(37,54);
			AddItem(0,j,i,1,1);
		end;		

		--可爱女外装	
		if nBodyType == 4 then
			i=random(55,72);
			AddItem(0,j,i,1,1);
		end;
		
		--修罗秘笈
		if random(1,10000) <= 10 then
			AddItem(0,107,60,1,1);
		end;
		
		--1小块金犀
		if random(1,100) <= 50 then
			AddItem(2,1,148,1,1);
		end;
		
		--1个30级马牌
		if random(1,100) <= 50 then
			AddItem(0,105,1,1,1,-1,-1,-1,-1,-1,-1);
		end;  
		
		--1个烟花
		if random(1,100) <= 50 then
			AddItem(2,1,k,1,1);
		end;    
		
		--1个九转还魂丹
		if random(1,100) <= 50 then
			AddItem(1,0,32,1,1);
		end;   
				
		AddItem(0,200,n,1,1);	 --1个黄金工具		
		AddItem(2,0,109,1,1);  --1蓬莱仙露
		AddItem(2,0,225,1,1);  --1奖券
		AddItem(2,2,8,1,1);    --1陨铁
		
end;

--空函数，什么都不做
function CancelUse()

end;	