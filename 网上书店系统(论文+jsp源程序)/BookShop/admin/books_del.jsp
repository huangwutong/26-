<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�������</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<jsp:useBean id="books" scope="page" class="BookShop.MyDb" /></head>
</head>
<%
	String idbook=(String)request.getParameter("idbook");
	String sqld="DELETE FROM books WHERE idbook='"+idbook+"'";
	int temp=-2;
	temp=books.update(sqld);
	if(temp>0){
		session.setAttribute("success","ɾ���ɹ�");
	}else{
		session.setAttribute("success","ɾ��ʧ��");
	}
		response.sendRedirect("books.jsp");
%>
</html>
