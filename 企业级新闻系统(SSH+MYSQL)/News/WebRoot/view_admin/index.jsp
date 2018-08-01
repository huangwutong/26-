<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view_admin/inc/publictag.jsp" %>
<html>
<head>
<title>首页</title>
</head>
<frameset frameborder="NO" border="0" framespacing="0" rows="*">
<frameset cols="180,*" frameborder="NO" border="0" framespacing="0">
<frame name="leftFrame" scrolling="AUTO" noresize src="/News/view_admin/admin_left.jsp?method=login_left" marginwidth="0" marginheight="0">
<frameset rows="28,100%,2"  framespacing="0" border="0" frameborder="0" frameborder="no" border="0">
<frame src="/News/view_admin/admin_top.jsp?method=login_top" name="head" scrolling="NO" NORESIZE frameborder="0" marginwidth="0" marginheight="0" border="no">
<frame name="main" src="/News/view_admin/admin_center.jsp?method=Login_in" NORESIZE frameborder="0" marginwidth="0" marginheight="0" border="no">
</frameset>
</frameset>
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>
