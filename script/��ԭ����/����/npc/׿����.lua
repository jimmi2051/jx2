-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 通缉任务杀手令牌文件(相关Npc:襄阳卓天行)
-- Edited by starry night
-- 2005/09/15 PM 9:27

-- ======================================================

--引用通缉任务头文件
Include("\\script\\lib\\message.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua");

g_NpcName = "<color=green>Tr竎 Thi猲 H祅h<color>:";

function main()
	local szTitle = format("%s %s", g_NpcName, "Nh� n╩ x璦 l穙 phu c騨g t鮪g l� m閠 i hi謕 tu鎖 tr� t礽 cao, phong l璾 ph鉵g kho竛g. Nay qu� th藅  gi� r錳. Ngi t譵 ta c� vi謈 g� kh玭g?")
	local tSay = {
		--format("%s/Task_Check", "我这里有一块令牌，但晚辈才疏学浅，望前辈可以帮我解开个中玄机！"),
		format("%s/bookDecompose", "T竎h b� k輕"),
		--format("%s/bookCompose", "秘籍领悟"),
		--format("%s/qby_task", "委托任务"),
		format("%s/book_main", "Ch﹏ V� M藅 T辌h"),
		format("%s/nothing", "H裯 g苝 l筰"),
	}
	Say(szTitle,	getn(tSay), tSay)
end


function Task_Check()

	if GetItemCount(2,1,195) >= 1 then --判断杀手令数量
		Say("<color=green>Tr竎 Thi猲 H祅h<color>: Зy l� L謓h B礽 S竧 Th� c馻 T﹜ H� Nh蕋 Ph萴 Л阯g, trong  萵 ch鴄 huy襫 c�. H穣 giao n� cho ta, ta c� th� gi秈 huy襫 c� c馻 l謓h b礽 n祔.",
				2,
				"Л頲, l謓h b礽 n祔 cho ngi/Task_Confirm",
				"Th玦 Л頲!  t� ti襫 b鑙/Task_Exit");
	else
		Say("L謓h b礽 c馻 ngi u?!",0);
	end;

end;


function Task_Confirm()

local n = 0;
local nLevel = GetLevel();

local str1 = { "<color=green>Tr竎 Thi猲 H祅h<color>:�",
						   "L謓h b礽 n祔 xem ra ch糿g c� g� c bi謙.",
						   "Ta c� m閠 輙 th竛h dc 甶 l筰 trong giang h� r蕋 c莕 thi誸, t苙g ngi xem nh� kh玭g u鑞g c玭g c馻 ngi v藋.",
						   " t� ti襫 b鑙"}

local str2 = { "<color=green>Tr竎 Thi猲 H祅h<color>:�",
						 	 "B猲 di l謓h b礽 c� 萵 ch鴄 m閠 b秐 v�, b猲 tr猲 m韎 ch� l� nh鱪g k� hi謚",
               "K� hi謚?",
               "<color=yellow>T祅g B秓 у<color> do ngi mang n 琻g nhi猲l� ph秈 tr� l筰 cho ngi r錳. N鉯 th藅 ta gi� r錳 c騨g kh玭g c遪  s鴆  甶 qu穘g 阯g d礽 nh� v藋.",
						   " t� ti襫 b鑙 ch� gi竜!"}

local str3 = { "<color=green>Tr竎 Thi猲 H祅h<color>:�",
							 "� y c遪 c� <color=yellow>Ph竜 hoa truy襫 tin<color>厖",
							 "Ph竜 hoa truy襫 tin?",
							 "Зy l� v藅 ph萴 m� Nh蕋 Ph萴 Л阯g S竧 Th� hay s� d鬾g, ch� c莕 ra ngo礽 th祅h t l猲 th� s� c� S竧 th� u m鬰 n ti誴 鴑g. Ngi nh﹏ c� h閕 n祔 tr� h筰 cho i T鑞g.",
							 " t� ti襫 b鑙 ch� gi竜!"}

--	if Pay(5000) == 1 then
		local nDelItem = DelItem(2,1,195,1,1);
			if nDelItem == 1 then

				n = random(1,100);

				if n <= 67 then --67％得到一张藏宝图
					TalkEx("",str2);
					local nRow = random(3,tonumber(tabPos:getRow()));
					local nParticular = tonumber(tabPos:getCell(nRow,"PosID"));
					AddItem(2,14,nParticular,1,1);
				else --33％获取一个顶级杀手传信烟火
					AddItem(2,1,203,1,1);
					TalkEx("",str3);
				end;
			end;
--	else
--
--		Say("<color=green>卓天行<color>：你的钱在哪里啊？我怎么说也是一代大侠，虽然过弃了，但也不至于被你们这些后生随意唬我吧！",0);
--
--	end;

end;

function bookCompose(bSure)
	if not bSure then
		local tSel = {
			"\nB総 u l躰h ng� b� k輕/#bookCompose(1)",
			"\nK誸 th骳 i tho筰/nothing",
		}

		Say("<color=green>Tr竎 Thi猲 H祅h<color>: B筺 c� th� b� v祇 c竎 lo筰 b� k輕  c飊g l躰h ng�, t�  nh薾 頲 b� k輕 m韎, b筺 c� th� b� v祇 tu vi, [Чi Nh﹏ S﹎] th阨 gian v� [Nh﹏ S﹎ Ng祅 N╩] th阨 gian  n﹏g cao t� l� l躰h ng� th祅h c玭g ([Qu� Nh﹏ S﹎] c� b竛 trong Ng� C竎). V� d�: L╪g Ba Di B� v� Ng� H祅h M藅 T辌hc飊g l躰h ng�, c� th� nh薾 頲 <color=yellow>B� K輕 Ti猽 Dao<color>, th猰 v� d�: H鏽 чn M藅 T辌h, Huy襫 乶h M藅 T辌h, Kim Cang Ph鬰 Ma Kinh, Thi猲 La M藅 T辌h, Linh C� M藅 T辌h c飊g nhau l躰h ng� s� 頲 Ng� H祅h M藅 T辌h! C竎 b筺 c莕 t� t譵 hi觰 c竎h phng th鴆 l躰h ng� kh竎.",
			getn(tSel), tSel);
		return
	else
		SendScript2Client('Open([[BookCompose]]);Open([[Items]])');
	end
end

function bookDecompose()
	if 1 == IsBoxLocking() then
		Talk(1, "", "<color=green>Tr竎 Thi猲 H祅h<color>: H穣 m� kh鉧 rng trc.");
		return
	end
	SendScript2Client("Open[[EquipRecycle]]");
end

function nothing()
end

--function qby_award()
--	local strtab = {}
--	for i = 1,getn(tQbyAward) do
--		tinsert(strtab,format("兑换[%s]（需要[求必应令牌]%d个）/#qby_ask_award(%d)",tQbyAward[i][1],tQbyAward[i][3],i));
--	end
--	for i = 1,getn(tDSwordAward[1]) do
--		tinsert(strtab,format("兑换[%s]（需要天阴风、雷、火令牌各%d个）/#ask_sword_award(%d,%d)",tDSwordAward[1][i][1],tDSwordAward[1][i][3],1,i));
--	end
--	for i = 1,getn(tDSwordAward[2]) do
--		tinsert(strtab,format("兑换[%s]（需要天阴风、雷、火令牌各%d个）/#ask_sword_award(%d,%d)",tDSwordAward[2][i][1],tDSwordAward[2][i][3],2,i));
--	end
--	tinsert(strtab,"返回/main");
--	--tinsert(strtab,"结束对话/nothing");
--	suSay(g_NpcName.."大侠想要兑换哪种奖励呢？",
--		getn(strtab),
--		strtab)	
--end
--
--double_sword_award = qby_award;
--
--tDSwordAward[1].name = "<color=green>卓天行<color>：";
--tDSwordAward[2].name = "<color=green>卓天行<color>：";

function book_main()
	local szMsg = g_NpcName .. "Tu luy謓 Ch﹏ V� M藅 T辌h c� th� gi髉 c秐h gi韎 v� h鋍 c馻 i hi謕 t╪g th猰 m閠 t莕g. Чi hi謕 c� th綾 m綾 g� v� vi謈 tu luy謓 Ch﹏ V� M藅 T辌h th� c� vi謈 h醝!";
	local tSel = {
		"L祄 sao m� tu luy謓 Ch﹏ V� M藅 T辌h/#book_introduce(1)",
		"Tu luy謓 Ch﹏ V� M藅 T辌h c莕 g�?/#book_introduce(2)",
		"L祄 sao ph﹏ bi謙 tr譶h  tu luy謓 Ch﹏ V� M藅 T辌h?/#book_introduce(3)",
		"Chuy觧 hi謚 qu� Ch﹏ V� M藅 T辌h/#book_introduce(4)",
		"T竎h ch﹏ quy觧/bookDecompose",
		format("%s/#show_equip_shop(3072)", "фi Ch﹏ Quy觧 Tinh Hoa"),
		"H裯 g苝 l筰/nothing",
	};
	Say(szMsg, getn(tSel), tSel);
end

BOOK_INTRO_MSG = {
	"<color=Green>Tr竎 Thi猲 H祅h<color>: Trc ti猲 i hi謕 c莕 chu萵 b� m閠 s� <color=Yellow>S� M玭 Ch﹏ Quy觧 luy謓 n c蕄 99<color>, sau khi t竎h s� nh薾 頲 <color=Yellow>Ch﹏ Quy觧 Tinh Hoa<color>. D飊g Ch﹏ Quy觧 Tinh Hoa c� th� i <color=Yellow>Qu竛 Th玭g Quy觧<color> v� <color=Yellow>Ch﹏ V� Th� K�<color>. D飊g v� ti猽 hao 1 Qu竛 Th玭g Quy觧 c� th� th╪g hoa S� M玭 Ch﹏ Quy觧 產ng trang b�, b総 u tu luy謓 Ch﹏ V� M藅 T辌h. Tu luy謓 Ch﹏ V� M藅 T辌h v蒼 c� th� d飊g Nh﹏ S﹎ Ng祅 N╩ ti課 h祅h t╪g t鑓.",
	"<color=Green>Tr竎 Thi猲 H祅h<color>: Tu luy謓 Ch﹏ V� M藅 T辌h c莕 ti猽 hao l辌h luy謓. V祇 Ng� C竎 mua <color=Yellow>Ch﹏ V� H錸 Th筩h<color> v� <color=Yellow>Чi Ch﹏ V� H錸 Th筩h<color> nh薾 頲 l辌h luy謓, c騨g c� th� d飊g tu vi  i v韎 t� l� <color=Yellow>300:1<color>. Gi韎 h筺 l璾 tr� l辌h luy謓 l� 5000 甶觤.",
	"<color=Green>Tr竎 Thi猲 H祅h<color>: Sau khi i hi謕 m� tu luy謓 s� ph竧 hi謓, trc hi謚 qu� c馻 m鏸 t莕g u c� 1 m秐h Hoa V╪ Linh Long, m秐h hoa v╪ n祔 c╪ c� v祇 m鴆  tu luy謓 c馻 t莕g 產ng luy謓 s� th� hi謓 ch蕋 li謚 kh竎 nhau: Hi觧 th� l� , t莕g n祔 ch璦 m� ho芻 ch璦 tu luy謓; hi觧 th� l� ho祅g ng, hi謚 qu� t莕g n祔 n籱 trong kho秐g <color=Yellow>1%-33%<color>; hi觧 th� l� b筩h ng﹏, hi謚 qu� t莕g n祔 n籱 trong kho秐g <color=Yellow>34%-66%<color>; hi觧 th� l� ho祅g kim, hi謚 qu� t莕g n祔 n籱 trong kho秐g <color=Yellow>67%-99%<color>; hi觧 th� l� x輈h h錸g dung nham, hi謚 qu� t莕g n祔 tr� t鑙 產 l� <color=Yellow>100%<color>. Hi謚 qu� m鏸 t莕g c馻 Ch﹏ V� M藅 T辌h l� c� nh,  tu luy謓 ch� kh竎 nhau v� m苩 tr� s�.",
	"<color=Green>Tr竎 Thi猲 H祅h<color>: Чi hi謕 d飊g <color=Yellow>Ch﹏ Quy觧 Tinh Hoa<color> c� th� i <color=Yellow>Ch﹏ V� Th� K�<color>. D飊g Ch﹏ V� Th� K�, c� th� mang hi謚 qu� c馻 Ch﹏ V� M藅 T辌h (kh玭g bao g錷 thu閏 t輓h ban u c馻 Ch﹏ Quy觧) 產ng trang b� vi誸 xu鑞g. Sau khi vi誸, ti猽 hao 1 Ch﹏ V� Th� K� s� nh薾 頲 k� y誹 c馻 l璾 ph竔 tng 鴑g, nh璶g thao t竎 n祔 s� <color=Yellow>x鉧 b� ho祅 to祅<color> hi謚 qu� c馻 Ch﹏ V� M藅 T辌h (kh玭g bao g錷 thu閏 t輓h ban u c馻 Ch﹏ Quy觧) 產ng trang b� tr猲 ngi i hi謕; ti誴 t鬰 d飊g k� y誹, c� th� ti猽 hao k� y誹 n祔  ghi ch衟 hi謚 qu� c馻 Ch﹏ V� M藅 T辌h tr� v� cho Ch﹏ Quy觧 <color=Yellow> th╪g hoa<color> hi謓 產ng trang b� (L璾 ph竔 c馻 ch﹏ quy觧 ph秈 tng 鴑g v韎 k� y誹).",
}

function book_introduce(nType)
	if not BOOK_INTRO_MSG[nType] then return end
	local szMsg = BOOK_INTRO_MSG[nType];
	local tSel = {
		"Ta c遪 mu鑞 t譵 hi觰 th猰/book_main",
		"Ta bi誸 r錳/nothing",
	};
	Say(szMsg, getn(tSel), tSel);
end