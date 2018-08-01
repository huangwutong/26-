<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>会员修改</title>
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
		//出库转码
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
      <td height="27" colspan="4" class="two"><strong>资料修改</strong></td> 
    </tr> 
    <tr> 
      <td width="72" height="22" align="center">用&nbsp;户&nbsp;ID：</td> 
      <td width="280" height="22" colspan="3"><%=id%> 
    </tr> 
    <tr> 
      <td width="72" height="22" align="center">用&nbsp;户&nbsp;名：</td> 
      <td width="280" height="22" colspan="3"><input name="username" type="text" maxlength="20" value="<%=username%>" /></td>
    </tr> 
    <tr> 
      <td height="22" align="center">新&nbsp;密&nbsp;码：</td> 
      <td height="22" colspan="3"><input name="password" type="password" maxlength="20" /> </td> 
    </tr> 
    <tr> 
      <td height="22" align="center">密码确认：</td> 
      <td height="22" colspan="3"><input name="repassword" type="password" maxlength="20" /> </td> 
    </tr> 
    <tr> 
      <td height="22" align="center">电&nbsp;&nbsp;&nbsp;&nbsp;话：</td> 
      <td height="22" colspan="3"><input name="phone" type="text"  id="phone" maxlength="20"  value="<%=phone%>"/> </td> 
    </tr> 
    <tr> 
      <td height="22" align="center">E--mail：</td> 
      <td height="22" colspan="3"><input name="email" type="text" maxlength="40" value="<%=email%>"/></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">所&nbsp;在&nbsp;省：</td> 
      <td height="22" colspan="3"><input name="state" type="text" id="state2"  maxlength="20" value="<%=state%>"/></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">所&nbsp;在&nbsp;市：</td> 
      <td height="22" colspan="3"><input name="city" type="text" id="city2"  maxlength="20" value="<%=city%>" /></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">邮&nbsp;&nbsp;&nbsp;&nbsp;编：</td> 
      <td height="22" colspan="3"><input name="zip" type="text" id="zip"  maxlength="7" value="<%=zip%>" /></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">具体地址：</td> 
      <td height="22" colspan="3"><input name="address" type="text" id="address2" size="35"  maxlength="80" value="<%=address%>" /></td> 
    </tr> 
    <tr align="center" valign="middle"> 
      <td height="22" colspan="4"> <input name="Submit" type="submit"  value="修改"> 
&nbsp;&nbsp;&nbsp; 
        <input name="Submit2" type="reset"  value="重置"></td> 
    </tr> 
  </form> 
</table> 
<%
	}
	change.close();
%>
<table width="359" height="40" align="center">
<tr>
  <td align="right" valign="bottom"><a onclick="javascrip:history.go(-1);" style="cursor:hand">返回</a></td>
</tr></table>
</body>
</html>
