<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
 
<html> 
	<head>
		<title>JSP for RegisterForm form</title>
	</head>
	<body>
		<h1>�û���¼</h1>
		<html:form action="/register?method=login">
			�û��� : <html:text property="userName"/><html:errors property="userName"/><br/>			
			<html:submit value="��¼"/><html:reset value="����"/>
			<a href="register.jsp">ע��</a>
		</html:form>
	</body>
</html>

