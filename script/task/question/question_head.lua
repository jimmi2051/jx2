
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 新手问答功能头文件
-- Edited by peres
-- 2005/04/12 PM 16:38

-- 看见的  熄灭了
-- 消失的  记住了
-- 我站在  海脚天涯
-- 听见    土壤萌芽
-- 等待    昙花再开
-- 把芬芳  留给年华
-- 彼岸    没有灯塔
-- 我依然  张望着
-- 天黑    刷白了头发
-- 紧握着  我火把
-- 他来    我对自己说
-- 我不害怕
-- 我很爱他

-- lyrics : 彼岸花

-- ======================================================

-- 表格文件类的支持
Include("\\script\\class\\ktabfile.lua");

-- /////////////////// 全局函数处理区 ////////////////////

-- 读入问题表格文件
tabFile = new(KTabFile, "\\settings\\new_question.txt");

-- /////////////////// 全局变量声明区 ////////////////////

-- 记录当前问答题所在表格文件的行数
QA_NOWROW = 1012;
-- 记录玩家已经回答的问题数
QA_FINISHNUM = 1013;
-- 记录玩家每个问题回答的对错状态
QA_RIGHTSTATE = 1016;
-- 记录玩家任务状态的变量
QA_STATE = 1014;
-- 记录随机种子的变量
QA_RANDOMSEED = 1015;
-- 每次扣除玩家的体力值
QA_PAYSTAMINA = 5;
-- 最小可以进行任务的体力值
QA_MINSTAMINA = 5;

-- 用于检索表格行数和权重的数组
QA_RowRate = {};

-- 回答问题对与错的过程名，用于组合字符数组
QA_RightFunction = "/AnswerRight";
QA_ErrorFunction = "/AnswerError";
QA_ExitFunction = "Cho ta suy ngh� ch髏 !/MainExit";
-- 
QA_TitleText = "<enter>";


-- 从表格文件中读取每个任务的权重形成一个数组
function CreateRateArry()

local nRow = tonumber(tabFile:getRow()); -- 获取表格的总行数

local i,j = 0,0;

	for i=2, nRow do
		j = j + 1;
		tinsert(QA_RowRate, getn(QA_RowRate) + 1, {i, tonumber(tabFile:getCell(i,"TaskRate"))});
	end;

end;


-- 从获取到的任务行数创建一个对话脚本
function CreateQuestion()

--randomseed(GetTask(QA_RANDOMSEED)); -- 设置随机种子

local nRow = SelectQuestion(); -- 随机得到一个问题的行数
local nKeyNum = tonumber(tabFile:getCell(nRow, "KeyNum")); -- 得到答案的个数
local nKeyPos = tonumber(tabFile:getCell(nRow, "KeyPos")); -- 得到正确答案的位置

local strTitle = tabFile:getCell(nRow, "QuestionTitle"); -- 问题的标题字符

local strRead = ""; -- 用于临时读取表格中的字符串

local strKey = {""}; -- 构成答案的字符数组
local strMain = {""}; -- 最终输出成 SAY 函数的字符串数组

local i,j = 0,0;


	strMain[1] = QA_TitleText.."T鎛g c閚g ngi tr� l阨 ng "..GetTask(QA_RIGHTSTATE).."  c﹗ h醝! ".."Зy l� c﹗ h醝 th�  "..(GetTask(QA_FINISHNUM) + 1).." :"..strTitle;

	for i=1, nKeyNum do
		strRead = tabFile:getCell(nRow, "Key"..i);
		if (nKeyPos==i) then
			strKey[i] = strRead..QA_RightFunction;			
		else
			strKey[i] = strRead..QA_ErrorFunction;
		end;
	end;
	
	-- 对答案数组进行乱序处理
	strKey = RandomArry(strKey);
	
	-- 再循环一次最终组成对话脚本所需的字符串数组
	for i=1, nKeyNum do
		tinsert(strMain, getn(strMain)+1, strKey[i]);
	end;
	
	tinsert(strMain, getn(strMain)+1, QA_ExitFunction);
	
	-- 弹出选择对话框
	SelectSay(strMain);
	
end;


-- 从当前的问题列表里随机选出一个问题来，返回值为该问题的行数
function SelectQuestion()

local nQuestionRow = 0; -- 最后获取到的表格函数
local nTotalRate = 0; -- 所有权重的加总
local nRandomRate = 0; -- 随机得到的权重
local nAddRate = 0; -- 用于随机加成的变量

local i,j = 0,0;

	for i=1, getn(QA_RowRate) do
		nTotalRate = nTotalRate + QA_RowRate[i][2];
	end;
	
	nRandomRate = random(1,nTotalRate);
	
	for i=1, getn(QA_RowRate) do
	
		nAddRate = nAddRate + QA_RowRate[i][2];
	
		if (nAddRate >= nRandomRate) then
			nQuestionRow = QA_RowRate[i][1];
			SetTask(QA_NOWROW, nQuestionRow); -- 储存变量
			return nQuestionRow;
		end;
	end;

end;


-- 对一个数组里面的元素进行乱序处理
function RandomArry(nArray)

local nNum = getn(nArray);
local nRanA, nRanB = 0,0; -- 两个交换的随机位置
local i = 0;

local nChange; -- 用于临时交换的变量

	-- 如果数组的元素小于 2 或者传入的起始和结束位置不符的话那就直接返回原始值了
	if (nNum<2) then
		return nArray;
	end;
	
	for i=1, nNum do
		nRanA = random(1, nNum);
		nRanB = random(1, nNum);
		nChange = nArray[nRanA];
		nArray[nRanA] = nArray[nRanB];
		nArray[nRanB] = nChange;
	end;
	
	return nArray;

end;


-- 用于处理一堆选项的对话函数 Say(""...);
function SelectSay(strSay)

local strMsg,strSel = "","";
local strNum = getn(strSay);

	if strNum < 2 then
		return
	end;
	
	if strNum > 2 then
		for i=2,strNum - 1 do
			strSel = strSel..format("%q", strSay[i])..",";
		end;
		strSel = strSel..format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", strSay[1])..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", strSay[1])..",1"..","..strSel..");";
	end;
	
	dostring(strMsg);
	
end;

-- 用以获取玩家的性别，直接返回字符串
function GetPlayerSex()
local mySex -- 用以显示人物性别的字符

	if (GetSex() == 1) then
		mySex = "C玭g t�"
	elseif (GetSex() == 2) then
		mySex = "N� hi謕 "
	end
	
return mySex
end