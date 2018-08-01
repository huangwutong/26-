<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>修改初始密码</title>
		<link href="<%=request.getContextPath()%>/css/pages.css"
			rel="stylesheet" type="text/css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/styles/admin.css"
			type="text/css"></link>
			<s:head/>
	</head>
	
	<script type="text/javascript">
	 function checkpass(){
	   var passw=document.getElementById("passw");
	   var xpassw=document.getElementById("xpassw");
	   var regex = new RegExp("^\\d{1,10}?$");
	   if(!regex.test(passw.value) || !regex.test(xpassw.value)){
		   alert("两次密码必须输入且只能为数字！");
		}else{
	      
		   if(passw.value!="" && xpassw.value!=""){
		       if(passw.value!=xpassw.value){
		          alert("两次密码输入不相同！");
		       }
		    }else{
		      alert("两次密码必须输入！且只能为数字！");
		    }
	    }
	    
	   
	 }
	
	</script>
	
	<body>
		<div class="pageTitle">
			修改初始密码
		</div>
		<s:form  method="post"
			action="uppassword" theme="simple">
			<input type="hidden" name="username" value="<s:property value="username"/>">
			<div align="center">
				<table class="border" width=100% cellSpacing=0 cellPadding=2
					align="center">
					<tr>
						<td class="left" width="20%">
							新密码：
						</td>
						<td class="right">
							<s:password name="password" value="" maxlength="10" id="passw"></s:password>
						</td>
					</tr>
					<tr>
						<td class="left" width="20%">
							确认新密码：
						</td>
						<td class="right">
							<s:password name="xpassword" value="" maxlength="10" onblur="checkpass()" id="xpassw"></s:password>
						</td>
					</tr>
					 
					<tr>
						<td align="right">
							<label>
								<input type="submit" name="Submit" value="保存"  
									class="submitButton" />
							</label>
							<label></label>
						</td>
						<td align="left">
							<input type="button" onclick="history.back();" value="返回"
								class="submitButton" />
						</td>
					</tr>
				</table>
			</div>
		</s:form>
	</body>
</html>
