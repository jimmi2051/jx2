--========文件定义==================================--
--文件名：string.lua
--作者：yfeng
--创建日期：2004-6-1
--最后修改日期：2005-1-24
--功能叙述：
--	扩展lua未提供的字符串处理函数
--
--游戏脚本·剑侠情缘网络版
--金山软件股份有限公司，copyright 1992-2005
--==================================================--

--========函数定义==================================--
--函数原形：replace(str,pattern,s)
--作者：yfeng
--创建日期：2005-1-27
--最后修改日期：2005-1-27
--功能叙述：
--	用字符串s替换字符串str中的pattern
--参数：
--	str：源字符串n
--	pattern：要替换的字符串
--	s：替换pattern的字符串
--返回值：
--	替换后的字符串。
--用例：
--	无
--==================================================--
function replace(str,pattern,s)
	if pattern == s then	--预防死循环
		return str
	end;
	local nMaxLoop = strlen(str)
	local nLen = strlen(s)
	local nLoop = 0;
	local startS,endS = strfind(str,pattern)
	while(startS) do	
		if nLoop > nMaxLoop then
			print("[H祄 s� b竜 l鏸]: s� l莕 replace qu� l韓, tr竛h ch誸 li猲 t鬰, bu閏 tho竧 ra");
			return ""
		end;
		str = strsub(str,1,startS-1)..s..strsub(str,endS+1,strlen(str))
		startS,endS = strfind(str,pattern,startS+nLen)
		nLoop = nLoop + 1;
	end
	return str
end

function sf_Replace(str,pattern,s)
	if pattern == s then	--预防死循环
		return str
	end;
	local nMaxLoop = strlen(str)
	local nLen = strlen(s)
	local nLoop = 0;
	local startS,endS = strfind(str,pattern)
	while(startS) do	
		if nLoop > nMaxLoop then
			print("[H祄 s� b竜 l鏸]: s� l莕 replace qu� l韓, tr竛h ch誸 li猲 t鬰, bu閏 tho竧 ra");
			return ""
		end;
		str = strsub(str,1,startS-1)..s..strsub(str,endS+1,strlen(str))
		startS,endS = strfind(str,pattern,startS+nLen)
		nLoop = nLoop + 1;
	end
	return str
end

--把带颜色信息的字符串转变为可供Say和Talk使用的字符串
--szString：原字符串
--tbColorInfo：颜色信息。格式{标记头,标记尾,颜色英文单词}，例子如下：
--tbColorInfo = 
--{
--	[1] = {"{y","}","yellow"},
--	[2] = {"{g","}","green"},
--	[3] = {"{r","}","red"},
--}
function sf_ConvertColorString(szString,tbColorInfo)
	tbColorInfo = tbColorInfo or g_tbColorInfo;
	for i=1,getn(tbColorInfo) do
		szString = sf_Replace(szString,tbColorInfo[i][1],"<color="..tbColorInfo[i][3]..">");
		szString = sf_Replace(szString,tbColorInfo[i][2],"<color>");
	end;
	return szString;
end;
--删除标记，比如去掉字符串中所有<color>标记
--sTagS:标记的头，如"<"
--sTagE:标记的尾，如">"
function sf_RemoveTag(sString,sTagS,sTagE)
	local sSubStr = "";
	local nTagSIndex = strfind(sString,sTagS,1);
	local nTagEIndex = strfind(sString,sTagE,1);
	local nMaxLoop = strlen(sString)
	local nLoop = 0;
	while nTagSIndex ~= nil and nTagEIndex ~= nil do
		if nLoop >= nMaxLoop then
			print("[H祄 s� b竜 l鏸]: s� l莕 sf_RemoveTag qu� l韓, tr竛h ch誸 li猲 t鬰, bu閏 tho竧 ra");
			return "";
		end;
		sSubStr = strsub(sString,nTagSIndex,nTagEIndex)
		sString = sf_Replace(sString,sSubStr,"")
		nTagSIndex = strfind(sString,sTagS,nTagSIndex);
		if nTagSIndex ~= nil then
			nTagEIndex = strfind(sString,sTagE,nTagSIndex);
		end;
		nLoop = nLoop + 1;
	end;
	return sString
end;
--========函数定义==================================--
--函数原形：split(str,splitor)
--作者：yfeng
--创建日期：2004-6-1
--最后修改日期：2004-6-1
--功能叙述：
--	把字符串str用分裂符splitor分裂成数组形式
--参数：
--	str：被分裂的字符串
--	splitor：分裂符,如果该参数没有，默认为＂,＂
--返回值：
--	被分裂的数组．如果字符串str中没有包含分裂符splitor，
--则返回的数组只有１个元素，元素内容就是str本身．
--用例：
--	local s = "aaa,bbb,ccc,ddd"
--	local arr = splite(s,",")
--	则，arr的内容为：
--	arr[1]：aaa
--	arr[2]：bbb
--	arr[3]：ccc
--	arr[4]：ddd
--==================================================--
function split(str,splitor)
	if(splitor==nil) then
		splitor=","
	end
	local strArray={}
	local strStart=1
	local splitorLen = strlen(splitor)
	local index=strfind(str,splitor,strStart)
	if(index==nil) then
		strArray[1]=str
		return strArray
	end
	local i=1
	while index do
		strArray[i]=strsub(str,strStart,index-1)
		i=i+1
		strStart=index+splitorLen
		index = strfind(str,splitor,strStart)
	end
	strArray[i]=strsub(str,strStart,strlen(str))
	return strArray
end

--========函数定义==================================--
--函数原形：join(arr,insertor)
--作者：yfeng
--创建日期：2004-6-1
--最后修改日期：2005-1-24
--功能叙述：
--	把一维数组arr内的元素内容用insertor连接起来，arr的
--元素最好为字符串类型，数字类型也可以．
--参数：
--	arr：被连接的数组
--	insertor：插入符，该参数没有，默认插入符为＂,＂
--返回值：
--	返回连接之后的字符串．如果arr没有任何元素，则返回
--nil．
--用例：
--	local sarr = {"a","b","c","d"}
--	local s = join(sarr,",")
--	则：s的结果为
--	s："a,b,c,d"
--==================================================--
function join(arr,insertor)
	local maxItem = getn(arr)
	if(maxItem ==0) then
		return nil
	end
	if(insertor==nil) then
		insertor=","
	end
	local str=""
	for i=1,maxItem-1 do
		if(not arr[i]) then 
			str= str..insertor
		else
			str = str..tostring(arr[i])..insertor
		end
	end
	if(arr[maxItem]) then 
		str = str..tostring(arr[maxItem])
	end
	return str
end

--========函数定义==================================--
--函数原形：trim(str)
--作者：yfeng
--创建日期：2004-6-1
--最后修改日期：2005-1-24
--功能叙述：
--	删除字符串str两端的空白符号，如果没有空白符号，则
--不删除．
--参数：
--	str：被删除空白符号的字符串
--返回值：
--	被删除了空白符的字符串
--用例：
--	local s = "   dddd     "
--	s = trim(s)
--	则，s的结果为：
--	s："dddd"
--==================================================--
function trim(str)
	local start,last = strfind(str,"%S+.*%S+")
	print(tostring(start).."|"..tostring(last))
	if(start==nil or last==nil) then
		return str
	end
	return strsub(str,start,last)
end

---RGB数字转换成16进制表示的字符串
function toColor(r,g,b)
	if(not tonumber(r)) then r=0 end
	if(not tonumber(g)) then g=0 end
	if(not tonumber(b)) then b=0 end
	if(r<0) then r=0 end
	if(g<0) then g=0 end
	if(b<0) then g=0 end
	if(r>255) then r=255 end
	if(g>255) then g=255 end
	if(b>255) then b=255 end
	return r*65536+g*256+b
end
-------------------------------------

---将五行数值转换成彩色五行汉字
SERIESWORD = {
	{ " Kim ",	"metal"	},
	{ "M閏",	"wood"	},
	{ "Th駓",	"water"	},
	{ "H醓",	"fire"	},
	{ "Th�",	"earth"	}
}

function toSeriesColorText(text, sno)
	if (sno < 0 or sno >= getn(SERIESWORD)) then
		return text;
	else
		return "<color="..SERIESWORD[sno+1][2]..">"..text.."<color>";
	end
end

function toSeries(sno)
	if(not tonumber(sno)) then return "error" end
	if(sno < 0 or sno > 4) then return "Ch璦" end
	return toSeriesColorText(SERIESWORD[sno+1][1], sno);
end
------------------------------

---将等级数字转换成彩色等级汉字
LEVELWORD = {
	"<color="..toColor(200,200,200).."> c蕄 1<color>",
	"<color="..toColor(0,200,0).."> c蕄 2<color>",
	"<color="..toColor(200,0,0).."> c蕄 3<color>",
	"<color="..toColor(200,0,200).."> c蕄 4<color>",
	"<color="..toColor(200,200,0).."> c蕄 5<color>",
	"<color="..toColor(0,0,255).."> c蕄 6<color>",
	"<color="..toColor(0,255,0).."> c蕄 7<color>",
	"<color="..toColor(255,0,0).."> c蕄 8<color>",
	"<color="..toColor(255,0,255).."> c蕄 9<color>",
	"<color="..toColor(255,255,0)..">c蕄 10<color>",	
}

function toLevel(lvl)
	if(not tonumber(lvl)) then return "error" end
	if(lvl < 0 or lvl > 10) then return "V� Tri" end
	return LEVELWORD[lvl]
end
---------------------------------

function Val2Str(value, ind)
	ind = ind or "";
	if type(value) == "table" then
		local str = '{\n';
		local tmp_ind = ind..'\t'
		for k,v in value do
			str = str .. tmp_ind .. '['..Val2Str(k)..'] = ' .. Val2Str(v, tmp_ind) .. ',\n';
		end
		str = str .. ind .. '}';
		return str;
	elseif type(value) == 'function' then
		return '"#FUNCTION"';
	elseif type(value) == 'string' then
		if strsub(value,1,1) == '@' then
			return strsub(value,2);
		else
			value = gsub(value, "\n", "\\n");
			value = gsub(value, "\t", "\\t");
			return '"'..value..'"';
		end
	elseif type(value) == 'boolean' then
		return '"'..tostring(value)..'"';
	else
		return tostring(value);
	end
end

function Val2StrShort(value, ind)
	ind = ind or "";
	if type(value) == "table" then
		local str = '{';
		local tmp_ind = ind..' '
		for k,v in value do
			str = str .. tmp_ind .. '['..Val2StrShort(k)..'] = ' .. Val2StrShort(v, tmp_ind) .. ',';
		end
		str = str .. ind .. '}';
		return str;
	elseif type(value) == 'function' then
		return '"#FUNCTION"';
	elseif type(value) == 'string' then
		if strsub(value,1,1) == '@' then
			return strsub(value,2);
		else
			value = gsub(value, "\n", "\\n");
			value = gsub(value, "\t", "\\t");
			return '"'..value..'"';
		end
	elseif type(value) == 'boolean' then
		return '"'..tostring(value)..'"';
	else
		return tostring(value);
	end
end

function FilePath2Str(value)
	return Val2StrShort(encode_file_path(value))
end

function encode_file_path(_file_path)
	return sf_Replace(_file_path,"\\","\\\\")
end

