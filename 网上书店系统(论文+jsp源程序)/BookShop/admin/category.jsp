<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>图书类别管理</title>
<jsp:useBean id="category" scope="page" class="BookShop.MyDb" /></head>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
</head>
<body>
<p>&nbsp;</p>
<table width="348" border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#0066ff" bordercolordark="#ffffff">
<caption>
<span class="two">图书类别管理</span>
<p></p>
</caption>
  <tr>
    <td height="22" colspan="2" align="center"><a href="#" onClick="categoryadd()">增加新类别</a></td>
  </tr>
<%
	String sqls="SELECT * FROM category ORDER BY idcategory";
	Statement stmt=category.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	if(!rs.next()){
%>
  <tr>
    <td height="40"  colspan="2"  align="center" class="red12">没有建立图书类别</td>
  </tr> 
<%
	}
	rs.previous();
	while(rs.next()){
		int idcategory=rs.getInt("idcategory");
		String categoryname=rs.getString("categoryname");
		categoryname=category.outStr(categoryname);
%>
  <tr>
    <td width="304" height="22" align="left" ><%=categoryname%></td>
    <td width="38" align="center" ><a href="category_del.jsp?idcategory=<%=idcategory%>"><img src="../image/emptybuycar.gif" width="20" height="20" border="0" alt="删除"></a></td>
  </tr>
<%
	}
	category.close();
	pageContext.removeAttribute("category");
%>
</table>
</body>
</html>
