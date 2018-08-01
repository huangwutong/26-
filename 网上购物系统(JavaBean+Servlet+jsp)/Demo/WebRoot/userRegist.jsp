<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'regist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script type="text/javascript">
  function checkField()
  {
  	if(document.register.uname.value=="")
  		{
  		alert("请输入你的用户名");
  		
  		document.register.uname.focus();
  		return false;
  		}
  	if(document.register.passwd.value=="")
  		{
  		alert("密码不能为空");
  		document.register.passwd.focus();
  		return false;
  		}
  	if(document.register.passwd.value.length < 6 )
  		{
  		alert("密码长度不能小于6");
  		document.register.passwd.focus();
  		return false;
  		}
  	if(document.register.passwd2.value=="")
  		{
  		alert("确认密码不能为空");
  		document.register.passwd2.focus();
  		return false;
  		}
  	if(document.register.passwd2.value!=document.register.passwd.value)
  		{
  		alert("两次输入密码不一致");
  		document.register.passwd2.focus();
  		return false;
  		}
  	if(document.register.usermail.value!="")
  	{
  		if(check_email(document.register.usermail.value) == false)
		{
		    alert("请检查你的EMAIL格式!")
		    document.register.usermail.focus();
			return false;
         }
  		}
  	
  	
  		document.register.submit();
  }
  function check_email(check_obj){
    
      if(check_obj.search(/^[\w-]+@[\w-]+\.[A-Za-z0-9]{2,}$/)>=0){
        return true;
      }else{
        return false;
      }
	 }
		
	function checkUname()
	{
		var uname=document.register.uname.value;
		location.href="checkUname?uname="+uname;
	}
  </script>
  
  <body>
  <body bgcolor="#eeffff">
  <center>
<table width="600" border="0">
  <tr bordercolor="#CCCCCC" bgcolor="#6699FF">
    <td width="590" height="124"><center><font color="red" size=10>用户注册</font></center></td>
  </tr>
</table>
<form name="register" method="post" action="userRegist">
  <table width="600" border="1" bordercolor="#CCFF99">
    <tr bgcolor="#99CCFF">
      <td colspan="3" align="center"><span class="style4">为了给你提供真诚的服务，请填写真实的资料</span></td>
    </tr>
    <tr bgcolor="#99CCFF">
      <td width="147"><div align="center" class="style4"><FONT color=#cc0000>*</FONT> 用 户 名：</div></td>
      <td width="601">
        <div align="left" class="style4">
          <input type="text" name="uname" value="${uname}" >
          <input type="button" onclick="checkUname()" value="检查用户名" >
          ${message}
      请使用英文和数字， 并以英文开头</div></td>
      
    </tr>
    <tr bgcolor="#99CCFF">
      <td width="147"><div align="center" class="style4"><FONT color=#cc0000>*</FONT> 密　　码：</div></td>
      <td>
        <div align="left" class="style4">
          <input type="password" name="passwd" maxlength="20" >
      请使用6-20位</div></td>
    </tr>
    <"stygcolor="#99CCFF">
      <td width="147"><div align="center" class="style4"><FONT color=#cc0000>*</FONT> 确认密码：      </div></td>
      <td>
        <div align="left" class="style4">
          <input type="password" name="passwd2" maxlength="20" >
      重新输入一次密码</div></td>
    </tr>
    <tr bgcolor="#99CCFF">
      <td width="147"><div align="center" class="style4"> 性　　别：</div></td>
      <td><div align="left" class="style4">
        <p>
          <input type="radio" name="usex" value="男">
          　男
          　　
          <input type="radio" name="usex" value="女">
          女
</p>
      </div></td>
    </tr>
    <tr bgcolor="#99CCFF">
      <td width="147"><div align="center" class="style4">兴趣爱好：</div></td>
      <td><div align="left" class="style4">
        <p>
      
          <input type="checkbox" name="uinterest"  value="计算机硬件"  />
  计算机硬件 　
  <input type="checkbox" name="uinterest" value="计算机软件" />
  　计算机软件　　
  <input type="checkbox" name="uinterest" value="体育" />
  　　体育 </p>
        <p>
          <input type="checkbox" name="uinterest" value="网络游戏" />
  网络游戏　 　
  <input type="checkbox" name="uinterest" value="读书" />
  　读书　　　　　
  <input type="checkbox" name="uinterest" value="旅游" />
  　　旅游</p>
      </div></td>
    </tr>
    <tr bgcolor="#99CCFF">
      <td width="147"><p align="center" class="style4">e-mail</p>
      </td>
      <td><div align="left" class="style4">
        <input type="text" name="usermail">
      </div></td>
    </tr>
    <tr bgcolor="#99CCFF">
      <td width="147"><p align="center" class="style4">用户地址</p>
      </td>
      <td><div align="left" class="style4">
        <input type="text" name="address">
      </div></td>
    </tr>
    <tr bgcolor="#99CCFF">
      <td width="147"><p align="center" class="style4">用户电话</p>
      </td>
      <td><div align="left" class="style4">
        <input type="text" name=telephone>
      </div></td>
    </tr>
    <tr bgcolor="#99CCFF" >
      <td width="147"><p align="center" class="style4">用户所在城市</p>
      </td>
      <td><div align="left" class="style4">
        <input type="text" name=city>
      </div></td>
    </tr>
    <tr bgcolor="#99CCFF">
      <td width="147"><div align="left" class="style4">
        <div align="right">
          <input type="submit"  value="提交" onclick="return checkField()">
        </div>
      </div></td>
      <td><div align="left" class="style4">
        <input type="reset" name="reset" value="重填">
      </div></td>
    </tr>
  </table>
</form>
 </center>
  </body>
</html>
