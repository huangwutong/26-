<%@ page contentType="text/html;charset=GB2312" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
String studentID=null;
String sql=null;
try{
    studentID=(String)session.getAttribute("studentID");
    if(studentID==null){
        throw new Exception();
    }
}catch(Exception e){
    jinghua.Tools.showalert("����û�е�¼�������ӳ�ʱ�������µ�¼!",out);
   jinghua.Tools.showJS("window.open('../login.jsp','_self')",out);
}

  

try{
	webmaster.datamanager.Webdata webdb = new webmaster.datamanager.Webdata();
    sql="select * from UserInfo where vcUserNo='"+studentID+"'";
    java.sql.ResultSet rs = webdb.query(sql);
    
    if(!rs.next())
    	return;
    String id=webdb.getRsStr(rs,"id"); 
	String vcUserNo=webdb.getRsStr(rs,"vcUserNo"); 
	String vcName=webdb.getRsStr(rs,"vcName"); 
	String enSex=webdb.getRsStr(rs,"enSex"); 
	String daBrith=webdb.getRsStr(rs,"daBrith"); 
	String vcEmail=webdb.getRsStr(rs,"vcEmail"); 
	String vcNick=webdb.getRsStr(rs,"vcNick"); 
	String vcPass=webdb.getRsStr(rs,"vcPass"); 
	String vcQuestion=webdb.getRsStr(rs,"vcQuestion"); 
	String vcAnswer=webdb.getRsStr(rs,"vcAnswer"); 
	String vcTel=webdb.getRsStr(rs,"vcTel"); 
	String vcHomeAdd=webdb.getRsStr(rs,"vcHomeAdd"); 
	String vcZipCode=webdb.getRsStr(rs,"vcZipCode"); 
	String vcSchool=webdb.getRsStr(rs,"vcSchool"); 
	String vcParentName=webdb.getRsStr(rs,"vcParentName"); 
	String vcParentEmail=webdb.getRsStr(rs,"vcParentEmail"); 
	String vcParentTel=webdb.getRsStr(rs,"vcParentTel"); 
	String vcProvince=webdb.getRsStr(rs,"vcProvince"); 
	String vcTarget=webdb.getRsStr(rs,"vcTarget"); 
	String vcAdage=webdb.getRsStr(rs,"vcAdage"); 
	String vcOldGrade=webdb.getRsStr(rs,"vcOldGrade"); 
	String vcOldClass=webdb.getRsStr(rs,"vcOldClass"); 
	String gradenote=webdb.getRsStr(rs,"gradenote"); 
	String vcIDCard=webdb.getRsStr(rs,"vcIDCard"); 
	String vcPolitical=webdb.getRsStr(rs,"vcPolitical"); 
	String vcEducation=webdb.getRsStr(rs,"vcEducation"); 
	String vcWorkTitle=webdb.getRsStr(rs,"vcWorkTitle"); 
	String vcMarriage=webdb.getRsStr(rs,"vcMarriage"); 
	String daWorkDate=webdb.getRsStr(rs,"daWorkDate"); 
	String vcMemo=webdb.getRsStr(rs,"vcMemo"); 
	String vcWorkUnit=webdb.getRsStr(rs,"vcWorkUnit"); 
	String ModifyDate=webdb.getRsStr(rs,"ModifyDate"); 
   

%>


<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=gb2312">


<link rel="stylesheet" type="text/css" media="all" href="../common/js/calendar/calendar-win2k-cold-1.css" title="win2k-cold-1" />
<script type="text/javascript" src="../common/js/calendar/calendar.js"></script>
<script type="text/javascript" src="../common/js/calendar/calendar-me.js"></script>
<script type="text/javascript" src="../common/js/calendar/calendar-setup.js"></script>

<link href="../common/css/SchoolManage.css" rel="stylesheet" type="text/css" />
<link href="../common/css/style.css" rel="stylesheet" type="text/css"/>
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
<form action="../servlet/UserMod" method="post" name="formemp" target="_self" id="formemp" onSubmit="return checkdata(this)">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr> 
      <td align="center" class="titlefont1">Ӧ��������</td>
    </tr>
    <tr>
      <td class="xxline"><img src="../images/dot.gif" width="1" height="1"></td>
  </tr>
  </table><br>
  <table width="60%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
    <tr> 
      <th width="29%" class="thlist">��Ŀ</th>
      <th width="71%" class="thlist"><input name="t" type="hidden" value="userinfo">
	  <input name="a" type="hidden" value="mod">
	  
      ��д</th>
    </tr>
    <tr> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>�û����룺</td>
      <td class="tdulleft"><input name="vcUserNo" type="text" class="inputtext" id="em_pcode" value="<%=vcUserNo%>" maxlength="15" readonly="true">      </td>
    </tr>
	<tr class="trcolor"> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>�û����룺</td>
      <td class="tdulleft"><input name="vcPass" type="password" class="inputtext" id="vcPass" value="<%=vcPass%>" maxlength="12"></td>
	</tr>
    <tr> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>ȷ�����룺</td>
      <td class="tdulleft"><input name="vcPass2" type="password" class="inputtext" id="vcPass2" value="<%=vcPass%>" maxlength="12"></td>
    </tr>
    <tr class="trcolor"> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>������</td>
      <td class="tdulleft"><input name="vcName" type="text" class="inputtext" id="txt_empname" value="<%=vcName%>" maxlength="12"></td>
    </tr>
	<tr class="trwhite">
      <td class="tdulright"><FONT color=#d11b00>*</FONT>Ӧ�Լ�������ȼ���</td>
      <td class="tdulleft"><select id=select10 name=gradenote onclick="changegs(document.myform.Grade.options[document.myform.Grade.selectedIndex].value)" size="1">
        <option value="temp">δѡ��</option>
        <%jinghua.Tools.showGradeOption(gradenote,out);%>
      </select></td>
    </tr>
	
    <tr> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>�Ա�</td>
      <td class="tdulleft"><input name="enSex" type="radio" value="M" <%=enSex.equals("M")?"checked":""%>>
      ��<input type="radio" name="enSex" value="F" <%=enSex.equals("F")?"checked":""%> >Ů</td>
    </tr>
    <tr class="trcolor"> 
      <td class="tdulright">���֤�ţ�</td>
      <td class="tdulleft"><input name="vcIDCard" type="text" class="inputtext" id="emp_id_code" value="<%=vcIDCard%>" size="18"></td>
    </tr>
    <tr > 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>�������ڣ�</td>
      <td class="tdulleft"><table width="281" border="0">
        <tr>
          <td width="192"><input name=daBrith class=input_date id=sel1 value="<%=daBrith%>" size=10 maxlength=10><input name="��ť" type=button class=unnamed1 onClick="return showCalendar('sel1','%Y-%m-%d');" value=...></td>
          <td width="79">            </td>
        </tr>
      </table></td>
    </tr>
    <tr class="trcolor"> 
      <td class="tdulright">������ò��</td>
      <td class="tdulleft"><input name="vcPolitical" type="text" class="inputtext" id="vcPolitical" value="<%=vcPolitical%>"></td>
    </tr>
    <tr >
      <td class="tdulright">���᣺</td>
      <td class="tdulleft"><SELECT name=vcProvince size=1 
      class=tdulleft id="vcProvince">
        <OPTION value="" >��ѡ�񡡡�</OPTION>
        <OPTION value="����" <%=vcProvince.equals("����") ? "selected":""%>>����</OPTION>
        <OPTION value="����" <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="�㶫"  <%=vcProvince.equals("�㶫")? "selected":""%>>�㶫</OPTION>
        <OPTION value="�㽭"  <%=vcProvince.equals("�㽭")? "selected":""%>>�㽭</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="ɽ��"  <%=vcProvince.equals("ɽ��")? "selected":""%>>ɽ��</OPTION>
        <OPTION value="�Ĵ�" <%=vcProvince.equals("�Ĵ�")? "selected":""%>>�Ĵ�</OPTION>
        <OPTION value="������"  <%=vcProvince.equals("������")? "selected":""%>>������</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="�Ϻ�"  <%=vcProvince.equals("�Ϻ�")? "selected":""%>>�Ϻ�</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="�ӱ�"  <%=vcProvince.equals("�ӱ�")? "selected":""%>>�ӱ�</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="���"  <%=vcProvince.equals("���")? "selected":""%>>���</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="ɽ��"  <%=vcProvince.equals("ɽ��")? "selected":""%>>ɽ��</OPTION>
        <OPTION value="���ɹ�"  <%=vcProvince.equals("���ɹ�")? "selected":""%>>���ɹ�</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="�½�"  <%=vcProvince.equals("�½�")? "selected":""%>>�½�</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="�ຣ"  <%=vcProvince.equals("�ຣ")? "selected":""%>>�ຣ</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="�۰�̨"  <%=vcProvince.equals("�۰�̨")? "selected":""%>>�۰�̨</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
        <OPTION value="����"  <%=vcProvince.equals("����")? "selected":""%>>����</OPTION>
      </SELECT></td>
    </tr>
    <tr class="trcolor">
      <td class="tdulright"  >������λ��</td>
      <td class="tdulleft"><input name="vcWorkUnit" type="text" class="inputtext" id="vcWorkUnit" value="<%=vcWorkUnit%>"></td>
    </tr>
    <tr > 
      <td class="tdulright">ѧ����</td>
      <td class="tdulleft"><select name="vcEducation" id="vcEducation">
        <option value="0" >��ѡ��...</option>
        <option value="4" <%=vcEducation.equals("4")? "selected":""%>>��ר</option>
        <option value="5" <%=vcEducation.equals("5")? "selected":""%>>����</option>
        <option value="6" <%=vcEducation.equals("6")? "selected":""%>>˶ʿ</option>
        <option value="7" <%=vcEducation.equals("7")? "selected":""%>>��ʿ</option>
      </select></td>
    </tr>
    <tr class="trcolor"> 
      <td class="tdulright">ְ�ƣ�</td>
      <td class="tdulleft"><select name="vcWorkTitle" id="vcWorkTitle">
        <option value="0" >��ѡ��...</option>
        <option value="1" <%=vcWorkTitle.equals("1")? "selected":""%>>����</option>
        <option value="2" <%=vcWorkTitle.equals("2")? "selected":""%>>�м�</option>
        <option value="3" <%=vcWorkTitle.equals("3")? "selected":""%>>�߼�</option>
      </select></td>
    </tr>
    <tr > 
      <td class="tdulright">����״����</td>
      <td class="tdulleft"><select name="vcMarriage" id="sel_marriage">
        <option value="0" >��ѡ��...</option>
        <option value="1" <%=vcMarriage.equals("1")? "selected":""%>>δ��</option>
        <option value="2" <%=vcMarriage.equals("2")? "selected":""%>>�ѻ�</option>
        <option value="3" <%=vcMarriage.equals("3")? "selected":""%>>����</option>
      </select></td>
    </tr>
    <tr  class="trcolor"> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>���䣺</td>
      <td class="tdulleft"><input name="vcEmail" type="text" class="inputtext" id="vcEmail" value="<%=vcEmail%>"></td>
    </tr>
    <tr  > 
      <td class="tdulright">�μӹ������ڣ�</td>
      <td class="tdulleft">        <table width="222" border="0">
          <tr>
            <td><input name=daWorkDate class=input_date id=sel2 value="<%=daWorkDate%>" size=10 maxlength=10><input name="��ť" type=button class=unnamed1 onClick="return showCalendar('sel2','%Y-%m-%d');" value=...></td>
            <td>&nbsp;</td>
          </tr>
        </table> </td>
    </tr>
    <tr class="trcolor"> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>��ϵ�绰���룺</td>
      <td class="tdulleft"><input name="vcTel" type="text" class="inputtext" id="vcTel" value="<%=vcTel%>" maxlength="20"></td>
    </tr>
    <tr  > 
      <td class="tdulright">��ͥͨѶ��ַ��</td>
      <td class="tdulleft"><input name="vcHomeAdd" type="text" class="inputtext" id="vcHomeAdd" value="<%=vcHomeAdd%>"></td>
    </tr>
    <tr class="trcolor"> 
      <td class="tdulright">�ʱࣺ</td>
      <td class="tdulleft"><input name="vcZipCode" type="text" class="inputtext" id="vcZipCode" value="<%=vcZipCode%>"></td>
    </tr>
    <tr  > 
      <td class="tdulright">      ��ע��</td>
      <td class="tdulleft"><textarea name="vcMemo" class="textarea" id="vcMemo"><%=vcMemo%></textarea></td>
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
<%

 }
   
    catch(Exception e){
        out.print("<br> query student error sql="+sql);
        out.print("<br>"+e.toString());
        return;
    }
 %>
