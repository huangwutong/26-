<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My JSP 'menu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body { 
	font-size: 12pt; 
	scrollbar-3dlight-color:#170708; 
	scrollbar-arrow-color:#000000; 
	scrollbar-base-color:#170708; 
	scrollbar-darkshadow-color:#ffffff;
	 scrollbar-face-color:#EEEAEB;
	  scrollbar-highlight-color:#FBFDFC;
	   scrollbar-shadow-color:#170708;
	   
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	 }
	 
	 a{
	 font:"宋体";
	 font-size:12px;
	 color:#000000;
	 text-decoration:none;
	}
	a:hover{
	 font:"宋体";
	 font-size:12px;
	 color:#FF0000;
	 text-decoration:none;
	 }
	
	 a.de{
	 font:"宋体";
	 font-size:12px;
	 color:#000000;
	text-decoration:underline
	}
	a.de:hover{
	 font:"宋体";
	 font-size:12px;
	 color:#FF0000;
	 text-decoration:underline
	 }
	</style>
	<script lanuage="javascript">
	//第二层
		function myclick(menu){
			var mytables=document.getElementsByTagName("table");
			//alert(mytables.length);
			for(var i=0;i<mytables.length;i++){
				if(mytables[i].name==menu){
					
				
					//显示和隐藏table
					if(mytables[i].style.display=="block"){
						mytables[i].style.display="none";
						
						//下面为改变第二层的图片
						var secondtable=document.getElementsByTagName("table");
			                for(var z=0;z<secondtable.length;z++){
			                	if(secondtable[z].name=="menu"+menu){
			                		secondtable[z].childNodes[0].childNodes[0].childNodes[1].childNodes[0].src="image/menu/tree_plus.gif";
			                	}
			                }
					}else{
						var secondtable=document.getElementsByTagName("table");
			                for(var z=0;z<secondtable.length;z++){
			                	if(secondtable[z].name=="menu"+menu){
			                		secondtable[z].childNodes[0].childNodes[0].childNodes[1].childNodes[0].src="image/menu/tree_minus.gif";
			                	}
			                }
						mytables[i].style.display="block";
					}
				}
			}
		}
		
		//点第一层显示或隐藏
		function firstclick(){
			var mytables=document.getElementsByTagName("table");
			//alert(mytables.length);
			for(var i=0;i<mytables.length;i++){
				if(mytables[i].name=="first"){
					var topimg=document.getElementById("topimg");
				
					//显示和隐藏table
					if(mytables[i].style.display=="block"){
						mytables[i].style.display="none";
						topimg.src="image/menu/tree_plusl.gif";
					}else{
						topimg.src="image/menu/tree_minusl.gif";
						mytables[i].style.display="block";
					}
				}
			}
		}
	</script>
  </head>
  
  <body bgcolor="#D3DBEE">
  <!-- 求第二层的个数 -->
  <c:set var="thirdcount" value="0"></c:set><!-- 第三层的个数 -->
  <c:set var="twocount" value="0"/>
  <c:forEach var="menu" items="${list}">
  	<c:if test="${menu.menuLevel eq '2'}">
  		<c:set var="twocount" value="${twocount+1}"></c:set>
    </c:if>
  </c:forEach>
  <!-- 求第二层最后一个的id -->
   <c:set var="id" value="0"/> <!-- 保存第二层最后一个的id -->
   <c:set var="count" value="0"/>
   <c:forEach var="menu" items="${list}">
  	  <c:if test="${menu.menuLevel eq '2'}">
  		<c:set var="count" value="${count+1}"></c:set>
  		<c:if test="${count eq twocount }">
  			<c:set var="id" value="${menu.menuId}"/>
  		</c:if>
  	  </c:if>
   </c:forEach>
  
  <table border="0" cellspacing="0" cellpadding="0">
  <tr><td  heigth="20">
  
  <c:forEach var="menu" items="${list}">
  		<!-- 第一层 -->
  		<c:if test="${menu.menuLevel eq '1'}">
  			 <c:set var="parentId" value="${menu.menuId}"/>
  			 <table border="0"  cellspacing="0" cellpadding="0" >
  			 	<tr>
           		<td><img name="topimg" src="image/menu/tree_minusl.gif" name="firstimg" onclick="firstclick()" border="0" style="cursor:hand"></td>
          		<td><img src="image/img/${menu.menuPic}" WIDTH="16" HEIGHT="16" >
          		</td>
           		<td ><a href="javascript:firstclick()">&nbsp;${menu.menuName }</a>
           		</td>
         	 	</tr>
  			</table>
  		</c:if>
  
  		
  	
  		
  		<!-- 第二层 -->
  		<table border="0" name="first" cellspacing="0" cellpadding="0"><tr><td>
  			
  		<c:if test="${menu.menuLevel eq '2'}">
  			  <!-- 第二层下面没有第三层时 -->
  			  <c:if test="${menu.menuUrl ne 'to'}">
  			  	  
  			  	  
	  			  <table border="0" cellspacing="0" cellpadding="0">
	  			 	<tr>
	           		<td width="19" heigth="20"></td>
	           		
	           		<td>
	           		<c:if test="${menu.menuId ne id}">
	           			<img src="image/menu/tree_blank.gif" border="0" >
	           		</c:if>
	           		<c:if test="${menu.menuId eq id}">
	           			<img src="image/menu/tree_blankl.gif" border="0" >
	           		</c:if>
	           		</td>
	          		<td><img src="image/img/${menu.menuPic}" WIDTH="16" HEIGHT="16" >
	          		</td>
	           		<td ><a href="${menu.menuUrl}" target="main">&nbsp;${menu.menuName }</a></td>
	         	 	</tr>
	  			  </table>
  			  </c:if>
  			  <!-- 第二层下面有第三层时 -->
  			  <c:if test="${menu.menuUrl eq 'to'}">
	  			  <table name="menu${menu.menuId}" style="display:block" border="0" cellspacing="0" cellpadding="0" >
	  			 	<tr>
	           		<td width="19" heigth="20"></td>
	           		<td><img name="secondimg" onclick="myclick('${menu.menuId}')" src="image/menu/tree_plus.gif" border="0" style="cursor:hand"></td>
	          		<td><img src="image/img/${menu.menuPic}" WIDTH="16" HEIGHT="16" >
	          		</td>
	           		<td><a href="javascript:myclick('${menu.menuId}')">&nbsp;${menu.menuName }</a></td>
	         	 	</tr>
	  			  </table>
  			  </c:if>
  		</c:if>	
  		<!-- 第三层 -->
  		
  		<c:if test="${menu.menuLevel eq '3'}">
  		
  	    	<c:if test="${thirdcount eq '0'}">
		  		<c:forEach var="me" items="${list}">
		  			<c:if test="${me.menuParentId eq menu.menuParentId}">
		  				<c:set var="thirdcount" value="${thirdcount+1}"></c:set>
		  			</c:if>
		  		</c:forEach>
	  		</c:if>
  		
  		
  		
  		<table name="${menu.menuParentId}" style="display:none" border="0" cellspacing="0" cellpadding="0"  >
	  			 	<tr>
	           		<td width="19" heigth="20"></td>
	           		<td width="19" heigth="20"><img src="image/menu/tree_line.gif"></td>
	           		<c:if test="${thirdcount eq '1'}">
	           			<td><img src="image/menu/tree_blankl.gif" border="0" ></td>
	           		</c:if>
	           		<c:if test="${thirdcount ne '1'}">
	           			<td><img src="image/menu/tree_blank.gif" border="0" ></td>
	           		</c:if>
	           		
	           		<c:set var="thirdcount" value="${thirdcount-1}"></c:set>
	           		
	          		<td><img src="image/img/${menu.menuPic}" WIDTH="16" HEIGHT="16" >
	          		</td>
	           		<td ><a href="${menu.menuUrl}" target="main">&nbsp;${menu.menuName }</a></td>
	         	 	</tr>
	  	</table>
  		</c:if>
  		
  		</td></tr></table>
</c:forEach>
  </td></tr>
  </table>
  
  
    </body>
</html>
