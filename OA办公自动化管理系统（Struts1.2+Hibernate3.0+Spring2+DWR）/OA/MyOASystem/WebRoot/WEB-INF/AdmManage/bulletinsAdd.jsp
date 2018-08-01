<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addBulletins.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="fckeditor/fckeditor.js"></script>
	<script type="text/javascript">
	window.onload = function()
{
		//加部门信息
	
	//EmailService.getDept(callBack);
	//写邮件内容
	var oFCKeditor = new FCKeditor( 'bulletin.bulletinContent' ) ;
	oFCKeditor.BasePath	= "/MyOASystem/fckeditor/" ;
	oFCKeditor.Height	= 290 ;
	oFCKeditor.Width = '100%';
	oFCKeditor.ToolbarSet="Basic";//简单
	oFCKeditor.ReplaceTextarea() ;

	
	
}
function checkText(){
	if(document.getElementById("bulletinTitle").value==""){
		alert("标题不能为空！");
		return false;
	}
	return true;
}
</script>
  
  <body bgcolor="#D3DBEE">
   	<form action="bulletin.do" method="post">
   		<input type="hidden" name="operate" value="doAdd">
   		<table>
   		<tr >
   		<td>标题：</td><td><input type="text" id="bulletinTitle" name="bulletin.bulletinTitle" maxlength="10"></td>
   		</tr>
   		<tr >
   		<td valign="top">内容：</td><td>
   			<div id="contentDiv" style="background-color:#FFFFFF;width:650;height:290;border:0px #CCCCCC dashed;border-spacing:0;overflow:none" >
			<textarea id="bulletinContent" name="bulletin.bulletinContent"></textarea>
		</div>
   		</td>
   		</tr>
   		<tr >
   		<td colspan="2" align="center"><input type="submit" value="添加" onclick="return checkText()"></td>
   		</tr>
   		<tr >
   		<td colspan="2" align="center">
   		<input type="hidden" name="bulletin.examineState.examineStateId" value="1">
   		<input type="hidden" name="bulletin.user.userId" value="${user.userId }">
   		<input type="hidden" name="bulletin.available" value="0">
   		<span>${msg }</span></td>
   		</tr>
   		</table>
   	</form>
  </body>
</html>
