<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
 
<html> 
	<head>
		<title>JSP for RegisterForm form</title>
	</head>
	<body>
		<h1>�û�ע��</h1>
		<html:form action="/register?method=register">
			�û��� : <html:text property="userName"/><html:errors property="userName"/><br/>
			���� : <html:text property="age"/><html:errors property="age"/><br/>
			<html:submit value="ע��"/><html:reset value="����"/>
		</html:form>
	</body>
</html>

