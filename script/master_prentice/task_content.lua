-- 师徒任务的内容

Include("\\script\\global\\battlefield_callback.lua")

-- 以下任务变量在	\script\master_prentice\some_op.lua 中定义过
TASK_SEED = 1290
TASK_CONTENT = 1291

tTaskContent =
{
	[1] = 
	{
		"mp_do_shimen(2)",				-- 完成2次初级师门任务
		"mp_do_shanghui(20)",			-- 完成20次商会任务
	},

	[2] = 
	{
		"mp_do_shashou(5)",				-- 完成5次杀手任务
		"mp_do_shanghui(20)",			-- 完成20次商会任务
	},

	[3] = 
	{
		"mp_do_battle(1)",				-- 打完1次战场
		"mp_do_shanghui(20)",			-- 完成20次商会任务
	},
	
	[4] =
	{
		"mp_do_cangjian(2)",			-- 藏剑过2关
		"mp_do_shanghui(20)",			-- 完成20次商会任务
	},

	[5] =
	{
		"mp_do_taixu(4)",				-- 太虚过4批怪
		"mp_do_shanghui(20)",			-- 完成20次商会任务
	},

	[6] =
	{
		"mp_do_longzhou(4)",			-- 跑完4次龙舟
		"mp_do_shanghui(20)",			-- 完成20次商会任务
	},

	[7] =
	{
		"mp_do_leitai(5)",				-- 单人擂台5次
		"mp_do_shanghui(20)",			-- 完成20次商会任务
	},
}

tTaskCustomSave =
{
	"mp_shimen",
	"mp_shashou",
	"mp_battle",
	"mp_cangjian",
	"mp_taixu",
	"mp_longzhou",
	"mp_leitai",
	"mp_shanghui",
}

function _gettask(nRet, nParam1, nParam2)
	if nRet == 15 then
		Say("е t� t筸 th阨 kh玭g 頲 nh薾 Nhi謒 v� S� ", 0)
		return
	elseif nRet == 23 then
		Say("Theo ng c蕄 th� nghi謕 v� s� lng   c馻 s� ph�, hi謓 ch� c� th� c玭g b� "..nParam2.." Nhi謒 v� S� , nh鱪g Nhi謒 v� S�  n祔 hi謓  頲 l穘h h誸", 0)
		return
	elseif nRet == 1 and nParam1 == 0 then
		Say("S� ph� hi謓 v蒼 ch璦 c玭g b� nhi謒 v�", 0)
		return
	elseif nRet == 1 and GetTask(TASK_SEED) == nParam1 and CustomDataRead("mp_shanghui") == nil then
		Say("B筺  ho祅 th祅h Nhi謒 v� S� ", 0)
		return
	elseif nRet == 1 and GetTask(TASK_SEED) == nParam1 and CustomDataRead("mp_shanghui") ~= nil then
		Say("B筺  nh薾 Nhi謒 v� S�  n祔 r錳", 0)
		return
	end
	
	SetTask(TASK_SEED, nParam1)
	SetTask(TASK_CONTENT, nParam2)
	Say("B筺  ti誴 nh薾 Nhi謒 v� S� ", 0)
	
	for index, value in tTaskCustomSave do
		CustomDataRemove(value)
	end
	
	if tTaskContent[nParam2] ~= nil then
		dostring(tTaskContent[nParam2][1])
		dostring(tTaskContent[nParam2][2])
	else
		Msg2Player("Nhi謒 v� n祔 kh玭g t錸 t筰, vui l遪g li猲 h� v韎 b� ph薾 ph鬰 v� kh竎h h祅g!")
	end
	SaveNow()
end

function mp_do_shimen(nChance)
	CustomDataSave("mp_shimen", "dd", 0, nChance)
end

function mp_do_shashou(nChance)
	CustomDataSave("mp_shashou", "dd", 0, nChance)
end

function mp_do_battle(nChance)
	CustomDataSave("mp_battle", "d", nChance)
end

function mp_do_cangjian(nStep)
	CustomDataSave("mp_cangjian", "d", nStep)
end

function mp_do_taixu(nStep)
	CustomDataSave("mp_taixu", "d", nStep)
end

function mp_do_longzhou(nChance)
	CustomDataSave("mp_longzhou", "dd", 0, nChance)
end

function mp_do_leitai(nChance)
	CustomDataSave("mp_leitai", "dd", 0, nChance)
end

function mp_do_shanghui(nChance)
	CustomDataSave("mp_shanghui", "dd", 0, nChance)
end

function mp_give_award(nTaskIndex)
	local nLevel = GetLevel()
	local nMulti = 1
	if nLevel >= 80 then
		Msg2Player("B筺  t c蕄 80, kh玭g th� nh薾 th猰 ph莕 thng c馻 Nhi謒 v� S� .")
		return
	elseif nLevel >= 73 then
		nMulti = 0.5
		Msg2Player("Ъng c蕄  t c蕄 73, ho祅 th祅h nhi謒 v� s� m玭 ch� nh薾 頲 m閠 n鯽 ph莕 thng.")
	end
	
	if nTaskIndex == 1 then				-- 徒弟奖励：师门贡献度
		if GetPlayerRoute() == 0 then
			local n = floor(50 * nMulti)
			ModifyReputation(n, 0)
			Msg2Player("B筺 nh薾 頲 ph莕 thng Nhi謒 v� S� :"..n.." 甶觤 danh v鋘g")
		else
			local n = floor(15 * nMulti)
			SetTask(336, GetTask(336) + n)
			Msg2Player("B筺 nh薾 頲 ph莕 thng Nhi謒 v� S� :"..n.." 甶觤 c鑞g hi課 S� M玭 ")
		end
	elseif nTaskIndex == 2 then			-- 徒弟奖励：声望
		local n = floor(50 * nMulti)
		ModifyReputation(n, 0)
		Msg2Player("B筺 nh薾 頲 ph莕 thng Nhi謒 v� S� :"..n.." 甶觤 danh v鋘g")
	elseif nTaskIndex == 3 then			-- 徒弟奖励：军功
		if GetPlayerRoute() == 0 then
			local nAddExp = floor(nLevel * nLevel * 110 * nMulti)
			ModifyExp(nAddExp)
			Msg2Player("B筺 nh薾 頲 ph莕 thng Nhi謒 v� S� :"..nAddExp.." 甶觤 kinh nghi謒")
		else
			SetRankPoint(5, 701, 1)	-- 衰减操作在SetRankPoint的时候才进行,所以要先衰减,再扣
			CalcBattleRank()
			local n = GetTask(701)
			local nn = floor(150 * nMulti)
			if n >= 0 then
				SetTask(701, n + nn)
			else
				SetTask(701, n - nn)
			end
			Msg2Player("B筺 nh薾 頲 ph莕 thng Nhi謒 v� S� :"..nn.." 甶觤 c玭g tr筺g")
		end
	elseif nTaskIndex == 4 then			-- 徒弟奖励：经验
		local nAddExp = floor(nLevel * nLevel * 110 * nMulti)
		ModifyExp(nAddExp)
		Msg2Player("B筺 nh薾 頲 ph莕 thng Nhi謒 v� S� :"..nAddExp.." 甶觤 kinh nghi謒")
	elseif nTaskIndex == 5 then			-- 徒弟奖励：经验
		local nAddExp = floor(nLevel * nLevel * 120 * nMulti)
		ModifyExp(nAddExp)
		Msg2Player("B筺 nh薾 頲 ph莕 thng Nhi謒 v� S� :"..nAddExp.." 甶觤 kinh nghi謒")
--	elseif nTaskIndex == 5 then			-- 徒弟奖励：健康经验转经验
--		local nGolden = GetGoldenExp()
--		local nAddExp = nLevel * nLevel * 200
--		if nAddExp > nGolden then
--			nAddExp = nGolden
--		end
--		ModifyGoldenExp(-nAddExp)
--		ModifyExp(nAddExp)
--		Msg2Player("您获得了师徒任务奖励：把"..nAddExp.."点健康经验转为了经验")
	elseif nTaskIndex == 6 then			-- 徒弟奖励：经验
		local nAddExp = floor(nLevel * nLevel * 110 * nMulti)
		ModifyExp(nAddExp)
		Msg2Player("B筺 nh薾 頲 ph莕 thng Nhi謒 v� S� :"..nAddExp.." 甶觤 kinh nghi謒")
	elseif nTaskIndex == 7 then			-- 徒弟奖励：经验
		local nAddExp = floor(nLevel * nLevel * 100 * nMulti)
		ModifyExp(nAddExp)
		Msg2Player("B筺 nh薾 頲 ph莕 thng Nhi謒 v� S� :"..nAddExp.." 甶觤 kinh nghi謒")
	end
	SaveNow()
end

function _complete_task(nRet)
	for index, value in tTaskCustomSave do
		CustomDataRemove(value)
	end
	
	if nRet ~= 0 then
		Msg2Player("B筺 kh玭g ho祅 th祅h Nhi謒 v� S�  theo th阨 gian quy nh")
		return
	end
	
	local nParam = GetTask(TASK_CONTENT)
	local nTaskIndex = mod(nParam, 256)
	mp_give_award(nTaskIndex)
	SetTask(TASK_CONTENT, 0)
	SaveNow()
end