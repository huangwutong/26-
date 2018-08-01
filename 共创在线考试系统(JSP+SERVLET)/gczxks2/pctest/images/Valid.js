//检查CheckBox选中的个数
function GetCheckBoxCount(name,fm1) {
	var nRet = 0;
	for(var i=0;i<fm1.elements.length;i++) {
		if(fm1.elements[i].name.indexOf(name)!=-1 && fm1.elements[i].checked==true) nRet++;
	}
	return nRet;
}
//得到CheckBox的个数
function GetCheckBoxTotal(name,fm1) {
	var nRet = 0;
	for(var i=0;i<fm1.elements.length;i++) 
		if(fm1.elements[i].name.indexOf(name)!=-1) nRet++;
	return nRet;
}
//判断是否全选
function CheckAllChecked(name,fm1) {
	if(GetCheckBoxTotal(name,fm1) == GetCheckBoxCount(name,fm1)) return true;
	return false;
}

//改变CheckBox的状态,主要考虑注册时的年级选择,选择某一个年级内容时,其他年级信息应该清除
function UpdateCheck(name,fm1,flag) {
	var subname = name.substring(0,name.lastIndexOf("_"));
	for(var i=0;i<fm1.elements.length;i++) {
		if(fm1.elements[i].name.indexOf(name)!=-1) fm1.elements[i].checked = flag;
		else if(fm1.elements[i].name.indexOf(subname)!=-1) fm1.elements[i].checked = false;
	}
}

//清除别的行的CheckBox状态,主要用于注册时选定某年级的科目后选择别的年级科目情况,此时将原来年级内容清空
function ClearOtherCheck(name,fm1) {
	var subname = name.substring(0,name.lastIndexOf("_"));
	for(var i=0;i<fm1.elements.length;i++) {
		if(fm1.elements[i].name.indexOf(name)!=-1) continue;
		else if(fm1.elements[i].name.indexOf(subname)!=-1) fm1.elements[i].checked = false;
	}
}

//验证值是否为空,如果为空,返回False,同时给出错误提示
function CheckEmpty(ele,msg) {
	if(ele.value == '') {
		alert(msg);
		ele.focus();
		return false;
	}
	return true;
}
//检查网校搜索方式是否选择，如果没有则给出错误提示，然后将焦点放置在选择方式下拉列表上
function CheckSearchMethod(fm) {
	if(fm.Search_Method.options[fm.Search_Method.selectedIndex].value=="") {
		alert('对不起，请选择正确的搜索方式！');
		fm.Search_Method.focus();
		return false;
	}
	return true;
}

//提示用户是否退出，如果确定，则关闭窗口，否则不操作
function ExitWithHints(msg) {
	var ret=confirm(msg);
	if(ret == true) {
		window.close();
	}
}

//弹出对话框信息
function ConfirmHints(msg) {
	return confirm(msg);
}

//判断是否为空，如果为空，则弹出警告框
function ifEmpty(ele,msg) {
	if(ele.value == '') {
		alert(msg);
		ele.focus();
		return false;
	}
return true;
}

//判断两次输入的密码是否一致,如果不一致，则弹出警告框
function PassEqual(pass1,pass2,msg){
	if(pass1.value == pass2.value) return true;
	else
	{
		alert(msg);
		pass1.focus();
		return false;
	}
}


//检查电话号码,长度是否正确，是否包含非法字符
function CheckNumber(tel) {
	var str=tel.value;
	if (str.length<7 || str.length>13)
	{
		alert("请输入正确的电话号码，以便我们和你联系");
			tel.focus();
			return false;
	}
	for(var i=0;i<str.length;i++) {
		var ch=str.charCodeAt(i);
		if(ch<48 || ch>57) {
			alert("请输入正确的电话号码，以便我们和你联系");
			tel.focus();
			return false;
		}
	}
	return true;
}

//检查Email地址是否合法
function CheckEmail(ele,msg){
  var reg1 = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/; // not valid
  var reg2 = /^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3}|[0-9]{1,3})(\]?)$/; // valid
  var email=ele.value;

  if (!(!reg1.test(email) && reg2.test(email))) { // if syntax is valid
		alert(msg); // this is also optional
		ele.focus();
		return false;
  }
  return true;
}

//检查邮政编码是否合法
function CheckZipCode(ele){
	if(ele.value.length != 6)
	{
		alert("对不起，你输入的邮编长度不正确");
		ele.focus();
		return false;
	}
	if(isNumber(ele.value) == false)
	{
		alert("对不起，你输入的邮编只能是数字");
		ele.focus();
		return false;
	}
return true;
}

function pop_use(theUrl,w,h)
{
	win = window.open(theUrl,'','width='+420+',height='+280+',scrollbars=yes,menubar=no,resizable=no');
}
//打开新窗口
function openUrl(theUrl,wlength,hlength)
{
    window.open(theUrl, "","width="+wlength+",height="+hlength+",resizable=yes,toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,top=70,left=130");
}

function openMax(theUrl,wlength,hlength)
{
    window.open(theUrl, "","width="+wlength+",height="+hlength+",resizable=yes,toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,top=0,left=0");
}

function openUrlAuto(theUrl,wlength,hlength)
{
    window.open(theUrl, "","width="+wlength+",height="+hlength+",resizable=yes,toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,top=150,left=200");
}

function openUrlMax(theUrl)
{
    window.open(theUrl, "","","resizable=yes,toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,top=150,left=200");
}

function openBlank(theUrl)
{
	var wlength=200;
	var hlength=200;
    window.open(theUrl, "","width="+wlength+",height="+hlength+",resizable=yes,toolbar=yes,location=yes,status=yes,menubar=yes,scrollbars=yes,top=150,left=200");
}

//检查登录名称是否合法
//@param ele		fm.vcLogname
//@param msg		出错字段名称
//return boolean
function CheckLoginName(ele,msg){
	if (ele.value == '')
	{
		alert("对不起，"+msg+"不能为空");
		ele.focus();
		return false;
	}
	else {
		for(i=0;i<ele.value.length;i++)
		{
			if(ele.value.charCodeAt(i)<48 || ele.value.charCodeAt(i)>122)
			{
				alert("你的"+msg+"输入格式不正确，\n必须为英文字母或数字，请重新输入！");
				ele.focus();
				return false;
			}
		}
	}
return true;
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//str必须全为数字 
function isNumber(str){
	for(var i=0;i<str.length;i++) {
		var ch=str.charCodeAt(i);
		if(ch<48 || ch>57) {
			return false;
		}
	}
	return true;
}

//检查报名卡号、卡号密码是否合法
//@param str		检查的字符串
//@param msg		出错字段名称
//return -1			长度不符
//		 -2			字符范围不同
//		 1			正确			
function CheckCardNo(str) {
	if(str.length<6) {
		return -1;
	}
	var ch='';
	for(var i=0;i<str.length;i++) {
		ch=str.charAt(i);
		if(ch<'0' || (ch>'9' && ch<'A') || (ch>'Z' && ch<'a') || ch>'z') {
			return -2;
		}
	}
	return 1;
}

//检查长度
function CheckLength(ele,Min,Max,msg) {
	var len=ele.value.length;
//	if(!CheckNumber(ele.value)) return true;
	if(len<Min || len>Max) {
		alert("你的"+msg+"长度不正确，\n必须在"+Min+"位到"+Max+"位之间");
		ele.focus();
		return false;
	}
	return true;
}

//检查密码与重复密码是否相同
function CheckEqualPass(val1,val2,msg) {
	if(val1 != val2) {
		alert(msg);
		return false;
	}
	else {
		return true;
	}
}

//必须为中文字符串
function CheckValidName(ele,msg) {
	if(ele.value.length<2) {
		alert(msg+"位数不够，请重新填写！");
		ele.focus();
		return false;
	}
	for(var i=0;i<ele.value.length;i++) {
		ch=ele.value.charCodeAt(i);
		if(ch<128) {
			alert("你的"+msg+"输入格式不正确，\n必须为中文，请重新输入！");
			ele.focus();
			return false;
		}
	}
	return true;
}

//去除首尾空隔 
function trimstr(str) {
	var a=0, b=str.length-1;
	while(a<b) {
	if(str.substr(a,1)!=' ' && str.substr(b,1)!=' ')break;
	if(str.substr(a,1)==' ')a++;
	if(str.substr(b,1)==' ')b--;
	}
return str.substr(a, b-a+1);
}
 
 

//检查身份证是否正确
function CheckIdentify(type,id,msg) {
	if(type.value != '0') {
		return true;
	}
	var str;
	if(id.value.length==15) {
		str = id.value.substring(0,8);
		if(!CheckNumber(str)) {
			alert(msg+"开头8位输入有误，请重新输入！");
			id.focus();
			return false;
		}
		
		str=id.value.substring(8,10);
		myNum=new Number(str);
		var num=myNum.valueOf();
		if(num<1 || num>12) {
			alert(msg+"9到10位位输入有误，请重新输入！");
			id.focus();
			return false;
		}
		
		str=id.value.substring(10,12);
		myNum=new Number(str);
		var num=myNum.valueOf();
		if(num<1 || num>31) {
			alert(msg+"11到12位位输入有误，请重新输入！");
			id.focus();
			return false;
		}
		
		str = id.value.substring(12,15);
		if(!CheckNumber(str)) {
			alert(msg+"13到15位位输入有误，请重新输入！");
			id.focus();
			return false;
		}
		return true;
	}
	if(id.value.length==18) {
		str = id.value.substring(0,6);
		if(!CheckNumber(str)) {
			alert(msg+"开头6位输入有误，请重新输入！");
			id.focus();
			return false;
		}
		
		str = id.value.substring(6,10);
		myNum=new Number(str);
		var num=myNum.valueOf();
		if(num<1900 || num>1995) {
			alert(msg+"7到10位位输入有误，请重新输入！");
			id.focus();
			return false;
		}

		str=id.value.substring(10,12);
		myNum=new Number(str);
		var num=myNum.valueOf();
		if(num<1 || num>12) {
			alert(msg+"11到12位位输入有误，请重新输入！");
			id.focus();
			return false;
		}
		
		str=id.value.substring(12,14);
		myNum=new Number(str);
		var num=myNum.valueOf();
		if(num<1 || num>31) {
			alert(msg+"13到14位位输入有误，请重新输入！");
			id.focus();
			return false;
		}
		return true;
	}
	else {
		alert(msg+"长度不正确，请你重新输入");
		id.focus();
		return false;
	}
  }
	/** 检查扩展名是否合法 */
	function checkExt(filename,ext,msg){
		var pos = filename.lastIndexOf(".")+1;
		var extf = filename.substring(pos);
		extf = extf.toLowerCase();
		for( var i=0;i<ext.length;i++) {
			ext[i]=ext[i].toLowerCase();
			if(ext[i]==extf) return true;
		}
		if(msg!="")
			alert(msg);
		return false;
	}


function the_date() 
{ 
	tmpDate = new Date(); 
	date = tmpDate.getDate(); 
	month= tmpDate.getMonth() + 1 ; 
	year= tmpDate.getYear(); 
	document.write(year); 
	document.write("年"); 
	document.write(month); 
	document.write("月"); 
	document.write(date); 
	document.write("日"); 
} 

function the_week() 
{ 
	myArray=new Array(6); 
	myArray[0]="星期日" 
	myArray[1]="星期一" 
	myArray[2]="星期二" 
	myArray[3]="星期三" 
	myArray[4]="星期四" 
	myArray[5]="星期五" 
	myArray[6]="星期六" 
	weekday=tmpDate.getDay(); 
	if (weekday==0 | weekday==6) 
	{ 
		document.write( myArray[weekday] ) 
	} 
	else 
	{
		document.write( myArray[weekday]) 
	}; 
} 

//替换所有符合要求的字符串
function str_replace(seach_str,replace_str,concent_str){
	while(concent_str.indexOf(seach_str)!=-1){
		concent_str=concent_str.replace(seach_str,replace_str);
	}
	return concent_str;
}

