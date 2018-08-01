<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript">
		function myclick(){
			alert("aa");
			document.getElementById("hid").style.display="none";
		}
		
		window.onload=function(){
			//alert("onload");
			setTimeout(forward,0);
		}
		
		function forward(){
			//alert("forward");
			
			//var address="main.jsp";
			var addr="/MyOASystem/forward.do?operate=toLeft";
			document.location=addr;
		}
	</script>

  </head>
  
  <body>
    
  </body>
</html>
