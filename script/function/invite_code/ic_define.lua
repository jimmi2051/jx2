Include("\\script\\lib\\globalfunctions.lua")
--测试
DebugOutput = nothing

--活动开启时间
IC_START_TIME = {2016,8,28,0,0,0};
IC_END_TIME = {2016,9,28,0,0,0};

--活动任务变量组
IC_TASK_GROUP = {8, 17};

--激活码盐
IC_INVITE_CODE_SALT = "QGacMYxIdfCfML\0KC4H6MjICYjY9jiI"

--使用的数据库表名称
IC_MYSQL_TABLE_NAME = "invite_code_1607"

--数据行为类型
IC_QUERY_TYPE_REG = 1; --注册
IC_QUERY_TYPE_QRY	= 2; --查询
IC_QUERY_TYPE_MDY = 3; --修改

--操作间隔时间s
IC_CLICK_TIME = 15;

--受邀者奖励类型
IC_FINISH_INVITE_TYPE1 = 1; --5转90级
IC_FINISH_INVITE_TYPE2 = 2; --6转90级
IC_FINISH_INVITE_TYPE3 = 3; --激活月卡
IC_FINISH_INVITE_TYPE4 = 4; --御街消费2000XU
IC_FINISH_INVITE_TYPE5 = 5; --御街消费5000XU

IC_FINISH_INVITE_TYPE6 = 6; --完成任意3个任务
IC_FINISH_INVITE_TYPE7 = 7; --完成任意4个任务
IC_FINISH_INVITE_TYPE8 = 8; --完成任意5个任务

function ck_GiveRandGem456()
	--Faction Cloth 9
	local VET_RandGem456 = {
        {1,9, "Huy誸Tr輈hTh筩h Lv4", {2,22,104,1},nil,nil,nil,nil},
        {1,9, "Nguy謙B筩hTh筩h Lv4", {2,22,204,1},nil,nil,nil,nil},
        {1,9, "H� Ph竎h Th筩h C蕄 4", {2,22,304,1},nil,nil,nil,nil},
        {1,9, "H綾 Di謚 Th筩h C蕄 4", {2,22,404,1},nil,nil,nil,nil},
        {1,8, "Huy誸Tr輈hTh筩h Lv5", {2,22,105,1},nil,nil,nil,1},
        {1,8, "Nguy謙B筩hTh筩h Lv5", {2,22,205,1},nil,nil,nil,1},
        {1,8, "H� Ph竎h Th筩h C蕄 5", {2,22,305,1},nil,nil,nil,1},
        {1,8, "H綾 Di謚 Th筩h C蕄 5", {2,22,405,1},nil,nil,nil,1},
        {1,8, "Huy誸Tr輈hTh筩h Lv6", {2,22,106,1},nil,nil,nil,1},
        {1,8, "Nguy謙B筩hTh筩h Lv6", {2,22,206,1},nil,nil,nil,1},
        {1,8, "H� Ph竎h Th筩h C蕄 6", {2,22,306,1},nil,nil,nil,1},
        {1,8, "H綾 Di謚 Th筩h C蕄 6", {2,22,406,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem456,100,1, "Ho箃 ng m� m阨", "Ho箃 ng m� m阨")
end

function ck_GiveRandGem345()
	--Faction Cloth 9
	local VET_RandGem345 = {
        {1,8, "Huy誸Tr輈hTh筩h Lv3", {2,22,103,1},nil,nil,nil,nil},
        {1,8, "Nguy謙B筩hTh筩h Lv3", {2,22,203,1},nil,nil,nil,nil},
        {1,8, "H� Ph竎h Th筩h C蕄 3", {2,22,303,1},nil,nil,nil,nil},
        {1,8, "H綾 Di謚 Th筩h C蕄 3", {2,22,403,1},nil,nil,nil,nil},
        {1,9, "Huy誸Tr輈hTh筩h Lv4", {2,22,104,1},nil,nil,nil,nil},
        {1,9, "Nguy謙B筩hTh筩h Lv4", {2,22,204,1},nil,nil,nil,nil},
        {1,9, "H� Ph竎h Th筩h C蕄 4", {2,22,304,1},nil,nil,nil,nil},
        {1,9, "H綾 Di謚 Th筩h C蕄 4", {2,22,404,1},nil,nil,nil,nil},
        {1,8, "Huy誸Tr輈hTh筩h Lv5", {2,22,105,1},nil,nil,nil,1},
        {1,8, "Nguy謙B筩hTh筩h Lv5", {2,22,205,1},nil,nil,nil,1},
        {1,8, "H� Ph竎h Th筩h C蕄 5", {2,22,305,1},nil,nil,nil,1},
        {1,8, "H綾 Di謚 Th筩h C蕄 5", {2,22,405,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem345,100,1, "Ho箃 ng m� m阨", "Ho箃 ng m� m阨")
end

function ck_GiveRandGem45TwoTimes()
	--Faction Cloth 9
	local VET_RandGem45 = {
        {1,12, "Huy誸Tr輈hTh筩h Lv4", {2,22,104,1},nil,nil,nil,nil},
        {1,12, "Nguy謙B筩hTh筩h Lv4", {2,22,204,1},nil,nil,nil,nil},
        {1,13, "H� Ph竎h Th筩h C蕄 4", {2,22,304,1},nil,nil,nil,nil},
        {1,13, "H綾 Di謚 Th筩h C蕄 4", {2,22,404,1},nil,nil,nil,nil},
        {1,13, "Huy誸Tr輈hTh筩h Lv5", {2,22,105,1},nil,nil,nil,1},
        {1,13, "Nguy謙B筩hTh筩h Lv5", {2,22,205,1},nil,nil,nil,1},
        {1,12, "H� Ph竎h Th筩h C蕄 5", {2,22,305,1},nil,nil,nil,1},
        {1,12, "H綾 Di謚 Th筩h C蕄 5", {2,22,405,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem45,100,1, "Ho箃 ng m� m阨", "Ho箃 ng m� m阨")
	gf_EventGiveRandAward(VET_RandGem45,100,1, "Ho箃 ng m� m阨", "Ho箃 ng m� m阨")
end

function ck_GiveRandGem56()
	--Faction Cloth 9
	local VET_RandGem56 = {
        {1,13, "Huy誸Tr輈hTh筩h Lv5", {2,22,105,1},nil,nil,nil,1},
        {1,13, "Nguy謙B筩hTh筩h Lv5", {2,22,205,1},nil,nil,nil,1},
        {1,13, "H� Ph竎h Th筩h C蕄 5", {2,22,305,1},nil,nil,nil,1},
        {1,13, "H綾 Di謚 Th筩h C蕄 5", {2,22,405,1},nil,nil,nil,1},
        {1,12, "Huy誸Tr輈hTh筩h Lv6", {2,22,106,1},nil,nil,nil,1},
        {1,12, "Nguy謙B筩hTh筩h Lv6", {2,22,206,1},nil,nil,nil,1},
        {1,12, "H� Ph竎h Th筩h C蕄 6", {2,22,306,1},nil,nil,nil,1},
        {1,12, "H綾 Di謚 Th筩h C蕄 6", {2,22,406,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem56,100,1, "Ho箃 ng m� m阨", "Ho箃 ng m� m阨")
end

IC_T_YUNLING5 = {
    {1, 2, "H-Li謙 Nham-Lv5", {0, 148, 69,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-Ph� Kh玭g-Lv5", {0, 148, 70,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-T髖 Ki誱-Lv5", {0, 148, 71,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-T藅 Phong-Lv5", {0, 148, 72,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-T蕁 V�-Lv5", {0, 148, 73,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-g T藀-Lv5", {0, 148, 74,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-Linh T﹎-Lv5", {0, 148, 75,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-Th莕 L鵦-Lv5", {0, 148, 76,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-Ng璶g Th莕-Lv5", {0, 148, 77,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-V� Gian-Lv5", {0, 148, 78,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-V� C鵦-Lv5", {0, 148, 79,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-Cu錸g Nh蒼-Lv5", {0, 148, 80,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-L╪g Nhu�-Lv5", {0, 148, 81,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-Linh Vi猲-Lv5", {0, 148, 82,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-H秈 V薾-Lv5", {0, 148, 83,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-H秈 T﹎-Lv5", {0, 148, 84,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-Li謙 Nham-Lv5", {0, 149, 70,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-Ph� Kh玭g-Lv5", {0, 149, 71,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-T髖 Ki誱-Lv5", {0, 149, 72,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-T藅 Phong-Lv5", {0, 149, 73,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-T蕁 V�-Lv5", {0, 149, 74,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-Qu竛 Th筩h-Lv5", {0, 149, 75,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-N� Ng﹎-Lv5", {0, 149, 76,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-Xuy猲 V﹏-Lv5", {0, 149, 77,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-Th莕 L鵦-Lv5", {0, 149, 78,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-Ng璶g Th莕-Lv5", {0, 149, 79,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-V� Gian-Lv5", {0, 149, 80,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-V� C鵦-Lv5", {0, 149, 81,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-Cu錸g Nh蒼-Lv5", {0, 149, 82,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-L╪g Nhu�-Lv5", {0, 149, 83,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-Linh Vi猲-Lv5", {0, 149, 84,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-H秈 V薾-Lv5", {0, 149, 85,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-H秈 T﹎-Lv5", {0, 149, 86,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-Li謙 Nham-Lv5", {0, 150, 69,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-Ph� Kh玭g-Lv5", {0, 150, 70,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-T髖 Ki誱-Lv5", {0, 150, 71,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-T藅 Phong-Lv5", {0, 150, 72,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-T蕁 V�-Lv5", {0, 150, 73,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-V� Lng-Lv5", {0, 150, 74,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-M鬰 Minh-Lv5", {0, 150, 75,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-Th莕 L鵦-Lv5", {0, 150, 76,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-Ng璶g Th莕-Lv5", {0, 150, 77,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-V� Gian-Lv5", {0, 150, 78,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-V� C鵦-Lv5", {0, 150, 79,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-Cu錸g Nh蒼-Lv5", {0, 150, 80,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-L╪g Nhu�-Lv5", {0, 150, 81,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-Linh Vi猲-Lv5", {0, 150, 82,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 3, "T-H秈 V薾-Lv5", {0, 150, 83,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 3, "T-H秈 T﹎-Lv5", {0, 150, 84,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
}

IC_T_YUNLING6 = {
    {1, 2, "H-Li謙 Nham-Lv6", {0, 148, 85,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-Ph� Kh玭g-Lv6", {0, 148, 86,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-T髖 Ki誱-Lv6", {0, 148, 87,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-T藅 Phong-Lv6", {0, 148, 88,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-T蕁 V�-Lv6", {0, 148, 89,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-g T藀-Lv6", {0, 148, 90,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-Linh T﹎-Lv6", {0, 148, 91,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-Th莕 L鵦-Lv6", {0, 148, 92,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-Ng璶g Th莕-Lv6", {0, 148, 93,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-V� Gian-Lv6", {0, 148, 94,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-V� C鵦-Lv6", {0, 148, 95,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-Cu錸g Nh蒼-Lv6", {0, 148, 96,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-L╪g Nhu�-Lv6", {0, 148, 97,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-Linh Vi猲-Lv6", {0, 148, 98,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-H秈 V薾-Lv6", {0, 148, 99,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "H-H秈 T﹎-Lv6", {0, 148, 100,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-Li謙 Nham-Lv6", {0, 149, 87,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-Ph� Kh玭g-Lv6", {0, 149, 88,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-T髖 Ki誱-Lv6", {0, 149, 89,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-T藅 Phong-Lv6", {0, 149, 90,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-T蕁 V�-Lv6", {0, 149, 91,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-Qu竛 Th筩h-Lv6", {0, 149, 92,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-N� Ng﹎-Lv6", {0, 149, 93,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-Xuy猲 V﹏-Lv6", {0, 149, 94,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-Th莕 L鵦-Lv6", {0, 149, 95,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-Ng璶g Th莕-Lv6", {0, 149, 96,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-V� Gian-Lv6", {0, 149, 97,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-V� C鵦-Lv6", {0, 149, 98,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-Cu錸g Nh蒼-Lv6", {0, 149, 99,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-L╪g Nhu�-Lv6", {0, 149, 100,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-Linh Vi猲-Lv6", {0, 149, 101,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-H秈 V薾-Lv6", {0, 149, 102,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "C-H秈 T﹎-Lv6", {0, 149, 103,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-Li謙 Nham-Lv6", {0, 150, 85,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-Ph� Kh玭g-Lv6", {0, 150, 86,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-T髖 Ki誱-Lv6", {0, 150, 87,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-T藅 Phong-Lv6", {0, 150, 88,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-T蕁 V�-Lv6", {0, 150, 89,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-V� Lng-Lv6", {0, 150, 90,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-M鬰 Minh-Lv6", {0, 150, 91,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-Th莕 L鵦-Lv6", {0, 150, 92,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-Ng璶g Th莕-Lv6", {0, 150, 93,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-V� Gian-Lv6", {0, 150, 94,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-V� C鵦-Lv6", {0, 150, 95,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-Cu錸g Nh蒼-Lv6", {0, 150, 96,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-L╪g Nhu�-Lv6", {0, 150, 97,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 2, "T-Linh Vi猲-Lv6", {0, 150, 98,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 3, "T-H秈 V薾-Lv6", {0, 150, 99,1, 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
    {1, 3, "T-H秈 T﹎-Lv6", {0, 150, 100,1 , 4, -1, -1, -1, -1, -1, -1},nil,nil,nil,nil},
}

function giveYunLing5()
	gf_EventGiveRandAward(IC_T_YUNLING5,100,1, "Ho箃 ng m� m阨", "Ho箃 ng m� m阨")
end

function giveYunLing6()
	gf_EventGiveRandAward(IC_T_YUNLING6,100,1, "Ho箃 ng m� m阨", "Ho箃 ng m� m阨")
end

--邀请者奖励
IC_YAOQING_AWARD = {
	[1] = {"item",		1, 	"Thi誸 tinh c蕄 4", {2,1,30612,10}},
	[2] = {"item", 		6, 	"Hu﹏ chng anh h飊g", 	{2,1,30499,20,4}},
	[3] = {"item", 		12, "Ti觰 B筩h Dng(30 ng祔) ", {0,105,30055,1,4, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
	[4] = {"item", 		24, "Thi猲 Th筩h Linh Th筩h (7 ng祔)", {2,1,1068,1,4}, 7 * 24 * 3600},
	[5] = {"func", 		36, "Ц qu� c蕄 3~5 ( ng蓇 nhi猲 1 c竔)", ck_GiveRandGem345},
	[6] = {"item", 		50, "Thi猲 Cang L謓h", {2,95,204,1}},
	[7] = {"item", 		60, "H遖 Th� B輈h (15 ng祔)", {2,1,1001,1}, 15 * 24 * 3600},
	[8] = {"func", 		80, format("Ц qu� c蕄 4~5 ( ng蓇 nhi猲 %d c竔)",2), ck_GiveRandGem45TwoTimes},
}

--奖励
IC_YAOYANG_JIEZI_1 = {
	{"Di謚 Dng-� L﹏ B秓 Gi韎", {0, 102, 3176, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di謚 Dng-T� Giao Ng鋍 B閕", {0, 102, 3178, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di謚 Dng-V﹏ H� L謓h", {0, 102, 3180, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di謚 Dng-X輈h Tc Ho祅", {0, 102, 3182, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di謚 Dng-B輈h Quy Li猲", {0, 102, 3184, 1, 4, -1, -1, -1, -1, -1, -1}},
}

IC_YAOYANG_JIEZI_2 = {
	{"Di謚 Dng To竔 Ho祅g-� L﹏ B秓 Gi韎", {0, 102, 3185, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di謚 Dng To竔 Ho祅g-T� Giao Ng鋍 B閕", {0, 102, 3186, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di謚 Dng To竔 Ho祅g-V﹏ H� L謓h", {0, 102, 3187, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di謚 Dng To竔 Ho祅g-X輈h Tc Ho祅", {0, 102, 3188, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di謚 Dng To竔 Ho祅g-B輈h Quy Li猲", {0, 102, 3189, 1, 4, -1, -1, -1, -1, -1, -1}},
}
