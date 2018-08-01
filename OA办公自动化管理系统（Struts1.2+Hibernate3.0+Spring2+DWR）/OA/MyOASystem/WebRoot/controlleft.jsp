<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'controlleft.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css.css">
    
	<script type="text/javascript"> 
		var on="true";
		function mycontrol(controlimg){
			
			var pp=parent.document.getElementById("below");
			if(on=="true"){
			pp.setAttribute("cols","0,8,*");
			controlimg.setAttribute("src","image/control_toright.jpg");
			on="false";
			}else{
			pp.setAttribute("cols","150,8,*");
			controlimg.setAttribute("src","image/control_toleft.jpg");
			on="true";
			}
			
		}
		
		function mouseover(controlimg){
			controlimg.style.cursor="hand";
			if(on=="true"){	
				controlimg.setAttribute("src","image/left_toleft_hover.jpg");
			}else{
				controlimg.setAttribute("src","image/control_toright_hover.jpg");
			}
		}
		
		function mouseout(controlimg){
			if(on=="true"){	
				controlimg.setAttribute("src","image/control_toleft.jpg");
			}else{
				controlimg.setAttribute("src","image/control_toright.jpg");
			}
		}
	</script>
  </head>
  
  <body >
  <table width="8px" height="100%" cellpadding="0" cellspacing="0" background="image/newmid.jpg">
  	<tr><td >
  	<img id="controlimg" 
    src="image/control_toleft.jpg" 
    onMouseOut="mouseout(this)"
     onMouseOver="mouseover(this)"
     onClick="mycontrol(this)"/>
  	</td></tr>
  </table>
 
  </body>
</html>
