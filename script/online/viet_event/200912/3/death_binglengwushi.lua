--=============================================
--create by baiyun 2009.11.13
--describe:Խ�ϰ�12�·ݻ������ʦ�����ű�
--============================================
--
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
Include("\\script\\online\\viet_event\\200912\\3\\mission_head.lua");

function OnDeath(nNpcIndex)
		SetNpcLifeTime(nNpcIndex, 0);
    --ˢʥ����
    local nNewIndex = CreateNpc("aoyunshenghuotai", "Th�nh H� H�a ��n", GetNpcWorldPos(nNpcIndex));
    SetNpcLifeTime(nNewIndex, 30 * 60);
    SetNpcScript(nNewIndex, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanshu.lua");
    AddUnitStates(nNewIndex, 6, GetTime());--��¼NPC������ʱ
    SetCurrentNpcSFX(nNewIndex, 909, 2, 1, 18*30*60);

    --���̻�
    DoFireworks(801, 10);
   
    --����ʦ��
    gf_AddItemEx2({2, 1, 30746, 1}, "Tr�i Tim B�ng Gi�", "Ph� Th�y B�ng Gi�", "Ph� Th�y B�ng Gi�", 24*3600, 1);

    --ˢ100��ʥ�����
    local nMapId, nMapX, nMapY = GetNpcWorldPos(nNpcIndex);
    for i = 1, 100 do
        local nNewNpcIndex = CreateNpc("Event gi�ng sinh VN", "H�p Qu� Th�nh H�", nMapId, nMapX + random(-10, 10), nMapY + random(-10, 10));
        SetNpcLifeTime(nNewNpcIndex, 30);
        SetNpcScript(nNewNpcIndex, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanlihe.lua");
    end

    --��mission��ÿ3���ӳ���50��ʥ����У�����30����
    SetGlbValue(1026, nNewIndex);

    OpenMission(MISSION_ID, nMapId)
end

