<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="net.acai.forum.*,
		 net.acai.forum.util.*"%>
<%
String username=ParamUtil.getString(request,"username");
String password=ParamUtil.getString(request,"password");
String erroMsg="";
if(username!=null&&password!=null)
	try
	{
		SkinUtil.login(request,response,username,password);
		response.sendRedirect("index.jsp");
	}
	catch(UserNotFoundException e)
	{
		erroMsg="������û���������";
		response.sendRedirect("login.jsp?"+response.encodeURL(erroMsg));
	}
else{
	out.println("����д����ĸ�����Ϣ!");
}
%>