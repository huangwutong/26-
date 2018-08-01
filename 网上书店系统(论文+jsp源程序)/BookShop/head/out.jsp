<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>阳光网上书屋</title>
</head>
<%
if (session.getAttribute("id")==null){
	out.println("<script>document.location='../error/errorpage.jsp';</script>");		
}
%>
</html>
