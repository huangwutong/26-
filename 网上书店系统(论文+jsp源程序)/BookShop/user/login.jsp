<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<html>
<head>
<title>��Ա��¼</title>
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
      <td  height="27" colspan="2" class="two" ><strong>��Ա��¼</strong></td> 
    </tr> 
    <tr> 
      <td width="84" height="27" align="center">��ԱID��</td> 
      <td width="214" height="27"><input name="id" type="text" maxlength="20"></td> 
    </tr> 
    <tr> 
      <td height="27" align="center">��&nbsp;&nbsp;�룺</td> 
      <td height="27"><input name="password" type="password" maxlength="20"></td> 
    </tr> 
    <tr> 
      <td height="27" colspan="2" align="center"> <input name="Submit" type="submit" value="��¼"> 
&nbsp;&nbsp; 
        <input name="button" type="button" onclick="reg()" value="ע��"> </td> 
    </tr> 
  </form> 
</table> 
</body>
</html>