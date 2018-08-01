<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/css.css">
	
	<script type="text/javascript" src="dwr/engine.js"></script>
	<script type="text/javascript" src="dwr/util.js"></script>
	<script type="text/javascript" src="dwr/interface/UserService.js"></script>
	
	
	<style type="text/css">
		td{border-color:#999999}
		body {
	
		background-image:url(image/bgpwd.jpg);
 		background-repeat:repeat-x;
 		}


	</style>
	
	<script type="text/javascript">
				function modifyPwd(){
		  
		  //显示内容层
		   var top=Math.round(document.body.clientHeight/2)-150;
		   var left=Math.round(document.body.clientWidth/2)-200;
			document.getElementById("divpwd").style.top=top;
			document.getElementById("divpwd").style.left=left;
			
			document.getElementById("divpwd").style.display="block";
			document.getElementById("wpwd").focus();
			//alert(document.body.clientHeight);
		  //显示背景层
		  var bodyBack = document.createElement("div");
			bodyBack.setAttribute("id","bodybg")
			bodyBack.style.position = "absolute";
			bodyBack.style.width = "100%";
			bodyBack.style.height ="100%";
			bodyBack.style.zIndex = 98;
			bodyBack.style.top = 0;
			bodyBack.style.left = 0;
			bodyBack.style.filter = "alpha(opacity=50)";
			bodyBack.style.opacity = 0.5;
			bodyBack.style.background = "#ddf";
			bodyBack.style.display="block";
			//把新创建的背景层插入到body
			var parent = document.getElementById("divpwd").parentNode;
			parent.appendChild(bodyBack);
		}
		
		//关闭层
		function closediv(){
			//清空文本框内容
			document.getElementById("wpwd").value="";
			document.getElementById("password").value="";
			document.getElementById("renewpwd").value="";
			
			document.getElementById("divpwd").style.display="none";
			document.getElementById("divpwd").parentNode.removeChild(document.getElementById("bodybg"));
		}
		
		//修改密码
		function mysubmit(){
			var truepwd=document.getElementById("pwd").value;
			var pwd=document.getElementById("wpwd").value;
			
			if(truepwd!=pwd){
				alert("原密码错误，请重新输入");
				document.getElementById("wpwd").select();
				document.getElementById("wpwd").focus();
				return ;
			}
			
			var newpwd=document.getElementById("password").value;
			var renewpwd=document.getElementById("renewpwd").value;
			if(newpwd!=renewpwd){
				alert("两次新密码不一致，请重新输入");
				document.getElementById("password").select();
				document.getElementById("password").focus();
				return;
			}
			
			if(newpwd=="" ||newpwd==null){
				alert("密码不能为空");
				document.getElementById("password").focus();
				return;
			}
			
			var user={userId:null,password:null};
			dwr.util.getValues(user);
			
			UserService.modifyPwd(user,callback);
			
		}
		//回调函数
		function callback(flag){
		
			if(flag==true){
				closediv();
				alert("修改成功！");
				location="user.do?operate=toIndividualInfo";
			}else{
				alert("修改失败!");
			}
		}
		
	</script>

	</head>
  
  <body>
  <p>
  <p>
  <br>
  <div id="divpwd" style=" position:absolute; padding:0; vertical-align:top;  z-index:99; border:0px; width:338px; height:173px;  display:none" >
  <table  align="left"  width="338" height="173" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td background="image/pwdtop_01.gif" valign="center" width="308" height="33">
			&nbsp;&nbsp;<img src="image/settings.gif">&nbsp;<font size="3">修改密码</font></td>
		<td>
			<img src="image/pwdtop_02.gif" onClick="closediv()" width="30" height="33" ></td>
	</tr>
	<tr>
		<td background="image/pwdtop_03.gif"  align="center" width="308" height="140">
		      <table  border="0" class="pwdfont"  align="left"cellpadding="0"  cellspacing="0">
		  		<tr><td width="149" ><div align="right">原密码：</div></td><td width="169" ><input type="password" name="wpwd"></td></tr>
		   		<tr><td > <div align="right">新密码：</div></td><td ><input type="password"  name="password"></td></tr>
		    	<tr><td ><div align="right">确认新密码：</div></td><td ><input type="password" name="renewpwd"></td></tr>
		     	<tr><td ></td><td ><input type="image" onClick="mysubmit()" src="image/pwdsubmit.jpg" value="提交"></td></tr>
		  	  </table>
		</td>
		<td>
			<img src="image/pwdtop_04.jpg" width="30" height="140" alt="">
		</td>
	</tr>
</table>
  
 	<input type="hidden" name="userId" value="${user.userId}">
  </div>
  <table class="pwdfont" align="center" style="border-color:#999999; color:#333333;"  width="268" border="1" cellspacing="0" cellpadding="4">
  <tr>
    <td colspan="2" align="center"><img src="image/person.jpg"></td>
    </tr>
  <tr>
    <td width="105"><div align="right">登陆帐号</div></td>
    <td width="157">${user.loginName }</td>
    </tr>
  <tr>
    <td><div align="right">密码</div></td>
    <td><input style="border:0" readonly type="password" name="pwd" value=${user.password }></td>
    </tr>
  <tr>
    <td><div align="right">姓名</div></td>
    <td>${user.userName }</td>
    </tr>
  <tr>
    <td><div align="right">性别</div></td>
    <td>${user.sex eq '1'?"男":"女"}</td>
    </tr>
  <tr>
    <td><div align="right">出生日期</div></td>
    <td><fmt:formatDate  pattern="yyyy-MM-dd"  value='${user.birthday }'/></td>
    </tr>
  <tr>
    <td><div align="right">年龄</div></td>
    <td>${user.age }</td>
    </tr>
  <tr>
    <td><div align="right">身份证号码</div></td>
    <td>${user.idCard }</td>
    </tr>
  <tr>
    <td><div align="right">地址</div></td>
    <td>${user.address }</td>
    </tr>
  <tr>
    <td><div align="right">手机号码</div></td>
    <td>${user.mobilePhone }</td>
    </tr>
  <tr>
    <td><div align="right">所属部门</div></td>
    <td>${user.deptPosition.dept.deptName }</td>
    </tr>
  <tr>
    <td><div align="right">部门职位</div></td>
    <td>${user.deptPosition.position.positionName }</td>
    </tr>
  <tr>
    <td><div align="right">部门电话</div></td>
    <td>${user.comPhone }</td>
    </tr>
  <tr>
    <td><div align="right">传真</div></td>
    <td>${user.fax }</td>
    </tr>
  <tr>
    <td><div align="right">QQ号码</div></td>
    <td>${user.qq }</td>
    </tr>
  <tr>
    <td><div align="right">邮箱</div></td>
    <td>${user.email }</td>
    </tr>
  <tr>
    <td><div align="right">备注</div></td>
    <td>${user.userRemark }</td>
    </tr>
  <tr>
    <td><div align="right"></div></td>
    <td><input type="image" value="修改密码" onClick="modifyPwd()" src="image/modifyPwd.jpg"></td>
    </tr>
</table>

</body>
</html>
