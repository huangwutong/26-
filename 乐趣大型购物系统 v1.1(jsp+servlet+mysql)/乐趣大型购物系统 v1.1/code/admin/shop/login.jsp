<%@ page errorPage="jsp/pub/errorException.jsp" session="true" %>		
<%@ page import="java.util.*" %>
<jsp:useBean id="mbean" scope="page" class="com.rich.project.admin.user.User" />
<%
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");
   String sysid = request.getParameter("sysid");
   Vector m_vct = mbean.login(id,pwd);  
   if(m_vct!=null&&m_vct.size()>0)
    {
       Vector t_vct = (Vector)m_vct.get(0);
       String name = t_vct.get(0).toString();
       session.setAttribute("aid",id);
       session.setAttribute("name",name); 
       session.setAttribute("sysid",sysid); 
       response.sendRedirect("main.jsp");          
    }
   else
    {
       throw new Exception("密码或用户名错误！");      
    } 
   
%>