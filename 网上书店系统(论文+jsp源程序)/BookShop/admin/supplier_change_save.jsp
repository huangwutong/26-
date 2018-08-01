<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>修改供应商</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<jsp:useBean id="supplier" scope="page" class="BookShop.MyDb" /></head>
</head>
<%
	String idsupplier=(String)request.getParameter("idsupplier");
	String suppliername=(String)request.getParameter("suppliername");
	String sname=(String)request.getParameter("sname");
	String phone=(String)request.getParameter("phone");
	String address=(String)request.getParameter("address");
		suppliername=supplier.inStr(suppliername);
		sname=supplier.inStr(sname);
		phone=supplier.inStr(phone);
		address=supplier.inStr(address);
	String sqli="UPDATE supplier SET suppliername='"+suppliername+"',sname='"+sname+"',phone='"+phone+"',address='"+address+"' WHERE idsupplier="+idsupplier;
	int temp=-2;
		temp=supplier.update(sqli);
	if(temp>0){
		response.sendRedirect("supplier.jsp");
	}else{
		session.setAttribute("error","修改失败");
		response.sendRedirect("../error/errorpage.jsp");
	}
%>
</html>
