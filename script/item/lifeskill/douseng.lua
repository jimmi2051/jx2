-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,5)
	if nGene==1 and nSKIllId==5 and nLevel>=50 then
		AddRecipe(823)
		AddRecipe(824)
		Msg2Player("B筺 h鋍 頲 c竎h l祄: u T╪g ph鬰")
		DelItem(2,1,432,1)
		else
			Msg2Player("C蕄 50 tr� l猲 m韎 h鋍 頲 k� n╪g ch� t筼 h� gi竝, 甶襲 ki謓 c馻 b筺 ch璦 !")	
	end
end