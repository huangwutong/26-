<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��Աע��</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
<jsp:useBean id="reg" scope="page" class="BookShop.MyTime" /></head>
<body> 
<p>&nbsp;</p> 
<p>&nbsp;</p> 
<p>&nbsp;</p> 
  <table width="359" border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#0066ff" bordercolordark="#ffffff">
  <form name="form1" method="post" action="reg_save.jsp" onSubmit="return reg_save()"> 
    <tr align="center"> 
      <td height="27" colspan="4" class="two"><strong>��Աע��</strong></td> 
    </tr> 
    <tr> 
      <td width="72" height="22" align="center">��&nbsp;��&nbsp;ID��</td> 
      <td width="280" height="22" colspan="3"><%=reg.getId()%> 
        <input name="id" type="hidden" value="<%=reg.getId()%>"></td> 
    </tr> 
    <tr> 
      <td width="72" height="22" align="center">��&nbsp;��&nbsp;����</td> 
      <td width="280" height="22" colspan="3"><input name="username" type="text" maxlength="20"></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�룺</td> 
      <td height="22" colspan="3"><input name="password" type="password" maxlength="20" /> </td> 
    </tr> 
    <tr> 
      <td height="22" align="center">����ȷ�ϣ�</td> 
      <td height="22" colspan="3"><input name="repassword" type="password" maxlength="20" /> </td> 
    </tr> 
    <tr> 
      <td height="22" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;����</td> 
      <td height="22" colspan="3"><input name="phone" type="text"  id="phone" maxlength="20" /> </td> 
    </tr> 
    <tr> 
      <td height="22" align="center">E--mail��</td> 
      <td height="22" colspan="3"><input name="email" type="text" maxlength="40" /></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">��&nbsp;��&nbsp;ʡ��</td> 
      <td height="22" colspan="3"><input name="state" type="text" id="state2"  maxlength="20" /></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">��&nbsp;��&nbsp;�У�</td> 
      <td height="22" colspan="3"><input name="city" type="text" id="city2"  maxlength="20" /></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�ࣺ</td> 
      <td height="22" colspan="3"><input name="zip" type="text" id="zip"  maxlength="7" /></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">�����ַ��</td> 
      <td height="22" colspan="3"><input name="address" type="text" id="address2" size="35"  maxlength="80" /></td> 
    </tr> 
    <tr align="center" valign="middle"> 
      <td height="22" colspan="4"> <input name="Submit" type="submit"  value="�ύ"> 
&nbsp;&nbsp;&nbsp; 
        <input name="Submit2" type="reset"  value="����"></td> 
    </tr> 
  </form> 
</table> 
</body>
</html>
