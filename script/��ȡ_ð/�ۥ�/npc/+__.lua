--function main()
--Say ("<color=green>��׼<color>����ĳ�����ƹ���Ժ��һ���йؽ�Ʒ���������˾����Ҹ�����ʲô���԰ﵽ��ģ�",2,"����Ҷһ���Ʒ/jiangpin","��ʱû��/no")
--end

--function jiangpin()
--Say ("<color=green>��׼<color>���Բ�����û��ʲô��Ʒ���졣",0)  --���ý���
--end;


--function no()
--Say ("<color=green>��׼<color>���������������������ĳ�ʵ���ӡ�",0)  
--end;

--���񣺻��л�������ʾ
--�ص㣺 ����
--�߻���������  2004.03.
--append by lizhi
--2005-8-8 11:20

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_�꾩\\task_main.lua");
Include("\\script\\online_activites\\201203\\kuizheng\\kuizeng.lua")

function main()
    local nLevel;
    local nStep;
    nLevel = GetLevel();
    nStep = GetTask(TASK_BJ_ID);
        --2012��4�¹����
    if gf_CheckEventDateEx(60) == 1 then
		gf_Say(VET_201203_KuiZeng_tbTalkDialog);
		--return 0;
	end
    
    if GetTask(1) >= 25 and GetTask(1) < 100 then
    
        if (nStep == 0) then
            task_000_00();
            SetTask(131,2);
            if GetTask(130) == 2 and GetTask(132) == 2 then
                SetTask(1, 26); --�����������������������(���һ��)����ر��������
            end;
            return
        elseif (nStep == 13) then
            task_013_00();
            return
        elseif (nStep == 14) then
            task_014_00();
            return
        else
            Talk(1,"","L�o phu ��y tuy kh�ng ra kh�i Bi�n Kinh nh�ng chuy�n trong thi�n h� ta ��u bi�t c�.")
            return
        end;
        
    end;
    Talk(1,"","L�o phu ��y tuy kh�ng ra kh�i Bi�n Kinh nh�ng chuy�n trong thi�n h� ta ��u bi�t c�.");

end;

function  pipcap()
--	ClosePiP()
	Pn2 = GetCaptainName()
	if( Pn2 == 0) then
			Talk(1,"","Ti�c cho ng��i kh�ng c� ��i tr��ng!")
	else	
			Talk(1,"","�i�u ng��i mu�n bi�t ��y, hi hi!")
			SetPiPView(Pn2,1)
	end;
end;

function  pipwhere()
--	ClosePiP()
	Talk(1,"","�i�u ng��i mu�n bi�t ��y, hi hi!")
	SetPiPView(314,1582,2903)
end;

function  pipkz()
--	ClosePiP()
	Talk(1,"","�i�u ng��i mu�n bi�t ��y!")
	SetPiPView(200,1426,2741)
end;

function  closepip()
		ClosePiP()
		Talk(1,"","Mai m�t ��ng xem th��ng ta n�a nh�!")
end;