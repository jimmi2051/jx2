--定期清理的任务变量接口
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\settings\\static_script\\global\\everyday_do.lua")
Include("\\settings\\static_script\\global\\weekly_do.lua")
Include("\\settings\\static_script\\global\\regular_clear_task.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

-----------------------------------------------------------------------
--其他需要特殊实现的定期清理工作
function _rc_OtherDailyClear()
	OnDailyDoSpecial();
end
function _rc_OtherWeeklyClear()
	OnWeeklyDoSpecial();
end
-----------------------------------------------------------------------


-----------------------------------------------------------------------
--定期清理程序回调接口
function OnDailyClearCallBack(nAccessCode, nLastDate, nCurDate)
	do return end
end

function OnWeeklyClearCallBack(nAccessCode, nLastWeek, nCurWeek)
	--print(format("OnWeeklyClear(nAccessCode=%d) %s", nAccessCode, GetName()))
	if nAccessCode and nAccessCode == 908394 then
		_rc_ResetWeeklyTaskGroup();
		_rc_OtherWeeklyClear();
		Msg2Player("Nhi謒 v?tu莕  頲 thi誸 l藀 l筰")
		--print("\n***WeeklyClear finish***\n")
		--Observer:onEvent(SYSEVENT_WEEKLY_CLEAR, {nLastWeek, nCurWeek})
		FireEvent("event_weekly_clear", nCurWeek, nLastWeek)
	end
end

function OnMonthlyClearCallBack(nAccessCode, nLastMonth, nCurMonth)
	if nAccessCode and nAccessCode == 908394 then
		_rc_ResetMonthTaskGroup();
		_rc_ResetMonthLyTaskGroup(nLastMonth, nCurMonth)
		Msg2Player("Nhi謒 v?m鏸 th竛g  reset")
		--Observer:onEvent(SYSEVENT_MONTHLY_CLEAR, {nLastMonth, nCurMonth})
		FireEvent("event_monthly_clear", nCurMonth, nLastMonth)
	end
end

-----------------------------------------------------------------------


-----------------------------------------------------------------------
_t_MonthlyClearTaskIdGroup =
{
	-- to clear,to save
  {3196, TASK_ACCESS_CODE_MONTHLY_IB, 3197, TASK_ACCESS_CODE_MONTHLY_IB},
}
--先保存再清零
function _rc_ResetMonthLyTaskGroup(nLastMonth, nCurMonth)
	local _nLastMonthD = floor(nLastMonth/100)*12+mod(nLastMonth,100)
	local _nCurMonthD = floor(nCurMonth/100)*12+mod(nCurMonth,100)
	local nLeltaMonth = _nCurMonthD - _nLastMonthD
	local tGroup = _t_MonthlyClearTaskIdGroup
	for i=1,getn(tGroup) do
		local t=tGroup[i]
		if t[3] then
			local nSav = 0
			if 1 == nLeltaMonth then --只保存上月信息
				nSav = GetTask(t[1])
			end
			SetTask(t[3], nSav, t[4] or 0)
		end
		SetTask(t[1], 0, t[2] or 0)
	end
end

--内部实现接口
function _rc_ResetDailyTaskGroup()
	_rc_ClearTaskGroup(t_RegularClearTaskGroups[EM_REGULAR_CLEAR_TYPE_DAILY])
end
function _rc_ResetWeeklyTaskGroup()
	_rc_ClearTaskGroup(t_RegularClearTaskGroups[EM_REGULAR_CLEAR_TYPE_WEEKLY])
end
function _rc_ResetMonthTaskGroup()
	_rc_ClearTaskGroup(_t_MonthClearTaskIdGroup)
end

function _rc_ClearTaskGroup(tGroup)
	for i=1,getn(tGroup) do
		SetTask(tGroup[i][1], 0, tGroup[i][2])
	end
end







