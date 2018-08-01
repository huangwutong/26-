<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>飞哥酒店</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	   
		    *{font-size:14px; line-height:1.5em;}
			#main{width:300px;}
			#title{float:left;padding:10px;width:110px;}
			#content{width:110px; float:left;padding:10px;}
			
			.font{font-size: 3;  }
		</style>
		<script type="text/javascript">
		         function changeImg(){
					var imgObj=document.getElementById("rdImg");
					imgObj.src="";
					imgObj.src="servlet/ImgServlet?num="+Math.random();
					//alert(imgObj.src);
		}
		        function forwards(){
		            window.location.href="regist.jsp"
		        }
	</script>
  </head>
  
  <body>
        <table cellpadding="0" cellspacing="0"  align="center">
               <tr>
                   <td><img src="photos/pos_r1_c1.jpg"></img></td>
                   <td><img src="photos/pos_r1_c2.jpg"></img></td>
               </tr>
               <tr>
                  <td colspan="2"><hr color="blue"></td>
               </tr>
               <tr>
                   <td colspan="2">
                   
                          <table cellpadding="0" cellspacing="0" >      
                                 <tr>
                                      <td>
                                        <c:choose >
                                          <c:when test="${sessionScope.user==null}">
	                                          <form action="servlet/LoginServlet" method="post">
		                                          <table cellpadding="0" cellspacing="0">
		                                                 <tr>
		                                                     <td><font size="2">用户名:</font></td>
		                                                     <td><input type="text" name="userName" maxlength="20"></td>
		                                                     <td></td>
		                                                 </tr>
		                                                 <tr>
		                                                     <td><font size="2">密码:</font></td>
		                                                     <td><input type="password" name="pwd" maxlength="10"></td>
		                                                     <td></td>
		                                                 </tr>
		                                                 <tr>
		                                                     <td ><font size="2">验证码:</font></td>
		                                                     <td><input type="text" name="code"></td>
		                                                     <td><img id="rdImg" src="servlet/ImgServlet"  border=0 onClick="changeImg();"></img></td>
		                                                 </tr>
		                                                 <tr>
		                                                     <td><input type="submit" value="登陆"></td>
		                                                     <td><input type="button" value="注册" onclick="forwards()"></td>
		                                                     <td></td>
		                                                 </tr>
		                                          </table>
	                                          </form>
                                           </c:when>
                                           <c:otherwise>
                                                   <td>
                                                       <table cellpadding="0" cellspacing="0" >
                                                               <tr>
                                                                   <td><font size="2">会员名:</font></td>
                                                                   <td>${sessionScope.user.userName }</td>
                                                               </tr>
                                                               
                                                               <tr>
                                                                   <td><font size="2">积分:</font></td>
                                                                   <td>${sessionScope.user.jifen }</td>
                                                               </tr>
                                                               <tr>
                                                                   <td colspan="2">注销</td>
                                                                   
                                                               </tr>
                                                       </table>
                                                   </td>
                                           </c:otherwise>
                                         </c:choose>
                                          
                                      </td>
                                      <td>&nbsp;</td>
                                      <td valign="top" align="right">
                                          <table cellpadding="0" cellspacing="0" border="1">
                                                 <c:forEach items="${sessionScope.messageList}" var="message">
	                                                  <tr>        
	                                                      <td width="50" align="right">${message.type }</td>
	                                                      <td width="186" align="center"><a href="servlet/MessageServlet?id=${message.id}">${message.topic}</a></td>
	                                                      <td width="100" align="right"><fmt:formatDate value="${message.date }" pattern="yyyy年MM月dd日"></fmt:formatDate></td>
	                                                      
	                                                  </tr>
                                                 </c:forEach>
                                                  
                                          </table>
                                      </td>
                                 </tr>
                          </table>
                   
                   </td>
                   
               </tr>
        </table>
  </body>
</html>
