<%@ page contentType="text/html; charset=gbk" buffer="20kb"language="java" import="java.io.*" %>
	<% 
	  if(request.getAttribute("error")!=null)
	  {
		  String str = (String)request.getAttribute("error");
		  out.println(str);
	  }	
	%>
	<p>
<a href="index.jsp">首页</a><br/>
<A href="<%=request.getContextPath()%>/Register?action=confirm">重新注册</A>
<p> <a href="javascript:history.back();"> &lt;&lt;后退</a> </p>
	