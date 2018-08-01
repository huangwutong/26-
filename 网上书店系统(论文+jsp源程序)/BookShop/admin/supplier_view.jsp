<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>供应商详细信息</title>
<jsp:useBean id="supplier" scope="page" class="BookShop.MyDb" /></head>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
</head>
<body>
<p>&nbsp;</p>
<table width="402" border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#0066ff" bordercolordark="#ffffff">
<caption>
<span class="two">出版商详细信息</span>
<p></p>
</caption>
<%
	String idsupplier=(String)request.getParameter("idsupplier");
	String sqls="SELECT * FROM supplier WHERE idsupplier="+idsupplier;
	Statement stmt=supplier.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	if(rs.next()){

		String suppliername=rs.getString("suppliername");
		String sname=rs.getString("sname");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
		suppliername=supplier.outStr(suppliername);
		sname=supplier.outStr(sname);
		phone=supplier.outStr(phone);
		address=supplier.outStr(address);
%>
  <tr>
    <td width="126" height="27" align="center">出版商：</td>
    <td height="27" colspan="2" align="left"><%=suppliername%>&nbsp;</td>
  </tr>
  <tr>
    <td height="27"  align="center">联系人：</td>
    <td height="27" colspan="2"  align="left"><%=sname%>&nbsp;</td>
  </tr>
  <tr>
    <td height="27"  align="center">电&nbsp;&nbsp;话：</td>
    <td height="27" colspan="2"  align="left"><%=phone%>&nbsp;</td>
  </tr> 
  <tr>
    <td height="27" align="center" >地&nbsp;&nbsp;址：</td>
    <td height="27" colspan="2" align="left" ><%=address%>&nbsp;</td>
  </tr>
  <tr align="center">
    <td height="27" colspan="2"><a href="supplier_change.jsp?idsupplier=<%=idsupplier%>" style="cursor:hand ">修改</a></td>
    <td width="196"  ><a onClick="javascript:history.go(-1);" style="cursor:hand ">返回</a></td>
  </tr>
<%
	}
	supplier.close();
	pageContext.removeAttribute("supplier");
%>
</table>
</body>
</html>
