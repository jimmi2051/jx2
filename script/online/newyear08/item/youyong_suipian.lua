--有用的铜器碎片脚本
--by vivi
--2008/02/17

--灵石头文件
Include("\\script\\lib\\lingshi_head.lua");

function OnUse()
	Say("<color=yellow>20<color>M秐h ng kh� c� th� i l蕐 <color=yellow>1<color>linh th筩h ng蓇 nhi猲 c蕄 1-5. B筺 mu鑞 i bao nhi猽?",
		4,
		"Ta mu鑞 i 1 linh th筩h ng蓇 nhi猲 c蕄 1-5/#youyong_lingshi(1)",
		"Ta mu鑞 i 10 linh th筩h ng蓇 nhi猲 c蕄 1-5/#youyong_lingshi(10)",
		"Ta mu鑞 i 50 linh th筩h ng蓇 nhi猲 c蕄 1-5/#youyong_lingshi(50)",
		"T筸 th阨 kh玭g i. /nothing")
end

function youyong_lingshi(nNum)
	Say("фi <color=yellow>"..nNum.."<color> linh th筩h ng蓇 nhi猲 c蕄 1-5 c莕 <color=yellow>"..(20*nNum).." <color>m秐h ng h鱱 d鬾g. B筺 ch蕄 nh薾?",
		2,
		"�, ta mu鑞 i./#confirm_youyong("..nNum..")",
		"Kh玭g, ta nh莔!/OnUse")
end

function confirm_youyong(nNum)
	local nNeedNum = 20*nNum;
	if GetItemCount(2,1,3217) < nNeedNum then
		Talk(1,"","Tr猲 ngi b筺 kh玭g  <color=yellow>m秐h ng h鱱 d鬾g<color>.");
		return
	end
	if DelItem(2,1,3217,nNeedNum) == 1 then
		for i=1,nNum do
			local nRand = random(1,5);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nRand.." (c蕄) Linh th筩h,  頲 cho v祇 T� Linh жnh.");
		end
	end
end

function nothing()

end