--技能: 七宝神照心法(招)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_gaslimit",{{1,1},{10,10}}},
	{"skill_effect_persist_time",{{1,9999},{10,9999}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	},

	--魔法属性

	--属性值:	普通攻击力 * X + (1 + 技能等级 * Y) * (力量 * A + 根骨 * B + 身法 * C + 内功 * D + 洞察 * E)
	--			+ 武器外功攻击点 * F + Z
	--			(其中,A,B,C,D,E,F,X,Y,Z为伤害因素.除Z外,其余各伤害因素为百分比数.)

	--成功几率:	(属性值 * A + (自身等级 - 对方等级) * B + 技能等级 * C) * D + X
	--			(其中,A,B,C,D,X为几率因素.除X外,其余各几率因素为百分比数.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--技能等级相关伤害魔法属性
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_convert_common_attack",
	damage_factor_z={{1,11468801},{10,11468810}},
	},
	{magic="state_physical_armor_add",
	damage_factor_z={{1,80},{10,80}},
	},
	{magic="state_attack_speed_add",
	damage_factor_z={{1,40},{10,40}},
	},
	{magic="state_o_defence_point_add",
	damage_factor_z={{1,25},{10,25}},
	},
	{magic="state_parmor_dec_no_effect",
	damage_factor_z={{1,20},{10,65}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	{magic="imme_agggas_point",
	damage_factor_z={{1,1},{10,1}},
	},
	{magic="imme_agggas3_neili_add",
	damage_factor_z={{1,30},{10,30}},
	},
	{magic="imme_agggas6_neili_add",
	damage_factor_z={{1,50},{10,50}},
	},
	{magic="imme_agggas10_neili_add",
	damage_factor_z={{1,50},{10,50}},
	},
	{magic="imme_gas_add_probability",
	},
	},
}