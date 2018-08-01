<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新增供应商</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
</head>
<body>
<p>&nbsp;</p>
 <form name="form1" method="post" action="supplier_add_save.jsp" onSubmit="return suplier_add()"> <tr>
<table width="403" height="90" border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#0066ff" bordercolordark="#ffffff">
    <caption> 
    <div class="two">添加新出版商</div> 
    <p></p> 
    </caption> 
        <tr>
          <td width="93" height="22" align="center">出版商名称：</td>
          <td width="304" align="left"><input name="suppliername" type="text" maxlength="20"></td>
      </tr>
  <tr>
    <td height="22" align="center">联&nbsp;&nbsp;系&nbsp;&nbsp;人：      </td>
    <td height="22" align="left"><input name="sname" type="text" maxlength="20"></td>
  </tr>
  <tr>
    <td height="22" align="center">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
    <td height="22" align="left"><input name="phone" type="text" maxlength="20"></td>
  </tr>
  <tr>
    <td height="22" align="center">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
    <td height="22" align="left"><input name="address" type="text" size="40" maxlength="80"></td>
  </tr>
</table>
<br>
<div align="center"><input type="submit" name="Submit" value="增加" >&nbsp;&nbsp;
<input type="reset" name="Submit2" value="重置" onClick="addclose()">
</div>
</form>
</body>
</html>
