<!--%@ page contentType="text/html;charset=gb2312" %-->
<!--% request.setCharacterEncoding("gb2312"); %-->
<%@ page errorPage="pubpage/errorPage.jsp" session="true" %>
<%@ page import="java.util.*"%>
<%@ page import="com.rich.project.pub.*"%>
<jsp:useBean id="user" scope="page" class="com.rich.project.user.User" />
<jsp:setProperty name="user" property="*" />

