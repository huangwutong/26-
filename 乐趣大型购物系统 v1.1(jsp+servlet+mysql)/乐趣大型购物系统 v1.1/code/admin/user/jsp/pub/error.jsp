<%@ page contentType="text/html;charset=gb2312" %>
<%@ page isErrorPage="true" %>
<% 
      String s_exception = "";
      if (exception != null) {
	      s_exception = exception.toString();
	      int i = s_exception.indexOf(":");
	      s_exception = s_exception.substring(i+1);
      }
 %>
 
<%=s_exception%> 