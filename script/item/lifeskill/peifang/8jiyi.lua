-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,5)
	if nGene==1 and nSKIllId==5 and nLevel>=80 then
		AddRecipe(1057)
		AddRecipe(1058)
		AddRecipe(1059)
		AddRecipe(1060)
		AddRecipe(1081)
		AddRecipe(1082)
		AddRecipe(1083)
		AddRecipe(1084)
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: ti猽 chu萵 nam y c蕄 8")
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: kh玦 ng� nam y c蕄 8")
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: y ph鬰 g頸 c秏 c蕄 8")		
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: n閕 y quy課 r� c蕄 8")
		DelItem(2,1,3045,1)
		else
			Msg2Player("K� n╪g ch� t筼 h� gi竝 t� c蕄 80 tr� l猲 m韎 h鋍 頲 ph鑙 phng n祔, b筺 kh玭g  u ki謓!")	
	end
end