--=============================================
--create by baiyun 2009.7.17
--describe:越南版8月份活动　秘籍收藏家脚本
--=============================================
Include("\\script\\online\\viet_event\\200908\\viet0908_head.lua");

function main()
	tbDialog = {
			"фi m藅 t辌h (T筰 h� c� 1 Linh X� Huy誸 + 100 V祅g)/Viet0908_LingSheXie_Miji",
			"K誸 th骳 i tho筰/nothing"
	};
	Say("<color=green>Nh� S璾 T莔 M藅 T辌h: <color>Hi謓 t筰 ch� ta 產ng c� m蕐 cu鑞 m藅 t辌h v� h鋍 m韎 tr玭g r蕋 l�. C竎 h� c� th� i l蕐 m藅 t辌h m韎 t筰 ch� c馻 ta. Nh璶g trc ti猲 h穣 gi髉 ta t譵 1 ch衝 Linh X� Huy誸 v� 10 уng Ti襫 V祅g r錳 n g苝 ta  i m藅 t辌h nh�.", getn(tbDialog), tbDialog);
end

function nothing()
end