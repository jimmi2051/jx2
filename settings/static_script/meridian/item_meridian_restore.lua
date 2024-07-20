--洗真气丹药物品脚本

Include ("\\script\\system_switch_config.lua")

t_name = {"Nh薽 M筩h", "цc M筩h", "ыi M筩h", "Xung M筩h",}
t_type_task = {2947, 2948, 2949, 2950,}

function OnUse_Real(id)
	local tbSay = {}
	local szTitle = ""
	if 1 == IsMeridianSystemOpen() and MeridianGetLevel() >= 1 then
		szTitle = format("D辌h C﹏ n: ta c� th� gi髉 ngi t葃 t駓 d辌h c﹏, xin h穣 ch鋘 kinh m筩h c莕 t葃.")
		for i=1,4 do
			local nCurTypeZhenQi = GetTask(t_type_task[i])
			if nCurTypeZhenQi > 0 then
				tinsert(tbSay, format("%s%s/#_do_restore(%d)", "Ta mu鑞 t葃 t駓", t_name[i], i))
			end
		end
--		tinsert(tbSay, format("%s%s/#_do_restore(1)","我要洗髓", t_name[1]))
--		tinsert(tbSay, format("%s%s/#_do_restore(2)","我要洗髓", t_name[2]))
--		tinsert(tbSay, format("%s%s/#_do_restore(3)","我要洗髓", t_name[3]))
--		tinsert(tbSay, format("%s%s/#_do_restore(4)","我要洗髓", t_name[4]))
		tinsert(tbSay, "Ta ch� gh� ch琲/no")
	else
		szTitle = format("Hi謓 t筰 c竎 h� v蒼 ch璦 k輈h ho箃 c秐h gi韎, r蕋 ti誧 ta kh玭g th� gi髉 ngi d辌h c﹏ t葃 t駓.")
		tinsert(tbSay, "Ra kh醝/no")
	end
	
	Say(szTitle, getn(tbSay), tbSay)
end

function _do_restore(nType)
	if nType >= 1 and nType <= 4 then
		local nCurTypeZhenQi = GetTask(t_type_task[nType])
		if nCurTypeZhenQi > 0 then
			local nDelResult = DelItem(2,1,30549,1)
    		if 1== nDelResult then
    			local nResult = MeridianRestore(nType)
            	if nResult > 0 then
            		Talk(1,"",format("[%s]%s", t_name[nType], "T葃 t駓 th祅h c玭g!"))
            	else
            		--Talk(1,"",format("[%s]%s", t_name[nType], "不需要洗髓！"))
            	end
    		end
		else
			Talk(1,"",format("[%s]%s", t_name[nType], "Kh玭g c莕 t葃 t駓!"))
		end
	end
end


function no()
end

