<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>科技项目申报系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" href="./css/andreas08(blue).css" type="text/css" media="screen,projection" />
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
<script type="text/javascript" src="./js/acesys.js"></script>
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
<li><a href="./lianxi.html">联系我们</a></li>
<li></li>
</ul>
</div>

</div>
<div id="container" ><div id="content2"><table width="100%" height="41"  border="0" align="center" cellpadding="0" cellspacing="0">
    </tr><tr><td height="4" colspan="2" align="left" valign="bottom"></td>
    </tr><tr><td height="15" align="left" valign="top">&nbsp;</td>
      <td height="15" align="left" valign="top" class="12"><table width="100%" height="20" border="0" cellpadding="0" cellspacing="0"><tr><td height="20" align="center"><div class="right_proaducts">
        <div align="left">我的位置&gt;&gt;科技项目申报&gt;单位信息</div>
      </div>
      <form action="./unit/UpdateUnitInfo.action?id=<s:property value="#unit.unitid"/>" method="post" id="form" namespace="/unit">
	  <DIV class=padding><DIV id=middlebody>
	  <table cellspacing="0" cellpadding="0" width="100%" border="0"><tbody>
	               <tr>
				   <td><div align="left">|&nbsp;&nbsp;欢迎,单位用户&nbsp;&nbsp;|&nbsp;&nbsp;
	  <a  class="table_t"  href="./index.jsp">注销</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:history.go(-1)">后退</a>&nbsp;&nbsp;|</div></td>
                      <td><div align="center"><a href="./unit/informationAction.action?id=<s:property value="#unit.unitid"/>"/>单位信息</a></div></td>
                      <td><div align="center"><a href="./unit/reworkpasswordjsp.action">修改密码</a></div></td>
                      <td><div align="center"><a href="./unit/showprojectCategorysAction.action">项目申报管理</a></div></td>
                      <td height="50"><div align="center"><a href="./unit/simpleSearchjsp.action">信息查询</a></div></td>
                      </tr></tbody></table>
        <s:fielderror/>
                <table width="80%" border="0" cellpadding="0" cellspacing="1">
                  <tbody>
                    <tr>
                      <td width="40%" height="31" align="middle" bgcolor="#f3f3f3">单位名称</td>
                      <td width="60%" align="left" bgcolor="#f3f3f3"><div align="left">
                        <input id="unitname" value="<s:property value="#unit.unitname"/>" name="unit.unitname" />
                      </div></td>
                    </tr>
                    <tr>
                      <td align="middle" bgcolor="#f3f3f3">单位地址</td>
                      <td width="60%" align="left" bgcolor="#f3f3f3"><input id="address" value="<s:property value="#unit.address"/>" name="unit.address" />
                      </td>
                    </tr>
                    <tr>
                      <td align="middle" bgcolor="#f3f3f3">单位法人</td>
                      <td align="left" bgcolor="#f3f3f3">
<input id="corporation" value="<s:property value="#unit.corporation"/>" name="unit.corporation" />
                      </td>
                    </tr>
                    <tr>
                      <td align="middle" bgcolor="#f3f3f3">注册资金</td>
                      <td align="left" bgcolor="#f3f3f3">
<input id="investment" value="<s:property value="#unit.investment"/>" name="unit.investment" />
                      </td>
                    </tr>
                    <tr>
                      <td align="middle" bgcolor="#f3f3f3">单位性质</td>
                      <td align="left" bgcolor="#f3f3f3">
<input id="type" value="<s:property value="#unit.type"/>" name="unit.type" />
                      </td>
                    </tr>
                    <tr>
                      <td align="middle" bgcolor="#f3f3f3">单位电话</td>
                      <td align="left" bgcolor="#f3f3f3">
<input id="tel" value="<s:property value="#unit.tel"/>" name="unit.tel" />
                      </td>
                    </tr>
                    <tr>
                      <td align="middle" bgcolor="#f3f3f3">单位邮箱</td>
                      <td align="left" bgcolor="#f3f3f3">
<input id="email" value="<s:property value="#unit.email"/>" name="unit.email" />
                      </td>
                    </tr>
                    <tr>
                      <td align="middle" bgcolor="#f3f3f3">单位传真</td>
                      <td align="left" bgcolor="#f3f3f3">
<input id="fax" value="<s:property value="#unit.fax"/>" name="unit.fax" />
                      </td>
                    </tr>
                    <tr>
                      <td align="middle" bgcolor="#f3f3f3">单位邮编</td>
                      <td align="left" bgcolor="#f3f3f3">
<input id="zipcode" value="<s:property value="#unit.zipcode"/>" name="unit.zipcode" />
                      </td>
                    </tr>
                    <tr>
                      <td align="middle" bgcolor="#f3f3f3">单位简介</td>
                      <td align="left" bgcolor="#f3f3f3">
<textarea id="introduction" name="unit.introduction" rows="3" cols="50"><s:property value="#unit.introduction"/></textarea>
                      </td>
                    </tr>
                    <tr>
                      <td align="middle" bgcolor="#f3f3f3">&nbsp;</td>
                      <td align="left" bgcolor="#f3f3f3"><input id="submit" type="submit" value="修改" name="submit2" />
                          <input id="button2" type="reset" value="取消" name="button2" /></td>
                    </tr>
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
