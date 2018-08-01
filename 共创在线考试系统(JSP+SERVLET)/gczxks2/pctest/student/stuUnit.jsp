<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>

<%@ page import="java.io.*"%>
<%@ page import="jinghua.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<jsp:useBean id="Tools" class="jinghua.Tools" scope="session">
</jsp:useBean>
<%!Connection con;
String studentID="";
boolean debug=false;
%>

<%

try{
    studentID=(String)session.getAttribute("studentID");
    //Tools.showalert(studentID,out);
    if(studentID==null){
        throw new Exception();
    }

}catch(Exception e){
    Tools.showalert("您还没有登录，或连接超时，请重新登录!",out);
    Tools.showJS("window.open('../login.jsp','_self')",out);
}


try{
    con=DBCon.getConnection();
%>
<%
if(debug) out.print("<br>stuID="+studentID);
String temp=Tools.sub_know(con);
out.print(temp);
temp=Tools.grade_sub(con);
out.print(temp);
%>
<script language="javascript">

function CheckForm(myform)
{
	 if( myform.Grade.selectedIndex == 0) {
        alert("请选择计算机等级信息!")
        return false;
    }
    if(myform.Subject.selectedIndex==0){
        alert("请选择科目信息!")
        return false;
    }
    if(myform.KnowPoint.selectedIndex==0){
        alert("请选知识点信息!")
        return false;
    }

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
<!--计算机等级，科目，知识点三个下拉列表框联动-->

<script language="JavaScript">
function changegs(locationid){
	document.myform.Subject.length =1;
        document.myform.KnowPoint.length =1;
        var locationid=locationid;
        var i;
        for (i=0;i < gscount; i++){
            if (grade_sub[i][0] == locationid) {
	            document.myform.Subject.options[document.myform.Subject.length] = new Option(grade_sub[i][2], grade_sub[i][1]);
            }
	}
}
</script>
<script language="JavaScript">
function changesk(locationid){
	document.myform.KnowPoint.length =1;
	var locationid=locationid;
	var i;
	for (i=0;i < gskcount; i++){
		if (grade_sub_know[i][1] == locationid){
			document.myform.KnowPoint.options[document.myform.KnowPoint.length] = new Option(grade_sub_know[i][3], grade_sub_know[i][2]);
		}
	}
}
</script>
<script language="JavaScript">
function load()
{
document.myform.Grade.selectedIndex=0;
}
</script>


<HTML><HEAD><TITLE>在线测试</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK
href="../common/css/style.css" type=text/css rel=stylesheet>

</HEAD>
<BODY onload="load()">







<FORM action="UnitTestShow.jsp" method="post" name="myform" target="_self" id="form1" onSubmit="return CheckForm(this)">
  <P align="center" class="word">&nbsp;</P>
  <P align="center" class="word"><strong>选择单元测试类型</strong></P>
  <div align="center">
    <table width="52%" height=243 border=1 bordercolor=#d3add1 class="tboutline">
      <tbody>
        <tr>
          <td
    height=41 align="center" valign=middle background=images/lvbgcolor.gif><br>
            <div align="left">
              <table width="100%" border="0">
                <tr>
                  <td width="29%" align="right"> <p align="right">计算机等级:</p></td>
                  <td width="46%" align="left">
<select id="Grade" name=Grade onClick="changegs(document.myform.Grade.options[document.myform.Grade.selectedIndex].value)" size="1">
                    <option value="temp">--未选择--</option>
                      <%Tools.showGradeOption(con,out);%>
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
                  <td width="29%" align="right" valign="middle"><p align="right">科
                      &nbsp;目:</p></td>
                  <td width="54%" align="left" valign="middle">
<select id=select4 name=Subject onClick="changesk(document.myform.Subject.options[document.myform.Subject.selectedIndex].value)"
size="1">

                    <option value="temp">--未选择--</option>
                      <%--Tools.showOption("select * from subject order by id",con,out);--%>
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
                <td width="29%" height="27" align="right">知识点: </td>
                <td width="46%" align="left">
<select name=KnowPoint id="select11">
                  <option value="temp">----未选择----</option>
                    <%-- Tools.showOption("select * from knowpoint order by id",con,out);--%>
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
<%}
catch(Exception e){
    System.out.print(e.toString());
}
finally{
	System.out.println("#############stuunit.jsp end");
    DBCon.dropConnection();
}
%>
