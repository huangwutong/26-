<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��Ա�޸�</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
<jsp:useBean id="change" scope="page" class="BookShop.MyDb" /></head>
<body> 
<p>&nbsp;</p> 
<p>&nbsp;</p> 
<p>&nbsp;</p> 
<%! String id,sqls,username,phone,email,state,city,address;
	int zip;	
%>
<%
	id=(String)session.getAttribute("id");
	sqls="SELECT * FROM customers WHERE idcustomer='"+id+"'";
	Statement stmt=change.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	while(rs.next()){
		username=rs.getString("username");
		phone=rs.getString("phone");
		state=rs.getString("state");
		city=rs.getString("city");
		address=rs.getString("address");
		zip=rs.getInt("zip");
		email=rs.getString("email");
		//����ת��
		username=change.outStr(username);
		phone=change.outStr(phone);
		state=change.outStr(state);
		city=change.outStr(city);
		address=change.outStr(address);		
		email=change.outStr(email);
%>
<table width="359" border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#0066ff" bordercolordark="#ffffff">
  <form name="form1" method="post" action="change_save.jsp" onSubmit="return reg_save()"> 
    <tr align="center"> 
      <td height="27" colspan="4" class="two"><strong>�����޸�</strong></td> 
    </tr> 
    <tr> 
      <td width="72" height="22" align="center">��&nbsp;��&nbsp;ID��</td> 
      <td width="280" height="22" colspan="3"><%=id%> 
    </tr> 
    <tr> 
      <td width="72" height="22" align="center">��&nbsp;��&nbsp;����</td> 
      <td width="280" height="22" colspan="3"><input name="username" type="text" maxlength="20" value="<%=username%>" /></td>
    </tr> 
    <tr> 
      <td height="22" align="center">��&nbsp;��&nbsp;�룺</td> 
      <td height="22" colspan="3"><input name="password" type="password" maxlength="20" /> </td> 
    </tr> 
    <tr> 
      <td height="22" align="center">����ȷ�ϣ�</td> 
      <td height="22" colspan="3"><input name="repassword" type="password" maxlength="20" /> </td> 
    </tr> 
    <tr> 
      <td height="22" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;����</td> 
      <td height="22" colspan="3"><input name="phone" type="text"  id="phone" maxlength="20"  value="<%=phone%>"/> </td> 
    </tr> 
    <tr> 
      <td height="22" align="center">E--mail��</td> 
      <td height="22" colspan="3"><input name="email" type="text" maxlength="40" value="<%=email%>"/></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">��&nbsp;��&nbsp;ʡ��</td> 
      <td height="22" colspan="3"><input name="state" type="text" id="state2"  maxlength="20" value="<%=state%>"/></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">��&nbsp;��&nbsp;�У�</td> 
      <td height="22" colspan="3"><input name="city" type="text" id="city2"  maxlength="20" value="<%=city%>" /></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�ࣺ</td> 
      <td height="22" colspan="3"><input name="zip" type="text" id="zip"  maxlength="7" value="<%=zip%>" /></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">�����ַ��</td> 
      <td height="22" colspan="3"><input name="address" type="text" id="address2" size="35"  maxlength="80" value="<%=address%>" /></td> 
    </tr> 
    <tr align="center" valign="middle"> 
      <td height="22" colspan="4"> <input name="Submit" type="submit"  value="�޸�"> 
&nbsp;&nbsp;&nbsp; 
        <input name="Submit2" type="reset"  value="����"></td> 
    </tr> 
  </form> 
</table> 
<%
	}
	change.close();
%>
<table width="359" height="40" align="center">
<tr>
  <td align="right" valign="bottom"><a onclick="javascrip:history.go(-1);" style="cursor:hand">����</a></td>
</tr></table>
</body>
</html>
