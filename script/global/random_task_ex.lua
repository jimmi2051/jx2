--脚本名称：RandomTaskTipEx回调脚本
--脚本功能：RandomTaskTipEx（("xxxxxx", "yyyyyy")）:xxxxxxxxx为对话内容，yyyyyyyy为本脚本中对应的函数
--			具体内容请咨询村长或李志
--策划人：村长
--代码开发人：村长
--代码开发时间：2007-05-23
--代码修改记录：
--=====================================结婚技能回调相关========================================
random_tasktip_taskID = 1226
--************************回调主函数**********************

Include("\\script\\master_prentice\\some_op.lua")

function ma_trans_dia()
	local task_diff = GetTask(random_tasktip_taskID)
	--参数传入错误即返回
	if task_diff ~= 2 and task_diff ~= 4 then
		return
	end
	--如果死亡则返回
	if IsPlayerDeath() == 1 then
		return
	end
	local ma_trans_dia = ""
	if task_diff == 2 then
		ma_trans_dia = "Khu v鵦 hi謓 t筰 "
	else
		ma_trans_dia = "{c筺h}"
	end	
	local mate_sex = ""
	if GetSex() == 1 then
		mate_sex = "Ngi ch琲"
	else
		mate_sex = "Tha"
	end
	SetTask(random_tasktip_taskID,0)
	Say("<color=yellow>ch� d蒼<color>: уng i y猽 c莡 b筺 chuy觧 n "..mate_sex..ma_trans_dia..", ng � kh玭g?",
	2,
	"уng �/#ma_trans_callback("..task_diff..")",
	"Kh玭g ng �/Main_Exit"
	)
end
--夫妻传送回调
function ma_trans_callback(task_diff)
	--首先要得到配偶坐标，所以要进入配偶
	if GetMateOnlineStatus() ~= 1 then
		Msg2Player("уng i kh玭g l猲 m筺g!")
		return
	end
	--摆摊状态无法传送
	if IsStalling() == 1 then
		Msg2Player("Tr筺g th竔 b祔 b竛 kh玭g th� truy襫 t鑞g!")
		DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","trans_err", "уng i � tr筺g th竔 b祔 b竛!")
		return
	end	
	DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","ask_mate_callback", tostring(task_diff))
end

function momentumtip()
	Say("Nh譶 th蕐 ch� s� tr猲 khung k� n╪g s竛g l猲 ch璦? с l� tr� s竧 kh�, cho b筺 bi誸 tr� s竧 kh� hi謓 th阨, t飝 � di chuy觧 v� tr�.", 0)
end

-- 师徒
function _prentice_see_la()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] == "" then
		return
	end
	Say("S� ph� g鋓 b筺 k譨, sao h�?", 2, "уng �/prentice_yes_la", "Kh玭g ng �/prentice_no_la")
end

function prentice_yes_la()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] == "" then
		return
	end
	
	local nMapID = GetWorldPos()
	if _tansfer_map_chk(nMapID) == 0 then
		Say("Khu v鵦 hi謓 t筰 kh玭g th� h� ho竛", 0)
		DoScriptByName(tInfo["master"],"\\script\\master_prentice\\some_op.lua","_accept_lalala_err", GetName())
		return
	end
	
	if IsPlayerDeath() == 1 then
		Msg2Player("� tr筺g th竔 t� vong kh玭g th� tri謚 g鋓.")
		return
	end
	if IsStalling() == 1 then
		Msg2Player("ng b祔 b竛 kh玭g th� tri謚 g鋓.")
		return
	end
	if IsReading() == 1 then
		Msg2Player("ng tu luy謓 m藅 t辌h kh玭g th� tri謚 g鋓.")
		return
	end
	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--战斗状态下PK模式不可以使用
		Msg2Player("Ch�  PK b猲 ngo礽 kh玭g th� tri謚 g鋓.")
		return
	end
	DoScriptByName(tInfo["master"],"\\script\\master_prentice\\some_op.lua","_accept_lalala", GetName())
end

function prentice_no_la()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] == "" then
		return
	end
	DoScriptByName(tInfo["master"],"\\script\\master_prentice\\some_op.lua","_refuse_la", GetName())
end
