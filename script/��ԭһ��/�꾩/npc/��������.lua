Include("\\script\\online_activites\\201204\\changkuaishujia\\changkuaishujia.lua")
Include("\\script\\online_activites\\201205\\exchange_award.lua")
Include("\\script\\vng\\doinguyenlieu.lua")

function main()
	local tbSay = {};
	local nDate = tonumber(date("%Y%m%d"))
	--插入table
	if gf_CheckEventDateEx(VET_CKSJ_ACITIVITY_ID) == 1 then
		for i=1,getn(Vet_CKSJ_Say_Tb) do
			tinsert(tbSay,Vet_CKSJ_Say_Tb[i]);
		end
	end
	--2012年6月活动
	if gf_CheckEventDateEx(VET_ExcAw_ACITIVITY_ID) == 1 then
		for i=1,getn(Vet_ExcAw_Say_Tb) do
			tinsert(tbSay,Vet_ExcAw_Say_Tb[i]);
		end
	end

	tinsert(tbSay, "Thu i Qu﹏ d鬾g/Trade_Material_Menu3")

	tinsert(tbSay,"Kh玭g c莕 u/cancel");
	Say("Tr╪g thanh gi� m竧 nh� th� n祔卻ao kh玭g c飊g ta 甶 t秐 b� ch�?",
		getn(tbSay),tbSay)
		--"听说您老这里有一些武林失传的东西？我想买几个。/Suiyinbuy",
		--"听说您老这里有一些上好的外装衣服？我想看看。/ClothBuy",
		--"听说您老这里有一些上好的外装发冠？我想看看。/CapBuy",
		--"听说您老这里有一些上好的外装裤裙？我想看看。/ShoeBuy",
		--"听说您老这里有一些遥远的异国战袍？我想看看。/ShijieBuy",
		--"离开没事。/cancel")
end

function cancel()
end

function Suiyinbuy()
   Sale(53)
end
function ClothBuy()
   Sale(56)
end
function CapBuy()
   Sale(57)
end
function ShoeBuy()
   Sale(58)
end
function ShijieBuy()
   Sale(87)
end