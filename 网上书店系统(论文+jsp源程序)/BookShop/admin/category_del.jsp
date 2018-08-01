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
	int idcategory=Integer.parseInt((String)request.getParameter("idcategory"));
	String sqld="DELETE FROM category WHERE idcategory="+idcategory;
	int temp=-2;
	temp=category.update(sqld);
	if(temp>0){
		response.sendRedirect("category.jsp");
	}else{
		out.println("<script>alert('删除失败');window.close();</script>");
	}
%>
</html>
