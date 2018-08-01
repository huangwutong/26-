<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新增类别</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
</head>
<body>
<p>&nbsp;</p>
 <form name="form1" method="post" action="category_add_save.jsp" onSubmit="return addadd()"> <tr>
<table width="200" border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#0066ff" bordercolordark="#ffffff">
    <td height="22" align="center">类别名称</td>
  </tr>
  <tr>
    <td height="22" align="center">
      <input name="categoryname" type="text" maxlength="20"></td>
  </tr>
  <tr>
    <td height="22" align="center">&nbsp;</td>
  </tr>
</table><br>
<div align="center"><input type="submit" name="Submit" value="增加" >&nbsp;
<input type="button" name="Submit2" value="关闭" onClick="addclose()">
</div>
</form>
</body>
</html>
