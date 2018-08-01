<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>供应商管理</title>
<jsp:useBean id="supplier" scope="page" class="BookShop.MyDb" /></head>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
</head>
<body>
<p>&nbsp;</p>
<table width="348" border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#0066ff" bordercolordark="#ffffff">
<caption>
<span class="two">出版商管理</span>
<p></p>
</caption>
  <tr>
    <td height="22" colspan="2" align="center"><a href="supplier_add.jsp" >增加新出版商</a></td>
  </tr>
<%
	String sqls="SELECT * FROM supplier ORDER BY idsupplier";
	Statement stmt=supplier.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	if(!rs.next()){
%>
  <tr>
    <td height="40"  colspan="2"  align="center" class="red12">没有出版商</td>
  </tr> 
<%
	}
	rs.previous();
	while(rs.next()){
		int idsupplier=rs.getInt("idsupplier");
		String suppliername=rs.getString("suppliername");
		suppliername=supplier.outStr(suppliername);
%>
  <tr>
    <td width="304" height="22" align="left" ><a href="supplier_view.jsp?idsupplier=<%=idsupplier%>"><%=suppliername%></a>&nbsp;</td>
    <td width="38" align="center" ><a href="supplier_del.jsp?idsupplier=<%=idsupplier%>"><img src="../image/emptybuycar.gif" width="20" height="20" border="0" alt="删除"></a></td>
  </tr>
<%
	}
	supplier.close();
	pageContext.removeAttribute("supplier");
%>
</table>
</body>
</html>
