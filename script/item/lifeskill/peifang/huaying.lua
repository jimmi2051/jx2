-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,3)
	if nGene==1 and nSKIllId==3 and nLevel>=80 then
		AddRecipe(1017)
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: H鋋 秐h")
		DelItem(2,1,3015,1)
		else
			Msg2Player("K� n╪g ch� t筼 binh kh� ng緉 tr猲 c蕄 80 m韎 c� th� h鋍 頲 ph鑙 phng n祔, b筺 kh玭g  甶襲 ki謓!")	
	end
end