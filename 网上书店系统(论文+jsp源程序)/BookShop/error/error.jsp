<%@ page contentType="text/html; charset=gb2312" language="java" isErrorPage="true" %>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>异常处理</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
</head>
<body>
<h3>
	<ul><%=exception%></ul>
<pre>
	错误:<% exception.printStackTrace(new PrintWriter(out)); %>
</pre>
</body>
</html>
