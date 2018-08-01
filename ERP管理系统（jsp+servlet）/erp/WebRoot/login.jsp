<%@ page contentType="text/html;charset=utf-8" errorPage="error.jsp"%>
<%@ include file="page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>..::和鼎CRM系统::..</title>
<link href="css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/crm.js"></script>
<script type="text/javascript" language="JavaScript">
var cuser;
function chickuser()
{
	if(login.userName.value.length==0)
	{
		document.getElementById('error').innerHTML="用户名长度不正确";
		document.login.userName.focus();
	}
	else
	{
    	cuser=new ActiveXObject("Msxml2.XMLHTTP");
    	cuser.onreadystatechange=getuser;
    	var url="loginChickUserName?userName="+login.userName.value;
    	cuser.open("GET",url,true);
    	cuser.setRequestHeader("If-Modified-Since","0");
    	cuser.send(null);
    }
}
function getuser()
{
    if(cuser.readyState==4)
    {
        if(cuser.status==200)
        {
        	var str = cuser.responseText;
        	if(str=="yes")
        	{
        		var user = login.userName.value;
        		document.getElementById('user').innerHTML="&nbsp;&nbsp;<input type='text' class='username' maxlength='20' value='"+user+"' readonly='true'/>";
        		document.getElementById('error').innerHTML="用户名已锁定,请输入密码";
        		document.login.password.focus();
        	}
        	if(str=="error")
        	{
        		document.getElementById('error').innerHTML="系统故障,请重试或联系管理员";
        		document.login.userName.focus();
        	}
        	if(str=="no")
        	{
        		document.getElementById('error').innerHTML="用户名不存在,请核对你输入的用户名";
        		document.login.userName.focus();
        	}
        	if(str=="out")
        	{
        		document.getElementById('error').innerHTML="你的用户名多次输入不正确,请确定后再登陆";
        		document.getElementById('user').innerHTML="&nbsp;&nbsp;<input type='text' class='username' maxlength='20' readonly='true'/>";
        		document.getElementById('pwd').innerHTML="&nbsp;&nbsp;<input type='text' class='username' maxlength='20' readonly='true'/>";
        		document.getElementById('val').innerHTML="&nbsp;&nbsp;<input type='text' class='validateCode' maxlength='20' readonly='true'/>";
        	}
        }
    }
}
var cpwd;
function chickpwd()
{
	if(login.password.value.length<5)
	{
		document.getElementById('error').innerHTML="密码长度不正确";
	}
	else
	{
    	cpwd=new ActiveXObject("Msxml2.XMLHTTP");
    	cpwd.onreadystatechange=getpwd;
    	var url="loginChickPwd?pwd="+login.password.value;
    	cpwd.open("GET",url,true);
    	cpwd.setRequestHeader("If-Modified-Since","0");
    	cpwd.send(null);  
    } 
}
function getpwd()
{
    if(cpwd.readyState==4)
    {
        if(cpwd.status==200)
        {
        	var str = cpwd.responseText;
        	if(str=="yes")
        	{
        		var pwd = login.password.value;
        		document.getElementById('pwd').innerHTML="&nbsp;&nbsp;<input type='password' class='username' value='"+ pwd +"' readonly='true'/>";
        		document.getElementById('error').innerHTML="密码已锁定,请输入验证码";
        		document.login.validate.focus();
        	}
        	if(str=="no")
        	{
        		document.getElementById('error').innerHTML="密码不正确,请确认密码";
        		document.login.password.focus();
        	}
        	if(str=="out")
        	{
        		document.getElementById('error').innerHTML="你的密码多次输入不正确,请确定后再登陆";
        		document.getElementById('user').innerHTML="&nbsp;&nbsp;<input type='text' class='username' maxlength='20' readonly='true'/>";
        		document.getElementById('pwd').innerHTML="&nbsp;&nbsp;<input type='text' class='username' maxlength='20' readonly='true'/>";
        		document.getElementById('val').innerHTML="&nbsp;&nbsp;<input type='text' class='validateCode' maxlength='20' readonly='true'/>";
        	}
        	if(str=="warn")
        	{
        		document.getElementById('error').innerHTML="请先输入用户名";
        		document.login.userName.focus();
        	}
        }
    }
}
var par;
function lpar()
{
    par=new ActiveXObject("Msxml2.XMLHTTP");
    par.onreadystatechange=gpar;
    var url="loginParameter";
    par.open("GET",url,true);
    par.setRequestHeader("If-Modified-Since","0");
    par.send(null);  
}
function gpar()
{
    if(par.readyState==4)
    {
        if(par.status==200)
        {
        	
        }
    }
}
</script>
</head>
<body onload="document.login.userName.focus();lpar()">
<div id="login_win">
  <div class="header"></div>
    <div class="login_body">
      <form method="post" name="login" action="login">
        <div class="line">
          <label>用户名：<span id="user">
          	<input name="userName" type="text" class="username" id="userName" maxlength="20" onblur="chickuser();"/>
          	</span>
		  </label>
        </div>
        <div class="line">
          <label>密　码：<span id="pwd">
          	<input name="password" type="password" class="username" maxlength="20" id="password" />
          	</span>
          </label>
        </div>
        <div class="line">
          <label>验证码：<span id="val">
            <input type="text" name="validate" id="validate" maxlength="4" class="validateCode" onfocus="chickpwd();"/>
            </span>
          </label>
			<img src="page/validate.jsp"/></div>
        <div class="sumbit_div"><input name="Submit" value="Submit" type="image" src="images/1.png"/></div>
        <span id="error"></span>${requestScope.error }
      </form>      
  	</div>
</div>
</body>
</html>
<script language="javascript" type="text/javascript">
	var positionLogin = dean.centerPosition("login_win",203);
</script>