--活动奖励在这里

Include("\\settings\\static_script\\lib\\normal_exchange.lua")
Include("\\script\\isolate\\online_activites\\base\\activity_award_base.lua")

T_FinalAward = {
	room_weight = {1,100},
	--name, room,content,award
	["exp2g"] = {"Kinh nghi謒",1, {
			{"Exp", -3, 0, 0, 2000000000},
		}},
	["finish_pet_task"] = {"Ho祅 th祅h nhi謒 v� ph鬰 sinh ng h祅h", 1, {
		{"Ho祅 th祅h nhi謒 v� ph鬰 sinh ng h祅h", act_finish_pet_task, {}, 0, 0},
		}},
	["exp1g_yuntielinshi"] = {"EXP + M秐h M藅 T辌h", 1, {
			{"Exp", -3, 0, 0, 1000000000},
			{"M秐h M藅 T辌h", 2, 1, 30669, 500, 4, 0},
		}},
	["exp1g_zhenqi"] = {"EXP + Ch﹏ kh�", 1, {
			{"Exp", -3, 0, 0, 1000000000},
			{"Ch﹏ kh�", -4, 0, 0, 50000},
		}},
	["exp1g_shengwang10k_shimen10k"] = {"EXP + Danh v鋘g + 觤 s� m玭", 1, {
			{"Exp", -3, 0, 0, 1000000000},
			{"Danh v鋘g", -5, 0, 0, 10000},
			{"觤 s� m玭", -6, 0, 0, 10000},
		}},
	["exp2g_shengwang10k_shimen10k"] = {"EXP + Danh v鋘g + 觤 s� m玭", 1, {
			{"Exp", -3, 0, 0, 2000000000},
			{"Danh v鋘g", -5, 0, 0, 10000},
			{"觤 s� m玭", -6, 0, 0, 10000},
		}},
	["exp1g_dinghunyuntieshenshi"] = {"EXP + M秐h M藅 T辌h",1,  {
			{"Exp", -3, 0, 0, 1000000000},
			{"M秐h M藅 T辌h", 2, 1, 30669, 500, 4, 0},
		}},
	["ib_final1"] = {"Ph莕 thng cu鑙 phong ph�", 7, {
			{"Exp", -3, 0, 0, 2000000000},
			{"M秐h Th竔 D辌h", 2, 0, 1082, 4000},
			{"M藅 T辌h Cao C蕄", act_give_gaoji_zhenjuan, {1, 1, 1, 2}, 0, 0},
			{"Th莕 T礽 B秓 Rng", 2, 1, 30344, 3},
			{"V� Ti誹 Y V祅g", 2, 1, 30491, 5, 1, 7},
			{"Чi мnh H錸 ", 2, 1, 1113, 1, 1, 15},
			{"мnh H錸 Thi猲 Th筩h Th莕 Th筩h", 2, 1, 1067, 1, 1, 15},
		}},
}
T_VNG_AWARD = {
	finish_pet_task = 1,
}

function get_award_name(szAward)
	local t = T_FinalAward[szAward]
	if t then
		return t[1]
	end
	return ""
end

function get_award_desc(szAward)
	local t = T_FinalAward[szAward]
	if t then
		return get_list_content(t[3])
	end
	return ""
end

function get_award(szAward, nTaskId, nBitIdx)
	local t = T_FinalAward[szAward]
	if t then
		if gf_Judge_Room_Weight(t[2], T_FinalAward.room_weight[2] , "") ~= 1 then
			return 0
		end
		check_get_award(szAward,1)
		local r = award_by_list(t[3], 1, 1, nTaskId, nBitIdx)
		return r
	end
	return 0
end

function check_get_award(szAward, bNotify)
	local t = T_FinalAward[szAward]
	if t then
		local r,msg = check_award_by_list(t[3], bNotify)
		return r,msg
	end
	return 0,""
end

function check_is_vng_award(szAward)
	return T_VNG_AWARD[szAward] or 0
end