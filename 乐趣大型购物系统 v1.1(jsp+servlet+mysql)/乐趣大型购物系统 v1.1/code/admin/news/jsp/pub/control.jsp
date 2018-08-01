<%
  if(session.getAttribute("aid") == null || session.getAttribute("name") == "")
  {
     throw new Exception("你还未登录或登录已过期，请登录！");
  }
%>