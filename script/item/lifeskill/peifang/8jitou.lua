-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,10)
	if nGene==1 and nSKIllId==10 and nLevel>=80 then
		AddRecipe(1053)
		AddRecipe(1054)
		AddRecipe(1055)
		AddRecipe(1056)
		AddRecipe(1077)
		AddRecipe(1078)
		AddRecipe(1079)
		AddRecipe(1080)
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: nam ti猽 chu萵 u c蕄 8 ")
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: nam kh玦 ng� u c蕄 8")
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: u g頸 c秏 c蕄 8")		
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: ti觰 u quy課 r� c蕄 8")
		DelItem(2,1,3044,1)
		else
			Msg2Player("K� n╪g ch� t筼 n鉵 tr猲 c蕄 80 m韎 h鋍 頲 ph鑙 phng n祔, b筺 kh玭g  u ki謓!")	
	end
end