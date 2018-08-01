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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
</script>
  </head>
  
  <body>
  <table id="__01" width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="70"   height="37" > 
        <img src="image/showemail_01.jpg" onclick="myback(${page },'${situ }')" id="back" onMouseOut="onmouseoutback()" onMouseOver="onmouseoverback()"/></td>
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
            <td width="79"><span class="STYLE9">主&nbsp;题：</span></td>
            <td width="500"><span class="STYLE1">${email.emailTitle}</span></td>
            <td width="89">&nbsp;</td>
          </tr>
          <tr>
            <td><span class="STYLE9">发件人：</span></td>
            <td><span class="STYLE10">${email.user.userName }<br></span></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="STYLE9">收件人：</span></td>
            <td><span class="STYLE11">${user.userName}</span></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="STYLE9">其它收件人：</span></td>
            <c:if test="${!empty userlist}">
           
            <td>
           	 
            	<select id="d">
            		
                	 <c:forEach var="name" items="${userlist}">
                	 <option>${name}</option>
                	 </c:forEach>
                    
                </select>      
              </td> 
              </c:if>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><span class="STYLE9">日期：</span></td>
            <td><span class="STYLE10"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value='${email.emailDate }'/></span></td>
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
		
		<div style="background-color:#FFFFFF;width:650;height:330;border:1px #CCCCCC dashed;border-spacing:4;overflow-y:scroll" >
		${email.emailContent}
		</div>
		 	</td>
      <td background="image/bg1.jpg" >&nbsp;</td>
	</tr>
</table>
  </body>
</html>
