Include("\\script\\item\\item_yunling_box.lua")
function main()
	local tDialog = 
	{
		"\nT� Thi�n Bi�n Ti�u Y/NpcTalkMain",
		"\n Ngu�n g�c U�n Linh /cixiu_laiyuan",
		"\n ph��ng ph�p th�u/cixiu_fangfa",
		"\n r�t lui/nothing",
	};
	Say("<color=green>L�u T� Anh:<color>th�u l� tuy�t ngh� c�a t�i h�, U�n Linh ���c t�i h� th�u kh�ng nh�ng ��p m� c�n b�n n�a. ",getn(tDialog),tDialog);
end

function cixiu_laiyuan()
	local tDialog = 
	{
		"\n Ph�n h�i/main",
		"\n r�t lui/nothing",
	};
	Say("<color=green>L�u T� Anh:<color> Tham gia c�c t�nh n�ng thu th�p U�n Linh Tinh Hoa ��i U�n Linh c�p t��ng �ng. C�ng c� th� tham gia Th�t L�c Nhai nh�n danh v�ng Phong V�n T� H�i v� t�ng c�p danh v�ng �� mua U�n Linh, ho�c d�ng �n Chuy�n Sinh nh�n U�n Linh M�n H�i.",getn(tDialog),tDialog);
end

function cixiu_fangfa()
	local tDialog = 
	{
		"\n Ph�n h�i/main",
		"\n r�t lui/nothing",
	};
	Say("<color=green>L�u T� Anh: <color>nh�p chu�t ph�i v�o U�n Linh trong h�nh trang �� m� giao di�n th�u, cho ngo�i trang v� U�n Linh t��ng �ng v�o �� th�u.",getn(tDialog),tDialog);
end

function nothing()
end