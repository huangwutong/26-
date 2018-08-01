<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新增类别</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<jsp:useBean id="category" scope="page" class="BookShop.MyDb" /></head>
</head>
<%
	String categoryname=(String)request.getParameter("categoryname");
		categoryname=category.inStr(categoryname);
	String sqls="SELECT * FROM category WHERE categoryname='"+categoryname+"'";
	String sqli="INSERT INTO category(categoryname) VALUES('"+categoryname+"')";
	int temp=-2;
	temp=category.select(sqls);
	if(temp>0){
		out.println("<script>alert('图书类存在');window.close();</script>");
	}else{
		temp=0;
		temp=category.update(sqli);
		out.print("<script>opener.location.reload();window.close();</script>");
	}
%>
</html>
