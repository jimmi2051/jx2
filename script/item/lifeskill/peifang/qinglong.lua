-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,4)
	if nGene==1 and nSKIllId==4 and nLevel>=90 then
		AddRecipe(1036)
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: Thanh Long")
		DelItem(2,1,3034,1)
		else
			Msg2Player("K� n╪g ch� t筼 binh kh� k� m玭 tr猲 c蕄 90 m韎 c� th� h鋍 頲 ph鑙 phng n祔, b筺 kh玭g  甶襲 ki謓!")	
	end
end