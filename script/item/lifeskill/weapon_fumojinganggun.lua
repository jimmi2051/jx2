-------伏魔金刚之战意棍配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,2)
	if nGene==1 and nSKIllId==2 and nLevel>=70 then
		AddRecipe(957)
		AddRecipe(958)
		Msg2Player("B筺 h鋍 頲: Chi課 � c玭")
		DelItem(2,1,1072,1)
		else
			Msg2Player("C莕 k� n╪g c t筼 binh kh� d礽 c蕄 70 tr� l猲 m韎 c� th� h鋍, 甶襲 ki謓 c馻 b筺 kh玭g !")	
	end
end