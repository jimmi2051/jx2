------------------------------------------------------------
-- 女娲精石的脚本 nvwajingshi.lua
--
-- comment: 取下秘籍上任意一个决要。
-- creator: Tony(Jizheng)
-- Date   : Jul 20th, 2006
--
-- Item ID: 2,1,504
------------------------------------------------------------

ADDENDAR_GENRE = 2
ADDENDAR_DETAIL = 6

-- 脚本被程序默认调用的入口函数
function OnUse()
	if IsBookLocked() > 0 then
		Say("M藅 t辌h 產ng � tr筺g th竔 ng, kh玭g th� d飊g N� Oa tinh th筩h l蕐 b� ki誴 ra!", 0)
		return
	end
	
	strTab = {"Sau khi s� d鬾g <color=yellow>N� Oa tinh th筩h<color> s� tr� 1 quy觧 b� ki誴 trong m藅 t辌h c馻 trang b� hi謓 c�. B筺 mu鑞 b� b� ki誴 n祇 trong m藅 t辌h?",
			  "Ta kh玭g l蕐--H駓 b�/cancel_dialog"}
			  
	local strAddendar = {"", "", "", ""}
	local nAddendarID = {-1, -1, -1, -1}
	local nAddendarCount = 0
	for i = 0, 3 do
		strAddendar[i + 1], nAddendarID[i + 1] = GetBookAddendarName(i)
		if (nAddendarID[i + 1] ~= -1) then
			nAddendarCount = nAddendarCount + 1
		end
	end
	
	-- 没有决要要取下
	if (nAddendarCount == 0) then
		Say("Hi謓 t筰 b筺 kh玭g th� nh薾 b� ki誴!", 0)
	end
	
	-- 只有一个决要可以取下
	if (nAddendarCount == 1) then
		if (nAddendarID[1] ~= -1) then
			Say(strTab[1],
				2,
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[1].."/get_addendar_1",
				strTab[2])
		end
		if (nAddendarID[2] ~= -1) then
			Say(strTab[1],
				2,
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[2].."/get_addendar_2",
				strTab[2])
		end
		if (nAddendarID[3] ~= -1) then
			Say(strTab[1],
				2,
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[3].."/get_addendar_3",
				strTab[2])
		end
		if (nAddendarID[4] ~= -1) then
			Say(strTab[1],
				2,
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
	end
	
	-- 有两个决要可以取下
	if (nAddendarCount == 2) then
		if ((nAddendarID[1] == -1) and (nAddendarID[2] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[3].."/get_addendar_3",
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[1] == -1) and (nAddendarID[3] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[2].."/get_addendar_2",
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[1] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[2].."/get_addendar_2",
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[3].."/get_addendar_3",
				strTab[2])
		end
		if ((nAddendarID[2] == -1) and (nAddendarID[3] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[1].."/get_addendar_1",
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[2] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[1].."/get_addendar_1",
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[3].."/get_addendar_3",
				strTab[2])
		end
		if ((nAddendarID[3] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[1].."/get_addendar_1",
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[2].."/get_addendar_2",
				strTab[2])
		end
	end
	
	-- 有三个决要可以取下
	if (nAddendarCount == 3) then
		if (nAddendarID[1] == -1) then
			Say(strTab[1],
				4,
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[2].."/get_addendar_2",
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[3].."/get_addendar_3",
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if (nAddendarID[2] == -1) then
			Say(strTab[1],
				4,
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[1].."/get_addendar_1",
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[3].."/get_addendar_3",
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if (nAddendarID[3] == -1) then
			Say(strTab[1],
				4,
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[1].."/get_addendar_1",
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[2].."/get_addendar_2",
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if (nAddendarID[4] == -1) then
			Say(strTab[1],
				4,
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[1].."/get_addendar_1",
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[2].."/get_addendar_2",
				"Ta mu鑞 nh薾 b� ki誴"..strAddendar[3].."/get_addendar_3",
				strTab[2])
		end	
	end
	
	-- 有四个决要可以取下的
	if (nAddendarCount == 4) then
		Say(strTab[1],
			5,
			"Ta mu鑞 nh薾 b� ki誴"..strAddendar[1].."/get_addendar_1",
			"Ta mu鑞 nh薾 b� ki誴"..strAddendar[2].."/get_addendar_2",
			"Ta mu鑞 nh薾 b� ki誴"..strAddendar[3].."/get_addendar_3",
			"Ta mu鑞 nh薾 b� ki誴"..strAddendar[4].."/get_addendar_4",
			strTab[2])
	end
	
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 取下决要1
function get_addendar_1()
	local strAddendar, nAddendar = GetBookAddendarName(0)
	Say("B筺 x竎 nh薾 mu鑞 l蕐 <color=yellow>"..strAddendar.."<color> ch�? Xin x竎 nh薾 c遪  s鴆 l鵦 v� kho秐g tr鑞g trong h祅h trang k蝟 nh r琲 b� ki誴!",
		2,
		"L蕐 b� ki誴!/confirm_get_addendar_1",
		"Ta kh玭g l蕐--H駓 b�/cancel_dialog")
end;
-- 确认取下决要1
function confirm_get_addendar_1()
	local strAddendar, nAddendar = GetBookAddendarName(0)
	if (DelItem(2, 1, 504, 1) == 1) then
		RemoveAddendarFromBook(0)
		AddItem(ADDENDAR_GENRE, ADDENDAR_DETAIL, nAddendar, 1)
		Say("B筺  ho祅 th祅h thao t竎 l蕐 b� ki誴 <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B筺  ho祅 th祅h thao t竎 l蕐 b� ki誴!")
	end
end;


-- 取下决要2
function get_addendar_2()
	local strAddendar, nAddendar = GetBookAddendarName(1)
	Say("B筺 x竎 nh薾 mu鑞 l蕐 <color=yellow>"..strAddendar.."<color> ch�? Xin x竎 nh薾 c遪  s鴆 l鵦 v� kho秐g tr鑞g trong h祅h trang k蝟 nh r琲 b� ki誴!",
		2,
		"L蕐 b� ki誴!/confirm_get_addendar_2",
		"Ta kh玭g l蕐--H駓 b�/cancel_dialog")
end;
-- 确认取下决要2
function confirm_get_addendar_2()
	local strAddendar, nAddendar = GetBookAddendarName(1)
	if (DelItem(2, 1, 504, 1) == 1) then
		RemoveAddendarFromBook(1)
		AddItem(ADDENDAR_GENRE, ADDENDAR_DETAIL, nAddendar, 1)
		Say("B筺  ho祅 th祅h thao t竎 l蕐 b� ki誴 <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B筺  ho祅 th祅h thao t竎 l蕐 b� ki誴!")
	end
end;


-- 取下决要3
function get_addendar_3()
	local strAddendar, nAddendar = GetBookAddendarName(2)
	Say("B筺 x竎 nh薾 mu鑞 l蕐 <color=yellow>"..strAddendar.."<color> ch�? Xin x竎 nh薾 c遪  s鴆 l鵦 v� kho秐g tr鑞g trong h祅h trang k蝟 nh r琲 b� ki誴!",
		2,
		"L蕐 b� ki誴!/confirm_get_addendar_3",
		"Ta kh玭g l蕐--H駓 b�/cancel_dialog")
end;
-- 确认取下决要3
function confirm_get_addendar_3()
	local strAddendar, nAddendar = GetBookAddendarName(2)
	if (DelItem(2, 1, 504, 1) == 1) then
		RemoveAddendarFromBook(2)
		AddItem(ADDENDAR_GENRE, ADDENDAR_DETAIL, nAddendar, 1)
		Say("B筺  ho祅 th祅h thao t竎 l蕐 b� ki誴 <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B筺  ho祅 th祅h thao t竎 l蕐 b� ki誴!")
	end
end;


-- 取下决要4
function get_addendar_4()
	local strAddendar, nAddendar = GetBookAddendarName(3)
	Say("B筺 x竎 nh薾 mu鑞 l蕐 <color=yellow>"..strAddendar.."<color> ch�? Xin x竎 nh薾 c遪  s鴆 l鵦 v� kho秐g tr鑞g trong h祅h trang k蝟 nh r琲 b� ki誴!",
		2,
		"L蕐 b� ki誴!/confirm_get_addendar_4",
		"Ta kh玭g l蕐--H駓 b�/cancel_dialog")
end;
-- 确认取下决要4
function confirm_get_addendar_4()
	local strAddendar, nAddendar = GetBookAddendarName(3)
	if (DelItem(2, 1, 504, 1) == 1) then
		RemoveAddendarFromBook(3)
		AddItem(ADDENDAR_GENRE, ADDENDAR_DETAIL, nAddendar, 1)
		Say("B筺  ho祅 th祅h thao t竎 l蕐 b� ki誴 <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B筺  ho祅 th祅h thao t竎 l蕐 b� ki誴!")
	end
end;

