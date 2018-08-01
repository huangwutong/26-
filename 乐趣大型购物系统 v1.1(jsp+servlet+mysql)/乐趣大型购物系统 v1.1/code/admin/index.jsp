<%@ page contentType="text/html;charset=GB2312"%>
<html>
<head>
<title>管理员登陆</title>
<META http-equiv=Content-Type content=text/html; charset=gb2312>
<link rel=stylesheet href="css/admin.css" type=text/css>
<script language="JavaScript">
function submitForm()
{
  if(document.form.id.value.length==0){
    alert("用户名不可以为空!");
    document.form.id.focus();
    return;
  }
  else if(document.form.pwd.value.length==0)
  {
    alert("密码不可以为空!");
    document.form.pwd.focus();
    return;
  }
  
  if(document.form.sysid.value=="01")
   {
     document.form.action="news/login.jsp";
   }
   
  if(document.form.sysid.value=="02")
   {
     document.form.action="shop/login.jsp";
   }   
    
  document.form.submit();

}
function onKeydown()
{
  if(event.keyCode==13)
    submitForm();
}
function modpwd(){
	var newwin = window.open("modpwd.html","修改密码","toolbar=no,status=no,menubar=no,resizable=no,scrollbars=yes,width=400,height=250,top=100,left=150");
	newwin.focus();
}
</script>
</head>
<%
 session.invalidate(); 
%>
<body  topmargin=0 leftmargin=0 onKeydown="onKeydown()">
<br><br><br>
<form method=post name="form">
<table style="width:65%" border=0 cellspacing=1 cellpadding=3  align=center class=tableBorder>
    <tr>
    <th  valign=middle colspan=2 height=25>管理员登陆</th></tr>
    <tr>
    <td valign=middle class=Forumrow width=40%>用户名</td>
    <td valign=middle class=Forumrow><input type="text" name="id" size="30"></td></tr>
    <tr>
    <td valign=middle class=Forumrow>密码</font></td>
    <td valign=middle class=Forumrow><input type="password" name="pwd" size="30"></td></tr>
    <tr>
    <tr>
    <td valign=middle class=Forumrow>进入系统</font></td>
    <td valign=middle class=Forumrow>
    <select name="sysid">
    <option value="01">新闻管理系统</option>   
    <option value="02">购物系统</option>     
    </select>
    </td></tr>
    <tr>    
    <td valign=middle colspan=2 align=center class=forumRow>
  <input type="button" value="  提 交  " name="B1" onclick="submitForm()">
	</td></tr></table></form>
</body>
</html>