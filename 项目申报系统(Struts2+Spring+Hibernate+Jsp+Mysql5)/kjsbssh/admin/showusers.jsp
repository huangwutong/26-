<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<base href="<%=basePath%>" />
<title>科技项目申报系统</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="Your website description goes here" />
<meta name="keywords" content="your,keywords,goes,here" />
<link rel="stylesheet" href="./css/andreas08(blue).css" type="text/css" media="screen,projection" />
</head>

<body>
<div id="container" >

<div id="header";>
</div>

<div id="navigation">
<ul>
<li class="selected"></li>
<li><a href="./index.jsp">首页</a></li>
<li><a href="./jieshao.jsp">系统介绍</a></li>
<li><a href="./zhinan.jsp">审报指南</a></li>
<li><a href="./login.jsp">项目申报</a></li>
<li><a href="./lianxi.jsp">联系我们</a></li>
<li></li>
</ul>
</div>

</div>
<div id="container" >
  <div id="content2">
    <table width="100%" height="41"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="15" height="18" align="left" valign="top"><div align="left"></div></td>
      <td width="385" align="left" valign="bottom" class="12">&nbsp;</td>
    </tr>
    <tr>
      <td height="4" colspan="2" align="left" valign="bottom"></td>
    </tr>
    <tr>
      <td height="15" align="left" valign="top">&nbsp;</td>
      <td height="15" align="left" valign="top" class="12"><table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="20"><div class="right_proaducts">我的位置&gt;&gt;科技项目申报&gt;登录用户列表<br />
                    <br />
          </div>
                <form action="" method="post" id="form" namespace="/admin">
                  <DIV class=padding>
                  <DIV id=middlebody>
                  <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tbody>
                      <tr>
	                <td><div align="left">|&nbsp;&nbsp;欢迎,<s:property value="user.name"/>&nbsp;&nbsp;|&nbsp;&nbsp;
	                   <a  class="table_t"  href="./index.jsp">注销</a>&nbsp;&nbsp;|&nbsp;&nbsp;
	                   <a href="javascript:history.go(-1)">后退</a>&nbsp;&nbsp;|</div></td>
                        <td><div align="center"><a 
      href="./admin/UserListAction.action">登录用户管理</a></div></td>
                        <td><div align="center"><a 
      href="./admin/ShowAllExperts.action">专家信息管理</a></div></td>
                        <td height="50"><div align="center"><a 
      href="./admin/ShowAllUnits.action">单位信息管理</a></div></td>
                        <td><div align="center"><a 
      href="./category/ShowAllProjectCategorys.action">项目管理</a></div></td>
                      </tr>
                    </tbody>
                  </table>
                  <table class="mars" cellspacing="1" cellpadding="0" width="100%" border="0">
                    <tbody>
                      <tr bgcolor="#fba661" height="30">
                        <td><div align="center">登录名</div></td>
                        <td><div align="center">用户组</div></td>
                        <td><div align="center">删除</div></td>
                      </tr>
                      <s:iterator id="list" value="users" status="sta">
                      <s:if test="#sta.even==true">
                        <tr bgcolor="#04faff">
                      </s:if>
                      <s:else>
                        <tr bgcolor="#e4f1fe">
                      </s:else>
                        <td bgcolor="#f3f3f3"><div align="center"><s:property value="username"/></div></td>
                        <td bgcolor="#f3f3f3"><div align="center"><s:property value="usergroup.gname" /></div></td>
                        
                        <td bgcolor="#f3f3f3"><div align="center"><a href="./admin/DeleteUserAction.action?id=<s:property value="uid"/>">删除</a>&nbsp;<a href="./admin/DisplayUpdateUser.action?id=<s:property value="uid"/>">编辑</a></div></td>
                      </tr>
                      </s:iterator>
                      <tr bgcolor="#e4f1fe">
                        <td bgcolor="#f3f3f3" colspan="3"><div align="center">                        
                         <s:iterator value="total">
                          <a href="./admin/FindAllUser.action?pageno=<s:property/>"><s:property/></a>
                         </s:iterator>
                        </div></td>
                      </tr>
                      <tr bgcolor="#e4f1fe">
                        <td bgcolor="#f3f3f3" colspan="3"><div align="center"><a href="./admin/adduser.jsp">添加用户</a></div></td>
                      </tr>
                    </tbody>
                  </table>
                  <div>
                    <div align="right"><a href="./admin/adduser.jsp"></a></div>
                  </div>
                </form></td>
        </tr>
      </table>
          <br/>
          <div class="table_wz"></div></td>
    </tr>
  </table>
</div>
</div>
<div id="container" >
  <div id="footer">
<p><a href="http://www.ascenttech.com.cn/" target="_blank">版权所有：北京亚思晟商务科技有限公司 &copy;2004-2008|京ICP备05005681</a></p>
</div>

</div>
</body>
</html>