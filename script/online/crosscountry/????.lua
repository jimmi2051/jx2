-- 吴越老祖

function OnDeath()
	local nPreservedPlayerIndex	= PlayerIndex
	local nMemCount	= GetTeamSize()
	local nMapId, nX, nY = GetWorldPos()

	if nMemCount ==	0 then -- 玩家未组队
		if GetTask(1402) ==	85 then
			SetTask(1402, 90)
			Msg2Player("Th祅h c玭g nh b筰 Ng� Vi謙 l穙 t�")
			TaskTip("Th祅h c玭g nh b筰 Ng� Vi謙 l穙 t�")
		end
	else
		for	i=1,nMemCount do
			PlayerIndex	= GetTeamMember(i)
			local nTeamMapId, nTeamX, nTeamY = GetWorldPos()
			local nDist	= DistanceBetweenPoints(nMapId,	nX,	nY,	nTeamMapId,	nTeamX,	nTeamY)
			if GetTask(1402) == 85 and nDist >= 0 and nDist <=	50 then
				SetTask(1402, 90)
				Msg2Player("Th祅h c玭g nh b筰 Ng� Vi謙 l穙 t�")
				TaskTip("Th祅h c玭g nh b筰 Ng� Vi謙 l穙 t�")
			end
		end
		PlayerIndex	= nPreservedPlayerIndex 	-- 重置之前储存的玩家编号
	end
end
