<%

  if(session.getAttribute("id") == null || session.getAttribute("id") == "")
  {
     throw new Exception("你还未登录或登录已过期，请登录！");
  }  

  String inc = session.getAttribute("inc").toString();
  String id = session.getAttribute("id").toString();
  String nickname = session.getAttribute("nickname").toString();
  
%>