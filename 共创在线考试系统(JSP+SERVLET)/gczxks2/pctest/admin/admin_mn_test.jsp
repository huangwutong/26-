<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<%@ page import="jinghua.*"%>


<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!
Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
%>

<%
try{
    con=DBCon.getConnection();
	String sql="SELECT   `mn_test`.`id`,  `mn_test`.`name`,  `grade`.`Name` AS `gn` "+
		"FROM  `mn_test`  INNER JOIN `grade` ON (`mn_test`.`grade_note` = `grade`.`note`) "+
		"ORDER BY  `mn_test`.`grade_note`,  `mn_test`.`id`";
    pstmt=con.prepareStatement(sql);
    rs=pstmt.executeQuery();
%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>系统管理 |增加正式考试</title>
<link rel="stylesheet" type="text/css" href="../css.css">

<style type="text/css">
<!--td { text-decoration: none; font-size: 10pt}
a { text-decoration: none; color: #000000}
a:hover { text-decoration: underline; color: #336699}
.font14 {
	font-size: 14px;
	line-height: 18px;
}
.l20 {  line-height: 20px; font-size: 13px}
boder2 {  border-color: black #6B90C5 #6B90C5; border-style: solid; border-top-width: 0px; border-right-width: 2px; border-bottom-width: 2px; border-left-width: 2px}
.boder2 {
	border-top-width: 0px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: black;
	border-right-color: #000000;
	border-bottom-color: #000000;
	border-left-color: #000000;
}
.boder1 {  border: 1px solid #000000}
.font12 {  font-size: 12px; line-height: 18px}
-->
</style>
</head>
<script language="javaScript">
<!--

Now = new Date();
NowDay = Now.getDate();
NowMonth = Now.getMonth();
NowYear = Now.getYear();
if (NowYear < 2000) NowYear += 1900; //for Netscape

//function for returning how many days there are in a month including leap years
function DaysInMonth(WhichMonth, WhichYear)
{
  var DaysInMonth = 31;
  if (WhichMonth == "04" || WhichMonth == "06" || WhichMonth == "09" || WhichMonth == "11") DaysInMonth = 30;
  if (WhichMonth == "02") {
  	DaysInMonth = 28;
  	if (WhichMonth == "02" && (WhichYear/4) == Math.floor(WhichYear/4))	{
  		if ((WhichYear/100) != Math.floor(WhichYear/100)) {
  			DaysInMonth = 29;
  		}else{
  			if ((WhichYear/400) == Math.floor(WhichYear/400)) {
  				DaysInMonth = 29;
  			}
  		}
  	}
  }
  return DaysInMonth;
}

//function to change the available days in a months
function ChangeOptionDays(Which)
{
  DaysObject = eval("document.forms['myform']." + Which + "day");
  MonthObject = eval("document.forms['myform']." + Which + "month");
  YearObject = eval("document.forms['myform']." + Which + "year");

  Month = MonthObject[MonthObject.selectedIndex].text;
  Year = YearObject[YearObject.selectedIndex].text;

  DaysForThisSelection = DaysInMonth(Month, Year);
  CurrentDaysInSelection = DaysObject.length;
  if (CurrentDaysInSelection > DaysForThisSelection)
  {
    for (i=0; i<(CurrentDaysInSelection-DaysForThisSelection); i++)
    {
      DaysObject.options[DaysObject.options.length - 1] = null
    }
  }
  if (DaysForThisSelection > CurrentDaysInSelection)
  {
    for (i=0; i<(DaysForThisSelection-CurrentDaysInSelection); i++)
    {
      NewOption = new Option(DaysObject.options.length + 1);
      DaysObject.add(NewOption);
    }
  }
    if (DaysObject.selectedIndex < 0) DaysObject.selectedIndex == 0;
}
function ChangeOptionDays1(Which)
{
  DaysObject = eval("document.forms['myform']." + Which + "day1");
  MonthObject = eval("document.forms['myform']." + Which + "month1");
  YearObject = eval("document.forms['myform']." + Which + "year1");

  Month = MonthObject[MonthObject.selectedIndex].text;
  Year = YearObject[YearObject.selectedIndex].text;

  DaysForThisSelection = DaysInMonth(Month, Year);
  CurrentDaysInSelection = DaysObject.length;
  if (CurrentDaysInSelection > DaysForThisSelection)
  {
    for (i=0; i<(CurrentDaysInSelection-DaysForThisSelection); i++)
    {
      DaysObject.options[DaysObject.options.length - 1] = null
    }
  }
  if (DaysForThisSelection > CurrentDaysInSelection)
  {
    for (i=0; i<(DaysForThisSelection-CurrentDaysInSelection); i++)
    {
      NewOption = new Option(DaysObject.options.length + 1);
      DaysObject.add(NewOption);
    }
  }
    if (DaysObject.selectedIndex < 0) DaysObject.selectedIndex == 0;
}
//function to set options to today
function SetToToday(Which)
{
  DaysObject = eval("document.forms['myform']." + Which + "Day");
  MonthObject = eval("document.forms['myform']." + Which + "Month");
  YearObject = eval("document.forms['myform']." + Which + "Year");


  YearObject[0].selected = true;

  MonthObject[NowMonth].selected = true;

  ChangeOptionDays(Which);

  DaysObject[NowDay-1].selected = true;
}
function checkdata(){
    if( myform.selgrade.selectedIndex == 0) {
        alert("请选择正式考试的计算机等级信息!")
        return false;
    }
    if(myform.testname.value==""){
        alert("请输入正式考试的名称！");
        return false;
    }
    return true;
}
function submitit(myform)
{

}

function saveit(myform)
{
  if (confirm("是否保存所有修改？"))
  {
    myform.action="adminnianjisaveedit.asp";
    myform.submit();
  }
}

function delit(myform)
{
  if (confirm("将删除所有选择的正式考试数据？"))
  {
    myform.action="admin_mn_test_del.jsp";
    myform.submit();
  }
}
//-->
</script>
<body>


<div align="center">
  <center>
    <p align="left">当前位置： 系统管理 &gt; 增加正式考试</p>
    <form method="POST" action="admin_mn_test_add.jsp" name="myform" onSubmit="return checkdata()">
    <table cellspacing="1" style="border-collapse: collapse" bordercolor="#799AE1" width="68%" id="AutoNumber2" border="1">
      
      <tr class="trh">
      <td width="100%" height="25"  >
      <p align="center"><b>&nbsp;<font color="#FFFFFF">增加正式考试</font></b></td>
    </tr>
    <tr class="trh1">
      <td width="100%" height="160"  >

        <p align="center">　</p>
            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#799AE1" width="99%" height="157">
              <tr>
                <td width="18%" height="31" bordercolor="#799AE1"> <p align="right">计算机等级：</td>
                <td height="31" bordercolor="#799AE1"> <select name="selgrade" id="select" size="1">
                    <option selected value="temp">未选择</option>
                    <%Tools.showGradeOption(con,out); %>
                  </select></td>
              </tr>
              <tr>
                <td width="18%" height="31" bordercolor="#799AE1"> <p align="right">考试名称：</td>
                <td height="31" bordercolor="#799AE1"> <p align="left">
                    <input name="testname" type="text" id="testname" size="40" maxlength="100">
                </td>
              </tr>
              <tr>
                <td width="18%" height="31" bordercolor="#799AE1"> <p align="right">考试开始时间：</td>
                <td height="31" bordercolor="#799AE1"> <select name="dateyear"  onChange=ChangeOptionDays('date') class="boder2">
                    <option value=2003>2003</option>
                    <option value=2004>2004</option>
                    <option value=2005>2005</option>
                    <option value=2006 selected>2006</option>
                    <option value=2007>2007</option>
                    <option value=2008>2008</option>
                    <option value=2009>2009</option>
                    
                  </select>
                  年
                  <select name="datemonth" onChange=ChangeOptionDays('date')  >
                    <option value="1">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                    <option value="4">04</option>
                    <option value="5">05</option>
                    <option value="6">06</option>
                    <option value="7">07</option>
                    <option value="8" selected>08</option>
                    <option value="9">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                  </select>
                  月
                  <select name="dateday"  onChange=ChangeOptionDays('date') class="boder2">
                    <option value="1">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                    <option value="4">04</option>
                    <option value="5">05</option>
                    <option value="6">06</option>
                    <option value="7">07</option>
                    <option value="8">08</option>
                    <option value="9">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
                    <option value="24">24</option>
                    <option value="25">25</option>
                    <option value="26">26</option>
                    <option value="27">27</option>
                    <option value="28">28</option>
                    <option value="29">29</option>
                    <option value="30">30</option>
                    <option value="31">31</option>
                  </select>
                  日 </td>
              </tr>
              <tr>
                <td width="18%" height="32" bordercolor="#799AE1"><div align="right">
                    <p>考试结束时间：</p>
                  </div></td>
                <td height="32" bordercolor="#799AE1"> <select name="dateyear1" class="boder2" id="dateyear1"  onChange=ChangeOptionDays1('date')>
                    <option value=2003>2003</option>
                    <option value=2004>2004</option>
                    <option value=2005>2005</option>
                    <option value=2006 selected>2006</option>
                    <option value=2007>2007</option>
                    <option value=2008>2008</option>
                    <option value=2009>2009</option>
                    
                  </select>
                  年
                  <select name="datemonth1" id="datemonth1" onChange=ChangeOptionDays1('date')  >
                    <option value="1">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                    <option value="4">04</option>
                    <option value="5">05</option>
                    <option value="6">06</option>
                    <option value="7">07</option>
                    <option value="8">08</option>
                    <option value="9">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12" selected>12</option>
                  </select>
                  月
                  <select name="dateday1" class="boder2" id="dateday1"  onChange=ChangeOptionDays1('date')>
                    <option value="1">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                    <option value="4">04</option>
                    <option value="5">05</option>
                    <option value="6">06</option>
                    <option value="7">07</option>
                    <option value="8">08</option>
                    <option value="9">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
                    <option value="24">24</option>
                    <option value="25">25</option>
                    <option value="26">26</option>
                    <option value="27">27</option>
                    <option value="28">28</option>
                    <option value="29">29</option>
                    <option value="30">30</option>
                    <option value="31" selected>31</option>
                  </select>
                  日 </td>
              </tr>
            </table>
        <p align="center">　</p>

      </td>
    </tr>
    <tr>
          <td width="100%" height="25" bgcolor="#FFFDE8" bordercolor="#799AE1"> <p align="center">
              <input type="submit" value="增 加" name="B1" class="s02">
              <span lang="en-us">&nbsp;&nbsp;&nbsp;&nbsp; </span>
              <input type="button" value="关闭窗口" name="B2" onClick="self.close()" class="s02">
          </td>


 </tr>

 
  </table>
   </form>
    <p>&nbsp;</p>
    <form name="admin_mn_test_del" method="get" onSubmit="return submitit(this)">
      <table border="1" cellspacing="1" style="border-collapse: collapse" bordercolor="#799AE1" width="532" id="AutoNumber1">
        <tr    class="trh"> 
          <td width="27" align="center" bgcolor="#E1E1E1" height="20"><input type=checkbox name=del_all1 value=1 onclick=FanAll(adminbanji)></td>
          <td width="36" align="center" bgcolor="#E1E1E1"><font color="#FFFFFF"><b>序号</b></font></td>
          <td align="center" bgcolor="#E1E1E1" width="118"> <font color="#FFFFFF"> 
            <b>计算机等级</b> </font></td>
          <td align="center" bgcolor="#E1E1E1" width="322"> <font color="#FFFFFF">考试名称</font></td>
        </tr>
        <%
        int i=1;
        while(rs.next()){%>
        <tr   class="trh1"> 
          <td align="center"   width="27"> <input type="checkbox" name="id" value="<%=rs.getInt("id")%>"></td>
          <td align="center" width="36"><%=i%>　</td>
          <td width="118" align="center"><%=""+rs.getString("gn")%>&nbsp; </td>
          <td width="322" align="center"><div align="left"><%=""+rs.getString("name")%>&nbsp;</div></td>
        </tr>
        <%
      i++;
      }
      rs.close();
      pstmt.close();
      %>
        <caption>
        <p align="right"> 
          <input type="submit" value="删除所选项" name="del" onClick="delit(admin_mn_test_del)" class="s02">
        </p>
        </caption>
      </table>
    </form>
    <p>&nbsp;</p>
  </center>
</div>
</body>
</html>
<%
}

catch(Exception e){
    out.print(e.toString());
}
finally{
    DBCon.dropConnection();
}
%>