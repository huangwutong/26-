<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<%@ taglib uri="/struts-tags" prefix="s" %>

<jsp:useBean id="project_category" class="com.ascent.pojo.ProjectCategory" scope="request"></jsp:useBean>
<jsp:useBean id="unit" class="com.ascent.pojo.Unit" scope="request"></jsp:useBean>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<base href="<%=basePath%>">
<title>科技项目申报系统</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="Your website description goes here" />
<meta name="keywords" content="your,keywords,goes,here" />
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
<li><a href="./zhinan.jsp">申报指南</a></li>
<li><a href="./login.jsp">项目申报</a></li>
<li><a href="./lianxi.jsp">联系我们</a></li>
<li></li>
</ul>
</div>

</div>
<div id="container" ><div id="content2">
<table width="100%" height="30"  border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="15" height="15" align="left" valign="top"><div align="left"></div></td>
      <td width="385" align="left" valign="bottom" class="12">&nbsp;</td>
    </tr>
	<tr><td height="15" align="left" valign="top">&nbsp;</td>
      <td height="15" align="left" valign="top" class="12">
	  <table width="100%" height="15" border="0" cellpadding="0" cellspacing="0">
	  <tr><td height="20" align="center"><div class="right_proaducts">
        <div align="left">我的位置&gt;&gt;科技项目申报&gt;申请项目信息</div>
      </div>
      <form namespace="/unit" action="./unit/AddProject.action?id=<s:property value="#session.unit.unit.unitid"/>" method="post" id="form">
	  <DIV class=padding><DIV id=middlebody>
	   <table cellspacing="0" cellpadding="0" width="100%" border="0"><tbody>
	    <tr><td><div align="left">|&nbsp;&nbsp;欢迎,单位用户<s:property value="#session.unit.username"/>&nbsp;&nbsp;|&nbsp;&nbsp;
	  <a class="table_t"  href="../index.html">注销</a>&nbsp;&nbsp;|&nbsp;&nbsp;
	  <a href="javascript:history.go(-1)">后退</a>&nbsp;&nbsp;|</div></td>
         <td><div align="center"><a href="./unit/informationAction.action?id=<s:property value="#session.unit.unit.unitid"/>">单位信息</a></div></td>
                      <td><div align="center"><a href="./unit/reworkpassword.jsp">修改密码</a></div></td>
                      <td><div align="center"><a href="./unit/FindAllProjectCategory.action">项目申报管理</a></div></td>
                      <td height="50"><div align="center"><a href="./unit/simpleSearchjsp.action">信息查询</a></div></td>
                      </tr></tbody></table>
                   
                 
                <table width="60%" border="0" cellpadding="0" cellspacing="1">
                 
                  <tbody>
                    <tr>
                     <td width="126" align="right" bgcolor="#f3f3f3">项目分类名称</td>
                      <td width="10" align="right" bgcolor="#f3f3f3">&nbsp;</td>
                      <td colspan="2" bgcolor="#f3f3f3">
                      <div align="left"><s:property value="#category.categoryname"/>
                      </div></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#f3f3f3">项目名称</td>
                      <td align="right" bgcolor="#f3f3f3">&nbsp;</td>
                      <td colspan="2" bgcolor="#f3f3f3"><div align="left">
                        <input id="projectname" name="project.projectname" />
                      </div></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#f3f3f3">申请单位</td>
                      <td align="right" bgcolor="#f3f3f3">&nbsp;</td>
                      <td colspan="2" bgcolor="#f3f3f3"><div align="left">
                      <s:property value="#session.unit.unit.unitname"/>
                      
                        
                      </div></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#f3f3f3">申请人</td>
                      <td align="right" bgcolor="#f3f3f3">&nbsp;</td>
                      <td colspan="2" bgcolor="#f3f3f3"><div align="left">
                        <input id="applicant" name="project.applicant" />
                      </div></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#f3f3f3">职称</td>
                      <td align="right" bgcolor="#f3f3f3">&nbsp;</td>
                      <td colspan="2" bgcolor="#f3f3f3"><div align="left">
                        <input id="grade" name="project.grade" />
                      </div></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#f3f3f3">学历</td>
                      <td align="right" bgcolor="#f3f3f3">&nbsp;</td>
                      <td colspan="2" bgcolor="#f3f3f3"><div align="left">
                        <input id="education" name="project.education" />
                      </div></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#f3f3f3">申请时间</td>
                      <td align="right" bgcolor="#f3f3f3">&nbsp;</td>
                      <td colspan="2" bgcolor="#f3f3f3"><div align="left">
                        <input readonly="readonly" id="filldate" onfocus="setday(this)" name="project.filldate" value="<%=new java.util.Date().toString()%>"/>
                      </div></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#f3f3f3">项目现状</td>
                      <td align="right" bgcolor="#f3f3f3">&nbsp;</td>
                      <td colspan="2" bgcolor="#f3f3f3"><div align="left">
                        <input id="status" name="project.status" />
                      </div></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#f3f3f3">项目前景</td>
                      <td align="right" bgcolor="#f3f3f3">&nbsp;</td>
                      <td colspan="2" bgcolor="#f3f3f3"><div align="left">
                        <input id="future" name="project.future" />
                      </div></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#f3f3f3">重难点分析</td>
                      <td align="right" bgcolor="#f3f3f3">&nbsp;</td>
                      <td colspan="2" bgcolor="#f3f3f3"><div align="left">
                        <input id="analysis" name="project.analysis" />
                      </div></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#f3f3f3">研究方法</td>
                      <td align="right" bgcolor="#f3f3f3">&nbsp;</td>
                      <td colspan="2" bgcolor="#f3f3f3"><div align="left">
                        <input id="way" name="project.way" />
                      </div></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#f3f3f3">预计研究成果</td>
                      <td align="right" bgcolor="#f3f3f3">&nbsp;</td>
                      <td colspan="2" bgcolor="#f3f3f3"><div align="left">
                        <input id="result" name="project.result" />
                      </div></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#f3f3f3">申请资金</td>
                      <td align="right" bgcolor="#f3f3f3">&nbsp;</td>
                      <td colspan="2" bgcolor="#f3f3f3"><div align="left">
                        <input id="capital" name="project.capital" />
                      </div></td>
                    </tr>
                    <tr>
                      <td colspan="2" align="right" bgcolor="#f3f3f3">&nbsp;</td>
                      <td width="70" bgcolor="#f3f3f3"><div align="left">
                        <input name="submit3" type="submit" value="申请" />
                      </div></td>
                      <td width="239" bgcolor="#f3f3f3"><div align="left">
                        <input name="reset" type="reset" value="重置" />
                      </div></td>
                    </tr>
                  </tbody>
                </table>
                <div></div>
              </form></td>
        </tr></table>
        <br/><div class="table_wz"></div></td>
    </tr></table>
<br><br>
</div>
</div>
<div id="container" >
  <div id="footer">
<p><a href="http://www.ascenttech.com.cn/" target="_blank">版权所有：北京亚思晟商务科技有限公司 &copy;2004-2008|京ICP备05005681</a></p>
</div>

</div>
</body>
</html>