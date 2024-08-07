--File name:	seed_npc.lua
--Describe:		春节活动幸福种子npc脚本
--Create Date:	2008-12-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")


g_szLogTitle = "Hoat dong Tet 2009"		--此处分为2段只是为了不增加新的翻译
g_szFileName = "seed_npc.lua"						--文件名


function main()
	if is_new_year_09_viet_open() == 0 then
		Msg2Player("Ho箃 ng t誸  k誸 th骳.")
		return
	end

	local nNpcIndex = GetTargetNpc()
	if nNpcIndex <= 0 then
		WriteLogEx(g_szLogTitle, "NULL", "NULL", "NULL", "NULL", GetTongName(), "In file "..g_szFileName..", function GetTargetNpc() return value <= 0")
		return
	end
	SetTaskTemp(SEED_INDEX_09_NEWYEAR_VIET, nNpcIndex)

	if gf_Judge_Room_Weight(1, 20) == 0 then
		Msg2Player("Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
		return
	end

	if GetLevel() < 10 then
		Msg2Player("Ch� c� ngi ch琲 c蕄 10 tr� l猲 m韎 thu th藀 頲 h箃 gi鑞g h筺h ph骳.")
		return
	end

	if GetPlayerRoute() == 0 then
		Msg2Player("Ngi ch琲 kh玭g m玭 ph竔 kh玭g th� thu th藀 h箃 gi鑞g h筺h ph骳.")
		return
	end

	if GetItemCount(2,1,30058) < 1 then
		Msg2Player("Чi hi謕 v蒼 ch璦 c� bao tay thu th藀 n猲 kh玭g th� o h箃 gi鑞g h筺h ph骳 頲.")
		return
	end

	if GetUnitCurStates(nNpcIndex,2) ~= 1 or (GetTime() - GetUnitCurStates(nNpcIndex,1)) > PICK_TIME_09_NEWYEAR_VIET then
		SetUnitCurStates(nNpcIndex,1,GetTime())
		SetUnitCurStates(nNpcIndex,2,1)
		DoWait(7,8,PICK_TIME_09_NEWYEAR_VIET)				--进入调用
	else
		Talk(1,"","Hi謓 t筰  c� ngi ch琲 產ng thu th藀 h箃 gi鑞g h祅h ph骳 n祔.")
		return
	end
end

