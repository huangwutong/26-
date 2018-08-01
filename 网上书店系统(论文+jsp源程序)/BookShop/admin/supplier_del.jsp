<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>供应商</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<jsp:useBean id="supplier" scope="page" class="BookShop.MyDb" /></head>
</head>
<%
	int idsupplier=Integer.parseInt((String)request.getParameter("idsupplier"));
	String sqld="DELETE FROM supplier WHERE idsupplier="+idsupplier;
	int temp=-2;
	temp=supplier.update(sqld);
	if(temp>0){
		response.sendRedirect("supplier.jsp");
	}else{
		out.println("<script>alert('删除失败');window.close();</script>");
	}
%>
</html>
