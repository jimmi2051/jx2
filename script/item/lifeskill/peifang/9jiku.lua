-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,9)
	if nGene==1 and nSKIllId==9 and nLevel>=90 then
		AddRecipe(1073)
		AddRecipe(1074)
		AddRecipe(1075)
		AddRecipe(1076)
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: ti猽 chu萵 h� y c蕄 9")
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: kh玦 ng� h� y c蕄 9")
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: h� y g頸 c秏 c蕄 9")		
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: h� y quy課 r� c蕄 9")
		DelItem(2,1,3049,1)
		else
			Msg2Player("K� n╪g ch� t筼 h� y t� c蕄 90 tr� l猲 m韎 c� th� h鋍 頲 ph鑙 phng n祔, b筺 kh玭g  甶襲 ki謓!")	
	end
end