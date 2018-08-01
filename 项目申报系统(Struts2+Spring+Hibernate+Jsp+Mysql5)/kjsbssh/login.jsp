<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <base href="<%=basePath%>">
    
   <title>科技项目申报系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    
<link rel="stylesheet"  id="styles" href="./css/andreas08(blue).css" type="text/css" media="screen,projection" />
<script type="text/javascript" src="./js/acesys.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<div id="container" >

<div id="header";>
</div>

<div id="navigation">
<ul>
<li class="selected"></li>
<li><a href="index.jsp">首页</a></li>
<li><a href="jieshao.jsp">系统介绍</a></li>
<li><a href="zhinan.jsp">审报指南</a></li>
<li><a href="login.jsp">项目申报</a></li>
<li><a href="lianxi.html">联系我们</a></li>

</ul>
</div>

</div>
<div id="containerpic" >
  <div id="content">
<h2><strong>欢迎使用项目申报系统</strong></h2>


<div class="splitcontentleft">
  <div id="subcontent">

   <br><s:form action="/admin/UserLoginAction.action" method="post" name="login" namespace="/admin" validate="true" >
   
      <div class="small box">
        <s:fielderror/>
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr>
             <td width="15%" valign="middle"><img src="images\username.jpg" width="61" height="17" align="bottom" /></td>
            <td width="15%" valign="middle"><input name="user.username" id="username" type="text" size="7"/></td>
          </tr>
          <tr>
            <td valign="middle"><img src="images\password.jpg" width="61" height="17" /></td>
            <td valign="middle"><input name="user.password" id="password" type="password" size="6" /></td>
          </tr>
           <tr>
            <td height="30" colspan="2" valign="bottom"><input name="image" type="image" onclick="return checkLogin(form);" src="images\login_1_7.jpg" alt="登录" width="44" height="17" border="0"/>
             </td>
          </tr>
        </table>
      </div>
    </s:form>
    </div>
  <p>&nbsp;</p>

  </div>
</div>

</div>
<div id="container" >
  <div id="footer">
<p><a href="http://www.ascenttech.com.cn/" target="_blank">版权所有：北京亚思晟商务科技有限公司 &copy;2004-2008|京ICP备05005681</a></p>
</div>

</div>
</body>
</html>