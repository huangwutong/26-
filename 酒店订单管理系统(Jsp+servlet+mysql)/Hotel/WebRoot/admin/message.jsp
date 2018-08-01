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
    
    <title>My JSP 'message.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
	             function AlertDel() {
	if (confirm("确定要删除记录吗")) return(true);
	else return(false);
	}
	
	function check(){
	  alert("11");
	 var th=document.getElementById("userform"); 
     for(var i=0;i<th.elements.length;i++) 
     { 
        var o=th.elements[i]; 
        if(o.name=="ids") 
         { 
            o.checked=true;  
         } 
     } 
	  
	
	}
	</script>
     <style type="text/css">
       body,table{
    font-size:12px;
}
table{
    table-layout:fixed;
    empty-cells:show; 
    border-collapse: collapse;
    margin:0 auto;
   
}
td{
    height:20px;
}
</style>
<style>
		a:link {text-decoration: none;}
		a:visited {text-decoration: none;}
		a:active {text-decora tion: none;}
		a:hover {text-decoration: none;}
</style>
  </head>
  
  <body>
        <form action="servlet/MessageServlet" onsubmit="return AlertDel()" method="post" id="userform">
               <table border="1" width="100%">
               
                      <tr>
                         <td colspan="5">您当前位置&gt;&gt;信息管理</td>
                      </tr>
                      <tr align="center">
                          <td width="5%"></td>
                          <td width="15%"><strong>类型</strong></td>
		                  <td ><strong>主题</strong></td>
		                  <td width="20%"><strong>发布日期</strong></td>
		                  <td width="10%"><strong>相关操作</strong></td>
                      </tr>
                      <c:forEach items="${requestScope.messages}" var="m">
                            <tr align="center">
                                <td><input type="checkbox" id="ids" value="${m.id}" name="ids" ></td>
                                <td>${m.type }</td>
                                <td>${m.topic }</td>
                                <td>${m.date}</td>
                                <td><a href="servlet/MessageServlet?action=selectById&id=${m.id }">查看</a></td>
                            </tr>
                      </c:forEach>
                      <tr align="center">
                          
                           <td colspan="5"><input type="submit"  value="删除" >
                           
                           <input type="hidden" name="action" value="delete">
                      </tr>
               </table>
               
        </form>
  </body>
</html>
