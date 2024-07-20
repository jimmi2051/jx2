--filename:旗子征收人.lua
--create date:2005-12-21
--author:yanjun
--describe:职能NPC脚本
Include("\\script\\online\\元旦活动\\yuandan_head.lua")

function main()
	SetDeathPunish(0)	--确保无死亡惩罚
	if GetSex() == 1 then
		str_sex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		str_sex = "C� nng"
	else
		str_sex = "Thi誹 hi謕/N� hi謕"
	end
	SelTab = {
		"Ta mu鑞 n閜 ti猽 k�./hand_up",
		"Ta mu鑞 t譵 hi觰 ho箃 ng Nguy猲 Цn 畂箃 k�./know_detail",
		"Ta ch� mu鑞 h醝 th╩./nothing"
		}
	Say("Nguy猲 Цn 畂箃 k�  b総 u!"..str_sex..", y l� l骳 ch鴑g minh s鴆 m筺h c馻 ngi!",3,SelTab)
end

function hand_up()
	KillFollower()
	RemoveTitle(3,3)
	if GetTask(TASK_FLAG_HANDUP) ~= GetCurDate() then
		SetTask(TASK_FLAG_HANDUP,0)	--新的一天，已夺旗标记清0
	end
	if GetTask(TASK_FLAG_HANDUP) ~= 0 then
		Say("Ngi  畂箃 k� th祅h c玭g, h玬 nay kh玭g th� tham gia ti誴, ng祔 mai h穣 quay l筰 nh�!",0)
		return 0
	end
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 0 then
		Say("Xin l鏸, ngi kh玭g c� ti猽 k�!.",0)
		return 0
	end
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		SetTaskTemp(TASK_FLAG_FOLLOW,0)
		SetTask(TASK_FLAG_HANDUP,GetCurDate())
		SetGlbValue(ID_FLAG_NUMBER_QZ,GetGlbValue(ID_FLAG_NUMBER_QZ)-1)
		if GetGlbValue(ID_FLAG_NUMBER_QZ) < 0 then
			SetGlbValue(ID_FLAG_NUMBER_QZ,0)
		end
		local flag_left = GetGlbValue(ID_FLAG_NUMBER_QZ)
		if AddItem(0,102,21,1,1,-1,-1,-1,-1,-1,-1) == 1 then
			Say("Hay qu�!"..str_sex.."C� th� 畂箃 l蕐 ti猽 k�, th藅 kh玭g ph秈 d�! Зy l� ph莕 thng c馻 b筺!",0)
			Msg2Player("B筺 nh薾 頲 1 tng qu﹏ gi韎 ch�!")
		end
		if GetGlbValue(ID_FLAG_NUMBER_QZ) == 0 then
			AddGlobalNews("5 ti猽 k� � B綾 Tuy襫 Ch﹗  b� l蕐 h誸, ho箃 ng � khu v鵦 n祔  k誸 th骳.")
			Msg2SubWorld("5 ti猽 k� � B綾 Tuy襫 Ch﹗  b� l蕐 h誸, ho箃 ng � khu v鵦 n祔  k誸 th骳.")
			return 0
		end
		Msg2SubWorld("B綾 Tuy襫 Ch﹗ c遪"..flag_left.."ti猽 k�.")
	end
end

function nothing()

end

function know_detail()
	Talk(7,"","<color=red>21h v� 23h m鏸 t鑙 t� 31/12/2005 n 05/01/2006<color> � Nam Bi謓 Kinh, Nam Th祅h Й, B綾 Tuy襫 Ch﹗ m鏸 n琲 s� xu蕋 hi謓 5 ti猽 k�.","Sau khi nh蕄 chu閠 v祇 ti猽 k�, ti猽 k� s� 甶 theo b筺.","Khi mang ti猽 k�, n誹 ch誸, i b秐 , r韙 m筺g, u s� l祄 m蕋 ti猽 k�, ngi ch琲 kh竎 c� th� tranh 畂箃.","Mang ti猽 k� v� g苝 箃 k� gi竜 u c飊g b秐  s� nh薾 頲 ph莕 thng.","Ngi ch琲 ti課 v祇 b秐  畂箃 k�, v� ngi ch琲 頲 ti猽 k� u kh玭g c� s� tr鮪g ph箃 PK.","Ъng c蕄 y猽 c莡: <color=red>t� c蕄 10 tr� l猲<color>.","Ph莕 thng: <color=yellow>Tng qu﹏ gi韎 ch�<color>, n閕 c玭g t╪g 4%, ngo筰 c玭g t╪g 4%.")
end
