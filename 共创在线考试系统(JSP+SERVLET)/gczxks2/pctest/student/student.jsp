<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%>

<%@ page errorPage="QuestGen_error.jsp" %>

<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<jsp:useBean id="Tools" class="jinghua.Tools" scope="session">
</jsp:useBean>
<script language="javascript">
function CheckForm(f)
{
	if( !(form.testnum[0].checked || form.testnum[1].checked||form.testnum[2].checked||form.testnum[3].checked) ) {
		alert("\请选择试题个数 !!")
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
function msg(str)
{
   alert(str);
}
</script>
<HTML><HEAD><TITLE>在线测试</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2462.0" name=GENERATOR></HEAD>
<BODY>

<%!Connection con=null;
	String studentID="";

%>
<%
  if(con==null){
    con=DBCon.getConnection();
  }
 %>


<FORM name="form" action="NewSelTest.jsp" method="post" onSubmit="return CheckForm(this)">
  <textarea name="content" cols="" rows="" id="textarea" style="display:none"></textarea>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  <TR>
    <TD>&nbsp;</TD>
    <TD rowSpan=2>
      <DIV align=right><IMG src="../teacher/images/onlinetest.gif"
      width=208 height=97 border="0"></DIV></TD></TR>
  <TR>
        <TD height=55><IMG height=45 src="../teacher/images/logo.gif"
  width=160></TD>
      </TR></TBODY></TABLE>
<TABLE height=15 cellSpacing=0 cellPadding=0 width="100%" align=center
bgColor=#d3add1 border=0>
  <TBODY>
  <TR>
    <TD height=25>
      <DIV
align=center>首页｜高考通｜中考通｜共创题库｜学员社区｜我的共创｜服务中心</DIV></TD></TR></TBODY></TABLE>
  　　<A
href="http://jsptestonline.cosoft.org.cn/">首页</A>--共创题库--在线考试
  <P align="center"> 选择试题</P>
  <div align="center">
    <table bordercolor=#d3add1 height=226 width="71%" border=1>
      <tbody>
        <tr>
          <td
    height=41 align="center" valign=middle background=../teacher/images/lvbgcolor.gif><br> <div align="left">
<table width="100%" border="0">
                <tr>
                  <td width="33%"> &nbsp;&nbsp;&nbsp;计算机等级:
                    <select id=select12 name=Grade>
                      <%Tools.showOption("select * from grade order by id",con,out);%>




                    </select></td>
                  <td width="33%">&nbsp;&nbsp;科 &nbsp;目:
                    <select id=select name=Subject>
                      <%Tools.showOption("select * from subject order by id",con,out);%>
                    </select></td>
                  <td width="34%"> 题目类型:
                    <select id=select3 name=QuestType>
					<%Tools.showOption("select * from questtype order by id",con,out);%>
                    </select> </td>
                </tr>
              </table>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
        </tr>
        <tr>
          <td
    height=41 align="center" valign=middle background=../teacher/images/lvbgcolor.gif>
            <div align="left"> <br>
              <table width="100%" border="0">
                <tr>
                  <td width="34%" valign="middle">测试点:
                    <select id=select4 name=TestPoint>

                      <%Tools.showOption("select * from testpoint order by id",con,out);%>
                    </select> &nbsp;&nbsp;&nbsp;</td>
                  <td width="32%" valign="middle">&nbsp;知识点:
                    <select name=KnowPoint id="select5">
                      <% Tools.showOption("select * from knowpoint order by id",con,out);%>
                    </select>
                  </td>
                  <td width="34%" valign="middle">难易度:
                    <select name=Difficulty id="select6">
                      <option value="A" selected>A</option>
                      <option value="B">B</option>
                      <option value="C">C</option>
                      <option value="D">D</option>
                      <option value="E">E</option>
                    </select> </td>
                </tr>
              </table>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div></td>
        </tr>
        <tr>
          <td
    height=41 align="center" valign=middle background=../teacher/images/lvbgcolor.gif>
<div align="left"><br>
              <table width="91%" border="0" align="center">
                <tr valign="middle">
                  <td width="21%" height="27">&nbsp;&nbsp;&nbsp;试题个数：</td>
                  <td width="17%" align="center">
                    <input name="testnum" type="radio" value="5" checked>
                    5 &nbsp;&nbsp;</td>
                  <td width="15%" align="center">
                    <input type="radio" name="testnum" value="10">
                    10 </td>
                  <td width="16%" align="center">
                    <input name="testnum" type="radio" value="25">
                    25 &nbsp;</td>
                  <td width="15%" align="center">
                    <input type="radio" name="testnum" value="50">
                    50&nbsp;&nbsp;&nbsp;</td>
                  <td width="16%">&nbsp;</td>
                </tr>
              </table>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
        </tr>
        <tr>
          <td
    height=41 align="center" valign=center background=../teacher/images/lvbgcolor.gif>
<div align="left"> <br>
              <table width="100%" border="0">
                <tr>
                  <td width="51%" align="right">
                    <input type="submit" name="Submit" value="提交">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                  <td width="49%"><input name="Reset_Quest" type="reset" id="Reset_Quest2" value="重置"></td>
                </tr>
              </table>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div></td>
        </tr>
      </tbody>
    </table>
  </div>
  <P> </P>
<P>&nbsp;</P>
<P>&nbsp;</P></FORM>

</BODY></HTML>
