<%@ page contentType="text/html;charset=gb2312" %>
<%@ page errorPage="pubpage/errorPage.jsp" session="true" %>
<jsp:useBean id="user" scope="page" class="com.rich.project.user.User" />
<jsp:setProperty name="user" property="*" />
<%@ page import="java.util.*"%>
<%
   String nextpage= request.getParameter("nextpage");
   String nextpar = request.getParameter("nextpar");
   String username = request.getParameter("username");
   String password = request.getParameter("password");
   Vector m_vct = user.login(username,password);  
   if(m_vct!=null&&m_vct.size()>0)
    {
        Vector t_vct =(Vector)m_vct.get(0);
        session.setAttribute("inc",t_vct.get(0));
        session.setAttribute("id",t_vct.get(1));
        session.setAttribute("nickname",t_vct.get(2));
        response.sendRedirect(nextpage+"?nextpar="+nextpar);    
    }
   else
    {
       %>
        输入的用户名/ID和密码不正确，请<a href=login.jsp><font color="red">重新</font></a>输入！
       <%    
    } 
%>