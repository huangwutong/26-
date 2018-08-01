<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

    <base href="<%=basePath%>">
  <head>
<title>科技项目申报系统</title>
<meta http-equiv="content-type" content="text/html; charset=GB2312" />
<meta name="description" content="Your website description goes here" />
<meta name="keywords" content="your,keywords,goes,here" />
<link rel="stylesheet" href="../css/andreas08(blue).css" type="text/css" media="screen,projection" />
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
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
<div id="container" ><div id="content2"><table width="100%" height="41"  border="0" align="center" cellpadding="0" cellspacing="0"><tr><td width="15" height="18" align="left" valign="top"><div align="left"></div></td>
      <td width="385" align="left" valign="bottom" class="12">&nbsp;</td>
    </tr><tr><td height="4" colspan="2" align="left" valign="bottom">&nbsp;</td>
    </tr><tr><td height="15" align="left" valign="top">&nbsp;</td>
      <td height="15" align="left" valign="top" class="12"><table width="100%" height="20" border="0" cellpadding="0" cellspacing="0"><tr><td height="20"><div class="right_proaducts">我的位置&gt;&gt;科技项目申报&gt;项目列表<br />
        <br /></div>
              <form action="" method="post" id="form"><DIV class=padding><DIV id=middlebody><table cellspacing="0" cellpadding="0" width="100%" border="0"><tbody>
			<tr><td><div align="left">|&nbsp;&nbsp;欢迎,专家用户<s:property value="#session.expert.expert.name"/>&nbsp;&nbsp;|&nbsp;&nbsp;<a 
      class="table_t"  href="./index.jsp">注销</a>&nbsp;&nbsp;|&nbsp;&nbsp;
	  <a href="javascript:history.go(-1)">后退</a>&nbsp;&nbsp;|</div></td>
                      <td><div align="center"><a 
      href="./expert/DisplayExpertInfo.action?id=<s:property value="#session.expert.expert.expertid"/>">专家信息</a></div></td>
                      <td><div align="center"><a 
      href="./expert/UpdatePassword.action?id=<s:property value="#session.expert.expert.expertid"/>">修改密码</a></div></td>
                      <td height="50"><div align="center"><a 
      href="./expert/ShowProjectCategorys.action">项目管理</a></div></td>
                      </tr></tbody></table>
                <table width="100%" border="0" cellpadding="0" cellspacing="1">
                  <tbody>
                    <tr>
                      <td width="10%" align="center" valign="middle" bgcolor="#fba661">编号</td>
                      <td width="40%" align="center" valign="middle" bgcolor="#fba661">项目名称</td>
                      <td width="10%" align="center" valign="middle" bgcolor="#fba661">申请人</td>
                      <td width="20%" align="center" valign="middle" bgcolor="#fba661">申报时间</td>
                      <td width="10%" align="center" valign="middle" bgcolor="#fba661">状态</td>
                      <td width="10%" align="center" valign="middle" bgcolor="#fba661">查看审批</td>
                    </tr>
                    <s:iterator value="projects" status="sta">
                    <tr>
                      <td align="center" valign="middle" bgcolor="#f3f3f3">projectId</td>
                      <td align="center" valign="middle" bgcolor="#f3f3f3">projectname</td>
                      <td align="center" valign="middle" bgcolor="#f3f3f3">applicant</td>
                      <td align="center" valign="middle" bgcolor="#f3f3f3">fillDate</td>
                      <td align="center" valign="middle" bgcolor="#f3f3f3">status</td>
                      <td align="center" valign="middle" bgcolor="#f3f3f3">&nbsp;</td>
                    </tr>
                    </s:iterator>
                  </tbody>
                </table>
                <div></div>
              </form></td>
        </tr></table>
        <br/><div class="table_wz"></div></td>
    </tr></table>
</div>
</div>
<div id="container" >
  <div id="footer">
<p><a href="http://www.ascenttech.com.cn/" target="_blank">版权所有：北京亚思晟商务科技有限公司 &copy;2004-2008|京ICP备05005681</a></p>
</div>

</div>
</body>
</html>