-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nLevel=GetLifeSkillLevel(1,7)
	if GetLifeSkillMaxLevel(1,7) >= 99 then
		Talk(1,"","B筺  m� gi韎 h筺 k� n╪g n祔 r錳, kh玭g th� d飊g 頲.");
		return
	end
	if nLevel==79 then
		DelItem(2,1,3005,1)
		LearnLifeSkill(1, 7, 79, 99, 1)
		Say("B筺  xem qua 'B祇 nh Gi秈 Ng璾 у'  c� th� t╪g c蕄 n蕌 nng!",0);	
		else
		Say("K� n╪g n蕌 nng c蕄 79 m韎 h鋍 頲 s竎h n祔, b筺 kh玭g  甶襲 ki謓!",0);	
	end
end