<%@ page contentType="text/html;charset=GB2312" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

request.setCharacterEncoding("GB2312");

webmaster.datamanager.Webdata webdb = new webmaster.datamanager.Webdata();
String iID=webdb.getRequestAValue(request,"iID");

if( iID.equals(""))
{
	session.setAttribute("ErrorMsg","页面参数错误！");
	response.sendRedirect("/pctest/error.jsp");
	
	return;
}

String id=null;
String vcUserNo=null;
String vcName=null; 
String enSex=null; 
String daBrith=null; 
String vcEmail=null; 
String vcNick=null; 
String vcPass=null; 
String vcQuestion=null; 
String vcAnswer=null; 
String vcTel=null; 
String vcHomeAdd=null; 
String vcZipCode=null; 
String vcSchool=null; 
String vcParentName=null; 
String vcParentEmail=null; 
String vcParentTel=null; 
String vcProvince=null; 
String vcTarget=null; 
String vcAdage=null; 
String vcOldGrade=null; 
String vcOldClass=null; 
 
String gradenote=null; 
String vcIDCard=null; 
String vcPolitical=null; 
String vcEducation=null; 
String vcWorkTitle=null; 
String vcMarriage=null; 
String daWorkDate=null; 
String vcMemo=null; 
String vcWorkUnit=null;
String syspower=null;
String ModifyDate=null;
  
java.sql.ResultSet rs = webdb.query("select * from sysadmin where id = '"+iID+"'");
if(rs.next()){

 id=webdb.getRsStr(rs,"id"); 
 vcUserNo=webdb.getRsStr(rs,"vcUserNo"); 
 vcName=webdb.getRsStr(rs,"vcName"); 
 enSex=webdb.getRsStr(rs,"enSex"); 
 daBrith=webdb.getRsStr(rs,"daBrith"); 
 vcEmail=webdb.getRsStr(rs,"vcEmail"); 
 vcNick=webdb.getRsStr(rs,"vcNick"); 
 vcPass=webdb.getRsStr(rs,"vcPass"); 
 vcQuestion=webdb.getRsStr(rs,"vcQuestion"); 
 vcAnswer=webdb.getRsStr(rs,"vcAnswer"); 
 vcTel=webdb.getRsStr(rs,"vcTel"); 
 vcHomeAdd=webdb.getRsStr(rs,"vcHomeAdd"); 
 vcZipCode=webdb.getRsStr(rs,"vcZipCode"); 
 vcSchool=webdb.getRsStr(rs,"vcSchool"); 
 vcParentName=webdb.getRsStr(rs,"vcParentName"); 
 vcParentEmail=webdb.getRsStr(rs,"vcParentEmail"); 
 vcParentTel=webdb.getRsStr(rs,"vcParentTel"); 
 vcProvince=webdb.getRsStr(rs,"vcProvince"); 
 vcTarget=webdb.getRsStr(rs,"vcTarget"); 
 vcAdage=webdb.getRsStr(rs,"vcAdage"); 
 vcOldGrade=webdb.getRsStr(rs,"vcOldGrade"); 
 vcOldClass=webdb.getRsStr(rs,"vcOldClass"); 

 gradenote=webdb.getRsStr(rs,"gradenote"); 
 vcIDCard=webdb.getRsStr(rs,"vcIDCard"); 
 vcPolitical=webdb.getRsStr(rs,"vcPolitical"); 
 vcEducation=webdb.getRsStr(rs,"vcEducation"); 
 vcWorkTitle=webdb.getRsStr(rs,"vcWorkTitle"); 
 vcMarriage=webdb.getRsStr(rs,"vcMarriage"); 
 daWorkDate=webdb.getRsStr(rs,"daWorkDate"); 
 vcMemo=webdb.getRsStr(rs,"vcMemo"); 
 vcWorkUnit=webdb.getRsStr(rs,"vcWorkUnit"); 
 syspower=webdb.getRsStr(rs,"syspower"); 
 ModifyDate=webdb.getRsStr(rs,"ModifyDate"); 
  
}


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

function del(t)
	{
		document.URL=t;
	}
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

</SCRIPT>



<title>计算机等级应用基础在线测试系统</title>

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
function　isEmail(strEmail)　{
if　(strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)　!=　-1)
　　return　true;
else
　　return false;
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
alert("\请输入用户代码 !!")
return false;
}

if (trim( form.vcPass.value)=="") {
alert("\请输入用户密码 !!")
return false;
}

if(form.vcPass.value!=form.vcPass2.value){
	alert("\用户密码不一致 !!")
	return false;

}

if (trim( form.vcName.value)=="") {
alert("\请输入用户的真实姓名 !!")
return false;
}

if(! (form.enSex[0].checked || form.enSex[1].checked)){
alert("\请选择性别 !!");
return false;
}




if(!isDate(form.daBrith.value)){
alert("\请选择出生日期!!");
return false;
}



if(!isEmail(form.vcEmail.value)){
alert("\请输入您的电子邮件 !!")
return false;
}

if( form.vcTel.value.length<7 || !isNumberString(form.vcTel.value,"1234567890-")) {
alert("\请输入联系电话(区号和分机号用减号隔开) !!")
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
alert("新建老师记录已经添加");
window.location.href="teacherinf.htm"
}
</script>
<body>
<form action="../servlet/AdminMod" method="post" name="formemp" target="_self" id="formemp" onSubmit="return checkdata(this)">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr> 
      <td align="center" class="titlefont1">管理员资料</td>
    </tr>
    <tr>
      <td class="xxline"><img src="../images/dot.gif" width="1" height="1"></td>
  </tr>
  </table><br>
  <table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
    <tr> 
      <th width="10%" class="thlist">项目</th>
      <th width="90%" class="thlist"><input name="t" type="hidden" value="sysadmin">
	  <input name="a" type="hidden" value="mod"><input name="syspower" type="hidden" value="1"><input name="id" type="hidden" value="<%=id%>">
      填写信息</th>
    </tr>
    <tr> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>管理员代码：</td>
      <td class="tdulleft"><%=(vcUserNo.equals("")?"&nbsp;":vcUserNo)%>   </td>
    </tr>
	<tr class="trcolor"> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>管理员密码：</td>
      <td class="tdulleft"><input name="vcPass" type="password" class="inputtext" id="vcPass" value="<%=vcPass%>" maxlength="12"></td>
	</tr>
    <tr> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>确认密码：</td>
      <td class="tdulleft"><input name="vcPass2" type="password" class="inputtext" id="vcPass2" value="<%=vcPass%>" maxlength="12"></td>
    </tr>
    <tr class="trcolor"> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>姓名：</td>
      <td class="tdulleft"><input name="vcName" type="text" class="inputtext" id="txt_empname" value="<%=vcName%>" maxlength="12"></td>
    </tr>
    <tr> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>性别：</td>
      <td class="tdulleft"><input name="enSex" type="radio" value="M" <%=enSex.equals("M")?"checked":""%> >
      男
        <input type="radio" name="enSex" value="F" <%=enSex.equals("F")?"checked":""%>>女</td>
    </tr>
    <tr class="trcolor"> 
      <td class="tdulright">身份证号：</td>
      <td class="tdulleft"><input name="vcIDCard" type="text" class="inputtext" id="emp_id_code" value="<%=vcIDCard%>" size="18"></td>
    </tr>
    <tr > 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>出生日期：</td>
      <td class="tdulleft"><table width="281" border="0">
        <tr>
          <td>
<input name=daBrith class=inputtext id=sel1 value="<%=daBrith%>" size=10 maxlength=10><input name="按钮" type=button class=unnamed1 onClick="return showCalendar('sel1','%Y-%m-%d');" value=...></td>
          <td width="79">            </td>
        </tr>
      </table></td>
    </tr>
    <tr class="trcolor"> 
      <td class="tdulright">政治面貌：</td>
      <td class="tdulleft"><input name="vcPolitical" type="text" class="inputtext" id="vcPolitical" value="<%=vcPolitical%>"></td>
    </tr>
    <tr >
      <td class="tdulright">籍贯：</td>
      <td class="tdulleft"> <%=(vcProvince.equals("")?"&nbsp;":vcProvince)%></td>
    </tr>
    <tr class="trcolor">
      <td class="tdulright"  >工作单位：</td>
      <td class="tdulleft"><input name="vcWorkUnit" type="text" class="inputtext" id="vcWorkUnit" value="<%=vcWorkUnit%>"></td>
    </tr>
    <tr > 
      <td class="tdulright">学历：</td>
      <td class="tdulleft"><select name="vcEducation" id="vcEducation">
        <option value="0"  <%=(vcEducation.equals("0")? "selected":"")%> >请选择...</option>
        <option value="4"  <%=(vcEducation.equals("4")? "selected":"")%> >大专</option>
        <option value="5"  <%=(vcEducation.equals("5")? "selected":"")%> >本科</option>
        <option value="6"  <%=(vcEducation.equals("6")? "selected":"")%> >硕士</option>
        <option value="7"  <%=(vcEducation.equals("7")? "selected":"")%> >博士</option>
      </select></td>
    </tr>
    <tr class="trcolor"> 
      <td class="tdulright">职称：</td>
      <td class="tdulleft"><select name="vcWorkTitle" id="vcWorkTitle">
	  <option value="0"  <%=(vcWorkTitle.equals("0")? "selected":"")%> >请选择...</option>
	  <option value="1" <%=(vcWorkTitle.equals("1")? "selected":"")%> >初级</option>
	  <option value="2" <%=(vcWorkTitle.equals("2")? "selected":"")%> >中级</option>
	  <option value="3" <%=(vcWorkTitle.equals("3")? "selected":"")%> >高级</option>
        </select></td>
    </tr>
    <tr > 
      <td class="tdulright">婚姻状况：</td>
      <td class="tdulleft"><select name="vcMarriage" id="sel_marriage">
        <option value="0"  <%=(vcMarriage.equals("0")? "selected":"")%> >请选择...</option>
        <option value="1" <%=(vcMarriage.equals("1")? "selected":"")%> >未婚</option>
        <option value="2" <%=(vcMarriage.equals("2")? "selected":"")%> >已婚</option>
        <option value="3" <%=(vcMarriage.equals("3")? "selected":"")%> >离异</option>
      </select></td>
    </tr>
    <tr  class="trcolor"> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>邮箱：</td>
      <td class="tdulleft"><input name="vcEmail" type="text" class="inputtext" id="vcEmail" value="<%=vcEmail%>"></td>
    </tr>
    <tr > 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00></FONT> </span>参加工作日期：</td>
      <td class="tdulleft"><table width="281" border="0">
        <tr>
          <td>
<input name=daWorkDate class=inputtext id=sel2 value="<%=daWorkDate%>" size=10 maxlength=10><input name="按钮" type=button class=unnamed1 onClick="return showCalendar('sel2','%Y-%m-%d');" value=...></td>
          <td width="79">            </td>
        </tr>
      </table></td>
    </tr>
    <tr class="trcolor"> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>联系电话号码：</td>
      <td class="tdulleft"><input name="vcTel" type="text" class="inputtext" id="vcTel" value="<%=vcTel%>" maxlength="20"></td>
    </tr>
    <tr  > 
      <td class="tdulright">家庭通讯地址：</td>
      <td class="tdulleft"><input name="vcHomeAdd" type="text" class="inputtext" id="vcHomeAdd" value="<%=vcHomeAdd%>"></td>
    </tr>
    <tr class="trcolor"> 
      <td class="tdulright">邮编：</td>
      <td class="tdulleft"><input name="vcZipCode" type="text" class="inputtext" id="vcZipCode" value="<%=vcZipCode%>"></td>
    </tr>
    <tr  > 
      <td class="tdulright">      备注：</td>
      <td class="tdulleft"><textarea name="vcMemo" class="textarea" id="vcMemo"><%=vcMemo%></textarea></td>
    </tr>
  </table>
  <table width="240" border="0" align="center" cellpadding="5" cellspacing="4">
    <tr>
    <td><input  type="submit" class="button_xh" value="确　　认" ></td>
    <td><input  type="reset" class="button_xh" value="重　　填"></td>
    <td><input  type=reset class="button_xh" onClick="del('../servlet/AdminDel?id=<%=id%>')" value="删　除"></td>
    </tr>
</table>

</form>
</body>
</html>
