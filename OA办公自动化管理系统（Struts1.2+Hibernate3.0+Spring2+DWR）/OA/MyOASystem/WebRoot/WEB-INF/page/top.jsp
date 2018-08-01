<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  	<link rel="stylesheet" type="text/css" href="css/css.css">
  	
  	<script language="javascript" src="dwr/engine.js"></script>
	<script language="javascript" src="dwr/util.js"></script>
	<script language="javascript" src="dwr/interface/OnLineService.js"></script>
  	
  	<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
	font-family: "宋体";
}
a.mylink{

font:"宋体";
font-size:14px;
text-decoration:none;
color:#666633;
}
a.mylink:hover{

font:"宋体";
font-size:14px;
color:#660000;
text-decoration:none;
}
-->
</style>
<script language="javascript">
		window.onload=function(){
			getUserCount();
  			show();
  		}
  		
  		 		//日期
  		function show(){
			var year = new Date().getYear();
			var month=new Date().getMonth()+1;
			if(month<10){
				month="0"+month;
			}
			var day = new Date().getDate();
			if(day<10){
				day="0"+day;
			}
			var hour = new Date().getHours();
			if(hour<10){
				hour="0"+hour;
			}
			var minute = new Date().getMinutes();
			if(minute<10){
				minute="0"+minute;
			}
			var second = new Date().getSeconds();
			if(second<10){
				second="0"+second;
			}
			var week=new Date().getDay();
			var strweek="";
			switch(week){
				case 0:
					strweek="日";
				case 1:
				 	strweek="一";
				case 2:
				 	strweek="二";
				case 3:
				 	strweek="三";
				case 4:
				 	strweek="四";
				case 5:
				 	strweek="五";
				case 6:
				 	strweek="六";
			}
				
	
		//2009年05月13日	星期三	12:30
		
		document.getElementById("showtime").innerHTML=year+"年"+month+"月"+day+"日 星期"+strweek+" "+hour+":"+minute+":"+second;
		setTimeout(show,1000);
		} 

  		function getUserCount(){
  			OnLineService.getOnLineUser(callBack);
  			setTimeout(getUserCount,10000);
  		}
  		function callBack(count){
  			document.getElementById("mancount").innerHTML=count;
  		}
	function mouseover(mytd){
		//alert("a");
		mytd.background="image/topbelow.jpg";
	}
	function mouseout(mytd){
		mytd.background="image/sendemail_02.jpg";
	}
</script>
  </head>
  
  <body >
    <!-- 第一层 -->
    <table  width="100%" height="85" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td rowspan="5">
			<img src="image/newtop_01.jpg" width="112" height="85" alt=""></td>
		<td rowspan="5">
			<img src="image/newtop_02.jpg" width="214" height="85" alt=""></td>
		<td rowspan="5" width="100%" background="image/newtop_03.jpg"  height="85">
			</td>
		<td rowspan="5">
			<img src="image/newtop_04.jpg" width="131" height="85" alt=""></td>
		<td rowspan="5">
			<img src="image/newtop_05.jpg" width="40" height="85" alt=""></td>
		<td colspan="3">
			<img src="image/newtop_06.jpg" width="202" height="8" alt=""></td>
		<td rowspan="5">
			<img src="image/newtop_07.jpg" width="12" height="85" alt=""></td>
		<td>
			<img src="image/分隔符.gif" width="1" height="8" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="image/newtop_08.jpg" width="9" height="2" alt=""></td>
		<td rowspan="2" background="image/newtop_09.jpg" width="184" height="22" >
		<!-- 显示时间 -->
		<label class="STYLE1" id="showtime"></label></td>
<td>
			<img src="image/newtop_10.jpg" width="9" height="2" alt=""></td>
		<td>
			<img src="image/分隔符.gif" width="1" height="2" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2">
			<img src="image/newtop_11.jpg" width="9" height="22" alt=""></td>
		<td rowspan="2">
			<img src="image/newtop_12.jpg" width="9" height="22" alt=""></td>
		<td>
			<img src="image/分隔符.gif" width="1" height="20" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="image/newtop_13.jpg" width="184" height="2" alt=""></td>
		<td>
			<img src="image/分隔符.gif" width="1" height="2" alt=""></td>
	</tr>
	<tr>
		<td colspan="3">
			<img src="image/newtop_14.jpg" width="202" height="53" alt=""></td>
		<td>
			<img src="image/分隔符.gif" width="1" height="53" alt=""></td>
	</tr>
</table>
    
    <!-- 第二层 -->
         <table width="100%" border="0" cellspacing="0" height="30px" cellpadding="0"  background="image/sendemail_02.jpg" >
        <tr valign="middle" >
	        <td  width="400px" nowrap="nowrap" height="26px"  >

	       <table border="0" cellpadding="0" cellspacing="0" height="30">
           <tr >
           <td width="50" align="center">  <img src="image/dot3.gif" align=middle/></td>
	        <c:forEach items="${mainMenus}" var="menu">
	        	<td width="120" onMouseOver="mouseover(this)" align="center"  onMouseOut="mouseout(this)" >
               		 <a href="forward.do?operate=toMyOffice&id=${menu.menuId}" class="mylink" target="left">${menu.menuName}</a>					                     &nbsp;&nbsp;
                </td>
                
	        </c:forEach>
	        
            </tr>
            </table>
	      
	        </td>
	        <td width="100%"  nowrap="nowrap" ></td>
	        
	        <td width="200px" align="right" valign="middle" nowrap="nowrap">
	        
	        <img src="image/sms.gif" valign="middle" style="cursor:hand">
	        <img src="image/comm.gif" width="18" height="18">
	        <font style="font-size: 12px;
	font-family: 宋体"><label id="mancount"></label>人在线</font>
	      	 <a href="javascript:if(confirm('确定退出？')){location='login.do?operate=doExit'}" target="_top" class="exit"  >
	      	 <img src="image/exit.gif" border="0"  align=middle>&nbsp;退出</a>	&nbsp;
	       </td>	
        </tr>
    </table>
</body>
</html>
