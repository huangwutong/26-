<%@ page contentType="text/html; charset=gb2312" language="java" %>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<META NAME="DESCRIPTION" CONTENT="考试系统－成绩统计图表">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Window-target" CONTENT="_top">
<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.5)">
<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.5)">
<title>考试系统－成绩统计图表</title>
<link rel="stylesheet" href="ommon/style.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<%
int i=session.getMaxInactiveInterval();
/*
out.println("<br>session max="+i);
out.println("<br>system temp dir="+System.getProperty("java.io.tmpdir"));
*/
%>
<form name="form1" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#EEEEEE">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
  <table width="95%" border="0" cellspacing="2" cellpadding="0" align="center">
    <tr>
      <td class="toptd" align="center"><img src="images/use.gif" width="424" height="78"></td>
    </tr>
    <tr>
      <td class="xxline"><img src="images/1px.gif" width="1" height="1"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </table>
  <table width="95%" border="0" cellspacing="1" cellpadding="3" align="center" bgcolor="#000000">
    <tr>
      <td class="word" bgcolor="#FFFFFF">
        <p>使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字</p>
        <p>使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字，使用说明介绍性文字。</p>
      </td>
    </tr>
  </table>
  <table width="95%" border="0" cellspacing="2" cellpadding="0" align="center">
    <tr>
      <td>&nbsp; </td>
    </tr>
    <tr>
      <td class="xxline"><img src="images/1px.gif" width="1" height="1"></td>
    </tr>
    <tr>
      <td class="toptd" align="center">
        <table border="0" cellspacing="0" cellpadding="0" align="center">
          <tr align="center">
            <td width="100">
              <input type="button" name="Submit2" value="返 回">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
