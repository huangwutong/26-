<%@ page contentType="text/html;charset=GB2312" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=gb2312">


<link rel="stylesheet" type="text/css" media="all" href="common/js/calendar/calendar-win2k-cold-1.css" title="win2k-cold-1" />
<script type="text/javascript" src="common/js/calendar/calendar.js"></script>
<script type="text/javascript" src="common/js/calendar/calendar-me.js"></script>
<script type="text/javascript" src="common/js/calendar/calendar-setup.js"></script>

<link href="common/css/SchoolManage.css" rel="stylesheet" type="text/css" />
<link href="common/css/style.css" rel="stylesheet" type="text/css"/>
<!--style end-->

<SCRIPT language=JavaScript>
<!--

function selected(cal, date) {
  cal.sel.value = date;
  if (cal.dateClicked && (cal.sel.id == "sel1" ))
     cal.callCloseHandler();
}
function closeHandler(cal) {
  cal.hide();
  calendar = null;
}
function showCalendar(id, format, showsTime, showsOtherMonths) {
  var el = document.getElementById(id);
  if (calendar != null) {
    calendar.hide();                 // so we hide it first.
  } else {
    var cal = new Calendar(true, null, selected, closeHandler);
    if (typeof showsTime == "string") {
      cal.showsTime = true;
      cal.time24 = (showsTime == "24");
    }
    if (showsOtherMonths) {
      cal.showsOtherMonths = true;
    }
    calendar = cal;                  // remember it in the global var
    cal.setRange(1900, 2070);        // min/max year allowed.
    cal.create();
  }
  calendar.setDateFormat(format);    // set the specified date format
  calendar.parseDate(el.value);      // try to parse the text in field
  calendar.sel = el;                 // inform it what input field we use
  calendar.showAtElement(el.nextSibling, "Br");        // show the calendar
  return false;
}
-->
</SCRIPT>



<title>������ȼ�Ӧ�û������߲���ϵͳ</title>

<SCRIPT language=JavaScript>
<!--
function isNumber(str)
{
  var i,flag=false;
  for(i=0;i<str.length;i++)
  {
    if(str.substr(i,1)<"0"||str.substr(i,1)>"9")
    {
      if(str.substr(i,1)=="."&&!flag)
        flag=true;
      else if(str.substr(i,1)=="-"&&i==0)
        continue;
      else
        return false;
    }
  }
  return true;
}

function montharr(m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11)
{
   this[0] = m0;
   this[1] = m1;
   this[2] = m2;
   this[3] = m3;
   this[4] = m4;
   this[5] = m5;
   this[6] = m6;
   this[7] = m7;
   this[8] = m8;
   this[9] = m9;
   this[10] = m10;
   this[11] = m11;
}


function isDate(str)
{
  var a,s,i,a0,a1,a2;
  var month=new montharr(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
  a=str.split("-");
  if(a.length!=3){
  	a=str.split("/");
  	if(a.length!=3) return false;
  }	
  
  
  for(i=0;i<3;i++)
  {
    if(!isNumber(a[i])) return false;
  }
  a0=eval(a[0]);
  a1=eval(a[1]);
  a2=eval(a[2]);
  if (((a0 % 4 == 0) && (a0 % 100 != 0)) || (a0 % 400 == 0))
      month[1] = 29;
  if(a1<1||a1>12)
    return false;
  if(a2<1||a2>month[a1-1])
    return false;
  return true;
}
function��isEmail(strEmail)��{
if��(strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)��!=��-1)
����return��true;
else
����return false;
}
function trim(s) 
{
  // Remove leading spaces and carriage returns
  while ((s.substring(0,1) == ' ') || (s.substring(0,1) == '\n') || (s.substring(0,1) == '\r'))
  {
    s = s.substring(1,s.length);
  }
  // Remove trailing spaces and carriage returns
  while ((s.substring(s.length-1,s.length) == ' ') || (s.substring(s.length-1,s.length) == '\n') || (s.substring(s.length-1,s.length) == '\r'))
  {
    s = s.substring(0,s.length-1);
  }
  return s;
}

function checkdata(form) {

if (trim( form.vcUserNo.value)=="") {
alert("\�������û����� !!")
return false;
}

if (trim( form.vcPass.value)=="") {
alert("\�������û����� !!")
return false;
}

if(form.vcPass.value!=form.vcPass2.value){
	alert("\�û����벻һ�� !!")
	return false;

}

if (trim( form.vcName.value)=="") {
alert("\�������û�����ʵ���� !!")
return false;
}

if (form.gradenote.selectedIndex==0) {
alert("��ѡ�������ȼ���Ϣ!")
return false;
}


if(! (form.enSex[0].checked || form.enSex[1].checked)){
alert("\��ѡ���Ա� !!");
return false;
}




if(!isDate(form.daBrith.value)){
alert("\��ѡ���������!!");
return false;
}



if(!isEmail(form.vcEmail.value)){
alert("\���������ĵ����ʼ� !!")
return false;
}

if( form.vcTel.value.length<7 || !isNumberString(form.vcTel.value,"1234567890-")) {
alert("\��������ϵ�绰(���źͷֻ����ü��Ÿ���) !!")
return false;
}



return true;
}
function isNumberString (InString,RefString)
{
if(InString.length==0) return (false);
for (Count=0; Count < InString.length; Count++)  {
	TempChar= InString.substring (Count, Count+1);
	if (RefString.indexOf (TempChar, 0)==-1)  
	return (false);
}
return (true);
}
 -->
</SCRIPT>
<style type="text/css">
<!--
.p2 {	FONT-SIZE: 12px; LINE-HEIGHT: 150%
}
-->
</style>
</head>
<script language="JavaScript">
function notice(){
alert("�½���ʦ��¼�Ѿ����");
window.location.href="teacherinf.htm"
}
</script>
<body>
<form action="servlet/AddUser" method="post" name="formemp" target="_self" id="formemp" onSubmit="return checkdata(this)">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr> 
      <td align="center" class="titlefont1">���Ӧ��������</td>
    </tr>
    <tr>
      <td class="xxline"><img src="images/dot.gif" width="1" height="1"></td>
  </tr>
  </table><br>
  <table width="60%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
    <tr> 
      <th width="28%" class="thlist">��Ŀ</th>
      <th width="72%" class="thlist"><input name="t" type="hidden" value="userinfo">
	  <input name="a" type="hidden" value="add">
      ��д</th>
    </tr>
    <tr> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>�û����룺</td>
      <td class="tdulleft"><input name="vcUserNo" type="text" class="inputtext" id="em_pcode" maxlength="15">      </td>
    </tr>
	<tr class="trcolor"> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>�û����룺</td>
      <td class="tdulleft"><input name="vcPass" type="password" class="inputtext" id="vcPass" maxlength="12"></td>
	</tr>
    <tr> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>ȷ�����룺</td>
      <td class="tdulleft"><input name="vcPass2" type="password" class="inputtext" id="vcPass2" maxlength="12"></td>
    </tr>
    <tr class="trcolor"> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>������</td>
      <td class="tdulleft"><input name="vcName" type="text" class="inputtext" id="txt_empname" maxlength="12"></td>
    </tr>
    <tr class="trwhite">
      <td class="tdulright">Ӧ�Լ�������ȼ���</td>
      <td class="tdulleft"><select id=select10 name=gradenote onclick="changegs(document.myform.Grade.options[document.myform.Grade.selectedIndex].value)" size="1">
        <option value="temp">δѡ��</option>
        <%jinghua.Tools.showGradeOption(out);%>
      </select></td>
    </tr>
    
    <tr class="trcolor"> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>�Ա�</td>
      <td class="tdulleft"><input name="enSex" type="radio" value="M">
      ��<input type="radio" name="enSex" value="F">
      Ů</td>
    </tr>
    <tr> 
      <td class="tdulright">���֤�ţ�</td>
      <td class="tdulleft"><input name="vcIDCard" type="text" class="inputtext" id="emp_id_code" size="18"></td>
    </tr>
    <tr class="trcolor" > 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>�������ڣ�</td>
      <td class="tdulleft"><table width="281" border="0">
        <tr>
          <td width="192"><input class=input_date id=sel1 maxlength=10 size=10 name=daBrith><input name="��ť" type=button class=unnamed1 onClick="return showCalendar('sel1','%Y-%m-%d');" value=...></td>
          <td width="79">            </td>
        </tr>
      </table></td>
    </tr>
    <tr class="trwhite"> 
      <td class="tdulright">������ò��</td>
      <td class="tdulleft"><input name="vcPolitical" type="text" class="inputtext" id="vcPolitical"></td>
    </tr>
    <tr class="trcolor" >
      <td class="tdulright">���᣺</td>
      <td class="tdulleft"><SELECT name=vcProvince size=1 
      class=tdulleft id="vcProvince"> 
        <OPTION value="" selected>��ѡ�񡡡�</OPTION> 
        <OPTION value=����>����</OPTION> <OPTION value=����>����</OPTION> <OPTION 
        value=�㶫>�㶫</OPTION> <OPTION value=�㽭>�㽭</OPTION> <OPTION 
        value=����>����</OPTION> <OPTION value=ɽ��>ɽ��</OPTION> <OPTION 
        value=�Ĵ�>�Ĵ�</OPTION> <OPTION value=������>������</OPTION> <OPTION 
        value=����>����</OPTION> <OPTION value=����>����</OPTION> <OPTION 
        value=�Ϻ�>�Ϻ�</OPTION> <OPTION value=����>����</OPTION> <OPTION 
        value=����>����</OPTION> <OPTION value=����>����</OPTION> <OPTION 
        value=����>����</OPTION> <OPTION value=����>����</OPTION> <OPTION 
        value=�ӱ�>�ӱ�</OPTION> <OPTION value=����>����</OPTION> <OPTION 
        value=����>����</OPTION> <OPTION value=���>���</OPTION> <OPTION 
        value=����>����</OPTION> <OPTION value=ɽ��>ɽ��</OPTION> <OPTION 
        value=���ɹ�>���ɹ�</OPTION> <OPTION value=����>����</OPTION> <OPTION 
        value=����>����</OPTION> <OPTION value=�½�>�½�</OPTION> <OPTION 
        value=����>����</OPTION> <OPTION value=����>����</OPTION> <OPTION 
        value=����>����</OPTION> <OPTION value=�ຣ>�ຣ</OPTION> <OPTION 
        value=����>����</OPTION> <OPTION value=�۰�̨>�۰�̨</OPTION> <OPTION 
        value=����>����</OPTION> <OPTION value=����>����</OPTION></SELECT></td>
    </tr>
    <tr class="trwhite">
      <td class="tdulright"  >������λ��</td>
      <td class="tdulleft"><input name="vcWorkUnit" type="text" class="inputtext" id="vcWorkUnit"></td>
    </tr>
    <tr class="trcolor" > 
      <td class="tdulright">ѧ����</td>
      <td class="tdulleft"><select name="vcEducation" id="vcEducation">
        <option value="0" selected>��ѡ��...</option>
        <option value="4">��ר</option>
        <option value="5">����</option>
        <option value="6">˶ʿ</option>
        <option value="7">��ʿ</option>
      </select></td>
    </tr>
    <tr class="trwhite"> 
      <td class="tdulright">ְ�ƣ�</td>
      <td class="tdulleft"><select name="vcWorkTitle" id="vcWorkTitle">
	  <option value="0" selected>��ѡ��...</option>
	  <option value="1">����</option>
	  <option value="2">�м�</option>
	  <option value="3">�߼�</option>
        </select></td>
    </tr>
    <tr class="trcolor" > 
      <td class="tdulright">����״����</td>
      <td class="tdulleft"><select name="vcMarriage" id="sel_marriage">
        <option value="0" selected>��ѡ��...</option>
        <option value="1">δ��</option>
        <option value="2">�ѻ�</option>
        <option value="3">����</option>
      </select></td>
    </tr>
    <tr  class="trwhite"> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>���䣺</td>
      <td class="tdulleft"><input name="vcEmail" type="text" class="inputtext" id="vcEmail"></td>
    </tr>
    <tr class="trcolor"  > 
      <td class="tdulright">�μӹ������ڣ�</td>
      <td class="tdulleft">        <table width="222" border="0">
          <tr>
            <td><input name=daWorkDate class=input_date id=sel2 size=10 maxlength=10><input name="��ť" type=button class=unnamed1 onClick="return showCalendar('sel2','%Y-%m-%d');" value=...></td>
            <td>&nbsp;</td>
          </tr>
        </table> </td>
    </tr>
    <tr class="trwhite"> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>��ϵ�绰���룺</td>
      <td class="tdulleft"><input name="vcTel" type="text" class="inputtext" id="vcTel" maxlength="20"></td>
    </tr>
    <tr class="trcolor"  > 
      <td class="tdulright">��ͥͨѶ��ַ��</td>
      <td class="tdulleft"><input name="vcHomeAdd" type="text" class="inputtext" id="vcHomeAdd"></td>
    </tr>
    <tr class="trwhite"> 
      <td class="tdulright">�ʱࣺ</td>
      <td class="tdulleft"><input name="vcZipCode" type="text" class="inputtext" id="vcZipCode"></td>
    </tr>
    <tr class="trcolor"  > 
      <td class="tdulright">      ��ע��</td>
      <td class="tdulleft"><textarea name="vcMemo" class="textarea" id="vcMemo"></textarea></td>
    </tr>
  </table>
  <table width="240" border="0" align="center" cellpadding="5" cellspacing="4">
    <tr>
    <td><input  type="submit" class="button_xh" value="ȷ��" ></td>
    <td><input  type="reset" class="button_xh" value="����"></td>
  </tr>
</table>

</form>
</body>
</html>
