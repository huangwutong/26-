<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page errorPage="QuestGen_error.jsp" %>
<%@ page import="java.io.*"%>
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


<FORM action="UnitTestShow.jsp" method="post" name="form1" id="form1" onSubmit="return CheckForm(this)">
  　<A
href="http://jsptestonline.cosoft.org.cn/">首页</A>--共创题库--在线考试 
  <P align="center"> 选择单元测试类型</P>
  <div align="center">
    <table bordercolor=#d3add1 height=243 width="52%" border=1>
      <tbody>
        <tr> 
          <td
    height=41 align="center" valign=middle background=images/lvbgcolor.gif><br> 
            <div align="left"> 
              <table width="100%" border="0">
                <tr> 
                  <td width="29%" align="right"> &nbsp;&nbsp;&nbsp; </td>
                  <td width="46%" align="left">计算机等级: 
                    <select id=select6 name=Grade>
                      <%Tools.showOption("select * from grade order by id",con,out);%>
                    </select></td>
                  <td width="25%">&nbsp; </td>
                </tr>
              </table>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
        </tr>
        <tr> 
          <td
    height=63 align="center" valign=middle background=images/lvbgcolor.gif> <div align="left"> 
              <br>
              <table width="100%" border="0">
                <tr> 
                  <td width="29%" align="right" valign="middle">&nbsp; </td>
                  <td width="54%" align="left" valign="middle">科 &nbsp;目: 
                    <select id=select4 name=Subject>
                      <%Tools.showOption("select * from subject order by id",con,out);%>
                    </select> </td>
                  <td width="17%" valign="middle">&nbsp; </td>
                </tr>
              </table>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            </div></td>
        </tr>
        <tr> 
          <td
    height=74 align="center" valign=middle background=images/lvbgcolor.gif>
<table width="100%" border="0">
              <tr> 
                <td width="29%" height="27" align="right"> </td>
                <td width="46%" align="left">知识点: 
                  <select name=KnowPoint id="select11">
                    <% Tools.showOption("select * from knowpoint order by id",con,out);%>
                  </select></td>
                <td width="25%">&nbsp; </td>
              </tr>
            </table>
            
          </td>
        </tr>
        <tr>
          <td
    height=31 align="center" valign=middle background=images/lvbgcolor.gif><table width="100%" border="0">
              <tr> 
                <td width="35%" align="right"> 
                  <input type="submit" name="Submit" value="确定">
                </td>
                <td width="24%" align="right">&nbsp;</td>
                <td width="41%" align="left">
<input name="Reset_Quest" type="reset" id="Reset_Quest4" value="重置">
                </td>
              </tr>
            </table></td>
        </tr>
      </tbody>
    </table>
  </div>
  <P> </P>
<P>&nbsp;</P>
<P>&nbsp;</P></FORM>

</BODY></HTML>
