--梁山信物
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\online_activites\\task_values.lua")

MAX_USE_TIMES = 5;
MAP_TABLE = {507,504,501};
Item_Table = {2,1,30392,"Lng S琻 t輓 v藅"};
ITEM_NEED_NUM = 9;

function OnUse(nItem)
	if GetTime() - GetTaskTemp(Pre_Click_Time3) < Used_Space_Time then
		--Msg2Player(format("道具使用的CD时间为%d秒",Used_Space_Time));
		return 0;
	end
	--检查活动时间
	if LSB_IsActivityOpen() ~= 1 then
		Talk(1,"","V藅 ph萴  qu� h筺 s� d鬾g");
		return 0;
	end
	if LSB_Check_LR() == 0 then
			return 0;
	end
	--物品数量检查
	if GetItemCount(Item_Table[1],Item_Table[2],Item_Table[3]) < ITEM_NEED_NUM then
		Talk(1,"",format("S� lng Lng S琻 t輓 v藅 kh玭g  %d ",ITEM_NEED_NUM));
	end
	--检查当天使用次数
	if LSB_MailUseTimes() >= MAX_USE_TIMES then
		Talk(1,"",format("M鏸 ng祔 s� d鬾g t鑙 產 %d l莕 Lng S琻 t輓 v藅",MAX_USE_TIMES));
		return 0;
	end
	--当天地图是否合适
	local nMap,nX,nY = GetWorldPos();
	if LSB_IsAllowMap(MAP_TABLE,nMap) == 0 then
		Talk(1,"","B秐  hi謓 t筰 kh玭g th� s� d鬾g v藅 ph萴 n祔");
		return 0;
	end
	--boss数量检查
	if LSB_GetCurrMapBossNum(nMap) >= MAX_BOSS_NUM then
		Talk(1,"",format("S� lng Boss trong b秐  kh玭g th� vt qu� %d ",MAX_BOSS_NUM));
		return 0;
	end
	--检查是否boss没死或者箱子没点
	if LSB_Check_NpcName() == 0 then
		Talk(1,"","Lng S琻 h祇 ki謙 g鋓 ra trc khi ch誸 ho芻 sau khi nh苩 B秓 Rng m韎 c� th� s� d鬾g o c� n祔")
		return 0;
	end
	--删除物品
	if DelItem(Item_Table[1],Item_Table[2],Item_Table[3],ITEM_NEED_NUM) ~= 1 then
		return 0;
	end
	--播放特效
	SetCurrentNpcSFX(PIdx2NpcIdx(),953,2,0,18*5);
	--设置CD时间
	SetItemUseLapse(18 * 60 * 2);
	--招boss
	ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_Is_Allow_BOSS");
	gf_SetTaskByte(VET_LSB_MAIL_NUM,1,gf_GetTaskByte(VET_LSB_MAIL_NUM,1) + 1);
	SetTaskTemp(Pre_Click_Time3,GetTime());
	--任务
	if tGtTask:check_cur_task(90) == 1 and GetTask(VET_LSB_CALLBOSS) < 5 then
		SetTask(VET_LSB_CALLBOSS,GetTask(VET_LSB_CALLBOSS) + 1);
		if GetTask(VET_LSB_CALLBOSS) ~= 5 then
			Msg2Player(format("Tri謚 g鋓 %d/5 l莕 Lng S琻 h祇 ki謙 ",GetTask(VET_LSB_CALLBOSS)));
		else
			Msg2Player(format("Tri謚 g鋓 %d/5 l莕 Lng S琻 h祇 ki謙 (ho祅 th祅h)",GetTask(VET_LSB_CALLBOSS)));
		end
	end
	--地图boss数量+1
	SetMapTaskTemp(nMap,1,GetMapTaskTemp(nMap,1) + 1);
--	local nKind,nMapId,nNpcIndex = LSB_CreateBoss();
--	if nKind == 1 and LSB_Get_Map_Name(nMapId) ~= nil then
--		--创建宝箱
--		local nNpcIdx = CreateNpc("资源宝箱", format("%s的黄金宝箱",GetName()), nMap, nX + 1, nY + 1);
--		SetNpcLifeTime(nNpcIdx,3 * 60);
--		--记录index
--		SetTaskTemp(Gld_Boss_Index,nNpcIdx);
--		SetNpcScript(nNpcIdx,Box_E_Script);
--		Msg2Global(format("%s玩家名非常幸运的招出了%s黄金大BOSS 一不小心被他逃到%s地图，大家快前挑战抢宝。",GetName(), GetNpcName(nNpcIndex), LSB_Get_Map_Name(nMapId)));
--	else
--		Msg2Player(format("%s非常幸运的招出了%sBOSS",GetName(),GetNpcName(nNpcIndex)));
--	end
end