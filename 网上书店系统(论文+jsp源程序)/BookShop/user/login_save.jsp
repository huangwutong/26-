<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>��Ա��¼</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="login" class="BookShop.MyDb" scope="page"/>
</head>
<%  
	//��ȡ��¼����
	String id=(String)request.getParameter("id");
	String password=(String)request.getParameter("password");
	//ת��
	id=login.inStr(id);
	password=login.inStr(password);
	//��֤
	String sqls="select * from customers where idcustomer='"+id+"' and password='"+password+"'";
	int temp=-2;
	temp=login.select(sqls);
	if(temp>0){
		session.setAttribute("id",id);
		response.sendRedirect("login_ok.jsp");
	}else{
		session.setAttribute("error","���������û���������");
		response.sendRedirect("../error/errorpage.jsp");
	}
%>
</html>