--����: ��ȭ

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{4,9},{5,10},{6,12},{7,15},{17,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{4,12},{5,15},{6,17},{7,20},{17,20}}},
	{"skill_sub_skill2_probability",{{1,0},{5,0},{6,3},{7,5},{17,5}}},
	{"skill_sub_skill2_factor",{{1,0},{5,0},{6,9},{7,12},{17,12}}},
	{"skill_effect_persist_time",{{1,2},{7,5},{17,5}}},
	{"skill_display_persist_time",{{1,2},{7,5},{17,5}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,10},{7,12},{17,15}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
	{magic="damage_life",
	damage_factor_a={{1,170},{7,350},{17,420}},
	damage_factor_f={{1,70},{7,250},{17,300}},
	},
	{magic="damage_knockback",
	damage_factor_z={{1,1},{7,20},{17,27}},
	damage_factor_m={{1,27},{17,27}},
	probability_factor_x={{1,40},{7,100},{17,100}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_block_qinggong",
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
