<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<html>
<head>
<title>会员登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312 ">
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
</head>
<body> 
<p>&nbsp;</p> 
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p> 
  <table width="305" border="1" align="center" cellpadding="-1" cellspacing="0" bordercolorlight="#0066ff" bordercolordark="#ffffff">
  <form name="form1" method="post" action="login_save.jsp" onSubmit="return login()"> 
    <tr align="center" class="blue"> 
      <td  height="27" colspan="2" class="two" ><strong>会员登录</strong></td> 
    </tr> 
    <tr> 
      <td width="84" height="27" align="center">会员ID：</td> 
      <td width="214" height="27"><input name="id" type="text" maxlength="20"></td> 
    </tr> 
    <tr> 
      <td height="27" align="center">密&nbsp;&nbsp;码：</td> 
      <td height="27"><input name="password" type="password" maxlength="20"></td> 
    </tr> 
    <tr> 
      <td height="27" colspan="2" align="center"> <input name="Submit" type="submit" value="登录"> 
&nbsp;&nbsp; 
        <input name="button" type="button" onclick="reg()" value="注册"> </td> 
    </tr> 
  </form> 
</table> 
</body>
</html>