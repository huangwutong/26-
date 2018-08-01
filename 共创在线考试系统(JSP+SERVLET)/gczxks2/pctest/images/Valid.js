//���CheckBoxѡ�еĸ���
function GetCheckBoxCount(name,fm1) {
	var nRet = 0;
	for(var i=0;i<fm1.elements.length;i++) {
		if(fm1.elements[i].name.indexOf(name)!=-1 && fm1.elements[i].checked==true) nRet++;
	}
	return nRet;
}
//�õ�CheckBox�ĸ���
function GetCheckBoxTotal(name,fm1) {
	var nRet = 0;
	for(var i=0;i<fm1.elements.length;i++) 
		if(fm1.elements[i].name.indexOf(name)!=-1) nRet++;
	return nRet;
}
//�ж��Ƿ�ȫѡ
function CheckAllChecked(name,fm1) {
	if(GetCheckBoxTotal(name,fm1) == GetCheckBoxCount(name,fm1)) return true;
	return false;
}

//�ı�CheckBox��״̬,��Ҫ����ע��ʱ���꼶ѡ��,ѡ��ĳһ���꼶����ʱ,�����꼶��ϢӦ�����
function UpdateCheck(name,fm1,flag) {
	var subname = name.substring(0,name.lastIndexOf("_"));
	for(var i=0;i<fm1.elements.length;i++) {
		if(fm1.elements[i].name.indexOf(name)!=-1) fm1.elements[i].checked = flag;
		else if(fm1.elements[i].name.indexOf(subname)!=-1) fm1.elements[i].checked = false;
	}
}

//�������е�CheckBox״̬,��Ҫ����ע��ʱѡ��ĳ�꼶�Ŀ�Ŀ��ѡ�����꼶��Ŀ���,��ʱ��ԭ���꼶�������
function ClearOtherCheck(name,fm1) {
	var subname = name.substring(0,name.lastIndexOf("_"));
	for(var i=0;i<fm1.elements.length;i++) {
		if(fm1.elements[i].name.indexOf(name)!=-1) continue;
		else if(fm1.elements[i].name.indexOf(subname)!=-1) fm1.elements[i].checked = false;
	}
}

//��ֵ֤�Ƿ�Ϊ��,���Ϊ��,����False,ͬʱ����������ʾ
function CheckEmpty(ele,msg) {
	if(ele.value == '') {
		alert(msg);
		ele.focus();
		return false;
	}
	return true;
}
//�����У������ʽ�Ƿ�ѡ�����û�������������ʾ��Ȼ�󽫽��������ѡ��ʽ�����б���
function CheckSearchMethod(fm) {
	if(fm.Search_Method.options[fm.Search_Method.selectedIndex].value=="") {
		alert('�Բ�����ѡ����ȷ��������ʽ��');
		fm.Search_Method.focus();
		return false;
	}
	return true;
}

//��ʾ�û��Ƿ��˳������ȷ������رմ��ڣ����򲻲���
function ExitWithHints(msg) {
	var ret=confirm(msg);
	if(ret == true) {
		window.close();
	}
}

//�����Ի�����Ϣ
function ConfirmHints(msg) {
	return confirm(msg);
}

//�ж��Ƿ�Ϊ�գ����Ϊ�գ��򵯳������
function ifEmpty(ele,msg) {
	if(ele.value == '') {
		alert(msg);
		ele.focus();
		return false;
	}
return true;
}

//�ж���������������Ƿ�һ��,�����һ�£��򵯳������
function PassEqual(pass1,pass2,msg){
	if(pass1.value == pass2.value) return true;
	else
	{
		alert(msg);
		pass1.focus();
		return false;
	}
}


//���绰����,�����Ƿ���ȷ���Ƿ�����Ƿ��ַ�
function CheckNumber(tel) {
	var str=tel.value;
	if (str.length<7 || str.length>13)
	{
		alert("��������ȷ�ĵ绰���룬�Ա����Ǻ�����ϵ");
			tel.focus();
			return false;
	}
	for(var i=0;i<str.length;i++) {
		var ch=str.charCodeAt(i);
		if(ch<48 || ch>57) {
			alert("��������ȷ�ĵ绰���룬�Ա����Ǻ�����ϵ");
			tel.focus();
			return false;
		}
	}
	return true;
}

//���Email��ַ�Ƿ�Ϸ�
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

//������������Ƿ�Ϸ�
function CheckZipCode(ele){
	if(ele.value.length != 6)
	{
		alert("�Բ�����������ʱ೤�Ȳ���ȷ");
		ele.focus();
		return false;
	}
	if(isNumber(ele.value) == false)
	{
		alert("�Բ�����������ʱ�ֻ��������");
		ele.focus();
		return false;
	}
return true;
}

function pop_use(theUrl,w,h)
{
	win = window.open(theUrl,'','width='+420+',height='+280+',scrollbars=yes,menubar=no,resizable=no');
}
//���´���
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

//����¼�����Ƿ�Ϸ�
//@param ele		fm.vcLogname
//@param msg		�����ֶ�����
//return boolean
function CheckLoginName(ele,msg){
	if (ele.value == '')
	{
		alert("�Բ���"+msg+"����Ϊ��");
		ele.focus();
		return false;
	}
	else {
		for(i=0;i<ele.value.length;i++)
		{
			if(ele.value.charCodeAt(i)<48 || ele.value.charCodeAt(i)>122)
			{
				alert("���"+msg+"�����ʽ����ȷ��\n����ΪӢ����ĸ�����֣����������룡");
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
//str����ȫΪ���� 
function isNumber(str){
	for(var i=0;i<str.length;i++) {
		var ch=str.charCodeAt(i);
		if(ch<48 || ch>57) {
			return false;
		}
	}
	return true;
}

//��鱨�����š����������Ƿ�Ϸ�
//@param str		�����ַ���
//@param msg		�����ֶ�����
//return -1			���Ȳ���
//		 -2			�ַ���Χ��ͬ
//		 1			��ȷ			
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

//��鳤��
function CheckLength(ele,Min,Max,msg) {
	var len=ele.value.length;
//	if(!CheckNumber(ele.value)) return true;
	if(len<Min || len>Max) {
		alert("���"+msg+"���Ȳ���ȷ��\n������"+Min+"λ��"+Max+"λ֮��");
		ele.focus();
		return false;
	}
	return true;
}

//����������ظ������Ƿ���ͬ
function CheckEqualPass(val1,val2,msg) {
	if(val1 != val2) {
		alert(msg);
		return false;
	}
	else {
		return true;
	}
}

//����Ϊ�����ַ���
function CheckValidName(ele,msg) {
	if(ele.value.length<2) {
		alert(msg+"λ����������������д��");
		ele.focus();
		return false;
	}
	for(var i=0;i<ele.value.length;i++) {
		ch=ele.value.charCodeAt(i);
		if(ch<128) {
			alert("���"+msg+"�����ʽ����ȷ��\n����Ϊ���ģ����������룡");
			ele.focus();
			return false;
		}
	}
	return true;
}

//ȥ����β�ո� 
function trimstr(str) {
	var a=0, b=str.length-1;
	while(a<b) {
	if(str.substr(a,1)!=' ' && str.substr(b,1)!=' ')break;
	if(str.substr(a,1)==' ')a++;
	if(str.substr(b,1)==' ')b--;
	}
return str.substr(a, b-a+1);
}
 
 

//������֤�Ƿ���ȷ
function CheckIdentify(type,id,msg) {
	if(type.value != '0') {
		return true;
	}
	var str;
	if(id.value.length==15) {
		str = id.value.substring(0,8);
		if(!CheckNumber(str)) {
			alert(msg+"��ͷ8λ�����������������룡");
			id.focus();
			return false;
		}
		
		str=id.value.substring(8,10);
		myNum=new Number(str);
		var num=myNum.valueOf();
		if(num<1 || num>12) {
			alert(msg+"9��10λλ�����������������룡");
			id.focus();
			return false;
		}
		
		str=id.value.substring(10,12);
		myNum=new Number(str);
		var num=myNum.valueOf();
		if(num<1 || num>31) {
			alert(msg+"11��12λλ�����������������룡");
			id.focus();
			return false;
		}
		
		str = id.value.substring(12,15);
		if(!CheckNumber(str)) {
			alert(msg+"13��15λλ�����������������룡");
			id.focus();
			return false;
		}
		return true;
	}
	if(id.value.length==18) {
		str = id.value.substring(0,6);
		if(!CheckNumber(str)) {
			alert(msg+"��ͷ6λ�����������������룡");
			id.focus();
			return false;
		}
		
		str = id.value.substring(6,10);
		myNum=new Number(str);
		var num=myNum.valueOf();
		if(num<1900 || num>1995) {
			alert(msg+"7��10λλ�����������������룡");
			id.focus();
			return false;
		}

		str=id.value.substring(10,12);
		myNum=new Number(str);
		var num=myNum.valueOf();
		if(num<1 || num>12) {
			alert(msg+"11��12λλ�����������������룡");
			id.focus();
			return false;
		}
		
		str=id.value.substring(12,14);
		myNum=new Number(str);
		var num=myNum.valueOf();
		if(num<1 || num>31) {
			alert(msg+"13��14λλ�����������������룡");
			id.focus();
			return false;
		}
		return true;
	}
	else {
		alert(msg+"���Ȳ���ȷ��������������");
		id.focus();
		return false;
	}
  }
	/** �����չ���Ƿ�Ϸ� */
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
	document.write("��"); 
	document.write(month); 
	document.write("��"); 
	document.write(date); 
	document.write("��"); 
} 

function the_week() 
{ 
	myArray=new Array(6); 
	myArray[0]="������" 
	myArray[1]="����һ" 
	myArray[2]="���ڶ�" 
	myArray[3]="������" 
	myArray[4]="������" 
	myArray[5]="������" 
	myArray[6]="������" 
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

//�滻���з���Ҫ����ַ���
function str_replace(seach_str,replace_str,concent_str){
	while(concent_str.indexOf(seach_str)!=-1){
		concent_str=concent_str.replace(seach_str,replace_str);
	}
	return concent_str;
}

