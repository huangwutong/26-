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
    jinghua.Tools.showalert("您还没有登录，或连接超时，请重新登录!",out);
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

if (form.gradenote.selectedIndex==0) {
alert("请选择计算机等级信息!")
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
<form action="../servlet/UserMod" method="post" name="formemp" target="_self" id="formemp" onSubmit="return checkdata(this)">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr> 
      <td align="center" class="titlefont1">应试者资料</td>
    </tr>
    <tr>
      <td class="xxline"><img src="../images/dot.gif" width="1" height="1"></td>
  </tr>
  </table><br>
  <table width="60%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
    <tr> 
      <th width="29%" class="thlist">项目</th>
      <th width="71%" class="thlist"><input name="t" type="hidden" value="userinfo">
	  <input name="a" type="hidden" value="mod">
	  
      填写</th>
    </tr>
    <tr> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>用户代码：</td>
      <td class="tdulleft"><input name="vcUserNo" type="text" class="inputtext" id="em_pcode" value="<%=vcUserNo%>" maxlength="15" readonly="true">      </td>
    </tr>
	<tr class="trcolor"> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>用户密码：</td>
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
	<tr class="trwhite">
      <td class="tdulright"><FONT color=#d11b00>*</FONT>应试计算机考等级：</td>
      <td class="tdulleft"><select id=select10 name=gradenote onclick="changegs(document.myform.Grade.options[document.myform.Grade.selectedIndex].value)" size="1">
        <option value="temp">未选择</option>
        <%jinghua.Tools.showGradeOption(gradenote,out);%>
      </select></td>
    </tr>
	
    <tr> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>性别：</td>
      <td class="tdulleft"><input name="enSex" type="radio" value="M" <%=enSex.equals("M")?"checked":""%>>
      男<input type="radio" name="enSex" value="F" <%=enSex.equals("F")?"checked":""%> >女</td>
    </tr>
    <tr class="trcolor"> 
      <td class="tdulright">身份证号：</td>
      <td class="tdulleft"><input name="vcIDCard" type="text" class="inputtext" id="emp_id_code" value="<%=vcIDCard%>" size="18"></td>
    </tr>
    <tr > 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>出生日期：</td>
      <td class="tdulleft"><table width="281" border="0">
        <tr>
          <td width="192"><input name=daBrith class=input_date id=sel1 value="<%=daBrith%>" size=10 maxlength=10><input name="按钮" type=button class=unnamed1 onClick="return showCalendar('sel1','%Y-%m-%d');" value=...></td>
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
      <td class="tdulleft"><SELECT name=vcProvince size=1 
      class=tdulleft id="vcProvince">
        <OPTION value="" >请选择　　</OPTION>
        <OPTION value="北京" <%=vcProvince.equals("北京") ? "selected":""%>>北京</OPTION>
        <OPTION value="辽宁" <%=vcProvince.equals("辽宁")? "selected":""%>>辽宁</OPTION>
        <OPTION value="广东"  <%=vcProvince.equals("广东")? "selected":""%>>广东</OPTION>
        <OPTION value="浙江"  <%=vcProvince.equals("浙江")? "selected":""%>>浙江</OPTION>
        <OPTION value="江苏"  <%=vcProvince.equals("江苏")? "selected":""%>>江苏</OPTION>
        <OPTION value="山东"  <%=vcProvince.equals("山东")? "selected":""%>>山东</OPTION>
        <OPTION value="四川" <%=vcProvince.equals("四川")? "selected":""%>>四川</OPTION>
        <OPTION value="黑龙江"  <%=vcProvince.equals("黑龙江")? "selected":""%>>黑龙江</OPTION>
        <OPTION value="湖南"  <%=vcProvince.equals("湖南")? "selected":""%>>湖南</OPTION>
        <OPTION value="湖北"  <%=vcProvince.equals("湖北")? "selected":""%>>湖北</OPTION>
        <OPTION value="上海"  <%=vcProvince.equals("上海")? "selected":""%>>上海</OPTION>
        <OPTION value="福建"  <%=vcProvince.equals("福建")? "selected":""%>>福建</OPTION>
        <OPTION value="陕西"  <%=vcProvince.equals("陕西")? "selected":""%>>陕西</OPTION>
        <OPTION value="河南"  <%=vcProvince.equals("河南")? "selected":""%>>河南</OPTION>
        <OPTION value="安徽"  <%=vcProvince.equals("安徽")? "selected":""%>>安徽</OPTION>
        <OPTION value="重庆"  <%=vcProvince.equals("重庆")? "selected":""%>>重庆</OPTION>
        <OPTION value="河北"  <%=vcProvince.equals("河北")? "selected":""%>>河北</OPTION>
        <OPTION value="吉林"  <%=vcProvince.equals("吉林")? "selected":""%>>吉林</OPTION>
        <OPTION value="江西"  <%=vcProvince.equals("江西")? "selected":""%>>江西</OPTION>
        <OPTION value="天津"  <%=vcProvince.equals("天津")? "selected":""%>>天津</OPTION>
        <OPTION value="广西"  <%=vcProvince.equals("广西")? "selected":""%>>广西</OPTION>
        <OPTION value="山西"  <%=vcProvince.equals("山西")? "selected":""%>>山西</OPTION>
        <OPTION value="内蒙古"  <%=vcProvince.equals("内蒙古")? "selected":""%>>内蒙古</OPTION>
        <OPTION value="甘肃"  <%=vcProvince.equals("甘肃")? "selected":""%>>甘肃</OPTION>
        <OPTION value="贵州"  <%=vcProvince.equals("贵州")? "selected":""%>>贵州</OPTION>
        <OPTION value="新疆"  <%=vcProvince.equals("新疆")? "selected":""%>>新疆</OPTION>
        <OPTION value="云南"  <%=vcProvince.equals("云南")? "selected":""%>>云南</OPTION>
        <OPTION value="宁夏"  <%=vcProvince.equals("宁夏")? "selected":""%>>宁夏</OPTION>
        <OPTION value="海南"  <%=vcProvince.equals("海南")? "selected":""%>>海南</OPTION>
        <OPTION value="青海"  <%=vcProvince.equals("青海")? "selected":""%>>青海</OPTION>
        <OPTION value="西藏"  <%=vcProvince.equals("西藏")? "selected":""%>>西藏</OPTION>
        <OPTION value="港澳台"  <%=vcProvince.equals("港澳台")? "selected":""%>>港澳台</OPTION>
        <OPTION value="海外"  <%=vcProvince.equals("海外")? "selected":""%>>海外</OPTION>
        <OPTION value="其它"  <%=vcProvince.equals("其它")? "selected":""%>>其它</OPTION>
      </SELECT></td>
    </tr>
    <tr class="trcolor">
      <td class="tdulright"  >工作单位：</td>
      <td class="tdulleft"><input name="vcWorkUnit" type="text" class="inputtext" id="vcWorkUnit" value="<%=vcWorkUnit%>"></td>
    </tr>
    <tr > 
      <td class="tdulright">学历：</td>
      <td class="tdulleft"><select name="vcEducation" id="vcEducation">
        <option value="0" >请选择...</option>
        <option value="4" <%=vcEducation.equals("4")? "selected":""%>>大专</option>
        <option value="5" <%=vcEducation.equals("5")? "selected":""%>>本科</option>
        <option value="6" <%=vcEducation.equals("6")? "selected":""%>>硕士</option>
        <option value="7" <%=vcEducation.equals("7")? "selected":""%>>博士</option>
      </select></td>
    </tr>
    <tr class="trcolor"> 
      <td class="tdulright">职称：</td>
      <td class="tdulleft"><select name="vcWorkTitle" id="vcWorkTitle">
        <option value="0" >请选择...</option>
        <option value="1" <%=vcWorkTitle.equals("1")? "selected":""%>>初级</option>
        <option value="2" <%=vcWorkTitle.equals("2")? "selected":""%>>中级</option>
        <option value="3" <%=vcWorkTitle.equals("3")? "selected":""%>>高级</option>
      </select></td>
    </tr>
    <tr > 
      <td class="tdulright">婚姻状况：</td>
      <td class="tdulleft"><select name="vcMarriage" id="sel_marriage">
        <option value="0" >请选择...</option>
        <option value="1" <%=vcMarriage.equals("1")? "selected":""%>>未婚</option>
        <option value="2" <%=vcMarriage.equals("2")? "selected":""%>>已婚</option>
        <option value="3" <%=vcMarriage.equals("3")? "selected":""%>>离异</option>
      </select></td>
    </tr>
    <tr  class="trcolor"> 
      <td class="tdulright"><span class="p2"><FONT color=#d11b00>*</FONT> </span>邮箱：</td>
      <td class="tdulleft"><input name="vcEmail" type="text" class="inputtext" id="vcEmail" value="<%=vcEmail%>"></td>
    </tr>
    <tr  > 
      <td class="tdulright">参加工作日期：</td>
      <td class="tdulleft">        <table width="222" border="0">
          <tr>
            <td><input name=daWorkDate class=input_date id=sel2 value="<%=daWorkDate%>" size=10 maxlength=10><input name="按钮" type=button class=unnamed1 onClick="return showCalendar('sel2','%Y-%m-%d');" value=...></td>
            <td>&nbsp;</td>
          </tr>
        </table> </td>
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
    <td><input  type="submit" class="button_xh" value="确认" ></td>
    <td><input  type="reset" class="button_xh" value="重填"></td>
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
