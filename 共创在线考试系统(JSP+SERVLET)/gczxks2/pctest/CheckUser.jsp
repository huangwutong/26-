<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="jinghua.CheckUser" %>
<%@ page import="jinghua.*" %>
<%!//处理中文字符串
  public String codestring(String s){
		String str=s;
		try{
			byte b[]=str.getBytes("ISO-8859-1");
		  str=new String(b);
		  return str;
		}
		catch(Exception e){
		return str;
		}
	}
%>

<jsp:useBean id="login" class="jinghua.CheckUser" scope="session">
</jsp:useBean>
<%//提交信息后，验证是否正确
	String message="",
		  logrole="",
		  logname="",
		  password="";
	//if(!(session.isNew())){
		logrole=request.getParameter("logrole");
		if(logrole==null) logrole="";
		logrole=codestring(logrole);

		logname=request.getParameter("logname");
		if(logname==null) logname="";
		logname=codestring(logname);

		password=request.getParameter("password");
		if(password==null) password="";
		password=codestring(password);
	//}
%>

<%
	if(!(logname.equals(""))){
%>
<jsp:setProperty name="login" property="logrole" value="<%=logrole%>"/>
<jsp:setProperty name="login" property="logname" value="<%=logname%>"/>
<jsp:setProperty name="login" property="password" value="<%=password%>"/>

<%
	message=login.getMessage();//获取返回的验证信息
	if (message==null) message="";
	}
%>
<%
session.setMaxInactiveInterval(60*60);
//Tools.debugPrintln("session.setMaxInactiveInterval(60*60*2))");
if(!(session.isNew())){
	if(message.equals("OK"))  {

		  if(logrole.equals("teacher")){

		  		session.setAttribute("teacherID",login.getID() );
				//String questions=response.encodeUrl();
				response.sendRedirect("teacher/index-frames.jsp");
		  }
		  else if(logrole.equals("student")){

		  		session.setAttribute("studentID",login.getID());
				//String questions=response.encodeUrl();
				response.sendRedirect("student/mainpage/index-frames.jsp");
		 }
		 else if(logrole.equals("admin")){

		 		session.setAttribute("adminID",login.getID() );
		 		//String questions=response.encodeUrl();
				response.sendRedirect("admin/index-frames.jsp");

		 }



	}
	else{
        out.print(message);

		//String loginpage=response.encodeUrl("login.jsp");
		//response.sendRedirect(loginpage);
	}
}
%>




<html>
<head>
<title>
CheckUser
</title>
</head>
<body bgcolor="#ffffff">



<SCRIPT language="javascript">
	alert("用户名或密码错误，请重新登录");
	window.location = "login.jsp";
</SCRIPT>


<h1>

</h1>
</body>
</html>
