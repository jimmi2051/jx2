--08春节天时注解脚本
--by vivi
--2008/01/14

function OnUse()
	Say("S� d鬾g Thi猲 Th阨 Ch� Gi秈 s� t╪g 1000 kinh nghi謒 thu th藀 k� n╪g, b筺 mu鑞 t╪g k� n╪g kinh nghi謒 s鑞g n祇? <color=yellow>Ch� �: t╪g kinh nghi謒 s� kh玭g vt qu� ng c蕄 k� n╪g s鑞g trc y.<color>",
		5,
		"цn c﹜/#get_lifeskill_exp(1)",
		"L祄 da/#get_lifeskill_exp(2)",
		"Уo kho竛g/#get_lifeskill_exp(5)",
		"K衞 t�/#get_lifeskill_exp(6)",
		"Kh玭g s� d鬾g/")
end

function get_lifeskill_exp(nType)
	if GetLifeSkillLevel(0,nType) == 0 then
		Talk(1,"","B筺 ch璦 h鋍 頲 k� n╪g s鑞g n祔.");
	elseif GetLifeSkillLevel(0,nType) >= 99 then
		Talk(1,"","K� n╪g s鑞g c馻 b筺  t t韎 c蕄 99, kh玭g th� nh薾 ti誴 kinh nghi謒.");
	else
		if GetLifeSkillLevel(0,nType) == 79 and GetLifeSkillMaxLevel(0,nType) == 79 then
			Talk(1,"","Kinh nghi謒 s鑞g hi謓 t筰 c馻 b筺  vt gi韎 h筺, kh玭g th� t╪g kinh nghi謒 頲 n鱝.");
			return
		end 
		if DelItem(2,1,3210,1) == 1 then
			AddLifeSkillExp(0,nType,1000);
		end
	end
end