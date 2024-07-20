--=============================================
-- Nhi�m v� Chuy�n sinh l�n 1
-- Created by TuanNA5
--=============================================

--=============================================
-- Nhi�m v� Chuy�n sinh l�n 2
-- Created by TuanNA5
--=============================================

-- Chuy�n sinh l�n 4 - TaskTrans k�t th�c sau khi nh�n Ng�c B�i K� N�ng : 32

Include("\\script\\lib\\globalfunctions.lua");

TRANSLIFE_MISSION_ID = 1537
TRANSLIFE_TASK_ID = 1538

TRANSLIFE_BYTE_COUNT = 1
TRANSLIFE_BYTE_FACTION = 2
TRANSLIFE_LEVEL = 99
TRANSLIFE_EXP = 2000000000
TRANSLIFE_BOX_COUNT = 4

tb_translife_seal = {
							{"Long T� �n",{2,0,30002,1,1}, "Long T�"},
							{"H� T� �n",{2,0,30003,1,1}, "H� T�"},
							{"�ng T� �n",{2,0,30006,1,1}, "�ng T�"},
							{"Ph�ng T� �n",{2,0,30005,1,1}, "Ph�ng T�"},
}
tb_translife_seal_cs6 = {
							{"Long T� �n",{2,0,30002,1,1}, "Long T�"},
							{"H� T� �n",{2,0,30003,1,1}, "H� T�"},
							{"�ng T� �n",{2,0,30006,1,1}, "�ng T�"},
							{"Ph�ng T� �n",{2,0,30005,1,1}, "Ph�ng T�"},							
}
tb_translife_tittle = 
{
	[1] = 	{
				[2] = {"H�n Nguy�n T�ng", 24, 1},	
				[4] = {"��u T�ng", 24, 2},	
				[3] = {"Thi�n Tu T�ng", 24, 3},	
				[6] = {"H� V�", 24, 4},	
				[8] = {"V� Y S�", 24, 5},	
				[9] = {"Ph�n �m S�", 24, 6},	
				[11] = {"Tr� Gian �� T�", 24, 7},	
				[12] = {"Tr�ng �c �� T�", 24, 8},	
				[14] = {"Nh�p Quan ��o nh�n", 24, 9},	
				[15] = {"S�n D��ng ��o nh�n", 24, 10},	
				[17] = {"Hi�u �y", 24, 11},	
				[18] = {"�� �y", 24, 12},	
				[20] = {"Th�i M�nh T�n Nh�n", 24, 13},	
				[21] = {"Th�c T�m T�n Nh�n", 24, 14},
				[23] = {"Nh�p Quan ��o nh�n", 24, 9},	
				[29] = {"V� Y S�", 24, 5},	
				[30] = {"Ph�n �m S�", 24, 6},					
			},
			
	[2] = 	{
				[2] = {"��t Ma Kim Cang", 25, 1},	
				[4] = {"La H�n H� Ph�p", 25, 2},	
				[3] = {"Truy�n kinh ph�p s�", 25, 3},	
				[6] = {"B� ��c th�ch kh�ch", 25, 4},	
				[8] = {"T� Tr�c s�", 25, 5},	
				[9] = {"H�i Nguy�t s�", 25, 6},	
				[11] = {"T� H�i hi�p", 25, 7},	
				[12] = {"�� t� t�m t�i", 25, 8},	
				[14] = {"V� ng� ��o nh�n", 25, 9},	
				[15] = {"Nh�n V�n Hi�p ��o", 25, 10},	
				[17] = {"Ph�n v� t��ng qu�n", 25, 11},	
				[18] = {"Ph�n uy t��ng qu�n", 25, 12},	
				[20] = {"H�c V� Th��ng", 25, 13},	
				[21] = {"B�ch V� Th��ng", 25, 14},
				[23] = {"V� ng� ��o nh�n", 25, 9},		
				[29] = {"T� Tr�c s�", 25, 5},	
				[30] = {"H�i Nguy�t s�", 25, 6},							
			},
			
	[3] =	{		
				[2] = {"B�t B� Thi�n Long", 26, 1},	
				[4] = {"B�t B�o La H�n", 26, 2},	
				[3] = {"V� L��ng Ph�p T�n", 26, 3},	
				[6] = {"Thi�n C� S� Gi�", 26, 4},	
				[8] = {"B�ch Li�n Ti�n T�", 26, 5},	
				[9] = {"Ng�c V�n Ti�n T�", 26, 6},	
				[11] = {"Long ��u Th�n C�i", 26, 7},	
				[12] = {"Kh�t Thi�n Th�n C�i", 26, 8},	
				[14] = {"Ch��ng Kinh ��o nh�n", 26, 9},	
				[15] = {"Th�i �t T�n Nh�n", 26, 10},	
				[17] = {"Long T��ng t��ng qu�n", 26, 11},	
				[18] = {"H� D�c t��ng qu�n", 26, 12},	
				[20] = {"U Minh Qu� S�t", 26, 13},	
				[21] = {"V� ��ng La S�t", 26, 14},	
				[23] = {"Ch��ng Kinh ��o nh�n", 26, 9},	
				[29] = {"B�ch Li�n Ti�n T�", 26, 5},	
				[30] = {"Ng�c V�n Ti�n T�", 26, 6},									
			},
			
	[4] =	{
				[2] = {"Tr��ng l�o ��t Ma ���ng", 27, 1},	
				[4] = {"Tr��ng l�o La H�n ���ng", 27, 2},	
				[3] = {"Tr��ng l�o T�ng Kinh C�c", 27, 3},	
				[6] = {"Thi�n Th� S� Gi�", 27, 4},	
				[8] = {"Kim Quang Ti�n T�", 27, 5},	
				[9] = {"Thi�n �m Ti�n T�", 27, 6},	
				[11] = {"Ch�p Ph�p Th�n C�i", 27, 7},	
				[12] = {"Ch��ng B�ng Th�n C�i", 27, 8},	
				[14] = {"Th��ng Thanh ��o Nh�n", 27, 9},	
				[15] = {"T� H� T�n Nh�n", 27, 10},	
				[17] = {"Tr�n Qu�n T��ng Qu�n", 27, 11},	
				[18] = {"Chinh L� T��ng Qu�n", 27, 12},	
				[20] = {"Di�m La Qu� S�t", 27, 13},	
				[21] = {"C� ��c La S�t", 27, 14},	
				[23] = {"Th��ng Thanh ��o Nh�n", 27, 9},	
				[29] = {"Kim Quang Ti�n T�", 27, 5},	
				[30] = {"Thi�n �m Ti�n T�", 27, 6},									
			},
			
	[5] = {
				[2] = {"Th� t�a ��t Ma ���ng", 28, 1},	
				[4] = {"Th� t�a La H�n ���ng", 28, 2},	
				[3] = {"Th� t�a T�ng Kinh C�c", 28, 3},	
				[6] = {"Thi�n Th� Th�n V�", 28, 4},	
				[8] = {"Kim Quang th�nh n�", 28, 5},	
				[9] = {"Thi�n �m th�nh n�", 28, 6},	
				[11] = {"Ch�p Ph�p tr��ng l�o", 28, 7},	
				[12] = {"Ch��ng B�ng tr��ng l�o", 28, 8},	
				[14] = {"Th��ng Thanh ch�n nh�n", 28, 9},	
				[15] = {"T� Ti�u th��ng nh�n", 28, 10},	
				[17] = {"Tr�n Qu�n nguy�n so�i", 28, 11},	
				[18] = {"Chinh L� nguy�n so�i", 28, 12},	
				[20] = {"Di�m La t�n gi�", 28, 13},	
				[21] = {"C� ��c t�n gi�", 28, 14},	
				[23] = {"Th��ng Thanh ch�n nh�n", 28, 9},		
				[29] = {"Kim Quang th�nh n�", 28, 5},	
				[30] = {"Thi�n �m th�nh n�", 28, 6},								
			},
}
tbMobsList_cs6 = {
		[1] = {"Ti�u Lam �ao Qu�", 	TSK_CS6_DaoQuy_XoaQuy, 	1},
		[2] = {"Ti�u Lam Xoa Qu�", 		TSK_CS6_DaoQuy_XoaQuy, 	2},
		[3] = {"Sa M�c H�nh Nh�n", 	TSK_CS6_SaMac_TamBao, 		1},
		[4] = {"T�m B�o Nh�n", 			TSK_CS6_SaMac_TamBao, 		2},
		[5] = {"Ki�m ti�n T�", 				TSK_CS6_KiemTien_DichTien, 	1},
		[6] = {"��ch ti�n T�", 				TSK_CS6_KiemTien_DichTien, 	2},
		[7] = {"Li�t Nhan Li Long", 		TSK_CS6_LiLong_HoaHo, 		1},
		[8] = {"X�ch Luy�n H�a H�", 	TSK_CS6_LiLong_HoaHo, 		2},
	}
tb_translife_weapon_effect = {			
			"H�o m�n",
			"Ph�n V�n",
			"�o�n Giao",			
			"Ph� Qu�n",
}
tb_translife_cloth_cs6_nhanlai = {
			[1] = {
					[1] = {{0,108,30005,1,4,5,639,6,102}, {0,109,30005,1,4,5,342,6,102}, {0,110,30005,1,4,6,306,6,102}},
					[2] = {{0,108,30006,1,4,5,639,6,102}, {0,109,30006,1,4,5,342,6,102}, {0,110,30006,1,4,6,306,6,102}},
					[3] = {{0,108,30007,1,4,5,639,6,102}, {0,109,30007,1,4,5,342,6,102}, {0,110,30007,1,4,6,306,6,102}},
					[4] = {{0,108,30008,1,4,5,639,6,102}, {0,109,30008,1,4,5,342,6,102}, {0,110,30008,1,4,6,306,6,102}},
				},		
			[2] = {
					[1] = {{0,108,30005,1,4,6,302,6,102}, {0,109,30005,1,4,5,409,6,102}, {0,110,30005,1,4,5,79,5,80,6,102}},
					[2] = {{0,108,30006,1,4,6,302,6,102}, {0,109,30006,1,4,5,409,6,102}, {0,110,30006,1,4,5,79,5,80,6,102}},
					[3] = {{0,108,30007,1,4,6,302,6,102}, {0,109,30007,1,4,5,409,6,102}, {0,110,30007,1,4,5,79,5,80,6,102}},
					[4] = {{0,108,30008,1,4,6,302,6,102}, {0,109,30008,1,4,5,409,6,102}, {0,110,30008,1,4,5,79,5,80,6,102}},
				},
			[3] = {
					[1] = {{0,108,30005,1,4,2,13075,6,102}, {0,109,30005,1,4,5,342,6,102}, {0,110,30005,1,4,6,306,6,102}},
					[2] = {{0,108,30006,1,4,2,13075,6,102}, {0,109,30006,1,4,5,342,6,102}, {0,110,30006,1,4,6,306,6,102}},
					[3] = {{0,108,30007,1,4,2,13075,6,102}, {0,109,30007,1,4,5,342,6,102}, {0,110,30007,1,4,6,306,6,102}},
					[4] = {{0,108,30008,1,4,2,13075,6,102}, {0,109,30008,1,4,5,342,6,102}, {0,110,30008,1,4,6,306,6,102}},
				},	
			[4] = {
					[1] = {{0,108,30005,1,4,5,27,6,102}, {0,109,30005,1,4,5,342,6,102}, {0,110,30005,1,4,4,292,4,293,6,102}},
					[2] = {{0,108,30006,1,4,5,27,6,102}, {0,109,30006,1,4,5,342,6,102}, {0,110,30006,1,4,4,292,4,293,6,102}},
					[3] = {{0,108,30007,1,4,5,27,6,102}, {0,109,30007,1,4,5,342,6,102}, {0,110,30007,1,4,4,292,4,293,6,102}},
					[4] = {{0,108,30008,1,4,5,27,6,102}, {0,109,30008,1,4,5,342,6,102}, {0,110,30008,1,4,4,292,4,293,6,102}},
				},
		}
tb_translife_cloth_cs7_nhanlai = {
			[1] = {
					[1] = {{0,108,30029,1,4,7,639,3,371,7,102}, {0,109,30029,1,4,5,342,7,102}, {0,110,30029,1,4,4,282,7,250,7,102}},
					[2] = {{0,108,30030,1,4,7,639,3,371,7,102}, {0,109,30030,1,4,5,342,7,102}, {0,110,30030,1,4,4,282,7,250,7,102}},
					[3] = {{0,108,30031,1,4,7,639,3,371,7,102}, {0,109,30031,1,4,5,342,7,102}, {0,110,30031,1,4,4,282,7,250,7,102}},
					[4] = {{0,108,30032,1,4,7,639,3,371,7,102}, {0,109,30032,1,4,5,342,7,102}, {0,110,30032,1,4,4,282,7,250,7,102}},
				},	
			[4] = {
					[1] = {{0,108,30029,1,4,7,27,7,102}, {0,109,30029,1,4,5,342,4,409,7,102}, {0,110,30029,1,4,5,292,5,293,7,102}},
					[2] = {{0,108,30030,1,4,7,27,7,102}, {0,109,30030,1,4,5,342,4,409,7,102}, {0,110,30030,1,4,5,292,5,293,7,102}},
					[3] = {{0,108,30031,1,4,7,27,7,102}, {0,109,30031,1,4,5,342,4,409,7,102}, {0,110,30031,1,4,5,292,5,293,7,102}},
					[4] = {{0,108,30032,1,4,7,27,7,102}, {0,109,30032,1,4,5,342,4,409,7,102}, {0,110,30032,1,4,5,292,5,293,7,102}},
				},		
			[3] = {
					[1] = {{0,108,30029,1,4,3,13075,7,102}, {0,109,30029,1,4,5,342,2,346,7,102}, {0,110,30029,1,4,4,282,7,250,7,102}},
					[2] = {{0,108,30030,1,4,3,13075,7,102}, {0,109,30030,1,4,5,342,2,346,7,102}, {0,110,30030,1,4,4,282,7,250,7,102}},
					[3] = {{0,108,30031,1,4,3,13075,7,102}, {0,109,30031,1,4,5,342,2,346,7,102}, {0,110,30031,1,4,4,282,7,250,7,102}},
					[4] = {{0,108,30032,1,4,3,13075,7,102}, {0,109,30032,1,4,5,342,2,346,7,102}, {0,110,30032,1,4,4,282,7,250,7,102}},
				},											
			[2] = {
					[1] = {{0,108,30029,1,4,6,302,7,409,7,102}, {0,109,30029,1,4,5,13219,5,13220,7,102}, {0,110,30029,1,4,4,290,7,250,7,102}},
					[2] = {{0,108,30030,1,4,6,302,7,409,7,102}, {0,109,30030,1,4,5,13219,5,13220,7,102}, {0,110,30030,1,4,4,290,7,250,7,102}},
					[3] = {{0,108,30031,1,4,6,302,7,409,7,102}, {0,109,30031,1,4,5,13219,5,13220,7,102}, {0,110,30031,1,4,4,290,7,250,7,102}},
					[4] = {{0,108,30032,1,4,6,302,7,409,7,102}, {0,109,30032,1,4,5,13219,5,13220,7,102}, {0,110,30032,1,4,4,290,7,250,7,102}},
				},	
		}		
		
tb_translife_cloth_cs8_nhanlai = {
			[1] = {
					[1] = {{0,108,680,1,4,7,639,5,329}, {0,109,680,1,4,1,563,5,13658,5,329}, {0,110,680,1,4,6,13702,1,13716,5,329}},
					[2] = {{0,108,681,1,4,7,639,5,329}, {0,109,681,1,4,1,563,5,13658,5,329}, {0,110,681,1,4,6,13702,1,13716,5,329}},
					[3] = {{0,108,682,1,4,7,639,5,329}, {0,109,682,1,4,1,563,5,13658,5,329}, {0,110,682,1,4,6,13702,1,13716,5,329}},
					[4] = {{0,108,683,1,4,7,639,5,329}, {0,109,683,1,4,1,563,5,13658,5,329}, {0,110,683,1,4,6,13702,1,13716,5,329}},
				},
			[4] = {
					[1] = {{0,108,680,1,4,7,27,4,13488,5,329}, {0,109,680,1,4,1,13711,5,13658,5,329}, {0,110,680,1,4,5,13705,1,13716,5,329}},
					[2] = {{0,108,681,1,4,7,27,4,13488,5,329}, {0,109,681,1,4,1,13711,5,13658,5,329}, {0,110,681,1,4,5,13705,1,13716,5,329}},
					[3] = {{0,108,682,1,4,7,27,4,13488,5,329}, {0,109,682,1,4,1,13711,5,13658,5,329}, {0,110,682,1,4,5,13705,1,13716,5,329}},
					[4] = {{0,108,683,1,4,7,27,4,13488,5,329}, {0,109,683,1,4,1,13711,5,13658,5,329}, {0,110,683,1,4,5,13705,1,13716,5,329}},
				},
			[2] = {
					[1] = {{0,108,680,1,4,4,13243,1,13344,5,329}, {0,109,680,1,4,1,13205,5,13658,5,329}, {0,110,680,1,4,3,476,1,13716,5,329}},
					[2] = {{0,108,681,1,4,4,13243,1,13344,5,329}, {0,109,681,1,4,1,13205,5,13658,5,329}, {0,110,681,1,4,3,476,1,13716,5,329}},
					[3] = {{0,108,682,1,4,4,13243,1,13344,5,329}, {0,109,682,1,4,1,13205,5,13658,5,329}, {0,110,682,1,4,3,476,1,13716,5,329}},
					[4] = {{0,108,683,1,4,4,13243,1,13344,5,329}, {0,109,683,1,4,1,13205,5,13658,5,329}, {0,110,683,1,4,3,476,1,13716,5,329}},
				},											
			[3] = {
					[1] = {{0,108,680,1,4,3,13075,5,329}, {0,109,680,1,4,1,13707,5,13658,5,329}, {0,110,680,1,4,1,476,1,13716,5,329}},
					[2] = {{0,108,681,1,4,3,13075,5,329}, {0,109,681,1,4,1,13707,5,13658,5,329}, {0,110,681,1,4,1,476,1,13716,5,329}},
					[3] = {{0,108,682,1,4,3,13075,5,329}, {0,109,682,1,4,1,13707,5,13658,5,329}, {0,110,682,1,4,1,476,1,13716,5,329}},
					[4] = {{0,108,683,1,4,3,13075,5,329}, {0,109,683,1,4,1,13707,5,13658,5,329}, {0,110,683,1,4,1,476,1,13716,5,329}},
				},	
			}		
tb_translife_cloth_cs9_nhanlai = {
			[1] = {
					[1] = {{0,108,901,1,4,3,13714,1,14146}, {0,109,901,1,4,4,13708,1,14136}, {0,110,901,1,4,1,13718,1,14150}},
					[2] = {{0,108,902,1,4,3,13714,1,14146}, {0,109,902,1,4,4,13708,1,14136}, {0,110,902,1,4,1,13718,1,14150}},
					[3] = {{0,108,903,1,4,3,13714,1,14146}, {0,109,903,1,4,4,13708,1,14136}, {0,110,903,1,4,1,13718,1,14150}},
					[4] = {{0,108,904,1,4,3,13714,1,14146}, {0,109,904,1,4,4,13708,1,14136}, {0,110,904,1,4,1,13718,1,14150}},
				},
			[4] = {
					[1] = {{0,108,901,1,4,13,14131,2,14145}, {0,109,901,1,4,1,14132,2,14143}, {0,110,901,1,4,5,13705,2,14144}},
					[2] = {{0,108,902,1,4,13,14131,2,14145}, {0,109,902,1,4,1,14132,2,14143}, {0,110,902,1,4,5,13705,2,14144}},
					[3] = {{0,108,903,1,4,13,14131,2,14145}, {0,109,903,1,4,1,14132,2,14143}, {0,110,903,1,4,5,13705,2,14144}},
					[4] = {{0,108,904,1,4,13,14131,2,14145}, {0,109,904,1,4,1,14132,2,14143}, {0,110,904,1,4,5,13705,2,14144}},
				},
			[2] = {
					[1] = {{0,108,901,1,4,5,13243,2,14147}, {0,109,901,1,4,6,13717,2,14143}, {0,110,901,1,4,2,13718,2,14144}},
					[2] = {{0,108,902,1,4,5,13243,2,14147}, {0,109,902,1,4,6,13717,2,14143}, {0,110,902,1,4,2,13718,2,14144}},
					[3] = {{0,108,903,1,4,5,13243,2,14147}, {0,109,903,1,4,6,13717,2,14143}, {0,110,903,1,4,2,13718,2,14144}},
					[4] = {{0,108,904,1,4,5,13243,2,14147}, {0,109,904,1,4,6,13717,2,14143}, {0,110,904,1,4,2,13718,2,14144}},
				},											
			[3] = {
					[1] = {{0,108,901,1,4,1,14148}, {0,109,901,1,4,6,13708,1,14136}, {0,110,901,1,4,1,13718,1,14150}},
					[2] = {{0,108,902,1,4,1,14148}, {0,109,902,1,4,6,13708,1,14136}, {0,110,902,1,4,1,13718,1,14150}},
					[3] = {{0,108,903,1,4,1,14148}, {0,109,903,1,4,6,13708,1,14136}, {0,110,903,1,4,1,13718,1,14150}},
					[4] = {{0,108,904,1,4,1,14148}, {0,109,904,1,4,6,13708,1,14136}, {0,110,904,1,4,1,13718,1,14150}},
				},
			}		
tb_translife_cloth = 
{
	[1] =	{
				[1] =	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,3,389,1,102}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,4,111,1,102}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,1,306,1,102}},	
						},
				
				[2] = 	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,4,389,2,102}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,5,111,2,102}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,2,306,2,102}},	
						},
				
				[3] = 	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,5,389,3,102}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,6,111,3,102}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,3,306,3,102}},	
						},
				
				[4] = 	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,6,389,4,102}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,7,111,4,102}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,4,306,4,102}},	
						},
				[5] = 	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,6,389,3,329}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,5,342,3,329}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,6,306,3,329}},	
						},
			},
				
	[2] = {
				[1] =	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,1,107,1,102}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,1,409,1,102}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,1,79,1,80,1,102}},
						},	
				
				[2] =	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,2,107,2,102}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,2,409,2,102}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,2,79,2,80,2,102}},	
						},
				
				[3] =	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,3,107,3,102}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,3,409,3,102}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,3,79,3,80,3,102}},	
						},
				
				[4] =	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,4,107,4,102}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,4,409,4,102}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,4,79,4,80,4,102}},	
						},
				[5] =	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,4,107,3,329}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,5,409,3,329}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,5,79,5,80,3,329}},	
						},
			},	

	[4] = 	{	
				[1] =	{			
							{"Chuy�n Sinh Trang", {0,108,514,1,1,1,27,1,102}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,4,111,1,102}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,3,41,3,42,1,102}},	
						},
				
				[2] =	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,2,27,2,102}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,5,111,2,102}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,4,41,4,42,2,102}},	
						},
				
				[3] =	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,3,27,3,102}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,6,111,3,102}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,5,41,5,42,3,102}},	
						},
				
				[4] =	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,4,27,4,102}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,7,111,4,102}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,6,41,6,42,4,102}},	
						},
				[5] =	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,4,27,3,329}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,5,342,3,329}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,4,292,4,293,3,329}},	
						},
			},
				
	[3] = {
				[1] =	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,5,50,1,102}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,4,111,1,102}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,1,306,1,102}},	
						},
				
				[2] =	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,1,252,2,102}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,5,111,2,102}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,2,306,2,102}},	
						},
				
				[3] =	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,6,50,3,102}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,6,111,3,102}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,3,306,3,102}},	
						},
				
				[4] =	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,2,252,4,102}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,7,111,4,102}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,4,306,4,102}},	
						},
				[5] =	{
							{"Chuy�n Sinh Trang", {0,108,514,1,1,2,252,3,329}},	
							{"Chuy�n Sinh Trang", {0,109,514,1,1,5,342,3,329}},	
							{"Chuy�n Sinh Trang", {0,110,514,1,1,6,306,3,329}},	
						},
			},
}

tb_option_cloth = {
				{0,108,510},
				{0,109,510},
				{0,110,510},
				{0,108,511},
				{0,109,511},
				{0,110,511},
				{0,108,513},
				{0,109,513},
				{0,110,513},
				{0,108,512},
				{0,109,512},
				{0,110,512},	
				{0,108,207},
				{0,108,208},
				{0,108,209},
				{0,108,210},
				{0,108,211},
				{0,108,212},
				{0,108,213},
				{0,108,214},
				{0,108,215},
				{0,108,216},
				{0,108,217},
				{0,108,218},	
				{0,109,281},
				{0,109,282},
				{0,109,283},
				{0,109,284},
				{0,109,285},
				{0,109,286},
				{0,109,287},
				{0,109,288},
				{0,109,289},
				{0,109,290},
				{0,109,291},
				{0,109,292},
				{0,110,281},
				{0,110,282},
				{0,110,283},
				{0,110,284},
				{0,110,285},
				{0,110,286},
				{0,110,287},
				{0,110,288},
				{0,110,289},
				{0,110,290},
				{0,110,291},
				{0,110,292},	
				{0,108,199},
				{0,108,200},
				{0,108,201},
				{0,108,202},
				{0,109,277},
				{0,109,278},
				{0,109,279},
				{0,109,280},
				{0,110,89},
				{0,110,90},
				{0,110,91},
				{0,110,92},
				{0,108,195},
				{0,108,196},
				{0,108,197},
				{0,108,198},
				{0,109,255},
				{0,109,256},
				{0,109,257},
				{0,109,258},
				{0,110,85},
				{0,110,86},
				{0,110,87},
				{0,110,88},
				{0,108,139},
				{0,109,185},
				{0,110,81},
				{0,108,140},
				{0,109,186},
				{0,110,82},
				{0,108,141},
				{0,109,187},
				{0,110,83},
				{0,108,142},
				{0,109,188},
				{0,110,84},
				{0,108,570},
				{0,109,570},
				{0,110,570},
				{0,108,571},
				{0,109,571},
				{0,110,571},
				{0,108,572},
				{0,109,572},
				{0,110,572},
				{0,108,573},
				{0,109,573},
				{0,110,573},
				{0,108,562},
				{0,109,562},
				{0,110,562},
				{0,108,563},
				{0,109,563},
				{0,110,563},
				{0,108,564},
				{0,109,564},
				{0,110,564},		
				{0,108,565},
				{0,109,565},
				{0,110,565},								
				{0,108,566},
				{0,109,566},
				{0,110,566},				
				{0,108,567},
				{0,109,567},
				{0,110,567},				
				{0,108,568},
				{0,109,568},
				{0,110,568},			
				{0,108,569},
				{0,109,569},
				{0,110,569},				
				{0,108,30001},
				{0,108,30002},
				{0,108,30003},
				{0,108,30004},
				{0,108,30005},
				{0,108,30006},
				{0,108,30007},
				{0,108,30008},
				{0,108,30009},
				{0,108,30010},
				{0,108,30011},
				{0,108,30012},
				{0,109,30001},
				{0,109,30002},
				{0,109,30003},
				{0,109,30004},
				{0,109,30005},
				{0,109,30006},
				{0,109,30007},
				{0,109,30008},
				{0,109,30009},
				{0,109,30010},
				{0,109,30011},
				{0,109,30012},
				{0,110,30001},
				{0,110,30002},
				{0,110,30003},
				{0,110,30004},
				{0,110,30005},
				{0,110,30006},
				{0,110,30007},
				{0,110,30008},
				{0,110,30009},
				{0,110,30010},
				{0,110,30011},
				{0,110,30012},
				{0, 108, 109},
				{0, 108, 110},
				{0, 108, 111},
				{0, 108, 112},
				{0, 109, 109},
				{0, 109, 110},
				{0, 109, 111},
				{0, 109, 112},
				{0, 110, 73},
				{0, 110, 74},
				{0, 110, 75},
				{0, 110, 76},
				{0, 108, 1},
				{0, 108, 2},
				{0, 108, 3},
				{0, 108, 4},
				{0, 108, 5},
				{0, 108, 6},
				{0, 108, 7},
				{0, 108, 8},
				{0, 108, 9},
				{0, 108, 10},
				{0, 108, 11},
				{0, 108, 12},
				{0, 108, 13},
				{0, 108, 14},
				{0, 108, 15},
				{0, 108, 16},
				{0, 108, 17},
				{0, 108, 18},
				{0, 108, 518},
				{0, 108, 522},
				{0, 108, 526},
				{0, 108, 19},
				{0, 108, 20},
				{0, 108, 21},
				{0, 108, 22},
				{0, 108, 23},
				{0, 108, 24},
				{0, 108, 25},
				{0, 108, 26},
				{0, 108, 27},
				{0, 108, 28},
				{0, 108, 29},
				{0, 108, 30},
				{0, 108, 31},
				{0, 108, 32},
				{0, 108, 33},
				{0, 108, 34},
				{0, 108, 35},
				{0, 108, 36},
				{0, 108, 519},
				{0, 108, 523},
				{0, 108, 527},
				{0, 108, 37},
				{0, 108, 38},
				{0, 108, 39},
				{0, 108, 40},
				{0, 108, 41},
				{0, 108, 42},
				{0, 108, 43},
				{0, 108, 44},
				{0, 108, 45},
				{0, 108, 46},
				{0, 108, 47},
				{0, 108, 48},
				{0, 108, 49},
				{0, 108, 50},
				{0, 108, 51},
				{0, 108, 52},
				{0, 108, 53},
				{0, 108, 54},
				{0, 108, 520},
				{0, 108, 524},
				{0, 108, 528},
				{0, 108, 55},
				{0, 108, 56},
				{0, 108, 57},
				{0, 108, 58},
				{0, 108, 59},
				{0, 108, 60},
				{0, 108, 61},
				{0, 108, 62},
				{0, 108, 63},
				{0, 108, 64},
				{0, 108, 65},
				{0, 108, 66},
				{0, 108, 67},
				{0, 108, 68},
				{0, 108, 69},
				{0, 108, 70},
				{0, 108, 71},
				{0, 108, 72},
				{0, 108, 521},
				{0, 108, 525},
				{0, 108, 529},
				{0, 109, 1},
				{0, 109, 2},
				{0, 109, 3},
				{0, 109, 4},
				{0, 109, 5},
				{0, 109, 6},
				{0, 109, 7},
				{0, 109, 8},
				{0, 109, 9},
				{0, 109, 10},
				{0, 109, 11},
				{0, 109, 12},
				{0, 109, 13},
				{0, 109, 14},
				{0, 109, 15},
				{0, 109, 16},
				{0, 109, 17},
				{0, 109, 18},
				{0, 109, 518},
				{0, 109, 522},
				{0, 109, 526},
				{0, 109, 19},
				{0, 109, 20},
				{0, 109, 21},
				{0, 109, 22},
				{0, 109, 23},
				{0, 109, 24},
				{0, 109, 25},
				{0, 109, 26},
				{0, 109, 27},
				{0, 109, 28},
				{0, 109, 29},
				{0, 109, 30},
				{0, 109, 31},
				{0, 109, 32},
				{0, 109, 33},
				{0, 109, 34},
				{0, 109, 35},
				{0, 109, 36},
				{0, 109, 519},
				{0, 109, 523},
				{0, 109, 527},
				{0, 109, 37},
				{0, 109, 38},
				{0, 109, 39},
				{0, 109, 40},
				{0, 109, 41},
				{0, 109, 42},
				{0, 109, 43},
				{0, 109, 44},
				{0, 109, 45},
				{0, 109, 46},
				{0, 109, 47},
				{0, 109, 48},
				{0, 109, 49},
				{0, 109, 50},
				{0, 109, 51},
				{0, 109, 52},
				{0, 109, 53},
				{0, 109, 54},
				{0, 109, 520},
				{0, 109, 524},
				{0, 109, 528},
				{0, 109, 55},
				{0, 109, 56},
				{0, 109, 57},
				{0, 109, 58},
				{0, 109, 59},
				{0, 109, 60},
				{0, 109, 61},
				{0, 109, 62},
				{0, 109, 63},
				{0, 109, 64},
				{0, 109, 65},
				{0, 109, 66},
				{0, 109, 67},
				{0, 109, 68},
				{0, 109, 69},
				{0, 109, 70},
				{0, 109, 71},
				{0, 109, 72},
				{0, 109, 521},
				{0, 109, 525},
				{0, 109, 529},
				{0, 110, 1},
				{0, 110, 2},
				{0, 110, 3},
				{0, 110, 4},
				{0, 110, 5},
				{0, 110, 6},
				{0, 110, 7},
				{0, 110, 8},
				{0, 110, 9},
				{0, 110, 10},
				{0, 110, 11},
				{0, 110, 12},
				{0, 110, 13},
				{0, 110, 14},
				{0, 110, 15},
				{0, 110, 16},
				{0, 110, 17},
				{0, 110, 18},
				{0, 110, 518},
				{0, 110, 522},
				{0, 110, 526},
				{0, 110, 19},
				{0, 110, 20},
				{0, 110, 21},
				{0, 110, 22},
				{0, 110, 23},
				{0, 110, 24},
				{0, 110, 25},
				{0, 110, 26},
				{0, 110, 27},
				{0, 110, 28},
				{0, 110, 29},
				{0, 110, 30},
				{0, 110, 31},
				{0, 110, 32},
				{0, 110, 33},
				{0, 110, 34},
				{0, 110, 35},
				{0, 110, 36},
				{0, 110, 519},
				{0, 110, 523},
				{0, 110, 527},
				{0, 110, 37},
				{0, 110, 38},
				{0, 110, 39},
				{0, 110, 40},
				{0, 110, 41},
				{0, 110, 42},
				{0, 110, 43},
				{0, 110, 44},
				{0, 110, 45},
				{0, 110, 46},
				{0, 110, 47},
				{0, 110, 48},
				{0, 110, 49},
				{0, 110, 50},
				{0, 110, 51},
				{0, 110, 52},
				{0, 110, 53},
				{0, 110, 54},
				{0, 110, 520},
				{0, 110, 524},
				{0, 110, 528},
				{0, 110, 55},
				{0, 110, 56},
				{0, 110, 57},
				{0, 110, 58},
				{0, 110, 59},
				{0, 110, 60},
				{0, 110, 61},
				{0, 110, 62},
				{0, 110, 63},
				{0, 110, 64},
				{0, 110, 65},
				{0, 110, 66},
				{0, 110, 67},
				{0, 110, 68},
				{0, 110, 69},
				{0, 110, 70},
				{0, 110, 71},
				{0, 110, 72},
				{0, 110, 521},
				{0, 110, 525},
				{0, 110, 529},
				{0,108,30029}, --new ps2
				{0,109,30029},
				{0,110,30029},
				{0,108,30030},
				{0,109,30030},
				{0,110,30030},
				{0,108,30031},
				{0,109,30031},
				{0,110,30031},
				{0,108,30032},
				{0,109,30032},
				{0,110,30032},
				{0,108,680}, --new ps3
				{0,109,680},
				{0,110,680},
				{0,108,681},
				{0,109,681},
				{0,110,681},
				{0,108,682},
				{0,109,682},
				{0,110,682},
				{0,108,683},
				{0,109,683},
				{0,110,683},
				{0,108,901}, --new ps4
				{0,109,901},
				{0,110,901},
				{0,108,902},
				{0,109,902},
				{0,110,902},
				{0,108,903},
				{0,109,903},
				{0,110,903},
				{0,108,904},
				{0,109,904},
				{0,110,904},
}

function GetTranslifeCount()
	return GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_COUNT)
end

function GetTranslifeFaction()
	return GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_FACTION)
end

function CheckSeal()
	if BigGetItemCount(2,0,30002) < 1 and BigGetItemCount(2,0,30003) < 1 and BigGetItemCount(2,0,30005) < 1 and BigGetItemCount(2,0,30006) < 1 then
		return 0
	end
	return 1
end

-- Th�c hi�n xong nhi�m v� g�i h�m �� set task l�n 1
function SetTaskTrans()
	SetTask(TRANSLIFE_MISSION_ID, GetTask(TRANSLIFE_MISSION_ID) + 1)
end
-- G�i h�m �� l�y tr�ng th�i nhi�m v� 
function GetTaskTrans()
	return GetTask(TRANSLIFE_MISSION_ID)
end