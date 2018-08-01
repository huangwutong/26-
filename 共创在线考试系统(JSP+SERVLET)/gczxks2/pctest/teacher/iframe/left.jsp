<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>

<%@ page import="java.sql.*"%>
<%@ page import="jinghua.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>





<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<META NAME="DESCRIPTION" CONTENT="考试系统－教师功能">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Window-target" CONTENT="_top">
<title>考试系统－教师功能</title>
<link rel="stylesheet" href="../common/style.css" type="text/css">
</head>
<body bgcolor="#EEEEEE" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#EEEEEE">
  <tr>
    <td colspan="2" height="15">&nbsp;</td>
  </tr>
  <tr>
    <td width="15"> <br>
      <br>
    </td>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
        <tr>
          <td width="24" height="22">
            <table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td bgcolor="#EEEEEE"><img src="../images/0cir.gif" width="24" height="22"></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height="400" valign="top" bgcolor="#FFFFFF">
            <table width="80%" border="0" cellspacing="3" cellpadding="0" align="center">
			<tr>
                <td width="35" height="40" align="center"><img src="../images/personinfo.gif" width="32" height="32"></td>
                <td height="40"> <FONT color=#333300> <a href="../Query_test.jsp" target="mainFrame">查询考试成绩
                  </a></FONT> </td>
        </tr>

                <tr>
                <td width="35" height="40" align="center"><img src="../images/icon_splccx.gif" width="32" height="32"></td>
                <td height="40"> <FONT color=#333300><a href="../modify_test.jsp" target="mainFrame">修改试题（试卷）</a>
                  </FONT> </td>
        </tr>
		<tr>
                <td width="35" height="40" align="center"><img src="../images/icon_spdj.gif" width="32" height="32"></td>
                <td height="40"> <FONT color=#333300><a href="../QuestGen_free.jsp" target="mainFrame">录入自由测试卷子</a> 
                  </FONT> </td>
        </tr>
		<tr>
                <td width="35" height="40" align="center"><img src="../images/icon_spdj.gif" width="32" height="32"></td>
                <td height="40"> <FONT color=#333300><a href="../QuestGen.jsp" target="mainFrame">录入单元测试卷子</a> 
                  </FONT> </td>
        </tr>
		<tr>
                <td width="35" height="40" align="center"><img src="../images/icon_spdj.gif" width="32" height="32"></td>
                <td height="40"> <FONT color=#333300><a href="../QuestGen_mn.jsp" target="mainFrame">录入正式考试卷子</a></FONT></td>
        </tr>
		<tr>
                <td width="35" height="40" align="center"><img src="../images/icon_fwpy1.gif" width="32" height="32"></td>
                <td height="40"> <FONT color=#333300><a href="../../admin/admin_mn_test.jsp" target="mainFrame">正式考试管理</a></FONT></td>
        </tr>
		<tr>
                <td width="35" height="40" align="center"><img src="../images/icon_fwpy1.gif" width="32" height="32"></td>
                <td height="40"> <FONT color=#333300><a href="../../admin/admin_knowpoint.jsp" target="mainFrame">知识点管理</a></FONT></td>
        </tr>
		<tr>
                <td width="35" height="40" align="center"><img src="../images/icon_fwpy1.gif" width="32" height="32"></td>
                <td height="40"> <FONT color=#333300><a href="../../admin/admin_subject.jsp" target="mainFrame">计算机等级科目管理</a></FONT></td>
        </tr>
		<tr>
                <td width="35" height="40" align="center"><img src="../images/icon_fwpy1.gif" width="32" height="32"></td>
                <td height="40">&nbsp; </td>
        </tr>
		<tr>
                <td width="35" height="40" align="center"><img src="../images/icon_fwpy1.gif" width="32" height="32"></td>
                <td height="40">&nbsp; </td>
        </tr>
		




            </table>
		  <p>&nbsp;</p></td>
        </tr>
        <tr>
          <td width="24" height="22">
            <table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td bgcolor="#EEEEEE"><img src="../images/0cir_bl.gif" width="24" height="22"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td colspan="2" height="15">&nbsp;</td>
  </tr>
</table>
</body>
</html>
