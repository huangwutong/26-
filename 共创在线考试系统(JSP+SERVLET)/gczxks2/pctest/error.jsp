<%@ page contentType="text/html;charset=GB2312" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String errmsg="";
errmsg=(String)session.getAttribute("ErrorMsg");
%>
<html>
<head>
<base href="<%=basePath%>">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<META NAME="DESCRIPTION" CONTENT="">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Window-target" CONTENT="_top">
<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.5)">
<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.5)">
<title>信息提示</title>
<link rel="stylesheet" href="common/css/style.css" type="text/css">
<style type="text/css">
<!--
.style1 {font-size: 18pt}
.style2 {
	font-size: larger;
	font-weight: bold;
}
-->
</style>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  onUnload="opener.location.reload();">
<form name="form1" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#EEEEEE">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
  <table width="95%" border="0" cellspacing="2" cellpadding="0" align="center">
    <tr> 
      <td class="toptd" align="center">&nbsp;</td>
    </tr>
    <tr> 
      <td class="xxline"><img src="images/1px.gif" width="1" height="1"></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
  </table>
  <table width="70%" border="0" cellspacing="0" cellpadding="0" align="center" height="150">
    <tr>
      <td width="150"><img src="images/pic_error.gif" width="150" height="150"></td>
      <td>
        <table width="95%" border="0" cellspacing="2" cellpadding="0" align="center">
          <tr>
            <td align="center" class="titlefont1 style1">操作失败信息</td>
          </tr>
          <tr> 
            <td height="60" align="center" class="word style2"> <%=errmsg%></td>
          </tr>
        </table>
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
              <input  type="button" class="button_xh" onClick="window.close()" value="关　闭">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
