<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<%@ page import="java.sql.*" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>等级设定</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<jsp:useBean class="BookShop.MyDb" id="dis" scope="page"/>
</head>
<%
	int select=Integer.parseInt((String)request.getParameter("select1"));
	float limitprice=Float.parseFloat((String)request.getParameter("limitprice"));
	float discount=Float.parseFloat((String)request.getParameter("discount"));
	//int discount=Integer.parseInt((String)request.getParameter("discount"));
	
	String sqlu="UPDATE distinction SET limitprice="+limitprice+",discount="+discount+" WHERE iddistinction="+select;
	Statement stmt=dis.getstmt();
	stmt.executeUpdate(sqlu);
	dis.close();
	session.setAttribute("msg","修改成功");
	response.sendRedirect("distinction.jsp");
%>
</html>
