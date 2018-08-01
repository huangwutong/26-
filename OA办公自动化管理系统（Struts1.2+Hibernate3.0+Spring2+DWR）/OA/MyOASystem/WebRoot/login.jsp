<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>OA系统登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<style type="text/css">
	body{
FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#82c0d4,endColorStr=#ffffff);
overflow-y:hidden;
}
.STYLE1 {
	font-size: 12px;
	font-family: "宋体";
	color: #333333;
}
</style>
<script type="text/javascript">
	window.onload=function(){
		var name=document.getElementById("user.loginName");
		name.focus();
	}
	function mysubmit(){
		var name=document.getElementById("user.loginName");
		var pwd=document.getElementById("user.password");
		if(name.value==""){
			alert("用户名不能为空！");
			name.focus();
			return;
		}
		if(pwd.value==""){
			alert("密码不能为空！");
			pwd.focus();
			return;
		}
		document.myform.submit();
	}
	
	function myclean(){
		var name=document.getElementById("user.loginName");
		var pwd=document.getElementById("user.password");
		name.value="";
		pwd.value="";
		name.focus();
	}
</script>
  </head>
  
  <body>
   <form action="index.php" method="post" name="myform">
<table border="0" align="center"  width="100%" height="100%">
<tr>
<td valign="middle" align="center">
<table id="__01" width="431" height="229" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="3">
			<img src="image/newlogin_01.jpg" width="53" height="87" alt=""></td>
		<td colspan="6">
			<img src="image/newlogin_02.jpg" width="378" height="87" alt=""></td>
	</tr>
	<tr>
		<td colspan="3" rowspan="2">
			<img src="image/newlogin_03.jpg" width="53" height="72" alt=""></td>
		<td colspan="5" valign="top" bgcolor="#FFFFFF">
        <table border="0" cellpadding="0" cellspacing="0">
        <tr><td height="30">
        <input type="text" name="user.loginName" value="${before.loginName}" style="font-size:14px; font-family:宋体; border:1px #999999 solid" height="10px"  size="17">
        </td></tr>
        <tr><td height="32">
        <input type="password" name="user.password" value="${before.password }" style="font-size:14px; font-family:宋体; border:1px #999999 solid" height="10px"  size="17">
        </td></tr></table>
        </td>
  <td rowspan="5">
			<img src="image/newlogin_05.jpg" width="246" height="117" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="image/newlogin_06.jpg" width="4" height="9" alt=""></td>
		<td colspan="4">
			<img src="image/newlogin_07.jpg" width="128" height="9" alt=""></td>
	</tr>
	<tr>
		<td colspan="2" rowspan="2">
			<img src="image/newlogin_08.jpg" width="45" height="23" alt=""></td>
		<td colspan="3">
		<!-- 登录 -->
			<img src="image/newlogin_09.jpg" style="cursor:hand" onClick="mysubmit()" width="51" height="19" alt=""></td>
		<td rowspan="2">
			<img src="image/newlogin_10.jpg" width="26" height="23" alt=""></td>
		<td>
		<!-- 重置 -->
			<img src="image/newlogin_11.jpg" style="cursor:hand" onClick="myclean()" width="48" height="19" alt=""></td>
		<td rowspan="2">
			<img src="image/newlogin_12.jpg" width="15" height="23" alt=""></td>
	</tr>
	<tr>
		<td colspan="2">
			<img src="image/newlogin_13.jpg" width="12" height="4" alt=""></td>
		<td>
			<img src="image/newlogin_14.jpg" width="39" height="4" alt=""></td>
		<td>
			<img src="image/newlogin_15.jpg" width="48" height="4" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2">
			<img src="image/newlogin_16.jpg" width="32" height="46" alt=""></td>
		<td colspan="7" bgcolor="#FFFFFF" width="153" height="22" >
		<!-- 显示错误信息 -->
		<span style="color:#FF3333">${requestScope.info }</span>
	   </td>
	</tr>
	<tr>
		<td colspan="3">
			<img src="image/newlogin_18.jpg" width="25" height="24" alt=""></td>
		<td colspan="3">
			<img src="image/newlogin_19.jpg" width="113" height="24" alt=""></td>
		<td colspan="2" background="image/newlogin_20.jpg" width="261" height="24" align="right">
        	<span class="STYLE1">作者：卢建业、梁肇威、梁浩华、向玉平</span>
		</td>
	</tr>
	<tr>
		<td>
			<img src="image/midlogin.gif" width="32" height="1" alt=""></td>
		<td>
			<img src="image/midlogin.gif" width="13" height="1" alt=""></td>
		<td>
			<img src="image/midlogin.gif" width="8" height="1" alt=""></td>
		<td>
			<img src="image/midlogin.gif" width="4" height="1" alt=""></td>
		<td>
			<img src="image/midlogin.gif" width="39" height="1" alt=""></td>
		<td>
			<img src="image/midlogin.gif" width="26" height="1" alt=""></td>
		<td>
			<img src="image/midlogin.gif" width="48" height="1" alt=""></td>
		<td>
			<img src="image/midlogin.gif" width="15" height="1" alt=""></td>
		<td>
			<img src="image/midlogin.gif" width="246" height="1" alt=""></td>
	</tr>
</table>
</td></tr></table></form>
  
 
 
  </body>
</html>
