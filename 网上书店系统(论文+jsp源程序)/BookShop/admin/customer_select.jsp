<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>会员状况查询</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
</head>
<body> 
<p>&nbsp;</p> 
<form name="form1" method="post" action="customer_select_save.jsp" > 
  <table width="392"  border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#0066ff" bordercolordark="#FFFFFF" > 
    <caption> 
    <div class="two">会员状况查询</div> 
    <p></p> 
    </caption> 
    <tr> 
      <td width="85" height="22" align="center" >会&nbsp;&nbsp;员ID： </td> 
      <td height="22" ><input name="idcustomer" type="text" maxlength="14"></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">会员姓名：</td> 
      <td height="22"><input name="username" type="text" id="username" maxlength="20"></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">会员电话：</td> 
      <td height="22"><input name="phone" type="text" id="phone" maxlength="20"></td>
    </tr> 
    <tr> 
      <td height="22" align="center">会员Email：</td> 
      <td height="22"><input name="email" type="text" id="email"  maxlength="40"></td>
    </tr> 
  </table> 
 <p> <div align="center">不输入查询条件则显示所有信息</div>
  </p> 
  <div align="center"> 
    <input type="submit" name="Submit2" value="查询"> 
&nbsp;&nbsp;&nbsp; 
    <input type="reset" name="Submit" value="重置"> 
  </div> 
</form> 
</body>
</html>
