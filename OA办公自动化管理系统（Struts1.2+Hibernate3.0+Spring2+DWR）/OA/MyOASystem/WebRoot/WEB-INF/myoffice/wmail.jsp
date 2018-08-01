<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'showemail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="fckeditor/fckeditor.js"></script>
	<script type="text/javascript" src="dwr/engine.js"></script>
	<script type="text/javascript" src="dwr/util.js"></script>
	<script type="text/javascript" src="dwr/interface/EmailService.js"></script>
	<script type="text/javascript">
		
window.onload = function()
{
		//加部门信息
	
	EmailService.getDept(callBack);
	//写邮件内容
	var oFCKeditor = new FCKeditor( 'email.emailContent' ) ;
	oFCKeditor.BasePath	= "/MyOASystem/fckeditor/" ;
	oFCKeditor.Height	= 290 ;
	oFCKeditor.Width = '100%';
	oFCKeditor.ToolbarSet="Basic";//简单
	oFCKeditor.ReplaceTextarea() ;

	
	
}

	function callBack(list){
		
		dwr.util.addOptions("mydept",list,"deptId","deptName");
	}
	//部门下拉改变时
	function deptChange(){
		var id=$("mydept").value;
		EmailService.getUserByDeptId(id,callBackDeptChange)
	}
	function callBackDeptChange(list){
		dwr.util.removeAllOptions("canselect");
		
		var canselect=document.getElementById("canselect");
		var haveselect=document.getElementById("haveselect");
		
		for(var i=0;i<list.length;i++){
			list[i].userId
			var flag=true;
			for(var y=0;y<haveselect.childNodes.length ;y++) {
					if(haveselect.childNodes[y].value==list[i].userId){
						flag=false;
					}
      		}
      		if(flag==true){
      			 var newOption = new Option(list[i].userName,list[i].userId);
        	  	canselect.options.add(newOption);
      			
      		}
		}
		//dwr.util.addOptions("canselect",list,"userId","userName");
	}
	//根据部门下拉加可选择人员
	function addSelect(){
		
	}
	</script>
	<style type="text/css">
<!--
.STYLE1 {
	font-family: "宋体";
	font-weight: bold;
	font-size: 15px;
}
.STYLE9 {color: #999999; font-family: "宋体"; font-size: 12px; }
.STYLE10 {
	font-family: "宋体";
	font-size: 12px;
}
.STYLE11 {font-size: 12px}
-->
</style>
<script type="text/javascript">
	function onmouseoverback(){
	//alert('a');
	document.getElementById("back").src='image/showemail_112.jpg';
	}
	function onmouseoutback(){
	document.getElementById("back").src='image/showemail_01.jpg';
	}
	function myback(page,situ){
	//alert(page);
	//alert(situ);
		if(situ=="em"){
			location="/MyOASystem/email.do?operate=toGiveMail&page="+page;
		}else{
			location="/MyOASystem/email.do?operate=toDeleteEmail&page"+page;
		}
	}
	
	//收件人
	function getEmailUser(){
		deptChange();
		 //显示内容层
		   var top=Math.round(document.body.clientHeight/2)-200;
		   var left=Math.round(document.body.clientWidth/2)-250;
			document.getElementById("divuser").style.top=top;
			document.getElementById("divuser").style.left=left;
			document.getElementById("divuser").style.display="block";
			
		  //显示背景层
		  var bodyBack = document.createElement("div");
			bodyBack.setAttribute("id","bodybg");
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
			var parent = document.getElementById("divuser").parentNode;
			parent.appendChild(bodyBack);
	}
	//关闭层
	function closediv(){
		document.getElementById("divuser").style.display="none";
		document.getElementById("divuser").parentNode.removeChild(document.getElementById("bodybg"));
	}
	//添加收件人
	function myselect(){
		var canselect=document.getElementById("canselect");
		var haveselect=document.getElementById("haveselect");
		//alert(canselect.value);
		if(canselect.value!=""){
			//alert("value:"+canselect.value+"innerHTML:"+canselect.options[canselect.selectedIndex].innerHTML);
			//添加
			var myoption=document.createElement("option");
	      	myoption.setAttribute("value",canselect.value);
	     	myoption.innerHTML=canselect.options[canselect.selectedIndex].innerHTML;
	     	haveselect.appendChild(myoption);
			//删除
			canselect.options[canselect.selectedIndex].removeNode(true);
		}
	}
	//删除收件人
	function unselect(){
		var canselect=document.getElementById("canselect");
		var haveselect=document.getElementById("haveselect");
		if(haveselect.value!=""){
			//alert("value:"+haveselect.value+"innerHTML:"+haveselect.options[haveselect.selectedIndex].innerHTML);
			//添加
			var myoption=document.createElement("option");
	      	myoption.setAttribute("value",haveselect.value);
	     	myoption.innerHTML=haveselect.options[haveselect.selectedIndex].innerHTML;
	     	canselect.appendChild(myoption);
			//删除
			haveselect.options[haveselect.selectedIndex].removeNode(true);
		}
	}
	
	//确定
	function addSend(){
		var mystr="";//放值
		var	mycontent="";//放显示的内容
		var haveselect=document.getElementById("haveselect");
		for(var y=0;y<haveselect.childNodes.length ;y++) {
					if(y==haveselect.childNodes.length-1){
						mystr+=haveselect.childNodes[y].value;
						mycontent+=haveselect.childNodes[y].innerHTML;
					}else{
						mystr+=haveselect.childNodes[y].value+";";
						mycontent+=haveselect.childNodes[y].innerHTML+";";
					}
					
      	}
      	$("ids").value=mystr;
      	$("users").value=mycontent;
      	closediv();
      	
	}
	//检查邮件的选择是否为空
 	 function 	wemailcheck(){
 	 	var title=$("email.emailTitle").value;//主题
 		var users=$("users").value;//收件人
 		var content=$("email.emailContent").value;//内容
 		//alert("**"+content+"**");
 		if(title==""){
 			alert("标题不能为空！");
 			return false;
 		}else if(users==""){
 			alert("请选择收件人！");
 			return false;
 		}else{
 			var emailtype = document.getElementsByName("email.emailType.emailTypeId");
 		//	alert(emailtype.length);
 			
 			if(!emailtype[0].checked &&  !emailtype[1].checked){ 
 				alert("请选择发送方式！");
 				return false;
 			}else{
 				return true;
 			}
 			
 		}
 	 }
</script>
  </head>
  
  <body style="overflow:hidden;">
  
  <!-- 选择收信人 -->
<div id="divuser" style="height:400;position:absolute;z-index:99; display:none; width:500">
<table id="__01" width="500" height="400" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img src="image/sendemail_01.jpg" width="9" height="30" alt=""></td>
		<td background="image/sendemail_02.jpg"  valign="bottom" style="font-family: 宋体;font-weight: bold;font-size: 14px;" width="460" height="30">
		<img src="image/se.gif" align="absmiddle">
		选择收件人
			</td>
		<td colspan="2">
			<img src="image/sendemail_03.jpg" onClick="closediv()" width="31" height="30" alt=""></td>
	</tr>
	<tr>
		<td background="image/sendemail_04.jpg" width="9" height="*">
	  </td>
		<td align="left" bgcolor="#FFFFFF" valign="top">
		<!-- 层里面内容 -->
			<br>部门<select id="mydept" onChange="deptChange()"></select>
			<hr color="#CCCCFF">
			<table align="center">
			<tr><td>可选择</td><td></td><td>已选择</td></tr>
			<tr>
				<td>
				<select id="canselect" multiple="true" style="border:1px #CCCCCC solid; width:100px;height:300px">
       			 </select>
				</td>
				<td align="center">
					<input type="button" onClick="myselect()" value="&gt;&gt;&gt;"/><br>
					<input type="button" onClick="unselect()" value="&lt;&lt;&lt;" /><br>
					<br>
					<br>
					<input type="button" onClick="addSend()" value="确定" />
				</td>
				<td>
					<select id="haveselect" multiple="true" style="border:1px #CCCCCC solid; width:100px;height:300px">
      				  </select>
				</td>
				</tr>
			</table>
			
		</td>
  <td colspan="2" background="image/sendemail_06.jpg" width="31" height="*">
	  </td>
	</tr>
	<tr>
		<td>
			<img src="image/sendemail_07.jpg" width="9" height="7" alt=""></td>
		<td background="image/sendemail_08.jpg" width="*" height="7">
			<img src="image/sendemail_08.jpg" width="175" height="7" alt=""></td>
		<td>
			<img src="image/sendemail_09.jpg" width="16" height="7" alt=""></td>
		<td>
			<img src="image/sendemail_10.jpg" width="15" height="7" alt=""></td>
	</tr>
</table>

</div>
<div ></div>
  <!-- 邮件信息 -->
  <form action="email.do" onsubmit="return wemailcheck()" method="post">
  <input type="hidden" name="ids"> 
  <input type="hidden" name="operate" value="sendEmail">
  <table id="__01" width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="70"  background="image/showemail_03.jpg" height="37" > 
       &nbsp;<span style="font-family: '宋体';
	color: #333333;
	font-size: 18px;
	font-weight: bold;">发件箱</span>
       </td>
		<td rowspan="2" width="650" background="image/showemail_03.jpg"></td>
  		<td rowspan="2" width="*" background="image/showemail_03.jpg"></td>
	</tr>
	<tr>
		<td height="5">
			<img src="image/showemail_04.jpg" width="70" height="5" alt=""></td>
            <td></td>
            <td></td>
	</tr>
	<tr>
		<td background="image/showmail_07.jpg">&nbsp;</td>
		<td align="left" valign="top" background="image/showmail_07.jpg">
        
        <table width="100%" height="98" border="0" cellpadding="0" cellspacing="4">
          <tr>
            <td width="60" nowrap><span class="STYLE9">主&nbsp;题：</span></td>
            <td width="400" nowrap><span class="STYLE1">
            <input type="text"  name="email.emailTitle" size="100" style="font:'宋体'; font-size:9px" ></td>
            <td width="*" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="STYLE9">发件人：</span></td>
            <td><span class="STYLE10">${user.userName }<br>
            <input type="hidden" name="email.user.userId" value="${user.userId }">
            </span></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="STYLE9">收件人：</span></td>
            <td><input type="text" readonly  name="users" size="80" onClick="getEmailUser()"  ></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="STYLE9">发送方式：</span></td>
            
            <td>
           	 <input type="radio"  value="2" name="email.emailType.emailTypeId" >
				<span style="font-family: '宋体';
					font-size: 12px;">抄送</span>
				<input type="radio"  value="1" name="email.emailType.emailTypeId">
				<span style="font-family: '宋体';
					font-size: 12px;" >暗送</span>
            	    
              </td> 
              
            <td>&nbsp;</td>
          </tr>
        </table>		
        
        </td>
  <td background="image/showmail_07.jpg" height="98">  </td>
        	
  </tr>
	
	<tr>
		<td background="image/img2.jpg" height="31">			</td>
		<td background="image/img3.jpg" height="31">			</td>
		<td background="image/img3.jpg" height="31" >			</td>
	</tr>
	<tr>
    	<td background="image/bg1.jpg" ></td>
		<td align="left" valign="top" background="image/bg1.jpg" >
		
		<!-- 邮件内容 -->
		<div style="background-color:#FFFFFF;width:650;height:290;border:0px #CCCCCC dashed;border-spacing:0;overflow:none" >
			<textarea  name="email.emailContent"></textarea>
		</div>
		 	</td>
      <td background="image/bg1.jpg" >&nbsp;</td>
	</tr>
	
		<tr>
    	<td background="image/bg1.jpg" ></td>
		<td align="left" valign="top" background="image/bg1.jpg" >
		
		<input type="submit" value="发&nbsp;送" >
		 	</td>
      <td background="image/bg1.jpg" >&nbsp;</td>
	</tr>
</table>
</form>
  </body>
</html>
